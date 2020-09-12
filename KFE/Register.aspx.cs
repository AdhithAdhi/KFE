using System;
using System.Collections.Generic;
using System.Linq;
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

        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            var name = NameText.Text;
            var mail = UserMail.Text;
            var phone = PhoneText.Text;
            var adr = adr_Textarea.Text;
            var pass = Crypto.Hash(UserPassword.Text);
            var pin = Convert.ToInt32(PinCodeTextBox.Text);
            bool result = userController.AddCustomer(new Customer()
            {
                Name = name,
                Email = mail,
                Phone = phone,
                Pin = pin,
                Address = adr,
                Password = pass

            });
            if (result)
            {
                HttpContext.Current.Response.Write("<script>alert('Registration Successfull...!');</script>");
            }
            else
            {
                HttpContext.Current.Response.Write("<script>alert('Registration Failed...!');</script>");
            }
            //Response.Redirect("/Login");
        }
    }
}