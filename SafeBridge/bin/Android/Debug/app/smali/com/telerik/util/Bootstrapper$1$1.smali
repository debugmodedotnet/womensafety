.class Lcom/telerik/util/Bootstrapper$1$1;
.super Ljava/lang/Object;
.source "Bootstrapper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/telerik/util/Bootstrapper$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/telerik/util/Bootstrapper$1;

.field private final synthetic val$dialog:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/telerik/util/Bootstrapper$1;Landroid/app/ProgressDialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/telerik/util/Bootstrapper$1$1;->this$1:Lcom/telerik/util/Bootstrapper$1;

    iput-object p2, p0, Lcom/telerik/util/Bootstrapper$1$1;->val$dialog:Landroid/app/ProgressDialog;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/telerik/util/Bootstrapper$1$1;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 52
    iget-object v0, p0, Lcom/telerik/util/Bootstrapper$1$1;->this$1:Lcom/telerik/util/Bootstrapper$1;

    #getter for: Lcom/telerik/util/Bootstrapper$1;->this$0:Lcom/telerik/util/Bootstrapper;
    invoke-static {v0}, Lcom/telerik/util/Bootstrapper$1;->access$0(Lcom/telerik/util/Bootstrapper$1;)Lcom/telerik/util/Bootstrapper;

    move-result-object v0

    #getter for: Lcom/telerik/util/Bootstrapper;->context:Lorg/apache/cordova/DroidGap;
    invoke-static {v0}, Lcom/telerik/util/Bootstrapper;->access$1(Lcom/telerik/util/Bootstrapper;)Lorg/apache/cordova/DroidGap;

    move-result-object v0

    iget-object v1, p0, Lcom/telerik/util/Bootstrapper$1$1;->this$1:Lcom/telerik/util/Bootstrapper$1;

    #getter for: Lcom/telerik/util/Bootstrapper$1;->this$0:Lcom/telerik/util/Bootstrapper;
    invoke-static {v1}, Lcom/telerik/util/Bootstrapper$1;->access$0(Lcom/telerik/util/Bootstrapper$1;)Lcom/telerik/util/Bootstrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/telerik/util/Bootstrapper;->getIndexUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/DroidGap;->loadUrl(Ljava/lang/String;)V

    .line 53
    return-void
.end method
