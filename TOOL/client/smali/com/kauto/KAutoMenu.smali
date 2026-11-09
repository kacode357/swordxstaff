.class public Lcom/kauto/KAutoMenu;
.super Ljava/lang/Object;
.source "KAutoMenu.java"


# static fields
.field private static final CLICK_THRESHOLD:I = 0xf

.field private static final TAG:Ljava/lang/String; = "KAutoMenu"

.field private static isInitialized:Z


# instance fields
.field private final activity:Landroid/app/Activity;

.field private dX:F

.field private dY:F

.field private floatingBtn:Landroid/widget/FrameLayout;

.field private panelContainer:Landroid/widget/FrameLayout;

.field private rootOverlay:Landroid/widget/FrameLayout;

.field private startX:F

.field private startY:F

.field private webView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 19
    const/4 v0, 0x0

    sput-boolean v0, Lcom/kauto/KAutoMenu;->isInitialized:Z

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    .line 33
    return-void
.end method

.method static synthetic access$000(Lcom/kauto/KAutoMenu;)V
    .registers 1

    .line 17
    invoke-direct {p0}, Lcom/kauto/KAutoMenu;->setupViews()V

    return-void
.end method

.method static synthetic access$100(Lcom/kauto/KAutoMenu;)F
    .registers 1

    .line 17
    iget p0, p0, Lcom/kauto/KAutoMenu;->dX:F

    return p0
.end method

.method static synthetic access$102(Lcom/kauto/KAutoMenu;F)F
    .registers 2

    .line 17
    iput p1, p0, Lcom/kauto/KAutoMenu;->dX:F

    return p1
.end method

.method static synthetic access$200(Lcom/kauto/KAutoMenu;)F
    .registers 1

    .line 17
    iget p0, p0, Lcom/kauto/KAutoMenu;->dY:F

    return p0
.end method

.method static synthetic access$202(Lcom/kauto/KAutoMenu;F)F
    .registers 2

    .line 17
    iput p1, p0, Lcom/kauto/KAutoMenu;->dY:F

    return p1
.end method

.method static synthetic access$300(Lcom/kauto/KAutoMenu;)F
    .registers 1

    .line 17
    iget p0, p0, Lcom/kauto/KAutoMenu;->startX:F

    return p0
.end method

.method static synthetic access$302(Lcom/kauto/KAutoMenu;F)F
    .registers 2

    .line 17
    iput p1, p0, Lcom/kauto/KAutoMenu;->startX:F

    return p1
.end method

.method static synthetic access$400(Lcom/kauto/KAutoMenu;)F
    .registers 1

    .line 17
    iget p0, p0, Lcom/kauto/KAutoMenu;->startY:F

    return p0
.end method

.method static synthetic access$402(Lcom/kauto/KAutoMenu;F)F
    .registers 2

    .line 17
    iput p1, p0, Lcom/kauto/KAutoMenu;->startY:F

    return p1
.end method

.method static synthetic access$500(Lcom/kauto/KAutoMenu;)Landroid/widget/FrameLayout;
    .registers 1

    .line 17
    iget-object p0, p0, Lcom/kauto/KAutoMenu;->rootOverlay:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method public static init(Landroid/app/Activity;)V
    .registers 3

    .line 36
    sget-boolean v0, Lcom/kauto/KAutoMenu;->isInitialized:Z

    if-nez v0, :cond_33

    if-nez p0, :cond_7

    goto :goto_33

    .line 39
    :cond_7
    const/4 v0, 0x1

    sput-boolean v0, Lcom/kauto/KAutoMenu;->isInitialized:Z

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Initializing KAutoMenu for: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "KAutoMenu"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    new-instance v0, Lcom/kauto/KAutoMenu$1;

    invoke-direct {v0, p0}, Lcom/kauto/KAutoMenu$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 53
    return-void

    .line 37
    :cond_33
    :goto_33
    return-void
.end method

