using Interfaces;
using Utilities;
using OpenQA.Selenium;
using System;
using System.Threading;
using System.Collections.ObjectModel;
using Framework.Actions;

namespace Pages.DataLabs.Labs
{
    public static class DL_LabManagementPage
    {
        public static IControl LabManagementTitle
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//h3[contains(text(), 'Lab Management')]"));
            }
        }

        public static IControl LabManagementActionsPalette
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("LabMgmt_Actions_trActionDisplay"));
            }
        }

        public static IControl LabsTable
        {
            get
            {
                if (IsInLabManagementPage())
                {
                    IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                    IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labController]"));
                    IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                    IControl tableHost = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-content.k-auto-scrollable"));
                    return SyncUtilities.FindVisibleElement_Parent(tableHost.WebElement, By.TagName("table"));
                }
                return null;
            }
        }

        public static IControl Pager
        {
            get
            {
                if (IsInLabManagementPage())
                {
                    IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                    IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labController]"));
                    IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                    return SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-pager-wrap.k-grid-pager.k-widget.k-floatwrap"));
                }
                return null;
            }
        }

        static ReadOnlyCollection<IControl> GetHeaderRows()
        {
            if (IsInLabManagementPage())
            {
                IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labController]"));
                IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                IControl headerHost = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-header"));
                IControl header = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.TagName("thead"));
                return SyncUtilities.FindVisibleElements_Parent(header.WebElement, By.TagName("tr"));
            }
            return null;
        }

        public static IControl LabsGridTitleRow
        {
            get
            {
                ReadOnlyCollection<IControl> headerRows = GetHeaderRows();
                if (headerRows != null && headerRows.Count > 0)
                {
                    return headerRows[0];
                }
                return null;
            }
        }

        public static IControl LabsGridFilterRow
        {
            get
            {
                ReadOnlyCollection<IControl> headerRows = GetHeaderRows();
                if (headerRows != null && headerRows.Count > 1)
                {
                    return headerRows[1];
                }
                return null;
            }
        }

        public static bool IsInLabManagementPage()
        {
            int i = 0;
            bool found = false;
            while (i < 10 && !found)
            {
                ++i;
                IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labController]"));
                IControl titleSpan = SyncUtilities.FindElement_Parent(labControllerDiv.WebElement, By.CssSelector("span[class='sptitle fl']"));
                if (!Control_PropertyUtilities.IsControlNull(titleSpan) && titleSpan.WebElement.Text.Equals("Manage Laboratories", StringComparison.InvariantCultureIgnoreCase))
                {
                    return true;
                }
                Thread.Sleep(1000);
            }
            return found;
        }

       public static IControl NormalizeLabDataLink
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@id='LabMgmt_Normalization_link']/a"));
            }
        }

       public static IControl LabManagementLink
       {
           get
           {
               return SyncUtilities.FindElement(By.XPath("//*[@id='LabMgmt_Manage_Labs_link']/a"));
            }
       }
        public static IControl LabmangementDescription
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[contains(text(),'Manage Labs, Run Normalization.')]"));
            }

        }
        //*[text()="You cannot run normalization as there is no study published."]
        public static IControl Normalization_NoStudyMessage
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@id='RunNorm_lblNoLabsNotification']"));
            }
        }
        public static IControl MessageOnLabManagementPage
        {
            get
            {
               return SyncUtilities.FindElement(By.XPath("//*[@id='MainAjaxManagerSU']/following::span[1]"));
            }
        }

        public static IControl MessageOnRunNormalizationPage
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("RunNorm_lblNoLabsNotification"));
            }
        }
    }
}