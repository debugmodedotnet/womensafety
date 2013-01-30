.class public Lcom/telerik/WomenSafety/TelerikCallbackActivity;
.super Lorg/apache/cordova/DroidGap;
.source "TelerikCallbackActivity.java"

# interfaces
.implements Lcom/telerik/util/IRefreshableActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/telerik/WomenSafety/TelerikCallbackActivity$TelerikBroadcastReceiver;
    }
.end annotation


# static fields
.field public static isDebug:Z = false

.field static final refreshAction:Ljava/lang/String; = "com.telerik.RefreshWebView"


# instance fields
.field private bootstrapper:Lcom/telerik/util/Bootstrapper;

.field private mistSync:Lcom/telerik/util/MistSync;

.field private receiver:Lcom/telerik/WomenSafety/TelerikCallbackActivity$TelerikBroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    sput-boolean v0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->isDebug:Z

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/apache/cordova/DroidGap;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/telerik/WomenSafety/TelerikCallbackActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->liveSyncFeedback()V

    return-void
.end method

.method static synthetic access$1(Lcom/telerik/WomenSafety/TelerikCallbackActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter

    .prologue
    .line 25
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->root:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method private liveSyncFeedback()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, -0x1

    const/high16 v7, 0x3f80

    .line 83
    const/16 v1, 0xc8

    .line 85
    .local v1, feedbackDuration:I
    const-string v5, "vibrator"

    invoke-virtual {p0, v5}, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Vibrator;

    .line 86
    .local v3, vibrator:Landroid/os/Vibrator;
    int-to-long v5, v1

    invoke-virtual {v3, v5, v6}, Landroid/os/Vibrator;->vibrate(J)V

    .line 88
    new-instance v4, Landroid/view/View;

    invoke-direct {v4, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 89
    .local v4, view:Landroid/view/View;
    invoke-virtual {v4, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 91
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v5, 0x0

    invoke-direct {v0, v7, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 92
    .local v0, alphaAnimation:Landroid/view/animation/AlphaAnimation;
    int-to-long v5, v1

    invoke-virtual {v0, v5, v6}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 93
    invoke-virtual {v0, v9}, Landroid/view/animation/AlphaAnimation;->setFillEnabled(Z)V

    .line 94
    invoke-virtual {v0, v9}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 95
    invoke-virtual {v4, v0}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 97
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 99
    const/16 v6, 0x270f

    .line 100
    invoke-direct {v5, v8, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 97
    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    iget-object v5, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v5, v4}, Lorg/apache/cordova/CordovaWebView;->addView(Landroid/view/View;)V

    .line 104
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 105
    .local v2, myHandler:Landroid/os/Handler;
    new-instance v5, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;

    invoke-direct {v5, p0, v4}, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;-><init>(Lcom/telerik/WomenSafety/TelerikCallbackActivity;Landroid/view/View;)V

    .line 113
    int-to-long v6, v1

    .line 105
    invoke-virtual {v2, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 114
    return-void
.end method


# virtual methods
.method public RefreshWebView()V
    .locals 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->clearCache(Z)V

    .line 67
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->reload()V

    .line 68
    return-void
.end method

.method public init()V
    .locals 2

    .prologue
    .line 61
    invoke-super {p0}, Lorg/apache/cordova/DroidGap;->init()V

    .line 62
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setNavDump(Z)V

    .line 63
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 36
    invoke-super {p0, p1}, Lorg/apache/cordova/DroidGap;->onCreate(Landroid/os/Bundle;)V

    .line 37
    sget-boolean v0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->isDebug:Z

    if-eqz v0, :cond_1

    .line 38
    sput-object p0, Lcom/telerik/util/GlobalContext;->mainActivity:Landroid/app/Activity;

    .line 40
    invoke-virtual {p0}, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->startListening()V

    .line 41
    new-instance v0, Lcom/telerik/util/Bootstrapper;

    invoke-direct {v0}, Lcom/telerik/util/Bootstrapper;-><init>()V

    iput-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->bootstrapper:Lcom/telerik/util/Bootstrapper;

    .line 42
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->bootstrapper:Lcom/telerik/util/Bootstrapper;

    invoke-virtual {v0}, Lcom/telerik/util/Bootstrapper;->checkIfFirstLoad()Z

    move-result v0

    if-nez v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->bootstrapper:Lcom/telerik/util/Bootstrapper;

    invoke-virtual {v0}, Lcom/telerik/util/Bootstrapper;->getIndexUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->loadUrl(Ljava/lang/String;)V

    .line 45
    :cond_0
    new-instance v0, Lcom/telerik/util/MistSync;

    iget-object v1, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->bootstrapper:Lcom/telerik/util/Bootstrapper;

    invoke-direct {v0, v1}, Lcom/telerik/util/MistSync;-><init>(Lcom/telerik/util/Bootstrapper;)V

    iput-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->mistSync:Lcom/telerik/util/MistSync;

    .line 49
    :goto_0
    return-void

    .line 47
    :cond_1
    const-string v0, "file:///android_asset/content/index.html"

    invoke-super {p0, v0}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 52
    invoke-super {p0}, Lorg/apache/cordova/DroidGap;->onDestroy()V

    .line 53
    sget-boolean v0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->isDebug:Z

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->receiver:Lcom/telerik/WomenSafety/TelerikCallbackActivity$TelerikBroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 56
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 72
    sget-boolean v0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->isDebug:Z

    if-eqz v0, :cond_0

    .line 73
    const/16 v0, 0x52

    if-ne p1, v0, :cond_0

    .line 74
    const-string v0, "Telerik"

    const-string v1, "Option key pressed!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->mistSync:Lcom/telerik/util/MistSync;

    invoke-virtual {v0}, Lcom/telerik/util/MistSync;->sync()V

    .line 76
    const/4 v0, 0x1

    .line 79
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lorg/apache/cordova/DroidGap;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public startListening()V
    .locals 3

    .prologue
    .line 119
    new-instance v1, Lcom/telerik/WomenSafety/TelerikCallbackActivity$TelerikBroadcastReceiver;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/telerik/WomenSafety/TelerikCallbackActivity$TelerikBroadcastReceiver;-><init>(Lcom/telerik/WomenSafety/TelerikCallbackActivity;Lcom/telerik/WomenSafety/TelerikCallbackActivity$TelerikBroadcastReceiver;)V

    iput-object v1, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->receiver:Lcom/telerik/WomenSafety/TelerikCallbackActivity$TelerikBroadcastReceiver;

    .line 120
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.telerik.RefreshWebView"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 121
    .local v0, filter:Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->receiver:Lcom/telerik/WomenSafety/TelerikCallbackActivity$TelerikBroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 122
    return-void
.end method
