.class public Lorg/apache/cordova/CordovaWebView;
.super Landroid/webkit/WebView;
.source "CordovaWebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/cordova/CordovaWebView$Level16Apis;
    }
.end annotation


# static fields
.field static final COVER_SCREEN_GRAVITY_CENTER:Landroid/widget/FrameLayout$LayoutParams; = null

.field public static final TAG:Ljava/lang/String; = "CordovaWebView"


# instance fields
.field baseUrl:Ljava/lang/String;

.field private bound:Z

.field private chromeClient:Lorg/apache/cordova/CordovaChromeClient;

.field private cordova:Lorg/apache/cordova/api/CordovaInterface;

.field exposedJsApi:Lorg/apache/cordova/ExposedJsApi;

.field private handleButton:Z

.field jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

.field private keyDownCodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private keyUpCodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private lastMenuEventTime:J

.field loadUrlTimeout:I

.field private mCustomView:Landroid/view/View;

.field private mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private paused:Z

.field public pluginManager:Lorg/apache/cordova/api/PluginManager;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private url:Ljava/lang/String;

.field private urls:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field useBrowserHistory:Z

.field viewClient:Lorg/apache/cordova/CordovaWebViewClient;

.field private whiteList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field

.field private whiteListCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 106
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x11

    invoke-direct {v0, v2, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    sput-object v0, Lorg/apache/cordova/CordovaWebView;->COVER_SCREEN_GRAVITY_CENTER:Landroid/widget/FrameLayout$LayoutParams;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 118
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->whiteListCache:Ljava/util/HashMap;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyDownCodes:Ljava/util/ArrayList;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyUpCodes:Ljava/util/ArrayList;

    .line 86
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->useBrowserHistory:Z

    .line 91
    iput v1, p0, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    .line 95
    iput-boolean v1, p0, Lorg/apache/cordova/CordovaWebView;->handleButton:Z

    .line 97
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/CordovaWebView;->lastMenuEventTime:J

    .line 119
    const-class v0, Lorg/apache/cordova/api/CordovaInterface;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    check-cast p1, Lorg/apache/cordova/api/CordovaInterface;

    .end local p1
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    .line 127
    :goto_0
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->loadConfiguration()V

    .line 128
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->setup()V

    .line 129
    return-void

    .line 125
    .restart local p1
    :cond_0
    const-string v0, "CordovaWebView"

    const-string v1, "Your activity must implement CordovaInterface to work"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v1, 0x0

    .line 138
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->whiteListCache:Ljava/util/HashMap;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyDownCodes:Ljava/util/ArrayList;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyUpCodes:Ljava/util/ArrayList;

    .line 86
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->useBrowserHistory:Z

    .line 91
    iput v1, p0, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    .line 95
    iput-boolean v1, p0, Lorg/apache/cordova/CordovaWebView;->handleButton:Z

    .line 97
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/CordovaWebView;->lastMenuEventTime:J

    .line 139
    const-class v0, Lorg/apache/cordova/api/CordovaInterface;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    check-cast p1, Lorg/apache/cordova/api/CordovaInterface;

    .end local p1
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    .line 147
    :goto_0
    new-instance v0, Lorg/apache/cordova/CordovaChromeClient;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v0, v1, p0}, Lorg/apache/cordova/CordovaChromeClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->setWebChromeClient(Lorg/apache/cordova/CordovaChromeClient;)V

    .line 148
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {p0, v0}, Lorg/apache/cordova/CordovaWebView;->initWebViewClient(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 149
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->loadConfiguration()V

    .line 150
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->setup()V

    .line 151
    return-void

    .line 145
    .restart local p1
    :cond_0
    const-string v0, "CordovaWebView"

    const-string v1, "Your activity must implement CordovaInterface to work"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v1, 0x0

    .line 162
    invoke-direct {p0, p1, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->whiteListCache:Ljava/util/HashMap;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyDownCodes:Ljava/util/ArrayList;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyUpCodes:Ljava/util/ArrayList;

    .line 86
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->useBrowserHistory:Z

    .line 91
    iput v1, p0, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    .line 95
    iput-boolean v1, p0, Lorg/apache/cordova/CordovaWebView;->handleButton:Z

    .line 97
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/CordovaWebView;->lastMenuEventTime:J

    .line 163
    const-class v0, Lorg/apache/cordova/api/CordovaInterface;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    check-cast p1, Lorg/apache/cordova/api/CordovaInterface;

    .end local p1
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    .line 171
    :goto_0
    new-instance v0, Lorg/apache/cordova/CordovaChromeClient;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v0, v1, p0}, Lorg/apache/cordova/CordovaChromeClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->setWebChromeClient(Lorg/apache/cordova/CordovaChromeClient;)V

    .line 172
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->loadConfiguration()V

    .line 173
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->setup()V

    .line 174
    return-void

    .line 169
    .restart local p1
    :cond_0
    const-string v0, "CordovaWebView"

    const-string v1, "Your activity must implement CordovaInterface to work"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IZ)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"
    .parameter "privateBrowsing"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 186
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IZ)V

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->whiteListCache:Ljava/util/HashMap;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyDownCodes:Ljava/util/ArrayList;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyUpCodes:Ljava/util/ArrayList;

    .line 86
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->useBrowserHistory:Z

    .line 91
    iput v1, p0, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    .line 95
    iput-boolean v1, p0, Lorg/apache/cordova/CordovaWebView;->handleButton:Z

    .line 97
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/cordova/CordovaWebView;->lastMenuEventTime:J

    .line 187
    const-class v0, Lorg/apache/cordova/api/CordovaInterface;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    check-cast p1, Lorg/apache/cordova/api/CordovaInterface;

    .end local p1
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    .line 195
    :goto_0
    new-instance v0, Lorg/apache/cordova/CordovaChromeClient;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v0, v1}, Lorg/apache/cordova/CordovaChromeClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;)V

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->setWebChromeClient(Lorg/apache/cordova/CordovaChromeClient;)V

    .line 196
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {p0, v0}, Lorg/apache/cordova/CordovaWebView;->initWebViewClient(Lorg/apache/cordova/api/CordovaInterface;)V

    .line 197
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->loadConfiguration()V

    .line 198
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->setup()V

    .line 199
    return-void

    .line 193
    .restart local p1
    :cond_0
    const-string v0, "CordovaWebView"

    const-string v1, "Your activity must implement CordovaInterface to work"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/apache/cordova/CordovaWebView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->updateUserAgentString()V

    return-void
