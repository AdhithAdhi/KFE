using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;

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
        public int IsCustomerExistBy(string userName,string password)
        {
            var result = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(Customer cus in dc.Customers)
                {
                    if ((cus.Email.ToLower().Equals(userName.ToLower()) || cus.Phone == userName) && Crypto.VerifyHashedPassword(cus.Password, password))
                    {
                        result = cus.CustomerId;
                    }
                }
            }
            return result;
        }
        public bool hasCustomerById(int customerId)
        {
            bool result = false;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Customer cus in dc.Customers)
                {
                    if (cus.CustomerId == customerId)
                    {
                        result = true;
                    }
                }
            }
            return result;
        }

        public bool hasPendingCustomerById(int customerId)
        {
            bool result = false;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Customer cus in dc.Customers)
                {
                    if (cus.CustomerId == customerId && cus.Verified == false)
                    {
                        result = true;
                    }
                }
            }
            return result;
        }

        public Customer GetCustomerBy(int customerId)
        {
            Customer result = new Customer();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Customer cus in dc.Customers)
                {
                    if (cus.CustomerId == customerId)
                    {
                        result = cus;
                    }
                }
            }
            return result;
        }
        public void UpdateCustomerBy(Customer newCustomer)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var customer =dc.Customers.FirstOrDefault((x) => x.CustomerId.Equals(newCustomer.CustomerId));
                if (customer != null)
                {
                    customer.Address = newCustomer.Address;
                    customer.Name = newCustomer.Name;
                    customer.Email = newCustomer.Email;
                    customer.Phone = newCustomer.Phone;
                    customer.Pin = newCustomer.Pin;
                    customer.Verified = newCustomer.Verified;
                    customer.Password = newCustomer.Password;
                }
                dc.SaveChanges();
            }
        }
        public void UpdateCustomerPassWordBy(Customer newCustomer)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var customer = dc.Customers.FirstOrDefault((x) => x.CustomerId.Equals(newCustomer.CustomerId));
                if (customer != null)
                {
                    customer.Password = newCustomer.Password;
                }
                dc.SaveChanges();
            }
        }
        public bool EmailAlreadyExist(string email)
        {
            bool result =false;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Customer cus in dc.Customers)
                {
                    if (cus.Email == email)
                    {
                        result = true;
                    }
                }
            }
            return result;
        }
        public Customer GetUserByEmail(string email)
        {
            Customer result = null;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Customer cus in dc.Customers)
                {
                    if (cus.Email == email)
                    {
                        result = cus;
                    }
                }
            }
            return result;
        }
    }
}