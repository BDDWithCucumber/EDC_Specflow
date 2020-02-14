using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace EDC_Automation.Helpers
{
    class ReferenceRangeDataFormatter
    {
        public void FillReferenceRangeId(string columnName, Table inputTable)
        {
            foreach (TableRow row in inputTable.Rows)
            {
                String value = row[columnName];
                if (value.Contains("{") && value.Contains("}"))
                {
                    value = value.Replace("{", "");
                    value = value.Replace("}", "");
                    row[columnName] = Convert.ToString(FeatureContext.Current[value]);
                }

            }
        }
        public string FillRRID(string rrID)
        {
            if(rrID.Contains("{") && rrID.Contains("}"))
            {
                rrID = rrID.Replace("{", "");
                rrID = rrID.Replace("}", "");
                rrID = Convert.ToString(FeatureContext.Current[rrID]);
            }
            return rrID;
        }
    }
}
