using KFE.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class Index : System.Web.UI.Page
    {
        HfeClass hfe = new HfeClass();
        public List<Slider> Sliders = new List<Slider>();
        public List<KFE.Models.Products> Products = new List<KFE.Models.Products>();
        public List<GalleryWithTag> galleryWithTags = new List<GalleryWithTag>();
        MyClass.GalleryController galleryController = new MyClass.GalleryController();
        MyClass.ProductsController productsController = new MyClass.ProductsController();
        public MyClass.Categories categories = new MyClass.Categories();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadSliderImages();
                LoadProducts();
                LoadGalleryItems();
            }
        }
        public void LoadSliderImages()
        {
            hfe.cmd = new SqlCommand("select * from SliderImages");
            hfe.getdata();
            if (hfe.dt.Rows.Count > 0)
            {
                Sliders.Clear();
                for (int i = 0; i < hfe.dt.Rows.Count; i++)
                    Sliders.Add(new Slider((int)hfe.dt.Rows[i]["Id"], hfe.dt.Rows[i]["ImagePath"].ToString()));
            }
        }
        public void LoadProducts()
        {
            var products=productsController.GetAllProducts();
            Products.Clear();
            for (int i = 0; i < products.Count; i++)
                Products.Add(new Models.Products(products[i].Id, products[i].Title, products[i].Description, products[i].ImagePath));

            //hfe.cmd = new SqlCommand("select * from Products");
            //hfe.getdata();
            //if (hfe.dt.Rows.Count > 0)
            //{}
        }
        public void LoadGalleryItems()
        {
            var galleries = galleryController.GetAllGalleries();
            galleryWithTags.Clear();
            for (int i = 0; i < galleries.Count; i++)
                galleryWithTags.Add(new GalleryWithTag(galleries[i].Id, galleries[i].ImagePath, categories.GetCategoryByID(Convert.ToInt32(galleries[i].Tag)).SF));

            //hfe.cmd = new SqlCommand("select * from Gallery");
            //hfe.getdata();
            //if (hfe.dt.Rows.Count > 0)
            //{
               
            //}
        }

    }
}