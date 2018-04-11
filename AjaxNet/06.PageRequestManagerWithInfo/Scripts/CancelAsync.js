Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(onInitializeRequest);

function onInitializeRequest(sender, args) {
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (prm.get_isInAsyncPostBack() & args.get_postBackElement().id=='CancelRefresh') {
        prm.abortPostBack();
    }
    else if (prm.get_isInAsyncPostBack() & args.get_postBackElement().id=='RefreshButton') {
        args.set_cancel(true);
        showProgressMessage('Still in progress...');
    }
    else if (!prm.get_isInAsyncPostBack() & args.get_postBackElement().id == 'RefreshButton') {
        showProgressMessage('Retrieving headlines...');
    }
}

function showProgressMessage(msg) {
    $get('progressDiv').style.visibility = "visible";
    $get('progressMessage').innerHTML = msg;
}

if (typeof (Sys) !== 'undefined')
    Sys.Application.notifyScriptLoaded();