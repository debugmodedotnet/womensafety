.class public Lcom/telerik/util/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .parameter "input"
    .parameter "output"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    const/16 v2, 0x2800

    new-array v0, v2, [B

    .line 31
    .local v0, buffer:[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, bytesRead:I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 35
    return-void

    .line 33
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static save(Ljava/io/File;Ljava/io/InputStream;)V
    .locals 3
    .parameter "file"
    .parameter "input"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    .line 15
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 17
    .local v1, output:Ljava/io/FileOutputStream;
    invoke-static {p1, v1}, Lcom/telerik/util/FileUtil;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 19
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    return-void

    .line 20
    .end local v1           #output:Ljava/io/FileOutputStream;
    :catch_0
    move-exception v0

    .line 21
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 22
    throw v0
.end method
