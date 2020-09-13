using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class OrderController
    {
        public void AddToOrders(Order order)
        {

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.Orders.Add(order);
                dc.SaveChanges();
            }
        }
        public List<Order> GetOrdersByCustomer(int CustomerId)
        {
            List<Order> orders = new List<Order>();

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(Order order in dc.Orders)
                {
                    if (order.CustomerId == CustomerId)
                        orders.Add(order);
                }
            }
            return orders;
        }
    }
}