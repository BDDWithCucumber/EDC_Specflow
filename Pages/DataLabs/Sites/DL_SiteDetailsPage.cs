using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Sites
{
    public class DL_SiteDetailsPage
    {
        public static IControl Site { get { return SyncUtilities.FindVisibleElement(By.Id("SiteDetail_lblSite")); } }
    }
}
