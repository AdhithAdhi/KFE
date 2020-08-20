using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AdminGallery : System.Web.UI.Page
    {
        HfeClass hfe = new HfeClass();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Upload_Click(object sender, EventArgs e)
        {

            string name = img_NameText.Text;
            string selectedTag = Request.Form["FruitName"];
            if (!customFile.HasFile || selectedTag.Equals("") || selectedTag.Equals(string.Empty))
            {
                Reload();
            }
            string fileName = name + "_" + Guid.NewGuid().ToString() + "_" + customFile.FileName;
            var directory = Server.MapPath("~/Images/Gallery/");
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }
            //Response.Redirect("/test");
            try
            {
                customFile.PostedFile.SaveAs(Path.Combine(directory, fileName));
            }
            catch (Exception ex)
            {
                Response.Write("* " + ex.Message);
                return;
            }
            hfe.cmd = new SqlCommand("insert into Gallery(ImagePath,Tag)values(@pa,@ta)");

            hfe.cmd.Parameters.AddWithValue("@pa", fileName);
            hfe.cmd.Parameters.AddWithValue("@ta", selectedTag);
            hfe.setData("Gallery");

            Reload();
        }
        public void Reload()
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void SliderRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Values["Id"].ToString());
           
            hfe.cmd = new SqlCommand("select * from Gallery where Id =@id");
            hfe.cmd.Parameters.AddWithValue("id", id);
            hfe.getdata();
            if (hfe.dt.Rows.Count > 0)
            {
                hfe.cmd = new SqlCommand("delete from Gallery where Id =@id");
                hfe.cmd.Parameters.AddWithValue("id", id);

                if (hfe.setData() > 0)
                {
                    string filepath = hfe.dt.Rows[0]["ImagePath"].ToString();
                    File.Delete(Server.MapPath("Images") + "\\Gallery\\" + filepath);
                }
            }
        }

        protected void SliderRowViewing(object sender, GridViewSelectEventArgs e)
        {
            int id = Convert.ToInt16(GridView1.DataKeys[e.NewSelectedIndex].Values["Id"].ToString());
            hfe.cmd = new SqlCommand("select * from Gallery where Id =@id");
            hfe.cmd.Parameters.AddWithValue("id", id);
            hfe.getdata();
            if (hfe.dt.Rows.Count > 0)
            {
                string filepath = hfe.dt.Rows[0]["ImagePath"].ToString();
                Response.Redirect("\\Images" + "\\Gallery\\" + filepath);
                //Response.Write("<script>window.open ('\\Images\\Sliders\\" + filepath + "','_blank');</script>");
            }
        }
    }
}