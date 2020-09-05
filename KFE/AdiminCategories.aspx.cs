using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AdiminCategories : System.Web.UI.Page
    {
        MyClass.Categories categories = new MyClass.Categories();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            categories.AddCategory(new Category { Name = CatName.Text, SF = CatShort.Text });
            Reload();
        }
        public void Reload()
        {
            Response.Redirect(Request.RawUrl);
        }
        protected void CategoryDelete(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Values["Id"].ToString());
            categories.DeleteById(id);
            Reload();
        }
    }
}