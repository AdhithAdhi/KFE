using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AdminSignIn : System.Web.UI.Page
    {
        HfeClass hfe = new HfeClass();
        MyClass.AdminController adminController = new MyClass.AdminController();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            var username = UsernameText.Text; 
            var password = UserPasswordText.Text;

            var result = adminController.IsAdminExistBy(username, password);

            if (result != null)
            {
                Session["name"] = "admin";
                Session["adminName"] = result.userName.ToString();
                Session["adminId"] = result.Id.ToString();
                Response.Redirect("/AdminHome");

            }
            else
            {
                Response.Redirect("/AdminSignIn");
            }
            //hfe.cmd = new SqlCommand("select * from AdminLogin where UserName=@us and Password=@pa");

            //hfe.cmd.Parameters.AddWithValue("@us", username);
            //hfe.cmd.Parameters.AddWithValue("@pa", password);
            //hfe.getdata();
            //if (hfe.dt.Rows.Count > 0)
            //{
            //    Session["name"] = "admin";
            //    Session["adminName"] = hfe.dt.Rows[0]["UserName"].ToString();
            //    Session["adminId"] = hfe.dt.Rows[0]["Id"].ToString();
            //    Response.Redirect("/AdminHome");

            //}
            //else
            //{

            //    Response.Redirect("/AdminLogin");
            //}
        }
    }
}