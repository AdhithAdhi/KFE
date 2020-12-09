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
                    {
                        orders.Add(order);

                    }
                }
            }
            orders.Reverse();
            return orders;
        }
        public Order GetOrderByOrderId(int orderId)
        {
            Order order = new Order();

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                order = dc.Orders.FirstOrDefault((x) => x.OrderId.Equals(orderId));
                
            }
            return order;
        }
        public void saveOrderBy(Order order)
        {
            Order odr = new Order();

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                odr = dc.Orders.FirstOrDefault((x) => x.OrderId.Equals(order.OrderId));
                odr.Status = order.Status;
                dc.SaveChanges();
            }
        }
        public void CancelOrder(int orderId)
        {

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var order = dc.Orders.FirstOrDefault((x) => x.OrderId.Equals(orderId));
                order.Status = "Cancelled By User";
                dc.SaveChanges();
            }
        }
    }
}