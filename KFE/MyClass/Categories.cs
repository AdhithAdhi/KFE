using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class Categories
    {
        public void AddCategory(Category category)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.Categories.Add(category);
                dc.SaveChanges();

            }
        }

        public void DeleteAll()
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                dc.Categories.RemoveRange(dc.Categories);
                dc.SaveChanges();
            }
        }
        public void Delete(Category category)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.Categories.Remove(category);
                dc.SaveChanges();
            }
        }
        public void DeleteById(int id)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var singleRec = dc.Categories.FirstOrDefault(x => x.Id == id);// object your want to delete
                dc.Categories.Remove(singleRec);
                dc.SaveChanges();
            }
        }


        public List<Category> GetCategories()
        {
            List<Category> categories = new List<Category>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(Category cat in dc.Categories)
                {
                    categories.Add(cat);
                }

            }
            return categories;
        }

        public Category GetCategoryByID(int id)
        {
            Category category = new Category();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(Category cat in dc.Categories)
                {
                    if (id == cat.Id)
                    {
                        category = cat;
                        break;
                    }
                }

            }
            return category;
        }
        public Category GetCategoryBySf(string sf)
        {
            Category category = new Category();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Category cat in dc.Categories)
                {
                    if (sf == cat.SF)
                    {
                        category = cat;
                        break;
                    }
                }

            }
            return category;
        }
        public Category GetCategoryByPosition(int pos)
        {
            Category category = new Category();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                category = dc.Categories.ElementAt(pos);

            }
            return category;
        }
        public bool HasCategoryByID(int id)
        {
            var result = false;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Category cat in dc.Categories)
                {
                    if (id == cat.Id)
                    {
                        result = true;
                        break;
                    }
                }

            }
            return result;
        }
    }
}