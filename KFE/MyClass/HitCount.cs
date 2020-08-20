using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace KFE.MyClass
{
    public class HitCount
    {
        public void AddCount(HitCounter hitCounter)
        {
            using(Kfe_Fresh_DBEntities dc= new Kfe_Fresh_DBEntities())
            {

                DateTime today = DateTime.Now.Date;
                var v = dc.HitCounters.Where(a => a.IPAddress.Equals(hitCounter.IPAddress) && System.Data.Entity.DbFunctions.TruncateTime(a.CreateDate) == today).FirstOrDefault();
                if (v == null) 
                {
                    dc.HitCounters.Add(hitCounter);
                    dc.SaveChanges();

                }
            }
        }

        public void DeleteAll()
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                DateTime today = DateTime.Now.Date;
                dc.HitCounters.RemoveRange(dc.HitCounters);
                dc.SaveChanges();
            }
        }

        public object[] GetCount()
        {
            object[] o = new object[2];
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                DateTime today = DateTime.Now.Date;
                //get Today hits
                 o[0] = dc.HitCounters.Where(a => System.Data.Entity.DbFunctions.TruncateTime(a.CreateDate) == today).Count();
                //get all  hits
                 o[1] = dc.HitCounters.Count();

            }
            return o;
        }
    }
}