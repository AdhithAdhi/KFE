using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.Models
{
    public class Slider
    {
        public Slider(int id, string imgpath)
        {
            this.Id = id;
            this.ImagePath = imgpath;
        }

        public int Id { get; set; }
        public string ImagePath { get; set; }
    }
}