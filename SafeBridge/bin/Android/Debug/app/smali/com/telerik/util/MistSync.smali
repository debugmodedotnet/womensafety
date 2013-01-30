.class public Lcom/telerik/util/MistSync;
.super Ljava/lang/Object;
.source "MistSync.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/telerik/util/MistSync$MistSyncResult;
    }
.end annotation


# instance fields
.field private HOST:Ljava/lang/String;

.field private final PATH:Ljava/lang/String;

.field private PROJECT_NAME:Ljava/lang/String;

.field private SOLUTION_NAME:Ljava/lang/String;

.field private USERNAME:Ljava/lang/String;

.field private bootstrapper:Lcom/telerik/util/Bootstrapper;

.field private context:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Lcom/telerik/util/Bootstrapper;)V
    .locals 1
    .parameter "bootstrapper"

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const-string v0, "/mist/MobilePackage"

    iput-object v0, p0, Lcom/telerik/util/MistSync;->PATH:Ljava/lang/String;

    .line 72
    iput-object p1, p0, Lcom/telerik/util/MistSync;->bootstrapper:Lcom/telerik/util/Bootstrapper;

    .line 73
    sget-object v0, Lcom/telerik/util/GlobalContext;->mainActivity:Landroid/app/Activity;

    iput-object v0, p0, Lcom/telerik/util/MistSync;->context:Landroid/app/Activity;

    .line 74
    invoke-direct {p0}, Lcom/telerik/util/MistSync;->getProjectValues()V

    .line 75
    return-void
.end method

.method static synthetic access$0(Lcom/telerik/util/MistSync;Landroid/os/AsyncTask;)Lcom/telerik/util/MistSync$MistSyncResult;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 146
    invoke-direct {p0, p1}, Lcom/telerik/util/MistSync;->updateFiles(Landroid/os/AsyncTask;)Lcom/telerik/util/MistSync$MistSyncResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/telerik/util/MistSync;)Landroid/app/Activity;
    .locals 1
    .parameter

    .prologue
    .line 68
    iget-object v0, p0, Lcom/telerik/util/MistSync;->context:Landroid/app/Activity;

    return-object v0
.end method

