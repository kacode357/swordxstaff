package com.kauto;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.TextView;

public class KAutoMenu {
    private static final String TAG = "KAutoMenu";
    private static boolean isInitialized = false;

    private final Activity activity;
    private FrameLayout rootOverlay;
    private FrameLayout floatingBtn;
    private FrameLayout panelContainer;
    private WebView webView;

    private float dX, dY;
    private float startX, startY;
    private static final int CLICK_THRESHOLD = 15;

    public KAutoMenu(Activity activity) {
        this.activity = activity;
    }

    public static void init(final Activity activity) {
        if (isInitialized || activity == null) {
            return;
        }
        isInitialized = true;
        Log.i(TAG, "Initializing KAutoMenu for: " + activity.getClass().getName());

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    KAutoMenu menu = new KAutoMenu(activity);
                    menu.setupViews();
                } catch (Throwable t) {
                    Log.e(TAG, "Error setting up KAutoMenu", t);
                }
            }
        });
    }

    private void setupViews() {
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        DisplayMetrics dm = activity.getResources().getDisplayMetrics();
        float density = dm.density;

        // 1. Root overlay
        rootOverlay = new FrameLayout(activity);
        FrameLayout.LayoutParams rootParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        );
        rootOverlay.setLayoutParams(rootParams);

        // 2. Floating Button (54dp x 54dp)
        int btnSize = (int) (54 * density);
        floatingBtn = new FrameLayout(activity);
        FrameLayout.LayoutParams btnParams = new FrameLayout.LayoutParams(btnSize, btnSize);
        btnParams.gravity = Gravity.TOP | Gravity.START;
        btnParams.leftMargin = (int) (16 * density);
        btnParams.topMargin = (int) (120 * density);
        floatingBtn.setLayoutParams(btnParams);

        // Circle shape with glowing gradient
        GradientDrawable btnBg = new GradientDrawable();
        btnBg.setShape(GradientDrawable.OVAL);
        btnBg.setColors(new int[]{Color.parseColor("#00f0ff"), Color.parseColor("#7928ca")});
        btnBg.setGradientType(GradientDrawable.LINEAR_GRADIENT);
        btnBg.setOrientation(GradientDrawable.Orientation.TL_BR);
        btnBg.setStroke((int) (2 * density), Color.parseColor("#ffffff"));
        floatingBtn.setBackground(btnBg);
        floatingBtn.setElevation(16 * density);

        // Label inside button
        TextView label = new TextView(activity);
        label.setText("K");
        label.setTextSize(22);
        label.setTextColor(Color.WHITE);
        label.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        label.setGravity(Gravity.CENTER);
        FrameLayout.LayoutParams labelParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        );
        floatingBtn.addView(label, labelParams);

        // Drag & click listener for floating button
        floatingBtn.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View view, MotionEvent event) {
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        dX = view.getX() - event.getRawX();
                        dY = view.getY() - event.getRawY();
                        startX = event.getRawX();
                        startY = event.getRawY();
                        view.animate().scaleX(0.9f).scaleY(0.9f).setDuration(100).start();
                        return true;

                    case MotionEvent.ACTION_MOVE:
                        float newX = event.getRawX() + dX;
                        float newY = event.getRawY() + dY;
                        // Keep within screen bounds
                        newX = Math.max(0, Math.min(newX, rootOverlay.getWidth() - view.getWidth()));
                        newY = Math.max(0, Math.min(newY, rootOverlay.getHeight() - view.getHeight()));
                        view.setX(newX);
                        view.setY(newY);
                        return true;

                    case MotionEvent.ACTION_UP:
                        view.animate().scaleX(1.0f).scaleY(1.0f).setDuration(100).start();
                        float diffX = Math.abs(event.getRawX() - startX);
                        float diffY = Math.abs(event.getRawY() - startY);
                        if (diffX < CLICK_THRESHOLD && diffY < CLICK_THRESHOLD) {
                            // Click detected -> Open panel
                            setPanelVisible(true);
                        }
                        return true;
                }
                return false;
            }
        });

        // 3. Panel Container & WebView
        panelContainer = new FrameLayout(activity);
        FrameLayout.LayoutParams panelParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        );
        panelContainer.setLayoutParams(panelParams);
        panelContainer.setVisibility(View.GONE);

        webView = new WebView(activity);
        FrameLayout.LayoutParams webParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        );
        webView.setLayoutParams(webParams);
        webView.setBackgroundColor(Color.TRANSPARENT);
        webView.setLayerType(View.LAYER_TYPE_HARDWARE, null);

        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(true);

        webView.addJavascriptInterface(new KAutoBridge(activity, this), "KAutoNative");
        webView.loadDataWithBaseURL("file:///android_asset/", KAutoHtml.HTML_CONTENT, "text/html", "UTF-8", null);

        panelContainer.addView(webView);

        // Add views to overlay
        rootOverlay.addView(panelContainer);
        rootOverlay.addView(floatingBtn);

        // Attach root overlay to decorView
        decor.addView(rootOverlay);
        Log.i(TAG, "KAuto overlay attached to window decor successfully!");
    }

    public void setPanelVisible(boolean visible) {
        if (panelContainer != null) {
            panelContainer.setVisibility(visible ? View.VISIBLE : View.GONE);
        }
        if (floatingBtn != null) {
            floatingBtn.setVisibility(visible ? View.GONE : View.VISIBLE);
        }
    }
}
