.class public Lcom/mediatek/schpwronoff/ShutdownActivity;
.super Landroid/app/Activity;
.source "ShutdownActivity.java"


# static fields
.field private static final DIALOG:I = 0x1

.field private static final TAG:Ljava/lang/String; = "ShutdownActivity"

.field public static sCountDownTimer:Landroid/os/CountDownTimer;


# instance fields
.field private mMessage:Ljava/lang/String;

.field private mSecondsCountdown:I

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/schpwronoff/ShutdownActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mSecondsCountdown:I

    return v0
.end method

.method static synthetic access$002(Lcom/mediatek/schpwronoff/ShutdownActivity;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    iput p1, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mSecondsCountdown:I

    return p1
.end method

.method static synthetic access$102(Lcom/mediatek/schpwronoff/ShutdownActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    iput-object p1, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mMessage:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mediatek/schpwronoff/ShutdownActivity;)Landroid/telephony/TelephonyManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-object v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/schpwronoff/ShutdownActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->fireShutDown()V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/schpwronoff/ShutdownActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->cancelCountDownTimer()V

    return-void
.end method

.method private cancelCountDownTimer()V
    .locals 2

    .prologue
    .line 132
    sget-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 133
    const-string v0, "ShutdownActivity"

    const-string v1, "cancel sCountDownTimer"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    sget-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 135
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    .line 136
    invoke-static {}, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->releaseCpuLock()V

    .line 138
    :cond_0
    return-void
.end method

.method private fireShutDown()V
    .locals 3

    .prologue
    .line 201
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.ACTION_REQUEST_SHUTDOWN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 202
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android.intent.extra.KEY_CONFIRM"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 203
    const/high16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 204
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 205
    invoke-virtual {p0, v0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->startActivity(Landroid/content/Intent;)V

    .line 206
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    .line 69
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 70
    invoke-static {p0}, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->acquireCpuWakeLock(Landroid/content/Context;)V

    .line 71
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/PowerManager;

    .line 72
    .local v8, pm:Landroid/os/PowerManager;
    const-string v0, "ShutdownActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "screen is on ? ----- "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v8}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 74
    invoke-virtual {p0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->getWindow()Landroid/view/Window;

    move-result-object v9

    .line 75
    .local v9, win:Landroid/view/Window;
    const/high16 v0, 0x48

    invoke-virtual {v9, v0}, Landroid/view/Window;->addFlags(I)V

    .line 77
    const/16 v6, 0xb

    .line 78
    .local v6, countSeconds:I
    const/16 v7, 0x3e8

    .line 79
    .local v7, millisSeconds:I
    if-nez p1, :cond_1

    .line 80
    const/16 v0, 0xb

    iput v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mSecondsCountdown:I

    .line 87
    :goto_0
    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Lcom/mediatek/schpwronoff/ShutdownActivity$1;

    iget v1, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mSecondsCountdown:I

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/mediatek/schpwronoff/ShutdownActivity$1;-><init>(Lcom/mediatek/schpwronoff/ShutdownActivity;JJ)V

    sput-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    .line 116
    :cond_0
    const-string v0, "ShutdownActivity"

    const-string v1, "ShutdonwActivity onCreate"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    sget-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    if-nez v0, :cond_2

    .line 118
    invoke-virtual {p0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->finish()V

    .line 122
    :goto_1
    return-void

    .line 82
    :cond_1
    const-string v0, "lefttime"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mSecondsCountdown:I

    .line 83
    const-string v0, "message"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mMessage:Ljava/lang/String;

    goto :goto_0

    .line 120
    :cond_2
    sget-object v0, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    goto :goto_1
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 6
    .parameter "id"

    .prologue
    .line 165
    const-string v3, "ShutdownActivity"

    const-string v4, "onCreateDialog"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x1080027

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x10400d9

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mMessage:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x1040013

    new-instance v5, Lcom/mediatek/schpwronoff/ShutdownActivity$3;

    invoke-direct {v5, p0}, Lcom/mediatek/schpwronoff/ShutdownActivity$3;-><init>(Lcom/mediatek/schpwronoff/ShutdownActivity;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x1040009

    new-instance v5, Lcom/mediatek/schpwronoff/ShutdownActivity$2;

    invoke-direct {v5, p0}, Lcom/mediatek/schpwronoff/ShutdownActivity$2;-><init>(Lcom/mediatek/schpwronoff/ShutdownActivity;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 185
    .local v0, dialog:Landroid/app/AlertDialog;
    invoke-virtual {p0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x111000f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 186
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/Window;->addFlags(I)V

    .line 188
    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 189
    .local v1, win:Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 190
    .local v2, winParams:Landroid/view/WindowManager$LayoutParams;
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v4, -0x8000

    or-int/2addr v3, v4

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 191
    invoke-virtual {v1, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 192
    return-object v0
.end method

.method protected onDestory()V
    .locals 2

    .prologue
    .line 141
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 142
    const-string v0, "ShutdownActivity"

    const-string v1, "onDestory"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    invoke-direct {p0}, Lcom/mediatek/schpwronoff/ShutdownActivity;->cancelCountDownTimer()V

    .line 144
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "keyEvent"

    .prologue
    .line 160
    const/4 v0, 0x0

    return v0
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 1
    .parameter "id"
    .parameter "dialog"

    .prologue
    .line 197
    check-cast p2, Landroid/app/AlertDialog;

    .end local p2
    iget-object v0, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mMessage:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 198
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 148
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 149
    const-string v0, "ShutdownActivity"

    const-string v1, "onResume"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 126
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 127
    const-string v0, "lefttime"

    iget v1, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mSecondsCountdown:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 128
    const-string v0, "message"

    iget-object v1, p0, Lcom/mediatek/schpwronoff/ShutdownActivity;->mMessage:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 154
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 155
    const-string v0, "ShutdownActivity"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    return-void
.end method
