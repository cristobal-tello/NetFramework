<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" EnableViewState="False"   %>
<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Event Page_Load fired!!!!");
    }
</script>

<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Demo</title>
    <meta name="viewport" content="width=device-width" />
    
</head>
<body>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="jquery.ui.combined" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <fieldset>
                        <legend>UpdatePanel1</legend>
                        <asp:Label ID="Label1" runat="server" Text="Panel Created" />
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Refresh Panel 1" />
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <fieldset>
                        <legend>UpdatePanel2</legend>
                        <asp:Calendar ID="Calendar1" runat="server" />
                        <asp:Label ID="Label2" runat="server" Text="Panel Created" />
                        <br />
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            <hr />
            <input type="button" onclick="$get('_asyncCallsMadeDiv').innerHTML = '';" value="clear events" />
            <fieldset>
                <legend>Asyncronous callback events</legend>
                <div id="_asyncCallsMadeDiv" />
            </fieldset>
        </div>
    </form>

    <script type="text/javascript">
        Sys.Application.add_init(function () { $get("_asyncCallsMadeDiv").innerHTML += "init raised!!<br/>"; });
        with (Sys.WebForms.PageRequestManager.getInstance())
        {
            add_initializeRequest(function () { $get("_asyncCallsMadeDiv").innerHTML += "initializeRequest raised!!<br/>"; });
            add_beginRequest(function () { $get("_asyncCallsMadeDiv").innerHTML += "beginRequest raised!!<br/>"; });
            add_pageLoading(function () { $get("_asyncCallsMadeDiv").innerHTML += "pageLoading raised!!<br/>"; });
            add_pageLoaded(function () { $get("_asyncCallsMadeDiv").innerHTML += "pageLoaded raised!!<br/>"; });
            add_endRequest(function () { $get("_asyncCallsMadeDiv").innerHTML += "endRequest raised!!<br/>"; });
        }

        function pageLoad(sender, args) {
            $get("_asyncCallsMadeDiv").innerHTML += "pageLoad raised!!<br/>";
        }

        function pageUnload(sender, args) {
            $get("_asyncCallsMadeDiv").innerHTML += "pageUnload raised!!<br/>";
        }
    </script>
</body>
</html>
