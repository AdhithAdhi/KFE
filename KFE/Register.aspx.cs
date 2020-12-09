using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class Register : System.Web.UI.Page
    {
        MyClass.UserController userController = new MyClass.UserController();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            var name = NameText.Text;
            var mail = UserMail.Text;
            var phone = PhoneText.Text;
            var adr = adr_Textarea.Text;
            var pass = Crypto.Hash(UserPassword.Text);
            var pin = Convert.ToInt32(PinCodeTextBox.Text);
            if (userController.EmailAlreadyExist(mail))
            {
                Page.Controls.Add(MyClass.Message.Messagebox("Username/Email address already exists. Please try another"));
                return;
            }
            else
            {
                var customer = new Customer()
                {
                    Name = name,
                    Email = mail,
                    Phone = phone,
                    Pin = pin,
                    Address = adr,
                    Password = pass,
                    Verified = false
                    
                };
                bool result = userController.AddCustomer(customer);
                if (result)
                {
                    SendemailTo(customer);
                    Page.Controls.Add(MyClass.Message.Messagebox("User Register Successfully."));
                }
                else
                {
                    Page.Controls.Add(MyClass.Message.Messagebox("User Register Failed."));
                }
            }
            //Response.Redirect("/Login");
        }
        public void SendemailTo(Customer recipiant)
        {
            var tTime = MyClass.EncryptDecrypt.Encrypt(DateTime.Now.AddMinutes(15f).Ticks.ToString());
            var userId = MyClass.EncryptDecrypt.Encrypt(recipiant.CustomerId.ToString());
            string ActivationUrl = Server.HtmlEncode("Kfefresh.com/Validate?Validate=" + userId + "&&UiD=" + tTime);
            
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
    }
}