using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class MyOrders : System.Web.UI.Page
    {
        public List<Order> orders = new List<Order>();

        MyClass.ProductsController productsController = new MyClass.ProductsController();
        MyClass.OrderController orderController = new MyClass.OrderController();
        MyClass.OrderdItemController orderdItemController = new MyClass.OrderdItemController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            if (Session["customerId"] == null)
            {
                Response.Redirect("/Login");
            }
            orders.Clear();

            orders = orderController.GetOrdersByCustomer(Convert.ToInt32(Session["customerId"].ToString()));
        }
        public Product GetProdyctById(int pid)
        {
            return productsController.GetProductBy(pid);
        }
        public List<OrderItem> GetOrderdItemsById(int oid)
        {
            return orderdItemController.GetAllOrderdItemBy(oid);
        }
        protected bool CanCancel(string status)
        {
            bool result = true;
            if(status.Contains("Cancel") || status.Contains("Deliver") || status.Contains("Shipp"))
            {
                result = false;
            }
            return result;
        }

    }
}