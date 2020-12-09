using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class Index : System.Web.UI.Page
    {
        public List<Models.Slider> Sliders = new List<Models.Slider>();
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
                    Sliders.Add(new Models.Slider(sliders[i].Id, sliders[i].ImagePath));
            }
        }
    }
}