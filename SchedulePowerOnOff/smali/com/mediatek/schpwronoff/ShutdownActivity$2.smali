.class Lcom/mediatek/schpwronoff/ShutdownActivity$2;
.super Ljava/lang/Object;
.source "ShutdownActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/schpwronoff/ShutdownActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/schpwronoff/ShutdownActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/schpwronoff/ShutdownActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 178
    iput-object p1, p0, Lcom/mediatek/schpwronoff/ShutdownActivity$2;->this$0:Lcom/mediatek/schpwronoff/ShutdownActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 181
    iget-object v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity$2;->this$0:Lcom/mediatek/schpwronoff/ShutdownActivity;

    #calls: Lcom/mediatek/schpwronoff/ShutdownActivity;->cancelCountDownTimer()V
    invoke-static {v0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->access$400(Lcom/mediatek/schpwronoff/ShutdownActivity;)V

    .line 182
    iget-object v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity$2;->this$0:Lcom/mediatek/schpwronoff/ShutdownActivity;

    invoke-virtual {v0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->finish()V

    .line 183
    return-void
.end method
