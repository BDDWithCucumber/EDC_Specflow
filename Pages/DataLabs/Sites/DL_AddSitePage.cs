using Common;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading;
using Utilities;

namespace Pages.DataLabs.Sites
{
    public class DL_AddSitePage
    {
        public static IControl AddSiteTable
        {
            get
            {
                if (IsSiteDetailsPageOpened())
                {
                    IControl mainTable = SyncUtilities.FindElement(By.Id("tblMainContent"));
                    ReadOnlyCollection<IControl> tableList = SyncUtilities.FindElements_Parent(mainTable.WebElement, By.TagName("table"));
                    return new Control(tableList[0].WebElement);
                }
                return null;
            }
        }
        public static IControl SaveButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("SiteDetail_btnSave"));
            }
        }
        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("SiteDetail_btnCancel"));
            }
        }
        public static bool IsSiteDetailsPageOpened()
        {

            IControl c = SyncUtilities.FindVisibleElement(By.Id("SiteDetail_txtSiteID"));
            return !Control_PropertyUtilities.IsControlNull(c);

            int i = 0;
            while (true)
            {
                ++i;
                IControl addSiteLabel = SyncUtilities.FindElement(By.Id("SiteDetail_lblSite"));
                if (addSiteLabel.WebElement != null && addSiteLabel.WebElement.Text.Equals("Add Site", StringComparison.InvariantCultureIgnoreCase))
                {
                    return true;
                }
                if (i == 5)
                {
                    return false;
                }
                Thread.Sleep(1000);
            }
        }
        public static IControl ActiveSubTabTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#divSubTabs > #ucSubTabs"));
                //return SyncUtilities.FindVisibleElement_Parent(subTabsDiv.WebElement, By.Id("ucSubTabs"));
            }
        }
        public static IControl GetSubTabHeader(String subTabName)
        {
            String cssSelector = "#divSubTabs > .tabsNav > #" + subTabName + " > a";
            return SyncUtilities.FindVisibleElement(By.CssSelector(cssSelector));

            //IControl subTabsDiv = SyncUtilities.FindElement(By.Id("divSubTabs"));
            //IControl tabHeadersHost = SyncUtilities.FindVisibleElement_Parent(subTabsDiv.WebElement, By.ClassName("tabsNav"));
            //return SyncUtilities.FindVisibleElement_Parent(tabHeadersHost.WebElement, By.Id(subTabName));
        }
    }
}