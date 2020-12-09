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
        public int PageNumber = 0;
        public int TotalPages = 0;
        int ItemsLimit = 20;
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
            var productsCount = productsController.GetAllProductsCount();
            TotalPages = productsCount / ItemsLimit;
            if(productsCount % ItemsLimit != 0)
            {
                TotalPages++;
            }
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var pageNumber = HttpUtility.UrlDecode(Request.QueryString["Page"]);
                if (pageNumber != "" || pageNumber!=string.Empty)
                {
                    if (int.TryParse(pageNumber, out PageNumber)) 
                    {
                        if(PageNumber> TotalPages)
                        {
                            Response.Redirect("/Shop");
                        }
                        int startpos = (PageNumber - 1) * ItemsLimit;
                        var products = productsController.GetProductsFromAndTo(startpos, (startpos + ItemsLimit));
                        Products.Clear();
                        for (int i = 0; i < products.Count; i++)
                            Products.Add(products[i]);
                    }
                    else
                    {
                        Response.Redirect("/Shop");
                    }
                }
                else
                {
                    Response.Redirect("/Oops");
                }

            }
            else
            {
                PageNumber = 1;

                int startpos = 0;
                var products = productsController.GetProductsFromAndTo(startpos, (startpos + ItemsLimit));
                Products.Clear();
                for (int i = 0; i < products.Count; i++)
                    Products.Add(products[i]);
            }
            //var products = productsController.GetAllProducts();

            //hfe.cmd = new SqlCommand("select * from Products");
            //hfe.getdata();
            //if (hfe.dt.Rows.Count > 0)
            //{}
        }
    }
}