using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.WebServices.Data
{
    public class ResponseData
    {
        public IList<SyncResponseData> StatuscodesWithResponses { get; set; }
        public string Response { get; set; }
        public int RecCount { get; set; }
        //public Table QueryResponseTable { get; set; }
    }

    public class SyncResponseData
    {
        public string Statuscode { get; set; }
        public string ResponseMessage { get; set; }
    }
}
