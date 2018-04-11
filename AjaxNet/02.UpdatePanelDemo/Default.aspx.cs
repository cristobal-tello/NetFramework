using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppVS12
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page_Load always will be call
            if (ScriptManager1.IsInAsyncPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Page_Load event with ASYNC fired!!!!");
                System.Diagnostics.Debug.WriteLine(string.Format("Who fired: {0}", ScriptManager1.AsyncPostBackSourceElementID.ToString()));

            }
            else
            {
                System.Diagnostics.Debug.WriteLine("Page_Load event fired!!!!");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            var query = (from line in File.ReadLines(@"F:\work\02.UpdatePanelDemo\50000 Sales Records.csv")
                let csvLines = line.Split(';')
                from csvLine in csvLines
                where !String.IsNullOrWhiteSpace(csvLine)
                let data = csvLine.Split(',')
                select new
                {
                    Region = data[0],
                    Country = data[1],
                    ItemType = data[2]
                
                }).ToList();
            
                    
            
            
            //var contacts = new[] 
            //{
            //    new {
            //            Name = " Eugene Zabokritski",
            //            PhoneNumber =  "206-555-0108",
            //            City = "Detroit"
            //        },
            //    new {
            //            Name = " Hanying Feng",
            //            PhoneNumber = "650-555-0199",
            //            City = "Chicago"
            //        }
            //};

             Grid1.DataSource = query;
            Grid1.DataBind();
            
        }
    }
}