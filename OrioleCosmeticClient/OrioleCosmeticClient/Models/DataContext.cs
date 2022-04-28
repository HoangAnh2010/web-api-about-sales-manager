using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OrioleCosmeticClient.Models
{
    public class DataContext
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        string chuoikn = @"Data Source=DESKTOP-C5KPPTM\ORIOLE;Initial Catalog=WebAPIz;Integrated Security=True";
        public DataContext()
        {
            con = new SqlConnection(chuoikn);
        }
        public DataTable readData(string sql)
        {
            con.Open();
            da = new SqlDataAdapter(sql, con);
            dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }
        public void writeData(string sql)
        {
            con.Open();
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

    }
}