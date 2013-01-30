.class public Lorg/apache/cordova/App;
.super Lorg/apache/cordova/api/Plugin;
.source "App.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/cordova/api/Plugin;-><init>()V

    return-void
.end method


# virtual methods
.method public backHistory()V
    .locals 2

    .prologue
    .line 179
    iget-object v0, p0, Lorg/apache/cordova/App;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/apache/cordova/App$2;

    invoke-direct {v1, p0}, Lorg/apache/cordova/App$2;-><init>(Lorg/apache/cordova/App;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 184
    return-void
.end method

.method public cancelLoadUrl()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lorg/apache/cordova/App;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->cancelLoadUrl()V

    .line 165
    return-void
.end method

.method public clearCache()V
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lorg/apache/cordova/App;->webView:Lorg/apache/cordova/CordovaWebView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CordovaWebView;->clearCache(Z)V

    .line 97
    return-void
.end method

.method public clearHistory()V
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/cordova/App;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->clearHistory()V

    .line 172
    return-void
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/apache/cordova/api/PluginResult;
    .locals 5
    .parameter "action"
    .parameter "args"
    .parameter "callbackId"

    .prologue
    .line 44
    sget-object v2, Lorg/apache/cordova/api/PluginResult$Status;->OK:Lorg/apache/cordova/api/PluginResult$Status;

    .line 45
    .local v2, status:Lorg/apache/cordova/api/PluginResult$Status;
    const-string v1, ""

    .line 48
    .local v1, result:Ljava/lang/String;
    :try_start_0
    const-string v3, "clearCache"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 49
    invoke-virtual {p0}, Lorg/apache/cordova/App;->clearCache()V

    .line 82
    :cond_0
    :goto_0
    new-instance v3, Lorg/apache/cordova/api/PluginResult;

    invoke-direct {v3, v2, v1}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;Ljava/lang/String;)V

    .line 84
    :goto_1
    return-object v3

    .line 51
    :cond_1
    const-string v3, "show"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 55
    iget-object v3, p0, Lorg/apache/cordova/App;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Lorg/apache/cordova/App$1;

    invoke-direct {v4, p0}, Lorg/apache/cordova/App$1;-><init>(Lorg/apache/cordova/App;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, e:Lorg/json/JSONException;
    new-instance v3, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->JSON_EXCEPTION:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v3, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    goto :goto_1

    .line 61
    .end local v0           #e:Lorg/json/JSONException;
    :cond_2
    :try_start_1
    const-string v3, "loadUrl"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 62
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/apache/cordova/App;->loadUrl(Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_0

    .line 64
    :cond_3
    const-string v3, "cancelLoadUrl"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 65
    invoke-virtual {p0}, Lorg/apache/cordova/App;->cancelLoadUrl()V

    goto :goto_0

    .line 67
    :cond_4
    const-string v3, "clearHistory"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 68
    invoke-virtual {p0}, Lorg/apache/cordova/App;->clearHistory()V

    goto :goto_0

    .line 70
    :cond_5
    const-string v3, "backHistory"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 71
    invoke-virtual {p0}, Lorg/apache/cordova/App;->backHistory()V

    goto :goto_0

    .line 73
    :cond_6
    const-string v3, "overrideButton"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 74
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v4

    invoke-virtual {p0, v3, v4}, Lorg/apache/cordova/App;->overrideButton(Ljava/lang/String;Z)V

    goto :goto_0

    .line 76
    :cond_7
    const-string v3, "overrideBackbutton"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 77
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v3

    invoke-virtual {p0, v3}, Lorg/apache/cordova/App;->overrideBackbutton(Z)V

    goto/16 :goto_0

    .line 79
    :cond_8
    const-string v3, "exitApp"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 80
    invoke-virtual {p0}, Lorg/apache/cordova/App;->exitApp()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public exitApp()V
    .locals 3

    .prologue
    .line 222
    iget-object v0, p0, Lorg/apache/cordova/App;->webView:Lorg/apache/cordova/CordovaWebView;

    const-string v1, "exit"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaWebView;->postMessage(Ljava/lang/String;Ljava/lang/Object;)V

    .line 223
    return-void
.end method

.method public isBackbuttonOverridden()Z
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/cordova/App;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebView;->isBackButtonBound()Z

    move-result v0

    return v0
.end method

.method public loadUrl(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 12
    .parameter "url"
    .parameter "props"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 107
    const-string v9, "App"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "App.loadUrl("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    const/4 v8, 0x0

    .line 109
    .local v8, wait:I
    const/4 v5, 0x0

    .line 110
    .local v5, openExternal:Z
    const/4 v0, 0x0

    .line 113
    .local v0, clearHistory:Z
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 114
    .local v6, params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p2, :cond_6

    .line 115
    invoke-virtual {p2}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v4

    .line 116
    .local v4, keys:Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v2, v9, :cond_6

    .line 117
    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 118
    .local v3, key:Ljava/lang/String;
    const-string v9, "wait"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 119
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 116
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 121
    :cond_1
    const-string v9, "openexternal"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 122
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    goto :goto_1

    .line 124
    :cond_2
    const-string v9, "clearhistory"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 125
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    goto :goto_1

    .line 128
    :cond_3
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 129
    .local v7, value:Ljava/lang/Object;
    if-eqz v7, :cond_0

    .line 132
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 133
    check-cast v7, Ljava/lang/String;

    .end local v7           #value:Ljava/lang/Object;
    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 135
    .restart local v7       #value:Ljava/lang/Object;
    :cond_4
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Boolean;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 136
    check-cast v7, Ljava/lang/Boolean;

    .end local v7           #value:Ljava/lang/Object;
    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 138
    .restart local v7       #value:Ljava/lang/Object;
    :cond_5
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Integer;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 139
    check-cast v7, Ljava/lang/Integer;

    .end local v7           #value:Ljava/lang/Object;
    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 147
    .end local v2           #i:I
    .end local v3           #key:Ljava/lang/String;
    .end local v4           #keys:Lorg/json/JSONArray;
    :cond_6
    if-lez v8, :cond_7

    .line 149
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    int-to-long v9, v8

    :try_start_1
    invoke-virtual {p0, v9, v10}, Ljava/lang/Object;->wait(J)V

    .line 151
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 156
    :cond_7
    :goto_2
    iget-object v9, p0, Lorg/apache/cordova/App;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v9, p1, v5, v0, v6}, Lorg/apache/cordova/CordovaWebView;->showWebPage(Ljava/lang/String;ZZLjava/util/HashMap;)V

    .line 157
    return-void

    .line 151
    :catchall_0
    move-exception v9

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v9
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 152
    :catch_0
    move-exception v1

    .line 153
    .local v1, e:Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2
.end method

.method public overrideBackbutton(Z)V
    .locals 2
    .parameter "override"

    .prologue
    .line 193
    const-string v0, "App"

    const-string v1, "WARNING: Back Button Default Behaviour will be overridden.  The backbutton event will be fired!"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    iget-object v0, p0, Lorg/apache/cordova/App;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/CordovaWebView;->bindButton(Z)V

    .line 195
    return-void
.end method

.method public overrideButton(Ljava/lang/String;Z)V
    .locals 2
    .parameter "button"
    .parameter "override"

    .prologue
    .line 205
    const-string v0, "DroidGap"

    const-string v1, "WARNING: Volume Button Default Behaviour will be overridden.  The volume event will be fired!"

    invoke-static {v0, v1}, Lorg/apache/cordova/api/LOG;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    iget-object v0, p0, Lorg/apache/cordova/App;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-virtual {v0, p1, p2}, Lorg/apache/cordova/CordovaWebView;->bindButton(Ljava/lang/String;Z)V

    .line 207
    return-void
.end method
