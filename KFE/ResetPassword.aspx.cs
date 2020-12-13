using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        MyClass.UserController userController = new MyClass.UserController();
        int CustomerId = 0;
        long ExpTime = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var cusId = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Validate"]));
                var tTime = Decrypt(HttpUtility.UrlDecode(Request.QueryString["UiD"]));
                if (cusId != "error" || tTime != "error")
                {
                    if (int.TryParse(cusId, out CustomerId) && long.TryParse(tTime, out ExpTime))
                    {
                        ValidateUrl();
                    }
                    else
                    {
                        Response.Redirect("/Login");
                    }
                }
                else
                {
                    Response.Redirect("/Oops");
                }

            }
            else
            {
                Response.Redirect("/Login");
            }
        }

        protected void ChangeBtn_Click(object sender, EventArgs e)
        {
            Customer customer = userController.GetCustomerBy(CustomerId);
            customer.Password = Crypto.HashPassword(NewPasswordText.Text);
            customer.Verified = true;
            userController.UpdateCustomerBy(customer);
            Response.Redirect("/ResetSuccess");
        }
        protected bool ValidateUrl()
        {
            bool result;
            if (DateTime.Compare(DateTime.FromBinary(ExpTime), DateTime.Now) > 0)
            {
                if (userController.hasCustomerById(CustomerId))
                {
                    result = true;
                }
                else
                {
                    result = false;
                }
            }
            else
            {
                result = false;
            }
            return result;
        }
        string Decrypt(string value)
        {
            return MyClass.EncryptDecrypt.Decrypt(value);
        }
    }
}