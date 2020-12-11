using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;

namespace KFE.MyClass
{
    public class AdminController
    {
        public AdminDetails IsAdminExistBy(string userName, string password)
        {
            AdminDetails result = null;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (AdminLogin adm in dc.AdminLogins)
                {
                    if (adm.UserName.ToLower().Equals(userName.ToLower()) && Crypto.VerifyHashedPassword(adm.Password, password))
                    {
                        result = new AdminDetails(adm.Id, adm.UserName);
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
    public class AdminDetails
    {
        public int Id;

        public string userName;

        public AdminDetails(int id,string username)
        {
            Id = id;
            userName = username;
        }
    }
}