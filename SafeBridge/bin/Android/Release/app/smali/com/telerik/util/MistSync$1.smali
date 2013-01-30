.class Lcom/telerik/util/MistSync$1;
.super Landroid/os/AsyncTask;
.source "MistSync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/telerik/util/MistSync;->sync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Lcom/telerik/util/MistSync$MistSyncResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/telerik/util/MistSync;

.field private final synthetic val$dialog:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/telerik/util/MistSync;Landroid/app/ProgressDialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/telerik/util/MistSync$1;->this$0:Lcom/telerik/util/MistSync;

    iput-object p2, p0, Lcom/telerik/util/MistSync$1;->val$dialog:Landroid/app/ProgressDialog;

    .line 82
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/telerik/util/MistSync$MistSyncResult;
    .locals 7
    .parameter "params"

    .prologue
    .line 87
    :try_start_0
    iget-object v0, p0, Lcom/telerik/util/MistSync$1;->this$0:Lcom/telerik/util/MistSync;

    #calls: Lcom/telerik/util/MistSync;->updateFiles(Landroid/os/AsyncTask;)Lcom/telerik/util/MistSync$MistSyncResult;
    invoke-static {v0, p0}, Lcom/telerik/util/MistSync;->access$0(Lcom/telerik/util/MistSync;Landroid/os/AsyncTask;)Lcom/telerik/util/MistSync$MistSyncResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 89
    :goto_0
    return-object v0

    .line 88
    :catch_0
    move-exception v5

    .line 89
    .local v5, e:Ljava/lang/Exception;
    new-instance v0, Lcom/telerik/util/MistSync$MistSyncResult;

    iget-object v1, p0, Lcom/telerik/util/MistSync$1;->this$0:Lcom/telerik/util/MistSync;

    const/4 v2, 0x0

    .line 90
    const-string v3, "Error"

    .line 91
    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    .line 89
    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/telerik/util/MistSync$MistSyncResult;-><init>(Lcom/telerik/util/MistSync;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Lcom/telerik/util/MistSync$MistSyncResult;)V

    goto :goto_0
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/telerik/util/MistSync$1;->doInBackground([Ljava/lang/Void;)Lcom/telerik/util/MistSync$MistSyncResult;

    move-result-object v0

    return-object v0
.end method

.method protected onCancelled()V
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/telerik/util/MistSync$1;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 119
    return-void
.end method

.method protected onPostExecute(Lcom/telerik/util/MistSync$MistSyncResult;)V
    .locals 4
    .parameter "result"

    .prologue
    .line 97
    iget-object v1, p0, Lcom/telerik/util/MistSync$1;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 98
    iget-boolean v1, p1, Lcom/telerik/util/MistSync$MistSyncResult;->success:Z

    if-eqz v1, :cond_0

    .line 99
    iget-object v1, p0, Lcom/telerik/util/MistSync$1;->this$0:Lcom/telerik/util/MistSync;

    #getter for: Lcom/telerik/util/MistSync;->context:Landroid/app/Activity;
    invoke-static {v1}, Lcom/telerik/util/MistSync;->access$1(Lcom/telerik/util/MistSync;)Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Lcom/telerik/util/IRefreshableActivity;

    invoke-interface {v1}, Lcom/telerik/util/IRefreshableActivity;->RefreshWebView()V

    .line 115
    :goto_0
    return-void

    .line 101
    :cond_0
    iget-object v1, p1, Lcom/telerik/util/MistSync$MistSyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 103
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/telerik/util/MistSync$1;->this$0:Lcom/telerik/util/MistSync;

    #getter for: Lcom/telerik/util/MistSync;->context:Landroid/app/Activity;
    invoke-static {v2}, Lcom/telerik/util/MistSync;->access$1(Lcom/telerik/util/MistSync;)Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 104
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 105
    iget-object v2, p1, Lcom/telerik/util/MistSync$MistSyncResult;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 106
    iget-object v2, p1, Lcom/telerik/util/MistSync$MistSyncResult;->message:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 107
    const-string v2, "OK"

    new-instance v3, Lcom/telerik/util/MistSync$1$1;

    invoke-direct {v3, p0}, Lcom/telerik/util/MistSync$1$1;-><init>(Lcom/telerik/util/MistSync$1;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 112
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 113
    .local v0, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lcom/telerik/util/MistSync$MistSyncResult;

    invoke-virtual {p0, p1}, Lcom/telerik/util/MistSync$1;->onPostExecute(Lcom/telerik/util/MistSync$MistSyncResult;)V

    return-void
.end method
