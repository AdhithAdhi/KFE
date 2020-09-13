using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class MyCart : System.Web.UI.Page
    {
        public List<Cart> carts = new List<Cart>();
        MyClass.CartController cartController = new MyClass.CartController();
        MyClass.ProductsController productsController = new MyClass.ProductsController();
        MyClass.UserController userController = new MyClass.UserController();
        MyClass.OrderController orderController = new MyClass.OrderController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
            }
        }

        private void LoadCartItems()
        {
            if (Session["customerId"] != null)
            {
                carts.Clear();
                carts = cartController.GetAllCartByUser(Convert.ToInt32(Session["customerId"].ToString()));
            }
            else
            {
                Response.Redirect("/Login");
            }
            decimal subtotal = 0;
            decimal deliveryCharge = 0;
            for(int i=0;i<carts.Count;i++)
            {
                subtotal += productsController.GetProductBy(carts[i].ProductId).Price * carts[i].Count;
            }
            SubTotalText.Text = subtotal.ToString();
            ShippingText.Text = deliveryCharge.ToString();
            TotalText.Text = (subtotal + deliveryCharge).ToString();
        }
        public Product GetProdyctById(int pid)
        {
            return productsController.GetProductBy(pid);
        }

        protected void BuyBtn_Click(object sender, EventArgs e)
        {
            int orderId=orderController.AddToOrders(new Order()
            {
                Date = DateTime.Now,
                CustomerId = Convert.ToInt32(Session["customerId"].ToString()),
                Price = Convert.ToDecimal(TotalText.Text),
                Status="Prosessing..",
                Address=userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString())).Address
            }) ;
            foreach(Cart cart in carts)
            {
                orderController.GetOrdersByOrder(orderId).OrderItems.Add(new OrderItem()
                {
                    OrderId = orderId,
                    ProductId=cart.ProductId,
                    Quantity=cart.Count,
                    Amount= cart.Count * productsController.GetProductBy(cart.ProductId).Price,
                    Extras=cart.Extras,
                }) ;

            }
        }
    }
}