using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pages.DataLabs.Data
{
    public class GroupPermissionData
    {
        public String PermissionName { get; set; }
        public String Allow { get; set; }
        public String Deny { get; set; }
        public String Hide { get; set; }
        public String View { get; set; }
        public String Edit { get; set; }
    }
}