.class Lcom/baidu/fm/FMRadio$29;
.super Ljava/lang/Object;
.source "FMRadio.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/baidu/fm/FMRadio;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/baidu/fm/FMRadio;


# direct methods
.method constructor <init>(Lcom/baidu/fm/FMRadio;)V
    .locals 0
    .parameter

    .prologue
    .line 2354
    iput-object p1, p0, Lcom/baidu/fm/FMRadio$29;->this$0:Lcom/baidu/fm/FMRadio;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 2356
    iget-object v0, p0, Lcom/baidu/fm/FMRadio$29;->this$0:Lcom/baidu/fm/FMRadio;

    invoke-virtual {v0}, Lcom/baidu/fm/FMRadio;->updateMuteState()V

    .line 2357
    return-void
.end method