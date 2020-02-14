using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.ManageReferenceRanges
{
    public class DL_Lab_MRR_Table_Changes
    {
        public static Interfaces.IControl FilterTextBox
        {
            get
            {
                IControl inputTextField = SyncUtilities.FindVisibleElement(By.CssSelector("span.k-widget.k-numerictextbox > span > input.k-formatted-value.k-input"));

                if (!Control_PropertyUtilities.IsControlNull(inputTextField))
                {
                    return inputTextField;
                }
                return null;
            }

        }

        public static IControl FilterTextBoxForDateInputFieldInMRRTable
        {
            get
            {               
                IControl inputTextField = SyncUtilities.FindVisibleElement(By.CssSelector("span:nth-child(3) > span > input"));

                if (!Control_PropertyUtilities.IsControlNull(inputTextField))
                {
                    return inputTextField;
                }
                return null;
            }
        }

        public static IControl NAOptionsInMRRTableGridOfMRRPage(string val)
        {           
                if(val.Equals("true"))
                {
                    IControl inputTextField = SyncUtilities.FindVisibleElement(By.XPath("//label[1]/input"));

                    if (!Control_PropertyUtilities.IsControlNull(inputTextField))
                    {
                        return inputTextField;
                    }
                } 
                else if(val.Equals("false"))
            {
                IControl inputTextField = SyncUtilities.FindVisibleElement(By.XPath("//label[2]/input"));

                if (!Control_PropertyUtilities.IsControlNull(inputTextField))
                {
                    return inputTextField;
                }
            }              
                return null;            
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

        public static IControl GetActiveFilterItem(String filterCriteria)
        {
            System.Collections.ObjectModel.ReadOnlyCollection<IControl> filterOptions = GetDropdownItems();
            if (filterCriteria.Equals("Equal to"))
            {
                if (!Control_PropertyUtilities.IsControlNull(filterOptions[0]))
                {
                    return filterOptions[0];                    
                }
            }
            else if (filterCriteria.Equals("Not equal to"))
            {
                return filterOptions[1];
            }
            return null;
        }
        public static System.Collections.ObjectModel.ReadOnlyCollection<IControl> GetDropdownItems()
        {
            String dropdonwItemsHostCSSSelector = ".k-animation-container ul";
            IControl host = SyncUtilities.FindVisibleElement(By.CssSelector(dropdonwItemsHostCSSSelector));
            if (!Control_PropertyUtilities.IsControlNull(host))
            {
                return SyncUtilities.FindElements_Parent(host.WebElement, By.TagName("li"));
            }
            return null;
        }
    }
}
