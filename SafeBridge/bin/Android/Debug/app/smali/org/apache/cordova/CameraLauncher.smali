.class public Lorg/apache/cordova/CameraLauncher;
.super Lorg/apache/cordova/api/CordovaPlugin;
.source "CameraLauncher.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# static fields
.field private static final ALLMEDIA:I = 0x2

.field private static final CAMERA:I = 0x1

.field private static final DATA_URL:I = 0x0

.field private static final FILE_URI:I = 0x1

.field private static final GET_All:Ljava/lang/String; = "Get All"

.field private static final GET_PICTURE:Ljava/lang/String; = "Get Picture"

.field private static final GET_VIDEO:Ljava/lang/String; = "Get Video"

.field private static final JPEG:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "CameraLauncher"

.field private static final PHOTOLIBRARY:I = 0x0

.field private static final PICTURE:I = 0x0

.field private static final PNG:I = 0x1

.field private static final SAVEDPHOTOALBUM:I = 0x2

.field private static final VIDEO:I = 0x1


# instance fields
.field public callbackContext:Lorg/apache/cordova/api/CallbackContext;

.field private conn:Landroid/media/MediaScannerConnection;

.field private correctOrientation:Z

.field private encodingType:I

.field private imageUri:Landroid/net/Uri;

.field private mQuality:I

.field private mediaType:I

.field private numPics:I

.field private saveToPhotoAlbum:Z

.field private scanMe:Landroid/net/Uri;

.field private targetHeight:I

.field private targetWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Lorg/apache/cordova/api/CordovaPlugin;-><init>()V

    .line 101
    return-void
.end method

.method public static calculateSampleSize(IIII)I
    .locals 4
    .parameter "srcWidth"
    .parameter "srcHeight"
    .parameter "dstWidth"
    .parameter "dstHeight"

    .prologue
    .line 632
    int-to-float v2, p0

    int-to-float v3, p1

    div-float v1, v2, v3

    .line 633
    .local v1, srcAspect:F
    int-to-float v2, p2

    int-to-float v3, p3

    div-float v0, v2, v3

    .line 635
    .local v0, dstAspect:F
    cmpl-float v2, v1, v0

    if-lez v2, :cond_0

    .line 636
    div-int v2, p0, p2

    .line 638
    :goto_0
    return v2

    :cond_0
    div-int v2, p1, p3

    goto :goto_0
.end method

.method private checkForDuplicateImage(I)V
    .locals 9
    .parameter "type"

    .prologue
    const/4 v8, 0x0

    .line 685
    const/4 v3, 0x1

    .line 686
    .local v3, diff:I
    invoke-direct {p0}, Lorg/apache/cordova/CameraLauncher;->whichContentStore()Landroid/net/Uri;

    move-result-object v0

    .line 687
    .local v0, contentStore:Landroid/net/Uri;
    invoke-direct {p0, v0}, Lorg/apache/cordova/CameraLauncher;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v2

    .line 688
    .local v2, cursor:Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    .line 690
    .local v1, currentNumOfImages:I
    const/4 v6, 0x1

    if-ne p1, v6, :cond_0

    iget-boolean v6, p0, Lorg/apache/cordova/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v6, :cond_0

    .line 691
    const/4 v3, 0x2

    .line 695
    :cond_0
    iget v6, p0, Lorg/apache/cordova/CameraLauncher;->numPics:I

    sub-int v6, v1, v6

    if-ne v6, v3, :cond_2

    .line 696
    invoke-interface {v2}, Landroid/database/Cursor;->moveToLast()Z

    .line 697
    const-string v6, "_id"

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 698
    .local v4, id:I
    const/4 v6, 0x2

    if-ne v3, v6, :cond_1

    .line 699
    add-int/lit8 v4, v4, -0x1

    .line 701
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 702
    .local v5, uri:Landroid/net/Uri;
    iget-object v6, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v5, v8, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 704
    .end local v4           #id:I
    .end local v5           #uri:Landroid/net/Uri;
    :cond_2
    return-void
.end method

