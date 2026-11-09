package com.kauto;

import android.app.Activity;
import android.util.Log;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import org.json.JSONObject;

public class KAutoBridge {
    private static final String TAG = "KAutoBridge";
    private static boolean isNativeLoaded = false;

    private static String playerName = "Đang tải...";
    private static String playerLevel = "Lv. 1";
    private static String playerPower = "0";
    private static String playerServer = "Server Global";

    private final Activity activity;
    private final KAutoMenu menu;

    static {
        try {
            System.loadLibrary("kauto_speed");
            isNativeLoaded = true;
            Log.i(TAG, "libkauto_speed.so loaded successfully!");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to load libkauto_speed.so", t);
        }
    }

    public static native void nativeSetSpeed(float speed);
    public static native boolean nativeIsSpeedReady();

    public KAutoBridge(Activity activity, KAutoMenu menu) {
        this.activity = activity;
        this.menu = menu;
    }

    @JavascriptInterface
    public boolean isSpeedReady() {
        if (!isNativeLoaded) return false;
        try {
            return nativeIsSpeedReady();
        } catch (Throwable t) {
            return false;
        }
    }

    @JavascriptInterface
    public void setSpeed(final float speed) {
        Log.i(TAG, "Speed requested: " + speed);
        try {
            if (isNativeLoaded) {
                nativeSetSpeed(speed);
                Log.i(TAG, "Native speed multiplier applied: " + speed);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error applying native speed", t);
        }

        // Also try UnitySendMessage as fallback
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    Class<?> unityPlayer = Class.forName("com.unity3d.player.UnityPlayer");
                    java.lang.reflect.Method sendMsg = unityPlayer.getMethod("UnitySendMessage", String.class, String.class, String.class);
                    sendMsg.invoke(null, "LTUnitySdk", "SetTimeScale", String.valueOf(speed));
                } catch (Throwable ignored) {
                }
            }
        });
    }

    @JavascriptInterface
    public String getPlayerInfo() {
        try {
            JSONObject obj = new JSONObject();
            obj.put("name", playerName);
            obj.put("level", playerLevel);
            obj.put("power", playerPower);
            obj.put("server", playerServer);
            return obj.toString();
        } catch (Throwable t) {
            return "{}";
        }
    }

    public static void onGameReport(String eventName, String data) {
        Log.i(TAG, "GameReport: " + eventName + " => " + data);
        if (data == null || data.isEmpty()) return;
        try {
            JSONObject json = new JSONObject(data);
            if (json.has("role_name")) playerName = json.getString("role_name");
            else if (json.has("roleName")) playerName = json.getString("roleName");
            else if (json.has("name")) playerName = json.getString("name");

            if (json.has("role_level")) playerLevel = "Lv. " + json.getString("role_level");
            else if (json.has("level")) playerLevel = "Lv. " + json.getString("level");

            if (json.has("power")) playerPower = json.getString("power");
            else if (json.has("fight")) playerPower = json.getString("fight");
            else if (json.has("combat")) playerPower = json.getString("combat");

            if (json.has("server_name")) playerServer = json.getString("server_name");
            else if (json.has("serverName")) playerServer = json.getString("serverName");
            else if (json.has("serverId")) playerServer = "S" + json.getString("serverId");
        } catch (Throwable ignored) {
        }
    }

    @JavascriptInterface
    public void minimize() {
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (menu != null) {
                    menu.setPanelVisible(false);
                }
            }
        });
    }

    @JavascriptInterface
    public void close() {
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (menu != null) {
                    menu.setPanelVisible(false);
                }
            }
        });
    }
}
