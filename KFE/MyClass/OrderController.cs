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
        public int GetCancelledOrdersCount()
        {
            int count = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var orders = dc.Orders.Where((x) => x.Status.ToLower().Contains("cancel"));
                count = orders.Count();
            }
            return count;
        }
        public int GetNewOrdersCount()
        {
            int count = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var orders = dc.Orders.Where((x) => x.Status.ToLower().Contains("process"));
                count = orders.Count();
            }
            return count;
        }
        public int GetDeliverdOrdersCount()
        {
            int count = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var orders = dc.Orders.Where((x) => x.Status.ToLower().Contains("deliver"));
                count = orders.Count();
            }
            return count;
        }
        public int GetAcceptedOrdersCount()
        {
            int count = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var orders = dc.Orders.Where((x) => x.Status.ToLower().Contains("accept"));
                count = orders.Count();
            }
            return count;
        }
        public int GetPackedOrdersCount()
        {
            int count = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var orders = dc.Orders.Where((x) => x.Status.ToLower().Contains("pack"));
                count = orders.Count();
            }
            return count;
        }
        public int GetShippedOrdersCount()
        {
            int count = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var orders = dc.Orders.Where((x) => x.Status.ToLower().Contains("ship"));
                count = orders.Count();
            }
            return count;
        }
        public int GetTotalOrdersCount()
        {
            int count = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var orders = dc.Orders;
                count = orders.Count();
            }
            return count;
        }
        public int GetProcessingOrdersCount()
        {
            int count = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var orders = dc.Orders.Where((x) => !x.Status.ToLower().Contains("deliv") && !x.Status.ToLower().Contains("process") && !x.Status.ToLower().Contains("cancel"));
                //foreach(Order odr in dc.Orders)
                //{
                //    if(!odr.Status.ToLower().Contains("deliv") && !odr.Status.ToLower().Contains("process") && !odr.Status.ToLower().Contains("cancel"))
                //    {
                //        count++;
                //    }
                //}
                count = orders.Count();
            }
            return count;
        }
        public List<DailyOrders> GetAllFromLast()
        {
            List<DailyOrders> orders = new List<DailyOrders>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                DateTime today = DateTime.Now.Date;
                var hits = dc.Orders.Where(x => System.Data.Entity.DbFunctions.TruncateTime(x.Date) != today);
                for (double i = 0; i < 7; i++)
                {
                    var date = today.AddDays(-(i + 1));
                    var visitor = new DailyOrders();
                    visitor.Date = date;
                    visitor.Count = hits.Where(x => System.Data.Entity.DbFunctions.TruncateTime(x.Date) == date).Count();
                    orders.Add(visitor);
                }
            }
            orders.Reverse();
            return orders;
        }
    }
    public class DailyOrders
    {
        public DateTime Date;
        public int Count;

        public DailyOrders()
        {

        }
        public DailyOrders(DateTime date, int count)
        {
            Date = date;
            Count = count;
        }
    }
}