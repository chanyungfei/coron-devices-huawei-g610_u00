.class Landroid/webkit/WebCoreThreadWatchdog$PageNotRespondingRunnable$3;
.super Ljava/lang/Object;
.source "WebCoreThreadWatchdog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/webkit/WebCoreThreadWatchdog$PageNotRespondingRunnable;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/webkit/WebCoreThreadWatchdog$PageNotRespondingRunnable;


# direct methods
.method constructor <init>(Landroid/webkit/WebCoreThreadWatchdog$PageNotRespondingRunnable;)V
    .locals 0
    .parameter

    .prologue
    .line 264
    iput-object p1, p0, Landroid/webkit/WebCoreThreadWatchdog$PageNotRespondingRunnable$3;->this$1:Landroid/webkit/WebCoreThreadWatchdog$PageNotRespondingRunnable;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 268
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 269
    return-void
.end method