.method private cleanup(ILandroid/net/Uri;Landroid/net/Uri;Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "imageType"
    .parameter "oldImage"
    .parameter "newImage"
    .parameter "bitmap"

    .prologue
    .line 661
    if-eqz p4, :cond_0

    .line 662
    invoke-virtual {p4}, Landroid/graphics/Bitmap;->recycle()V

    .line 666
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/FileUtils;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 668
    invoke-direct {p0, p1}, Lorg/apache/cordova/CameraLauncher;->checkForDuplicateImage(I)V

    .line 670
    iget-boolean v0, p0, Lorg/apache/cordova/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v0, :cond_1

    if-eqz p3, :cond_1

    .line 671
    invoke-direct {p0, p3}, Lorg/apache/cordova/CameraLauncher;->scanForGallery(Landroid/net/Uri;)V

    .line 674
    :cond_1
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 675
    return-void
.end method

.method private createCaptureFile(I)Ljava/io/File;
    .locals 4
    .parameter "encodingType"

    .prologue
    .line 210
    const/4 v0, 0x0

    .line 211
    .local v0, photo:Ljava/io/File;
    if-nez p1, :cond_0

    .line 212
    new-instance v0, Ljava/io/File;

    .end local v0           #photo:Ljava/io/File;
    iget-object v1, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".Pic.jpg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .restart local v0       #photo:Ljava/io/File;
    :goto_0
    return-object v0

    .line 213
    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 214
    new-instance v0, Ljava/io/File;

    .end local v0           #photo:Ljava/io/File;
    iget-object v1, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".Pic.png"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0       #photo:Ljava/io/File;
    goto :goto_0

    .line 216
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid Encoding Type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getRotatedBitmap(ILandroid/graphics/Bitmap;Lorg/apache/cordova/ExifHelper;)Landroid/graphics/Bitmap;
    .locals 7
    .parameter "rotate"
    .parameter "bitmap"
    .parameter "exif"

    .prologue
    const/4 v1, 0x0

    const/high16 v4, 0x4000

    .line 490
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 491
    .local v5, matrix:Landroid/graphics/Matrix;
    const/16 v0, 0xb4

    if-ne p1, v0, :cond_0

    .line 492
    int-to-float v0, p1

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 496
    :goto_0
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p2

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 497
    invoke-virtual {p3}, Lorg/apache/cordova/ExifHelper;->resetOrientation()V

    .line 498
    return-object p2

    .line 494
    :cond_0
    int-to-float v0, p1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v4

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v4

    invoke-virtual {v5, v0, v2, v3}, Landroid/graphics/Matrix;->setRotate(FFF)V

    goto :goto_0
.end method

.method private getScaledBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 9
    .parameter "imagePath"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 554
    iget v3, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    if-gtz v3, :cond_0

    iget v3, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    if-gtz v3, :cond_0

    .line 555
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 571
    :goto_0
    return-object v3

    .line 559
    :cond_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 560
    .local v0, options:Landroid/graphics/BitmapFactory$Options;
    iput-boolean v7, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 561
    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 564
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {p0, v3, v4}, Lorg/apache/cordova/CameraLauncher;->calculateAspectRatio(II)[I

    move-result-object v2

    .line 567
    .local v2, widthHeight:[I
    iput-boolean v8, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 568
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v5, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    iget v6, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    invoke-static {v3, v4, v5, v6}, Lorg/apache/cordova/CameraLauncher;->calculateSampleSize(IIII)I

    move-result v3

    iput v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 569
    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 571
    .local v1, unscaledBitmap:Landroid/graphics/Bitmap;
    aget v3, v2, v8

    aget v4, v2, v7

    invoke-static {v1, v3, v4, v7}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_0
.end method

.method private getUriFromMediaStore()Landroid/net/Uri;
    .locals 6

    .prologue
    .line 529
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 530
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "mime_type"

    const-string v5, "image/jpeg"

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    :try_start_0
    iget-object v4, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 543
    :goto_0
    return-object v2

    .line 534
    :catch_0
    move-exception v0

    .line 535
    .local v0, e:Ljava/lang/UnsupportedOperationException;
    const-string v4, "CameraLauncher"

    const-string v5, "Can\'t write to external media storage."

    invoke-static {v4, v5}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 537
    :try_start_1
    iget-object v4, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .local v2, uri:Landroid/net/Uri;
    goto :goto_0

    .line 538
    .end local v2           #uri:Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 539
    .local v1, ex:Ljava/lang/UnsupportedOperationException;
    const-string v4, "CameraLauncher"

    const-string v5, "Can\'t write to internal media storage."

    invoke-static {v4, v5}, Lorg/apache/cordova/api/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 540
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;
    .locals 6
    .parameter "contentStore"

    .prologue
    const/4 v3, 0x0

    .line 648
    iget-object v0, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v1

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private scanForGallery(Landroid/net/Uri;)V
    .locals 2
    .parameter "newImage"

    .prologue
    .line 751
    iput-object p1, p0, Lorg/apache/cordova/CameraLauncher;->scanMe:Landroid/net/Uri;

    .line 752
    iget-object v0, p0, Lorg/apache/cordova/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    if-eqz v0, :cond_0

    .line 753
    iget-object v0, p0, Lorg/apache/cordova/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 755
    :cond_0
    new-instance v0, Landroid/media/MediaScannerConnection;

    iget-object v1, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    iput-object v0, p0, Lorg/apache/cordova/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    .line 756
    iget-object v0, p0, Lorg/apache/cordova/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->connect()V

    .line 757
    return-void
.end method

.method private whichContentStore()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 711
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 712
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 714
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0
.end method

.method private writeUncompressedImage(Landroid/net/Uri;)V
    .locals 5
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 511
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v4, p0, Lorg/apache/cordova/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/FileUtils;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 512
    .local v1, fis:Ljava/io/FileInputStream;
    iget-object v4, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v3

    .line 513
    .local v3, os:Ljava/io/OutputStream;
    const/16 v4, 0x1000

    new-array v0, v4, [B

    .line 515
    .local v0, buffer:[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    .local v2, len:I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    .line 516
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 518
    :cond_0
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 519
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 520
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 521
    return-void
.end method


# virtual methods
.method public calculateAspectRatio(II)[I
    .locals 11
    .parameter "origWidth"
    .parameter "origHeight"

    .prologue
    .line 582
    iget v3, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 583
    .local v3, newWidth:I
    iget v0, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 586
    .local v0, newHeight:I
    if-gtz v3, :cond_1

    if-gtz v0, :cond_1

    .line 587
    move v3, p1

    .line 588
    move v0, p2

    .line 615
    :cond_0
    :goto_0
    const/4 v7, 0x2

    new-array v6, v7, [I

    .line 616
    .local v6, retval:[I
    const/4 v7, 0x0

    aput v3, v6, v7

    .line 617
    const/4 v7, 0x1

    aput v0, v6, v7

    .line 618
    return-object v6

    .line 591
    .end local v6           #retval:[I
    :cond_1
    if-lez v3, :cond_2

    if-gtz v0, :cond_2

    .line 592
    mul-int v7, v3, p2

    div-int v0, v7, p1

    goto :goto_0

    .line 595
    :cond_2
    if-gtz v3, :cond_3

    if-lez v0, :cond_3

    .line 596
    mul-int v7, v0, p1

    div-int v3, v7, p2

    goto :goto_0

    .line 605
    :cond_3
    int-to-double v7, v3

    int-to-double v9, v0

    div-double v1, v7, v9

    .line 606
    .local v1, newRatio:D
    int-to-double v7, p1

    int-to-double v9, p2

    div-double v4, v7, v9

    .line 608
    .local v4, origRatio:D
    cmpl-double v7, v4, v1

    if-lez v7, :cond_4

    .line 609
    mul-int v7, v3, p2

    div-int v0, v7, p1

    goto :goto_0

    .line 610
    :cond_4
    cmpg-double v7, v4, v1

    if-gez v7, :cond_0

    .line 611
    mul-int v7, v0, p1

    div-int v3, v7, p2

    goto :goto_0
.end method

.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/api/CallbackContext;)Z
    .locals 8
    .parameter "action"
    .parameter "args"
    .parameter "callbackContext"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 120
    iput-object p3, p0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    .line 122
    const-string v5, "takePicture"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 123
    const/4 v2, 0x1

    .line 124
    .local v2, srcType:I
    const/4 v0, 0x1

    .line 125
    .local v0, destType:I
    iput-boolean v4, p0, Lorg/apache/cordova/CameraLauncher;->saveToPhotoAlbum:Z

    .line 126
    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 127
    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 128
    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    .line 129
    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    .line 130
    const/16 v5, 0x50

    iput v5, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    .line 132
    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    .line 133
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->getInt(I)I

    move-result v0

    .line 134
    invoke-virtual {p2, v7}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    .line 135
    const/4 v4, 0x3

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 136
    const/4 v4, 0x4

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 137
    const/4 v4, 0x5

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    .line 138
    const/4 v4, 0x6

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v4

    iput v4, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    .line 140
    const/16 v4, 0x8

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v4

    iput-boolean v4, p0, Lorg/apache/cordova/CameraLauncher;->correctOrientation:Z

    .line 141
    const/16 v4, 0x9

    invoke-virtual {p2, v4}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v4

    iput-boolean v4, p0, Lorg/apache/cordova/CameraLauncher;->saveToPhotoAlbum:Z

    .line 145
    iget v4, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    if-ge v4, v3, :cond_0

    .line 146
    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    .line 148
    :cond_0
    iget v4, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    if-ge v4, v3, :cond_1

    .line 149
    iput v6, p0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    .line 152
    :cond_1
    if-ne v2, v3, :cond_3

    .line 153
    iget v4, p0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    invoke-virtual {p0, v0, v4}, Lorg/apache/cordova/CameraLauncher;->takePicture(II)V

    .line 158
    :cond_2
    :goto_0
    new-instance v1, Lorg/apache/cordova/api/PluginResult;

    sget-object v4, Lorg/apache/cordova/api/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/api/PluginResult$Status;

    invoke-direct {v1, v4}, Lorg/apache/cordova/api/PluginResult;-><init>(Lorg/apache/cordova/api/PluginResult$Status;)V

    .line 159
    .local v1, r:Lorg/apache/cordova/api/PluginResult;
    invoke-virtual {v1, v3}, Lorg/apache/cordova/api/PluginResult;->setKeepCallback(Z)V

    .line 160
    invoke-virtual {p3, v1}, Lorg/apache/cordova/api/CallbackContext;->sendPluginResult(Lorg/apache/cordova/api/PluginResult;)V

    .line 163
    .end local v0           #destType:I
    .end local v1           #r:Lorg/apache/cordova/api/PluginResult;
    .end local v2           #srcType:I
    :goto_1
    return v3

    .line 155
    .restart local v0       #destType:I
    .restart local v2       #srcType:I
    :cond_3
    if-eqz v2, :cond_4

    if-ne v2, v7, :cond_2

    .line 156
    :cond_4
    invoke-virtual {p0, v2, v0}, Lorg/apache/cordova/CameraLauncher;->getImage(II)V

    goto :goto_0

    .end local v0           #destType:I
    .end local v2           #srcType:I
    :cond_5
    move v3, v4

    .line 163
    goto :goto_1
.end method

.method public failPicture(Ljava/lang/String;)V
    .locals 1
    .parameter "err"

    .prologue
    .line 747
    iget-object v0, p0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual {v0, p1}, Lorg/apache/cordova/api/CallbackContext;->error(Ljava/lang/String;)V

    .line 748
    return-void
.end method

.method public getImage(II)V
    .locals 5
    .parameter "srcType"
    .parameter "returnType"

    .prologue
    .line 230
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 231
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "Get Picture"

    .line 232
    .local v1, title:Ljava/lang/String;
    iget v2, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    if-nez v2, :cond_2

    .line 233
    const-string v2, "image/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 246
    :cond_0
    :goto_0
    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 247
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 248
    iget-object v2, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    if-eqz v2, :cond_1

    .line 249
    iget-object v2, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v3

    add-int/lit8 v4, p1, 0x1

    mul-int/lit8 v4, v4, 0x10

    add-int/2addr v4, p2

    add-int/lit8 v4, v4, 0x1

    invoke-interface {v2, p0, v3, v4}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/CordovaPlugin;Landroid/content/Intent;I)V

    .line 252
    :cond_1
    return-void

    .line 235
    :cond_2
    iget v2, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    .line 236
    const-string v2, "video/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 237
    const-string v1, "Get Video"

    goto :goto_0

    .line 239
    :cond_3
    iget v2, p0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 242
    const-string v2, "*/*"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 243
    const-string v1, "Get All"

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 26
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "intent"

    .prologue
    .line 265
    div-int/lit8 v3, p1, 0x10

    add-int/lit8 v24, v3, -0x1

    .line 266
    .local v24, srcType:I
    rem-int/lit8 v3, p1, 0x10

    add-int/lit8 v15, v3, -0x1

    .line 267
    .local v15, destType:I
    const/16 v23, 0x0

    .line 270
    .local v23, rotate:I
    const/4 v3, 0x1

    move/from16 v0, v24

    if-ne v0, v3, :cond_d

    .line 272
    const/4 v3, -0x1

    move/from16 v0, p2

    if-ne v0, v3, :cond_b

    .line 275
    :try_start_0
    new-instance v17, Lorg/apache/cordova/ExifHelper;

    invoke-direct/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 277
    .local v17, exif:Lorg/apache/cordova/ExifHelper;
    :try_start_1
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v3, :cond_0

    .line 278
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/.Pic.jpg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lorg/apache/cordova/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 279
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->readExifData()V

    .line 280
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->getOrientation()I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v23

    .line 286
    :cond_0
    :goto_0
    const/4 v13, 0x0

    .line 287
    .local v13, bitmap:Landroid/graphics/Bitmap;
    const/16 v25, 0x0

    .line 290
    .local v25, uri:Landroid/net/Uri;
    if-nez v15, :cond_4

    .line 291
    :try_start_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/cordova/FileUtils;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/apache/cordova/CameraLauncher;->getScaledBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 293
    if-eqz v23, :cond_1

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/cordova/CameraLauncher;->correctOrientation:Z

    if-eqz v3, :cond_1

    .line 294
    move-object/from16 v0, p0

    move/from16 v1, v23

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v13, v2}, Lorg/apache/cordova/CameraLauncher;->getRotatedBitmap(ILandroid/graphics/Bitmap;Lorg/apache/cordova/ExifHelper;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 297
    :cond_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/apache/cordova/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;)V

    .line 298
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/apache/cordova/CameraLauncher;->checkForDuplicateImage(I)V

    .line 347
    :cond_2
    :goto_1
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/CameraLauncher;->imageUri:Landroid/net/Uri;

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v3, v4, v1, v13}, Lorg/apache/cordova/CameraLauncher;->cleanup(ILandroid/net/Uri;Landroid/net/Uri;Landroid/graphics/Bitmap;)V

    .line 479
    .end local v13           #bitmap:Landroid/graphics/Bitmap;
    .end local v17           #exif:Lorg/apache/cordova/ExifHelper;
    .end local v25           #uri:Landroid/net/Uri;
    :cond_3
    :goto_2
    return-void

    .line 282
    .restart local v17       #exif:Lorg/apache/cordova/ExifHelper;
    :catch_0
    move-exception v16

    .line 283
    .local v16, e:Ljava/io/IOException;
    invoke-virtual/range {v16 .. v16}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 350
    .end local v16           #e:Ljava/io/IOException;
    .end local v17           #exif:Lorg/apache/cordova/ExifHelper;
    :catch_1
    move-exception v16

    .line 351
    .restart local v16       #e:Ljava/io/IOException;
    invoke-virtual/range {v16 .. v16}, Ljava/io/IOException;->printStackTrace()V

    .line 352
    const-string v3, "Error capturing image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_2

    .line 302
    .end local v16           #e:Ljava/io/IOException;
    .restart local v13       #bitmap:Landroid/graphics/Bitmap;
    .restart local v17       #exif:Lorg/apache/cordova/ExifHelper;
    .restart local v25       #uri:Landroid/net/Uri;
    :cond_4
    const/4 v3, 0x1

    if-ne v15, v3, :cond_2

    .line 303
    :try_start_3
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/cordova/CameraLauncher;->saveToPhotoAlbum:Z

    if-nez v3, :cond_7

    .line 304
    new-instance v3, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".jpg"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v25

    .line 309
    :goto_3
    if-nez v25, :cond_5

    .line 310
    const-string v3, "Error capturing image - no media storage found."

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    .line 314
    :cond_5
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_8

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_8

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    const/16 v4, 0x64

    if-ne v3, v4, :cond_8

    if-nez v23, :cond_8

    .line 315
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lorg/apache/cordova/CameraLauncher;->writeUncompressedImage(Landroid/net/Uri;)V

    .line 317
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual/range {v25 .. v25}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V

    .line 344
    :cond_6
    :goto_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual/range {v25 .. v25}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 306
    :cond_7
    invoke-direct/range {p0 .. p0}, Lorg/apache/cordova/CameraLauncher;->getUriFromMediaStore()Landroid/net/Uri;

    move-result-object v25

    goto :goto_3

    .line 319
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->imageUri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/cordova/FileUtils;->stripFileProtocol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/apache/cordova/CameraLauncher;->getScaledBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 321
    if-eqz v23, :cond_9

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/cordova/CameraLauncher;->correctOrientation:Z

    if-eqz v3, :cond_9

    .line 322
    move-object/from16 v0, p0

    move/from16 v1, v23

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v13, v2}, Lorg/apache/cordova/CameraLauncher;->getRotatedBitmap(ILandroid/graphics/Bitmap;Lorg/apache/cordova/ExifHelper;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 326
    :cond_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, v25

    invoke-virtual {v3, v0}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v21

    .line 327
    .local v21, os:Ljava/io/OutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    move-object/from16 v0, v21

    invoke-virtual {v13, v3, v4, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 328
    invoke-virtual/range {v21 .. v21}, Ljava/io/OutputStream;->close()V

    .line 331
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v3, :cond_6

    .line 333
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/cordova/CameraLauncher;->saveToPhotoAlbum:Z

    if-eqz v3, :cond_a

    .line 334
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v0, v25

    invoke-static {v0, v3}, Lorg/apache/cordova/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v18

    .line 338
    .local v18, exifPath:Ljava/lang/String;
    :goto_5
    invoke-virtual/range {v17 .. v18}, Lorg/apache/cordova/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 339
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->writeExifData()V

    goto :goto_4

    .line 336
    .end local v18           #exifPath:Ljava/lang/String;
    :cond_a
    invoke-virtual/range {v25 .. v25}, Landroid/net/Uri;->getPath()Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v18

    .restart local v18       #exifPath:Ljava/lang/String;
    goto :goto_5

    .line 357
    .end local v13           #bitmap:Landroid/graphics/Bitmap;
    .end local v17           #exif:Lorg/apache/cordova/ExifHelper;
    .end local v18           #exifPath:Ljava/lang/String;
    .end local v21           #os:Ljava/io/OutputStream;
    .end local v25           #uri:Landroid/net/Uri;
    :cond_b
    if-nez p2, :cond_c

    .line 358
    const-string v3, "Camera cancelled."

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 363
    :cond_c
    const-string v3, "Did not complete!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 368
    :cond_d
    if-eqz v24, :cond_e

    const/4 v3, 0x2

    move/from16 v0, v24

    if-ne v0, v3, :cond_3

    .line 369
    :cond_e
    const/4 v3, -0x1

    move/from16 v0, p2

    if-ne v0, v3, :cond_1c

    .line 370
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v25

    .line 374
    .restart local v25       #uri:Landroid/net/Uri;
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->mediaType:I

    if-eqz v3, :cond_f

    .line 375
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual/range {v25 .. v25}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 380
    :cond_f
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_10

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_10

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    const/16 v4, 0x64

    if-ne v3, v4, :cond_10

    const/4 v3, 0x1

    if-ne v15, v3, :cond_10

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/cordova/CameraLauncher;->correctOrientation:Z

    if-nez v3, :cond_10

    .line 382
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual/range {v25 .. v25}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 385
    :cond_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v0, v25

    invoke-static {v0, v3}, Lorg/apache/cordova/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v19

    .line 386
    .local v19, imagePath:Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Lorg/apache/cordova/FileUtils;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 390
    .local v20, mimeType:Ljava/lang/String;
    if-eqz v19, :cond_11

    if-eqz v20, :cond_11

    const-string v3, "image/jpeg"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_12

    const-string v3, "image/png"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_12

    .line 392
    :cond_11
    const-string v3, "CameraLauncher"

    const-string v4, "I either have a null image path or bitmap"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    const-string v3, "Unable to retrieve path to picture!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 396
    :cond_12
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/cordova/CameraLauncher;->getScaledBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 397
    .restart local v13       #bitmap:Landroid/graphics/Bitmap;
    if-nez v13, :cond_13

    .line 398
    const-string v3, "CameraLauncher"

    const-string v4, "I either have a null image path or bitmap"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    const-string v3, "Unable to create bitmap!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 403
    :cond_13
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/cordova/CameraLauncher;->correctOrientation:Z

    if-eqz v3, :cond_15

    .line 404
    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "orientation"

    aput-object v4, v5, v3

    .line 405
    .local v5, cols:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v3}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 407
    .local v14, cursor:Landroid/database/Cursor;
    if-eqz v14, :cond_14

    .line 408
    const/4 v3, 0x0

    invoke-interface {v14, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 409
    const/4 v3, 0x0

    invoke-interface {v14, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    .line 410
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 412
    :cond_14
    if-eqz v23, :cond_15

    .line 413
    new-instance v11, Landroid/graphics/Matrix;

    invoke-direct {v11}, Landroid/graphics/Matrix;-><init>()V

    .line 414
    .local v11, matrix:Landroid/graphics/Matrix;
    move/from16 v0, v23

    int-to-float v3, v0

    invoke-virtual {v11, v3}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 415
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    const/4 v12, 0x1

    move-object v6, v13

    invoke-static/range {v6 .. v12}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v13

    .line 420
    .end local v5           #cols:[Ljava/lang/String;
    .end local v11           #matrix:Landroid/graphics/Matrix;
    .end local v14           #cursor:Landroid/database/Cursor;
    :cond_15
    if-nez v15, :cond_18

    .line 421
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/apache/cordova/CameraLauncher;->processPicture(Landroid/graphics/Bitmap;)V

    .line 464
    :cond_16
    :goto_6
    if-eqz v13, :cond_17

    .line 465
    invoke-virtual {v13}, Landroid/graphics/Bitmap;->recycle()V

    .line 466
    const/4 v13, 0x0

    .line 468
    :cond_17
    invoke-static {}, Ljava/lang/System;->gc()V

    goto/16 :goto_2

    .line 425
    :cond_18
    const/4 v3, 0x1

    if-ne v15, v3, :cond_16

    .line 427
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->targetHeight:I

    if-lez v3, :cond_1b

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->targetWidth:I

    if-lez v3, :cond_1b

    .line 430
    :try_start_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/api/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/cordova/DirectoryManager;->getTempDirectoryPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/resize.jpg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 431
    .local v22, resizePath:Ljava/lang/String;
    new-instance v17, Lorg/apache/cordova/ExifHelper;

    invoke-direct/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;-><init>()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 433
    .restart local v17       #exif:Lorg/apache/cordova/ExifHelper;
    :try_start_5
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v3, :cond_19

    .line 434
    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/cordova/ExifHelper;->createInFile(Ljava/lang/String;)V

    .line 435
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->readExifData()V

    .line 436
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->getOrientation()I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-result v23

    .line 442
    :cond_19
    :goto_7
    :try_start_6
    new-instance v21, Ljava/io/FileOutputStream;

    invoke-direct/range {v21 .. v22}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 443
    .restart local v21       #os:Ljava/io/OutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    move-object/from16 v0, v21

    invoke-virtual {v13, v3, v4, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 444
    invoke-virtual/range {v21 .. v21}, Ljava/io/OutputStream;->close()V

    .line 447
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/cordova/CameraLauncher;->encodingType:I

    if-nez v3, :cond_1a

    .line 448
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    move-object/from16 v0, v25

    invoke-static {v0, v3}, Lorg/apache/cordova/FileUtils;->getRealPathFromURI(Landroid/net/Uri;Lorg/apache/cordova/api/CordovaInterface;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lorg/apache/cordova/ExifHelper;->createOutFile(Ljava/lang/String;)V

    .line 449
    invoke-virtual/range {v17 .. v17}, Lorg/apache/cordova/ExifHelper;->writeExifData()V

    .line 454
    :cond_1a
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file://"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "?"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto/16 :goto_6

    .line 455
    .end local v17           #exif:Lorg/apache/cordova/ExifHelper;
    .end local v21           #os:Ljava/io/OutputStream;
    .end local v22           #resizePath:Ljava/lang/String;
    :catch_2
    move-exception v16

    .line 456
    .local v16, e:Ljava/lang/Exception;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V

    .line 457
    const-string v3, "Error retrieving image."

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 438
    .end local v16           #e:Ljava/lang/Exception;
    .restart local v17       #exif:Lorg/apache/cordova/ExifHelper;
    .restart local v22       #resizePath:Ljava/lang/String;
    :catch_3
    move-exception v16

    .line 439
    .local v16, e:Ljava/io/IOException;
    :try_start_7
    invoke-virtual/range {v16 .. v16}, Ljava/io/IOException;->printStackTrace()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_7

    .line 461
    .end local v16           #e:Ljava/io/IOException;
    .end local v17           #exif:Lorg/apache/cordova/ExifHelper;
    .end local v22           #resizePath:Ljava/lang/String;
    :cond_1b
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual/range {v25 .. v25}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 472
    .end local v13           #bitmap:Landroid/graphics/Bitmap;
    .end local v19           #imagePath:Ljava/lang/String;
    .end local v20           #mimeType:Ljava/lang/String;
    .end local v25           #uri:Landroid/net/Uri;
    :cond_1c
    if-nez p2, :cond_1d

    .line 473
    const-string v3, "Selection cancelled."

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 476
    :cond_1d
    const-string v3, "Selection did not complete!"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public onMediaScannerConnected()V
    .locals 4

    .prologue
    .line 761
    :try_start_0
    iget-object v1, p0, Lorg/apache/cordova/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    iget-object v2, p0, Lorg/apache/cordova/CameraLauncher;->scanMe:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "image/*"

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 766
    :goto_0
    return-void

    .line 762
    :catch_0
    move-exception v0

    .line 763
    .local v0, e:Ljava/lang/IllegalStateException;
    const-string v1, "CameraLauncher"

    const-string v2, "Can\'t scan file in MediaScanner after taking picture"

    invoke-static {v1, v2}, Lorg/apache/cordova/api/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 1
    .parameter "path"
    .parameter "uri"

    .prologue
    .line 769
    iget-object v0, p0, Lorg/apache/cordova/CameraLauncher;->conn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 770
    return-void
.end method

.method public processPicture(Landroid/graphics/Bitmap;)V
    .locals 7
    .parameter "bitmap"

    .prologue
    .line 724
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 726
    .local v2, jpeg_data:Ljava/io/ByteArrayOutputStream;
    :try_start_0
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iget v6, p0, Lorg/apache/cordova/CameraLauncher;->mQuality:I

    invoke-virtual {p1, v5, v6, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 727
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 728
    .local v0, code:[B
    invoke-static {v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v4

    .line 729
    .local v4, output:[B
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    .line 730
    .local v3, js_out:Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/cordova/CameraLauncher;->callbackContext:Lorg/apache/cordova/api/CallbackContext;

    invoke-virtual {v5, v3}, Lorg/apache/cordova/api/CallbackContext;->success(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 731
    const/4 v3, 0x0

    .line 732
    const/4 v4, 0x0

    .line 738
    .end local v0           #code:[B
    .end local v3           #js_out:Ljava/lang/String;
    .end local v4           #output:[B
    :cond_0
    :goto_0
    const/4 v2, 0x0

    .line 739
    return-void

    .line 735
    :catch_0
    move-exception v1

    .line 736
    .local v1, e:Ljava/lang/Exception;
    const-string v5, "Error compressing image."

    invoke-virtual {p0, v5}, Lorg/apache/cordova/CameraLauncher;->failPicture(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public takePicture(II)V
    .locals 4
    .parameter "returnType"
    .parameter "encodingType"

    .prologue
    .line 186
    invoke-direct {p0}, Lorg/apache/cordova/CameraLauncher;->whichContentStore()Landroid/net/Uri;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/cordova/CameraLauncher;->queryImgDB(Landroid/net/Uri;)Landroid/database/Cursor;

    move-result-object v2

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    iput v2, p0, Lorg/apache/cordova/CameraLauncher;->numPics:I

    .line 189
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 192
    .local v0, intent:Landroid/content/Intent;
    invoke-direct {p0, p2}, Lorg/apache/cordova/CameraLauncher;->createCaptureFile(I)Ljava/io/File;

    move-result-object v1

    .line 193
    .local v1, photo:Ljava/io/File;
    const-string v2, "output"

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 194
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/cordova/CameraLauncher;->imageUri:Landroid/net/Uri;

    .line 196
    iget-object v2, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    if-eqz v2, :cond_0

    .line 197
    iget-object v2, p0, Lorg/apache/cordova/CameraLauncher;->cordova:Lorg/apache/cordova/api/CordovaInterface;

    add-int/lit8 v3, p1, 0x20

    add-int/lit8 v3, v3, 0x1

    invoke-interface {v2, p0, v0, v3}, Lorg/apache/cordova/api/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/api/CordovaPlugin;Landroid/content/Intent;I)V

    .line 201
    :cond_0
    return-void
.end method
