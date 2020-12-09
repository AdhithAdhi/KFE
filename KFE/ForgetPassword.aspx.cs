using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        MyClass.UserController userController = new MyClass.UserController();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RequestBtn_Click(object sender, EventArgs e)
        {
            string email = EmailText.Text;

            Customer customer = userController.GetUserByEmail(email);

            if(customer!= null)
            {

                var tTime = MyClass.EncryptDecrypt.Encrypt(DateTime.Now.AddMinutes(15f).Ticks.ToString());

                string ActivationUrl = Server.HtmlEncode("Kfefresh.com/ResetPassword?Validate=" + MyClass.EncryptDecrypt.Encrypt(customer.CustomerId.ToString()) + "&&UiD=" + tTime);

                try
                {

                    MyClass.Mail.Sent(customer.Email, "Password Reset Mail", "Greetings from KfeFresh,<br/>Either you or someone else has requested a password reset on your KfeFresh account.If you would like to reset your password please" +
                        "<a href='" + ActivationUrl + "'>Click Here</a>.(Valid upto 15 minutes)<br/>+If you do not wish to reset your account, simply ignore this mail.Regards KFE Team");
                    
                    Page.Controls.Add(MyClass.Message.Messagebox("Password reset link has sent to your mail. Please check your inbox"));
                }
                catch
                {
                    Page.Controls.Add(MyClass.Message.Messagebox("Something went wrong. Please try again."));

                }
            }
        }
    }
}