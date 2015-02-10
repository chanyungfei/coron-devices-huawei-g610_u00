.class Lcom/mediatek/schpwronoff/ShutdownActivity$3;
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
    .line 169
    iput-object p1, p0, Lcom/mediatek/schpwronoff/ShutdownActivity$3;->this$0:Lcom/mediatek/schpwronoff/ShutdownActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 172
    sget-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 173
    sget-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 174
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity$3;->this$0:Lcom/mediatek/schpwronoff/ShutdownActivity;

    #calls: Lcom/mediatek/schpwronoff/ShutdownActivity;->fireShutDown()V
    invoke-static {v0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->access$300(Lcom/mediatek/schpwronoff/ShutdownActivity;)V

    .line 177
    return-void
.end method
