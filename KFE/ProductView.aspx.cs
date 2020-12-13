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
        public MyClass.ProductsController productsController = new MyClass.ProductsController();
        MyClass.CartController cartController = new MyClass.CartController();
        MyClass.Categories categories = new MyClass.Categories();
        MyClass.DeliveryPointsController deliveryPinController = new MyClass.DeliveryPointsController();
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
            if (!IsPostBack)
            {

                StockResult.Text = "";
                DeliveryResultText.Text = "Enter pin number to check delivery";
            }
        }
        void loadProductBy(int id)
        {
            var product= productsController.GetProductBy(id);
            ProductImg.ImageUrl = "https://static.kfefresh.com/Images/Products/" + product.ImagePath;
            ProductNameText.Text = product.Title;
            DescriptionText.Text = product.Description;
            CategoryText.Text = categories.GetCategoryByID(product.CategoryId).Name;

            PriceText.Text = product.Price + "/Kg";
            FinalPriceText.Text = product.Price + "/Kg (final price)";
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
            BtnAddToCart.Enabled = true;
        }
        string Decrypt(string value)
        {
           return MyClass.EncryptDecrypt.Decrypt(value);
        }

        protected void BtnAddToCart_Click(object sender, EventArgs e)
        {
            int cId = 0;
            int.TryParse(Session["customerId"].ToString(), out cId);
            if (ProductId == 0)
            {
                Response.Redirect("/Shop");
            }
            if (cId != 0)
            {
                if (cartController.HasAllReadyExist(cId, ProductId))
                {
                    Response.Redirect("/MyCart");
                }
                else
                {
                    if (cartController.GetAllCartCountByUser(cId) >= 20)
                    {
                        Page.Controls.Add(MyClass.Message.Messagebox("Cart is Full"));
                        return;
                    }
                    var value = "";
                    if (NeedCheckBox.Checked)
                    {
                        value = "Need Cleaning";
                    }
                    if(productsController.GetProductBy(ProductId).StockCount >= Convert.ToDecimal(QantityText.Text))
                    {
                        cartController.AddToCart(new Cart()
                        {
                            CustomerId = cId,
                            ProductId = ProductId,
                            Count = Convert.ToDecimal(QantityText.Text),
                            Extras = value,
                        });
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        StockResult.Text = "We don't have that much in stock. Please enter lower quantity or call us directly";
                        //Page.Controls.Add(MyClass.Message.Messagebox("We don't have that much in stock. Please enter lower quantity or call us directly"));
                    }
                }
            }
            else
            {
                Response.Redirect("/Login");
            }
        }

        protected void CheckDeliveryBtn_Click(object sender, EventArgs e)
        {
            int enterdPin = Convert.ToInt32(DeliveryPin.Text);
            if (deliveryPinController.hasPin(enterdPin))
            {
                DeliveryResultText.Text = "Delivery is availabale at your place";
            }
            else
            {
                DeliveryResultText.Text = "Delivery is not availabale at your place";
            }
        }
        protected bool HasStock()
        {
            bool result = false; 
            if (productsController.GetProductBy(ProductId).StockCount > 0)
            {
                result = true;
            }
            return result;
        }
        protected string GetProductName()
        {
            return productsController.GetProductBy(ProductId).Title;
        }
        protected List<Product> RandomProducts()
        {
            Random rnd = new Random();
            var prds = productsController.GetAllProducts().OrderBy(x => rnd.Next()).Take(3);
            return prds.ToList();
        }
        
    }
}