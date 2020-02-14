using System;
using System.Data.SqlClient;
using System.Data;

namespace Common
{
    public class SQLInfo
    {
        public string SQLConnectionString { get; set; }
        public string DataBaseServer { get; set; }
        public string DataBaseName { get; set; }
        public string DBUserName { get; set; }
        public string DBUserPassword { get; set; }
        public SqlConnection DBConnection { get; set; }
        public DataTable QueryResultTable { get; set; }
        public string QueryToExecute { get; set; }
    }
}
