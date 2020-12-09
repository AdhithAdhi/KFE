using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AddToCart : System.Web.UI.Page
    {
        int ProductId = 0;
        MyClass.CartController cartController = new MyClass.CartController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var productId = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Product"]));
                if (productId != "error")
                {
                    if (int.TryParse(productId, out ProductId))
                        AddThisToCart();
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
        }
        void AddThisToCart()
        {
            if (Session["customerId"] == null)
            {
                Response.Redirect("/Login");
            }
            cartController.AddToCart(new Cart()
            {
                CustomerId = Convert.ToInt32(Session["customerId"].ToString()),
                ProductId = ProductId,
                Count = (decimal)1,
                Extras = "",
            });
            Response.Redirect("/Shop");
        }
        string Decrypt(string value)
        {
            return MyClass.EncryptDecrypt.Decrypt(value);
        }

    }
}