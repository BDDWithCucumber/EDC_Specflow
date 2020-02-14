using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class DS_SQLInfo
    {
        public string SQLConnectionString { get; set; }
        public string DSDataBaseServer { get; set; }
        public string DSDataBaseName { get; set; }
        public string DSDBUserName { get; set; }
        public string DSDBUserPassword { get; set; }
        public SqlConnection DSDBConnection { get; set; }
        public DataTable DSQueryResultTable { get; set; }
        public string DSQueryToExecute { get; set; }
    }
}
