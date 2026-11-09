.class Lcom/kauto/KAutoMenu$1;
.super Ljava/lang/Object;
.source "KAutoMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kauto/KAutoMenu;->init(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 42
    iput-object p1, p0, Lcom/kauto/KAutoMenu$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 46
    :try_start_0
    new-instance v0, Lcom/kauto/KAutoMenu;

    iget-object v1, p0, Lcom/kauto/KAutoMenu$1;->val$activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/kauto/KAutoMenu;-><init>(Landroid/app/Activity;)V

    .line 47
    # invokes: Lcom/kauto/KAutoMenu;->setupViews()V
    invoke-static {v0}, Lcom/kauto/KAutoMenu;->access$000(Lcom/kauto/KAutoMenu;)V
    :try_end_a
    .catchall {:try_start_0 .. :try_end_a} :catchall_b

    .line 50
    goto :goto_13

    .line 48
    :catchall_b
    move-exception v0

    .line 49
    const-string v1, "KAutoMenu"

    const-string v2, "Error setting up KAutoMenu"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    :goto_13
    return-void
.end method