.end method

.method static synthetic access$100(Lorg/apache/cordova/CordovaWebView;)Lorg/apache/cordova/api/CordovaInterface;
    .locals 1
    .parameter "x0"

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    return-object v0
.end method

.method private exposeJsInterface()V
    .locals 2

    .prologue
    .line 276
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    if-ge v0, v1, :cond_0

    .line 277
    const-string v0, "CordovaWebView"

    const-string v1, "Disabled addJavascriptInterface() bridge since Android version is old."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    :goto_0
    return-void

    .line 282
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_1

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v1, "unknown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 284
    const-string v0, "CordovaWebView"

    const-string v1, "Disabled addJavascriptInterface() bridge callback due to a bug on the 2.3 emulator"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 287
    :cond_1
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->exposedJsApi:Lorg/apache/cordova/ExposedJsApi;

    const-string v1, "_cordovaNative"

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/CordovaWebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private initWebViewClient(Lorg/apache/cordova/api/CordovaInterface;)V
    .locals 2
    .parameter "cordova"

    .prologue
    .line 203
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 205
    new-instance v0, Lorg/apache/cordova/CordovaWebViewClient;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v0, v1, p0}, Lorg/apache/cordova/CordovaWebViewClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->setWebViewClient(Lorg/apache/cordova/CordovaWebViewClient;)V

    .line 211
    :goto_0
    return-void

    .line 209
    :cond_0
    new-instance v0, Lorg/apache/cordova/IceCreamCordovaWebViewClient;

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v0, v1, p0}, Lorg/apache/cordova/IceCreamCordovaWebViewClient;-><init>(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->setWebViewClient(Lorg/apache/cordova/CordovaWebViewClient;)V

    goto :goto_0
.end method

.method private loadConfiguration()V
    .locals 14

    .prologue
    .line 691
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const-string v11, "config"

    const-string v12, "xml"

    iget-object v13, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v11, v12, v13}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 692
    .local v2, id:I
    if-nez v2, :cond_0

    .line 694
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const-string v11, "cordova"

    const-string v12, "xml"

    iget-object v13, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v11, v12, v13}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 695
    const-string v10, "CordovaLog"

    const-string v11, "config.xml missing, reverting to cordova.xml"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 697
    :cond_0
    if-nez v2, :cond_2

    .line 698
    const-string v10, "CordovaLog"

    const-string v11, "cordova.xml missing. Ignoring..."

    invoke-static {v10, v11}, Lorg/apache/cordova/api/LOG;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 751
    :cond_1
    :goto_0
    return-void

    .line 701
    :cond_2
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10, v2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v9

    .line 702
    .local v9, xml:Landroid/content/res/XmlResourceParser;
    const/4 v1, -0x1

    .line 703
    .local v1, eventType:I
    :goto_1
    const/4 v10, 0x1

    if-eq v1, v10, :cond_7

    .line 704
    const/4 v10, 0x2

    if-ne v1, v10, :cond_3

    .line 705
    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 706
    .local v6, strNode:Ljava/lang/String;
    const-string v10, "access"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 707
    const/4 v10, 0x0

    const-string v11, "origin"

    invoke-interface {v9, v10, v11}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 708
    .local v5, origin:Ljava/lang/String;
    const/4 v10, 0x0

    const-string v11, "subdomains"

    invoke-interface {v9, v10, v11}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 709
    .local v7, subdomains:Ljava/lang/String;
    if-eqz v5, :cond_3

    .line 710
    if-eqz v7, :cond_4

    const-string v10, "true"

    invoke-virtual {v7, v10}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_4

    const/4 v10, 0x1

    :goto_2
    invoke-virtual {p0, v5, v10}, Lorg/apache/cordova/CordovaWebView;->addWhiteListEntry(Ljava/lang/String;Z)V

    .line 732
    .end local v5           #origin:Ljava/lang/String;
    .end local v6           #strNode:Ljava/lang/String;
    .end local v7           #subdomains:Ljava/lang/String;
    :cond_3
    :goto_3
    :try_start_0
    invoke-interface {v9}, Landroid/content/res/XmlResourceParser;->next()I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    goto :goto_1

    .line 710
    .restart local v5       #origin:Ljava/lang/String;
    .restart local v6       #strNode:Ljava/lang/String;
    .restart local v7       #subdomains:Ljava/lang/String;
    :cond_4
    const/4 v10, 0x0

    goto :goto_2

    .line 713
    .end local v5           #origin:Ljava/lang/String;
    .end local v7           #subdomains:Ljava/lang/String;
    :cond_5
    const-string v10, "log"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 714
    const/4 v10, 0x0

    const-string v11, "level"

    invoke-interface {v9, v10, v11}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 715
    .local v3, level:Ljava/lang/String;
    const-string v10, "CordovaLog"

    const-string v11, "Found log level %s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v12, v13

    invoke-static {v10, v11, v12}, Lorg/apache/cordova/api/LOG;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 716
    if-eqz v3, :cond_3

    .line 717
    invoke-static {v3}, Lorg/apache/cordova/api/LOG;->setLogLevel(Ljava/lang/String;)V

    goto :goto_3

    .line 720
    .end local v3           #level:Ljava/lang/String;
    :cond_6
    const-string v10, "preference"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 721
    const/4 v10, 0x0

    const-string v11, "name"

    invoke-interface {v9, v10, v11}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 722
    .local v4, name:Ljava/lang/String;
    const/4 v10, 0x0

    const-string v11, "value"

    invoke-interface {v9, v10, v11}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 724
    .local v8, value:Ljava/lang/String;
    const-string v10, "CordovaLog"

    const-string v11, "Found preference for %s=%s"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v4, v12, v13

    const/4 v13, 0x1

    aput-object v8, v12, v13

    invoke-static {v10, v11, v12}, Lorg/apache/cordova/api/LOG;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 725
    const-string v10, "CordovaLog"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Found preference for "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 728
    iget-object v10, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    invoke-virtual {v10, v4, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_3

    .line 733
    .end local v4           #name:Ljava/lang/String;
    .end local v6           #strNode:Ljava/lang/String;
    .end local v8           #value:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 734
    .local v0, e:Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto/16 :goto_1

    .line 735
    .end local v0           #e:Lorg/xmlpull/v1/XmlPullParserException;
    :catch_1
    move-exception v0

    .line 736
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_1

    .line 740
    .end local v0           #e:Ljava/io/IOException;
    :cond_7
    const-string v10, "false"

    const-string v11, "useBrowserHistory"

    const-string v12, "true"

    invoke-virtual {p0, v11, v12}, Lorg/apache/cordova/CordovaWebView;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 743
    const/4 v10, 0x0

    iput-boolean v10, p0, Lorg/apache/cordova/CordovaWebView;->useBrowserHistory:Z

    .line 744
    const-string v10, "CordovaWebView"

    const-string v11, "useBrowserHistory=false is deprecated as of Cordova 2.2.0 and will be removed six months after the 2.2.0 release.  Please use the browser history and use history.back()."

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    :cond_8
    const-string v10, "true"

    const-string v11, "fullscreen"

    const-string v12, "false"

    invoke-virtual {p0, v11, v12}, Lorg/apache/cordova/CordovaWebView;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 748
    iget-object v10, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v10

    const/16 v11, 0x800

    invoke-virtual {v10, v11}, Landroid/view/Window;->clearFlags(I)V

    .line 749
    iget-object v10, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v10}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v10}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v10

    const/16 v11, 0x400

    const/16 v12, 0x400

    invoke-virtual {v10, v11, v12}, Landroid/view/Window;->setFlags(II)V

    goto/16 :goto_0
