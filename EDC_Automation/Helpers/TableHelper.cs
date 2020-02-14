using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;

namespace EDC_Automation.Helpers
{
    class TableHelper
    {
        public static List<String> GetValuesFromColumn(Table table, int colIndex)
        {
            List<String> valueList = new List<String>();
            foreach (TableRow row in table.Rows)
            {
                if (row.Values.Count > colIndex)
                {
                    valueList.Add(row[colIndex]);
                }
            }
            return valueList;
        }
    }
}
