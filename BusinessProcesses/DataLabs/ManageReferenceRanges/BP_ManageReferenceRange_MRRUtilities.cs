using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Labs;
using BusinessProcesses.DataLabs.Pager;
using BusinessProcesses.DataLabs.Sites;
using Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.DataLabs.Common;
using Pages.DataLabs.Data;
using Pages.DataLabs.Labs;
using Pages.DataLabs.ManageReferenceRanges;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_ManageReferenceRange_MRRUtilities
    {

        public static bool VerifyText(String Message)
        {
            try
            {
                IControl mRRPage = DL_Lab_ManageReferenceRanges.ManageReferenceRanges;
                String mRR_PageName = Control_PropertyUtilities.GetText(mRRPage);
                return Message.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyHeader(String labId, String laboratoryName, String company, String department)
        {
            try
            {
                string str = laboratoryName + "(" + labId + ")," + company + "," + department;
                IControl testname = DL_Lab_ManageReferenceRanges.LabTest_Name;
                String mRR_PageName = Control_PropertyUtilities.GetText(testname);
                return str.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }     

        public static bool VerifyLabAddress(String address, String city, String state, String country)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, address, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, city, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, state, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, country, TableColumnContentType.Text));

                IControl labAddressRow = WebTableUtilities.Table_FindRow(DL_Lab_ManageReferenceRanges.LabsTable, list, 0);
                IControl cellText = WebTableUtilities.GetCell(labAddressRow, 0);
                String mRR_PageName = Control_PropertyUtilities.GetText(cellText);

                if ((address.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase)) & (city.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase)) & (state.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase)) & (country.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase)))
                {
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

            //try
            //{
            //    string str = "Address: " + address + "City: " + city + "State: " + state + "Country: " + country;
            //    IControl testname = DL_Lab_ManageReferenceRanges.LabTestAddress;
            //    String mRR_PageName = Control_PropertyUtilities.GetText(testname);
            //    return str.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase);
            //}
            //catch (Exception e)
            //{
            //    new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            //}
            //return false;
        }

        public static bool AreColumnsAvailable(List<ManageReferenceLabGridColumnName> columns)
        {
            try
            {
                foreach (ManageReferenceLabGridColumnName gridColumnName in columns)
                {
                    IControl columnNameLink = WebTableUtilities.GetColumnHeader(DL_LabManagementPage.LabsGridTitleRow, gridColumnName.Name, TableColumnContentType.Link);
                    if (Control_PropertyUtilities.IsControlNull(columnNameLink))
                    {
                        return false;
                    }
                }
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static IControl GetLabRow(String labId)
        {
            ReadOnlyCollection<IControl> rows = null;
            if (WebTableUtilities.GetRowCount(DL_Lab_ManageReferenceRanges.LabsTable, out rows) > 0)
            {
                return FindLabRow(labId);
            }
            return null;
        }

        static IControl FindLabRow(String labId)
        {
            BP_PagerUtilities.NavigateToFirstPage(DL_Lab_ManageReferenceRanges.Pager);
            do
            {
                IControl labRow = FindRow(labId);
                if (labRow != null)
                {
                    return labRow;
                }
            }
            while (BP_PagerUtilities.NavigateToNextPage(DL_Lab_ManageReferenceRanges.Pager));

            return null;
        }

        static IControl FindRow(String labId)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, labId, TableColumnContentType.Link));
            IControl labRow = WebTableUtilities.Table_FindRow(DL_Lab_ManageReferenceRanges.LabsTable, searchList);
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

        public static IControl GetLabTestRow(String labId)
        {
            ReadOnlyCollection<IControl> rows = null;
            if (WebTableUtilities.GetRowCount(DL_Lab_ManageReferenceRanges.LabsTestTable, out rows) > 0)
            {
                return FindLabTestRow(labId);
            }
            return null;
        }

        static IControl FindLabTestRow(String labId)
        {
            BP_PagerUtilities.NavigateToFirstPage(DL_Lab_ManageReferenceRanges.PageNav);
            do
            {
                IControl labRow = FindTestRow(labId);
                if (labRow != null)
                {
                    return labRow;
                }
            }
            while (BP_PagerUtilities.NavigateToNextPage(DL_Lab_ManageReferenceRanges.PageNav));

            return null;
        }

        static IControl FindTestRow(String labId)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, labId, TableColumnContentType.Link));
            IControl labRow = WebTableUtilities.Table_FindRow(DL_Lab_ManageReferenceRanges.LabsTestTable, searchList);
            if (labRow != null)
            {
                return labRow;
            }
            return null;
        }

        public static IControl GetLabTestLink(String labId)
        {
            IControl labRow = GetLabTestRow(labId);
            if (labRow != null)
            {
                return WebTableUtilities.GetElement(labRow, labId, 0, TableColumnContentType.Link);
            }
            return null;
        }

        public static bool IsDataFiltered(String columnName, String filterText, String filterCriteria)
        {
            return StringComparisonUtilities.IsFilterCriteriaMatched(GetValuesInColumn(columnName), filterText, filterCriteria);
        }

        static List<String> GetValuesInLabTestsColumn(String columnName)
        {
            List<String> valueList = new List<String>();
            int colIndex = GetLabTestsColumnIndex(columnName);
            if (colIndex > -1)
            {
                BP_PagerUtilities.NavigateToFirstPage(DL_Lab_ManageReferenceRanges.PageNav);
                do
                {
                    valueList.AddRange(WebTableUtilities.GetValuesInColumn(DL_Lab_ManageReferenceRanges.LabsTestTable, colIndex));
                }
                while (BP_PagerUtilities.NavigateToNextPage(DL_Lab_ManageReferenceRanges.PageNav));
            }
            return valueList;
        }

        static List<String> GetValuesInColumn(String columnName)
        {
            List<String> valueList = new List<String>();
            int colIndex = GetColumnIndex(columnName);
            if (colIndex > -1)
            {
                BP_PagerUtilities.NavigateToFirstPage(DL_Lab_ManageReferenceRanges.PageNav);
                do
                {
                    valueList.AddRange(WebTableUtilities.GetValuesInColumn(DL_Lab_ManageReferenceRanges.LabsTable, colIndex));
                }
                while (BP_PagerUtilities.NavigateToNextPage(DL_Lab_ManageReferenceRanges.PageNav));
            }
            return valueList;
        }

        public static bool OpenLabTest(String labId)
        {
            IControl labLink = GetLabTestLink(labId);
            if (labLink != null)
            {
                return Control_ActionUtilities.Click(labLink, String.Empty);
            }
            return false;
        }

        public static bool SetSearchText_ReferenceRanges(String searchText)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Lab_ManageReferenceRanges.ReferenceRanges_Searchbox, searchText, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifySearchedItems_ReferenceRanges(String searchText)
        {
            try
            {
             return BP_Site_AssociateLabsUtilities.VerifySearchedItems(DL_Lab_ManageReferenceRanges.ReferenceRangesListBox, searchText);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        //public static bool ApplyFilter(String columnName, String filterText, String filterCriteria)
        //{
        //    try
        //    {
                //IControl filterTextbox = WebTableUtilities.GetFilterTextbox(DL_Lab_ManageReferenceRanges.LabsGridFilterRow, GetColumnIndex(columnName));
        //        Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);

        //        IControl filterCriteriaIcon = WebTableUtilities.GetFilterCriteriaIcon(DL_Lab_ManageReferenceRanges.LabsGridFilterRow, GetColumnIndex(columnName));
        //        Control_ActionUtilities.Click(filterCriteriaIcon, String.Empty);

        //        IControl filterCriteriaItem = DL_CommonObjects.GetActiveFilterItem(filterCriteria);
        //        Control_ActionUtilities.Click(filterCriteriaItem, String.Empty);
        //    }
        //    catch (Exception e)
        //    {
        //        new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
        //        return false;
        //    }
        //    return true;
        //}

        public static bool ApplyFilter(String columnName, string filterText, String filterCriteria)
        {
            try
            {
                IControl filterIcon = BP_ManageReferenceRange_MRRUtilities.GetColumnFilterLink(columnName);
                bool isFilterIconClicked = Control_ActionUtilities.Click(filterIcon, String.Empty);
                bool isDropdownClicked = Control_ActionUtilities.Click(DL_Lab_MRR_Table.FilterDropDownIcon, String.Empty);
                IControl filterCriteriaItem = BP_ManageReferenceRange_MRRUtilities.GetActiveFilterItem(filterCriteria);
                bool isFilterCriteriaClicked = Control_ActionUtilities.Click(filterCriteriaItem, String.Empty);
                IControl filterTextbox;
                //if (columnName.Equals("Lab ID") || columnName.Equals("Lab Status") || columnName.Equals("Company"))
                //{
                    filterTextbox = DL_Lab_ManageReferenceRanges.FilterTextBox;
                    Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);
                    IControl filterButton = DL_Lab_MRR_Table.FilterButton;
                    Control_ActionUtilities.Click(filterButton, String.Empty);
                //}
                //else if (columnName.Equals("Gender"))
                //{
                //    filterTextbox = DL_Lab_MRR_Table.FilterTextBox;
                //    Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);
                //    IControl filterButton = DL_Lab_MRR_Table.FilterButton;
                //    Control_ActionUtilities.Click(filterButton, String.Empty);
                //}
                //else if (columnName.Equals("Start Date") || columnName.Equals("End Date"))
                //{
                //    filterTextbox = DL_Lab_MRR_Table_Changes.FilterTextBoxForDateInputFieldInMRRTable;
                //    Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);
                //    IControl filterButton = DL_Lab_MRR_Table.FilterButton;
                //    Control_ActionUtilities.Click(filterButton, String.Empty);
                //}
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static IControl GetActiveFilterItem(String filterCriteria)
        {
            ReadOnlyCollection<IControl> filterOptions = GetDropdownItems();
            if (filterCriteria.Equals("Is equal to"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[0]))
                {
                    return filterOptions[0];
                }
            }
            else if (filterCriteria.Equals("Is not equal to"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[1]))
                {
                    return filterOptions[1];
                }

            }
            else if (filterCriteria.Equals("Starts with"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[2]))
                {
                    return filterOptions[2];
                }
            }
            else if (filterCriteria.Equals("Contains"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[3]))
                {
                    return filterOptions[3];
                }
            }
            else if (filterCriteria.Equals("Does not contain"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[4]))
                {
                    return filterOptions[4];
                }
            }
            else if (filterCriteria.Equals("Ends with"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[5]))
                {
                    return filterOptions[5];
                }
            }
            return null;
        }

        public static ReadOnlyCollection<IControl> GetDropdownItems()
        {
            String dropdonwItemsHostCSSSelector = ".k-animation-container ul";
            IControl host = SyncUtilities.FindVisibleElement(By.CssSelector(dropdonwItemsHostCSSSelector));
            if (!Control_PropertyUtilities.IsControlNull(host))
            {
                return SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.TagName("li"));
            }
            return null;
        }

        public static IControl GetColumnFilterLink(String columnName)
        {
            if (!String.IsNullOrEmpty(columnName))
            {
                IControl headerCell = GetFilterCell(DL_Lab_ManageReferenceRanges.LabsTestGridTitleRow, GetColumnIndex(columnName));
                if (!Control_PropertyUtilities.IsControlNull(headerCell))
                {
                    IControl filterIcon = SyncUtilities.FindVisibleElement_Parent(headerCell.WebElement, By.ClassName("k-grid-filter"));
                    return filterIcon;
                }
            }
            return null;
        }

        static IControl GetFilterCell(IControl filterRow, int columnIndex)
        {
            if (filterRow != null && filterRow.WebElement != null)
            {
                System.Collections.ObjectModel.ReadOnlyCollection<IControl> filterCellList = SyncUtilities.FindElements_Parent(filterRow.WebElement, By.TagName("th"));
                if (columnIndex < filterCellList.Count)
                {
                    return filterCellList[columnIndex];
                }
            }
            return null;
        }

        public static bool ApplyFilterWithInvalidData(string columnName, string columnData, string filterCriteria)
        {
            try
            {

                IControl filterTextbox = WebTableUtilities.GetFilterTextbox(DL_Lab_ManageReferenceRanges.LabsGridFilterRow, GetColumnIndex(columnName));
                Control_ActionUtilities.Textbox_SetText(filterTextbox, columnData, String.Empty);

                IControl filterCriteriaIcon = WebTableUtilities.GetFilterCriteriaIcon(DL_Lab_ManageReferenceRanges.LabsGridFilterRow, GetColumnIndex(columnName));
                Control_ActionUtilities.Click(filterCriteriaIcon, String.Empty);

                IControl filterCriteriaItem = DL_CommonObjects.GetActiveFilterItem(filterCriteria);
                Control_ActionUtilities.Click(filterCriteriaItem, String.Empty);

                IControl filterTextbox1 = WebTableUtilities.GetFilterTextbox(DL_Lab_ManageReferenceRanges.LabsGridFilterRow, GetColumnIndex(columnName));
                Control_ActionUtilities.Textbox_SetText(filterTextbox1, columnData, String.Empty);

                IControl filterCriteriaIcon1 = WebTableUtilities.GetFilterCriteriaIcon(DL_Lab_ManageReferenceRanges.LabsGridFilterRow, GetColumnIndex(columnName));
                Control_ActionUtilities.Click(filterCriteriaIcon1, String.Empty);

                IControl filterCriteriaItem1 = DL_CommonObjects.GetActiveFilterItem(filterCriteria);
                Control_ActionUtilities.Click(filterCriteriaItem1, String.Empty);

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
                IControl filterIcon = BP_ManageReferenceRange_MRRUtilities.GetColumnFilterLink(columnName);
                Control_ActionUtilities.Click(filterIcon, String.Empty);

                IControl clearIcon = DL_Lab_MRR_Table_Changes.ClearButton;
                Control_ActionUtilities.Click(clearIcon, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        //public static bool ClearFilter(String columnName)
        //{
        //    try
        //    {
        //        IControl filterClearButton = WebTableUtilities.GetClearFilterButton(DL_Lab_ManageReferenceRanges.LabsGridFilterRow, GetColumnIndex(columnName));
        //        Control_ActionUtilities.Click(filterClearButton, String.Empty);
        //    }
        //    catch (Exception e)
        //    {
        //        new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
        //        return false;
        //    }
        //    return true;
        //}

        public static bool IsDataFilteredForAge(String columnName, String filterText, String filterCriteria)
        {
            return IsFilterCriteriaMatchedInMRRTableGridForAge(DL_Lab_MRR_Table.GetValuesInColumn(columnName), filterText, filterCriteria);
        }

        public static bool IsFilterCriteriaMatchedInMRRTableGridForAge(List<String> valueList, String filterText, String filterCriteria)
        {
            switch (filterCriteria)
            {

                case "Equal to": return IsFilterCriteriaMatched_EqualTo(valueList, filterText);
                case "Is greater than or equal to": return IsFilterCriteriaMatched_GreterThanAndEqualTo(valueList, filterText);
                case "Is greater than": return IsFilterCriteriaMatched_GreterThan(valueList, filterText);
                case "Is after or equal to": return IsFilterCriteriaMatched_IsAfterorEqualTo(valueList, filterText);
                case "Is after": return IsFilterCriteriaMatched_IsAfter(valueList, filterText);
                case "Is before or equal to": return IsFilterCriteriaMatched_IsBeforeorEqualTo(valueList, filterText);
                case "Is before": return IsFilterCriteriaMatched_IsBefore(valueList, filterText);
                default:
                    return false;
            }

        }

        public static bool IsFilterCriteriaMatched_EqualTo(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!value.Contains(filterText))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_GreterThanAndEqualTo(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!(int.Parse(value) >= int.Parse(filterText)))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_IsAfterorEqualTo(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!(DateTime.Parse(value) >= DateTime.Parse(filterText)))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_IsAfter(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!(DateTime.Parse(value) > DateTime.Parse(filterText)))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_IsBeforeorEqualTo(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!(DateTime.Parse(value) <= DateTime.Parse(filterText)))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_IsBefore(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!(DateTime.Parse(value) < DateTime.Parse(filterText)))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_GreterThan(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!(int.Parse(value) > int.Parse(filterText)))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_LessThanAndEqualTo(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!(int.Parse(value) <= int.Parse(filterText)))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_LessThan(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!(int.Parse(value) < int.Parse(filterText)))
                {
                    return false;
                }
            }
            return true;
        }

        public static bool IsLabsTestDataFiltered(String columnName, String filterText, String filterCriteria)
        {
            return StringComparisonUtilities.IsFilterCriteriaMatched(GetValuesInLabTestsColumn(columnName), filterText, filterCriteria);
        }

        public static bool ApplyLabsTestFilter(String columnName, String filterText, String filterCriteria)
        {
            try
            {
                IControl filterTextbox = WebTableUtilities.GetFilterTextbox(DL_Lab_ManageReferenceRanges.LabsTestGridFilterRow, GetLabTestsColumnIndex(columnName));
                Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);

                IControl filterCriteriaIcon = WebTableUtilities.GetFilterCriteriaIcon(DL_Lab_ManageReferenceRanges.LabsTestGridFilterRow, GetLabTestsColumnIndex(columnName));
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

        public static bool ClearLabsTestFilter(String columnName)
        {
            try
            {
                IControl filterClearButton = WebTableUtilities.GetClearFilterButton(DL_Lab_ManageReferenceRanges.LabsTestGridFilterRow, GetLabTestsColumnIndex(columnName));
                Control_ActionUtilities.Click(filterClearButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool ClickOnColumnHeader(String columnName)
        {
            IControl columnNameLink = WebTableUtilities.GetColumnHeader(DL_Lab_ManageReferenceRanges.LabsGridTitleRow, columnName, TableColumnContentType.Link);
            if (columnNameLink != null)
            {
                return Control_ActionUtilities.Click(columnNameLink, String.Empty);
            }
            return false;
        }

        public static bool ClickOnLabsTestColumnHeader(String columnName)
        {
            IControl columnNameLink = WebTableUtilities.GetColumnHeader(DL_Lab_ManageReferenceRanges.LabsTestGridTitleRow, columnName, TableColumnContentType.Link);
            if (columnNameLink != null)
            {
                return Control_ActionUtilities.Click(columnNameLink, String.Empty);
            }
            return false;
        }        

        public static bool IsLabsTestsDataInSortOrder(String sortOrder, String columnName)
        {
            try
            {
                List<String> valueList = GetValuesInLabTestsColumn(columnName);
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

        static List<String> GetCopyList(List<String> valueList)
        {
            List<String> list = new List<string>();
            foreach (String item in valueList)
            {
                list.Add(item);
            }
            return list;
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

        public static bool EnterValueInSearchField(string Search_Field, string SearchText)
        {
            try
            {
                IControl SearchFld = DL_Lab_ManageReferenceRanges_Actions.Search_Field;
                return Control_ActionUtilities.Textbox_SetText(SearchFld, SearchText, "Unable to enter search criteria '" + SearchText + "' in the '" + Search_Field + "' field.");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsActionPaletteLinkAvailable(List<ReferenceRangeLeftActionPalette> columns, String actionPalette)
        {
            Boolean LinkAvailable = false;
            try
            {
                IControl actionPalette_Group = GetExpandedActionPaletteGroup(actionPalette);
                foreach (ReferenceRangeLeftActionPalette gridColumnName in columns)
                {
                    if(DL_ActionPalette.IsActionPaletteLinkAvailable(actionPalette_Group, gridColumnName.ActionPaletteItems))
                    {
                        LinkAvailable = true; 
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return LinkAvailable;
        }

       
        public static IControl GetExpandedActionPaletteGroup(String actionPalette)
        {
            IControl actionPalette_Group = DL_ActionPalette.ActionPalette_GetActionsHost(actionPalette);
            if (!DL_ActionPalette.IsActionPalettteExpanded(actionPalette_Group))
            {
                IControl expandCollapseImage = DL_ActionPalette.ActionPalette_GetExpandCollapseImage(actionPalette_Group);
                Control_ActionUtilities.Click(expandCollapseImage, "Unable to expand ActionPalette group");
            }
            return actionPalette_Group;
        }

        public static bool IsLeftActionPaletteLinkAvailable(List<ReferenceRangeLeftActionPalette> columns)
        {
            Boolean PaletteLinkAvailable = false;
            try
            {
                IControl actionPalette_Group = DL_ActionPalette.ActionPalette_GetLeftActionPalette();
                
                foreach (ReferenceRangeLeftActionPalette gridColumnName in columns)
                {
                    if (DL_ActionPalette.IsLinkAvailableInLeftPalette(actionPalette_Group, gridColumnName.ActionPaletteItems))
                    {
                        PaletteLinkAvailable = true;
                    }
                    else
                    {
                        return false;
                    }
                }
             }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return PaletteLinkAvailable;
        }

        public static bool IsNoRecordsMessageExistInSitesTable()
        {
            IControl c = DL_Lab_ManageReferenceRanges.NoRecordsToDisplayDiv;
            return c != null && !Control_PropertyUtilities.IsControlNull(c);
        }

        public static bool ClickBreadCrumbItem(String breadCrumbItemText)
        {
            IControl breadCrumbContainer = DL_CommonObjects.BreadCrumbContainer;
            IControl breadCrumbItem = BP_BreadCrumbUtilities.GetClickableBreadCrumbItem(breadCrumbContainer, breadCrumbItemText);
            if (!Control_PropertyUtilities.IsControlNull(breadCrumbItem))
            {
                return Control_ActionUtilities.Click(breadCrumbItem, "Unable to click breadCrumbItem " + breadCrumbItemText);
            }
            return false;
        }

        public static bool OpenLab(ManageReferenceLabGridRowData labGridRowData)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, labGridRowData.labId, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, labGridRowData.laboratoryName, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(2, labGridRowData.Company, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(3, labGridRowData.Department, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(4, labGridRowData.Address, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(5, labGridRowData.City, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(6, labGridRowData.State, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(7, labGridRowData.Country, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(8, labGridRowData.Lab_Status, TableColumnContentType.Text));
                IControl labRow = WebTableUtilities.Table_FindRow(DL_Lab_ManageReferenceRanges.LabsTable, list);
                if (labRow != null)
                {
                    IControl labIdLink = WebTableUtilities.GetElement(labRow, labGridRowData.labId, 0, TableColumnContentType.Link);
                    return Control_ActionUtilities.Click(labIdLink, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsLabExistInLabsTableOfMRR(LabData labData)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, labData.LabId, TableColumnContentType.Text));
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, labData.LaboratoryName, TableColumnContentType.Text));
                IControl siteRow = WebTableUtilities.Table_FindRow(DL_Lab_ManageReferenceRanges.LabsTable, list, 1);
                if (siteRow == null)
                {
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static int GetColumnIndex(String columnName)
        {
            switch (columnName)
            {
                case "Lab ID": return 0;
                case "Laboratory Name": return 1;
                case "Company": return 2;
                case "Department": return 3;
                case "Address": return 4;
                case "City/Town": return 5;
                case "State/Province": return 6;
                case "Country": return 7;
                case "Lab Status": return 8;
            }
            return -1;
        }

        static int GetLabTestsColumnIndex(String columnName)
        {
            switch (columnName)
            {
                case "Lab Test (Name)": return 0;
                case "Category": return 1;
                case "Subcategory": return 2;
                case "Speciman": return 3;
                case "Method": return 4;
                case "LOINC": return 5;
            }
            return -1;
        }
    }
}
