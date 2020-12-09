using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class OrdersProcessing : System.Web.UI.Page
    {
        MyClass.OrderController orderController = new MyClass.OrderController();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OrderReject(object sender, GridViewDeleteEventArgs e)
        {


            string id = MyClass.EncryptDecrypt.Encrypt(GridView1.DataKeys[e.RowIndex].Values["OrderId"].ToString());

            Response.Redirect("~/RejectOrders?Order=" + id);
        }

        protected void OrderAccept(object sender, GridViewSelectEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Values["OrderId"].ToString());

            Order order = orderController.GetOrderByOrderId(id);
            order.Status = "Accepted...";
            orderController.saveOrderBy(order);
            Response.Redirect("~/OrdersProcessing");
        }

        protected void OrderView(object sender, GridViewEditEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Values["OrderId"].ToString());

            Order order = orderController.GetOrderByOrderId(id);
            order.Status = "Cancelld By Stores...";
            orderController.saveOrderBy(order);
            Response.Redirect("~/CancelledOrders");
        }
    }
}