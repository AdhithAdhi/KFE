using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class GalleryController
    {
        public void AddGallery(Gallery gallery)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.Galleries.Add(gallery);
                dc.SaveChanges();
            }
        }
        public List<Gallery> GetAllGalleries()
        {
            List<Gallery> galleries = new List<Gallery>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Gallery ga in dc.Galleries)
                {
                    galleries.Add(ga);
                }

            }
            return galleries;
        }
        public Gallery GetGalleryById(int id)
        {
            Gallery gallery = new Gallery();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Gallery gal in dc.Galleries)
                {
                    if (id == gal.Id)
                    {
                        gallery = gal;
                        break;
                    }
                }

            }
            return gallery;
        }
        public string DeleteById(int id)
        {
            string path = "";
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var singleRec = dc.Galleries.FirstOrDefault(x => x.Id == id);// object your want to delete
                path = singleRec.ImagePath;
                dc.Galleries.Remove(singleRec);
                dc.SaveChanges();
            }
            return path;
        }
    }
}