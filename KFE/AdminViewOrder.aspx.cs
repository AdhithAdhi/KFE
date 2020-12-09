using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AdminViewOrder : System.Web.UI.Page
    {
        int OrderId = 0;
        public Order order = new Order();
        MyClass.OrderdItemController orderdItemController = new MyClass.OrderdItemController();
        MyClass.OrderController orderController = new MyClass.OrderController();
        MyClass.ProductsController productsController = new MyClass.ProductsController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var ordId = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Order"]));
                if (ordId != "error")
                {
                    if (int.TryParse(ordId, out OrderId))
                    {

                    }
                    else
                    {
                        Response.Redirect("/Shop");
                    }
                }
                else
                {
                    Response.Redirect("/Oops");
                }

            }
            else
            {
                Response.Redirect("/Shop");
            }
            if (!IsPostBack)
            {
                LoadOrders();
            }

        }
        private void LoadOrders()
        {
            order = null;

            order = orderController.GetOrderByOrderId(OrderId);
        }
        public Product GetProdyctById(int pid)
        {
            return productsController.GetProductBy(pid);
        }
        public List<OrderItem> GetOrderdItemsById(int oid)
        {
            return orderdItemController.GetAllOrderdItemBy(oid);
        }

        string Decrypt(string value)
        {
            return MyClass.EncryptDecrypt.Decrypt(value);
        }
    }
}