.method private setupViews()V
    .registers 11

    .line 56
    iget-object v0, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 57
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 58
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 61
    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/kauto/KAutoMenu;->rootOverlay:Landroid/widget/FrameLayout;

    .line 62
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 66
    iget-object v4, p0, Lcom/kauto/KAutoMenu;->rootOverlay:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    const/high16 v2, 0x42580000    # 54.0f

    mul-float v2, v2, v1

    float-to-int v2, v2

    .line 70
    new-instance v4, Landroid/widget/FrameLayout;

    iget-object v5, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    invoke-direct {v4, v5}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    .line 71
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 72
    const v2, 0x800033

    iput v2, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 73
    const/high16 v2, 0x41800000    # 16.0f

    mul-float v2, v2, v1

    float-to-int v5, v2

    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 74
    const/high16 v5, 0x42f00000    # 120.0f

    mul-float v5, v5, v1

    float-to-int v5, v5

    iput v5, v4, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 75
    iget-object v5, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    invoke-virtual {v5, v4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 79
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 80
    const-string v6, "#00f0ff"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    const-string v7, "#7928ca"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    filled-new-array {v6, v7}, [I

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 81
    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 82
    sget-object v7, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    invoke-virtual {v4, v7}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 83
    const/high16 v7, 0x40000000    # 2.0f

    mul-float v1, v1, v7

    float-to-int v1, v1

    const-string v7, "#ffffff"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v1, v7}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 84
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 85
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 88
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 89
    const-string v2, "K"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    const/high16 v2, 0x41b00000    # 22.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 91
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 92
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 93
    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 94
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 98
    iget-object v4, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    new-instance v2, Lcom/kauto/KAutoMenu$2;

    invoke-direct {v2, p0}, Lcom/kauto/KAutoMenu$2;-><init>(Lcom/kauto/KAutoMenu;)V

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 138
    new-instance v1, Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/kauto/KAutoMenu;->panelContainer:Landroid/widget/FrameLayout;

    .line 139
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 143
    iget-object v2, p0, Lcom/kauto/KAutoMenu;->panelContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->panelContainer:Landroid/widget/FrameLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 146
    new-instance v1, Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/kauto/KAutoMenu;->webView:Landroid/webkit/WebView;

    .line 147
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 151
    iget-object v2, p0, Lcom/kauto/KAutoMenu;->webView:Landroid/webkit/WebView;

    invoke-virtual {v2, v1}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v6}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 153
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->webView:Landroid/webkit/WebView;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 155
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 156
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 157
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 158
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 160
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->webView:Landroid/webkit/WebView;

    new-instance v2, Lcom/kauto/KAutoBridge;

    iget-object v3, p0, Lcom/kauto/KAutoMenu;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3, p0}, Lcom/kauto/KAutoBridge;-><init>(Landroid/app/Activity;Lcom/kauto/KAutoMenu;)V

    const-string v3, "KAutoNative"

    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 161
    iget-object v4, p0, Lcom/kauto/KAutoMenu;->webView:Landroid/webkit/WebView;

    const-string v8, "UTF-8"

    const/4 v9, 0x0

    const-string v5, "file:///android_asset/"

    const-string v6, "<!DOCTYPE html><html lang=\'vi\'><head><meta charset=\'UTF-8\'><meta name=\'viewport\' content=\'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\'><title>KAuto Mod Menu</title><style>* { box-sizing: border-box; margin: 0; padding: 0; user-select: none; -webkit-user-select: none; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Helvetica, Arial, sans-serif; }body {  background: rgba(0, 0, 0, 0.55);  width: 100vw; height: 100vh;  display: flex; align-items: center; justify-content: center;  overflow: hidden;}.kauto-card {  width: 90%; max-width: 440px; max-height: 88vh;  background: rgba(13, 17, 23, 0.92);  backdrop-filter: blur(24px); -webkit-backdrop-filter: blur(24px);  border: 1px solid rgba(0, 240, 255, 0.35);  border-radius: 18px;  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.8), 0 0 30px rgba(0, 240, 255, 0.2);  color: #f0f6fc; display: flex; flex-direction: column;  animation: popIn 0.25s cubic-bezier(0.16, 1, 0.3, 1);}@keyframes popIn { 0% { transform: scale(0.92); opacity: 0; } 100% { transform: scale(1); opacity: 1; } }.kauto-header {  display: flex; align-items: center; justify-content: space-between;  padding: 14px 18px; border-bottom: 1px solid rgba(255, 255, 255, 0.08);  background: linear-gradient(90deg, rgba(0, 240, 255, 0.12), rgba(168, 85, 247, 0.12));  border-radius: 18px 18px 0 0;}.kauto-title {  display: flex; align-items: center; gap: 10px;}.kauto-badge {  width: 32px; height: 32px; border-radius: 9px;  background: linear-gradient(135deg, #00f0ff, #7928ca);  display: flex; align-items: center; justify-content: center;  font-weight: 900; font-size: 17px; color: #fff;  box-shadow: 0 0 12px rgba(0, 240, 255, 0.6);}.kauto-name { font-size: 15px; font-weight: 700; color: #fff; letter-spacing: 0.5px; }.kauto-sub { font-size: 11px; color: #00f0ff; opacity: 0.85; font-weight: 600; }.kauto-vip {  background: rgba(16, 185, 129, 0.15); border: 1px solid rgba(16, 185, 129, 0.5);  color: #10b981; font-size: 10px; font-weight: 700; padding: 2px 7px; border-radius: 12px;  margin-left: 6px; letter-spacing: 0.5px;}.kauto-actions { display: flex; gap: 8px; }.btn-action {  background: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.12);  color: #c9d1d9; width: 30px; height: 30px; border-radius: 8px;  display: flex; align-items: center; justify-content: center;  font-size: 15px; cursor: pointer; transition: all 0.2s;}.btn-action:active { background: rgba(255, 255, 255, 0.2); transform: scale(0.95); }.kauto-tabs {  display: flex; gap: 4px; padding: 10px 14px; background: rgba(0, 0, 0, 0.25);  border-bottom: 1px solid rgba(255, 255, 255, 0.06);}.tab-btn {  flex: 1; padding: 8px 4px; font-size: 12px; font-weight: 600;  background: transparent; border: none; color: #8b949e;  border-radius: 8px; cursor: pointer; text-align: center; transition: all 0.2s;}.tab-btn.active {  background: rgba(0, 240, 255, 0.15); color: #00f0ff;  box-shadow: inset 0 0 10px rgba(0, 240, 255, 0.15); border: 1px solid rgba(0, 240, 255, 0.3);}.kauto-body {  padding: 16px; overflow-y: auto; flex: 1;}.tab-content { display: none; }.tab-content.active { display: block; animation: fadeIn 0.2s; }@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }.section-title { font-size: 11px; text-transform: uppercase; color: #8b949e; margin-bottom: 10px; font-weight: 700; letter-spacing: 0.8px; }.speed-box {  background: rgba(22, 27, 34, 0.8); border: 1px solid rgba(255, 255, 255, 0.08);  border-radius: 12px; padding: 14px; margin-bottom: 14px;}.speed-val-row { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 10px; }.speed-label { font-size: 13px; color: #c9d1d9; font-weight: 600; }.speed-val { font-size: 20px; color: #00f0ff; font-weight: 800; text-shadow: 0 0 10px rgba(0, 240, 255, 0.5); }.speed-btn-row { display: grid; grid-template-columns: repeat(5, 1fr); gap: 6px; margin-top: 12px; }.btn-speed {  padding: 8px 0; font-size: 12px; font-weight: 700; border-radius: 8px;  border: 1px solid rgba(255, 255, 255, 0.1); background: rgba(33, 38, 45, 0.8);  color: #c9d1d9; cursor: pointer; transition: all 0.15s;}.btn-speed.active {  background: linear-gradient(135deg, #00f0ff, #0284c7); color: #000;  border-color: #00f0ff; box-shadow: 0 0 12px rgba(0, 240, 255, 0.4);}.slider-container { margin: 8px 0; }.kauto-slider {  width: 100%; height: 6px; border-radius: 4px;  background: rgba(255, 255, 255, 0.12); outline: none; -webkit-appearance: none;}.kauto-slider::-webkit-slider-thumb {  -webkit-appearance: none; width: 20px; height: 20px; border-radius: 50%;  background: #00f0ff; box-shadow: 0 0 12px #00f0ff; cursor: pointer;}.toggle-card {  display: flex; align-items: center; justify-content: space-between;  background: rgba(22, 27, 34, 0.8); border: 1px solid rgba(255, 255, 255, 0.08);  border-radius: 12px; padding: 12px 14px; margin-bottom: 8px;}.toggle-info { display: flex; flex-direction: column; gap: 2px; }.toggle-name { font-size: 13px; font-weight: 600; color: #f0f6fc; }.toggle-desc { font-size: 11px; color: #8b949e; }.switch {  position: relative; display: inline-block; width: 44px; height: 24px;}.switch input { opacity: 0; width: 0; height: 0; }.switch-slider {  position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0;  background-color: rgba(255, 255, 255, 0.15); transition: 0.3s; border-radius: 24px;}.switch-slider:before {  position: absolute; content: \'\'; height: 18px; width: 18px; left: 3px; bottom: 3px;  background-color: white; transition: 0.3s; border-radius: 50%;}input:checked + .switch-slider { background-color: #00f0ff; box-shadow: 0 0 10px rgba(0, 240, 255, 0.5); }input:checked + .switch-slider:before { transform: translateX(20px); background-color: #0d1117; }.info-table { width: 100%; border-collapse: collapse; font-size: 12px; }.info-table td { padding: 8px 6px; border-bottom: 1px solid rgba(255, 255, 255, 0.05); }.info-table td:first-child { color: #8b949e; font-weight: 500; width: 40%; }.info-table td:last-child { color: #f0f6fc; font-weight: 600; text-align: right; }.kauto-footer {  padding: 10px 16px; border-top: 1px solid rgba(255, 255, 255, 0.06);  display: flex; justify-content: space-between; align-items: center;  font-size: 11px; color: #8b949e; background: rgba(0, 0, 0, 0.2);  border-radius: 0 0 18px 18px;}.kauto-footer a { color: #00f0ff; text-decoration: none; font-weight: 600; }.toast-msg {  position: fixed; bottom: 20px; left: 50%; transform: translateX(-50%);  background: rgba(0, 240, 255, 0.95); color: #000; padding: 8px 16px; border-radius: 20px;  font-size: 12px; font-weight: 700; box-shadow: 0 4px 15px rgba(0,0,0,0.5);  opacity: 0; pointer-events: none; transition: opacity 0.3s;}.toast-msg.show { opacity: 1; }</style></head><body><div class=\'kauto-card\' id=\'kautoCard\'>  <div class=\'kauto-header\'>    <div class=\'kauto-title\'>      <div class=\'kauto-badge\'>K</div>      <div>        <div style=\'display:flex;align-items:center;\'>          <span class=\'kauto-name\'>KAuto PRO</span>          <span class=\'kauto-vip\'>VIP</span>        </div>        <div class=\'kauto-sub\'>SWORD X STAFF v1.0.0</div>      </div>    </div>    <div class=\'kauto-actions\'>      <button class=\'btn-action\' onclick=\'minimizeMenu()\'>\u2212</button>      <button class=\'btn-action\' onclick=\'closeMenu()\'>\u2715</button>    </div>  </div>  <div class=\'kauto-tabs\'>    <button class=\'tab-btn active\' onclick=\"switchTab(\'speed\')\">\u26a1 T\u1ed1c \u0110\u1ed9</button>    <button class=\'tab-btn\' onclick=\"switchTab(\'auto\')\">\ud83e\udd16 T\u1ef1 \u0110\u1ed9ng</button>    <button class=\'tab-btn\' onclick=\"switchTab(\'info\')\">\ud83d\udcca Ch\u1ec9 S\u1ed1</button>    <button class=\'tab-btn\' onclick=\"switchTab(\'settings\')\">\u2699\ufe0f C\u00e0i \u0110\u1eb7t</button>  </div>  <div class=\'kauto-body\'>    <!-- SPEED TAB -->    <div class=\'tab-content active\' id=\'tab-speed\'>      <div class=\'section-title\'>\u0110i\u1ec1u Khi\u1ec3n T\u1ed1c \u0110\u1ed9 Game (TimeScale)</div>      <div class=\'speed-box\'>        <div class=\'speed-val-row\'>          <span class=\'speed-label\'>T\u1ed1c \u0111\u1ed9 chi\u1ebfn \u0111\u1ea5u:</span>          <span class=\'speed-val\' id=\'speedDisplay\'>1.0x</span>        </div>        <div class=\'slider-container\'>          <input type=\'range\' class=\'kauto-slider\' id=\'speedSlider\' min=\'1\' max=\'20\' step=\'0.5\' value=\'1\' oninput=\'onSliderChange(this.value)\'>        </div>        <div class=\'speed-btn-row\'>          <button class=\'btn-speed active\' onclick=\'setSpeed(1)\'>1x</button>          <button class=\'btn-speed\' onclick=\'setSpeed(2)\'>2x</button>          <button class=\'btn-speed\' onclick=\'setSpeed(5)\'>5x</button>          <button class=\'btn-speed\' onclick=\'setSpeed(10)\'>10x</button>          <button class=\'btn-speed\' onclick=\'setSpeed(20)\'>20x</button>        </div>      </div>    </div>    <!-- AUTO TAB -->    <div class=\'tab-content\' id=\'tab-auto\'>      <div class=\'section-title\'>T\u00ednh N\u0103ng T\u1ef1 \u0110\u1ed9ng H\u00f3a</div>      <div class=\'toggle-card\'>        <div class=\'toggle-info\'>          <span class=\'toggle-name\'>\u26a1 Auto V\u01b0\u1ee3t \u1ea2i (Stage Push)</span>          <span class=\'toggle-desc\'>T\u1ef1 \u0111\u1ed9ng khi\u00eau chi\u1ebfn m\u00e0n ti\u1ebfp theo</span>        </div>        <label class=\'switch\'>          <input type=\'checkbox\' id=\'chk_stage\' onchange=\"toggleFeature(\'stage\', this.checked)\">          <span class=\'switch-slider\'></span>        </label>      </div>      <div class=\'toggle-card\'>        <div class=\'toggle-info\'>          <span class=\'toggle-name\'>\ud83c\udf81 Auto Ph\u00fac L\u1ee3i & Qu\u00e0 Ng\u00e0y</span>          <span class=\'toggle-desc\'>T\u1ef1 \u0111\u1ed9ng nh\u1eadn th\u01b0\u1edfng \u0111i\u1ec3m danh, r\u01b0\u01a1ng</span>        </div>        <label class=\'switch\'>          <input type=\'checkbox\' id=\'chk_welfare\' onchange=\"toggleFeature(\'welfare\', this.checked)\">          <span class=\'switch-slider\'></span>        </label>      </div>      <div class=\'toggle-card\'>        <div class=\'toggle-info\'>          <span class=\'toggle-name\'>\u2694\ufe0f B\u1ecf Qua Ho\u1ea1t \u1ea2nh Skill</span>          <span class=\'toggle-desc\'>T\u1eaft cutscenes v\u00e0 hi\u1ec7u \u1ee9ng chi\u1ebfn \u0111\u1ea5u</span>        </div>        <label class=\'switch\'>          <input type=\'checkbox\' id=\'chk_skipanim\' onchange=\"toggleFeature(\'skipanim\', this.checked)\">          <span class=\'switch-slider\'></span>        </label>      </div>      <div class=\'toggle-card\'>        <div class=\'toggle-info\'>          <span class=\'toggle-name\'>\ud83d\udc8e Auto R\u00fat Th\u1ebb Nhanh</span>          <span class=\'toggle-desc\'>M\u1edf t\u01b0\u1edbng 10x si\u00eau t\u1ed1c, b\u1ecf qua quay</span>        </div>        <label class=\'switch\'>          <input type=\'checkbox\' id=\'chk_gacha\' onchange=\"toggleFeature(\'gacha\', this.checked)\">          <span class=\'switch-slider\'></span>        </label>      </div>    </div>    <!-- INFO TAB -->    <div class=\'tab-content\' id=\'tab-info\'>      <div class=\'section-title\'>Th\u00f4ng S\u1ed1 H\u1ec7 Th\u1ed1ng & Tr\u00f2 Ch\u01a1i</div>      <table class=\'info-table\'>        <tr><td>\u1ee8ng d\u1ee5ng</td><td>Sword x Staff</td></tr>        <tr><td>Package</td><td>com.zjcs.android.vn</td></tr>        <tr><td>Engine</td><td>Unity + HybridCLR</td></tr>        <tr><td>Ki\u1ebfn tr\u00fac</td><td>ARM64-v8a (IL2CPP)</td></tr>        <tr><td>Build Version</td><td>156677 (v1.0.0)</td></tr>        <tr><td>KAuto Hook</td><td style=\'color:#10b981;\'>\u0110\u00e3 k\u1ebft n\u1ed1i \u2713</td></tr>        <tr><td>Tr\u1ea1ng th\u00e1i Mod</td><td style=\'color:#00f0ff;\'>K\u00edch ho\u1ea1t</td></tr>      </table>    </div>    <!-- SETTINGS TAB -->    <div class=\'tab-content\' id=\'tab-settings\'>      <div class=\'section-title\'>T\u00f9y Ch\u1ec9nh Giao Di\u1ec7n</div>      <div class=\'speed-box\'>        <div class=\'speed-val-row\'>          <span class=\'speed-label\'>\u0110\u1ed9 trong su\u1ed1t HUD:</span>          <span class=\'speed-val\' id=\'opacityVal\'>92%</span>        </div>        <div class=\'slider-container\'>          <input type=\'range\' class=\'kauto-slider\' min=\'50\' max=\'100\' value=\'92\' oninput=\'changeOpacity(this.value)\'>        </div>      </div>      <div style=\'margin-top:10px;\'>        <button class=\'btn-speed\' style=\'width:100%;padding:10px;\' onclick=\'resetDefaults()\'>Kh\u00f4i Ph\u1ee5c M\u1eb7c \u0110\u1ecbnh</button>      </div>    </div>  </div>  <div class=\'kauto-footer\'>    <span>KAuto Native Engine</span>    <a href=\'#\'>kauto.fun</a>  </div></div><div class=\'toast-msg\' id=\'toast\'>Th\u00f4ng b\u00e1o</div><script>let currentSpeed = 1.0;function switchTab(name) {  document.querySelectorAll(\'.tab-btn\').forEach(b => b.classList.remove(\'active\'));  document.querySelectorAll(\'.tab-content\').forEach(c => c.classList.remove(\'active\'));  event.currentTarget.classList.add(\'active\');  document.getElementById(\'tab-\' + name).classList.add(\'active\');}function setSpeed(val) {  currentSpeed = parseFloat(val);  document.getElementById(\'speedDisplay\').innerText = currentSpeed.toFixed(1) + \'x\';  document.getElementById(\'speedSlider\').value = currentSpeed;  document.querySelectorAll(\'.btn-speed\').forEach(b => {    b.classList.toggle(\'active\', b.innerText === val + \'x\');  });  showToast(\'\u0110\u00e3 \u0111\u1ed5i t\u1ed1c \u0111\u1ed9: \' + currentSpeed + \'x\');  if (window.KAutoNative && window.KAutoNative.setSpeed) {    window.KAutoNative.setSpeed(currentSpeed);  }}function onSliderChange(val) {  currentSpeed = parseFloat(val);  document.getElementById(\'speedDisplay\').innerText = currentSpeed.toFixed(1) + \'x\';  document.querySelectorAll(\'.btn-speed\').forEach(b => {    b.classList.toggle(\'active\', b.innerText === parseInt(val) + \'x\' && Math.abs(currentSpeed - parseInt(val)) < 0.1);  });  if (window.KAutoNative && window.KAutoNative.setSpeed) {    window.KAutoNative.setSpeed(currentSpeed);  }}function toggleFeature(id, enabled) {  showToast((enabled ? \'B\u1eadt: \' : \'T\u1eaft: \') + id);  if (window.KAutoNative && window.KAutoNative.toggleFeature) {    window.KAutoNative.toggleFeature(id, enabled);  }}function changeOpacity(val) {  document.getElementById(\'opacityVal\').innerText = val + \'%\';  document.getElementById(\'kautoCard\').style.opacity = val / 100;}function resetDefaults() {  setSpeed(1);  document.querySelectorAll(\'.switch input\').forEach(s => s.checked = false);  changeOpacity(92);  showToast(\'\u0110\u00e3 \u0111\u1eb7t l\u1ea1i m\u1eb7c \u0111\u1ecbnh\');}function minimizeMenu() {  if (window.KAutoNative && window.KAutoNative.minimize) {    window.KAutoNative.minimize();  }}function closeMenu() {  if (window.KAutoNative && window.KAutoNative.close) {    window.KAutoNative.close();  }}function showToast(msg) {  const t = document.getElementById(\'toast\');  t.innerText = msg; t.classList.add(\'show\');  clearTimeout(window._tHide);  window._tHide = setTimeout(() => t.classList.remove(\'show\'), 1500);}</script></body></html>"

    const-string v7, "text/html"

    invoke-virtual/range {v4 .. v9}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->panelContainer:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/kauto/KAutoMenu;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 166
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->rootOverlay:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/kauto/KAutoMenu;->panelContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 167
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->rootOverlay:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 170
    iget-object v1, p0, Lcom/kauto/KAutoMenu;->rootOverlay:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 171
    const-string v0, "KAutoMenu"

    const-string v1, "KAuto overlay attached to window decor successfully!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    return-void
.end method


# virtual methods
.method public setPanelVisible(Z)V
    .registers 6

    .line 175
    iget-object v0, p0, Lcom/kauto/KAutoMenu;->panelContainer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz v0, :cond_12

    .line 176
    iget-object v0, p0, Lcom/kauto/KAutoMenu;->panelContainer:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_d

    const/4 v3, 0x0

    goto :goto_f

    :cond_d
    const/16 v3, 0x8

    :goto_f
    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 178
    :cond_12
    iget-object v0, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1f

    .line 179
    iget-object v0, p0, Lcom/kauto/KAutoMenu;->floatingBtn:Landroid/widget/FrameLayout;

    if-eqz p1, :cond_1c

    const/16 v1, 0x8

    :cond_1c
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 181
    :cond_1f
    return-void
.end method
