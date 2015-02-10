.class public Lcom/mediatek/schpwronoff/Alarms;
.super Ljava/lang/Object;
.source "Alarms.java"


# static fields
.field public static final ALARM_ALERT_ACTION:Ljava/lang/String; = "com.android.alarmclock.ALARM_ALERT"

.field public static final ALARM_ALERT_SILENT:Ljava/lang/String; = "silent"

.field public static final ALARM_ID:Ljava/lang/String; = "alarm_id"

.field public static final ALARM_INTENT_EXTRA:Ljava/lang/String; = "intent.extra.alarm"

.field public static final ALARM_KILLED:Ljava/lang/String; = "alarm_killed"

.field public static final ALARM_KILLED_TIMEOUT:Ljava/lang/String; = "alarm_killed_timeout"

.field public static final ALARM_RAW_DATA:Ljava/lang/String; = "intent.extra.alarm_raw"

.field public static final CANCEL_SNOOZE:Ljava/lang/String; = "cancel_snooze"

.field public static final CLEAR_NOTIFICATION:Ljava/lang/String; = "clear_notification"

.field private static final DM12:Ljava/lang/String; = "E h:mm aa"

.field private static final DM24:Ljava/lang/String; = "E k:mm"

.field private static final M12:Ljava/lang/String; = "h:mm aa"

.field static final M24:Ljava/lang/String; = "kk:mm"

.field static final PREF_SNOOZE_ID:Ljava/lang/String; = "snooze_id"

.field static final PREF_SNOOZE_TIME:Ljava/lang/String; = "snooze_time"

.field private static final TAG:Ljava/lang/String; = "Settings/Alarms"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addAlarm(Landroid/content/ContentResolver;)Landroid/net/Uri;
    .locals 4
    .parameter "contentResolver"

    .prologue
    .line 112
    const/16 v0, 0x8

    .line 113
    .local v0, defaultHour:I
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 114
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "hour"

    const/16 v3, 0x8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 115
    sget-object v2, Lcom/mediatek/schpwronoff/Alarm$Columns;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v2, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    return-object v2
.end method

