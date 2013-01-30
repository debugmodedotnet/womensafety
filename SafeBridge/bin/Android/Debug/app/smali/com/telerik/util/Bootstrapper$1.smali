.class Lcom/telerik/util/Bootstrapper$1;
.super Ljava/lang/Object;
.source "Bootstrapper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/telerik/util/Bootstrapper;->checkIfFirstLoad()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/telerik/util/Bootstrapper;

.field private final synthetic val$dialog:Landroid/app/ProgressDialog;

.field private final synthetic val$pref:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Lcom/telerik/util/Bootstrapper;Landroid/content/SharedPreferences;Landroid/app/ProgressDialog;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/telerik/util/Bootstrapper$1;->this$0:Lcom/telerik/util/Bootstrapper;

    iput-object p2, p0, Lcom/telerik/util/Bootstrapper$1;->val$pref:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lcom/telerik/util/Bootstrapper$1;->val$dialog:Landroid/app/ProgressDialog;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/telerik/util/Bootstrapper$1;)Lcom/telerik/util/Bootstrapper;
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/telerik/util/Bootstrapper$1;->this$0:Lcom/telerik/util/Bootstrapper;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 43
    iget-object v0, p0, Lcom/telerik/util/Bootstrapper$1;->this$0:Lcom/telerik/util/Bootstrapper;

    const-string v1, "content"

    #calls: Lcom/telerik/util/Bootstrapper;->copyAssetsToBaseDirFrom(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/telerik/util/Bootstrapper;->access$0(Lcom/telerik/util/Bootstrapper;Ljava/lang/String;)V

    .line 44
    iget-object v0, p0, Lcom/telerik/util/Bootstrapper$1;->val$pref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 45
    const-string v1, "firstStart"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 46
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 49
    iget-object v0, p0, Lcom/telerik/util/Bootstrapper$1;->this$0:Lcom/telerik/util/Bootstrapper;

    #getter for: Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;
    invoke-static {v0}, Lcom/telerik/util/Bootstrapper;->access$1(Lcom/telerik/util/Bootstrapper;)Lorg/apache/cordova/DroidGap;

    move-result-object v0

    new-instance v1, Lcom/telerik/util/Bootstrapper$1$1;

    iget-object v2, p0, Lcom/telerik/util/Bootstrapper$1;->val$dialog:Landroid/app/ProgressDialog;

    invoke-direct {v1, p0, v2}, Lcom/telerik/util/Bootstrapper$1$1;-><init>(Lcom/telerik/util/Bootstrapper$1;Landroid/app/ProgressDialog;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/DroidGap;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 55
    return-void
.end method
