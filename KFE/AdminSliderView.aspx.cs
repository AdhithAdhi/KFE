using KFE.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AdminSliderView : System.Web.UI.Page
    {
        HfeClass hfe = new HfeClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdata();
            }
        }

        public void refreshdata()
        {
            hfe.cmd = new SqlCommand("select * from SliderImages");
            GridView1.DataSource = hfe.dt;
            GridView1.DataBind();


        }
        protected void sub_Button1_Click(object sender, EventArgs e)
        {

            string name = img_NameText.Text;
            if (!customFile.HasFile)
            {
                Reload();
            }
            string fileName = name + "_" + Guid.NewGuid().ToString() + "_" + customFile.FileName;
            var directory = Server.MapPath("~/Images/Sliders/");
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
            hfe.cmd = new SqlCommand("insert into SliderImages(ImagePath)values(@pa)");

            hfe.cmd.Parameters.AddWithValue("@pa", fileName);
            hfe.setData("Slider Images");

            Reload();

        }
        public void Reload()
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void SliderRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Values["Id"].ToString());

            hfe.cmd = new SqlCommand("select * from SliderImages where Id =@id");
            hfe.cmd.Parameters.AddWithValue("id", id);
            hfe.getdata();
            if (hfe.dt.Rows.Count > 0)
            {
                hfe.cmd = new SqlCommand("delete from SliderImages where Id =@id");
                hfe.cmd.Parameters.AddWithValue("id", id);
                if (hfe.setData() > 0)
                {
                    string filepath = hfe.dt.Rows[0]["ImagePath"].ToString();
                    File.Delete(Server.MapPath("Images") + "\\Sliders\\" + filepath);
                }
            }
           refreshdata();
        }

        protected void SliderRowViewing(object sender, GridViewSelectEventArgs e)
        {
            int id = Convert.ToInt16(GridView1.DataKeys[e.NewSelectedIndex].Values["Id"].ToString()); 
            hfe.cmd = new SqlCommand("select * from SliderImages where Id =@id");
            hfe.cmd.Parameters.AddWithValue("id", id);
            hfe.getdata();
            if (hfe.dt.Rows.Count > 0)
            {
                string filepath = hfe.dt.Rows[0]["ImagePath"].ToString();
                Response.Redirect("\\Images" + "\\Sliders\\" + filepath);
                //Response.Write("<script>window.open ('\\Images\\Sliders\\" + filepath + "','_blank');</script>");
            }
            refreshdata();
        }


    }
}