#include "jni_std.h"
#include <dlfcn.h>
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

#define ANDROID_LOG_INFO 4
#define ANDROID_LOG_WARN 5
#define ANDROID_LOG_ERROR 6

typedef int (*android_log_fn)(int prio, const char *tag, const char *fmt, ...);
static android_log_fn g_log_fn = NULL;

static void log_msg(int prio, const char *fmt, ...) {
    if (!g_log_fn) {
        void *h = dlopen("liblog.so", RTLD_NOW);
        if (h) {
            g_log_fn = (android_log_fn)dlsym(h, "__android_log_print");
        }
    }
    if (g_log_fn) {
        char buf[512];
        va_list args;
        va_start(args, fmt);
        vsnprintf(buf, sizeof(buf), fmt, args);
        va_end(args);
        g_log_fn(prio, "KAutoSpeedNative", "%s", buf);
    }
}

#define LOGI(...) log_msg(ANDROID_LOG_INFO, __VA_ARGS__)
#define LOGW(...) log_msg(ANDROID_LOG_WARN, __VA_ARGS__)
#define LOGE(...) log_msg(ANDROID_LOG_ERROR, __VA_ARGS__)

// IL2CPP Unity timeScale
typedef void (*set_timeScale_fn)(float);
typedef float (*get_timeScale_fn)(void);
typedef void (*il2cpp_add_internal_call_fn)(const char*, const void*);
typedef void* (*il2cpp_resolve_icall_fn)(const char*);

static set_timeScale_fn g_orig_set_timeScale = NULL;
static get_timeScale_fn g_orig_get_timeScale = NULL;

static float g_target_speed = 1.0f;
static int g_is_ready = 0;
static pthread_t g_watchdog_thread;
static pthread_t g_logcat_thread;

// Global Java objects
static JavaVM *g_jvm = NULL;
static jclass g_bridge_class = NULL;
static jfieldID g_fid_power = NULL;
static jfieldID g_fid_level = NULL;

// Hooked set_timeScale
static void hooked_set_timeScale(float val) {
    if (g_target_speed > 1.001f) {
        if (g_orig_set_timeScale) {
            g_orig_set_timeScale(g_target_speed);
        }
    } else {
        if (g_orig_set_timeScale) {
            g_orig_set_timeScale(val);
        }
    }
}

static int try_init_il2cpp(void) {
    if (g_is_ready) return 1;

    void *h_unity = dlopen("libunity.so", RTLD_NOLOAD);
    if (!h_unity) {
        h_unity = dlopen("libunity.so", RTLD_NOW);
    }
    void *h_il2cpp = dlopen("libil2cpp.so", RTLD_NOLOAD);
    if (!h_il2cpp) {
        h_il2cpp = dlopen("libil2cpp.so", RTLD_NOW);
    }

    if (!h_unity && !h_il2cpp) {
        return 0;
    }

    il2cpp_resolve_icall_fn fn_resolve = NULL;
    il2cpp_add_internal_call_fn fn_add_internal = NULL;

    if (h_il2cpp) {
        fn_resolve = (il2cpp_resolve_icall_fn)dlsym(h_il2cpp, "il2cpp_resolve_icall");
        fn_add_internal = (il2cpp_add_internal_call_fn)dlsym(h_il2cpp, "il2cpp_add_internal_call");
    }
    if (!fn_resolve && h_unity) {
        fn_resolve = (il2cpp_resolve_icall_fn)dlsym(h_unity, "il2cpp_resolve_icall");
        fn_add_internal = (il2cpp_add_internal_call_fn)dlsym(h_unity, "il2cpp_add_internal_call");
    }

    if (!fn_resolve) {
        return 0;
    }

    LOGI("Found il2cpp_resolve_icall: %p", fn_resolve);

    g_orig_set_timeScale = (set_timeScale_fn)fn_resolve("UnityEngine.Time::set_timeScale(System.Single)");
    g_orig_get_timeScale = (get_timeScale_fn)fn_resolve("UnityEngine.Time::get_timeScale()");

    if (!g_orig_set_timeScale) {
        g_orig_set_timeScale = (set_timeScale_fn)fn_resolve("UnityEngine.Time::set_timeScale");
    }
    if (!g_orig_get_timeScale) {
        g_orig_get_timeScale = (get_timeScale_fn)fn_resolve("UnityEngine.Time::get_timeScale");
    }

    if (g_orig_set_timeScale) {
        LOGI("Resolved UnityEngine.Time::set_timeScale: %p", g_orig_set_timeScale);
        if (fn_add_internal) {
            fn_add_internal("UnityEngine.Time::set_timeScale(System.Single)", (const void*)hooked_set_timeScale);
            fn_add_internal("UnityEngine.Time::set_timeScale", (const void*)hooked_set_timeScale);
            LOGI("Hooked UnityEngine.Time::set_timeScale via il2cpp_add_internal_call");
        }
        g_is_ready = 1;
        return 1;
    }
    return 0;
}

// Watchdog thread ensuring timeScale stays locked at user speed
static void* speed_watchdog_func(void* arg) {
    LOGI("KAuto speed watchdog thread started");
    while (1) {
        if (!g_is_ready) {
            try_init_il2cpp();
        }
        if (g_is_ready && g_target_speed > 1.001f && g_orig_set_timeScale) {
            float cur = g_orig_get_timeScale ? g_orig_get_timeScale() : 0.0f;
            if (cur != g_target_speed) {
                g_orig_set_timeScale(g_target_speed);
            }
        }
        sleep(1);
    }
    return NULL;
}

