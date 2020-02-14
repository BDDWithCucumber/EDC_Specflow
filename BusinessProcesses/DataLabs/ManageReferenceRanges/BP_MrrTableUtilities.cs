using Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Common;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_MrrTableUtilities
    {
        public static bool AreColumnsAvailable(List<MRRTableGridColumnNames> columns)
        {
            try
            {
                foreach (MRRTableGridColumnNames gridColumnName in columns)
                {
                    IControl columnHeaderCell = WebTableUtilities.GetColumnHeader(DL_Lab_MRR_Table.MrrTableGridTitleRow, gridColumnName.Name, TableColumnContentType.Text);
                    if (Control_PropertyUtilities.IsControlNull(columnHeaderCell))
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

        public static bool AreColumnsAvailableInSubHeadingForNormalRange(List<MRRTableGridColumnNames> columns)
        {
            try
            {
                foreach (MRRTableGridColumnNames gridColumnName in columns)
                {
                    IControl columnNameLink = WebTableUtilities.GetColumnHeader(DL_Lab_MRR_Table.MrrTableGridSubHeadings, gridColumnName.Name, TableColumnContentType.Text, 1);
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

        public static bool AreColumnsAvailableInSubHeadingForCriticalRange(List<MRRTableGridColumnNames> columns)
        {
            try
            {
                foreach (MRRTableGridColumnNames gridColumnName in columns)
                {
                    IControl columnNameLink = WebTableUtilities.GetColumnHeader(DL_Lab_MRR_Table.MrrTableGridSubHeadings, gridColumnName.Name, TableColumnContentType.Text, 2);
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

        public static bool ClickOnColumnHeader(String columnName)
        {
            //IControl columnNameLink = WebTableUtilities.GetColumnHeader(DL_Lab_MRR_Table.MrrTableGridTitleRow, columnName, TableColumnContentType.Link);
            IControl columnNameLink = DL_Lab_MRR_Table.GetColumnHeaderTitle_FirstRow(columnName);
            if (columnNameLink != null)
            {
                return Control_ActionUtilities.Click(columnNameLink, String.Empty);
            }
            return false;
        }

        public static bool CheckboxVerticationInMRRTableColumnHeader()
        {
            try
            {
                IControl checkboxInColumnHeader = DL_Lab_MRR_Table.CheckboxInMrrTableColumnHeader;
                if (Control_PropertyUtilities.IsControlNull(checkboxInColumnHeader))
                    {
                        return false;
                    }
                
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        

        public static bool ClickOnColumnHeader(String columnName, int occurence)
        {
            IControl columnNameLink = WebTableUtilities.GetColumnHeader(DL_Lab_MRR_Table.MrrTableGridTitleSubHeading, columnName, TableColumnContentType.Text, occurence);
            if (columnNameLink != null)
            {
                return Control_ActionUtilities.Click(columnNameLink, String.Empty);
            }
            return false;
        }
        public static bool IsDataInSortOrder(String sortOrder, String columnName)
        {
            try
            {
                List<String> valueList = DL_Lab_MRR_Table.GetValuesInColumn(columnName);
                List<int> fromAgeNumbersListOnly = new List<int>();
                foreach (var v in valueList)
                {
                    var splittedValues = v.Split(new char[] { ' ' });
                    if(splittedValues.Length == 2)
                    {
                        fromAgeNumbersListOnly.Add(int.Parse(splittedValues[0]));
                    }
                    else if (splittedValues.Length == 3)
                    {
                        fromAgeNumbersListOnly.Add(int.Parse(splittedValues[1]));
                    }
                }               

                //List<String> copyValueList = GetCopyList(valueList);
                //copyValueList.ToArray();
                var originalList = fromAgeNumbersListOnly.Select(p => p).ToList();
                fromAgeNumbersListOnly.Sort();

               // string[] s = copyValueList.ToArray();
                
                if (sortOrder.Equals("Ascending", StringComparison.InvariantCultureIgnoreCase))
                {                   
                    //return AreListsEqual(valueList, copyValueList);
                    return originalList.SequenceEqual(fromAgeNumbersListOnly);
                    //return AreListsEqual(originalList, fromAgeNumbersListOnly);
                }
                else if (sortOrder.Equals("Descending", StringComparison.InvariantCultureIgnoreCase))
                {
                    fromAgeNumbersListOnly.Reverse();
                    return originalList.SequenceEqual(fromAgeNumbersListOnly);
                    //copyValueList.Sort();
                    //copyValueList.Reverse();
                    //return AreListsEqual(valueList, copyValueList);
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

        public static bool IsDataInSortOrderFor(String sortOrder, String columnName)
        {
            try
            {
                List<String> valueList = DL_Lab_MRR_Table.GetValuesInColumn(columnName);               

                List<String> copyValueList = GetCopyList(valueList);
                copyValueList.Sort();
                if (sortOrder.Equals("Ascending", StringComparison.InvariantCultureIgnoreCase))
                {
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

        public static bool IsDataInSortOrder(String sortOrder, String columnName, String range)
        {
            try
            {
                List<String> valueList = DL_Lab_MRR_Table.GetValuesInColumn(columnName, range);
                List<int> fromAgeNumbersListOnly = new List<int>();
                foreach (var v in valueList)
                {
                    var splittedValues = v.Split(new char[] { ' ' });
                    if (splittedValues.Length == 2)
                    {
                        fromAgeNumbersListOnly.Add(int.Parse(splittedValues[1]));
                    }
                    else if (splittedValues.Length == 3)
                    {
                        fromAgeNumbersListOnly.Add(int.Parse(splittedValues[1]));
                    }
                    else if(splittedValues.Length == 1)
                    {
                        fromAgeNumbersListOnly.Add(int.Parse(splittedValues[0]));
                    }
                }
                var originalList = fromAgeNumbersListOnly.Select(p => p).ToList();
                fromAgeNumbersListOnly.Sort();
                //List<String> copyValueList = GetCopyList(valueList);
                //List <String> list = new List<String>();
                ////var sorted = from element in copyValueList
                ////             orderby element
                ////             select element;
                //List<int> rangeValues = new List<int>();
                //foreach (String s1 in copyValueList)
                //{
                //    var sorted = from element in copyValueList
                //                 orderby element
                //                 select element;
                //    //list.Add(sorted);
                //    var var1 = copyValueList.OrderByDescending(s2 => int.Parse(s1.Split('>')[0])).ToList();
                //}

                ////foreach (var element in sorted)
                ////{
                ////    Console.WriteLine(element);
                ////}
                //foreach (String s1 in copyValueList)
                //{
                //    rangeValues.Add(int.Parse(s1));

                //}             
                if (sortOrder.Equals("Ascending", StringComparison.InvariantCultureIgnoreCase))
                {
                    //List<String> list1 = valueList.OrderByDescending(c => c).ToList();
                    //List<String> addTheCharacters = new List<String>();
                    //rangeValues.Sort();
                    //if(columnName.Equals("Low"))
                    //{
                    //    foreach(int i1 in rangeValues)
                    //    {
                    //        addTheCharacters.Add("> " + i1);
                    //    }
                    //}
                    //else if (columnName.Equals("High"))
                    //{
                    //    foreach (int i1 in rangeValues)
                    //    {
                    //        addTheCharacters.Add("< " + i1);
                    //    }
                    //}
                    //return AreListsEqual(valueList, addTheCharacters);
                    return originalList.SequenceEqual(fromAgeNumbersListOnly);
                }
                else if (sortOrder.Equals("Descending", StringComparison.InvariantCultureIgnoreCase))
                {
                    fromAgeNumbersListOnly.Reverse();
                    return originalList.SequenceEqual(fromAgeNumbersListOnly);
                    //copyValueList.Sort();
                    //copyValueList.Reverse();
                    //List<String> addTheCharacters = new List<String>();
                    //if (range.Equals("Low"))
                    //{
                    //    foreach (int i1 in rangeValues)
                    //    {
                    //        addTheCharacters.Add("> " + i1);
                    //    }
                    //}
                    //else if (range.Equals("High"))
                    //{
                    //    foreach (int i1 in rangeValues)
                    //    {
                    //        addTheCharacters.Add("< " + i1);
                    //    }
                    //}
                    //return AreListsEqual(valueList, copyValueList);
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

        public static bool IsDateDataInSortOrder(String sortOrder, String columnName)
        {
            try
            {
                List<String> valueList = DL_Lab_MRR_Table.GetValuesInColumn(columnName);
                List<DateTime> datesFromApp = GetCopyListofDateValues(valueList);
                List<DateTime> copyValueList = GetCopyListofDateValues(valueList);
                if (sortOrder.Equals("Ascending", StringComparison.InvariantCultureIgnoreCase))
                {                   
                    List<DateTime> sortedDates= copyValueList.OrderByDescending(c => c).ToList();                   
                    return AreListsDatesEqual(datesFromApp, sortedDates);                   
                }
                else if (sortOrder.Equals("Descending", StringComparison.InvariantCultureIgnoreCase))
                {
                    List<DateTime> sortedDates = copyValueList.OrderByDescending(c => c).ToList();
                    sortedDates.Reverse();
                    return AreListsDatesEqual(datesFromApp, sortedDates);
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
        static List<String> GetCopyList(List<String> valueList1)
        {
            List<String> list = new List<string>();

            foreach (String item in valueList1)
            {
               // string value = item.Replace("< ","");
                list.Add(item);
            }
            return list;
        }        
        static List<DateTime> GetCopyListofDateValues(List<String> valueList1)
        {
            List<DateTime> dates = new List<DateTime>();
            foreach (String s1 in valueList1)
            {
                DateTime oDate = DateTime.Parse(s1);
                dates.Add(oDate);
            }
            return dates;
        }

        static List<int> GetCopyListofint(List<int> valueList1)
        {
            List<int> list = new List<int>();

            foreach (int item in valueList1)
            {
                //string value = item.Replace("< ", "");
                list.Add(item);
            }
            return list;
        }

        static List<String> RemoveCharacters(List<String> valueList)
        {
            List<String> list = new List<String>();
            foreach (String item in valueList)
            {
                if(item.Contains("<"))
                    {
                    string value = item.Replace("< ", "");
                    list.Add(value);
                    }
                else if(item.Contains(">"))
                {
                    string value = item.Replace("> ", "");
                    list.Add(value);
                }                
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

        static bool AreListsDatesEqual(List<DateTime> list1, List<DateTime> list2)
        {
            if (list1.Count == list2.Count)
            {
                for (int i = 0; i < list1.Count; ++i)
                {
                    int result = DateTime.Compare(list1[i], list2[i]);
                    if(result==0)
                    {
                        return true;
                    }
                }
            }
            else
            {
                return false;
            }
            return true;
        }

        static bool AreIntListsEqual(List<int> list1, List<int> list2)
        {
            if (list1.Count == list2.Count)
            {
                for (int i = 0; i < list1.Count; ++i)
                {
                    if (!(list1[i]==list2[i]))
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



        static int GetColumnIndex(String columnName, String range)
        {
            if(range.Equals("Normal Range"))
            {
                switch (columnName)
                {
                    case "Low": return 7;
                    case "High": return 8;                    
                }
            }
            else if(range.Equals("Critical Range"))
            {
                switch (columnName)
                {
                    case "Low": return 9;
                    case "High": return 10;
                }

            }
            
            return -1;
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

                IControl labAddressRow = WebTableUtilities.Table_FindRow(DL_Lab_MRR_Table.MrrTable, list, 0);
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
        }

        public static bool VerifyHeader(String labId, String laboratoryName, String company, String department)
        {
            try
            {
                string str = laboratoryName + "(" + labId + ")," + company + "," + department;
                IControl testname = DL_Lab_MRR_Table.LabTest_Name;
                String mRR_PageName = Control_PropertyUtilities.GetText(testname);
                return str.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyLabTestName(String labTestName)
        {
            try
            {
                string str = labTestName;
                IControl testname = DL_Lab_MRR_Table.LabTest_Name;
                String mRR_PageName = Control_PropertyUtilities.GetText(testname);
                return str.Equals(mRR_PageName, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyAddAndDeleteButtons()
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(DL_Lab_ManageReferenceRanges_Actions.Add_Button) &&
                       Control_PropertyUtilities.IsControlVisible(DL_Lab_ManageReferenceRanges_Actions.Delete_Button);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyText(String Message)
        {
            try
            {
                IControl deleteCheckboxName = DL_Lab_MRR_Table.DeleteCheckboxName;
                String MRR_Message = Control_PropertyUtilities.GetText(deleteCheckboxName);
                return Message.Equals(MRR_Message, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ApplyFilter(String columnName, string filterText, String filterCriteria)
        {
            try
            {
                IControl filterIcon = DL_Lab_MRR_Table_Changes.GetColumnFilterLink(columnName);
                bool isFilterIconClicked = Control_ActionUtilities.Click(filterIcon, String.Empty);
                
                bool isDropdownClicked = Control_ActionUtilities.Click(DL_Lab_MRR_Table.FilterDropDownIcon, String.Empty);

                IControl filterCriteriaItem = DL_Lab_MRR_Table.GetActiveFilterItem(filterCriteria);
                if((Control_PropertyUtilities.GetText(filterCriteriaItem)).Equals(filterCriteria))
                {
                    bool isFilterCriteriaClicked = Control_ActionUtilities.Click(filterCriteriaItem, String.Empty);
                }
                
                
                IControl filterTextbox;
                if (columnName.Equals("Ref ID") || columnName.Equals("From Age") || columnName.Equals("To Age"))
                {
                    filterTextbox = DL_Lab_MRR_Table.FilterTextBox;
                    if(filterTextbox!= null)
                    {
                        bool isFilterTextSet = Control_ActionUtilities.Textbox_SetText1(filterTextbox, filterText, String.Empty);
                        IControl filterButton = DL_Lab_MRR_Table.FilterButton;
                        Control_ActionUtilities.Click(filterButton, String.Empty);
                    }
                    
                }
                else if (columnName.Equals("Gender"))
                {
                    filterTextbox = DL_Lab_MRR_Table.FilterTextBox;
                    Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);
                    IControl filterButton = DL_Lab_MRR_Table.FilterButton;
                    Control_ActionUtilities.Click(filterButton, String.Empty);
                }
                else if (columnName.Equals("Start Date") || columnName.Equals("End Date"))
                {
                    filterTextbox = DL_Lab_MRR_Table_Changes.FilterTextBoxForDateInputFieldInMRRTable;
                    Control_ActionUtilities.Textbox_SetText1(filterTextbox, filterText, String.Empty);
                    System.Threading.Thread.Sleep(1000);
                    IControl filterButton = DL_Lab_MRR_Table.FilterButton;
                    string filterbutton = Control_PropertyUtilities.GetText(filterButton);
                    System.Threading.Thread.Sleep(3000);
                    Control_ActionUtilities.Click(filterButton, String.Empty);
                }



            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool ApplyFilterForNAColumnInMRRTable(String columnName, string filterText)
        {
            try
            {
                IControl filterIcon = DL_Lab_MRR_Table_Changes.GetColumnFilterLink(columnName);
                Control_ActionUtilities.Click(filterIcon, String.Empty);                
                Control_ActionUtilities.Click(DL_Lab_MRR_Table_Changes.NAOptionsInMRRTableGridOfMRRPage(filterText), String.Empty);                               
                IControl filterButton = DL_Lab_MRR_Table.FilterButton;
                Control_ActionUtilities.Click(filterButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool ApplyFilterForSubHeading(String columnName, String filterText, String filterCriteria, int occurence)
        {
            try
            {
                IControl filterIcon = DL_Lab_MRR_Table.GetColumnFilterLinkForSubColumns(columnName,occurence);
                Control_ActionUtilities.Click(filterIcon, String.Empty);
                //Control_ActionUtilities.Click(filterIcon, String.Empty);       


                Control_ActionUtilities.Click(DL_Lab_MRR_Table.FilterDropDownIcon, String.Empty);


                IControl filterCriteriaItem = DL_Lab_MRR_Table.GetActiveFilterItem(filterCriteria);

                Control_ActionUtilities.Click(filterCriteriaItem, String.Empty);

                IControl filterTextbox = DL_Lab_MRR_Table.FilterTextBox;
                Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);

                IControl filterButton = DL_Lab_MRR_Table.FilterButton;
                Control_ActionUtilities.Click(filterButton, String.Empty);

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool ApplyFilter(String columnName, String filterText, String filterCriteria, String range)
        {
            try
            {
                // IControl filterTextbox = WebTableUtilities.GetFilterTextbox(DL_Lab_MRR_Table.MrrTableGridFilterRow, GetColumnIndex(columnName, range));
                // Control_ActionUtilities.Textbox_SetText(filterTextbox, filterText, String.Empty);

                // IControl filterCriteriaIcon = WebTableUtilities.GetFilterCriteriaIcon(DL_Lab_MRR_Table.MrrTableGridFilterRow, GetColumnIndex(columnName, range));
                // Control_ActionUtilities.Click(filterCriteriaIcon, String.Empty);

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



        public static bool IsDataFiltered(String columnName, String filterText, String filterCriteria)
        {
            return StringComparisonUtilities.IsFilterCriteriaMatched(DL_Lab_MRR_Table.GetValuesInColumn(columnName), filterText, filterCriteria);
        }

        public static bool IsDataFilteredForAge(String columnName, String filterText, String filterCriteria)
        {
            return IsFilterCriteriaMatchedInMRRTableGridForAge(DL_Lab_MRR_Table.GetValuesInColumn(columnName), filterText, filterCriteria);
        }

        public static bool IsDataFiltered(String columnName, String filterText, String filterCriteria, int occurence)
        {
            return StringComparisonUtilities.IsFilterCriteriaMatched(DL_Lab_MRR_Table.GetValuesInColumn(columnName, occurence), filterText, filterCriteria);
        }       

        public static bool ClearFilter(String columnName)
        {
            try
            {
                IControl filterIcon = DL_Lab_MRR_Table_Changes.GetColumnFilterLink(columnName);
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

        public static bool ClearFilterForSubColumns(String columnName, int occurence)
        {
            try
            {
                IControl filterIcon = DL_Lab_MRR_Table.GetColumnFilterLinkForSubColumns(columnName, occurence);
                Control_ActionUtilities.Click(filterIcon, String.Empty);

                IControl clearIcon = DL_Lab_MRR_Table.ClearButton;
                Control_ActionUtilities.Click(clearIcon, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool VerifyTextInTable(String Message)
        {
            try
            {
                IControl recordsInTable = DL_Lab_MRR_Table.NoRecordsToDisplayInMrrTable;
                String MRR_Message = Control_PropertyUtilities.GetText(recordsInTable);
                return Message.Equals(MRR_Message, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool IsFilterCriteriaMatchedInMRRTableGridForAge(List<String> valueList, String filterText, String filterCriteria)
        {
            switch (filterCriteria)
            {
                
                case "Equal to": return IsFilterCriteriaMatched_EqualTo(valueList, filterText);
                case "Not equal to": return IsFilterCriteriaMatched_NotEqualTo(valueList, filterText);
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

        public static bool IsFilterCriteriaMatched_NotEqualTo(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (filterText.Equals(value, StringComparison.InvariantCultureIgnoreCase))
                {
                    return false;
                }
            }
            return true;
        }
    }
}
