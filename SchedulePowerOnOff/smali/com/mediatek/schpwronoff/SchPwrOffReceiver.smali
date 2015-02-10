.class public Lcom/mediatek/schpwronoff/SchPwrOffReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SchPwrOffReceiver.java"


# static fields
.field private static final SHUTDOWN_IPO:Ljava/lang/String; = "android.intent.action.ACTION_SHUTDOWN_IPO"

.field private static final STALE_WINDOW:I = 0x708

.field private static final TAG:Ljava/lang/String; = "SchPwrOffReceiver"


# instance fields
.field mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private fireShutDown()V
    .locals 3

    .prologue
    .line 156
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.ACTION_REQUEST_SHUTDOWN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 157
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android.intent.extra.KEY_CONFIRM"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 158
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 159
    iget-object v1, p0, Lcom/mediatek/schpwronoff/SchPwrOffReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 160
    return-void
.end method

.method private static isAlarmBoot()Z
    .locals 3

    .prologue
    .line 168
    const-string v2, "sys.boot.reason"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, bootReason:Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v2, "1"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 170
    .local v1, ret:Z
    :goto_0
    return v1

    .line 169
    .end local v1           #ret:Z
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 23
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 67
    const-string v17, "SchPwrOffReceiver"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "SchPwrOffReceiver\'s intent action "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const-string v17, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 69
    sget-object v17, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    if-nez v17, :cond_1

    .line 70
    const-string v17, "SchPwrOffReceiver"

    const-string v18, "SchPwrOffReceiver , ShutdownActivity.sCountDownTimer == null"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    :goto_0
    invoke-static {}, Lcom/mediatek/schpwronoff/SchPwrWakeLock;->releaseCpuLock()V

    .line 153
    :cond_0
    :goto_1
    return-void

    .line 72
    :cond_1
    const-string v17, "SchPwrOffReceiver"

    const-string v18, "SchPwrOffReceiver , ShutdownActivity.sCountDownTimer != null"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    sget-object v17, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual/range {v17 .. v17}, Landroid/os/CountDownTimer;->cancel()V

    .line 74
    const/16 v17, 0x0

    sput-object v17, Lcom/mediatek/schpwronoff/ShutdownActivity;->sCountDownTimer:Landroid/os/CountDownTimer;

    goto :goto_0

    .line 80
    :cond_2
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/schpwronoff/SchPwrOffReceiver;->mContext:Landroid/content/Context;

    .line 81
    const/4 v3, 0x0

    .line 86
    .local v3, alarm:Lcom/mediatek/schpwronoff/Alarm;
    const-string v17, "intent.extra.alarm_raw"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v6

    .line 87
    .local v6, data:[B
    if-eqz v6, :cond_3

    .line 88
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v9

    .line 89
    .local v9, in:Landroid/os/Parcel;
    const/16 v17, 0x0

    array-length v0, v6

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v9, v6, v0, v1}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 90
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 91
    sget-object v17, Lcom/mediatek/schpwronoff/Alarm;->CREATOR:Landroid/os/Parcelable$Creator;

    move-object/from16 v0, v17

    invoke-interface {v0, v9}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .end local v3           #alarm:Lcom/mediatek/schpwronoff/Alarm;
    check-cast v3, Lcom/mediatek/schpwronoff/Alarm;

    .line 94
    .end local v9           #in:Landroid/os/Parcel;
    .restart local v3       #alarm:Lcom/mediatek/schpwronoff/Alarm;
    :cond_3
    if-nez v3, :cond_4

    .line 95
    const-string v17, "SchPwrOffReceiver"

    const-string v18, "SchPwrOffReceiver failed to parse the alarm from the intent"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 99
    :cond_4
    const/16 v11, 0x3e8

    .line 102
    .local v11, millisInSeconds:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 103
    .local v12, now:J
    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string v17, "HH:mm:ss.SSS aaa"

    sget-object v18, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v7, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 104
    .local v7, format:Ljava/text/SimpleDateFormat;
    const-string v17, "SchPwrOffReceiver"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "SchPwrOffReceiver.onReceive() id "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " setFor "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    new-instance v19, Ljava/util/Date;

    iget-wide v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    move-wide/from16 v20, v0

    invoke-direct/range {v19 .. v21}, Ljava/util/Date;-><init>(J)V

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-wide v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    move-wide/from16 v17, v0

    const-wide/32 v19, 0x1b7740

    add-long v17, v17, v19

    cmp-long v17, v12, v17

    if-lez v17, :cond_5

    .line 107
    const-string v17, "SchPwrOffReceiver"

    const-string v18, "SchPwrOffReceiver ignoring stale alarm"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    const-string v17, "SchPwrOffReceiver"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "now = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    const-string v17, "SchPwrOffReceiver"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "stale time = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget-wide v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    move-wide/from16 v19, v0

    const-wide/32 v21, 0x1b7740

    add-long v19, v19, v21

    invoke-virtual/range {v18 .. v20}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 118
    :cond_5
    new-instance v5, Landroid/content/Intent;

    const-string v17, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 119
    .local v5, closeDialogs:Landroid/content/Intent;
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 120
    const/16 v15, 0x384

    .line 123
    .local v15, schduleTimeOff:I
    iget v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    move/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_6

    .line 124
    const-string v17, "SchPwrOffReceiver"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "SchPwrOffReceiver.onReceive() id "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " get power on time out "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 125
    :cond_6
    iget v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    move/from16 v17, v0

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_0

    .line 126
    const/4 v10, 0x0

    .line 127
    .local v10, isInCall:Z
    const-string v17, "phone"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/telephony/TelephonyManager;

    .line 128
    .local v16, telephonyManager:Landroid/telephony/TelephonyManager;
    invoke-virtual/range {v16 .. v16}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v17

    if-eqz v17, :cond_8

    const/4 v10, 0x1

    .line 129
    :goto_2
    const-string v17, "SchPwrOffReceiver"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "SchPwrOffReceiver.onReceive() id "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " in call "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    if-nez v10, :cond_7

    invoke-static {}, Lcom/mediatek/schpwronoff/SchPwrOffReceiver;->isAlarmBoot()Z

    move-result v17

    if-eqz v17, :cond_9

    .line 132
    :cond_7
    const-string v17, "SchPwrOffReceiver"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "SchPwrOffReceiver.onReceive() id "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " isAlarmboot= "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-static {}, Lcom/mediatek/schpwronoff/SchPwrOffReceiver;->isAlarmBoot()Z

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :goto_3
    iget-object v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mDaysOfWeek:Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;->isRepeatSet()Z

    move-result v17

    if-eqz v17, :cond_a

    .line 146
    const-string v17, "SchPwrOffReceiver"

    const-string v18, "SchPwrOffReceiver.onReceive(): not isRepeatSet()"

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    invoke-static/range {p1 .. p1}, Lcom/mediatek/schpwronoff/Alarms;->setNextAlertPowerOff(Landroid/content/Context;)V

    goto/16 :goto_1

    .line 128
    :cond_8
    const/4 v10, 0x0

    goto :goto_2

    .line 134
    :cond_9
    new-instance v8, Landroid/content/Intent;

    const-class v17, Lcom/mediatek/schpwronoff/ShutdownActivity;

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-direct {v8, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 135
    .local v8, i:Landroid/content/Intent;
    const/high16 v17, 0x1080

    move/from16 v0, v17

    invoke-virtual {v8, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 136
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/schpwronoff/SchPwrOffReceiver;->getResultCode()I

    move-result v17

    const/high16 v18, 0x4000

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v8, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v14

    .line 138
    .local v14, pendingIntent:Landroid/app/PendingIntent;
    const-string v17, "alarm"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/AlarmManager;

    .line 139
    .local v4, am:Landroid/app/AlarmManager;
    const/16 v17, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    const-wide/16 v20, 0x384

    add-long v18, v18, v20

    move/from16 v0, v17

    move-wide/from16 v1, v18

    invoke-virtual {v4, v0, v1, v2, v14}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_3

    .line 149
    .end local v4           #am:Landroid/app/AlarmManager;
    .end local v8           #i:Landroid/content/Intent;
    .end local v14           #pendingIntent:Landroid/app/PendingIntent;
    :cond_a
    const-string v17, "SchPwrOffReceiver"

    const-string v18, "SchPwrOffReceiver.onReceive(): isRepeatSet() "

    invoke-static/range {v17 .. v18}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    iget v0, v3, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    move/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/mediatek/schpwronoff/Alarms;->enableAlarm(Landroid/content/Context;IZ)V

    goto/16 :goto_1
.end method
