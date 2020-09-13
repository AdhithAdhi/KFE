using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class ProductView : System.Web.UI.Page
    {
        MyClass.ProductsController productsController = new MyClass.ProductsController();
        MyClass.CartController cartController = new MyClass.CartController();
        MyClass.Categories categories = new MyClass.Categories();
        int ProductId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                var productId = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Product"]));
                if (productId != "error")
                {
                    if (int.TryParse(productId, out ProductId))
                        loadProductBy(ProductId);
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
                Response.Redirect("/Shop");
            }
        }
        void loadProductBy(int id)
        {
            var product= productsController.GetProductBy(id);
            ProductImg.ImageUrl = "https://static.kfefresh.com/Images/Products/" + product.ImagePath;
            ProductNameText.Text = product.Title;
            DescriptionText.Text = product.Description;
            CategoryText.Text = categories.GetCategoryByID(product.CategoryId).Name;
            PriceText.Text = product.Price+"/Kg";
            FinalPriceText.Text = product.Price + "/Kg";
            if (Session["customerId"] != null)
            {
                if (cartController.HasAllReadyExist(Convert.ToInt32(Session["customerId"].ToString()), ProductId))
                {
                    BtnAddToCart.Text = "Go to Cart";
                }
                else
                {
                    BtnAddToCart.Text = "Add to Cart";
                }
            }
        }
        string Decrypt(string value)
        {
           return MyClass.EncryptDecrypt.Decrypt(value);
        }

        protected void BtnAddToCart_Click(object sender, EventArgs e)
        {
            if (ProductId == 0)
            {
                Response.Redirect("/Shop");
            }
            if (Session["customerId"] != null)
            {
                if (cartController.HasAllReadyExist(Convert.ToInt32(Session["customerId"].ToString()), ProductId))
                {
                    Response.Redirect("/MyCart");
                }
                else
                {
                    var value = "";
                    if (NeedCheckBox.Checked)
                    {
                        value = "Need Cleaning";
                    }
                    cartController.AddToCart(new Cart()
                    {
                        CustomerId = Convert.ToInt32(Session["customerId"].ToString()),
                        ProductId = ProductId,
                        Count = Convert.ToDecimal(QantityText.Text),
                        Extras = value,
                    });
                    Response.Redirect(Request.RawUrl);
                }
            }
            else
            {
                Response.Redirect("/Login");
            }
        }
    }
}