.method static calculateAlarm(IILcom/mediatek/schpwronoff/Alarm$DaysOfWeek;)Ljava/util/Calendar;
    .locals 9
    .parameter "hour"
    .parameter "minute"
    .parameter "daysOfWeek"

    .prologue
    const/16 v8, 0xc

    const/16 v7, 0xb

    const/4 v6, 0x0

    .line 588
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 589
    .local v1, c:Ljava/util/Calendar;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 591
    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 592
    .local v2, nowHour:I
    invoke-virtual {v1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 595
    .local v3, nowMinute:I
    if-lt p0, v2, :cond_0

    if-ne p0, v2, :cond_1

    if-gt p1, v3, :cond_1

    .line 596
    :cond_0
    const/4 v4, 0x6

    const/4 v5, 0x1

    invoke-virtual {v1, v4, v5}, Ljava/util/Calendar;->add(II)V

    .line 598
    :cond_1
    invoke-virtual {v1, v7, p0}, Ljava/util/Calendar;->set(II)V

    .line 599
    invoke-virtual {v1, v8, p1}, Ljava/util/Calendar;->set(II)V

    .line 600
    const/16 v4, 0xd

    invoke-virtual {v1, v4, v6}, Ljava/util/Calendar;->set(II)V

    .line 601
    const/16 v4, 0xe

    invoke-virtual {v1, v4, v6}, Ljava/util/Calendar;->set(II)V

    .line 603
    invoke-virtual {p2, v1}, Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;->getNextAlarm(Ljava/util/Calendar;)I

    move-result v0

    .line 608
    .local v0, addDays:I
    if-lez v0, :cond_2

    .line 609
    const/4 v4, 0x7

    invoke-virtual {v1, v4, v0}, Ljava/util/Calendar;->add(II)V

    .line 611
    :cond_2
    return-object v1
.end method

.method public static calculateNextAlert(Landroid/content/Context;I)Lcom/mediatek/schpwronoff/Alarm;
    .locals 11
    .parameter "context"
    .parameter "alarmId"

    .prologue
    .line 271
    const/4 v1, 0x0

    .line 272
    .local v1, alarm:Lcom/mediatek/schpwronoff/Alarm;
    const-wide v3, 0x7fffffffffffffffL

    .line 273
    .local v3, minTime:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 274
    .local v5, now:J
    const-string v7, "Settings/Alarms"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Alarms.calculateNextAlert()_now = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    invoke-static {v7, p1}, Lcom/mediatek/schpwronoff/Alarms;->getFilteredAlarmsCursor(Landroid/content/ContentResolver;I)Landroid/database/Cursor;

    move-result-object v2

    .line 276
    .local v2, cursor:Landroid/database/Cursor;
    if-eqz v2, :cond_4

    .line 277
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 279
    :cond_0
    new-instance v0, Lcom/mediatek/schpwronoff/Alarm;

    invoke-direct {v0, v2}, Lcom/mediatek/schpwronoff/Alarm;-><init>(Landroid/database/Cursor;)V

    .line 280
    .local v0, a:Lcom/mediatek/schpwronoff/Alarm;
    const-string v7, "Settings/Alarms"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Alarms.calculateNextAlert()_atime = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-wide v9, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    const-string v7, "Settings/Alarms"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Alarms.calculateNextAlert()_min_time = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    iget-wide v7, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-nez v7, :cond_5

    .line 285
    iget v7, v0, Lcom/mediatek/schpwronoff/Alarm;->mHour:I

    iget v8, v0, Lcom/mediatek/schpwronoff/Alarm;->mMinutes:I

    iget-object v9, v0, Lcom/mediatek/schpwronoff/Alarm;->mDaysOfWeek:Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;

    invoke-static {v7, v8, v9}, Lcom/mediatek/schpwronoff/Alarms;->calculateAlarm(IILcom/mediatek/schpwronoff/Alarm$DaysOfWeek;)Ljava/util/Calendar;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v7

    iput-wide v7, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    .line 286
    const-string v7, "Settings/Alarms"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Alarms.calculateNextAlert()_calculateAlarm = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-wide v9, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    :cond_1
    :goto_0
    iget-wide v7, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    cmp-long v7, v7, v3

    if-gez v7, :cond_2

    .line 296
    iget-wide v3, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    .line 297
    move-object v1, v0

    .line 299
    :cond_2
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 301
    .end local v0           #a:Lcom/mediatek/schpwronoff/Alarm;
    :cond_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 303
    :cond_4
    return-object v1

    .line 287
    .restart local v0       #a:Lcom/mediatek/schpwronoff/Alarm;
    :cond_5
    iget-wide v7, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    cmp-long v7, v7, v5

    if-gez v7, :cond_6

    .line 288
    const-string v7, "Settings/Alarms"

    const-string v8, "Alarms.calculateNextAlert()_atime < now"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    const/4 v7, 0x0

    invoke-static {p0, v0, v7}, Lcom/mediatek/schpwronoff/Alarms;->enableAlarmInternal(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;Z)V

    goto :goto_1

    .line 292
    :cond_6
    iget-boolean v7, v0, Lcom/mediatek/schpwronoff/Alarm;->mEnabled:Z

    if-eqz v7, :cond_1

    .line 293
    const/4 v7, 0x1

    invoke-static {p0, v0, v7}, Lcom/mediatek/schpwronoff/Alarms;->enableAlarmInternal(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;Z)V

    goto :goto_0
.end method

.method private static clearSnoozePreference(Landroid/content/SharedPreferences$Editor;)V
    .locals 1
    .parameter "ed"

    .prologue
    .line 535
    const-string v0, "snooze_id"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 536
    const-string v0, "snooze_time"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 537
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 538
    return-void
.end method

.method public static deleteAlarm(Landroid/content/Context;I)V
    .locals 5
    .parameter "context"
    .parameter "alarmId"

    .prologue
    .line 125
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 127
    .local v0, contentResolver:Landroid/content/ContentResolver;
    invoke-static {p0, p1}, Lcom/mediatek/schpwronoff/Alarms;->disableSnoozeAlert(Landroid/content/Context;I)V

    .line 129
    sget-object v2, Lcom/mediatek/schpwronoff/Alarm$Columns;->CONTENT_URI:Landroid/net/Uri;

    int-to-long v3, p1

    invoke-static {v2, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 130
    .local v1, uri:Landroid/net/Uri;
    const-string v2, ""

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 132
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->setNextAlert(Landroid/content/Context;)V

    .line 133
    return-void
.end method

.method static disableAlert(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    .line 417
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/mediatek/schpwronoff/SchPwrOffReceiver;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 418
    .local v1, intent:Landroid/content/Intent;
    const-string v3, "alarm"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 419
    .local v0, am:Landroid/app/AlarmManager;
    const/4 v3, 0x0

    const/high16 v4, 0x1000

    invoke-static {p0, v3, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 420
    .local v2, sender:Landroid/app/PendingIntent;
    const-string v3, "Settings/Alarms"

    const-string v4, "Alarms.disableAlertPowerOff(): disableForPowerOff"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 424
    return-void
.end method

.method static disableAlertPowerOn(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    .line 491
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/mediatek/schpwronoff/SchPwrOnReceiver;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 492
    .local v1, intent:Landroid/content/Intent;
    const-string v3, "alarm"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 493
    .local v0, am:Landroid/app/AlarmManager;
    const/4 v3, 0x0

    const/high16 v4, 0x1000

    invoke-static {p0, v3, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 494
    .local v2, sender:Landroid/app/PendingIntent;
    const/4 v3, 0x7

    const-wide/16 v4, 0x0

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 495
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlarmManager;->cancelPoweroffAlarm(Ljava/lang/String;)V

    .line 496
    const-string v3, "Settings/Alarms"

    const-string v4, "Alarms.disableAlertPowerOn(): disableForPowerOn"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 500
    return-void
.end method

.method public static disableExpiredAlarms(Landroid/content/Context;)V
    .locals 8
    .parameter "context"

    .prologue
    .line 311
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/schpwronoff/Alarms;->getFilteredAlarmsCursor(Landroid/content/ContentResolver;)Landroid/database/Cursor;

    move-result-object v1

    .line 312
    .local v1, cur:Landroid/database/Cursor;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 314
    .local v2, now:J
    if-eqz v1, :cond_3

    .line 315
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 317
    :cond_0
    new-instance v0, Lcom/mediatek/schpwronoff/Alarm;

    invoke-direct {v0, v1}, Lcom/mediatek/schpwronoff/Alarm;-><init>(Landroid/database/Cursor;)V

    .line 320
    .local v0, alarm:Lcom/mediatek/schpwronoff/Alarm;
    iget-wide v4, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_1

    iget-wide v4, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    cmp-long v4, v4, v2

    if-gez v4, :cond_1

    .line 321
    const-string v4, "Settings/Alarms"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "** DISABLE "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v0, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " now "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " set "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    const/4 v4, 0x0

    invoke-static {p0, v0, v4}, Lcom/mediatek/schpwronoff/Alarms;->enableAlarmInternal(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;Z)V

    .line 324
    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 326
    .end local v0           #alarm:Lcom/mediatek/schpwronoff/Alarm;
    :cond_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 328
    :cond_3
    return-void
.end method

.method static disableSnoozeAlert(Landroid/content/Context;I)V
    .locals 5
    .parameter "context"
    .parameter "id"

    .prologue
    const/4 v4, -0x1

    .line 521
    const-string v2, "AlarmClock"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 522
    .local v0, prefs:Landroid/content/SharedPreferences;
    const-string v2, "snooze_id"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 523
    .local v1, snoozeId:I
    if-ne v1, v4, :cond_1

    .line 530
    :cond_0
    :goto_0
    return-void

    .line 526
    :cond_1
    if-ne v1, p1, :cond_0

    .line 528
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/schpwronoff/Alarms;->clearSnoozePreference(Landroid/content/SharedPreferences$Editor;)V

    goto :goto_0
.end method

.method public static enableAlarm(Landroid/content/Context;IZ)V
    .locals 1
    .parameter "context"
    .parameter "id"
    .parameter "enabled"

    .prologue
    .line 229
    invoke-static {p0, p1, p2}, Lcom/mediatek/schpwronoff/Alarms;->enableAlarmInternal(Landroid/content/Context;IZ)V

    .line 230
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 231
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->setNextAlertPowerOn(Landroid/content/Context;)V

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 232
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 233
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->setNextAlertPowerOff(Landroid/content/Context;)V

    goto :goto_0
.end method

.method private static enableAlarmInternal(Landroid/content/Context;IZ)V
    .locals 2
    .parameter "context"
    .parameter "id"
    .parameter "enabled"

    .prologue
    .line 238
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/mediatek/schpwronoff/Alarms;->getAlarm(Landroid/content/ContentResolver;I)Lcom/mediatek/schpwronoff/Alarm;

    move-result-object v0

    .line 239
    .local v0, al:Lcom/mediatek/schpwronoff/Alarm;
    if-eqz v0, :cond_0

    .line 240
    invoke-static {p0, v0, p2}, Lcom/mediatek/schpwronoff/Alarms;->enableAlarmInternal(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;Z)V

    .line 242
    :cond_0
    return-void
.end method

.method private static enableAlarmInternal(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;Z)V
    .locals 8
    .parameter "context"
    .parameter "alarm"
    .parameter "enabled"

    .prologue
    const/4 v7, 0x0

    .line 245
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 247
    .local v0, resolver:Landroid/content/ContentResolver;
    new-instance v3, Landroid/content/ContentValues;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 248
    .local v3, values:Landroid/content/ContentValues;
    const-string v5, "enabled"

    if-eqz p2, :cond_2

    const/4 v4, 0x1

    :goto_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 252
    if-eqz p2, :cond_1

    .line 253
    const-wide/16 v1, 0x0

    .line 254
    .local v1, time:J
    iget-object v4, p1, Lcom/mediatek/schpwronoff/Alarm;->mDaysOfWeek:Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;

    invoke-virtual {v4}, Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;->isRepeatSet()Z

    move-result v4

    if-nez v4, :cond_0

    .line 255
    iget v4, p1, Lcom/mediatek/schpwronoff/Alarm;->mHour:I

    iget v5, p1, Lcom/mediatek/schpwronoff/Alarm;->mMinutes:I

    iget-object v6, p1, Lcom/mediatek/schpwronoff/Alarm;->mDaysOfWeek:Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;

    invoke-static {v4, v5, v6}, Lcom/mediatek/schpwronoff/Alarms;->calculateAlarm(IILcom/mediatek/schpwronoff/Alarm$DaysOfWeek;)Ljava/util/Calendar;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    .line 257
    :cond_0
    iput-wide v1, p1, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    .line 258
    const-string v4, "alarmtime"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 261
    .end local v1           #time:J
    :cond_1
    sget-object v4, Lcom/mediatek/schpwronoff/Alarm$Columns;->CONTENT_URI:Landroid/net/Uri;

    iget v5, p1, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    int-to-long v5, v5

    invoke-static {v4, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v4, v3, v7, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 262
    return-void

    .line 248
    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private static enableAlert(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;J)V
    .locals 9
    .parameter "context"
    .parameter "alarm"
    .parameter "atTimeInMillis"

    .prologue
    const/4 v8, 0x0

    .line 374
    if-nez p1, :cond_0

    .line 408
    :goto_0
    return-void

    .line 377
    :cond_0
    const-string v5, "alarm"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 379
    .local v0, am:Landroid/app/AlarmManager;
    const-string v5, "Settings/Alarms"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "** setAlert id "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p1, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " atTime "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    new-instance v2, Landroid/content/Intent;

    const-class v5, Lcom/mediatek/schpwronoff/SchPwrOffReceiver;

    invoke-direct {v2, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 394
    .local v2, intent:Landroid/content/Intent;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    .line 395
    .local v3, out:Landroid/os/Parcel;
    invoke-virtual {p1, v3, v8}, Lcom/mediatek/schpwronoff/Alarm;->writeToParcel(Landroid/os/Parcel;I)V

    .line 396
    invoke-virtual {v3, v8}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 397
    const-string v5, "intent.extra.alarm_raw"

    invoke-virtual {v3}, Landroid/os/Parcel;->marshall()[B

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 399
    const/high16 v5, 0x1000

    invoke-static {p0, v8, v2, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 401
    .local v4, sender:Landroid/app/PendingIntent;
    const-string v5, "Settings/Alarms"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Alarms.enableAlertPowerOff(): setAlert id "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p1, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " atTime "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    invoke-virtual {v0, v8, p2, p3, v4}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 404
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 405
    .local v1, c:Ljava/util/Calendar;
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, p2, p3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    goto :goto_0
.end method

.method private static enableAlertPowerOn(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;J)V
    .locals 9
    .parameter "context"
    .parameter "alarm"
    .parameter "atTimeInMillis"

    .prologue
    const/4 v8, 0x0

    .line 449
    const-string v5, "alarm"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 451
    .local v0, am:Landroid/app/AlarmManager;
    const-string v5, "Settings/Alarms"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "** setAlert id "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p1, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " atTime "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    new-instance v2, Landroid/content/Intent;

    const-class v5, Lcom/mediatek/schpwronoff/SchPwrOnReceiver;

    invoke-direct {v2, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 466
    .local v2, intent:Landroid/content/Intent;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    .line 467
    .local v3, out:Landroid/os/Parcel;
    invoke-virtual {p1, v3, v8}, Lcom/mediatek/schpwronoff/Alarm;->writeToParcel(Landroid/os/Parcel;I)V

    .line 468
    invoke-virtual {v3, v8}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 469
    const-string v5, "intent.extra.alarm_raw"

    invoke-virtual {v3}, Landroid/os/Parcel;->marshall()[B

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 471
    const/high16 v5, 0x1000

    invoke-static {p0, v8, v2, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 473
    .local v4, sender:Landroid/app/PendingIntent;
    const/4 v5, 0x7

    invoke-virtual {v0, v5, p2, p3, v4}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 474
    const-string v5, "Settings/Alarms"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Alarms.enableAlertPowerOn(): setAlert id "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p1, Lcom/mediatek/schpwronoff/Alarm;->mId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " atTime "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 479
    .local v1, c:Ljava/util/Calendar;
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, p2, p3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 482
    return-void
.end method

.method private static enableSnoozeAlert(Landroid/content/Context;)Z
    .locals 8
    .parameter "context"

    .prologue
    const/4 v5, 0x0

    const/4 v7, -0x1

    .line 546
    const-string v6, "AlarmClock"

    invoke-virtual {p0, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 548
    .local v2, prefs:Landroid/content/SharedPreferences;
    const-string v6, "snooze_id"

    invoke-interface {v2, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 549
    .local v1, id:I
    if-ne v1, v7, :cond_0

    .line 563
    :goto_0
    return v5

    .line 552
    :cond_0
    const-string v5, "snooze_time"

    const-wide/16 v6, -0x1

    invoke-interface {v2, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 555
    .local v3, time:J
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v5, v1}, Lcom/mediatek/schpwronoff/Alarms;->getAlarm(Landroid/content/ContentResolver;I)Lcom/mediatek/schpwronoff/Alarm;

    move-result-object v0

    .line 559
    .local v0, alarm:Lcom/mediatek/schpwronoff/Alarm;
    if-eqz v0, :cond_1

    .line 560
    iput-wide v3, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    .line 562
    :cond_1
    invoke-static {p0, v0, v3, v4}, Lcom/mediatek/schpwronoff/Alarms;->enableAlert(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;J)V

    .line 563
    const/4 v5, 0x1

    goto :goto_0
.end method

.method private static formatDayAndTime(Landroid/content/Context;Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .parameter "context"
    .parameter "c"

    .prologue
    .line 629
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->get24HourMode(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "E k:mm"

    .line 630
    .local v0, format:Ljava/lang/String;
    :goto_0
    if-nez p1, :cond_1

    const-string v1, ""

    :goto_1
    return-object v1

    .line 629
    .end local v0           #format:Ljava/lang/String;
    :cond_0
    const-string v0, "E h:mm aa"

    goto :goto_0

    .line 630
    .restart local v0       #format:Ljava/lang/String;
    :cond_1
    invoke-static {v0, p1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_1
.end method

.method static formatTime(Landroid/content/Context;IILcom/mediatek/schpwronoff/Alarm$DaysOfWeek;)Ljava/lang/String;
    .locals 2
    .parameter "context"
    .parameter "hour"
    .parameter "minute"
    .parameter "daysOfWeek"

    .prologue
    .line 615
    invoke-static {p1, p2, p3}, Lcom/mediatek/schpwronoff/Alarms;->calculateAlarm(IILcom/mediatek/schpwronoff/Alarm$DaysOfWeek;)Ljava/util/Calendar;

    move-result-object v0

    .line 616
    .local v0, c:Ljava/util/Calendar;
    invoke-static {p0, v0}, Lcom/mediatek/schpwronoff/Alarms;->formatTime(Landroid/content/Context;Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static formatTime(Landroid/content/Context;Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .parameter "context"
    .parameter "c"

    .prologue
    .line 621
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->get24HourMode(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "kk:mm"

    .line 622
    .local v0, format:Ljava/lang/String;
    :goto_0
    if-nez p1, :cond_1

    const-string v1, ""

    :goto_1
    return-object v1

    .line 621
    .end local v0           #format:Ljava/lang/String;
    :cond_0
    const-string v0, "h:mm aa"

    goto :goto_0

    .line 622
    .restart local v0       #format:Ljava/lang/String;
    :cond_1
    invoke-static {v0, p1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;Ljava/util/Calendar;)Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_1
.end method

.method static get24HourMode(Landroid/content/Context;)Z
    .locals 1
    .parameter "context"

    .prologue
    .line 644
    invoke-static {p0}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static getAlarm(Landroid/content/ContentResolver;I)Lcom/mediatek/schpwronoff/Alarm;
    .locals 8
    .parameter "contentResolver"
    .parameter "alarmId"

    .prologue
    const/4 v3, 0x0

    .line 164
    sget-object v0, Lcom/mediatek/schpwronoff/Alarm$Columns;->CONTENT_URI:Landroid/net/Uri;

    int-to-long v1, p1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/mediatek/schpwronoff/Alarm$Columns;->ALARM_QUERY_COLUMNS:[Ljava/lang/String;

    move-object v0, p0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 166
    .local v7, cursor:Landroid/database/Cursor;
    const/4 v6, 0x0

    .line 167
    .local v6, alarm:Lcom/mediatek/schpwronoff/Alarm;
    if-eqz v7, :cond_1

    .line 168
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    new-instance v6, Lcom/mediatek/schpwronoff/Alarm;

    .end local v6           #alarm:Lcom/mediatek/schpwronoff/Alarm;
    invoke-direct {v6, v7}, Lcom/mediatek/schpwronoff/Alarm;-><init>(Landroid/database/Cursor;)V

    .line 171
    .restart local v6       #alarm:Lcom/mediatek/schpwronoff/Alarm;
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 173
    :cond_1
    return-object v6
.end method

.method public static getAlarmsCursor(Landroid/content/ContentResolver;)Landroid/database/Cursor;
    .locals 6
    .parameter "contentResolver"

    .prologue
    const/4 v3, 0x0

    .line 141
    sget-object v1, Lcom/mediatek/schpwronoff/Alarm$Columns;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/mediatek/schpwronoff/Alarm$Columns;->ALARM_QUERY_COLUMNS:[Ljava/lang/String;

    const-string v5, "_id ASC"

    move-object v0, p0

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private static getFilteredAlarmsCursor(Landroid/content/ContentResolver;)Landroid/database/Cursor;
    .locals 6
    .parameter "contentResolver"

    .prologue
    const/4 v4, 0x0

    .line 147
    sget-object v1, Lcom/mediatek/schpwronoff/Alarm$Columns;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/mediatek/schpwronoff/Alarm$Columns;->ALARM_QUERY_COLUMNS:[Ljava/lang/String;

    const-string v3, "enabled=1"

    move-object v0, p0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private static getFilteredAlarmsCursor(Landroid/content/ContentResolver;I)Landroid/database/Cursor;
    .locals 6
    .parameter "contentResolver"
    .parameter "alarmId"

    .prologue
    const/4 v4, 0x0

    .line 152
    sget-object v0, Lcom/mediatek/schpwronoff/Alarm$Columns;->CONTENT_URI:Landroid/net/Uri;

    int-to-long v1, p1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/mediatek/schpwronoff/Alarm$Columns;->ALARM_QUERY_COLUMNS:[Ljava/lang/String;

    const-string v3, "enabled=1"

    move-object v0, p0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method static saveNextAlarm(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "timeString"

    .prologue
    .line 637
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "next_alarm_formatted"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 638
    return-void
.end method

.method static saveSnoozeAlert(Landroid/content/Context;IJ)V
    .locals 5
    .parameter "context"
    .parameter "id"
    .parameter "time"

    .prologue
    .line 503
    const-string v2, "Settings/Alarms"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Alarms.saveSnoozeAlert(): id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    const-string v2, "AlarmClock"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 505
    .local v1, prefs:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 506
    .local v0, ed:Landroid/content/SharedPreferences$Editor;
    const/4 v2, -0x1

    if-ne p1, v2, :cond_0

    .line 507
    invoke-static {v0}, Lcom/mediatek/schpwronoff/Alarms;->clearSnoozePreference(Landroid/content/SharedPreferences$Editor;)V

    .line 514
    :goto_0
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->setNextAlert(Landroid/content/Context;)V

    .line 515
    return-void

    .line 509
    :cond_0
    const-string v2, "snooze_id"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 510
    const-string v2, "snooze_time"

    invoke-interface {v0, v2, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 511
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public static setAlarm(Landroid/content/Context;IZIILcom/mediatek/schpwronoff/Alarm$DaysOfWeek;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "context"
    .parameter "id"
    .parameter "enabled"
    .parameter "hour"
    .parameter "minutes"
    .parameter "daysOfWeek"
    .parameter "vibrate"
    .parameter "message"
    .parameter "alert"

    .prologue
    .line 190
    const/16 v1, 0x8

    .line 191
    .local v1, initSize:I
    new-instance v5, Landroid/content/ContentValues;

    const/16 v6, 0x8

    invoke-direct {v5, v6}, Landroid/content/ContentValues;-><init>(I)V

    .line 192
    .local v5, values:Landroid/content/ContentValues;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 195
    .local v2, resolver:Landroid/content/ContentResolver;
    const-wide/16 v3, 0x0

    .line 196
    .local v3, time:J
    invoke-virtual {p5}, Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;->isRepeatSet()Z

    move-result v6

    if-nez v6, :cond_0

    .line 197
    invoke-static {p3, p4, p5}, Lcom/mediatek/schpwronoff/Alarms;->calculateAlarm(IILcom/mediatek/schpwronoff/Alarm$DaysOfWeek;)Ljava/util/Calendar;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    .line 200
    :cond_0
    const-string v6, "Settings/Alarms"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "**  setAlarm * idx "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " hour "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " minutes "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " enabled "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " time "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    const-string v7, "enabled"

    if-eqz p2, :cond_2

    const/4 v6, 0x1

    :goto_0
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v7, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 204
    const-string v6, "hour"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 205
    const-string v6, "minutes"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 206
    const-string v6, "alarmtime"

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 207
    const-string v6, "daysofweek"

    invoke-virtual {p5}, Lcom/mediatek/schpwronoff/Alarm$DaysOfWeek;->getCoded()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 208
    const-string v6, "vibrate"

    invoke-static {p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 209
    const-string v6, "message"

    move-object/from16 v0, p7

    invoke-virtual {v5, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    const-string v6, "alert"

    move-object/from16 v0, p8

    invoke-virtual {v5, v6, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    sget-object v6, Lcom/mediatek/schpwronoff/Alarm$Columns;->CONTENT_URI:Landroid/net/Uri;

    int-to-long v7, p1

    invoke-static {v6, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v2, v6, v5, v7, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 213
    const/4 v6, 0x1

    if-ne p1, v6, :cond_3

    .line 215
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->setNextAlertPowerOn(Landroid/content/Context;)V

    .line 220
    :cond_1
    :goto_1
    return-void

    .line 203
    :cond_2
    const/4 v6, 0x0

    goto :goto_0

    .line 216
    :cond_3
    const/4 v6, 0x2

    if-ne p1, v6, :cond_1

    .line 218
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->setNextAlertPowerOff(Landroid/content/Context;)V

    goto :goto_1
.end method

.method public static setNextAlert(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 337
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/mediatek/schpwronoff/Alarms;->calculateNextAlert(Landroid/content/Context;I)Lcom/mediatek/schpwronoff/Alarm;

    move-result-object v0

    .line 338
    .local v0, alarm:Lcom/mediatek/schpwronoff/Alarm;
    if-nez v0, :cond_0

    .line 339
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->disableAlertPowerOn(Landroid/content/Context;)V

    .line 344
    :goto_0
    const/4 v1, 0x2

    invoke-static {p0, v1}, Lcom/mediatek/schpwronoff/Alarms;->calculateNextAlert(Landroid/content/Context;I)Lcom/mediatek/schpwronoff/Alarm;

    move-result-object v0

    .line 345
    if-nez v0, :cond_1

    .line 346
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->disableAlert(Landroid/content/Context;)V

    .line 350
    :goto_1
    return-void

    .line 341
    :cond_0
    iget-wide v1, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    invoke-static {p0, v0, v1, v2}, Lcom/mediatek/schpwronoff/Alarms;->enableAlertPowerOn(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;J)V

    goto :goto_0

    .line 348
    :cond_1
    iget-wide v1, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    invoke-static {p0, v0, v1, v2}, Lcom/mediatek/schpwronoff/Alarms;->enableAlert(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;J)V

    goto :goto_1
.end method

.method public static setNextAlertPowerOff(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 357
    const/4 v1, 0x2

    invoke-static {p0, v1}, Lcom/mediatek/schpwronoff/Alarms;->calculateNextAlert(Landroid/content/Context;I)Lcom/mediatek/schpwronoff/Alarm;

    move-result-object v0

    .line 358
    .local v0, alarm:Lcom/mediatek/schpwronoff/Alarm;
    if-nez v0, :cond_0

    .line 359
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->disableAlert(Landroid/content/Context;)V

    .line 363
    :goto_0
    return-void

    .line 361
    :cond_0
    iget-wide v1, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    invoke-static {p0, v0, v1, v2}, Lcom/mediatek/schpwronoff/Alarms;->enableAlert(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;J)V

    goto :goto_0
.end method

.method public static setNextAlertPowerOn(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 432
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/mediatek/schpwronoff/Alarms;->calculateNextAlert(Landroid/content/Context;I)Lcom/mediatek/schpwronoff/Alarm;

    move-result-object v0

    .line 433
    .local v0, alarm:Lcom/mediatek/schpwronoff/Alarm;
    if-nez v0, :cond_0

    .line 434
    invoke-static {p0}, Lcom/mediatek/schpwronoff/Alarms;->disableAlertPowerOn(Landroid/content/Context;)V

    .line 438
    :goto_0
    return-void

    .line 436
    :cond_0
    iget-wide v1, v0, Lcom/mediatek/schpwronoff/Alarm;->mTime:J

    invoke-static {p0, v0, v1, v2}, Lcom/mediatek/schpwronoff/Alarms;->enableAlertPowerOn(Landroid/content/Context;Lcom/mediatek/schpwronoff/Alarm;J)V

    goto :goto_0
.end method

.method private static setStatusBarIcon(Landroid/content/Context;Z)V
    .locals 2
    .parameter "context"
    .parameter "enabled"

    .prologue
    .line 570
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.ALARM_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 571
    .local v0, alarmChanged:Landroid/content/Intent;
    const-string v1, "alarmSet"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 572
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 573
    return-void
.end method
