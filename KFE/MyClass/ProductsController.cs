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
        public List<Product> GetProductsFromAndTo(int StartPos,int EndPos)
        {
            List<Product> products = new List<Product>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                int i = 0;
                foreach (Product pt in dc.Products)
                {
                    if (i >= StartPos && i < EndPos)
                        products.Add(pt);

                    i++;
                }

            }
            return products;
        }
        public List<Product> GetProductsFromAndToContains(string str,int StartPos, int EndPos)
        {
            List<Product> products = new List<Product>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var filterdproducts = new List<Product>();
                foreach (Product product in dc.Products)
                {
                    if(product.Title.ToLower().Contains(str) || product.Category.Name.ToLower().Contains(str) || product.Description.ToLower().Contains(str))
                    {
                        filterdproducts.Add(product);
                    }
                    // 
                }
                for(int i=0;i< filterdproducts.Count;i++)
                {
                    if (i >= StartPos && i < EndPos)
                        products.Add(filterdproducts[i]);

                }


            }
            return products;
        }
        public int GetProductsCountContains(string str)
        {
            List<Product> products = new List<Product>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Product product in dc.Products)
                {
                    if (product.Title.ToLower().Contains(str) || product.Category.Name.ToLower().Contains(str) || product.Description.ToLower().Contains(str))
                    {
                        products.Add(product);
                    }
                }
            }
            return products.Count;
        }
        public int GetAllProductsCount()
        {
            int totalCount = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                totalCount = dc.Products.Count();
            }
            return totalCount;
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

        public Product GetProductBy(int id)
        {
            Product product= new Product();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                product = dc.Products.FirstOrDefault(x => x.Id == id);
            }
            return product;
        }

        public void ProductChangeWith(Product product)
        {

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(Product p in dc.Products)
                {
                    if (p.Id == product.Id)
                    {
                        p.StockCount = product.StockCount;
                        break;
                    }
                    dc.SaveChanges();
                }
            }
        }
    }
}