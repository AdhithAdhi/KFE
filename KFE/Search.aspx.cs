using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class Search : System.Web.UI.Page
    {
        public string Qry = "";
        public int PageNumber = 0;
        public int TotalPages = 0;
        int ItemsLimit = 20;
        public List<Product> Products = new List<Product>();
        MyClass.ProductsController productsController = new MyClass.ProductsController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var qry = HttpUtility.UrlDecode(Request.QueryString["S"]);
                if (qry != "")
                {
                    Qry = qry;
                    LoadProducts(qry);
                }
                else
                {
                    //Response.Redirect("/Oops");
                }

            }
            else
            {
                Response.Redirect("/Shop");
            }
        }
        public void LoadProducts(string str)
        {
            HtmlInputControl box = (HtmlInputControl)Page.Master.FindControl("SearchBox");
            box.Value = str;
            var productsCount = productsController.GetProductsCountContains(str.ToLower());
            TotalPages = productsCount / ItemsLimit;
            if (productsCount % ItemsLimit != 0)
            {
                TotalPages++;
            }
            var pageNumber = HttpUtility.UrlDecode(Request.QueryString["Page"]);
            if (pageNumber == "" || pageNumber == string.Empty)
            {
                PageNumber = 0;
                LoadAsPages(str);
            }
            else if (int.TryParse(pageNumber, out PageNumber))
            {
                LoadAsPages(str);
            }
            else
            {
                PageNumber = 1;

                int startpos = 0;
                var products = productsController.GetProductsFromAndToContains(str.ToLower(), startpos, (startpos + ItemsLimit));
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

        private void LoadAsPages(string str)
        {
            if (PageNumber > TotalPages)
            {
                Response.Redirect("/Shop");
            }
            int startpos = (PageNumber - 1) * ItemsLimit;
            var products = productsController.GetProductsFromAndToContains(str, startpos, (startpos + ItemsLimit));
            Products.Clear();
            for (int i = 0; i < products.Count; i++)
                Products.Add(products[i]);
        }

        string Decrypt(string value)
        {
            return MyClass.EncryptDecrypt.Decrypt(value);
        }
    }
}