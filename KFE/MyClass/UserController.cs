using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class UserController
    {
        public bool AddCustomer(Customer customer)
        {
            var result = false;
            try
            {
                using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
                {
                    dc.Customers.Add(customer);
                    if (dc.SaveChanges() > 0)
                    {
                        result = true;
                    }
                }
            }
            catch(Exception ex)
            {

            }
            return result;
        }
        public void DeleteById(int id)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var singleRec = dc.Customers.FirstOrDefault(x => x.CustomerId == id);// object your want to delete
                dc.Customers.Remove(singleRec);
                dc.SaveChanges();
            }
        }
        public string IsCustomerExistBy(string userName,string password)
        {
            var result = "";
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(Customer cus in dc.Customers)
                {
                    if((cus.Email==userName||cus.Phone==userName)&& cus.Password == password)
                    {
                        result = cus.CustomerId.ToString();
                    }
                }
            }
            return result;
        }
    }
}