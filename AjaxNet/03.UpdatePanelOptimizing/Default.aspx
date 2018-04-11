<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" EnableViewState="False"   %>
<%--I set EnableViewState=false to go faster in ASYNC, but be careful you need to check it first because you can have unexpected behaviours--%>
<%--If you have a dataset you can consider to overlodad dsxxxxx_selecting method and just do nothing if the event is fired by an AsyncElementID. See 04. Demo Optimizing partial updates.wmv for more details--%>
<%--Main rule
No reason to retrieve data if's not going to be used
Use Scriptmanager to find out witch panel/control triggered the update--%>


<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!ScriptManager1.IsInAsyncPostBack) || (ScriptManager1.AsyncPostBackSourceElementID == "Button1"))      // Remove all IF it to check how it affects
        {
            Label1.Text = "Panel refreshed at" + DateTime.Now.ToLongTimeString();
        }

        if ((!ScriptManager1.IsInAsyncPostBack) || (ScriptManager1.AsyncPostBackSourceElementID == "Button2"))      // Remove IF it to check how it affects
        {
            System.Threading.Thread.Sleep(2000);
            Label2.Text = "Panel refreshed at" + DateTime.Now.ToLongTimeString();
        }
    }
</script>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title><%: Page.Title %> - My ASP.NET Application</title>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"> <%--Remove UpdateMode=Conditional and you will see both Panel will be updated--%>
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
                        <asp:Label ID="Label2" runat="server" Text="Panel Created" />
                        <br />
                        <asp:Button ID="Button2" runat="server" Text="Refresh Panel 2" />
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
