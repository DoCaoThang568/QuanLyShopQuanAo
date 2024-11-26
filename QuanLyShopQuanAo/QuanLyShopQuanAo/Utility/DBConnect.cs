using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utility
{
    public class DBConnect
    {
        public SqlConnection conn;
        string connectionstring = "Data Source=DESKTOP-PBEDVQJ\\SQLEXPRESS;Initial Catalog=QuanLyShopQuanAo;Integrated Security=True";
        DataTable dt = new DataTable();
        public DBConnect()
        {
            conn = new SqlConnection(connectionstring);
        }
        public SqlConnection GetConnection()
        {
            return new SqlConnection(connectionstring);
        }
        public void openConnect()
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }
        public void closeConnect()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
        public int getExecuteNonQuery(string caulenh)
        {
            openConnect();
            SqlCommand cmd = new SqlCommand(caulenh, conn);
            int kq = cmd.ExecuteNonQuery();
            closeConnect();
            return kq;
        }
        public object getExecuteScalar(string caulenh)
        {
            openConnect();
            SqlCommand cmd = new SqlCommand(caulenh, conn);
            object kq = cmd.ExecuteScalar();
            closeConnect();
            return kq;
        }
        public DataTable getDataTable(string sql)
        {
            DataTable tmp = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(tmp);
            return tmp;
        }
        public int updateData(string sql, DataTable dt)
        {
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            SqlCommandBuilder build = new SqlCommandBuilder(da);
            return da.Update(dt);
        }
    }
}
