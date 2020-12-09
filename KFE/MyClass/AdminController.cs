using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class AdminController
    {
        public string IsAdminExistBy(string userName, string password)
        {
            var result = "";
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (AdminLogin adm in dc.AdminLogins)
                {
                    if (adm.UserName == userName && adm.Password == password)
                    {
                        result = adm.Id.ToString();
                    }
                }
            }
            return result;
        }
        public AdminLogin getAdminBy(int id)
        {
            var result = new AdminLogin();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (AdminLogin adm in dc.AdminLogins)
                {
                    if (adm.Id == id)
                    {
                        result = adm;
                    }
                }
            }
            return result;
        }
        public void ChangeAdminPass(AdminLogin newAdmin)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var customer = dc.AdminLogins.FirstOrDefault((x) => x.Id.Equals(newAdmin.Id));
                if (customer != null)
                {
                    customer.Password = newAdmin.Password;
                }
                dc.SaveChanges();
            }
        }
    }
}