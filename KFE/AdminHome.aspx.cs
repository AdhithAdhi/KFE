using KFE.MyClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AdminHome : System.Web.UI.Page
    {
        HitCount ht = new HitCount();
        protected void Page_Load(object sender, EventArgs e)
        {
            object[] o = new object[2];
            o = ht.GetCount();
            TodayVisitor.Text = o[0].ToString();
            TotalVisitor.Text = o[1].ToString();
        }

        protected void DeleteAllOnClick(object sender, EventArgs e)
        {
            ht.DeleteAll();
            Response.Redirect(Request.RawUrl);
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToString("hh:mm:ss");
        }
    }
}