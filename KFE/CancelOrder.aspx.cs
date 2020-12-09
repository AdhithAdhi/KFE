using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class CancelOrder : System.Web.UI.Page
    {
        int OrderId = 0;
        MyClass.OrderController orderController = new MyClass.OrderController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var productId = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Order"]));
                if (productId != "error")
                {
                    if (int.TryParse(productId, out OrderId))
                        CancelOrder(OrderId);
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
            void CancelOrder(int cartId)
            {
                orderController.CancelOrder(cartId);
                Response.Redirect("/MyOrders");
            }
            string Decrypt(string value)
            {
                return MyClass.EncryptDecrypt.Decrypt(value);
            }
        }
    }
}