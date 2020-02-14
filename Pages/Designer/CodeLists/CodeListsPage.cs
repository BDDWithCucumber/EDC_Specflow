using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.CodeLists
{
    public class CodeListsPage
    {
        public static IControl AddCodeList
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgCommandCell > table > tbody > tr > td > div > a"));
            }
        }

        public static IControl AddCodeListItem
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgCommandCell > table > tbody > tr > td > div > a"));
            }
        }

        public static IControl CodeLists { get { return SyncUtilities.FindVisibleElement(By.Id("Codelists")); } }

        //public static IControl CodeList { get { return SyncUtilities.FindVisibleElement(By.XPath("//h1[contains(., 'Codelists')]")); } }
        //public static IControl CodeList(string var)
        //{ get { return SyncUtilities.FindVisibleElement(By.XPath("//h1[contains(., '"+var+"')]")); } }

        public static IControl CodeList(string var)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//h1[contains(., '" + var + "')]"));
        }

        public static IControl CodelistsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00"));
            }
        }

        public static IControl SetCodePrefix
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdCodeitem_ctl00_ctl02_ctl02_txtPrefix"));
            }
        }

        public static IControl CodeListItemDesc
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdCodeitem_ctl00_ctl02_ctl02_txtDesc"));
            }
        }

        public static IControl CodeListItemValue
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdCodeitem_ctl00_ctl02_ctl02_txtValue"));
            }
        }

        public static IControl ConditionalValue
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_txtConditionalValues"));
            }
        }

        public static IControl CodeListItemSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdCodeitem_ctl00_ctl02_ctl02_btnSave"));
            }
        }

        public static IControl CodeListSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00_ctl02_ctl04_btnSave"));
            }
        }

        public static IControl CodeListName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00_ctl02_ctl04_txtCLName"));
            }
        }

        public static IControl CodeListDesc
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00_ctl02_ctl04_txtCLDesc"));
            }
        }


        public static IControl CheckAllCodeListItems
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdCodeitem_ctl00_ctl02_ctl01_colSelectSelectCheckBox"));
            }
        }

        public static IControl BreadcrumbCodeLists
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#aspnetForm > table > tbody > tr:nth-child(3) > td > div > a:nth-child(3)"));
            }
        }

        public static IControl ClickDeleteItems
        {
            get 
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgCommandCell > table > tbody > tr > td > div:nth-of-type(2) > a"));
            }
        }

        public static IControl CodeListItemsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdCodeitem_ctl00"));
            }
        }

        public static IControl CodeListsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist.RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00"));
            }
        }

        public static IControl GetCodeListLink(IControl proecssCell, string processText)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(proecssCell.WebElement, By.LinkText(processText));
            }
            catch (Exception e)
            {

            }
            return null;
        }

    }
}
