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
        MyClass.ord
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
        }
        public Product GetProdyctById(int pid)
        {
            return productsController.GetProductBy(pid);
        }

        protected void BuyBtn_Click(object sender, EventArgs e)
        {

        }
    }
}