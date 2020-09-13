using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class RemoveFromCart : System.Web.UI.Page
    {
        int ProductId = 0;
        MyClass.CartController cartController = new MyClass.CartController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var productId = Decrypt(HttpUtility.UrlDecode(Request.QueryString["cId"]));
                if (productId != "error")
                {
                    if (int.TryParse(productId, out ProductId))
                        RemoveCarted(ProductId);
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
        void RemoveCarted(int cartId)
        {
            cartController.DeleteById(cartId);
            Response.Redirect("/MyCart");
        }
        string Decrypt(string value)
        {
            return MyClass.EncryptDecrypt.Decrypt(value);
        }

    }
}