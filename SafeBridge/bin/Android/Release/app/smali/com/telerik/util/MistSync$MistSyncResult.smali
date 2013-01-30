.class Lcom/telerik/util/MistSync$MistSyncResult;
.super Ljava/lang/Object;
.source "MistSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/telerik/util/MistSync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MistSyncResult"
.end annotation


# instance fields
.field public exception:Ljava/lang/Throwable;

.field public message:Ljava/lang/String;

.field public success:Z

.field final synthetic this$0:Lcom/telerik/util/MistSync;

.field public title:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/telerik/util/MistSync;)V
    .locals 0
    .parameter

    .prologue
    .line 42
    iput-object p1, p0, Lcom/telerik/util/MistSync$MistSyncResult;->this$0:Lcom/telerik/util/MistSync;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method synthetic constructor <init>(Lcom/telerik/util/MistSync;Lcom/telerik/util/MistSync$MistSyncResult;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;)V

    return-void
.end method

.method private constructor <init>(Lcom/telerik/util/MistSync;Z)V
    .locals 6
    .parameter
    .parameter "success"

    .prologue
    const/4 v3, 0x0

    .line 46
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    return-void
.end method

.method synthetic constructor <init>(Lcom/telerik/util/MistSync;ZLcom/telerik/util/MistSync$MistSyncResult;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;Z)V

    return-void
.end method

.method private constructor <init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter
    .parameter "success"
    .parameter "title"
    .parameter "message"

    .prologue
    .line 50
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    return-void
.end method

.method synthetic constructor <init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;Lcom/telerik/util/MistSync$MistSyncResult;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter
    .parameter "success"
    .parameter "title"
    .parameter "message"
    .parameter "exception"

    .prologue
    .line 53
    iput-object p1, p0, Lcom/telerik/util/MistSync$MistSyncResult;->this$0:Lcom/telerik/util/MistSync;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-boolean p2, p0, Lcom/telerik/util/MistSync$MistSyncResult;->success:Z

    .line 55
    iput-object p3, p0, Lcom/telerik/util/MistSync$MistSyncResult;->title:Ljava/lang/String;

    .line 56
    iput-object p4, p0, Lcom/telerik/util/MistSync$MistSyncResult;->message:Ljava/lang/String;

    .line 57
    iput-object p5, p0, Lcom/telerik/util/MistSync$MistSyncResult;->exception:Ljava/lang/Throwable;

    .line 58
    return-void
.end method

.method synthetic constructor <init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Lcom/telerik/util/MistSync$MistSyncResult;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 53
    invoke-direct/range {p0 .. p5}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
