.class public Lorg/apache/cordova/DroidGap;
.super Landroid/app/Activity;
.source "DroidGap.java"

# interfaces
.implements Lorg/apache/cordova/api/CordovaInterface;


# static fields
.field private static ACTIVITY_EXITING:I

.field private static ACTIVITY_RUNNING:I

.field private static ACTIVITY_STARTING:I

.field public static TAG:Ljava/lang/String;


# instance fields
.field protected activityResultCallback:Lorg/apache/cordova/api/CordovaPlugin;

.field protected activityResultKeepRunning:Z

.field private activityState:I

.field protected appView:Lorg/apache/cordova/CordovaWebView;

.field private backgroundColor:I

.field baseUrl:Ljava/lang/String;

.field protected cancelLoadUrl:Z

.field protected keepRunning:Z

.field protected loadUrlTimeoutValue:I

.field protected root:Landroid/widget/LinearLayout;

.field protected spinnerDialog:Landroid/app/ProgressDialog;

.field protected splashDialog:Landroid/app/Dialog;

.field protected splashscreen:I

.field protected splashscreenTime:I

.field private final threadPool:Ljava/util/concurrent/ExecutorService;

.field protected webViewClient:Lorg/apache/cordova/CordovaWebViewClient;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 138
    const-string v0, "DroidGap"

    sput-object v0, Lorg/apache/cordova/DroidGap;->TAG:Ljava/lang/String;

    .line 154
    const/4 v0, 0x0

    sput v0, Lorg/apache/cordova/DroidGap;->ACTIVITY_STARTING:I

    .line 155
    const/4 v0, 0x1

    sput v0, Lorg/apache/cordova/DroidGap;->ACTIVITY_RUNNING:I

    .line 156
    const/4 v0, 0x2

    sput v0, Lorg/apache/cordova/DroidGap;->ACTIVITY_EXITING:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 137
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 145
    iput-boolean v1, p0, Lorg/apache/cordova/DroidGap;->cancelLoadUrl:Z

    .line 146
    iput-object v2, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    .line 147
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/DroidGap;->threadPool:Ljava/util/concurrent/ExecutorService;

    .line 157
    iput v1, p0, Lorg/apache/cordova/DroidGap;->activityState:I

    .line 162
    iput-object v2, p0, Lorg/apache/cordova/DroidGap;->baseUrl:Ljava/lang/String;

    .line 165
    iput-object v2, p0, Lorg/apache/cordova/DroidGap;->activityResultCallback:Lorg/apache/cordova/api/CordovaPlugin;

    .line 170
    const/high16 v0, -0x100

    iput v0, p0, Lorg/apache/cordova/DroidGap;->backgroundColor:I

    .line 178
    iput v1, p0, Lorg/apache/cordova/DroidGap;->splashscreen:I

    .line 179
    iput v1, p0, Lorg/apache/cordova/DroidGap;->splashscreenTime:I

    .line 182
    const/16 v0, 0x4e20

    iput v0, p0, Lorg/apache/cordova/DroidGap;->loadUrlTimeoutValue:I

    .line 187
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/DroidGap;->keepRunning:Z

    return-void
.end method


