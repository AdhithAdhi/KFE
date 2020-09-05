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
        HfeClass hfe = new HfeClass();
        MyClass.ProductsController productsController = new MyClass.ProductsController();
        public MyClass.Categories categories = new MyClass.Categories();
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
            var directory = Server.MapPath("~/Images/Products/"); 
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
            productsController.AddProduct(new Product() 
            {
                Title= name,
                Description=description,
              ImagePath=fileName,
              Price=price,
              StockCount= stock,
               CategoryId= selectedTag

            });

            //hfe.cmd = new SqlCommand("insert into Products(Title,Description,ImagePath,Price)values(@ti,@de,@pa,@pr)");

            //hfe.cmd.Parameters.AddWithValue("@ti", name);
            //hfe.cmd.Parameters.AddWithValue("@de", description);
            //hfe.cmd.Parameters.AddWithValue("@pa", fileName);
            //hfe.cmd.Parameters.AddWithValue("@pr", price);
            //hfe.setData("Products");

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
                File.Delete(Server.MapPath("Images") + "\\Products\\" + path);

            //hfe.cmd = new SqlCommand("select * from Products where Id =@id");
            //hfe.cmd.Parameters.AddWithValue("id", id);
            //hfe.getdata();
            //if (hfe.dt.Rows.Count > 0)
            //{
            //    hfe.cmd = new SqlCommand("delete from Products where Id =@id");
            //    hfe.cmd.Parameters.AddWithValue("id", id);

            //    if (hfe.setData() > 0)
            //    {
            //        string filepath = hfe.dt.Rows[0]["ImagePath"].ToString();
            //        File.Delete(Server.MapPath("Images") + "\\Products\\" + filepath);
            //    }
            //}
        }
    }
}