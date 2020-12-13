using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class User : System.Web.UI.MasterPage
    {
        public MyClass.CartController cartController = new MyClass.CartController();
        MyClass.OrderController orderController = new MyClass.OrderController();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected int CartCount()
        {
            int value = 0;
            if (Session["customerId"] != null)
            {
                value = cartController.GetAllCartCountByUser(Convert.ToInt32(Session["customerId"].ToString()));
            }
            else
            {
                value = 0;
            }
            return value;
        }
        protected int OrdersCount()
        {
            int value = 0;
            if (Session["customerId"] != null)
            {
                value = orderController.GetAllOrdersCountByUser(Convert.ToInt32(Session["customerId"].ToString()));
            }
            else
            {
                value = 0;
            }
            return value;
        }
    }
}