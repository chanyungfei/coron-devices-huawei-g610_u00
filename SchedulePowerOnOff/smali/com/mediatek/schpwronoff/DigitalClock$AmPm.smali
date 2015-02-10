.class Lcom/mediatek/schpwronoff/DigitalClock$AmPm;
.super Ljava/lang/Object;
.source "DigitalClock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/schpwronoff/DigitalClock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AmPm"
.end annotation


# instance fields
.field private mAm:Landroid/widget/TextView;

.field private final mAmPmLayout:Landroid/widget/LinearLayout;

.field private final mColorOff:I

.field private final mColorOn:I

.field private mPm:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 3
    .parameter "parent"

    .prologue
    .line 96
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 97
    const v1, 0x7f0a0004

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mAmPmLayout:Landroid/widget/LinearLayout;

    .line 98
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mAmPmLayout:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_0

    .line 99
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mAmPmLayout:Landroid/widget/LinearLayout;

    const v2, 0x7f0a0005

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mAm:Landroid/widget/TextView;

    .line 100
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mAmPmLayout:Landroid/widget/LinearLayout;

    const v2, 0x7f0a0006

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mPm:Landroid/widget/TextView;

    .line 103
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 104
    .local v0, r:Landroid/content/res/Resources;
    const v1, 0x7f060001

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mColorOn:I

    .line 105
    const/high16 v1, 0x7f06

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mColorOff:I

    .line 106
    return-void
.end method


# virtual methods
.method setIsMorning(Z)V
    .locals 3
    .parameter "isMorning"

    .prologue
    .line 116
    new-instance v1, Ljava/text/DateFormatSymbols;

    invoke-direct {v1}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v1}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, ampm:[Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mPm:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    aget-object v1, v0, v1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    return-void

    .line 117
    :cond_0
    const/4 v1, 0x1

    aget-object v1, v0, v1

    goto :goto_0
.end method

.method setShowAmPm(Z)V
    .locals 2
    .parameter "show"

    .prologue
    .line 109
    iget-object v1, p0, Lcom/mediatek/schpwronoff/DigitalClock$AmPm;->mAmPmLayout:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 110
    return-void

    .line 109
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method
