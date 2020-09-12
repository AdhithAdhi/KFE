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
            Session.Abandon();
            Session.Clear();
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            var username = Username.Text;
            var password = Crypto.Hash(UserPassword.Text);
            var result = userController.IsCustomerExistBy(username, password);
            if (result!="")
            {
                Session["name"] = "user";
                Session["customerId"] = result;
                Response.Redirect("/Shop");

            }
            else
            {

                Response.Redirect("/Login");
            }
        }
    }
}