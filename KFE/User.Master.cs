using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class User : System.Web.UI.MasterPage
    {
        public MyClass.Categories categories = new MyClass.Categories();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}