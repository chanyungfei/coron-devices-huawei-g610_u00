.class Lcom/android/settings_ex/deviceinfo/Memory$3;
.super Landroid/os/Handler;
.source "Memory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings_ex/deviceinfo/Memory;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings_ex/deviceinfo/Memory;


# direct methods
.method constructor <init>(Lcom/android/settings_ex/deviceinfo/Memory;)V
    .locals 0
    .parameter

    .prologue
    .line 344
    iput-object p1, p0, Lcom/android/settings_ex/deviceinfo/Memory$3;->this$0:Lcom/android/settings_ex/deviceinfo/Memory;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 346
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 353
    :goto_0
    return-void

    .line 348
    :pswitch_0
    iget-object v0, p0, Lcom/android/settings_ex/deviceinfo/Memory$3;->this$0:Lcom/android/settings_ex/deviceinfo/Memory;

    const/4 v1, 0x2

    #calls: Lcom/android/settings_ex/deviceinfo/Memory;->showDialogInner(I)V
    invoke-static {v0, v1}, Lcom/android/settings_ex/deviceinfo/Memory;->access$800(Lcom/android/settings_ex/deviceinfo/Memory;I)V

    goto :goto_0

    .line 346
    nop

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_0
    .end packed-switch
.end method