using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _01.AjaxXMLRequestDirect
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdInstructorInfo_Click(object sender, EventArgs e)
        {
            if (txtInstructorName.Value.Equals("Fritz", StringComparison.CurrentCultureIgnoreCase))
            {
                this.divInstructorInfo.InnerHtml = ("<ul>");
                this.divInstructorInfo.InnerHtml += ("<li>hails From Maine</li>");
                this.divInstructorInfo.InnerHtml += ("<li>long live web!</li>");
                this.divInstructorInfo.InnerHtml += ("<li>avid cyclist</li>");
                this.divInstructorInfo.InnerHtml += ("<li>[via POST]</li>");
                this.divInstructorInfo.InnerHtml += (" </ul>");
            }
            else if (this.txtInstructorName.Value.Equals("Joe", StringComparison.CurrentCultureIgnoreCase))
            {
                this.divInstructorInfo.InnerHtml = ("<ul>");
                this.divInstructorInfo.InnerHtml += ("<li>lives in Chicago</li>");
                this.divInstructorInfo.InnerHtml += ("<li>long live web and</li>");
                this.divInstructorInfo.InnerHtml += ("<li>long live the desktop</li>");
                this.divInstructorInfo.InnerHtml += ("<li>avid sailor</li>");
                this.divInstructorInfo.InnerHtml += ("<li>[via POST]</li>");
                this.divInstructorInfo.InnerHtml += ("</ul>");
            }
            else
            {
                this.divInstructorInfo.InnerHtml = ("<br />< p align = 'center'>Unknown instructor!<br />[via POST]</p><br /><br />");
            }
        }
    }
}