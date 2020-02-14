using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Main.CRF
{
    public class DL_CRF_MainPage
    {
        public static IControl PatientsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#tblMainContent.table100pct #bodyCol.bodyCol > table:nth-of-type(1)"));
            }
        }
    }
}
