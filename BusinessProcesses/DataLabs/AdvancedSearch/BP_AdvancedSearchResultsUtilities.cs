using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.AdvancedSearch;
using Pages.DataLabs.Data;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace BusinessProcesses.DataLabs.AdvancedSearch
{
    public class BP_AdvancedSearchResultsUtilities
    {
        public static bool ArePatientsAvailable(IEnumerable<PatientTableData> patients)
        {
            try
            {
                IControl patientsTable = DL_AdvancedSearchResultsPage.PatientsTable;
                foreach (PatientTableData patient in patients)
                {
                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, patient.PatientID, TableColumnContentType.Text));
                    IControl row = WebTableUtilities.Table_FindRow(patientsTable, searchList, 1);
                    if (Control_PropertyUtilities.IsControlNull(row))
                    {
                        return false;
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickCancelSearch()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_AdvancedSearchResultsPage.CancelSearchButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}