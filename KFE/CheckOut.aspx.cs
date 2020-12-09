using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class CheckOut : System.Web.UI.Page
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
            var haveNoStock = false;
            for (int i = 0; i < carts.Count; i++)
            {
                if (IsProductOutOfStock(carts[i].ProductId))
                {
                    haveNoStock = true;
                }
            }
            if (haveNoStock == true)
            {
                Response.Redirect("/MyCart");
                return;
            }
            NameText.Text = userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString())).Name;
            adr_Textarea.Text = userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString())).Address;
            EmailText.Text = userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString())).Email;
            MobileText.Text = userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString())).Phone;
            PinText.Text = userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString())).Pin.ToString();
            decimal subtotal = 0;
            decimal deliveryCharge = 0;
            for (int i = 0; i < carts.Count; i++)
            {
                subtotal += productsController.GetProductBy(carts[i].ProductId).Price * carts[i].Count;
            }
            SubTotalText.Text = subtotal.ToString();
            ShippingText.Text = deliveryCharge.ToString();
            TotalText.Text = (subtotal + deliveryCharge).ToString();
        }
        protected void CheckOut_Click(object sender, EventArgs e)
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
            var haveNoStock = false;
            for (int i = 0; i < carts.Count; i++)
            {
                if (IsProductOutOfStock(carts[i].ProductId))
                {
                    haveNoStock = true;
                }
            }
            if (haveNoStock == true)
            {
                Response.Redirect("/MyCart");
                return;
            }
            List<OrderItem> orderItems = new List<OrderItem>();
            foreach (Cart cart in carts)
            {
                orderItems.Add(new OrderItem()
                {
                    ProductId = cart.ProductId,
                    Quantity = cart.Count,
                    Amount = cart.Count * productsController.GetProductBy(cart.ProductId).Price,
                    Extras = cart.Extras,
                });

                var product = productsController.GetProductBy(cart.ProductId);
                product.StockCount -= cart.Count;
                productsController.ProductChangeWith(product);
            }

            orderController.AddToOrders(new Order()
            {
                Date = DateTime.Now,
                CustomerId = Convert.ToInt32(Session["customerId"].ToString()),
                Price = Convert.ToDecimal(TotalText.Text),
                Status = "Prosessing..",
                Address = NameText.Text+", "+adr_Textarea.Text+", "+PinText.Text,
                ContactEmail=EmailText.Text,
                ContactNumber=MobileText.Text,
                OrderItems = orderItems,
                PaymentType="Cash on Delivery"
            });
            foreach (Cart cart in carts)
            {
                cartController.DeleteById(cart.CartId);

            }
            Response.Redirect("/MyOrders");
        }
        protected bool IsProductOutOfStock(int pId)
        {
            var result = false;
            if (productsController.GetProductBy(pId).StockCount <= 0)
            {
                result = true;
            }
            return result;
        }

    }
}