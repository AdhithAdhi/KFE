using KFE.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class Shop : System.Web.UI.Page
    {
        public List<Slider> Sliders = new List<Slider>();

        public List<KFE.Models.Products> Products = new List<KFE.Models.Products>();
        MyClass.SliderController sliderController = new MyClass.SliderController();
        MyClass.ProductsController productsController = new MyClass.ProductsController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadSliderImages();
                LoadProducts();
            }
        }
        public void LoadSliderImages()
        {
            var sliders = sliderController.GetAllSliders();
            if (sliders.Count > 0)
            {
                Sliders.Clear();
                for (int i = 0; i < sliders.Count; i++)
                    Sliders.Add(new Slider(sliders[i].Id, sliders[i].ImagePath));
            }
        }
        public void LoadProducts()
        {
            var products = productsController.GetAllProducts();
            Products.Clear();
            for (int i = 0; i < products.Count; i++)
                Products.Add(new Models.Products(products[i].Id, products[i].Title, products[i].Description, products[i].ImagePath));

            //hfe.cmd = new SqlCommand("select * from Products");
            //hfe.getdata();
            //if (hfe.dt.Rows.Count > 0)
            //{}
        }
    }
}