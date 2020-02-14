using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.Pager
{
    public class DS_PagerControl
    {
        public static IControl FirstPageImage
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector(".rgPagerCell a[title='First Page']"));
            }
        }

        public static IControl PreviousPageImage
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector(".rgPagerCell a[title='Previous Page']"));
            }
        }

        public static IControl NextPageImage
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector(".rgPagerCell a[title='Next Page']"));
            }
        }

        public static IControl LastPageImage
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector(".rgPagerCell a[title='Last Page']"));
            }
        }

        public static IControl NextPagePopupImage
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//img[@alt='l Page']"));
            }
        }

        public static IControl FirstPagePopupImage
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//img[@alt='First Page']"));
            }
        }

        public static IControl GetFirstPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.XPath("//img[@alt='First Page']"));
        }
        public static IControl GetlastPageIcon(IControl pager)
        {
            return SyncUtilities.FindElement_Parent(pager.WebElement, By.XPath("//img[@alt='Last Page']"));
        }
    }
}