// Update Java KAutoBridge.playerPower & playerLevel
static void update_java_player_data(long power, int level_increment) {
    if (!g_jvm || !g_bridge_class) return;
    JNIEnv *env = NULL;
    jint res = (*g_jvm)->AttachCurrentThread(g_jvm, (void**)&env, NULL);
    if (res != 0 || !env) return;

    if (power > 0 && g_fid_power) {
        char pBuf[64];
        if (power >= 1000000) {
            snprintf(pBuf, sizeof(pBuf), "%.2fM", power / 1000000.0);
        } else if (power >= 1000) {
            snprintf(pBuf, sizeof(pBuf), "%.2fK", power / 1000.0);
        } else {
            snprintf(pBuf, sizeof(pBuf), "%ld", power);
        }
        jstring jPower = (*env)->NewStringUTF(env, pBuf);
        if (jPower) {
            (*env)->SetStaticObjectField(env, g_bridge_class, g_fid_power, jPower);
            (*env)->DeleteLocalRef(env, jPower);
            LOGI("Updated player power in Java: %s", pBuf);
        }
    }

    if (level_increment > 0 && g_fid_level) {
        jstring curLevelStr = (jstring)(*env)->GetStaticObjectField(env, g_bridge_class, g_fid_level);
        int curNum = 1;
        if (curLevelStr) {
            const char* curUtf = (*env)->GetStringUTFChars(env, curLevelStr, NULL);
            if (curUtf && strstr(curUtf, "Lv. ")) {
                curNum = atoi(curUtf + 4);
            }
            if (curUtf) (*env)->ReleaseStringUTFChars(env, curLevelStr, curUtf);
        }

        char lBuf[32];
        snprintf(lBuf, sizeof(lBuf), "Lv. %d", curNum + level_increment);
        jstring newLevel = (*env)->NewStringUTF(env, lBuf);
        if (newLevel) {
            (*env)->SetStaticObjectField(env, g_bridge_class, g_fid_level, newLevel);
            (*env)->DeleteLocalRef(env, newLevel);
            LOGI("Updated player level in Java: %s", lBuf);
        }
    }
    (*g_jvm)->DetachCurrentThread(g_jvm);
}

// Background thread monitoring Unity logs for SetCombatRating and LevelUpdate
static void* logcat_monitor_func(void* arg) {
    LOGI("Logcat player data monitor thread started");
    sleep(2);
    // Use -T 1 to only monitor live incoming logs
    FILE *fp = popen("logcat -T 1 -v tag -s Unity:I", "r");
    if (!fp) {
        LOGE("Could not popen logcat");
        return NULL;
    }
    char line[512];
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, "SetCombatRating")) {
            char *new_ptr = strstr(line, "new:");
            long pVal = 0;
            if (new_ptr) {
                pVal = strtol(new_ptr + 4, NULL, 10);
            }
            int lvlInc = 0;
            if (strstr(line, "changeParam:LevelUpdate")) {
                lvlInc = 1;
            }
            if (pVal > 0 || lvlInc > 0) {
                LOGI("Logcat live detected stats: power=%ld, lvlInc=%d", pVal, lvlInc);
                update_java_player_data(pVal, lvlInc);
            }
        }
    }
    pclose(fp);
    return NULL;
}

JNIEXPORT void JNICALL Java_com_kauto_KAutoBridge_nativeSetSpeed(JNIEnv *env, jclass clazz, jfloat speed) {
    LOGI("nativeSetSpeed called: %f", speed);
    g_target_speed = speed;
    if (!g_is_ready) {
        try_init_il2cpp();
    }
    if (g_orig_set_timeScale) {
        g_orig_set_timeScale(speed);
    }
}

JNIEXPORT jboolean JNICALL Java_com_kauto_KAutoBridge_nativeIsSpeedReady(JNIEnv *env, jclass clazz) {
    return (jboolean)(g_is_ready ? 1 : 0);
}

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
    LOGI("KAutoSpeedNative JNI_OnLoad started");
    g_jvm = vm;

    JNIEnv *env = NULL;
    if ((*vm)->GetEnv(vm, (void**)&env, JNI_VERSION_1_6) == JNI_OK && env) {
        jclass local = (*env)->FindClass(env, "com/kauto/KAutoBridge");
        if (local) {
            g_bridge_class = (jclass)(*env)->NewGlobalRef(env, local);
            g_fid_power = (*env)->GetStaticFieldID(env, g_bridge_class, "playerPower", "Ljava/lang/String;");
            g_fid_level = (*env)->GetStaticFieldID(env, g_bridge_class, "playerLevel", "Ljava/lang/String;");
            LOGI("Cached KAutoBridge successfully: class=%p, fidPower=%p, fidLevel=%p",
                 g_bridge_class, g_fid_power, g_fid_level);
        } else {
            LOGE("Could not find com/kauto/KAutoBridge in JNI_OnLoad");
        }
    }

    pthread_create(&g_watchdog_thread, NULL, speed_watchdog_func, NULL);
    pthread_detach(g_watchdog_thread);

    pthread_create(&g_logcat_thread, NULL, logcat_monitor_func, NULL);
    pthread_detach(g_logcat_thread);

    LOGI("KAutoSpeedNative JNI_OnLoad completed safely");
    return JNI_VERSION_1_6;
}
