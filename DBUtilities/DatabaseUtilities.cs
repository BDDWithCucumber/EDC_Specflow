using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Common;
using System.Reflection;
using Reports.DebugLog;

namespace DBUtilities
{
    public class DatabaseUtilities
    {
        /*
        public static string DBServerName { get; set; }
        public static string DBName { get; set; }
        public static string UserID { get; set; }
        public static string Password { get; set; }

        */
        //public DBInfo;
        

        public static void SQLData(string DBServer, string DBName, string UserName, string Password)
        {
            SQLInfo DBInfo = new SQLInfo();
            DBInfo.DataBaseServer = DBServer;
            DBInfo.DataBaseName = DBName;
            DBInfo.DBUserName = UserName;
            DBInfo.DBUserPassword = Password;
            DBInfo.SQLConnectionString = @"Data Source=" + DBInfo.DataBaseServer + ";Initial Catalog=" + DBInfo.DataBaseName + ";User ID=" + DBInfo.DBUserName + ";Password=" + DBInfo.DBUserPassword + "";
        }

        public static bool ConnectToDB(SQLInfo DBInfo)
        //public static SqlConnection ConnectToDB(string DBServerName, string DBName, string UserID, string Password)
        {
            try
            {
                string ConString;
                ConString = DBInfo.SQLConnectionString;
                //ConString = @"Data Source=ABC;Initial Catalog=Demo;User ID=sa;Password=Datalabs123";
                //ConString = @"Data Source=" + DBServerName + ";Initial Catalog=" + DBName + ";User ID=" + UserID + ";Password=" + Password + "";
                SqlConnection DbCon;
                DbCon = new SqlConnection(ConString);
                DbCon.Open();
                DBInfo.DBConnection = DbCon;
                return IsDBConnectionAlive(DBInfo);
            }
            catch (Exception e)
            {
                //fail statement
                return false;
            }
            
        }

        public static bool ConnectToDSDB(DS_SQLInfo DBInfo)
        //public static SqlConnection ConnectToDB(string DBServerName, string DBName, string UserID, string Password)
        {
            try
            {
                string ConString;
                ConString = DBInfo.SQLConnectionString;
                //ConString = @"Data Source=ABC;Initial Catalog=Demo;User ID=sa;Password=Datalabs123";
                //ConString = @"Data Source=" + DBServerName + ";Initial Catalog=" + DBName + ";User ID=" + UserID + ";Password=" + Password + "";
                SqlConnection DbCon;
                DbCon = new SqlConnection(ConString);
                DbCon.Open();
                DBInfo.DSDBConnection = DbCon;
                return IsDSDBConnectionAlive(DBInfo);
            }
            catch (Exception e)
            {
                //fail statement
                return false;
            }

        }

        public static bool IsDSDBConnectionAlive(DS_SQLInfo DBInfo)
        {
            //SQLInfo DBInfo = new SQLInfo();
            SqlConnection ConnObj = DBInfo.DSDBConnection;
            if (ConnObj == null || (ConnObj != null && (ConnObj.State == ConnectionState.Closed || ConnObj.State == ConnectionState.Broken)))
            {
                //fail statement
                return false;
            }
            return true;
        }

        public static bool IsDBConnectionAlive(SQLInfo DBInfo)
        {
            //SQLInfo DBInfo = new SQLInfo();
            SqlConnection ConnObj = DBInfo.DBConnection;
            if (ConnObj == null || (ConnObj != null && (ConnObj.State == ConnectionState.Closed || ConnObj.State == ConnectionState.Broken)))
            {
                //fail statement
                return false;
            }
            return true;
        }

        public static DataTable GetRecordsFromDB(string SqlQuery, SQLInfo DBInfo)
        {
            try
            {
                DataSet dataset = new DataSet();
                //SQLInfo DBInfo = new SQLInfo();
                if (!IsDBConnectionAlive(DBInfo))
                {
                    if(!ConnectToDB(DBInfo))
                    {
                        return null;
                    }
                }
                SqlDataAdapter dataAdaptor = new SqlDataAdapter();
                dataAdaptor.SelectCommand = new SqlCommand(SqlQuery, DBInfo.DBConnection);
                dataAdaptor.SelectCommand.CommandType = CommandType.Text;

                dataAdaptor.Fill(dataset, "table");
                CloseDBConnection(DBInfo);
                return dataset.Tables["table"];
            }
            catch (Exception e)
            {
                CloseDBConnection(DBInfo);
                return null;
                //fail statement
            }
            
        }
		public static bool ExecuteUpdateQuery(string SqlQuery, SQLInfo DBInfo)
		{
			try
			{
				if (!IsDBConnectionAlive(DBInfo))
				{
					if (!ConnectToDB(DBInfo))
					{
						return false;
					}
				}
				SqlCommand sqlCommand = DBInfo.DBConnection.CreateCommand();
				sqlCommand.Connection = DBInfo.DBConnection;
				sqlCommand.CommandText = SqlQuery;
				sqlCommand.ExecuteNonQuery();
				CloseDBConnection(DBInfo);
				return true;
			}
			catch (Exception e)
			{
				CloseDBConnection(DBInfo);
				new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
				return false;
			}
		}
        public static DataTable GetRecordsFromDSDB(string SqlQuery, DS_SQLInfo DBInfo)
        {
            try
            {
                DataSet dataset = new DataSet();
                //SQLInfo DBInfo = new SQLInfo();
                if (!IsDSDBConnectionAlive(DBInfo))
                {
                    if (!ConnectToDSDB(DBInfo))
                    {
                        return null;
                    }
                }
                SqlDataAdapter dataAdaptor = new SqlDataAdapter();
                dataAdaptor.SelectCommand = new SqlCommand(SqlQuery, DBInfo.DSDBConnection);
                dataAdaptor.SelectCommand.CommandType = CommandType.Text;

                dataAdaptor.Fill(dataset, "table");
                CloseDSDBConnection(DBInfo);
                return dataset.Tables["table"];
            }
            catch (Exception e)
            {
                CloseDSDBConnection(DBInfo);
                return null;
                //fail statement
            }

        }

        public static bool CloseDBConnection(SQLInfo DBInfo)
        {
            //SQLInfo DBInfo = new SQLInfo();
            if(IsDBConnectionAlive(DBInfo))
            {
                DBInfo.DBConnection.Close();
                return !IsDBConnectionAlive(DBInfo);
            }
            return false;
        }

        public static bool CloseDSDBConnection(DS_SQLInfo DBInfo)
        {
            //SQLInfo DBInfo = new SQLInfo();
            if (IsDSDBConnectionAlive(DBInfo))
            {
                DBInfo.DSDBConnection.Close();
                return !IsDSDBConnectionAlive(DBInfo);
            }
            return false;
        }

        /*
        public static bool VerifyDataInDB(string QueryToExecute, DataTable DataToVerify)
        {
            DataTable DataInDB = new DataTable();
            DataInDB = GetRecordsFromDB(QueryToExecute);
            DataInDB
            return false;
        }
        */
    }


}
