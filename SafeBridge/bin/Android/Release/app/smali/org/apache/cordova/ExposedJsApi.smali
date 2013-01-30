.class Lorg/apache/cordova/ExposedJsApi;
.super Ljava/lang/Object;
.source "ExposedJsApi.java"


# instance fields
.field private jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

.field private pluginManager:Lorg/apache/cordova/api/PluginManager;


# direct methods
.method public constructor <init>(Lorg/apache/cordova/api/PluginManager;Lorg/apache/cordova/NativeToJsMessageQueue;)V
    .locals 0
    .parameter "pluginManager"
    .parameter "jsMessageQueue"

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/apache/cordova/ExposedJsApi;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    .line 37
    iput-object p2, p0, Lorg/apache/cordova/ExposedJsApi;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    .line 38
    return-void
.end method


# virtual methods
.method public exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "service"
    .parameter "action"
    .parameter "callbackId"
    .parameter "arguments"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 41
    iget-object v2, p0, Lorg/apache/cordova/ExposedJsApi;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/apache/cordova/NativeToJsMessageQueue;->setPaused(Z)V

    .line 43
    :try_start_0
    iget-object v2, p0, Lorg/apache/cordova/ExposedJsApi;->pluginManager:Lorg/apache/cordova/api/PluginManager;

    invoke-virtual {v2, p1, p2, p3, p4}, Lorg/apache/cordova/api/PluginManager;->exec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 44
    .local v1, wasSync:Z
    const-string v0, ""

    .line 46
    .local v0, ret:Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/cordova/ExposedJsApi;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v2}, Lorg/apache/cordova/NativeToJsMessageQueue;->popAndEncode()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 50
    iget-object v2, p0, Lorg/apache/cordova/ExposedJsApi;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v2, v4}, Lorg/apache/cordova/NativeToJsMessageQueue;->setPaused(Z)V

    return-object v0

    .end local v0           #ret:Ljava/lang/String;
    .end local v1           #wasSync:Z
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/apache/cordova/ExposedJsApi;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v3, v4}, Lorg/apache/cordova/NativeToJsMessageQueue;->setPaused(Z)V

    throw v2
.end method

.method public retrieveJsMessages()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/cordova/ExposedJsApi;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0}, Lorg/apache/cordova/NativeToJsMessageQueue;->popAndEncode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setNativeToJsBridgeMode(I)V
    .locals 1
    .parameter "value"

    .prologue
    .line 55
    iget-object v0, p0, Lorg/apache/cordova/ExposedJsApi;->jsMessageQueue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/NativeToJsMessageQueue;->setBridgeMode(I)V

    .line 56
    return-void
.end method
