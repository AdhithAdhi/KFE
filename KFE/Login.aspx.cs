using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class Login : System.Web.UI.Page
    {
        MyClass.UserController userController = new MyClass.UserController();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session.Abandon();
                Session.Clear();

                ErrorField.Visible = false;
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            var username = Username.Text;
            var password = Crypto.Hash(UserPassword.Text);
            var result = userController.IsCustomerExistBy(username, password);
            if (userController.hasPendingCustomerById(Convert.ToInt32(result)))
            {
                Response.Redirect("/VerificationError?Validate=" + MyClass.EncryptDecrypt.Encrypt(result.ToString()));
                //return;
            }
            if (result!=0)
            {
                Session["name"] = "user";
                Session["customerId"] = result;
                Response.Redirect("/Shop");

            }
            else
            {
                ErrorField.Visible = true;
                Username.Text = "";
                UserPassword.Text = "";
            }
        }
    }
}