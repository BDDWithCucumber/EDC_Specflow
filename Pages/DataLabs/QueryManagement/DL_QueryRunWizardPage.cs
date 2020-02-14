using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.QueryManagement
{
    public class DL_QueryRunWizardPage
    {
        public static IControl RunAllButton { get { return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_btnRunAllTop")); } }
        public static IControl FinishButton { get { return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_btnFinishButton")); } }
        public static IControl GetSearchField(string SearchFieldName)
        {
            switch(SearchFieldName.ToUpper())
            {
                case "NAME": case "VERSION": case "DESCRIPTION":
                    return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_grdWizardRunListItems_ctl00_ctl02_ctl03_FilterTextBox_col" + SearchFieldName));
                case "CATEGORY":
                    return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_grdWizardRunListItems_ctl00_ctl02_ctl03_FilterTextBox_colQueryCategoryNames"));
                case "TYPE":
                    return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_grdWizardRunListItems_ctl00_ctl02_ctl03_FilterTextBox_colStatus"));
                default:
                    return null;
            }
        }
        public static IControl QueriesTblOnRunWizard { get { return SyncUtilities.FindVisibleElement(By.XPath("//table[@id='QueryWizardRunList_grdWizardRunListItems_ctl00']/tbody")); } }
        public static IControl NextButtonTop { get { return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_btnNextTop")); } }
    }
}