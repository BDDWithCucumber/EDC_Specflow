using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using TechTalk.SpecFlow;
using Reports.DebugLog;
using System.Reflection;

namespace EDC_Automation.Helpers
{
    class DataTableUtilities
    {
        public static DataTable ConvertTableToDataTable(Table table)
        {
            var dataTable = new DataTable();
            foreach (var header in table.Header)
            {
                dataTable.Columns.Add(header, typeof(string));
            }
            foreach(var row in table.Rows)
            {
                var newRow = dataTable.NewRow();
                foreach(var header in table.Header)
                {
                    newRow.SetField(header, row[header]);
                }
                dataTable.Rows.Add(newRow);
            }
            return dataTable;
        }

        public static bool CompareTwoDataTables(DataTable Table1, DataTable Table2)
        {
            //return Table1.Equals(Table2);
            bool tablesMatch = true;
            try
            {
                if ((Table1.Columns.Count!=Table2.Columns.Count)||(Table1.Rows.Count!=Table2.Rows.Count))
                {
                    tablesMatch = false;
                }
                else
                {
                    for (int Columnindex = 0; Columnindex <= Table1.Columns.Count - 1; Columnindex++)
                    {
                        for (int Rowindex = 0; Rowindex <= Table1.Rows.Count - 1; Rowindex++)
                        {
                            if (!Table1.Rows[Rowindex][Table1.Columns[Columnindex]].Equals(Table2.Rows[Rowindex][Table2.Columns[Columnindex]]))
                            {
                                tablesMatch = false;
                            }
                        }
                    }
                }
                    
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return tablesMatch;
        }
        public static bool BlankValuesVerificationInResultSet(DataTable Table1)
        {
            try
            {
                for (int Columnindex = 0; Columnindex <= Table1.Columns.Count - 1; Columnindex++)
                {
                    for (int Rowindex = 0; Rowindex <= Table1.Rows.Count - 1; Rowindex++)
                    {
                        if (!Table1.Rows[Rowindex][Table1.Columns[Columnindex]].Equals(string.Empty))
                        {
                            return false;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }
        public static bool FieldNotFound(DataTable Table1, string fieldToVerify)
        {
            try
            {
                for (int Columnindex = 0; Columnindex <= Table1.Columns.Count - 1; Columnindex++)
                {
                    for (int Rowindex = 0; Rowindex <= Table1.Rows.Count - 1; Rowindex++)
                    {
                        if (Table1.Rows[Rowindex][Table1.Columns[Columnindex]].Equals(fieldToVerify))
                        {
                            return false;
                        }
                    }
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }
    }
}
