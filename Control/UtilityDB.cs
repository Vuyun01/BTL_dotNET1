using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;


namespace BTL_dotNET.Control
{
    class UtilityDB
    {
        public static SqlConnection connect;
        public static SqlCommand cmd;
        public static SqlDataAdapter da;

        public static void openConnectionDB(string serverName, string database)
        {
            string strConnection = "Data Source='" + serverName + "';" +
                                  "Initial Catalog='" + database + "';" +
                                 "Integrated Security = True";
            connect = new SqlConnection(strConnection);
            connect.Open();
        }

        public static DataTable getDatafromDB(string sql)
        {
            cmd = new SqlCommand(sql, connect);
            da = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            da.Fill(data);
            return data;

        }
        public static void ExecuteQuery(string sql)
        {
            cmd = new SqlCommand(sql, connect);
            cmd.ExecuteNonQuery();
        }

        public static void disConnection()
        {
            connect.Close();
        }
    }
}
