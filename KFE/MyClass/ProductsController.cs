using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class ProductsController
    {
        public void AddProduct(Product product)
        {

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.Products.Add(product);
                dc.SaveChanges();
            }
        }

        public List<Product> GetAllProducts()
        {
            List<Product> products = new List<Product>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Product pt in dc.Products)
                {
                    products.Add(pt);
                }

            }
            return products;
        }
        public string DeleteById(int id)
        {
            string path = "";
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var singleRec = dc.Products.FirstOrDefault(x => x.Id == id);// object your want to delete
                path = singleRec.ImagePath;
                dc.Products.Remove(singleRec);
                dc.SaveChanges();
            }
            return path;
        }

        //public void ProductStockChange(Product product)
        //{

        //    using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
        //    {
        //        dc.Products.Add(product);
        //        dc.SaveChanges();
        //    }
        //}
    }
}