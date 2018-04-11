<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" EnableViewState="False"   %>
<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Event Page_Load fired!!!!");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToLongTimeString() + " " + ScriptManager1.AsyncPostBackSourceElementID.ToString();
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
                        <asp:Button ID="Button1" runat="server" Text="Async postback button" OnClick="Button1_Click"/>
                        <asp:Button ID="Button2" runat="server" Text="Sync-classinc postback button" OnClick="Button1_Click" />
                    </fieldset>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Button3" />
                    <asp:PostBackTrigger ControlID="Button2" />
                </Triggers>            
            </asp:UpdatePanel>
            <h1>Useless</h1>
            <h1>test</h1>
            <h1>here</h1>
            <h1>just to note</h1>
            <h1>button</h1>
            <h1>can trigger as well</h1>
            </div>
        <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button1_Click" />
    </form>
</body>
</html>
