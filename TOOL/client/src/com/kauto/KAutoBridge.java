package com.kauto;

import android.app.Activity;
import android.util.Log;
import android.webkit.JavascriptInterface;
import android.widget.Toast;

public class KAutoBridge {
    private static final String TAG = "KAutoBridge";
    private final Activity activity;
    private final KAutoMenu menu;

    public KAutoBridge(Activity activity, KAutoMenu menu) {
        this.activity = activity;
        this.menu = menu;
    }

    @JavascriptInterface
    public void setSpeed(final float speed) {
        Log.i(TAG, "Speed requested: " + speed);
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    // 1. Try UnitySendMessage to change TimeScale
                    Class<?> unityPlayer = Class.forName("com.unity3d.player.UnityPlayer");
                    java.lang.reflect.Method sendMsg = unityPlayer.getMethod("UnitySendMessage", String.class, String.class, String.class);
                    sendMsg.invoke(null, "GameFramework", "SetTimeScale", String.valueOf(speed));
                } catch (Throwable ignored) {
                }
                Log.d(TAG, "Applied speed multiplier: " + speed);
            }
        });
    }

    @JavascriptInterface
    public void toggleFeature(final String featureId, final boolean enabled) {
        Log.i(TAG, "Toggle feature: " + featureId + " = " + enabled);
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    Class<?> unityPlayer = Class.forName("com.unity3d.player.UnityPlayer");
                    java.lang.reflect.Method sendMsg = unityPlayer.getMethod("UnitySendMessage", String.class, String.class, String.class);
                    sendMsg.invoke(null, "GameFramework", "OnKAutoFeatureToggle", featureId + ":" + (enabled ? "1" : "0"));
                } catch (Throwable ignored) {
                }
            }
        });
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
