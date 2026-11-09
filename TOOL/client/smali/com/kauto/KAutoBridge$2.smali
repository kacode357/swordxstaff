.class Lcom/kauto/KAutoBridge$2;
.super Ljava/lang/Object;
.source "KAutoBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kauto/KAutoBridge;->toggleFeature(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kauto/KAutoBridge;

.field final synthetic val$enabled:Z

.field final synthetic val$featureId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/kauto/KAutoBridge;Ljava/lang/String;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 39
    iput-object p1, p0, Lcom/kauto/KAutoBridge$2;->this$0:Lcom/kauto/KAutoBridge;

    iput-object p2, p0, Lcom/kauto/KAutoBridge$2;->val$featureId:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/kauto/KAutoBridge$2;->val$enabled:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .line 43
    :try_start_0
    const-string v0, "com.unity3d.player.UnityPlayer"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 44
    const-string v1, "UnitySendMessage"

    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const/4 v7, 0x2

    aput-object v4, v3, v7

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/kauto/KAutoBridge$2;->val$featureId:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ":"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v3, p0, Lcom/kauto/KAutoBridge$2;->val$enabled:Z

    if-eqz v3, :cond_32

    const-string v3, "1"

    goto :goto_34

    :cond_32
    const-string v3, "0"

    :goto_34
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "GameFramework"

    aput-object v3, v2, v5

    const-string v3, "OnKAutoFeatureToggle"

    aput-object v3, v2, v6

    aput-object v1, v2, v7

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4c
    .catchall {:try_start_0 .. :try_end_4c} :catchall_4d

    .line 47
    goto :goto_4e

    .line 46
    :catchall_4d
    move-exception v0

    .line 48
    :goto_4e
    return-void
.end method
