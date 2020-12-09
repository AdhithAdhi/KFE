using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class VerificationError : System.Web.UI.Page
    {
        private string CustomerId;
        MyClass.UserController userController = new MyClass.UserController();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var cusId = HttpUtility.UrlDecode(Request.QueryString["Validate"]);
                if (cusId != "error" )
                {
                    CustomerId = cusId;
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

        protected void Resend_Click(object sender, EventArgs e)
        {
            var usr = userController.GetCustomerBy(Convert.ToInt32(Decrypt(CustomerId)));
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

                Page.Controls.Add(MyClass.Message.Messagebox("Verification mail has sent to "+recipiant.Email+". Please check your inbox"));
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