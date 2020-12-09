using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class OrderDeliverd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OrderView(object sender, GridViewSelectEventArgs e)
        {
            string id = MyClass.EncryptDecrypt.Encrypt(GridView1.DataKeys[e.NewSelectedIndex].Values["OrderId"].ToString());

            Response.Redirect("~/AdminViewOrder?Order=" + id);
        }
    }
}