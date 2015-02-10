.class Lcom/mediatek/schpwronoff/SchPwrWakeLock;
.super Ljava/lang/Object;
.source "SchPwrWakeLock.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SchPwrWakeLock"

.field private static sCpuWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static acquireCpuWakeLock(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 52
    const-string v1, "SchPwrWakeLock"

    const-string v2, "SchPwrWakeLock Acquiring cpu wake lock"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    sget-object v1, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->sCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v1, :cond_0

    .line 66
    :goto_0
    return-void

    .line 57
    :cond_0
    const-string v1, "power"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 59
    .local v0, pm:Landroid/os/PowerManager;
    const v1, 0x3000001a

    const-string v2, "SchPwrOnOff"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    sput-object v1, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->sCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 65
    sget-object v1, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->sCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    goto :goto_0
.end method

.method static releaseCpuLock()V
    .locals 2

    .prologue
    .line 69
    const-string v0, "SchPwrWakeLock"

    const-string v1, "SchPwrWakeLock Releasing cpu wake lock"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    sget-object v0, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->sCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    .line 71
    sget-object v0, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->sCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 72
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->sCpuWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 74
    :cond_0
    return-void
.end method
