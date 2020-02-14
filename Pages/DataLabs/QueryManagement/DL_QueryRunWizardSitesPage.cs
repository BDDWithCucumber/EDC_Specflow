using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.QueryManagement
{
    public class DL_QueryRunWizardSitesPage
    {
        public static IControl SitesTable { get { return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_grdMultipleSiteSelection_ctl00")); } }

        public static IControl NextButton { get { return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_btnNextButton")); } }
    }
}
