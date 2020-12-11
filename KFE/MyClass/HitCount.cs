using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI.WebControls;

namespace KFE.MyClass
{
    [ScriptService]
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

        public int GetAllCount()
        {
            int visiters;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                DateTime today = DateTime.Now.Date;
                var hits = dc.HitCounters.Where(x => System.Data.Entity.DbFunctions.TruncateTime(x.CreateDate) != today);
                visiters = hits.Count();
            }
            return visiters;
        }
        public List<Visiters> GetAllFromLast()
        {
            List<Visiters> visiters = new List<Visiters>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                DateTime today = DateTime.Now.Date;
                var hits = dc.HitCounters.Where(x => System.Data.Entity.DbFunctions.TruncateTime(x.CreateDate) != today);
                for (double i = 0; i < 7; i++)
                {
                    var date = today.AddDays(-(i + 1));
                    var visitor = new Visiters();
                    visitor.Date = date;
                    visitor.Count = hits.Where(x => System.Data.Entity.DbFunctions.TruncateTime(x.CreateDate) == date).Count();
                    visiters.Add(visitor);
                }
            }
            visiters.Reverse();
            return visiters;
        }


        public List<Visiters> GetAllFromPrevious()
        {
            List<Visiters> visiters = new List<Visiters>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                DateTime today = DateTime.Now.Date;
                var hits = dc.HitCounters.Where(x => System.Data.Entity.DbFunctions.TruncateTime(x.CreateDate) != today);
                for (double i = 7; i < 14; i++)
                {
                    var date = today.AddDays(-(i+1));
                    var visitor = new Visiters();
                    visitor.Date = date;
                    visitor.Count = hits.Where(x => System.Data.Entity.DbFunctions.TruncateTime(x.CreateDate) == date).Count();
                    visiters.Add(visitor);
                }
            }
            visiters.Reverse();
            return visiters;
        }
    }

    public class Visiters
    {
        public DateTime Date;
        public int Count;

        public Visiters()
        {

        }
        public Visiters(DateTime date, int count)
        {
            Date = date;
            Count = count;
        }
    }
}