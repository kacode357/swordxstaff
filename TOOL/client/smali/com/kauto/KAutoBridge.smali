.class public Lcom/kauto/KAutoBridge;
.super Ljava/lang/Object;
.source "KAutoBridge.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "KAutoBridge"


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final menu:Lcom/kauto/KAutoMenu;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/kauto/KAutoMenu;)V
    .registers 3

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    .line 15
    iput-object p2, p0, Lcom/kauto/KAutoBridge;->menu:Lcom/kauto/KAutoMenu;

    .line 16
    return-void
.end method

.method static synthetic access$000(Lcom/kauto/KAutoBridge;)Lcom/kauto/KAutoMenu;
    .registers 1

    .line 8
    iget-object p0, p0, Lcom/kauto/KAutoBridge;->menu:Lcom/kauto/KAutoMenu;

    return-object p0
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/kauto/KAutoBridge$4;

    invoke-direct {v1, p0}, Lcom/kauto/KAutoBridge$4;-><init>(Lcom/kauto/KAutoBridge;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 74
    return-void
.end method

.method public minimize()V
    .registers 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/kauto/KAutoBridge$3;

    invoke-direct {v1, p0}, Lcom/kauto/KAutoBridge$3;-><init>(Lcom/kauto/KAutoBridge;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 62
    return-void
.end method

.method public setSpeed(F)V
    .registers 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Speed requested: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "KAutoBridge"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    iget-object v0, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/kauto/KAutoBridge$1;

    invoke-direct {v1, p0, p1}, Lcom/kauto/KAutoBridge$1;-><init>(Lcom/kauto/KAutoBridge;F)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 34
    return-void
.end method

.method public toggleFeature(Ljava/lang/String;Z)V
    .registers 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Toggle feature: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "KAutoBridge"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    iget-object v0, p0, Lcom/kauto/KAutoBridge;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/kauto/KAutoBridge$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/kauto/KAutoBridge$2;-><init>(Lcom/kauto/KAutoBridge;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 50
    return-void
.end method
