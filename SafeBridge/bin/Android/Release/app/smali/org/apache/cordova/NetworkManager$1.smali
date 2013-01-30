.class Lorg/apache/cordova/NetworkManager$1;
.super Landroid/content/BroadcastReceiver;
.source "NetworkManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/NetworkManager;->initialize(Lorg/apache/cordova/api/CordovaInterface;Lorg/apache/cordova/CordovaWebView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/NetworkManager;


# direct methods
.method constructor <init>(Lorg/apache/cordova/NetworkManager;)V
    .locals 0
    .parameter

    .prologue
    .line 101
    iput-object p1, p0, Lorg/apache/cordova/NetworkManager$1;->this$0:Lorg/apache/cordova/NetworkManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/cordova/NetworkManager$1;->this$0:Lorg/apache/cordova/NetworkManager;

    iget-object v0, v0, Lorg/apache/cordova/NetworkManager;->webView:Lorg/apache/cordova/CordovaWebView;

    if-eqz v0, :cond_0

    .line 107
    iget-object v1, p0, Lorg/apache/cordova/NetworkManager$1;->this$0:Lorg/apache/cordova/NetworkManager;

    const-string v0, "networkInfo"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/NetworkInfo;

    #calls: Lorg/apache/cordova/NetworkManager;->updateConnectionInfo(Landroid/net/NetworkInfo;)V
    invoke-static {v1, v0}, Lorg/apache/cordova/NetworkManager;->access$000(Lorg/apache/cordova/NetworkManager;Landroid/net/NetworkInfo;)V

    .line 108
    :cond_0
    return-void
.end method
