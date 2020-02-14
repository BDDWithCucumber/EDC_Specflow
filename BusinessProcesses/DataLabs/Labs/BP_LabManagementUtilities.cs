using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Pager;
using Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs;
using Pages.DataLabs.Data;
using Pages.DataLabs.Labs;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Pages.DataLabs.Common;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Labs
{
    public class BP_LabManagementUtilities
    {
        public static IControl GetLabRow(String labId)
        {
            ReadOnlyCollection<IControl> rows = null;
            if (WebTableUtilities.GetRowCount(DL_LabManagementPage.LabsTable, out rows) > 0)
            {
                return FindLabRow(labId);
            }
            return null;
        }

        static IControl FindLabRow(String labId)
        {
            BP_PagerUtilities.NavigateToFirstPage(DL_LabManagementPage.Pager);
            do
            {
                IControl labRow = FindRow(labId);
                if (labRow != null)
                {
                    return labRow;
                }
            }
            while (BP_PagerUtilities.NavigateToNextPage(DL_LabManagementPage.Pager));

            return null;
        }

        static IControl FindRow(String labId)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, labId, TableColumnContentType.Link));
            IControl labRow = WebTableUtilities.Table_FindRow(DL_LabManagementPage.LabsTable, searchList);
            if (labRow != null)
            {
                return labRow;
            }
            return null;
        }

        public static IControl GetLabLink(String labId)
        {
            IControl labRow = GetLabRow(labId);
            if (labRow != null)
            {
                return WebTableUtilities.GetElement(labRow, labId, 0, TableColumnContentType.Link);
            }
            return null;
        }

        public static bool OpenLab(String labId)
        {
            IControl labLink = GetLabLink(labId);
            if (labLink != null)
            {
                return Control_ActionUtilities.Click(labLink, String.Empty);
            }
            return false;
        }

        public static bool ApplyFilter(String columnName, String filterText, String filterCriteria)
        {
            try
            {
                IControl filterTextbox = WebTableUtilities.GetFilterTextbox(DL_LabManagementPage.LabsGridFilterRow, GetColumnIndex(columnName));
                Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);

                IControl filterCriteriaIcon = WebTableUtilities.GetFilterCriteriaIcon(DL_LabManagementPage.LabsGridFilterRow, GetColumnIndex(columnName));
                Control_ActionUtilities.Click(filterCriteriaIcon, String.Empty);

                IControl filterCriteriaItem = DL_CommonObjects.GetActiveFilterItem(filterCriteria);
                Control_ActionUtilities.Click(filterCriteriaItem, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool ClearFilter(String columnName)
        {
            try
            {
                IControl filterClearButton = WebTableUtilities.GetClearFilterButton(DL_LabManagementPage.LabsGridFilterRow, GetColumnIndex(columnName));
                Control_ActionUtilities.Click(filterClearButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool IsDataFiltered(String columnName, String filterText, String filterCriteria)
        {
            return StringComparisonUtilities.IsFilterCriteriaMatched(GetValuesInColumn(columnName), filterText, filterCriteria);
        }

        public static bool IsLabIdExists(string labId)
        {
            IControl c = GetLabRow(labId);
            return c != null;
        }

        public static bool AreLabsAvailableWithDetails(IEnumerable<LabData> labs, out List<LabData> mismatchedLabs)
        {
            mismatchedLabs = new List<LabData>();
            foreach (LabData lab in labs)
            {
                IControl labRow = GetLabRow(lab.LabId);
                if (labRow != null)
                {
                    return true;
                }
                else
                {
                }
            }
            return mismatchedLabs.Count == 0;
        }

        static List<String> GetValuesInColumn(String columnName)
        {
            List<String> valueList = new List<String>();
            int colIndex = GetColumnIndex(columnName);
            if (colIndex > -1)
            {
                BP_PagerUtilities.NavigateToFirstPage(DL_LabManagementPage.Pager);
                do
                {
                    valueList.AddRange(WebTableUtilities.GetValuesInColumn(DL_LabManagementPage.LabsTable, colIndex));
                }
                while (BP_PagerUtilities.NavigateToNextPage(DL_LabManagementPage.Pager));
            }
            return valueList;
        }

        public static bool IsDataInSortOrder(String sortOrder, String columnName)
        {
            try
            {
                List<String> valueList = GetValuesInColumn(columnName);
                List<String> copyValueList = GetCopyList(valueList);
                if (sortOrder.Equals("Ascending", StringComparison.InvariantCultureIgnoreCase))
                {
                    copyValueList.Sort();
                    return AreListsEqual(valueList, copyValueList);
                }
                else if (sortOrder.Equals("Descending", StringComparison.InvariantCultureIgnoreCase))
                {
                    copyValueList.Sort();
                    copyValueList.Reverse();
                    return AreListsEqual(valueList, copyValueList);
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnColumnHeader(String columnName)
        {
            IControl columnNameLink = WebTableUtilities.GetColumnHeader(DL_LabManagementPage.LabsGridTitleRow, columnName, TableColumnContentType.Link);
            if (columnNameLink != null)
            {
                return Control_ActionUtilities.Click(columnNameLink, String.Empty);
            }
            return false;
        }
        public static bool GetLabManagementLink()
        {
            return Control_ActionUtilities.Click(DL_LabManagementPage.LabManagementLink,"Lab Management Link not available");
        }
        static bool AreListsEqual(List<String> list1, List<String> list2)
        {
            if (list1.Count == list2.Count)
            {
                for (int i = 0; i < list1.Count; ++i)
                {
                    if (!String.Equals(list1[i], list2[i]))
                    {
                        return false;
                    }
                }
            }
            else
            {
                return false;
            }
            return true;
        }

        static List<String> GetCopyList(List<String> valueList)
        {
            List<String> list = new List<string>();
            foreach (String item in valueList)
            {
                list.Add(item);
            }
            return list;
        }

        static int GetColumnIndex(String columnName)
        {
            switch (columnName)
            {
                case "Lab Id": return 0;
                case "Laboratory Name": return 1;
                case "Company": return 2;
                case "Department": return 3;
                case "Address":return 4;
                case "City/Town": return 5;
                case "State/Province": return 6;
                case "Country": return 7;
                case "Lab Status": return 8;
            }
            return -1;
        }

        public static bool EditLab(String labId, LabData lab)
        {
            try
            {
                IControl labLink = BP_LabManagementUtilities.GetLabLink(labId);
                Control_ActionUtilities.Click_PerssEnterKey(labLink, String.Empty);
                return BP_LabCreationUtilities.AddLab(lab);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool AddLabs(IEnumerable<LabData> labs)
        {
            foreach (LabData lab in labs)
            {
                if (!BP_LabManagementUtilities.IsLabIdExists(lab.LabId))
                {
                    if (!BP_ActionPaletteUtilities.InvokeActionPaletteLink("Add Lab", "LabMgmt_Actions"))
                    {
                        return false;
                    }
                    if (!BP_LabCreationUtilities.AddLab(lab))
                    {
                        List<String> errorList = BP_LabCreationUtilities.GetErrorList();
                        return false;
                    }
                }
            }
            return true;
        }
        public static bool EditLab(IEnumerable<LabData> labs)
        {
            foreach (LabData lab in labs)
            {
                
                    
                    if (!BP_LabCreationUtilities.AddLab(lab))
                    {
                        List<String> errorList = BP_LabCreationUtilities.GetErrorList();
                        return false;
                    }
                
            }
            return true;
        }

        public static string NormalizationMessageNoStudy()
        {

         return   Control_PropertyUtilities.GetText(DL_LabManagementPage.Normalization_NoStudyMessage);
        }
    }
}