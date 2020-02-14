using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Pager
{
    public class DL_Pagination1
    {
        public static IControl GetFirstPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.Id("SiteList_ctl00_imgPageFirst"));
        }

        public static IControl GetPreviousPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.Id("SiteList_ctl00_imgPagePrevious"));
        }

        public static IControl GetNextPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.Id("SiteList_ctl00_imgPageNext"));
        }

        public static IControl GetLastPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.Id("SiteList_ctl00_imgPageLast"));
        }
    }
}
