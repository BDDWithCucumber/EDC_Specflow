using Interfaces;
using OpenQA.Selenium;
using System;
using Utilities;

namespace Pages.DataLabs.Main
{
    public class DL_PrimaryTabs
    {
        public static IControl GetPrimaryTab(String primaryTabName)
        {
            IControl pageHeadDiv = SyncUtilities.FindElement(By.ClassName("page-head"));
            IControl siteNavDiv = SyncUtilities.FindVisibleElement_Parent(pageHeadDiv.WebElement, By.ClassName("site-nav"));
            IControl primayNavDiv = SyncUtilities.FindVisibleElement_Parent(siteNavDiv.WebElement, By.Id("primary-nav"));
            return SyncUtilities.FindVisibleElement_Parent(primayNavDiv.WebElement, By.PartialLinkText(primaryTabName));
        }

        public static IControl ViewMoreButton
        {
            get
            {
                return SyncUtilities.FindElement(By.ClassName("flexMenu-viewMore"));
            }
        }
    }
}