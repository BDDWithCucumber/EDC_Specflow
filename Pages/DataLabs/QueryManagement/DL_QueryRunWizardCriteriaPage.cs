using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.QueryManagement
{
    public class DL_QueryRunWizardCriteriaPage
    {
        public static IControl NextButton { get { return SyncUtilities.FindVisibleElement(By.Id("QueryWizardRunList_btnNextButton")); } } 
    }
}
