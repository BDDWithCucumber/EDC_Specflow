using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using System.Collections.ObjectModel;

namespace Pages.DataLabs.Patients.Form
{
    public class DL_FormPage
    {
        public static IControl GetMainTabHeaderInForm(String tabHeaderText)
        {
            try
            {
                {
                    String locator = "#divSubTabs #" + tabHeaderText + " > a";
                    return SyncUtilities.FindVisibleElement(By.CssSelector(locator));
                    /*IControl tabHeaderHost = SyncUtilities.FindVisibleElement(By.Id("divSubTabs"));
                    IControl tabHeader = SyncUtilities.FindVisibleElement_Parent(tabHeaderHost.WebElement, By.TagName(tabHeaderText));
                    return tabHeader;*/
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetMainTabHeaderInForm_NoWait(String tabHeaderText)
        {
            try
            {
                {
                    IControl tabHeaderHost = SyncUtilities.FindElement(By.Id("divSubTabs"));
                    IControl tabHeader = SyncUtilities.FindElement_Parent(tabHeaderHost.WebElement, By.Id(tabHeaderText));
                    return tabHeader;
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetSubTabUnderDCFTabInForm(String subTabText)
        {
            try
            {
                IControl host_ul = SyncUtilities.FindVisibleElement(By.CssSelector(".bodyCol > div[id='divSubTabs'] > div[id='divSubTabs'] > div[id='divSubTabs'] > .tabsNav"));
                if (host_ul != null && host_ul.WebElement != null)
                {
                    ReadOnlyCollection<IControl> liList = SyncUtilities.FindVisibleElements_Parent(host_ul.WebElement, By.TagName("li"));
                    foreach (IControl c in liList)
                    {
                        if (c.WebElement.Text.Contains(subTabText))
                        {
                            return c;
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetSubtabHeaderLinkToOpen(IControl header, String subTabText)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(header.WebElement, By.TagName("a"));
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl ActiveDCFsSubTabTable
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("tblDCF"));
            }
        }

        public static IControl Comments_NoDataFoundMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement_Parent(DL_FormPage.CRF_CommentsTable.WebElement, By.ClassName("dataTables_empty"));
            }
        }

        public static IControl CRF_CommentsTable { get { return SyncUtilities.FindVisibleElement(By.Id("tblComments")); } }

        public static IControl CRF_WorkflowTable { get { return SyncUtilities.FindVisibleElement(By.Id("tblWorkFlow")); } }
    }
}