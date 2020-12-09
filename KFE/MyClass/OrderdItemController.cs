using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class OrderdItemController
    {
        public void AddToOrderdItem(OrderItem orderItem)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.OrderItems.Add(orderItem);
                dc.SaveChanges();
            }
        }
        public void AddToOrderdItem(List<OrderItem> orderItem)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.OrderItems.Concat(orderItem);
                dc.SaveChanges();
            }
        }
        public List<OrderItem> GetAllOrderdItemBy(int OrderId)
        {
            List<OrderItem> orderdItems = new List<OrderItem>(); 
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(OrderItem orderdItem in dc.OrderItems)
                {
                    if (orderdItem.OrderId == OrderId)
                    {
                        orderdItems.Add(orderdItem);
                    }
                }
            }
            return orderdItems;
        }
    }
}