# virtual methods
.method public addService(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "serviceType"
    .parameter "className"

    .prologue
    .line 721
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    if-eqz v0, :cond_0

    .line 722
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/api/PluginManager;->addService(Ljava/lang/String;Ljava/lang/String;)V

    .line 724
    :cond_0
    return-void
.end method

.method public backHistory()Z
    .locals 1

    .prologue
    .line 459
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 460
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->backHistory()Z

    move-result v0

    .line 462
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public cancelLoadUrl()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 433
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/DroidGap;->cancelLoadUrl:Z

    .line 434
    return-void
.end method

.method public clearAuthenticationTokens()V
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebViewClient;->clearAuthenticationTokens()V

    .line 245
    :cond_0
    return-void
.end method

.method public clearCache()V
    .locals 2

    .prologue
    .line 440
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_0

    .line 441
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->init()V

    .line 443
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->clearCache(Z)V

    .line 444
    return-void
.end method

.method public clearHistory()V
    .locals 1

    .prologue
    .line 450
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->clearHistory()V

    .line 451
    return-void
.end method

.method public displayError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7
    .parameter "title"
    .parameter "message"
    .parameter "button"
    .parameter "exit"

    .prologue
    .line 868
    move-object v2, p0

    .line 869
    .local v2, me:Lorg/apache/cordova/DroidGap;
    new-instance v0, Lorg/apache/cordova/DroidGap$4;

    move-object v1, p0

    move-object v3, p2

    move-object v4, p1

    move-object v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lorg/apache/cordova/DroidGap$4;-><init>(Lorg/apache/cordova/DroidGap;Lorg/apache/cordova/DroidGap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v2, v0}, Lorg/apache/cordova/DroidGap;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 892
    return-void
.end method

.method public endActivity()V
    .locals 1

    .prologue
    .line 772
    sget v0, Lorg/apache/cordova/DroidGap;->ACTIVITY_EXITING:I

    iput v0, p0, Lorg/apache/cordova/DroidGap;->activityState:I

    .line 773
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 774
    return-void
.end method

.method public getActivity()Landroid/app/Activity;
    .locals 0

    .prologue
    .line 296
    return-object p0
.end method

.method public getAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;
    .locals 1
    .parameter "host"
    .parameter "realm"

    .prologue
    .line 232
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    if-eqz v0, :cond_0

    .line 233
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaWebViewClient;->getAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;

    move-result-object v0

    .line 235
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBooleanProperty(Ljava/lang/String;Z)Z
    .locals 5
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 484
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 485
    .local v0, bundle:Landroid/os/Bundle;
    if-nez v0, :cond_1

    .line 503
    .end local p2
    :cond_0
    :goto_0
    return p2

    .line 490
    .restart local p2
    :cond_1
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 500
    .local v2, p:Ljava/lang/Boolean;
    :goto_1
    if-eqz v2, :cond_0

    .line 503
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    goto :goto_0

    .line 491
    .end local v2           #p:Ljava/lang/Boolean;
    :catch_0
    move-exception v1

    .line 492
    .local v1, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 493
    .local v3, s:Ljava/lang/String;
    const-string v4, "true"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 494
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .restart local v2       #p:Ljava/lang/Boolean;
    goto :goto_1

    .line 497
    .end local v2           #p:Ljava/lang/Boolean;
    :cond_2
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .restart local v2       #p:Ljava/lang/Boolean;
    goto :goto_1
.end method

.method public getContext()Landroid/content/Context;
    .locals 2

    .prologue
    .line 936
    sget-object v0, Lorg/apache/cordova/DroidGap;->TAG:Ljava/lang/String;

    const-string v1, "This will be deprecated December 2012"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 937
    return-object p0
.end method

.method public getDoubleProperty(Ljava/lang/String;D)D
    .locals 5
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 557
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 558
    .local v0, bundle:Landroid/os/Bundle;
    if-nez v0, :cond_1

    .line 570
    .end local p2
    :cond_0
    :goto_0
    return-wide p2

    .line 563
    .restart local p2
    :cond_1
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 567
    .local v2, p:Ljava/lang/Double;
    :goto_1
    if-eqz v2, :cond_0

    .line 570
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    goto :goto_0

    .line 564
    .end local v2           #p:Ljava/lang/Double;
    :catch_0
    move-exception v1

    .line 565
    .local v1, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .restart local v2       #p:Ljava/lang/Double;
    goto :goto_1
.end method

.method public getIntegerProperty(Ljava/lang/String;I)I
    .locals 4
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 514
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 515
    .local v0, bundle:Landroid/os/Bundle;
    if-nez v0, :cond_1

    .line 527
    .end local p2
    :cond_0
    :goto_0
    return p2

    .line 520
    .restart local p2
    :cond_1
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 524
    .local v2, p:Ljava/lang/Integer;
    :goto_1
    if-eqz v2, :cond_0

    .line 527
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    goto :goto_0

    .line 521
    .end local v2           #p:Ljava/lang/Integer;
    :catch_0
    move-exception v1

    .line 522
    .local v1, e:Ljava/lang/ClassCastException;
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .restart local v2       #p:Ljava/lang/Integer;
    goto :goto_1
.end method

.method public getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 538
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 539
    .local v0, bundle:Landroid/os/Bundle;
    if-nez v0, :cond_1

    .line 546
    .end local p2
    :cond_0
    :goto_0
    return-object p2

    .line 542
    .restart local p2
    :cond_1
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 543
    .local v1, p:Ljava/lang/String;
    if-eqz v1, :cond_0

    move-object p2, v1

    .line 546
    goto :goto_0
.end method

.method public getThreadPool()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 1092
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->threadPool:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public init()V
    .locals 4

    .prologue
    .line 303
    new-instance v0, Lorg/apache/cordova/CordovaWebView;

    invoke-direct {v0, p0}, Lorg/apache/cordova/CordovaWebView;-><init>(Landroid/content/Context;)V

    .line 305
    .local v0, webView:Lorg/apache/cordova/CordovaWebView;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-ge v2, v3, :cond_0

    .line 307
    new-instance v1, Lorg/apache/cordova/CordovaWebViewClient;

    invoke-direct {v1, p0, v0}, Lorg/apache/cordova/CordovaWebViewClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .line 313
    .local v1, webViewClient:Lorg/apache/cordova/CordovaWebViewClient;
    :goto_0
    new-instance v2, Lorg/apache/cordova/CordovaChromeClient;

    invoke-direct {v2, p0, v0}, Lorg/apache/cordova/CordovaChromeClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/cordova/DroidGap;->init(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaWebViewClient;Lorg/apache/cordova/CordovaChromeClient;)V

    .line 314
    return-void

    .line 311
    .end local v1           #webViewClient:Lorg/apache/cordova/CordovaWebViewClient;
    :cond_0
    new-instance v1, Lorg/apache/cordova/IceCreamCordovaWebViewClient;

    invoke-direct {v1, p0, v0}, Lorg/apache/cordova/IceCreamCordovaWebViewClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    .restart local v1       #webViewClient:Lorg/apache/cordova/CordovaWebViewClient;
    goto :goto_0
.end method

.method public init(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaWebViewClient;Lorg/apache/cordova/CordovaChromeClient;)V
    .locals 4
    .parameter "webView"
    .parameter "webViewClient"
    .parameter "webChromeClient"

    .prologue
    const/4 v3, -0x1

    .line 324
    sget-object v0, Lorg/apache/cordova/DroidGap;->TAG:Ljava/lang/String;

    const-string v1, "DroidGap.init()"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    iput-object p1, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    .line 328
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->setId(I)V

    .line 330
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p2}, Lorg/apache/cordova/CordovaWebView;->setWebViewClient(Lorg/apache/cordova/CordovaWebViewClient;)V

    .line 331
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p3}, Lorg/apache/cordova/CordovaWebView;->setWebChromeClient(Lorg/apache/cordova/CordovaChromeClient;)V

    .line 332
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {p2, v0}, Lorg/apache/cordova/CordovaWebViewClient;->setWebView(Lorg/apache/cordova/CordovaWebView;)V

    .line 333
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {p3, v0}, Lorg/apache/cordova/CordovaChromeClient;->setWebView(Lorg/apache/cordova/CordovaWebView;)V

    .line 335
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f80

    invoke-direct {v1, v3, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 341
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->setVisibility(I)V

    .line 342
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 343
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lorg/apache/cordova/DroidGap;->setContentView(Landroid/view/View;)V

    .line 346
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/DroidGap;->cancelLoadUrl:Z

    .line 347
    return-void
.end method

.method public isUrlWhiteListed(Ljava/lang/String;)Z
    .locals 1
    .parameter "url"

    .prologue
    .line 902
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 903
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaWebView;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v0

    .line 905
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method loadSpinner()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 380
    const/4 v1, 0x0

    .line 381
    .local v1, loading:Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v4}, Lorg/apache/cordova/CordovaWebView;->canGoBack()Z

    move-result v4

    if-nez v4, :cond_3

    .line 382
    :cond_0
    const-string v4, "loadingDialog"

    invoke-virtual {p0, v4, v5}, Lorg/apache/cordova/DroidGap;->getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 387
    :goto_0
    if-eqz v1, :cond_2

    .line 389
    const-string v3, ""

    .line 390
    .local v3, title:Ljava/lang/String;
    const-string v2, "Loading Application..."

    .line 392
    .local v2, message:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 393
    const/16 v4, 0x2c

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 394
    .local v0, comma:I
    if-lez v0, :cond_4

    .line 395
    const/4 v4, 0x0

    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 396
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 403
    .end local v0           #comma:I
    :cond_1
    :goto_1
    invoke-virtual {p0, v3, v2}, Lorg/apache/cordova/DroidGap;->spinnerStart(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    .end local v2           #message:Ljava/lang/String;
    .end local v3           #title:Ljava/lang/String;
    :cond_2
    return-void

    .line 385
    :cond_3
    const-string v4, "loadingPageDialog"

    invoke-virtual {p0, v4, v5}, Lorg/apache/cordova/DroidGap;->getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 399
    .restart local v0       #comma:I
    .restart local v2       #message:Ljava/lang/String;
    .restart local v3       #title:Ljava/lang/String;
    :cond_4
    const-string v3, ""

    .line 400
    move-object v2, v1

    goto :goto_1
.end method

.method public loadUrl(Ljava/lang/String;)V
    .locals 2
    .parameter "url"

    .prologue
    .line 357
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_0

    .line 358
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->init()V

    .line 362
    :cond_0
    const-string v0, "backgroundColor"

    const/high16 v1, -0x100

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->getIntegerProperty(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/DroidGap;->backgroundColor:I

    .line 363
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->root:Landroid/widget/LinearLayout;

    iget v1, p0, Lorg/apache/cordova/DroidGap;->backgroundColor:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 366
    const-string v0, "keepRunning"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->getBooleanProperty(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/cordova/DroidGap;->keepRunning:Z

    .line 369
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->loadSpinner()V

    .line 371
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 372
    return-void
.end method

.method public loadUrl(Ljava/lang/String;I)V
    .locals 2
    .parameter "url"
    .parameter "time"

    .prologue
    .line 417
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-nez v0, :cond_0

    .line 418
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->init()V

    .line 421
    :cond_0
    iput p2, p0, Lorg/apache/cordova/DroidGap;->splashscreenTime:I

    .line 422
    const-string v0, "splashscreen"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/DroidGap;->getIntegerProperty(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/cordova/DroidGap;->splashscreen:I

    .line 423
    iget v0, p0, Lorg/apache/cordova/DroidGap;->splashscreenTime:I

    invoke-virtual {p0, v0}, Lorg/apache/cordova/DroidGap;->showSplashScreen(I)V

    .line 424
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;I)V

    .line 425
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    .line 809
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 810
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->activityResultCallback:Lorg/apache/cordova/api/CordovaPlugin;

    .line 811
    .local v0, callback:Lorg/apache/cordova/api/CordovaPlugin;
    if-eqz v0, :cond_0

    .line 812
    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/api/CordovaPlugin;->onActivityResult(IILandroid/content/Intent;)V

    .line 814
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter "newConfig"

    .prologue
    .line 473
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 474
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const/16 v9, 0x800

    const/16 v8, 0x400

    const/4 v7, 0x1

    const/4 v5, 0x0

    const/4 v6, -0x1

    .line 257
    sget-object v3, Lorg/apache/cordova/DroidGap;->TAG:Ljava/lang/String;

    const-string v4, "DroidGap.onCreate()"

    invoke-static {v3, v4}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 260
    const-string v3, "showTitle"

    invoke-virtual {p0, v3, v5}, Lorg/apache/cordova/DroidGap;->getBooleanProperty(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_0

    .line 262
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v7}, Landroid/view/Window;->requestFeature(I)Z

    .line 265
    :cond_0
    const-string v3, "setFullscreen"

    invoke-virtual {p0, v3, v5}, Lorg/apache/cordova/DroidGap;->getBooleanProperty(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 267
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v8, v8}, Landroid/view/Window;->setFlags(II)V

    .line 276
    :goto_0
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 277
    .local v0, display:Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v2

    .line 278
    .local v2, width:I
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v1

    .line 280
    .local v1, height:I
    new-instance v3, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;

    invoke-direct {v3, p0, v2, v1}, Lorg/apache/cordova/LinearLayoutSoftKeyboardDetect;-><init>(Landroid/content/Context;II)V

    iput-object v3, p0, Lorg/apache/cordova/DroidGap;->root:Landroid/widget/LinearLayout;

    .line 281
    iget-object v3, p0, Lorg/apache/cordova/DroidGap;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 282
    iget-object v3, p0, Lorg/apache/cordova/DroidGap;->root:Landroid/widget/LinearLayout;

    iget v4, p0, Lorg/apache/cordova/DroidGap;->backgroundColor:I

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 283
    iget-object v3, p0, Lorg/apache/cordova/DroidGap;->root:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x0

    invoke-direct {v4, v6, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 287
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lorg/apache/cordova/DroidGap;->setVolumeControlStream(I)V

    .line 288
    return-void

    .line 272
    .end local v0           #display:Landroid/view/Display;
    .end local v1           #height:I
    .end local v2           #width:I
    :cond_1
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v9, v9}, Landroid/view/Window;->setFlags(II)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 914
    const-string v0, "onCreateOptionsMenu"

    invoke-virtual {p0, v0, p1}, Lorg/apache/cordova/DroidGap;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 915
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 685
    sget-object v0, Lorg/apache/cordova/DroidGap;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 686
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 689
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->removeSplashScreen()V

    .line 691
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 692
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->handleDestroy()V

    .line 697
    :goto_0
    return-void

    .line 695
    :cond_0
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->endActivity()V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 1040
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView$HitTestResult;->getType()I

    move-result v0

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 1043
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaWebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 1046
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x4

    .line 1018
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView$HitTestResult;->getType()I

    move-result v0

    const/16 v1, 0x9

    if-ne v0, v1, :cond_1

    if-eq p1, v2, :cond_0

    const/16 v0, 0x52

    if-ne p1, v0, :cond_1

    .line 1021
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaWebView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 1025
    :goto_0
    return v0

    .line 1022
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->isCustomViewShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    if-ne p1, v2, :cond_2

    .line 1023
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaWebView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0

    .line 1025
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .parameter "id"
    .parameter "data"

    .prologue
    const/4 v5, 0x0

    .line 1058
    sget-object v2, Lorg/apache/cordova/DroidGap;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onMessage("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1059
    const-string v2, "splashscreen"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1060
    const-string v2, "hide"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1061
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->removeSplashScreen()V

    .line 1088
    :cond_0
    :goto_0
    const/4 v2, 0x0

    return-object v2

    .line 1065
    :cond_1
    iget-object v2, p0, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1066
    const-string v2, "splashscreen"

    invoke-virtual {p0, v2, v5}, Lorg/apache/cordova/DroidGap;->getIntegerProperty(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/DroidGap;->splashscreen:I

    .line 1067
    iget v2, p0, Lorg/apache/cordova/DroidGap;->splashscreenTime:I

    invoke-virtual {p0, v2}, Lorg/apache/cordova/DroidGap;->showSplashScreen(I)V

    goto :goto_0

    .line 1071
    :cond_2
    const-string v2, "spinner"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1072
    const-string v2, "stop"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1073
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->spinnerStop()V

    .line 1074
    iget-object v2, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v2, v5}, Lorg/apache/cordova/CordovaWebView;->setVisibility(I)V

    goto :goto_0

    .line 1077
    :cond_3
    const-string v2, "onReceivedError"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    move-object v0, p2

    .line 1078
    check-cast v0, Lorg/json/JSONObject;

    .line 1080
    .local v0, d:Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "errorCode"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "description"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "url"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/cordova/DroidGap;->onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1081
    :catch_0
    move-exception v1

    .line 1082
    .local v1, e:Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 1085
    .end local v0           #d:Lorg/json/JSONObject;
    .end local v1           #e:Lorg/json/JSONException;
    :cond_4
    const-string v2, "exit"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1086
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->endActivity()V

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 1
    .parameter "intent"

    .prologue
    .line 644
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 646
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 647
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaWebView;->onNewIntent(Landroid/content/Intent;)V

    .line 648
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 926
    const-string v0, "onOptionsItemSelected"

    invoke-virtual {p0, v0, p1}, Lorg/apache/cordova/DroidGap;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 927
    const/4 v0, 0x1

    return v0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 618
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 620
    sget-object v0, Lorg/apache/cordova/DroidGap;->TAG:Ljava/lang/String;

    const-string v1, "Paused the application!"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    iget v0, p0, Lorg/apache/cordova/DroidGap;->activityState:I

    sget v1, Lorg/apache/cordova/DroidGap;->ACTIVITY_EXITING:I

    if-ne v0, v1, :cond_1

    .line 637
    :cond_0
    :goto_0
    return-void

    .line 627
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 632
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-boolean v1, p0, Lorg/apache/cordova/DroidGap;->keepRunning:Z

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->handlePause(Z)V

    .line 636
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->removeSplashScreen()V

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 920
    const-string v0, "onPrepareOptionsMenu"

    invoke-virtual {p0, v0, p1}, Lorg/apache/cordova/DroidGap;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 921
    const/4 v0, 0x1

    return v0
.end method

.method public onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "errorCode"
    .parameter "description"
    .parameter "failingUrl"

    .prologue
    .line 829
    move-object v3, p0

    .line 832
    .local v3, me:Lorg/apache/cordova/DroidGap;
    const-string v0, "errorUrl"

    const/4 v1, 0x0

    invoke-virtual {v3, v0, v1}, Lorg/apache/cordova/DroidGap;->getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 833
    .local v6, errorUrl:Ljava/lang/String;
    if-eqz v6, :cond_1

    const-string v0, "file://"

    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, v3, Lorg/apache/cordova/DroidGap;->baseUrl:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, v6}, Lorg/apache/cordova/CordovaWebView;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 836
    new-instance v0, Lorg/apache/cordova/DroidGap$2;

    invoke-direct {v0, p0, v3, v6}, Lorg/apache/cordova/DroidGap$2;-><init>(Lorg/apache/cordova/DroidGap;Lorg/apache/cordova/DroidGap;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/cordova/DroidGap;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 857
    :goto_0
    return-void

    .line 846
    :cond_1
    const/4 v0, -0x2

    if-eq p1, v0, :cond_2

    const/4 v2, 0x1

    .line 847
    .local v2, exit:Z
    :goto_1
    new-instance v0, Lorg/apache/cordova/DroidGap$3;

    move-object v1, p0

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/cordova/DroidGap$3;-><init>(Lorg/apache/cordova/DroidGap;ZLorg/apache/cordova/DroidGap;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/cordova/DroidGap;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 846
    .end local v2           #exit:Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 655
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 657
    sget-object v0, Lorg/apache/cordova/DroidGap;->TAG:Ljava/lang/String;

    const-string v1, "Resuming the App"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 658
    iget v0, p0, Lorg/apache/cordova/DroidGap;->activityState:I

    sget v1, Lorg/apache/cordova/DroidGap;->ACTIVITY_STARTING:I

    if-ne v0, v1, :cond_1

    .line 659
    sget v0, Lorg/apache/cordova/DroidGap;->ACTIVITY_RUNNING:I

    iput v0, p0, Lorg/apache/cordova/DroidGap;->activityState:I

    .line 678
    :cond_0
    :goto_0
    return-void

    .line 663
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 667
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-boolean v1, p0, Lorg/apache/cordova/DroidGap;->keepRunning:Z

    iget-boolean v2, p0, Lorg/apache/cordova/DroidGap;->activityResultKeepRunning:Z

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaWebView;->handleResume(ZZ)V

    .line 670
    iget-boolean v0, p0, Lorg/apache/cordova/DroidGap;->keepRunning:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lorg/apache/cordova/DroidGap;->activityResultKeepRunning:Z

    if-eqz v0, :cond_0

    .line 673
    :cond_2
    iget-boolean v0, p0, Lorg/apache/cordova/DroidGap;->activityResultKeepRunning:Z

    if-eqz v0, :cond_0

    .line 674
    iget-boolean v0, p0, Lorg/apache/cordova/DroidGap;->activityResultKeepRunning:Z

    iput-boolean v0, p0, Lorg/apache/cordova/DroidGap;->keepRunning:Z

    .line 675
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/DroidGap;->activityResultKeepRunning:Z

    goto :goto_0
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .parameter "id"
    .parameter "data"

    .prologue
    .line 706
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 707
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 709
    :cond_0
    return-void
.end method

.method public removeAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;
    .locals 1
    .parameter "host"
    .parameter "realm"

    .prologue
    .line 211
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaWebViewClient;->removeAuthenticationToken(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/cordova/AuthenticationToken;

    move-result-object v0

    .line 214
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeSplashScreen()V
    .locals 1

    .prologue
    .line 962
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 963
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 964
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/DroidGap;->splashDialog:Landroid/app/Dialog;

    .line 966
    :cond_0
    return-void
.end method

.method public sendJavascript(Ljava/lang/String;)V
    .locals 1
    .parameter "statement"

    .prologue
    .line 733
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 734
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/NativeToJsMessageQueue;->addJavaScript(Ljava/lang/String;)V

    .line 736
    :cond_0
    return-void
.end method

.method public setActivityResultCallback(Lorg/apache/cordova/api/CordovaPlugin;)V
    .locals 0
    .parameter "plugin"

    .prologue
    .line 817
    iput-object p1, p0, Lorg/apache/cordova/DroidGap;->activityResultCallback:Lorg/apache/cordova/api/CordovaPlugin;

    .line 818
    return-void
.end method

.method public setAuthenticationToken(Lorg/apache/cordova/AuthenticationToken;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "authenticationToken"
    .parameter "host"
    .parameter "realm"

    .prologue
    .line 197
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    iget-object v0, v0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/cordova/CordovaWebViewClient;->setAuthenticationToken(Lorg/apache/cordova/AuthenticationToken;Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    :cond_0
    return-void
.end method

.method public setBooleanProperty(Ljava/lang/String;Z)V
    .locals 1
    .parameter "name"
    .parameter "value"

    .prologue
    .line 580
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 581
    return-void
.end method

.method public setDoubleProperty(Ljava/lang/String;D)V
    .locals 1
    .parameter "name"
    .parameter "value"

    .prologue
    .line 610
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 611
    return-void
.end method

.method public setIntegerProperty(Ljava/lang/String;I)V
    .locals 1
    .parameter "name"
    .parameter "value"

    .prologue
    .line 590
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 591
    return-void
.end method

.method public setStringProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "name"
    .parameter "value"

    .prologue
    .line 600
    invoke-virtual {p0}, Lorg/apache/cordova/DroidGap;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 601
    return-void
.end method

.method protected showSplashScreen(I)V
    .locals 2
    .parameter "time"

    .prologue
    .line 973
    move-object v1, p0

    .line 975
    .local v1, that:Lorg/apache/cordova/DroidGap;
    new-instance v0, Lorg/apache/cordova/DroidGap$5;

    invoke-direct {v0, p0, v1, p1}, Lorg/apache/cordova/DroidGap$5;-><init>(Lorg/apache/cordova/DroidGap;Lorg/apache/cordova/DroidGap;I)V

    .line 1011
    .local v0, runnable:Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/DroidGap;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1012
    return-void
.end method

.method public showWebPage(Ljava/lang/String;ZZLjava/util/HashMap;)V
    .locals 1
    .parameter "url"
    .parameter "openExternal"
    .parameter "clearHistory"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZ",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 951
    .local p4, params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 952
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->appView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/apache/cordova/CordovaWebView;->showWebPage(Ljava/lang/String;ZZLjava/util/HashMap;)V

    .line 954
    :cond_0
    return-void
.end method

.method public spinnerStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "title"
    .parameter "message"

    .prologue
    const/4 v3, 0x1

    .line 745
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 746
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 747
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    .line 749
    :cond_0
    move-object v6, p0

    .line 750
    .local v6, me:Lorg/apache/cordova/DroidGap;
    new-instance v5, Lorg/apache/cordova/DroidGap$1;

    invoke-direct {v5, p0, v6}, Lorg/apache/cordova/DroidGap$1;-><init>(Lorg/apache/cordova/DroidGap;Lorg/apache/cordova/DroidGap;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    .line 756
    return-void
.end method

.method public spinnerStop()V
    .locals 1

    .prologue
    .line 762
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 763
    iget-object v0, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 764
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/cordova/DroidGap;->spinnerDialog:Landroid/app/ProgressDialog;

    .line 766
    :cond_0
    return-void
.end method

.method public startActivityForResult(Lorg/apache/cordova/api/CordovaPlugin;Landroid/content/Intent;I)V
    .locals 1
    .parameter "command"
    .parameter "intent"
    .parameter "requestCode"

    .prologue
    .line 786
    iput-object p1, p0, Lorg/apache/cordova/DroidGap;->activityResultCallback:Lorg/apache/cordova/api/CordovaPlugin;

    .line 787
    iget-boolean v0, p0, Lorg/apache/cordova/DroidGap;->keepRunning:Z

    iput-boolean v0, p0, Lorg/apache/cordova/DroidGap;->activityResultKeepRunning:Z

    .line 790
    if-eqz p1, :cond_0

    .line 791
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/DroidGap;->keepRunning:Z

    .line 795
    :cond_0
    invoke-super {p0, p2, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 796
    return-void
.end method
