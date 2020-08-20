using KFE.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace KFE.Models
{
    public class GalleryWithTag
    {
        int Id;
        public string ImageName;
        public string Tag;
        public GalleryWithTag(int id,string na, string ta)
        {
            this.Id = id;
            this.ImageName = na;
            this.Tag = ta;
        }
        public GalleryWithTag(string na, string ta)
        {
            this.ImageName = na;
            this.Tag = ta;
        }
    }
}
public static class GalleryTags
{
    public static GalleryWithTag[] Tags = { new GalleryWithTag("Sea Fish","sea"), new GalleryWithTag("Shell Fish", "shell"), new GalleryWithTag("Fresh Water", "fresh") , new GalleryWithTag("Others", "other") };
    
}
