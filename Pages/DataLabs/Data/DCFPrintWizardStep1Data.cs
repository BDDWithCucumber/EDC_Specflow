using System;

namespace Pages.DataLabs.Data
{
    public class DCFPrintWizardStep1Data
    {
        public String PatientID { get; set; }
        public String DCFID { get; set; }
        public String Status { get; set; }
        public String QueryDescription { get; set; }

        public String IsPrintEnabled { get; set; }
    }
}
