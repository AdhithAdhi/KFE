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
    public partial class AdminChangePass : System.Web.UI.Page
    {
        HfeClass hfe = new HfeClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Change_Click(object sender, EventArgs e)
        {
            var current = CurrentPass.Text;
            hfe.cmd = new SqlCommand("select * from AdminLogin where UserName=@us and Password=@pa");

            hfe.cmd.Parameters.AddWithValue("@us", Session["adminName"]);
            hfe.cmd.Parameters.AddWithValue("@pa", Crypto.Hash(CurrentPass.Text));
            hfe.getdata();
            if (hfe.dt.Rows.Count > 0)
            {
                hfe.cmd = new SqlCommand("update AdminLogin set Password=@pa where Id=@id");

                hfe.cmd.Parameters.AddWithValue("@id", Session["adminId"]);
                hfe.cmd.Parameters.AddWithValue("@pa", Crypto.Hash(NewPassword.Text));
                hfe.setData("Changed");
                Response.Redirect("/AdminLogout");
            }
            else
            {

                Response.Redirect("/AdminChangePass");
            }

        }
    }
}