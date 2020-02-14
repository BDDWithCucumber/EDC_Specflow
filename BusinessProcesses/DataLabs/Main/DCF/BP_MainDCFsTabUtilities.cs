using System;
using System.Collections.Generic;
using Pages.DataLabs.Data;
using Pages.DataLabs.Main.DCF;
using Interfaces;
using Framework;
using Common.WebTable;
using Framework.Actions;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Main.DCF
{
    public class BP_MainDCFsTabUtilities
    {
        public static bool VerifyDCFs_SearchResult(List<MainDCFsTab_SearchData> dataList)
        {
            try
            {
                foreach (MainDCFsTab_SearchData data in dataList)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    if (!String.IsNullOrEmpty(data.PatientID))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(0, data.PatientID, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.DCFID))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.DCFID, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.Status))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(2, data.Status, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.QueryDescription))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.QueryDescription, TableColumnContentType.Text));
                    }

                    IControl dcfsTable = DL_DCF_SearchResultsPage.DCFSearchResultsTable;
                    IControl row = WebTableUtilities.Table_FindRow(dcfsTable, list, 1);
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

        public static bool OpenDCF(int dcfId)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, dcfId.ToString(), TableColumnContentType.Text));
                IControl dcfsTable = DL_DCF_SearchResultsPage.DCFSearchResultsTable;
                IControl row = WebTableUtilities.Table_FindRow(dcfsTable, list, 1);
                IControl dcfIdLink = WebTableUtilities.GetElement(row, dcfId.ToString(), 1, TableColumnContentType.Link);
                return Control_ActionUtilities.Click(dcfIdLink, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}