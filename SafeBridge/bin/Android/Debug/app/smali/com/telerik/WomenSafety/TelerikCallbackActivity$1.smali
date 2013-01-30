.class Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;
.super Ljava/lang/Object;
.source "TelerikCallbackActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/telerik/WomenSafety/TelerikCallbackActivity;->liveSyncFeedback()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/telerik/WomenSafety/TelerikCallbackActivity;

.field private final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/telerik/WomenSafety/TelerikCallbackActivity;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;->this$0:Lcom/telerik/WomenSafety/TelerikCallbackActivity;

    iput-object p2, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;->val$view:Landroid/view/View;

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;)Lcom/telerik/WomenSafety/TelerikCallbackActivity;
    .locals 1
    .parameter

    .prologue
    .line 105
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;->this$0:Lcom/telerik/WomenSafety/TelerikCallbackActivity;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 107
    iget-object v0, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;->this$0:Lcom/telerik/WomenSafety/TelerikCallbackActivity;

    new-instance v1, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1$1;

    iget-object v2, p0, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;->val$view:Landroid/view/View;

    invoke-direct {v1, p0, v2}, Lcom/telerik/WomenSafety/TelerikCallbackActivity$1$1;-><init>(Lcom/telerik/WomenSafety/TelerikCallbackActivity$1;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Lcom/telerik/WomenSafety/TelerikCallbackActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 112
    return-void
.end method
