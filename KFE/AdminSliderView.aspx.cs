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
        MyClass.SliderController sliderController = new MyClass.SliderController();
        MyClass.FtpFileUpload uploader = new MyClass.FtpFileUpload();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void sub_Button1_Click(object sender, EventArgs e)
        {

            string name = img_NameText.Text;
            if (!customFile.HasFile)
            {
                Reload();
            }
            string fileName = name + "_" + Guid.NewGuid().ToString() + "_" + customFile.FileName;
            fileName = fileName.Replace('/', '_');
            fileName = fileName.Replace('\\', '_');
            try
            {
                uploader.FTPUpload(customFile, "Sliders", fileName);
            }
            catch (Exception ex)
            {
                Response.Write("* " + ex.Message);
                return;
            }
            sliderController.AddSlider(new SliderImage()
            {
                ImagePath = fileName

            });

            Reload();

        }
        public void Reload()
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void SliderRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Values["Id"].ToString());
            var path = sliderController.DeleteById(id);

            if (path != "")
            {
                HttpContext.Current.Response.Write("<script>alert('" + uploader.DeleteFile("Sliders", path) + "!');</script>");
            }
        }

        protected void SliderRowViewing(object sender, GridViewSelectEventArgs e)
        {
            int id = Convert.ToInt16(GridView1.DataKeys[e.NewSelectedIndex].Values["Id"].ToString());

            var path = sliderController.GetSlidersPathBy(id);
            if (path!="")
            {
                //Response.Redirect("https://static.kfefresh.com/Images" + "/Sliders/" + path);
                //some code to insert records

            }
            Response.Write("<script>window.open ('https://static.kfefresh.com/Images/Sliders/" + path + "','_blank');</script>");
        }


    }
}