using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Sites;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Sites
{
    public class BP_Site_ManageVersionsUtilities
    {
        public static bool IsVersionDetailsAvailable(IEnumerable<Site_ManageVersionsData> dataList, out Site_ManageVersionsData mismatchedData)
        {
            mismatchedData = null;
            try
            {
                foreach (Site_ManageVersionsData data in dataList)
                {
                    IControl row = GetRow(data);
                    if (row == null || !IsNewPatientsValueMatched(row,data.NewPatients) || !IsDefaultValueMatched(row, data.Default))
                    {
                        mismatchedData = data;
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

        static bool IsDefaultValueMatched(IControl row, String value)
        {
            if(String.IsNullOrEmpty(value))
            {
                return true;
            }
            IControl radioButton = WebTableUtilities.GetElement(row, String.Empty, 2, TableColumnContentType.RadioButton);
            return Control_PropertyUtilities.VerifyAttributeValue(radioButton, "checked", "true");
        }

        static bool IsNewPatientsValueMatched(IControl row, String value)
        {
            if (String.IsNullOrEmpty(value))
            {
                return true;
            }
            IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Dropdown);
            return Control_ActionUtilities.Dropdown_VerifySelectedItem(dropdown, value, String.Empty);
        }

        static IControl GetRow(Site_ManageVersionsData data)
        {
            try
            {
                WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();

                if (!String.IsNullOrEmpty(data.Version))
                {
                    WebTable_SearchCriteriaItem searchItem = new WebTable_SearchCriteriaItem(0, data.Version, TableColumnContentType.Text);
                    searchList.AddSearchItem(searchItem);
                }
                if (!String.IsNullOrEmpty(data.Patients))
                {
                    WebTable_SearchCriteriaItem searchItem = new WebTable_SearchCriteriaItem(3, data.Patients, TableColumnContentType.Text);
                    searchList.AddSearchItem(searchItem);
                }
                if (!String.IsNullOrEmpty(data.PublishedDateTime))
                {
                    WebTable_SearchCriteriaItem searchItem = new WebTable_SearchCriteriaItem(4, data.PublishedDateTime, TableColumnContentType.Text_Partial);
                    searchList.AddSearchItem(searchItem);
                }
                if (!String.IsNullOrEmpty(data.Status))
                {
                    WebTable_SearchCriteriaItem searchItem = new WebTable_SearchCriteriaItem(5, data.Status, TableColumnContentType.Text);
                    searchList.AddSearchItem(searchItem);
                }
                return WebTableUtilities.Table_FindRow(DL_Site_ManageVersionsPage.VersionsTable, searchList);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }
    }
}