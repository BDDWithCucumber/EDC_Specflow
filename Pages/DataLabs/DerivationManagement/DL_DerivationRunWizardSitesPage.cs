using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.DerivationManagement
{
    public class DL_DerivationRunWizardSitesPage
    {
        public static IControl SitesTable { get { return SyncUtilities.FindVisibleElement(By.Id("DerivationWizardRunList_grdMultipleSiteSelection_ctl00")); } }
        public static IControl NextButton { get { return SyncUtilities.FindVisibleElement(By.Id("DerivationWizardRunList_btnNextButton")); } }
        public static IControl PatientsTable { get { return SyncUtilities.FindVisibleElement(By.Id("DerivationWizardRunList_grdMultiplePatientSelection_ctl00")); } }
    }
}