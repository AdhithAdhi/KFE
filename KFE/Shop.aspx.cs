using KFE.Models;
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
        public List<Slider> Sliders = new List<Slider>();

        MyClass.SliderController sliderController = new MyClass.SliderController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadSliderImages();
            }
        }
        public void LoadSliderImages()
        {
            var sliders = sliderController.GetAllSliders();
            if (sliders.Count > 0)
            {
                Sliders.Clear();
                for (int i = 0; i < sliders.Count; i++)
                    Sliders.Add(new Slider(sliders[i].Id, sliders[i].ImagePath));
            }
        }
    }
}