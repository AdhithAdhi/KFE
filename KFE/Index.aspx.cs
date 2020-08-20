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
        public List<Products> Products = new List<Products>();
        public List<GalleryWithTag> galleryWithTags = new List<GalleryWithTag>();
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
            hfe.cmd = new SqlCommand("select * from Products");
            hfe.getdata();
            if (hfe.dt.Rows.Count > 0)
            {
                Products.Clear();
                for (int i = 0; i < hfe.dt.Rows.Count; i++)
                    Products.Add(new Products((int)hfe.dt.Rows[i]["Id"], hfe.dt.Rows[i]["Title"].ToString(), hfe.dt.Rows[i]["Description"].ToString(), hfe.dt.Rows[i]["ImagePath"].ToString()));
            }
        }
        public void LoadGalleryItems()
        {
            hfe.cmd = new SqlCommand("select * from Gallery");
            hfe.getdata();
            if (hfe.dt.Rows.Count > 0)
            {
                galleryWithTags.Clear();
                for (int i = 0; i < hfe.dt.Rows.Count; i++)
                    galleryWithTags.Add(new GalleryWithTag((int)hfe.dt.Rows[i]["Id"], hfe.dt.Rows[i]["ImagePath"].ToString(), hfe.dt.Rows[i]["Tag"].ToString()));
            }
        }

    }
}