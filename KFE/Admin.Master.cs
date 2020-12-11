using KFE.MyClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        public OrderController orderController = new OrderController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminId"] == null)
            {
                Response.Redirect("/AdminSignIn");
            }
        }

    }
}