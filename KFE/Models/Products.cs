using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.Models
{
    public class Products
    {
        public int Id { get; set; }
        public string ImagePath { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Products(int id,string title,string des,string imgpath)
        {

            this.Id = id;
            this.Title = title;
            this.Description = des;
            this.ImagePath = imgpath;
        }
    }
}