using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pages.DataLabs.Data
{
    public class PatientCasebookData
    {
        public String CRF { get; set; }
        public String FormStatus { get; set; }
        public String DCF { get; set; }
        public String SDVerify { get; set; }
        public String MReview { get; set; }
        public String DReview { get; set; }
        public String Signed { get; set; }
        public String Frozen { get; set; }
        public String Locked { get; set; }
    }
}