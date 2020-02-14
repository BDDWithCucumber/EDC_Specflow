using Interfaces;
using OpenQA.Selenium;
using System.Threading;
using Utilities;

namespace Pages.DataLabs.Sites
{
    public class DL_SiteManagementPage
    {
        public static IControl SitesTable
        {
            get
            {
                IControl bodyColtd = GetHost();
                IControl sitesTable = SyncUtilities.FindElement_Parent(bodyColtd.WebElement, By.ClassName("tbstyleBorder"));
                return sitesTable;
            }
        }
        public static IControl Pager
        {
            get
            {
                IControl bodyColtd = GetHost();
                IControl pagerContainer_Table = SyncUtilities.FindElement_Parent(bodyColtd.WebElement, By.ClassName("tbstyle"));
                IControl pagerContainer_TD = SyncUtilities.FindElement_Parent(pagerContainer_Table.WebElement, By.ClassName("gcolumn"));                
                return pagerContainer_TD;
            }
        }
        static IControl GetHost()
        {
            IControl mainContent = SyncUtilities.FindElement(By.Id("mainContent"));
            IControl tblMainContent = SyncUtilities.FindVisibleElement_Parent(mainContent.WebElement, By.Id("tblMainContent"));
            IControl bodyColtd = SyncUtilities.FindVisibleElement_Parent(tblMainContent.WebElement, By.CssSelector("td#bodyCol.bodyCol"));
            //return tblMainContent;
            return bodyColtd;
        }

        public static bool IsInSiteManagementPage()
        {
            int i = 0;
            bool found = false;
            while (i < 10 && !found)
            {
                ++i;
                Thread.Sleep(1000);
            }
            return found;
        }
    }
}
