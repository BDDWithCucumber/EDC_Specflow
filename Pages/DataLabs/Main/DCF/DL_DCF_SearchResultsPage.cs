using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Main.DCF
{
    public class DL_DCF_SearchResultsPage
    {
        public static IControl DCFSearchResultsTable
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("DCFList_trSearchResults"));
                if (!Control_PropertyUtilities.IsControlNull(c))
                {
                    return SyncUtilities.FindVisibleElement(By.CssSelector("#tblMainContent.table100pct #bodyCol.bodyCol > table:nth-of-type(2)"));
                }
                return null;
            }
        }
    }
}