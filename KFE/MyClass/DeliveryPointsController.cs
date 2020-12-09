using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KFE.MyClass
{
    public class DeliveryPointsController
    {
        public void AddDeliveryPincode(DeliveryPincode pincode)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                dc.DeliveryPincodes.Add(pincode);
                dc.SaveChanges();
            }
        }
        public DeliveryPincode GetPinById(int pincodeId)
        {
            DeliveryPincode pincode = new DeliveryPincode();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                pincode=dc.DeliveryPincodes.FirstOrDefault(x => x.Id == pincodeId);
            }
            return pincode;
        }
        public DeliveryPincode GetPinBy(int pin)
        {
            DeliveryPincode pincode = new DeliveryPincode();
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                pincode = dc.DeliveryPincodes.FirstOrDefault(x => x.Pincode == pin);
                dc.SaveChanges();
            }
            return pincode;
        }
        public bool hasPin(int pin)
        {
            bool hasPincode = false;
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {
                foreach(DeliveryPincode pincode in dc.DeliveryPincodes)
                {
                    if (pincode.Pincode == pin)
                    {
                        hasPincode = true;
                        break;
                    }
                }
            }
            return hasPincode;
        }
        public void DeletePinCode(int id)
        {
            using (Kfe_Fresh_DBEntities dc = new Kfe_Fresh_DBEntities())
            {

                var singleRec = dc.DeliveryPincodes.FirstOrDefault(x => x.Id == id);// object your want to delete
                dc.DeliveryPincodes.Remove(singleRec);
                dc.SaveChanges();
            }
        }
    }
}