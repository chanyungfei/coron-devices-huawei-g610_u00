.class Lcom/android/settings_ex/wifi/WifiStatusTest$2;
.super Ljava/lang/Object;
.source "WifiStatusTest.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings_ex/wifi/WifiStatusTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings_ex/wifi/WifiStatusTest;


# direct methods
.method constructor <init>(Lcom/android/settings_ex/wifi/WifiStatusTest;)V
    .locals 0
    .parameter

    .prologue
    .line 172
    iput-object p1, p0, Lcom/android/settings_ex/wifi/WifiStatusTest$2;->this$0:Lcom/android/settings_ex/wifi/WifiStatusTest;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 174
    iget-object v0, p0, Lcom/android/settings_ex/wifi/WifiStatusTest$2;->this$0:Lcom/android/settings_ex/wifi/WifiStatusTest;

    #calls: Lcom/android/settings_ex/wifi/WifiStatusTest;->updatePingState()V
    invoke-static {v0}, Lcom/android/settings_ex/wifi/WifiStatusTest;->access$500(Lcom/android/settings_ex/wifi/WifiStatusTest;)V

    .line 175
    return-void
.end method