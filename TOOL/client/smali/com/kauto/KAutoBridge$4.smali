.class Lcom/kauto/KAutoBridge$4;
.super Ljava/lang/Object;
.source "KAutoBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kauto/KAutoBridge;->close()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kauto/KAutoBridge;


# direct methods
.method constructor <init>(Lcom/kauto/KAutoBridge;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 66
    iput-object p1, p0, Lcom/kauto/KAutoBridge$4;->this$0:Lcom/kauto/KAutoBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 69
    iget-object v0, p0, Lcom/kauto/KAutoBridge$4;->this$0:Lcom/kauto/KAutoBridge;

    # getter for: Lcom/kauto/KAutoBridge;->menu:Lcom/kauto/KAutoMenu;
    invoke-static {v0}, Lcom/kauto/KAutoBridge;->access$000(Lcom/kauto/KAutoBridge;)Lcom/kauto/KAutoMenu;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 70
    iget-object v0, p0, Lcom/kauto/KAutoBridge$4;->this$0:Lcom/kauto/KAutoBridge;

    # getter for: Lcom/kauto/KAutoBridge;->menu:Lcom/kauto/KAutoMenu;
    invoke-static {v0}, Lcom/kauto/KAutoBridge;->access$000(Lcom/kauto/KAutoBridge;)Lcom/kauto/KAutoMenu;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/kauto/KAutoMenu;->setPanelVisible(Z)V

    .line 72
    :cond_12
    return-void
.end method
