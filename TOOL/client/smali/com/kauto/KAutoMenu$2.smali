.class Lcom/kauto/KAutoMenu$2;
.super Ljava/lang/Object;
.source "KAutoMenu.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kauto/KAutoMenu;->setupViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kauto/KAutoMenu;


# direct methods
.method constructor <init>(Lcom/kauto/KAutoMenu;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 101
    iput-object p1, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9

    .line 104
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const-wide/16 v1, 0x64

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_e2

    .line 133
    const/4 p1, 0x0

    return p1

    .line 114
    :pswitch_c
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget-object v1, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    # getter for: Lcom/kauto/KAutoMenu;->dX:F
    invoke-static {v1}, Lcom/kauto/KAutoMenu;->access$100(Lcom/kauto/KAutoMenu;)F

    move-result v1

    add-float/2addr v0, v1

    .line 115
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget-object v1, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    # getter for: Lcom/kauto/KAutoMenu;->dY:F
    invoke-static {v1}, Lcom/kauto/KAutoMenu;->access$200(Lcom/kauto/KAutoMenu;)F

    move-result v1

    add-float/2addr p2, v1

    .line 117
    iget-object v1, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    # getter for: Lcom/kauto/KAutoMenu;->rootOverlay:Landroid/widget/FrameLayout;
    invoke-static {v1}, Lcom/kauto/KAutoMenu;->access$500(Lcom/kauto/KAutoMenu;)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 118
    iget-object v2, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    # getter for: Lcom/kauto/KAutoMenu;->rootOverlay:Landroid/widget/FrameLayout;
    invoke-static {v2}, Lcom/kauto/KAutoMenu;->access$500(Lcom/kauto/KAutoMenu;)Landroid/widget/FrameLayout;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    sub-int/2addr v2, v4

    int-to-float v2, v2

    invoke-static {p2, v2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    .line 119
    invoke-virtual {p1, v0}, Landroid/view/View;->setX(F)V

    .line 120
    invoke-virtual {p1, p2}, Landroid/view/View;->setY(F)V

    .line 121
    return v3

    .line 124
    :pswitch_5a
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 125
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iget-object v0, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    # getter for: Lcom/kauto/KAutoMenu;->startX:F
    invoke-static {v0}, Lcom/kauto/KAutoMenu;->access$300(Lcom/kauto/KAutoMenu;)F

    move-result v0

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    .line 126
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget-object v0, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    # getter for: Lcom/kauto/KAutoMenu;->startY:F
    invoke-static {v0}, Lcom/kauto/KAutoMenu;->access$400(Lcom/kauto/KAutoMenu;)F

    move-result v0

    sub-float/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    .line 127
    const/high16 v0, 0x41700000    # 15.0f

    cmpg-float p1, p1, v0

    if-gez p1, :cond_9c

    cmpg-float p1, p2, v0

    if-gez p1, :cond_9c

    .line 129
    iget-object p1, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    invoke-virtual {p1, v3}, Lcom/kauto/KAutoMenu;->setPanelVisible(Z)V

    .line 131
    :cond_9c
    return v3

    .line 106
    :pswitch_9d
    iget-object v0, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    invoke-virtual {p1}, Landroid/view/View;->getX()F

    move-result v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    sub-float/2addr v4, v5

    # setter for: Lcom/kauto/KAutoMenu;->dX:F
    invoke-static {v0, v4}, Lcom/kauto/KAutoMenu;->access$102(Lcom/kauto/KAutoMenu;F)F

    .line 107
    iget-object v0, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    sub-float/2addr v4, v5

    # setter for: Lcom/kauto/KAutoMenu;->dY:F
    invoke-static {v0, v4}, Lcom/kauto/KAutoMenu;->access$202(Lcom/kauto/KAutoMenu;F)F

    .line 108
    iget-object v0, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    # setter for: Lcom/kauto/KAutoMenu;->startX:F
    invoke-static {v0, v4}, Lcom/kauto/KAutoMenu;->access$302(Lcom/kauto/KAutoMenu;F)F

    .line 109
    iget-object v0, p0, Lcom/kauto/KAutoMenu$2;->this$0:Lcom/kauto/KAutoMenu;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    # setter for: Lcom/kauto/KAutoMenu;->startY:F
    invoke-static {v0, p2}, Lcom/kauto/KAutoMenu;->access$402(Lcom/kauto/KAutoMenu;F)F

    .line 110
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const p2, 0x3f666666

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 111
    return v3

    :pswitch_data_e2
    .packed-switch 0x0
        :pswitch_9d
        :pswitch_5a
        :pswitch_c
    .end packed-switch
.end method