.end method

.method private setup()V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 219
    invoke-virtual {p0, v6}, Lorg/apache/cordova/CordovaWebView;->setInitialScale(I)V

    .line 220
    invoke-virtual {p0, v6}, Lorg/apache/cordova/CordovaWebView;->setVerticalScrollBarEnabled(Z)V

    .line 221
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->requestFocusFromTouch()Z

    .line 224
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    .line 225
    .local v2, settings:Landroid/webkit/WebSettings;
    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 226
    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 227
    sget-object v3, Landroid/webkit/WebSettings$LayoutAlgorithm;->NORMAL:Landroid/webkit/WebSettings$LayoutAlgorithm;

    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    .line 230
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-ge v3, v4, :cond_0

    .line 231
    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setNavDump(Z)V

    .line 235
    :cond_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xf

    if-le v3, v4, :cond_1

    .line 236
    invoke-static {v2}, Lorg/apache/cordova/CordovaWebView$Level16Apis;->enableUniversalAccess(Landroid/webkit/WebSettings;)V

    .line 238
    :cond_1
    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 239
    iget-object v3, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "database"

    invoke-virtual {v3, v4, v6}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 240
    .local v0, databasePath:Ljava/lang/String;
    invoke-virtual {v2, v0}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    .line 243
    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 246
    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    .line 250
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->updateUserAgentString()V

    .line 252
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 253
    .local v1, intentFilter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 254
    iget-object v3, p0, Lorg/apache/cordova/CordovaWebView;->receiver:Landroid/content/BroadcastReceiver;

    if-nez v3, :cond_2

    .line 255
    new-instance v3, Lorg/apache/cordova/CordovaWebView$1;

    invoke-direct {v3, p0}, Lorg/apache/cordova/CordovaWebView$1;-><init>(Lorg/apache/cordova/CordovaWebView;)V

    iput-object v3, p0, Lorg/apache/cordova/CordovaWebView;->receiver:Landroid/content/BroadcastReceiver;

    .line 261
    iget-object v3, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/cordova/CordovaWebView;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 265
    :cond_2
    new-instance v3, Lorg/apache/cordova/api/PluginManager;

    iget-object v4, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v3, p0, v4}, Lorg/apache/cordova/api/PluginManager;-><init>(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/api/CordovaInterface;)V

    iput-object v3, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    .line 266
    new-instance v3, Lorg/apache/cordova/NativeToJsMessageQueue;

    iget-object v4, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-direct {v3, p0, v4}, Lorg/apache/cordova/NativeToJsMessageQueue;-><init>(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/api/CordovaInterface;)V

    iput-object v3, p0, Lorg/apache/cordova/CordovaWebView;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    .line 267
    new-instance v3, Lorg/apache/cordova/ExposedJsApi;

    iget-object v4, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    iget-object v5, p0, Lorg/apache/cordova/CordovaWebView;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-direct {v3, v4, v5}, Lorg/apache/cordova/ExposedJsApi;-><init>(Lorg/apache/cordova/api/PluginManager;Lorg/apache/cordova/NativeToJsMessageQueue;)V

    iput-object v3, p0, Lorg/apache/cordova/CordovaWebView;->exposedJsApi:Lorg/apache/cordova/ExposedJsApi;

    .line 268
    invoke-direct {p0}, Lorg/apache/cordova/CordovaWebView;->exposeJsInterface()V

    .line 269
    return-void
