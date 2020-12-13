using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        MyClass.UserController userController = new MyClass.UserController();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadUser();
            }
        }
        private void LoadUser()
        {
            if (Session["customerId"] == null)
            {
                Response.Redirect("/Login");
            }
        }


        protected void UpdatePassBtn_Click(object sender, EventArgs e)
        {
            if (Session["customerId"] == null)
            {
                Response.Redirect("/Login");
            }
            var newPass = NePass.Text;
            var customer = userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString()));
            if (Crypto.VerifyHashedPassword(customer.Password, CuPass.Text))
            {
                customer.Password = Crypto.HashPassword(newPass);
                userController.UpdateCustomerPassWordBy(customer);

                Response.Redirect("/Login");
            }
            else
            {
            }
        }
    }
}