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
    public partial class AdminRegister : System.Web.UI.Page
    {
        HfeClass hfe = new HfeClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            var username = Username.Text;
            var password = Crypto.Hash(Password.Text);
            hfe.cmd = new SqlCommand("insert into AdminLogin(UserName,Password)values(@us,@pa)");

            hfe.cmd.Parameters.AddWithValue("@us", username);
            hfe.cmd.Parameters.AddWithValue("@pa", password);
            hfe.setData("User Registerd");
            Response.Redirect("/AdminLogin");
        }
    }
}