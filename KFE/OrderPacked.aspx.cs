using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class OrderPacked : System.Web.UI.Page
    {
        MyClass.OrderController orderController = new MyClass.OrderController();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OrderView(object sender, GridViewEditEventArgs e)
        {

            string id = MyClass.EncryptDecrypt.Encrypt(GridView1.DataKeys[e.NewEditIndex].Values["OrderId"].ToString());

            Response.Redirect("~/AdminViewOrder?Order=" + id);
        }

        protected void OrderDeliverd(object sender, GridViewSelectEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Values["OrderId"].ToString());

            Order order = orderController.GetOrderByOrderId(id);
            order.Status = "Delivered...";
            orderController.saveOrderBy(order);
            Response.Redirect("~/OrderDeliverd");
        }

        protected void OrderShipped(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["OrderId"].ToString());

            Order order = orderController.GetOrderByOrderId(id);
            order.Status = "Shipped...";
            orderController.saveOrderBy(order);
            Response.Redirect("~/OrderShipped");
        }
    }
}