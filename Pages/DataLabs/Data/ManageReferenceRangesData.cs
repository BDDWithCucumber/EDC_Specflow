using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pages.DataLabs.Data
{
    public class ManageReferenceLabGridColumnName
    {
        public String Name { get; set; }
    }

    public class ManageReferenceLabGridRowData
    {
        public String labId { get; set; }

        public String laboratoryName { get; set; }

        public String Company { get; set; }

        public String Department { get; set; }

        public String Address { get; set; }

        public String City { get; set; }

        public String State { get; set; }

        public String Country { get; set; }

        public String Lab_Status { get; set; }

    }

    public class ReferenceRangeLeftActionPalette
    {
        public String ActionPaletteItems { get; set; }
    }


}
