using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class SliderController
    {
        public void AddSlider(SliderImage slider)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.SliderImages.Add(slider);
                dc.SaveChanges();
            }

        }
        public List<SliderImage> GetAllSliders()
        {
            List<SliderImage> sliders = new List<SliderImage>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (SliderImage sl in dc.SliderImages)
                {
                    sliders.Add(sl);
                }

            }
            return sliders;
        }
        public string GetSlidersPathBy(int Id)
        {
            string sliderpath ="";
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var singleRec = dc.SliderImages.FirstOrDefault(x => x.Id == Id);// object your want to delete
                sliderpath = singleRec.ImagePath;

            }
            return sliderpath;
        }
        public string DeleteById(int id)
        {
            string path = "";
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var singleRec = dc.SliderImages.FirstOrDefault(x => x.Id == id);// object your want to delete
                path = singleRec.ImagePath;
                dc.SliderImages.Remove(singleRec);
                dc.SaveChanges();
            }
            return path;
        }
    }
}