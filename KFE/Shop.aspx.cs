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
        public List<Models.Slider> Sliders = new List<Models.Slider>();

        public List<Product> Products = new List<Product>();
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
                    Sliders.Add(new Models.Slider(sliders[i].Id, sliders[i].ImagePath));
            }
        }
        public void LoadProducts()
        {
            var products = productsController.GetAllProducts();
            Products.Clear();
            for (int i = 0; i < products.Count; i++)
                Products.Add(products[i]);

            //hfe.cmd = new SqlCommand("select * from Products");
            //hfe.getdata();
            //if (hfe.dt.Rows.Count > 0)
            //{}
        }
    }
}