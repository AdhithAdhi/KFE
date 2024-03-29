﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class CartController
    {
        public void AddToCart(Cart cart)
        {

            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.Carts.Add(cart);
                dc.SaveChanges();
            }
        }

        public List<Cart> GetAllCartByUser(int CustomerId)
        {
            List<Cart> carts = new List<Cart>();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach (Cart cart in dc.Carts)
                {
                    if (cart.CustomerId == CustomerId)
                        carts.Add(cart);
                }

            }
            return carts;
        }

        public int GetAllCartCountByUser(int CustomerId)
        {
            int cartsCount = 0;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                cartsCount = dc.Carts.Where(x => x.CustomerId.Equals(CustomerId)).Count();
                

            }
            return cartsCount;
        }
        public void DeleteById(int id)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var singleRec = dc.Carts.FirstOrDefault(x => x.CartId == id);// object your want to delete
                dc.Carts.Remove(singleRec);
                dc.SaveChanges();
            }
        }
        public bool HasAllReadyExist(int customerId,int productId)
        {
            bool result = false;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(Cart cart in dc.Carts)
                {
                    if(cart.CustomerId==customerId&& cart.ProductId == productId)
                    {
                        result = true;
                    }
                }
            }
            return result;
        }
        public Cart GetCartById(int cartId)
        {
            Cart cart = new Cart();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var singleRec = dc.Carts.FirstOrDefault(x => x.CartId == cartId);// object your want to delete
                cart = singleRec;
            }
            return cart;
        }
        public void saveCart(Cart cart)
        {
            
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                var singleRec = dc.Carts.FirstOrDefault(x => x.CartId == cart.CartId);
                singleRec = cart;
                dc.SaveChanges();
            }
        }
    }
}