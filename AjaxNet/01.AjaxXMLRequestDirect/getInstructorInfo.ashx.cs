using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _01.AjaxXMLRequestDirect
{
    /// <summary>
    /// Summary description for getInstructorInfo
    /// </summary>
    public class getInstructorInfo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string instructor = context.Request.QueryString["instructor"];

            context.Response.ContentType = "text/plain";

            if (instructor.Equals("Fritz", StringComparison.CurrentCultureIgnoreCase))
            {
                context.Response.Write("<ul>");
                context.Response.Write("<li>hails From Maine</li>");
                context.Response.Write("<li>long live web!</li>");
                context.Response.Write("<li>avid cyclist</li>");
                context.Response.Write("<li>[via AJAX]</li>");
                context.Response.Write(" </ul>");
            }
            else if (instructor.Equals("Joe", StringComparison.CurrentCultureIgnoreCase))
            {
                context.Response.Write("<ul>");
                context.Response.Write("<li>lives in Chicago</li>");
                context.Response.Write("<li>long live web and</li>");
                context.Response.Write("<li>long live the desktop</li>");
                context.Response.Write("<li>avid sailor</li>");
                context.Response.Write("<li>[via AJAX]</li>");
                context.Response.Write("</ul>");
            }
            else
            {
                context.Response.Write("<br /><p align = 'center'>Unknown instructor!<br />[via AJAX]</p><br /><br />");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}