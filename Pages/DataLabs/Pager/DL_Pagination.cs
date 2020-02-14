using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Pager
{
    public class DL_Pagination
    {
        public static IControl GetFirstPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.CssSelector("a[title='Go to the first page']"));
        }

        public static IControl GetPreviousPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.CssSelector("a[title='Go to the previous page']"));
        }

        public static IControl GetNextPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.CssSelector("a[title='Go to the next page']"));
        }

        public static IControl GetLastPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.CssSelector("a[title='Go to the last page']"));
        }

        public static IControl GetPageNumberControl(IControl pager, int pageNumber, out bool isCurrentPage)
        {
            isCurrentPage = false;
            if (pageNumber > 0)
            {
                IControl pageNumbersHost = SyncUtilities.FindElement_Parent(pager.WebElement, By.CssSelector("ul[class='k-pager-numbers']"));
                if (pageNumbersHost.WebElement != null)
                {
                    IControl currentPageSpan = null;
                    int currentPage = GetCurrentPageNumber(pager, out currentPageSpan);
                    if (currentPage == pageNumber)
                    {
                        return currentPageSpan;
                    }
                    else
                    {
                        return PageNumberLink(pager, pageNumber);
                    }
                }
            }
            return null;
        }

        static IControl PageNumberLink(IControl pager, int pageNumber)
        {
            IControl pageNumbersHost = SyncUtilities.FindElement_Parent(pager.WebElement, By.ClassName("k-pager-numbers"));
            return SyncUtilities.FindElement_Parent(pageNumbersHost.WebElement, By.LinkText(pageNumber.ToString()));
        }

        static int GetCurrentPageNumber(IControl pager, out IControl currentPageSpan)
        {
            IControl pageNumbersHost = SyncUtilities.FindElement_Parent(pager.WebElement, By.ClassName("k-pager-numbers"));
            IControl currentPageIcon = SyncUtilities.FindElement_Parent(pageNumbersHost.WebElement, By.ClassName("k-current-page"));
            currentPageSpan = SyncUtilities.FindElement_Parent(currentPageIcon.WebElement, By.TagName("span"));
            String pageNumberText = currentPageSpan.WebElement.Text;
            int pageNumber;
            Int32.TryParse(pageNumberText, out pageNumber);
            return pageNumber;
        }
    }
}