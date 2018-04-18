<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_01.AjaxXMLRequestDirect._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Any title</title>
    <script language="javascript" type="text/javascript">
        var xmlHttp;

        function CreateXMLHttpReqObject()
        {
            try
            {
                if(window.ActiveXObject)
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                else if (window.XMLHttpRequest)
                    xmlHttp = new XMLHttpRequest();
                else if (window.createRequest)
                    xmlHttp = window.createRequest();
            }
            catch(e)
            {
                xmlHttp = null;
            }
        }

        function ClientSideInstructorInfo_Click()
        {
            CreateXMLHttpReqObject();
            
            if (xmlHttp == null) {  // Ajax not available, return True to allow server do something. That's OnClick event will be fired on server side!
                return true;        // To try it, just force to return True. A post-back will be fired.
            }

            var instructor = document.getElementById("txtInstructorName").value;
            if (instructor == "") {
                document.getElementById("rfvInstructorName").style.visibility = 'visible';
            }
            else {
                xmlHttp.open("GET", "getInstructorInfo.ashx?instructor=" + instructor, true);
                xmlHttp.onreadystatechange = ClientSideUpdateUI;
                xmlHttp.send(null);
            }

            return false;       // Because Ajax is available, it's not necesary to run traditional post-back OnClick
        }

        function ClientSideUpdateUI()
        {
            var s;

            if (xmlHttp.readyState == 4)
            {
                if (xmlHttp.status == "200")
                {
                    s = xmlHttp.responseText;
                    document.getElementById("divInstructorInfo").innerHTML = s;
                }
                else
                {
                    s = "<p align='center'>Info not available</p><br /><br /";
                    document.getElementById("divInstructorInfo").innerHTML = s;
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table cellspacing="20px">
            <tr id="row1">
                <td id="columm1">&nbsp;</td>
                <td id="columm2">
                    <h1>Pluralsight LLC</h1>
                </td>
                <td id="columm3">
                    <img src="Image/logo.gif" alt="Pluralsight Logo" /></td>
            </tr>
            <tr id="row2">
                <td>&nbsp;</td>
                <td>
                    <hr />
                    <p>
                        Pluralsight is a premier Microsoft .net training provider and home to many of the top authorities on .NET today. Pluralsight
                        delivers professional training classes at varios open enrrollment locations and customer sites around the world.
                        The experience and reputation of Pluralsight's instructtor and the hight quality
                        of Pluralsight course materials generate a high demand for its courses, making them among the most sought after in the industry.
                    </p>
                    <p>
                        Founded by some of the most respected .NET talents, Pluralsight LLC has built a
                        strong <a href="http://www.pluralsight/blogs/">technical community</a> that
                        benefits developers everywhere. Members of the
                        Pluralsight technical staff share a unique passion for software technology.
                    </p>
                    <hr />
                </td>
                <td>
                    <div id="divInstructorInfoCell">
                        <h3>Instructor info</h3>
                        &nbsp;
                        <input type="text" id="txtInstructorName" runat="server" style="width: 50px" />
                        <asp:Button ID="cmdInstructorInfo" Text="Find" runat="server" OnClick="cmdInstructorInfo_Click" ValidationGroup="InstructorInfo"
                            OnClientClick="return ClientSideInstructorInfo_Click();" />
                        <asp:RequiredFieldValidator ID="rfvInstructorName" runat="server" ControlToValidate="txtInstructorName"
                            ErrorMessage="*" ValidationGroup="InstructorInfo" />
                        <div id="divInstructorInfo" runat="server">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                        <br />
                    </div>
                </td>
            </tr>
            <tr id="row3">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
