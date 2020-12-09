using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE.MyClass
{
    public static class Message
    {

        public static Label Messagebox(string Message)
        {
            Label lblMessageBox = new Label();

            lblMessageBox.Text =
                "<script language='javascript'>" + Environment.NewLine +
                "window.alert('" + Message + "')</script>";

            return lblMessageBox;

        }
    }
}