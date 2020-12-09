using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class Validate : System.Web.UI.Page
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

        private void ValidateUrl()
        {
            if (DateTime.Compare(DateTime.FromBinary(ExpTime), DateTime.Now) > 0)
            {
                if (userController.hasCustomerById(CustomerId))
                {
                    Customer customer = userController.GetCustomerBy(CustomerId);
                    customer.Verified = true;
                    userController.UpdateCustomerBy(customer);
                    Response.Redirect("/VerificationSuccess");
                }
                else
                {
                    VerifiedLabel.Text = "Something went wrong";
                }
            }
            else 
            {
                VerifiedLabel.Text = "Link has Expired";
            }
        }
        protected void Resend_Click(object sender, EventArgs e)
        {
            var usr = userController.GetCustomerBy(CustomerId);
            SendemailTo(usr);
        }
        public void SendemailTo(Customer recipiant)
        {
            var tTime = MyClass.EncryptDecrypt.Encrypt(DateTime.Now.AddMinutes(15f).Ticks.ToString());

            string ActivationUrl = Server.HtmlEncode("Kfefresh.com/Validate?Validate=" + CustomerId + "&&UiD=" + tTime);

            try
            {
                MyClass.Mail.Sent(recipiant.Email, "Verification Mail", "<h3>Welcome</h3><p class='text text-bold'>Thanks for signing up! We just need you to verify your email address to complete setting up your account.(Valid Upto 15 minutes)</p>" +
                    "<a href='" + ActivationUrl + "'>Click Here</a> to verify your acount.<br/><br/> If you didn't register at <a href='KfeFresh.com'>KfeFresh</a> please ignore this mail.");

                Page.Controls.Add(MyClass.Message.Messagebox("Verification mail has sent to " + recipiant.Email + ". Please check your inbox"));
            }
            catch (Exception ex)
            {
                Page.Controls.Add(MyClass.Message.Messagebox("Something went wrong.Please try again" + ex));
            }
        }
        string Decrypt(string value)
        {
            return MyClass.EncryptDecrypt.Decrypt(value);
        }
    }
}