using KFE.Models;
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
    public partial class AdminProductView : System.Web.UI.Page
    {
        MyClass.ProductsController productsController = new MyClass.ProductsController();
        public MyClass.Categories categories = new MyClass.Categories();
        MyClass.FtpFileUpload uploader = new MyClass.FtpFileUpload();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sub_Button1_Click(object sender, EventArgs e)
        {

            string name = img_NameText.Text;
            string description = img_Textarea.Text;
            int selectedTag = Convert.ToInt32(Request.Form["FruitName"]);
            decimal price = Convert.ToDecimal(PriceText.Text);
            decimal stock = Convert.ToDecimal(StockText.Text);
            if (!customFile.HasFile)
            {
                Reload();
            }
            string fileName = name + "_" + Guid.NewGuid().ToString() + "_" + customFile.FileName;
            fileName = fileName.Replace('/', '_');
            fileName = fileName.Replace('\\', '_');
            //Response.Redirect("/test");
            try
            {
                uploader.FTPUpload(customFile, "Products", fileName);
            }
            catch (Exception ex)
            {
                Response.Write("* " + ex.Message);
                return;
            }
            productsController.AddProduct(new Product() 
            {
                Title= name,
                Description=description,
              ImagePath=fileName,
              Price=price,
              StockCount= stock,
               CategoryId= selectedTag

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
            var path=productsController.DeleteById(id);


            if (path != "")
            {

                HttpContext.Current.Response.Write("<script>alert('" + uploader.DeleteFile("Products", path) +"!');</script>");
            }

        }

        protected void ProductSelect(object sender, GridViewSelectEventArgs e)
        {
            int id = Convert.ToInt16(GridView1.DataKeys[e.NewSelectedIndex].Values["Id"].ToString());

            Response.Redirect("https://Kfefresh.com/ProductView?Product=" + MyClass.EncryptDecrypt.Encrypt(id.ToString()));
        }
    }
}