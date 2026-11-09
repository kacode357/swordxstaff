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

    sget-object v6, Lcom/kauto/KAutoHtml;->HTML_CONTENT:Ljava/lang/String;

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
