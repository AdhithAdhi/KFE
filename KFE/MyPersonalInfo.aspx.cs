using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class MyPersonalinfo : System.Web.UI.Page
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
            var customer = userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString()));
            NameText.Text = customer.Name;
            EmailText.Text = customer.Email;
            MobileText.Text = customer.Phone;
            adr_Textarea.Text = customer.Address;
            PinText.Text = customer.Pin.ToString();
        }

        protected void UpdateUser_Click(object sender, EventArgs e)
        {
            if (Session["customerId"] == null)
            {
                Response.Redirect("/Login");
            }
            var customer = userController.GetCustomerBy(Convert.ToInt32(Session["customerId"].ToString()));
            customer.Name= NameText.Text;
            customer.Email=EmailText.Text;
            customer.Phone=MobileText.Text;
            customer.Address=adr_Textarea.Text;
            customer.Pin = Convert.ToInt32(PinText.Text);
            userController.UpdateCustomerBy(customer);
        }
    }
}