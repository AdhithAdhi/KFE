using KFE.MyClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Http;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KFE
{
    public partial class AdminHome : System.Web.UI.Page
    {
        HitCount ht = new HitCount();
        public OrderController orderController = new OrderController();
        protected void Page_Load(object sender, EventArgs e)
        {
            //object[] o = new object[2];
            //o = ht.GetCount();
            //TodayVisitor.Text = o[0].ToString();
            //TotalVisitor.Text = o[1].ToString();

            ShowVisitersChart();
        }
        string DrawGraph(string id,string[] labels, int[] data1,int[] data2,string color1,string color2,bool hLine,bool vLine)
        {
            string chart = "";
            chart = "<canvas id=\"" + id + "\" style=\"min - height: 250px; height: 250px; max - height: 250px; max - width: 100 %; \"></canvas>";
            chart += "<script>";
            chart += "new Chart(document.getElementById(\""+ id + "\"), { type:'line', data: {";
            chart += "labels: [";
            string lbs = "";
            foreach (string str in labels)
            {
                lbs += "'" + str + "',";
            }
            lbs.Substring(0, lbs.Length - 1);
            chart += lbs + "]";
            chart += ",datasets: [{ data: [";
            string currentweek = "";
            foreach (int str in data1)
            {
                currentweek += str.ToString() + ",";
            }
            currentweek.Substring(0, currentweek.Length - 1);
            chart += currentweek + "]";
            chart += ",borderColor:\"#"+color1+"\",fill:false},";

            chart += "{ data: [";
            string preweek = "";
            foreach (int str in data2)
            {
                preweek += str.ToString() + ",";
            }
            preweek.Substring(0, preweek.Length - 1);
            chart += preweek + "]";
            chart += ",borderColor:\"#"+color2+"\",fill:false}";
            chart += "]}, options:{ legend: {display: false}, scales: { yAxes: [{ gridLines: { display: "+hLine.ToString().ToLower()+", lineWidth: '4px', color: 'rgba(0, 0, 0, .2)', zeroLineColor: 'transparent'}}], xAxes: [{ display : "+vLine.ToString().ToLower() + ", gridLines: { display: false }}]}}";
            chart += "});";
            chart += "</script>";

            return chart;
        }
        string DrawGraph(string id, string[] labels, int[] data1, string color1, bool hLine, bool vLine)
        {
            string chart = "";
            chart = "<canvas id=\"" + id + "\" style=\"min - height: 250px; height: 250px; max - height: 250px; max - width: 100 %; \"></canvas>";
            chart += "<script>";
            chart += "new Chart(document.getElementById(\"" + id + "\"), { type:'line', data: {";
            chart += "labels: [";
            string lbs = "";
            foreach (string str in labels)
            {
                lbs += "'" + str + "',";
            }
            lbs.Substring(0, lbs.Length - 1);
            chart += lbs + "]";
            chart += ",datasets: [{ data: [";
            string currentweek = "";
            foreach (int str in data1)
            {
                currentweek += str.ToString() + ",";
            }
            currentweek.Substring(0, currentweek.Length - 1);
            chart += currentweek + "]";
            chart += ",borderColor:\"#" + color1 + "\",fill:false,lineTension: 0}";

            chart += "]}, options:{ legend: {display: false}, scales: { yAxes: [{ ticks:{fontColor: '#" + color1 + "'}, gridLines: { display: " + hLine.ToString().ToLower() + ",color: '#"+color1+ "',drawBorder: false}}], xAxes: [{ ticks:{fontColor: '#" + color1 + "'}, gridLines: { display: " + vLine.ToString().ToLower() + ",color: '#" + color1 + "',drawBorder: false}}]}}";
            chart += "});";
            chart += "</script>";

            return chart;
        }
        private void ShowVisitersChart()
        {

            string chart = DrawGraph("line-chart", GetAllVisitersLabel(), GetAllVisitersCurrentWeek(),
                            GetAllVisitersPrevioustWeek(), "007bff", "ced4da", true, true);
            Literal.Text = chart;

            string saleschart = DrawGraph("sales-line-chart", GetAllDailyOrdersLabel(), GetAllDailyOrdersCount(),
                                "efefef", true, false);
            SalesLiteral.Text = saleschart;
        }

        protected void DeleteAllOnClick(object sender, EventArgs e)
        {
            ht.DeleteAll();
            Response.Redirect(Request.RawUrl);
        }
        protected float CompareToLastWeek()
        {
            int lastWeekCount = 0;
            int thisWeekCount = 0;
            foreach(Visiters vs in ht.GetAllFromLast())
            {
                thisWeekCount += vs.Count;
            }
            foreach (Visiters vs in ht.GetAllFromPrevious())
            {
                lastWeekCount += vs.Count;
            }
            if (lastWeekCount == 0)
            {
                lastWeekCount = 1;
            }
            return (thisWeekCount / lastWeekCount);
        }
        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    Label1.Text = DateTime.Now.ToString("hh:mm:ss");
        //}
        protected int GetAllVisitersCount()
        {
            return ht.GetAllCount();
        }
        protected string[] GetAllDailyOrdersLabel()
        {
            List<string> labels = new List<string>();

            var vs = orderController.GetAllFromLast();
            foreach (DailyOrders visiter in vs)
            {
                labels.Add(visiter.Date.ToString("dd-MMM-yy"));
            }
            //JavaScriptSerializer ser = new JavaScriptSerializer();
            //string labalName = ser.Serialize(labels.ToArray());
            //string[] lbls = { labalName };
            return labels.ToArray();
        }
        protected int[] GetAllDailyOrdersCount()
        {
            List<int> data = new List<int>();
            var vs = orderController.GetAllFromLast();
            foreach (DailyOrders visiter in vs)
            {
                data.Add(visiter.Count);
            }
            return data.ToArray();
        }
        protected string[] GetAllVisitersLabel()
        {
            List<string> labels = new List<string>();

            var vs = ht.GetAllFromLast();
            foreach (Visiters visiter in vs)
            {
                labels.Add(visiter.Date.ToString("dd-MMM-yy"));
            }
            //JavaScriptSerializer ser = new JavaScriptSerializer();
            //string labalName = ser.Serialize(labels.ToArray());
            //string[] lbls = { labalName };
            return labels.ToArray();
        }
        protected int[] GetAllVisitersCurrentWeek()
        {
            List<int> data = new List<int>();
            var vs = ht.GetAllFromLast();
            foreach (Visiters visiter in vs)
            {
                data.Add(visiter.Count);
            }
            return data.ToArray();
        }
        protected int[] GetAllVisitersPrevioustWeek()
        {
            List<int> data = new List<int>();

            var vs = ht.GetAllFromPrevious();
            foreach (Visiters visiter in vs)
            {
                data.Add(visiter.Count);
            }
            return data.ToArray();
        }
        //[WebMethod]
        //public List<object> getLineChartData()
        //{
        //    List<object> iData = new List<object>();
        //    List<string> labels = new List<string>();

        //    iData.Add(labels);

        //    List<int> lst_dataItem_1 = new List<int>();
        //    foreach (HitCounter hitcounter in ht.GetAll().Take(7))
        //    {
        //        lst_dataItem_1.Add(ht.GetAllByDate(hitcounter.CreateDate).Count);
        //    }
        //    iData.Add(lst_dataItem_1);

        //    List<int> lst_dataItem_2 = new List<int>();
        //    foreach (HitCounter hitcounter in ht.GetAllFromSecondLast())
        //    {
        //        lst_dataItem_2.Add(ht.GetAllByDate(hitcounter.CreateDate).Count);
        //    }
        //    iData.Add(lst_dataItem_2);

        //    iData.Add(lst_dataItem_2);
        //    return iData;
        //}
    }
}