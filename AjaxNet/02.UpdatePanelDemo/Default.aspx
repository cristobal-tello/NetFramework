<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppVS12._Default" %>

<!DOCTYPE html>
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
    <header>
    </header>
    <div id="body">
        <div id="id">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"> <%--If you remove UpdatePanel and Content Template, you will note how IE flicks every time you press Click me button--%>
                <%--In previous Updatepanel, don't forget to set UpdateMode to Conditional. By default it's always, means any change in any UpdatePanel in the page, will fire an async event--%>
                <ContentTemplate>  <%--Updatepanel main goal is reduces the flicker--%>
                    <asp:DataGrid ID="Grid1" runat="server" PageSize="20" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">  
                        <Columns>  
                            <asp:BoundColumn HeaderText="Region" DataField="Region"></asp:BoundColumn>  
                            <asp:BoundColumn HeaderText="Country" DataField="Country"></asp:BoundColumn>  
                            <asp:BoundColumn DataField="ItemType" HeaderText="ItemType"></asp:BoundColumn>  
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />  
                            <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />  
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />  
                            <AlternatingItemStyle BackColor="White" />  
                            <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />  
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    </asp:DataGrid>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Click me" OnClick="Button1_Click" />        
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>
    </div>
    </form>
</body>
</html>
