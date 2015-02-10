.class public Lcom/mediatek/schpwronoff/DigitalClock;
.super Landroid/widget/LinearLayout;
.source "DigitalClock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/schpwronoff/DigitalClock$FormatChangeObserver;,
        Lcom/mediatek/schpwronoff/DigitalClock$AmPm;
    }
.end annotation


# static fields
.field private static final M12:Ljava/lang/String; = "h:mm"

.field private static final TAG:Ljava/lang/String; = "DigitalClock"


# instance fields
.field private mAmPm:Lcom/mediatek/schpwronoff/DigitalClock$AmPm;

.field private mAttached:Z

.field private mCalendar:Ljava/util/Calendar;

.field private mFormat:Ljava/lang/String;

.field private mFormatChangeObserver:Landroid/database/ContentObserver;

.field private final mHandler:Landroid/os/Handler;

.field private final mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mLive:Z

.field private mTimeDisplay:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 139
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mediatek/schpwronoff/DigitalClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 140
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 148
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 73
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mLive:Z

    .line 77
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mHandler:Landroid/os/Handler;

    .line 78
    new-instance v0, Lcom/mediatek/schpwronoff/DigitalClock$1;

    invoke-direct {v0, p0}, Lcom/mediatek/schpwronoff/DigitalClock$1;-><init>(Lcom/mediatek/schpwronoff/DigitalClock;)V

    iput-object v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 149
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/schpwronoff/DigitalClock;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mLive:Z

    return v0
.end method

.method static synthetic access$102(Lcom/mediatek/schpwronoff/DigitalClock;Ljava/util/Calendar;)Ljava/util/Calendar;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mCalendar:Ljava/util/Calendar;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mediatek/schpwronoff/DigitalClock;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/mediatek/schpwronoff/DigitalClock;->updateTime()V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/schpwronoff/DigitalClock;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/mediatek/schpwronoff/DigitalClock;->setDateFormat()V

    return-void
.end method

.method private setDateFormat()V
    .locals 3

    .prologue
    .line 225
    iget-object v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mediatek/schpwronoff/Alarms;->get24HourMode(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "kk:mm"

    :goto_0
    iput-object v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mFormat:Ljava/lang/String;

    .line 226
    iget-object v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mAmPm:Lcom/mediatek/schpwronoff/DigitalClock$AmPm;

    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mFormat:Ljava/lang/String;

    const-string v2, "h:mm"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->setShowAmPm(Z)V

    .line 227
    return-void

    .line 225
    :cond_0
    const-string v0, "h:mm"

    goto :goto_0
.end method

.method private updateTime()V
    .locals 4

    .prologue
    .line 215
    iget-boolean v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mLive:Z

    if-eqz v1, :cond_0

    .line 216
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mCalendar:Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 219
    :cond_0
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mFormat:Ljava/lang/String;

    iget-object v2, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mCalendar:Ljava/util/Calendar;

    invoke-static {v1, v2}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 220
    .local v0, newTime:Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mTimeDisplay:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    iget-object v2, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mAmPm:Lcom/mediatek/schpwronoff/DigitalClock$AmPm;

    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mCalendar:Ljava/util/Calendar;

    const/16 v3, 0x9

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v1}, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->setIsMorning(Z)V

    .line 222
    return-void

    .line 221
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 164
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 166
    const-string v1, "DigitalClock"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onAttachedToWindow "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-boolean v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mAttached:Z

    if-eqz v1, :cond_0

    .line 187
    :goto_0
    return-void

    .line 171
    :cond_0
    iput-boolean v5, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mAttached:Z

    .line 173
    iget-boolean v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mLive:Z

    if-eqz v1, :cond_1

    .line 175
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 176
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.TIME_TICK"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 177
    const-string v1, "android.intent.action.TIME_SET"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 178
    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 179
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 183
    .end local v0           #filter:Landroid/content/IntentFilter;
    :cond_1
    new-instance v1, Lcom/mediatek/schpwronoff/DigitalClock$FormatChangeObserver;

    invoke-direct {v1, p0}, Lcom/mediatek/schpwronoff/DigitalClock$FormatChangeObserver;-><init>(Lcom/mediatek/schpwronoff/DigitalClock;)V

    iput-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    .line 184
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/Settings$System;->CONTENT_URI:Landroid/net/Uri;

    iget-object v3, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2, v5, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 186
    invoke-direct {p0}, Lcom/mediatek/schpwronoff/DigitalClock;->updateTime()V

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .prologue
    .line 191
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 193
    iget-boolean v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mAttached:Z

    if-nez v1, :cond_0

    .line 207
    :goto_0
    return-void

    .line 196
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mAttached:Z

    .line 198
    invoke-virtual {p0}, Lcom/mediatek/schpwronoff/DigitalClock;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 199
    .local v0, background:Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v1, :cond_1

    .line 200
    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    .end local v0           #background:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 203
    :cond_1
    iget-boolean v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mLive:Z

    if-eqz v1, :cond_2

    .line 204
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 206
    :cond_2
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mFormatChangeObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 1

    .prologue
    .line 153
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 155
    const v0, 0x7f0a0003

    invoke-virtual {p0, v0}, Lcom/mediatek/schpwronoff/DigitalClock;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mTimeDisplay:Landroid/widget/TextView;

    .line 156
    new-instance v0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;

    invoke-direct {v0, p0}, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mAmPm:Lcom/mediatek/schpwronoff/DigitalClock$AmPm;

    .line 157
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mCalendar:Ljava/util/Calendar;

    .line 159
    invoke-direct {p0}, Lcom/mediatek/schpwronoff/DigitalClock;->setDateFormat()V

    .line 160
    return-void
.end method

.method setLive(Z)V
    .locals 0
    .parameter "live"

    .prologue
    .line 230
    iput-boolean p1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mLive:Z

    .line 231
    return-void
.end method

.method updateTime(Ljava/util/Calendar;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 210
    iput-object p1, p0, Lcom/mediatek/schpwronoff/DigitalClock;->mCalendar:Ljava/util/Calendar;

    .line 211
    invoke-direct {p0}, Lcom/mediatek/schpwronoff/DigitalClock;->updateTime()V

    .line 212
    return-void
.end method
