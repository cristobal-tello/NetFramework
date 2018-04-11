<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" EnableViewState="False"   %>
<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HeadlineList.DataSource = GetHeadlines();
            HeadlineList.DataBind();
        }
    }
    
    private SortedList GetHeadlines()
    {
        SortedList headLines = new SortedList();
        headLines.Add(1, "This is a headline 1.");
        headLines.Add(2, "This is a headline 2.");
        headLines.Add(3, "This is a headline 3.");
        headLines.Add(4, "This is a headline 4.");
        headLines.Add(5, "This is a headline 5.");
        headLines.Add(6, "This is a headline 6.");
        headLines.Add(7, "This is a headline 7.");
        headLines.Add(8, "This is a headline 8.");
        headLines.Add(9, "This is a headline 9.");
        headLines.Add(10, "This is a headline 10.");
        headLines.Add(11, "This is a headline 11.");
        headLines.Add(12, "This is a headline 12.");
        headLines.Add(13, "(Last updated on: " + DateTime.Now.ToLongTimeString() + ")");

        return headLines;
    }

    protected void RefreshButton_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        HeadlineList.DataSource = GetHeadlines();
        HeadlineList.DataBind();
    }
</script>

<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Demo</title>
    <style type="text/css">
        #UpdatePanel1 {
            width: 400px;
            height: 345px;
            border: solid 1px gray;
        }
    </style>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DataList ID="HeadlineList" runat="server">
                        <HeaderTemplate>
                            <strong>Headlines</strong>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%# Eval("Value") %>
                        </ItemTemplate>
                        <FooterTemplate />
                        <FooterStyle HorizontalAlign="Right" />
                    </asp:DataList>
                    <p style="text-align:right">
                        <asp:Button ID="RefreshButton" Text="Refresh" runat="server" OnClick="RefreshButton_Click" />
                    </p>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                        Please wait, getting data...
                        <img src="Images/wait.gif" />
                        <span id='message_span'></span>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <script type="text/javascript">
            Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(CheckStatus);

            function CheckStatus(sender, args) {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                if (prm.get_isInAsyncPostBack()) {  // Request has been sent before, just stop this new request
                    args.set_cancel(true);
                    $get('message_span').innerHTML = "<H2>Resquest has been before, just on request at time</H2>";
                }
                else {
                    $get('message_span').innerHTML = "";
                }
            }
        </script>
    </form>
</body>
</html>