.method private getProjectValues()V
    .locals 2

    .prologue
    .line 134
    iget-object v1, p0, Lcom/telerik/util/MistSync;->context:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 136
    .local v0, r:Landroid/content/res/Resources;
    const v1, 0x7f050001

    :try_start_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/telerik/util/MistSync;->SOLUTION_NAME:Ljava/lang/String;

    .line 137
    const v1, 0x7f050002

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/telerik/util/MistSync;->PROJECT_NAME:Ljava/lang/String;

    .line 138
    const v1, 0x7f050003

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/telerik/util/MistSync;->USERNAME:Ljava/lang/String;

    .line 139
    const v1, 0x7f050004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/telerik/util/MistSync;->HOST:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    :goto_0
    return-void

    .line 141
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private unzipFiles(Ljava/io/InputStream;)V
    .locals 10
    .parameter "inputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 195
    new-instance v6, Ljava/util/zip/ZipInputStream;

    invoke-direct {v6, p1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 196
    .local v6, zipStream:Ljava/util/zip/ZipInputStream;
    const/4 v5, 0x0

    .line 197
    .local v5, zipEntry:Ljava/util/zip/ZipEntry;
    const/16 v7, 0x2800

    new-array v0, v7, [B

    .line 199
    .local v0, buffer:[B
    :goto_0
    :try_start_0
    invoke-virtual {v6}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    if-nez v5, :cond_0

    .line 222
    invoke-virtual {v6}, Ljava/util/zip/ZipInputStream;->close()V

    .line 224
    :goto_1
    return-void

    .line 201
    :cond_0
    :try_start_1
    const-string v7, "Telerik"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Unzipping "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    new-instance v1, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/telerik/util/MistSync;->bootstrapper:Lcom/telerik/util/Bootstrapper;

    invoke-virtual {v8}, Lcom/telerik/util/Bootstrapper;->getBaseUrl()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 204
    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 205
    .local v2, folder:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    .line 206
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 208
    :cond_1
    new-instance v3, Ljava/io/FileOutputStream;

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/telerik/util/MistSync;->bootstrapper:Lcom/telerik/util/Bootstrapper;

    invoke-virtual {v8}, Lcom/telerik/util/Bootstrapper;->getBaseUrl()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 209
    .local v3, outputStream:Ljava/io/FileOutputStream;
    const/4 v4, 0x0

    .line 210
    .local v4, read:I
    :goto_2
    invoke-virtual {v6, v0}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v4

    if-gez v4, :cond_2

    .line 215
    invoke-virtual {v6}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 216
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 219
    .end local v1           #file:Ljava/io/File;
    .end local v2           #folder:Ljava/io/File;
    .end local v3           #outputStream:Ljava/io/FileOutputStream;
    .end local v4           #read:I
    :catch_0
    move-exception v7

    .line 222
    invoke-virtual {v6}, Ljava/util/zip/ZipInputStream;->close()V

    goto :goto_1

    .line 211
    .restart local v1       #file:Ljava/io/File;
    .restart local v2       #folder:Ljava/io/File;
    .restart local v3       #outputStream:Ljava/io/FileOutputStream;
    .restart local v4       #read:I
    :cond_2
    const/4 v7, 0x0

    :try_start_2
    invoke-virtual {v3, v0, v7, v4}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 221
    .end local v1           #file:Ljava/io/File;
    .end local v2           #folder:Ljava/io/File;
    .end local v3           #outputStream:Ljava/io/FileOutputStream;
    .end local v4           #read:I
    :catchall_0
    move-exception v7

    .line 222
    invoke-virtual {v6}, Ljava/util/zip/ZipInputStream;->close()V

    .line 223
    throw v7
.end method

.method private updateFiles(Landroid/os/AsyncTask;)Lcom/telerik/util/MistSync$MistSyncResult;
    .locals 15
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/Void;",
            "Ljava/lang/Integer;",
            "Lcom/telerik/util/MistSync$MistSyncResult;",
            ">;)",
            "Lcom/telerik/util/MistSync$MistSyncResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 147
    .local p1, asyncTask:Landroid/os/AsyncTask;,"Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Integer;Lcom/telerik/util/MistSync$MistSyncResult;>;"
    const/4 v9, 0x0

    .line 149
    .local v9, in:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 150
    .local v6, client:Lorg/apache/http/client/HttpClient;
    new-instance v11, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v11}, Lorg/apache/http/client/methods/HttpGet;-><init>()V

    .line 152
    .local v11, request:Lorg/apache/http/client/methods/HttpGet;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v10, qparams:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "ProjectIdentifier"

    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/telerik/util/MistSync;->SOLUTION_NAME:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\\"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/telerik/util/MistSync;->PROJECT_NAME:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "SolutionName"

    iget-object v2, p0, Lcom/telerik/util/MistSync;->SOLUTION_NAME:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "ProjectName"

    iget-object v2, p0, Lcom/telerik/util/MistSync;->PROJECT_NAME:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "UserName"

    iget-object v2, p0, Lcom/telerik/util/MistSync;->USERNAME:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "DevicePlatform"

    const-string v2, "Android"

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v0, Lorg/apache/http/message/BasicNameValuePair;

    const-string v1, "Action"

    const-string v2, "GetFiles"

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    iget-object v0, p0, Lcom/telerik/util/MistSync;->HOST:Ljava/lang/String;

    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 162
    .local v8, hostParts:[Ljava/lang/String;
    const/4 v0, 0x0

    aget-object v0, v8, v0

    const/4 v1, 0x1

    aget-object v1, v8, v1

    const/4 v2, -0x1

    const-string v3, "/mist/MobilePackage"

    const-string v4, "UTF-8"

    invoke-static {v10, v4}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lorg/apache/http/client/utils/URIUtils;->createURI(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/URI;

    move-result-object v14

    .line 163
    .local v14, uri:Ljava/net/URI;
    invoke-virtual {v11, v14}, Lorg/apache/http/client/methods/HttpGet;->setURI(Ljava/net/URI;)V

    .line 165
    invoke-virtual/range {p1 .. p1}, Landroid/os/AsyncTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 166
    new-instance v0, Lcom/telerik/util/MistSync$MistSyncResult;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;Lcom/telerik/util/MistSync$MistSyncResult;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    if-eqz v9, :cond_0

    .line 185
    :try_start_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 178
    :cond_0
    :goto_0
    return-object v0

    .line 186
    :catch_0
    move-exception v7

    .line 187
    .local v7, e:Ljava/io/IOException;
    const-string v1, "Telerik"

    invoke-virtual {v7}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 168
    .end local v7           #e:Ljava/io/IOException;
    :cond_1
    :try_start_2
    invoke-interface {v6, v11}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v12

    .line 170
    .local v12, response:Lorg/apache/http/HttpResponse;
    invoke-virtual/range {p1 .. p1}, Landroid/os/AsyncTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 171
    new-instance v0, Lcom/telerik/util/MistSync$MistSyncResult;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;Lcom/telerik/util/MistSync$MistSyncResult;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 183
    if-eqz v9, :cond_0

    .line 185
    :try_start_3
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 186
    :catch_1
    move-exception v7

    .line 187
    .restart local v7       #e:Ljava/io/IOException;
    const-string v1, "Telerik"

    invoke-virtual {v7}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 173
    .end local v7           #e:Ljava/io/IOException;
    :cond_2
    :try_start_4
    invoke-interface {v12}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    .line 174
    .local v13, responseLine:Lorg/apache/http/StatusLine;
    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_3

    .line 175
    invoke-interface {v12}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/telerik/util/MistSync;->unzipFiles(Ljava/io/InputStream;)V

    .line 176
    new-instance v0, Lcom/telerik/util/MistSync$MistSyncResult;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;ZLcom/telerik/util/MistSync$MistSyncResult;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 183
    if-eqz v9, :cond_0

    .line 185
    :try_start_5
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_0

    .line 186
    :catch_2
    move-exception v7

    .line 187
    .restart local v7       #e:Ljava/io/IOException;
    const-string v1, "Telerik"

    invoke-virtual {v7}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 178
    .end local v7           #e:Ljava/io/IOException;
    :cond_3
    :try_start_6
    new-instance v0, Lcom/telerik/util/MistSync$MistSyncResult;

    const/4 v2, 0x0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "HTTP Error + "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 179
    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v4

    .line 178
    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;Lcom/telerik/util/MistSync$MistSyncResult;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 183
    if-eqz v9, :cond_0

    .line 185
    :try_start_7
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    goto/16 :goto_0

    .line 186
    :catch_3
    move-exception v7

    .line 187
    .restart local v7       #e:Ljava/io/IOException;
    const-string v1, "Telerik"

    invoke-virtual {v7}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 182
    .end local v6           #client:Lorg/apache/http/client/HttpClient;
    .end local v7           #e:Ljava/io/IOException;
    .end local v8           #hostParts:[Ljava/lang/String;
    .end local v10           #qparams:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v11           #request:Lorg/apache/http/client/methods/HttpGet;
    .end local v12           #response:Lorg/apache/http/HttpResponse;
    .end local v13           #responseLine:Lorg/apache/http/StatusLine;
    .end local v14           #uri:Ljava/net/URI;
    :catchall_0
    move-exception v0

    .line 183
    if-eqz v9, :cond_4

    .line 185
    :try_start_8
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 191
    :cond_4
    :goto_1
    throw v0

    .line 186
    :catch_4
    move-exception v7

    .line 187
    .restart local v7       #e:Ljava/io/IOException;
    const-string v1, "Telerik"

    invoke-virtual {v7}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public sync()V
    .locals 5

    .prologue
    .line 78
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v2, p0, Lcom/telerik/util/MistSync;->context:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 79
    .local v0, dialog:Landroid/app/ProgressDialog;
    const-string v2, "Please wait while the latest changes are being retrieved..."

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 80
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 82
    new-instance v1, Lcom/telerik/util/MistSync$1;

    invoke-direct {v1, p0, v0}, Lcom/telerik/util/MistSync$1;-><init>(Lcom/telerik/util/MistSync;Landroid/app/ProgressDialog;)V

    .line 122
    .local v1, updateFilesTask:Landroid/os/AsyncTask;,"Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Integer;Lcom/telerik/util/MistSync$MistSyncResult;>;"
    const/4 v2, -0x2

    const-string v3, "Cancel"

    new-instance v4, Lcom/telerik/util/MistSync$2;

    invoke-direct {v4, p0, v1}, Lcom/telerik/util/MistSync$2;-><init>(Lcom/telerik/util/MistSync;Landroid/os/AsyncTask;)V

    invoke-virtual {v0, v2, v3, v4}, Landroid/app/ProgressDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 128
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 130
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 131
    return-void
.end method
