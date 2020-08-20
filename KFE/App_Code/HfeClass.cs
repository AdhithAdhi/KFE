using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace KFE
{
    public class HfeClass
    {
        public SqlConnection con;
        public SqlDataAdapter adp;
        public SqlCommand cmd;
        public DataTable dt;
        //DataSet ds;
        public SqlDataReader rd;
        public HfeClass()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Kfe_Fresh_DBConnectionString"].ConnectionString);
        }
        public void getData_usingSqlCommand()
        {
            try
            {
                cmd.Connection = con;
                con.Open();
                rd = cmd.ExecuteReader();
                dt = new DataTable();
                dt.Load(rd);
                //adp.Fill(dt);
            }
            catch (Exception e1)
            {
                HttpContext.Current.Response.Write(e1.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }
        public void getdata()
        {
            try
            {
                con.Open();
                // cmd=new SqlCommand("select * from admin_login",con);
                adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                cmd.Connection = con;
                dt = new DataTable();

                adp.Fill(dt);
            }
            catch (Exception e2)
            {
                HttpContext.Current.Response.Write(e2.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public int setData()
        {
            int n = 0;
            try
            {
                con.Open();
                cmd.Connection = con;
                n = cmd.ExecuteNonQuery();


            }
            catch (Exception e2)
            {
                // HttpContext.Current.Response.Write(e2.Message);
                HttpContext.Current.Response.Write("<script>alert('" + e2.Message + "');</script>");
            }
            finally
            {
                con.Close();

            }
            return (n);
        }
        public void setData(string msg)
        {
            try
            {
                con.Open();
                cmd.Connection = con;
                int n = cmd.ExecuteNonQuery();

                if (n > 0)

                    HttpContext.Current.Response.Write("<script>alert('New " + msg + " Successe...!');</script>");
                else
                    HttpContext.Current.Response.Write("<script>alert('New" + msg + " Faild...!');</script>");
            }
            catch (Exception e2)
            {
                // HttpContext.Current.Response.Write(e2.Message);
                HttpContext.Current.Response.Write("<script>alert('" + e2.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}