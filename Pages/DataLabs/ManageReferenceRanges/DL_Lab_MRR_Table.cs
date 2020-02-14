using Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.ManageReferenceRanges
{
    public class DL_Lab_MRR_Table
    {
        public static bool IsInReferenceRangePage()
        {
            int i = 0;
            bool found = false;
            while (i < 10 && !found)
            {
                ++i;
                IControl leftLane = SyncUtilities.FindElement(By.CssSelector("#leftpanel"));
                if (!Control_PropertyUtilities.IsControlNull(leftLane))
                {
                    return true;
                }
                Thread.Sleep(1000);
            }
            return found;
        }

        public static IControl GetActionIcon(IControl actionsCell,String actionName)
        {
            try
            {                
                    ReadOnlyCollection<IControl> actionIconList = SyncUtilities.FindVisibleElements_Parent(actionsCell.WebElement, By.TagName("a"));

                    if (actionName.Equals("Edit") && actionIconList.Count > 0)
                    {
                        return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector(" a.k-button.k-button-icontext.k-grid-edit"));
                    }
                    else if (actionName.Equals("Copy") && actionIconList.Count > 0)
                    {
                        return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-button-icontext.k-grid-copy"));
                    }
                    else if (actionName.Equals("Delete") && actionIconList.Count > 0)
                    {
                        return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector(" a.k-button.k-button-icontext.k-grid-deleterow"));
                    }
                    else if (actionName.Equals("History"))
                    {
                        return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.TagName("img"));
                    }
                
            }
            catch(Exception e)
            {

            }
            return null;
        }

        public static ReadOnlyCollection<IControl> GetHeaderRowstobedelted()
        {
                   

            {
                IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labController]"));
                IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                IControl headerHost = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-header"));
                IControl header = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.TagName("thead"));
                return SyncUtilities.FindVisibleElements_Parent(header.WebElement, By.TagName("tr"));
            }
            return null;
        }

        public static ReadOnlyCollection<IControl> GetHeaderRows()
        {            
            
                if (IsInReferenceRangePage())
                {                    
                    IControl grid = SyncUtilities.FindElement(By.CssSelector("#gridReferenceRanges"));
                    IControl headerheader = SyncUtilities.FindElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-header"));
                    IControl table = SyncUtilities.FindElement_Parent(headerheader.WebElement, By.TagName("table"));
                    IControl header = SyncUtilities.FindElement_Parent(table.WebElement, By.CssSelector("thead"));
                    return SyncUtilities.FindVisibleElements_Parent(header.WebElement, By.TagName("tr"));
            }
                return null;
            
        }
              
        public static IControl MrrTable
        {
            get
            {
                if (IsInReferenceRangePage())
                {                    
                     return SyncUtilities.FindVisibleElement(By.CssSelector("#gridReferenceRanges > div.k-grid-content.k-auto-scrollable > table"));                    
                }
                return null;
            }
        }
              

        public static IControl NoRecordsToDisplayInMrrTable
        {
            get
            {
                IControl grid = SyncUtilities.FindVisibleElement(By.CssSelector("#gridReferenceRanges"));
                IControl table = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-content.k-auto-scrollable"));                
                return SyncUtilities.FindVisibleElement_Parent(table.WebElement, By.ClassName("k-grid-norecords"));
            }
        }       
        public static IControl MrrTableGridTitleRow
        {
            get
            {
                ReadOnlyCollection<IControl> headerRows = GetHeaderRows();
                if (headerRows != null && headerRows.Count > 0)
                {
                    return headerRows[0];
                }
                return null;
            }
        }

        public static IControl MrrTableGridTitleSubHeading
        {
            get
            {
                ReadOnlyCollection<IControl> headerRows = GetHeaderRows();
                if (headerRows != null && headerRows.Count > 0)
                {
                    return headerRows[1];
                }
                return null;

            }
        }

        public static IControl MrrTableGridSubHeadings
        {
            get
            {
                ReadOnlyCollection<IControl> headerRows = GetHeaderRows();
                if (headerRows != null && headerRows.Count > 1)
                {
                    return headerRows[1];
                }
                return null;
            }
        }

        public static IControl MrrTableGridFilterRow_FirstRow
        {
            get
            {
                ReadOnlyCollection<IControl> headerRows = GetHeaderRows();
                if (headerRows != null && headerRows.Count > 1)
                {
                    return headerRows[0];
                }
                return null;
            }
        }

        public static IControl MrrTableDataRow
    {
        get
        {
            ReadOnlyCollection<IControl> dataRows = GetMrrTableRows();
            if (dataRows != null && dataRows.Count > 0)
            {
                return dataRows[1];
            }
            return null;
        }
    }
        public static IControl MRR_Message { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#Labs_Main_noDataAccessPanel > div")); } }   
        public static IControl GetFilterCriteriaIcon(string columnName)
        {
            if (columnName.Equals("Start Date"))
            {
                IControl headerCell = WebTableUtilities.GetColumnHeader(MrrTableGridTitleRow, columnName, TableColumnContentType.Text);
                if (!Control_PropertyUtilities.IsControlNull(headerCell))
                {
                    return SyncUtilities.FindVisibleElement_Parent(headerCell.WebElement, By.CssSelector("k-grid-filter"));
                }
                
            }
            return null;
        }
        public static IControl GetDropdownInvoker(String dropdownName)
        {
            if (dropdownName.Equals("Gender"))
            {
                IControl gendercell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 4);
                IControl gendercellcontrol = SyncUtilities.FindVisibleElement_Parent(gendercell.WebElement, By.CssSelector(".k-input"));               
                return gendercellcontrol;
            }

            else if (dropdownName.Equals("From Age1"))
            {
                IControl fromAgecell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 5);
                IControl fromAgeFirstControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("span:first-child"));                             
                return fromAgeFirstControl;
            }

            else if (dropdownName.Equals("From Age2"))
            {
                IControl fromAgecell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 5);               
                IControl fromAgeSecondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.XPath("//span[2]/span/span[1]"));                               
                return fromAgeSecondControl;
            }

            else if (dropdownName.Equals("To Age1"))
            {
                IControl fromAgecell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 6);
                IControl toAgeFirstControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("span:first-child"));                
                return toAgeFirstControl;
            }

            else if (dropdownName.Equals("To Age2"))
            {
                IControl fromAgecell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 6);
                IControl toAgeSecondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.XPath("//span[2]/span/span[1]"));                
                return toAgeSecondControl;
            }

            else if (dropdownName.Equals("Normal Range Low"))
            {
                IControl normalRangeLow = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 7);
                IControl normalRangeLowControl = SyncUtilities.FindVisibleElement_Parent(normalRangeLow.WebElement, By.CssSelector("span:first-child"));                
                return normalRangeLowControl;
            }

            else if (dropdownName.Equals("Normal Range High"))
            {
                IControl normalRangeHigh = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 8);
                IControl normalRangeHighControl = SyncUtilities.FindVisibleElement_Parent(normalRangeHigh.WebElement, By.CssSelector("span:first-child"));                
                return normalRangeHighControl;
            }

            else if (dropdownName.Equals("Critical Range Low"))
            {
                IControl criticalRangeLow = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 9);
                IControl criticalRangeLowControl = SyncUtilities.FindVisibleElement_Parent(criticalRangeLow.WebElement, By.CssSelector("span:first-child"));                               
                return criticalRangeLowControl;
            }

            else if (dropdownName.Equals("Critical Range High"))
            {
                IControl criticalRangeHigh = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 10);
                IControl criticalRangeHighControl = SyncUtilities.FindVisibleElement_Parent(criticalRangeHigh.WebElement, By.CssSelector("span:first-child"));                              
                return criticalRangeHighControl;
            }

            else if (dropdownName.Equals("Unit"))
            {
                IControl unitcell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 11);
                IControl unitcellControl = SyncUtilities.FindVisibleElement_Parent(unitcell.WebElement, By.CssSelector(".k-input"));                
                return unitcellControl;
            }
            return null;
        }

        public static IControl GetSelectValueFromDropdown
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("div.k-list-optionlabel"));
            }
            
        }

        public static ReadOnlyCollection<IControl> GetDropdownItems()
        {
            List<IControl> cList = new List<IControl>();
            String dropdonwItemsHostCSSSelector = ".k-animation-container ul";
            IControl host = SyncUtilities.FindVisibleElement(By.CssSelector(dropdonwItemsHostCSSSelector));
            if (!Control_PropertyUtilities.IsControlNull(host))
            {
                String cssSelector = ".k-list-container.k-popup > .k-list-optionlabel";
                cList.Add(SyncUtilities.FindVisibleElement(By.CssSelector(cssSelector)));

                ReadOnlyCollection<IControl> dropdownItemsList = SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.TagName("li"));
                foreach (IControl c in dropdownItemsList)
                {
                    cList.Add(c);
                }
            }
            return new ReadOnlyCollection<IControl>(cList);
        }
      
        public static ReadOnlyCollection<IControl> GetMrrTableRows()
        {

            if (IsInReferenceRangePage())
            {                
                IControl tbody = SyncUtilities.FindVisibleElement(By.XPath("//div[@id='gridReferenceRanges']//tbody"));
                return SyncUtilities.FindVisibleElements_Parent(tbody.WebElement, By.TagName("tr"));                
            }
            return null;
        }
        public static IControl GetFirstRow
        {
            get
            {
                if (IsInReferenceRangePage())
                {
                    //IControl tbody = SyncUtilities.FindVisibleElement(By.XPath("//div[@id='gridReferenceRanges']//tbody"));
                    return SyncUtilities.FindElement(By.XPath("//div[@id='gridReferenceRanges']//tbody//tr[1]"));
                }
                return null;     
            }
        }
        public static IControl AddNewRecord
        {
            get
            {
                if (IsInReferenceRangePage())
                {
                    return SyncUtilities.FindElement(By.CssSelector("#gridReferenceRanges > div.k-header.k-grid-toolbar > a.k-button.k-button-icontext.addnewrow"));
                }
                return null;
            }
        }

        public static IControl DeleteButton
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector("#gridReferenceRanges > div.k-header.k-grid-toolbar > a.k-button.k-button-icontext.k-grid-btndelete"));
            }
        }
        public static IControl LabTest_Name
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
            }
        }

        public static IControl DeleteCheckboxName
        {
            get
            {
                IControl mRRDisplayDiv = SyncUtilities.FindVisibleElement(By.CssSelector("div[ng-app='labApp']"));
                IControl mRRDiv = SyncUtilities.FindVisibleElement_Parent(mRRDisplayDiv.WebElement, By.CssSelector("div[ng-controller='labMainController']"));
                IControl gridDiv = SyncUtilities.FindVisibleElement_Parent(mRRDiv.WebElement, By.Id("grid"));
                IControl tableHostDiv = SyncUtilities.FindVisibleElement_Parent(gridDiv.WebElement, By.CssSelector(".k-grid-content k-auto-scrollable"));
                return SyncUtilities.FindVisibleElement_Parent(tableHostDiv.WebElement, By.ClassName("k-grid-norecords"));
            }
        }

        public static IControl DeleteCheckbox
        {
            get
            {
                IControl mRRDisplayDiv = SyncUtilities.FindVisibleElement(By.CssSelector("div[ng-app='labApp']"));
                IControl mRRDiv = SyncUtilities.FindVisibleElement_Parent(mRRDisplayDiv.WebElement, By.CssSelector("div[ng-controller='labMainController']"));
                IControl gridDiv = SyncUtilities.FindVisibleElement_Parent(mRRDiv.WebElement, By.Id("grid"));
                IControl tableHostDiv = SyncUtilities.FindVisibleElement_Parent(gridDiv.WebElement, By.CssSelector(".k-grid-content k-auto-scrollable"));
                return SyncUtilities.FindVisibleElement_Parent(tableHostDiv.WebElement, By.ClassName("k-grid-norecords"));
            }
        }

        public static IControl Pager
        {
            get
            {                
                return SyncUtilities.FindVisibleElement(By.CssSelector("#gridReferenceRanges > div.k-pager-wrap.k-grid-pager.k-widget.k-floatwrap"));
            }
        }

        public static IControl GetColumnHeaderTitle_FirstRow(String columnName)
        {
            if (!String.IsNullOrEmpty(columnName))
            {
                if(DL_Lab_MRR_Table.IsInReferenceRangePage())
                {
                    IControl headerCell = WebTableUtilities.GetColumnHeader(MrrTableGridTitleRow, columnName, TableColumnContentType.Text);
                    if (!Control_PropertyUtilities.IsControlNull(headerCell))
                    {
                        return SyncUtilities.FindVisibleElement_Parent(headerCell.WebElement, By.LinkText(columnName));
                    }

                }
                
            }
            return null;
        }

        public static IControl GetColumnHeaderTitle_SecondRow(String columnName)
        {
            if (!String.IsNullOrEmpty(columnName))
            {
                //Change title row
                IControl headerCell = WebTableUtilities.GetColumnHeader(MrrTableGridTitleRow, columnName, TableColumnContentType.Text,1);
                if (!Control_PropertyUtilities.IsControlNull(headerCell))
                {
                    return SyncUtilities.FindVisibleElement_Parent(headerCell.WebElement, By.LinkText(columnName));
                }
            }
            return null;
        }


        public static IControl GetColumnFilterLink(String columnName)
        {
            if (!String.IsNullOrEmpty(columnName))
            {
                IControl headerCell = GetFilterCell(DL_Lab_MRR_Table.MrrTableGridTitleRow, GetColumnIndex(columnName));
                if (!Control_PropertyUtilities.IsControlNull(headerCell))
                {
                    IControl filterIcon = SyncUtilities.FindVisibleElement_Parent(headerCell.WebElement, By.ClassName("k-grid-filter"));
                    if (!Control_PropertyUtilities.IsControlNull(filterIcon))
                    {
                        return filterIcon;
                    }
                }
            }
            return null;
        }

        public static IControl CheckboxInMrrTableColumnHeader
        {
            get
            {
                if(IsInReferenceRangePage())
                {
                    return SyncUtilities.FindVisibleElement(By.ClassName("k-checkbox-label"));
                }

                return null;
            }
        }

        //public static IControl GetColumnFilterLink(String columnName)
        //{
        //    if (!String.IsNullOrEmpty(columnName))
        //    {
        //        IControl headerCell = GetFilterCell(MrrTableGridTitleRow, GetColumnIndex(columnName));
        //        if (!Control_PropertyUtilities.IsControlNull(headerCell))
        //        {
        //            IControl filterIcon= SyncUtilities.FindVisibleElement_Parent(headerCell.WebElement, By.ClassName("k-grid-filter"));
        //            return filterIcon;                                     
        //        }
        //    }
        //    return null;
        //}

        public static IControl GetColumnFilterLinkForSubColumns(String columnName, int occurence)
        {
            if (!String.IsNullOrEmpty(columnName))
            {
                IControl headerCell = GetFilterCell(MrrTableGridTitleSubHeading, GetHeaderColumnIndex(columnName, occurence));
                if (!Control_PropertyUtilities.IsControlNull(headerCell))
                {
                    IControl filterIcon = SyncUtilities.FindVisibleElement_Parent(headerCell.WebElement, By.CssSelector("a.k-grid-filter > span.k-icon.k-i-filter"));
                    return filterIcon;
                }
            }
            return null;

        }

        static IControl GetFilterCell(IControl filterRow, int columnIndex)
        {
            if (filterRow != null && filterRow.WebElement != null)
            {
                ReadOnlyCollection<IControl> filterCellList = SyncUtilities.FindElements_Parent(filterRow.WebElement, By.TagName("th"));
                if (columnIndex < filterCellList.Count)
                {
                    return filterCellList[columnIndex];
                }
            }
            return null;
        }

        
        public static List<String> GetValuesInColumn(String columnName)
        {
            List<String> valueList = new List<String>();
            int colIndex = GetColumnIndex(columnName);
            if (colIndex > -1)
            {
                NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                do
                {
                    valueList.AddRange(WebTableUtilities.GetValuesInColumn(DL_Lab_MRR_Table.MrrTable, colIndex));
                }
                while (NavigateToNextPage(DL_Lab_MRR_Table.Pager));
            }
            return valueList;
        }

        public static List<String> GetValuesInColumn(String columnName, int occurence)
        {
            List<String> valueList = new List<String>();
            int colIndex = GetColumnIndex(columnName, occurence);
            if (colIndex > -1)
            {
                NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                do
                {
                    valueList.AddRange(WebTableUtilities.GetValuesInColumn(DL_Lab_MRR_Table.MrrTable, colIndex));
                }
                while (NavigateToNextPage(DL_Lab_MRR_Table.Pager));
            }
            return valueList;
        }

        public static List<String> GetValuesInColumn(String columnName, String range)
        {
            List<String> valueList = new List<String>();
            int colIndex = GetColumnIndex(columnName, range);
            if (colIndex > -1)
            {
                NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                do
                {
                    valueList.AddRange(WebTableUtilities.GetValuesInColumn(DL_Lab_MRR_Table.MrrTable, colIndex));
                }
                while (NavigateToNextPage(DL_Lab_MRR_Table.Pager));
            }
            return valueList;
        }
        static int GetColumnIndex(String columnName, String range)
        {
            if (range.Equals("Normal Range"))
            {
                switch (columnName)
                {
                    case "Low": return 7;
                    case "High": return 8;
                }
            }
            else if (range.Equals("Critical Range"))
            {
                switch (columnName)
                {
                    case "Low": return 9;
                    case "High": return 10;
                }

            }

            return -1;
        }
        public static int GetColumnIndex(String columnName)
        {
            switch (columnName)
            {
                case "Ref ID": return 1;
                case "Start Date": return 2;
                case "End Date": return 3;
                case "Gender": return 4;
                case "From Age": return 5;
                case "To Age": return 6;
                case "Normal Range Low": return 7;
                case "Normal Range High": return 8;
                case "Critical Range Low": return 9;
                case "Critical Range High": return 10;
                case "Unit Name": return 11;
                case "NA": return 12;
                case "Actions": return 13;
            }
            return -1;
        }
        public static int GetHeaderColumnIndex(String columnName, int occurence)
        {
            if(occurence.Equals(1))
            {
                switch (columnName)
                {                    
                    case "Low": return 0;
                    case "High": return 1;                    
                }
            }
            else if(occurence.Equals(2))
            {
                switch (columnName)
                {
                    case "Low": return 2;
                    case "High": return 3;
                }
            }            
            return -1;
        }

        public static int GetColumnIndex(String columnName, int occurence)
        {
            if (occurence.Equals(1))
            {
                switch (columnName)
                {
                    case "Low": return 7;
                    case "High": return 8;
                }
            }
            else if (occurence.Equals(2))
            {
                switch (columnName)
                {
                    case "Low": return 9;
                    case "High": return 10;
                }
            }
            return -1;
        }
       public static bool NavigateToFirstPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Lab_Mrr_Table_Pagination.GetFirstPageIcon(pager));
        }
        
        static bool ClickPageNavigationButton(IControl c)
        {
            bool found = false;
            String cssValue = Control_PropertyUtilities.GetAttributeValue(c, "class", out found);
            if (!cssValue.Contains("k-state-disabled"))
            {
                return Control_ActionUtilities.Click(c, String.Empty);
            }
            return false;
        }
        public static bool NavigateToNextPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Lab_Mrr_Table_Pagination.GetNextPageIcon(pager));
        }

        public static bool NavigateToLastPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Lab_Mrr_Table_Pagination.GetLastPageIcon(pager));
        }

        public static bool AreListsEqual(List<String> list1, List<String> list2)
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

        public static IControl GetActiveFilterItem(String filterCriteria)
        {
            Thread.Sleep(5000);
            ReadOnlyCollection<IControl> filterOptions = GetDropdownItems();
            
            if (filterCriteria.Equals("Equal to"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[0]))
                {
                    return filterOptions[0];
                }                
            }
            else if (filterCriteria.Equals("Not equal to"))
            {
                if(!Control_PropertyUtilities.IsControlNull(filterOptions[1]))
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
            else if (filterCriteria.Equals("Is greater than or equal to") || filterCriteria.Equals("Is after or equal to"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[2]))
                {
                    return filterOptions[2];
                }                
            }
            else if (filterCriteria.Equals("Is greater than") || filterCriteria.Equals("Is after"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[3]))
                {
                    return filterOptions[3];
                }                
            }
            else if (filterCriteria.Equals("Is less than or equal to") || filterCriteria.Equals("Is before or equal to"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[4]))
                {
                    return filterOptions[4];
                }                
            }
            else if (filterCriteria.Equals("Is less than") || filterCriteria.Equals("Is before"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[5]))
                {
                    return filterOptions[5];
                }                
            }
            return null;
        }

        public static IControl FilterDropDownIcon
        {
            get
            {
                Thread.Sleep(5000);
                IControl form = SyncUtilities.FindVisibleElement(By.CssSelector("div.k-animation-container > form"));
                if (!Control_PropertyUtilities.IsControlNull(form))
                {
                    //IControl dropdownControl = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.ClassName("k-widget k-dropdown k-header"));                    
                    IControl dropdown = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.CssSelector("span.k-widget.k-dropdown.k-header > span > span.k-input"));
                    return dropdown;                    
                }
                return null;
            }           
           
        }

        public static IControl FilterTextBox
        {
            get
            {
                IControl form = SyncUtilities.FindVisibleElement(By.CssSelector("div.k-animation-container > form"));
                if (!Control_PropertyUtilities.IsControlNull(form))
                {
                    IControl inputTextField = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.CssSelector("span.k-widget.k-numerictextbox > span > input.k-formatted-value.k-input"));
                    if (!Control_PropertyUtilities.IsControlNull(inputTextField))
                    {
                        return inputTextField;
                    }
                }                                     
                return null;
            }           

        }

        public static IControl FilterButton
        {
            get
            {
                Thread.Sleep(5000);
                IControl form = SyncUtilities.FindVisibleElement(By.CssSelector("div.k-animation-container > form"));
                //if (!Control_PropertyUtilities.IsControlNull(form))
                //{
                   // IControl buttons = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.TagName("button"));
                    //IControl filterButton = SyncUtilities.FindElement(By.XPath("//button[@type='submit']"));
                    IControl filterButton1=  SyncUtilities.FindVisibleElement_Parent(form.WebElement,By.XPath("//button[1]"));
                    
                    return filterButton1;
                Thread.Sleep(5000);
                //}
                //return null;
            }

        }

        public static IControl ClearButton
        {
            get
            {
                IControl form = SyncUtilities.FindVisibleElement(By.CssSelector("div.k-animation-container > form"));
                if (!Control_PropertyUtilities.IsControlNull(form))
                {
                    IControl buttons = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.TagName("button"));
                    IControl filterButton = SyncUtilities.FindVisibleElement_Parent(buttons.WebElement, By.XPath("//button[2]"));
                    return filterButton;
                }
                return null;
            }

        }
        static IControl GetActiveFilters(string filterCriteria)
        {
           ReadOnlyCollection <IControl> filterOptions= GetDropdownItems();
           if (filterCriteria.Equals("Is equal to"))
            {
                return filterOptions[0];
            }
           else if(filterCriteria.Equals("Is not equal to"))
            {
                return filterOptions[1];
            }
            return null;
        }

        static IControl GetFilterCriteriaItem(IControl activeFilters, String filterCriteria)
        {
            ReadOnlyCollection<IControl> list = SyncUtilities.FindVisibleElements_Parent(activeFilters.WebElement, By.TagName("li"));
            foreach (IControl c in list)
            {
                if (c.WebElement.Text.Equals(filterCriteria, StringComparison.InvariantCultureIgnoreCase))
                {
                    return c;
                }
            }
            return null;
        }
        public static IControl GetRowByReferenceRangeID(string RRID)
        {
            IControl referenceRangeTable = ReferenceRangesPage.ReferenceRangesGrid();
            ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(referenceRangeTable.WebElement, By.TagName("tr"));
            foreach (IControl row in rows)
            {
                IControl referenceRangeId = SyncUtilities.FindVisibleElement_Parent(row.WebElement, By.XPath(".//td[2]"));
                if (RRID.Equals(referenceRangeId.WebElement.Text.Trim()))
                {
                    return row;
                }

            }
            return new Control(null);
        }
    }
}
