using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Main.DCF
{
    public class DL_DCF_PatientsPage
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
