using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class OrderController
    {
        public int AddToOrders(Order order)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.Orders.Add(order);
                dc.SaveChanges();
            }
            var id = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                id = dc.Orders.Last().OrderId;
            }
            return id;
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
        public Order GetOrdersByOrder(int orderId)
        {
            Order order = new Order();

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                order = dc.Orders.FirstOrDefault((x) => x.OrderId.Equals(orderId));
                
            }
            return order;
        }
    }
}