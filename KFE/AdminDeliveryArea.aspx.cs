using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AdminDeliveryArea : System.Web.UI.Page
    {
        MyClass.DeliveryPointsController pointsController = new MyClass.DeliveryPointsController();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sub_Button1_Click(object sender, EventArgs e)
        {
            pointsController.AddDeliveryPincode(new DeliveryPincode()
            {
                Pincode =Convert.ToInt32(Pin_Text.Text),
            });
            Page.Controls.Add(MyClass.Message.Messagebox("New Area Added."));
            Response.Redirect(Request.RawUrl);
        }

        protected void DeleteArea(object sender, GridViewDeleteEventArgs e)
        {
            //int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["Id"].ToString());
            Page.Controls.Add(MyClass.Message.Messagebox("Area has removed"));
            //pointsController.DeletePinCode(id);
            //Response.Redirect(Request.RawUrl);
        }
    }
}