.class public Lcom/telerik/util/Bootstrapper;
.super Ljava/lang/Object;
.source "Bootstrapper.java"


# instance fields
.field private context:Lorg/apache/cordova/DroidGap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget-object v0, Lcom/telerik/util/GlobalContext;->mainActivity:Landroid/app/Activity;

    check-cast v0, Lorg/apache/cordova/DroidGap;

    iput-object v0, p0, Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;

    .line 20
    return-void
.end method

.method static synthetic access$0(Lcom/telerik/util/Bootstrapper;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/telerik/util/Bootstrapper;->copyAssetsToBaseDirFrom(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/telerik/util/Bootstrapper;)Lorg/apache/cordova/DroidGap;
    .locals 1
    .parameter

    .prologue
    .line 16
    iget-object v0, p0, Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;

    return-object v0
.end method

.method private copyAssetsToBaseDirFrom(Ljava/lang/String;)V
    .locals 13
    .parameter "dir"

    .prologue
    .line 65
    :try_start_0
    iget-object v8, p0, Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v8}, Lorg/apache/cordova/DroidGap;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 66
    .local v0, ass:Landroid/content/res/AssetManager;
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, baseAssets:[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/telerik/util/Bootstrapper;->getBaseUrl()Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, baseUrl:Ljava/lang/String;
    array-length v9, v1

    const/4 v8, 0x0

    :goto_0
    if-lt v8, v9, :cond_0

    .line 87
    .end local v0           #ass:Landroid/content/res/AssetManager;
    .end local v1           #baseAssets:[Ljava/lang/String;
    .end local v2           #baseUrl:Ljava/lang/String;
    :goto_1
    return-void

    .line 68
    .restart local v0       #ass:Landroid/content/res/AssetManager;
    .restart local v1       #baseAssets:[Ljava/lang/String;
    .restart local v2       #baseUrl:Ljava/lang/String;
    :cond_0
    aget-object v5, v1, v8

    .line 69
    .local v5, file:Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 71
    .local v6, filePath:Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/telerik/util/Bootstrapper;->isDirectory(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 72
    invoke-direct {p0, v6}, Lcom/telerik/util/Bootstrapper;->copyAssetsToBaseDirFrom(Ljava/lang/String;)V

    .line 68
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 76
    :cond_1
    new-instance v7, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "content/"

    const-string v12, ""

    invoke-virtual {v6, v11, v12}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 77
    .local v7, toSaveTo:Ljava/io/File;
    new-instance v3, Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v3, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 78
    .local v3, dirPath:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_2

    .line 79
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 81
    :cond_2
    const-string v10, "telerik"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Saving file "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-direct {p0, v6, v7}, Lcom/telerik/util/Bootstrapper;->copyFiles(Ljava/lang/String;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 84
    .end local v0           #ass:Landroid/content/res/AssetManager;
    .end local v1           #baseAssets:[Ljava/lang/String;
    .end local v2           #baseUrl:Ljava/lang/String;
    .end local v3           #dirPath:Ljava/io/File;
    .end local v5           #file:Ljava/lang/String;
    .end local v6           #filePath:Ljava/lang/String;
    .end local v7           #toSaveTo:Ljava/io/File;
    :catch_0
    move-exception v4

    .line 85
    .local v4, e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private copyFiles(Ljava/lang/String;Ljava/io/File;)V
    .locals 4
    .parameter "fromPath"
    .parameter "to"

    .prologue
    .line 90
    iget-object v3, p0, Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v3}, Lorg/apache/cordova/DroidGap;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 92
    .local v0, ass:Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 93
    .local v2, fromStream:Ljava/io/InputStream;
    invoke-static {p2, v2}, Lcom/telerik/util/FileUtil;->save(Ljava/io/File;Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 99
    .end local v2           #fromStream:Ljava/io/InputStream;
    :goto_0
    return-void

    .line 94
    :catch_0
    move-exception v1

    .line 95
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 96
    .end local v1           #e:Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 97
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getProjectFolder()Ljava/lang/String;
    .locals 2

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v1}, Lorg/apache/cordova/DroidGap;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isDirectory(Ljava/lang/String;)Z
    .locals 5
    .parameter "path"

    .prologue
    const/4 v3, 0x0

    .line 107
    :try_start_0
    iget-object v4, p0, Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;

    invoke-virtual {v4}, Lorg/apache/cordova/DroidGap;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 108
    .local v0, ass:Landroid/content/res/AssetManager;
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, baseAssets:[Ljava/lang/String;
    array-length v4, v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v4, :cond_0

    const/4 v3, 0x1

    .line 111
    .end local v0           #ass:Landroid/content/res/AssetManager;
    .end local v1           #baseAssets:[Ljava/lang/String;
    :cond_0
    :goto_0
    return v3

    .line 110
    :catch_0
    move-exception v2

    .line 111
    .local v2, e:Ljava/io/IOException;
    goto :goto_0
.end method


# virtual methods
.method public checkIfFirstLoad()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 31
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/telerik/util/Bootstrapper;->getBaseUrl()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 32
    .local v1, f:Ljava/io/File;
    iget-object v5, p0, Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;

    const-string v6, "preference"

    invoke-virtual {v5, v6, v4}, Lorg/apache/cordova/DroidGap;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 33
    .local v2, pref:Landroid/content/SharedPreferences;
    const-string v5, "firstStart"

    invoke-interface {v2, v5, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 34
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 35
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 37
    :cond_0
    iget-object v4, p0, Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;

    const-string v5, "First Start"

    .line 38
    const-string v6, "Application is being unpacked..."

    .line 37
    invoke-static {v4, v5, v6, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 40
    .local v0, dialog:Landroid/app/ProgressDialog;
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 41
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/telerik/util/Bootstrapper$1;

    invoke-direct {v5, p0, v2, v0}, Lcom/telerik/util/Bootstrapper$1;-><init>(Lcom/telerik/util/Bootstrapper;Landroid/content/SharedPreferences;Landroid/app/ProgressDialog;)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 56
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 59
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :goto_0
    return v3

    :cond_1
    move v3, v4

    goto :goto_0
.end method

.method public getBaseUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/Icenium/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/telerik/util/Bootstrapper;->getProjectFolder()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIndexUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "file://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/telerik/util/Bootstrapper;->getBaseUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "index.html"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
