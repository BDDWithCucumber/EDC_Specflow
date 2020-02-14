using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Sites
{
    public class DL_Site_ManageVersionsPage
    {
        public static IControl VersionsTable { get { return SyncUtilities.FindVisibleElement(By.Id("tblVersions")); } }
    }
}