.end method

.method private updateUserAgentString()V
    .locals 1

    .prologue
    .line 272
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    .line 273
    return-void
.end method


# virtual methods
.method public addWhiteListEntry(Ljava/lang/String;Z)V
    .locals 7
    .parameter "origin"
    .parameter "subdomains"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 319
    :try_start_0
    const-string v1, "*"

    invoke-virtual {p1, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 320
    const-string v1, "CordovaWebView"

    const-string v2, "Unlimited access to network resources"

    invoke-static {v1, v2}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    const-string v2, ".*"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 346
    :goto_0
    return-void

    .line 325
    :cond_0
    if-eqz p2, :cond_2

    .line 327
    const-string v1, "http"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 328
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    const-string v2, "https?://"

    const-string v3, "^https?://(.*\\.)?"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 332
    :goto_1
    const-string v1, "CordovaWebView"

    const-string v2, "Origin to allow with subdomains: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v1, v2, v3}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 343
    :catch_0
    move-exception v0

    .line 344
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "CordovaWebView"

    const-string v2, "Failed to add origin %s"

    new-array v3, v6, [Ljava/lang/Object;

    aput-object p1, v3, v5

    invoke-static {v1, v2, v3}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 330
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "^https?://(.*\\.)?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 335
    :cond_2
    const-string v1, "http"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 336
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    const-string v2, "https?://"

    const-string v3, "^https?://"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 340
    :goto_2
    const-string v1, "CordovaWebView"

    const-string v2, "Origin to allow: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v1, v2, v3}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 338
    :cond_3
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "^https?://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method public backHistory()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 592
    invoke-super {p0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 593
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->printBackForwardList()V

    .line 594
    invoke-super {p0}, Landroid/webkit/WebView;->goBack()V

    .line 607
    :goto_0
    return v1

    .line 600
    :cond_0
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v2

    if-le v2, v1, :cond_1

    iget-boolean v2, p0, Lorg/apache/cordova/CordovaWebView;->useBrowserHistory:Z

    if-nez v2, :cond_1

    .line 601
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 602
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 603
    .local v0, url:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 607
    .end local v0           #url:Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bindButton(IZZ)V
    .locals 2
    .parameter "keyCode"
    .parameter "keyDown"
    .parameter "override"

    .prologue
    .line 880
    if-eqz p2, :cond_0

    .line 882
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyDownCodes:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 888
    :goto_0
    return-void

    .line 886
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyUpCodes:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public bindButton(Ljava/lang/String;Z)V
    .locals 2
    .parameter "button"
    .parameter "override"

    .prologue
    .line 871
    const-string v0, "volumeup"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 872
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyDownCodes:Ljava/util/ArrayList;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 877
    :cond_0
    :goto_0
    return-void

    .line 874
    :cond_1
    const-string v0, "volumedown"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 875
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyDownCodes:Ljava/util/ArrayList;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public bindButton(Z)V
    .locals 0
    .parameter "override"

    .prologue
    .line 866
    iput-boolean p1, p0, Lorg/apache/cordova/CordovaWebView;->bound:Z

    .line 867
    return-void
.end method

.method public canGoBack()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 616
    invoke-super {p0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 622
    :cond_0
    :goto_0
    return v0

    .line 619
    :cond_1
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-gt v1, v0, :cond_0

    .line 622
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 761
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 762
    .local v0, bundle:Landroid/os/Bundle;
    if-nez v0, :cond_1

    .line 769
    .end local p2
    :cond_0
    :goto_0
    return-object p2

    .line 765
    .restart local p2
    :cond_1
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 766
    .local v1, p:Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 769
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method public hadKeyEvent()Z
    .locals 1

    .prologue
    .line 968
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->handleButton:Z

    return v0
.end method

.method public handleDestroy()V
    .locals 4

    .prologue
    .line 934
    const-string v1, "javascript:try{cordova.require(\'cordova/channel\').onDestroy.fire();}catch(e){console.log(\'exception firing destroy event from native\');};"

    invoke-virtual {p0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 937
    const-string v1, "about:blank"

    invoke-virtual {p0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 940
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    if-eqz v1, :cond_0

    .line 941
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v1}, Lorg/apache/cordova/api/PluginManager;->onDestroy()V

    .line 945
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->receiver:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_1

    .line 947
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 952
    :cond_1
    :goto_0
    return-void

    .line 948
    :catch_0
    move-exception v0

    .line 949
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "CordovaWebView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error unregistering configuration receiver: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public handlePause(Z)V
    .locals 2
    .parameter "keepRunning"

    .prologue
    .line 897
    const-string v0, "CordovaWebView"

    const-string v1, "Handle the pause"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 899
    const-string v0, "javascript:try{cordova.fireDocumentEvent(\'pause\');}catch(e){console.log(\'exception firing pause event from native\');};"

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 902
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    if-eqz v0, :cond_0

    .line 903
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/PluginManager;->onPause(Z)V

    .line 907
    :cond_0
    if-nez p1, :cond_1

    .line 909
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->pauseTimers()V

    .line 911
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->paused:Z

    .line 913
    return-void
.end method

.method public handleResume(ZZ)V
    .locals 1
    .parameter "keepRunning"
    .parameter "activityResultKeepRunning"

    .prologue
    .line 919
    const-string v0, "javascript:try{cordova.fireDocumentEvent(\'resume\');}catch(e){console.log(\'exception firing resume event from native\');};"

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 922
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    if-eqz v0, :cond_0

    .line 923
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/PluginManager;->onResume(Z)V

    .line 927
    :cond_0
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->resumeTimers()V

    .line 928
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->paused:Z

    .line 929
    return-void
.end method

.method public hideCustomView()V
    .locals 3

    .prologue
    .line 1031
    const-string v1, "CordovaWebView"

    const-string v2, "Hidding Custom View"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1032
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->mCustomView:Landroid/view/View;

    if-nez v1, :cond_0

    .line 1045
    :goto_0
    return-void

    .line 1035
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->mCustomView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1038
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 1039
    .local v0, parent:Landroid/view/ViewGroup;
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->mCustomView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1040
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/cordova/CordovaWebView;->mCustomView:Landroid/view/View;

    .line 1041
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-interface {v1}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 1044
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/cordova/CordovaWebView;->setVisibility(I)V

    goto :goto_0
.end method

.method public isBackButtonBound()Z
    .locals 1

    .prologue
    .line 892
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->bound:Z

    return v0
.end method

.method public isCustomViewShowing()Z
    .locals 1

    .prologue
    .line 1054
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPaused()Z
    .locals 1

    .prologue
    .line 964
    iget-boolean v0, p0, Lorg/apache/cordova/CordovaWebView;->paused:Z

    return v0
.end method

.method public isUrlWhiteListed(Ljava/lang/String;)Z
    .locals 6
    .parameter "url"

    .prologue
    const/4 v3, 0x1

    .line 357
    iget-object v4, p0, Lorg/apache/cordova/CordovaWebView;->whiteListCache:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 373
    :goto_0
    return v3

    .line 362
    :cond_0
    iget-object v4, p0, Lorg/apache/cordova/CordovaWebView;->whiteList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 363
    .local v2, pit:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/regex/Pattern;>;"
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 364
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/regex/Pattern;

    .line 365
    .local v1, p:Ljava/util/regex/Pattern;
    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 368
    .local v0, m:Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 369
    iget-object v4, p0, Lorg/apache/cordova/CordovaWebView;->whiteListCache:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, p1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 373
    .end local v0           #m:Ljava/util/regex/Matcher;
    .end local v1           #p:Ljava/util/regex/Pattern;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public loadUrl(Ljava/lang/String;)V
    .locals 3
    .parameter "url"

    .prologue
    .line 383
    const-string v1, "about:blank"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "javascript:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 384
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaWebView;->loadUrlNow(Ljava/lang/String;)V

    .line 399
    :goto_0
    return-void

    .line 388
    :cond_1
    const-string v1, "url"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/apache/cordova/CordovaWebView;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 391
    .local v0, initUrl:Ljava/lang/String;
    if-eqz v0, :cond_2

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 392
    :cond_2
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;)V

    goto :goto_0

    .line 396
    :cond_3
    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public loadUrl(Ljava/lang/String;I)V
    .locals 3
    .parameter "url"
    .parameter "time"

    .prologue
    .line 409
    const-string v1, "url"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/apache/cordova/CordovaWebView;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 412
    .local v0, initUrl:Ljava/lang/String;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 413
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;I)V

    .line 419
    :goto_0
    return-void

    .line 417
    :cond_1
    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public loadUrlIntoView(Ljava/lang/String;)V
    .locals 9
    .parameter "url"

    .prologue
    .line 427
    const-string v1, "CordovaWebView"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, ">>> loadUrl("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView;->url:Ljava/lang/String;

    .line 430
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->baseUrl:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 431
    const/16 v1, 0x2f

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 432
    .local v6, i:I
    if-lez v6, :cond_1

    .line 433
    const/4 v1, 0x0

    add-int/lit8 v7, v6, 0x1

    invoke-virtual {p1, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaWebView;->baseUrl:Ljava/lang/String;

    .line 439
    :goto_0
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v1}, Lorg/apache/cordova/api/PluginManager;->init()V

    .line 441
    iget-boolean v1, p0, Lorg/apache/cordova/CordovaWebView;->useBrowserHistory:Z

    if-nez v1, :cond_0

    .line 442
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v1, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    .end local v6           #i:I
    :cond_0
    move-object v3, p0

    .line 448
    .local v3, me:Lorg/apache/cordova/CordovaWebView;
    iget v4, v3, Lorg/apache/cordova/CordovaWebView;->loadUrlTimeout:I

    .line 449
    .local v4, currentLoadUrlTimeout:I
    const-string v1, "loadUrlTimeoutValue"

    const-string v7, "20000"

    invoke-virtual {p0, v1, v7}, Lorg/apache/cordova/CordovaWebView;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 452
    .local v2, loadUrlTimeoutValue:I
    new-instance v5, Lorg/apache/cordova/CordovaWebView$2;

    invoke-direct {v5, p0, v3, p1}, Lorg/apache/cordova/CordovaWebView$2;-><init>(Lorg/apache/cordova/CordovaWebView;Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V

    .line 463
    .local v5, loadError:Ljava/lang/Runnable;
    new-instance v0, Lorg/apache/cordova/CordovaWebView$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/cordova/CordovaWebView$3;-><init>(Lorg/apache/cordova/CordovaWebView;ILorg/apache/cordova/CordovaWebView;ILjava/lang/Runnable;)V

    .line 481
    .local v0, timeoutCheck:Ljava/lang/Runnable;
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v7, Lorg/apache/cordova/CordovaWebView$4;

    invoke-direct {v7, p0, v0, v3, p1}, Lorg/apache/cordova/CordovaWebView$4;-><init>(Lorg/apache/cordova/CordovaWebView;Ljava/lang/Runnable;Lorg/apache/cordova/CordovaWebView;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 488
    return-void

    .line 436
    .end local v0           #timeoutCheck:Ljava/lang/Runnable;
    .end local v2           #loadUrlTimeoutValue:I
    .end local v3           #me:Lorg/apache/cordova/CordovaWebView;
    .end local v4           #currentLoadUrlTimeout:I
    .end local v5           #loadError:Ljava/lang/Runnable;
    .restart local v6       #i:I
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lorg/apache/cordova/CordovaWebView;->url:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v7, "/"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/CordovaWebView;->baseUrl:Ljava/lang/String;

    goto :goto_0
.end method

.method public loadUrlIntoView(Ljava/lang/String;I)V
    .locals 5
    .parameter "url"
    .parameter "time"

    .prologue
    .line 515
    const-string v0, "javascript:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-gtz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 528
    :cond_0
    :goto_0
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaWebView;->loadUrlIntoView(Ljava/lang/String;)V

    .line 529
    return-void

    .line 521
    :cond_1
    const-string v0, "CordovaWebView"

    const-string v1, "DroidGap.loadUrl(%s, %d)"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 524
    const-string v0, "splashscreen"

    const-string v1, "show"

    invoke-virtual {p0, v0, v1}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method loadUrlNow(Ljava/lang/String;)V
    .locals 2
    .parameter "url"

    .prologue
    .line 496
    const/4 v0, 0x3

    invoke-static {v0}, Lorg/apache/cordova/api/LOG;->isLoggable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "javascript:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 497
    const-string v0, "CordovaWebView"

    const-string v1, ">>> loadUrlNow()"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    :cond_0
    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->baseUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "javascript:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaWebView;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 500
    :cond_1
    invoke-super {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 502
    :cond_2
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 778
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->keyDownCodes:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 780
    const/16 v0, 0x19

    if-ne p1, v0, :cond_0

    .line 782
    const-string v0, "CordovaWebView"

    const-string v2, "Down Key Hit"

    invoke-static {v0, v2}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 783
    const-string v0, "javascript:cordova.fireDocumentEvent(\'volumedownbutton\');"

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 808
    :goto_0
    return v1

    .line 787
    :cond_0
    const/16 v0, 0x18

    if-ne p1, v0, :cond_1

    .line 788
    const-string v0, "CordovaWebView"

    const-string v2, "Up Key Hit"

    invoke-static {v0, v2}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 789
    const-string v0, "javascript:cordova.fireDocumentEvent(\'volumeupbutton\');"

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 794
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0

    .line 797
    :cond_2
    const/4 v2, 0x4

    if-ne p1, v2, :cond_8

    .line 802
    iget-boolean v2, p0, Lorg/apache/cordova/CordovaWebView;->useBrowserHistory:Z

    if-eqz v2, :cond_5

    .line 803
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->startOfHistory()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Lorg/apache/cordova/CordovaWebView;->bound:Z

    if-eqz v2, :cond_4

    :cond_3
    move v0, v1

    :cond_4
    move v1, v0

    goto :goto_0

    .line 805
    :cond_5
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v2

    if-gt v2, v1, :cond_6

    iget-boolean v2, p0, Lorg/apache/cordova/CordovaWebView;->bound:Z

    if-eqz v2, :cond_7

    :cond_6
    move v0, v1

    :cond_7
    move v1, v0

    goto :goto_0

    .line 808
    :cond_8
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v0, 0x1

    .line 816
    const/4 v1, 0x4

    if-ne p1, v1, :cond_4

    .line 818
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->mCustomView:Landroid/view/View;

    if-eqz v1, :cond_2

    .line 819
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->hideCustomView()V

    .line 860
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    :cond_1
    :goto_0
    return v0

    .line 823
    :cond_2
    iget-boolean v1, p0, Lorg/apache/cordova/CordovaWebView;->bound:Z

    if-eqz v1, :cond_3

    .line 824
    const-string v1, "javascript:cordova.fireDocumentEvent(\'backbutton\');"

    invoke-virtual {p0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 829
    :cond_3
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->backHistory()Z

    move-result v1

    if-nez v1, :cond_1

    .line 835
    const/4 v0, 0x0

    goto :goto_0

    .line 841
    :cond_4
    const/16 v1, 0x52

    if-ne p1, v1, :cond_6

    .line 842
    iget-wide v0, p0, Lorg/apache/cordova/CordovaWebView;->lastMenuEventTime:J

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_5

    .line 843
    const-string v0, "javascript:cordova.fireDocumentEvent(\'menubutton\');"

    invoke-virtual {p0, v0}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 845
    :cond_5
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/cordova/CordovaWebView;->lastMenuEventTime:J

    .line 846
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0

    .line 849
    :cond_6
    const/16 v1, 0x54

    if-ne p1, v1, :cond_7

    .line 850
    const-string v1, "javascript:cordova.fireDocumentEvent(\'searchbutton\');"

    invoke-virtual {p0, v1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 853
    :cond_7
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->keyUpCodes:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 856
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 1
    .parameter "intent"

    .prologue
    .line 957
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    if-eqz v0, :cond_0

    .line 958
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/PluginManager;->onNewIntent(Landroid/content/Intent;)V

    .line 960
    :cond_0
    return-void
.end method

.method public peekAtUrlStack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 568
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 569
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 571
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public postMessage(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .parameter "id"
    .parameter "data"

    .prologue
    .line 558
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    if-eqz v0, :cond_0

    .line 559
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/api/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    :cond_0
    return-void
.end method

.method public printBackForwardList()V
    .locals 8

    .prologue
    .line 981
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->copyBackForwardList()Landroid/webkit/WebBackForwardList;

    move-result-object v0

    .line 982
    .local v0, currentList:Landroid/webkit/WebBackForwardList;
    invoke-virtual {v0}, Landroid/webkit/WebBackForwardList;->getSize()I

    move-result v1

    .line 983
    .local v1, currentSize:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 985
    invoke-virtual {v0, v2}, Landroid/webkit/WebBackForwardList;->getItemAtIndex(I)Landroid/webkit/WebHistoryItem;

    move-result-object v3

    .line 986
    .local v3, item:Landroid/webkit/WebHistoryItem;
    invoke-virtual {v3}, Landroid/webkit/WebHistoryItem;->getUrl()Ljava/lang/String;

    move-result-object v4

    .line 987
    .local v4, url:Ljava/lang/String;
    const-string v5, "CordovaWebView"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "The URL at index: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 983
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 989
    .end local v3           #item:Landroid/webkit/WebHistoryItem;
    .end local v4           #url:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public pushUrl(Ljava/lang/String;)V
    .locals 1
    .parameter "url"

    .prologue
    .line 580
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    return-void
.end method

.method public sendJavascript(Ljava/lang/String;)V
    .locals 1
    .parameter "statement"

    .prologue
    .line 538
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/NativeToJsMessageQueue;->addJavaScript(Ljava/lang/String;)V

    .line 539
    return-void
.end method

.method public sendPluginResult(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V
    .locals 1
    .parameter "result"
    .parameter "callbackId"

    .prologue
    .line 548
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebView;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/NativeToJsMessageQueue;->addPluginResult(Lorg/apache/cordova/api/PluginResult;Ljava/lang/String;)V

    .line 549
    return-void
.end method

.method public setWebChromeClient(Lorg/apache/cordova/CordovaChromeClient;)V
    .locals 0
    .parameter "client"

    .prologue
    .line 306
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView;->chromeClient:Lorg/apache/cordova/CordovaChromeClient;

    .line 307
    invoke-super {p0, p1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 308
    return-void
.end method

.method public setWebViewClient(Lorg/apache/cordova/CordovaWebViewClient;)V
    .locals 0
    .parameter "client"

    .prologue
    .line 296
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView;->viewClient:Lorg/apache/cordova/CordovaWebViewClient;

    .line 297
    invoke-super {p0, p1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 298
    return-void
.end method

.method public showCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 3
    .parameter "view"
    .parameter "callback"

    .prologue
    .line 1006
    const-string v1, "CordovaWebView"

    const-string v2, "showing Custom View"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1008
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebView;->mCustomView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 1009
    invoke-interface {p2}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 1027
    :goto_0
    return-void

    .line 1014
    :cond_0
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebView;->mCustomView:Landroid/view/View;

    .line 1015
    iput-object p2, p0, Lorg/apache/cordova/CordovaWebView;->mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 1018
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 1019
    .local v0, parent:Landroid/view/ViewGroup;
    sget-object v1, Lorg/apache/cordova/CordovaWebView;->COVER_SCREEN_GRAVITY_CENTER:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1022
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lorg/apache/cordova/CordovaWebView;->setVisibility(I)V

    .line 1025
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1026
    invoke-virtual {v0}, Landroid/view/ViewGroup;->bringToFront()V

    goto :goto_0
.end method

.method public showWebPage(Ljava/lang/String;ZZLjava/util/HashMap;)V
    .locals 7
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
    .line 636
    .local p4, params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "CordovaWebView"

    const-string v3, "showWebPage(%s, %b, %b, HashMap"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 639
    if-eqz p3, :cond_0

    .line 640
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->clearHistory()V

    .line 644
    :cond_0
    if-nez p2, :cond_4

    .line 647
    const-string v2, "file://"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->baseUrl:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaWebView;->isUrlWhiteListed(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 651
    :cond_1
    if-eqz p3, :cond_2

    .line 652
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->urls:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->clear()V

    .line 656
    :cond_2
    invoke-virtual {p0, p1}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 681
    :goto_0
    return-void

    .line 660
    :cond_3
    const-string v2, "CordovaWebView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "showWebPage: Cannot load URL into webview since it is not in white list.  Loading into browser instead. (URL="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/api/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 663
    .local v1, intent:Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 664
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 665
    .end local v1           #intent:Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 666
    .local v0, e:Landroid/content/ActivityNotFoundException;
    const-string v2, "CordovaWebView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error loading url "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 674
    .end local v0           #e:Landroid/content/ActivityNotFoundException;
    :cond_4
    :try_start_1
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 675
    .restart local v1       #intent:Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 676
    iget-object v2, p0, Lorg/apache/cordova/CordovaWebView;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 677
    .end local v1           #intent:Landroid/content/Intent;
    :catch_1
    move-exception v0

    .line 678
    .restart local v0       #e:Landroid/content/ActivityNotFoundException;
    const-string v2, "CordovaWebView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error loading url "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0
.end method

.method public startOfHistory()Z
    .locals 7

    .prologue
    .line 995
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->copyBackForwardList()Landroid/webkit/WebBackForwardList;

    move-result-object v0

    .line 996
    .local v0, currentList:Landroid/webkit/WebBackForwardList;
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/webkit/WebBackForwardList;->getItemAtIndex(I)Landroid/webkit/WebHistoryItem;

    move-result-object v2

    .line 997
    .local v2, item:Landroid/webkit/WebHistoryItem;
    invoke-virtual {v2}, Landroid/webkit/WebHistoryItem;->getUrl()Ljava/lang/String;

    move-result-object v3

    .line 998
    .local v3, url:Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/cordova/CordovaWebView;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 999
    .local v1, currentUrl:Ljava/lang/String;
    const-string v4, "CordovaWebView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The current URL is: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1000
    const-string v4, "CordovaWebView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The URL at item 0 is:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1001
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    return v4
.end method
