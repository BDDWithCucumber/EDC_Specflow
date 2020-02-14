using Utilities;
using OpenQA.Selenium;
using Interfaces;
using Framework.Actions;
using System.Collections.ObjectModel;
using System.Threading;
using System;
using Common;
using OpenQA.Selenium.Support.UI;

namespace Pages.DataLabs.ManageReferenceRanges
{
    public class DL_Lab_ManageReferenceRanges
    {
       
        public static IControl Delete_Button { get { return SyncUtilities.FindVisibleElement(By.Name("DeleteButton")); } }

        public static IControl ManageReferenceRanges
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//h3[contains(text(), 'Manage Reference Ranges')]"));
            }
        }

        public static IControl RRLabTestName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//h4[contains(text(), 'Lab Test (Name)')]"));
            }
        }

        public static IControl ReferenceRanges_Searchbox { get { return SyncUtilities.FindVisibleElement(By.Id("searchLabTestInput")); } }
        public static IControl ReferenceRangesListBox { get { return new Control(ReferenceRangesTests.WebElement, new SelectElement(ReferenceRangesTests.WebElement)); } }
        public static IControl ReferenceRangesTests { get { return SyncUtilities.FindVisibleElement(By.XPath("//*[@id='leftpanel']/ul")); } }

        public static IControl LabTestOnHeader
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("span[class='Vijaya Diagnostics(101LAB), Diagnostics, Health&Science']")); ;
            }
        }

        public static IControl LabTest_Name
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//*[@id='bodyCol']/div[2]/div/div[1]/span/h3/span"));
            }
        }

        public static IControl NoRecordsToDisplayDiv
        {
            get
            {
                IControl mRRDisplayDiv = SyncUtilities.FindVisibleElement(By.CssSelector("div[ng-app='labApp']"));
                IControl mRRDiv = SyncUtilities.FindVisibleElement_Parent(mRRDisplayDiv.WebElement, By.CssSelector("div[ng-controller='labMainController']"));
                IControl gridDiv = SyncUtilities.FindVisibleElement_Parent(mRRDiv.WebElement, By.Id("grid"));
                IControl tableHostDiv = SyncUtilities.FindVisibleElement_Parent(gridDiv.WebElement, By.CssSelector(".k-grid-content.k-auto-scrollable"));
                return SyncUtilities.FindVisibleElement_Parent(tableHostDiv.WebElement, By.ClassName("k-grid-norecords"));
            }
        }

        public static IControl LabsTable
        {
            get
            {
                if (IsInLabManagementPage())
                {
                    IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                    IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labMainController]"));
                    IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                    IControl tableHost = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-content.k-auto-scrollable"));
                    return SyncUtilities.FindVisibleElement_Parent(tableHost.WebElement, By.TagName("table"));
                }
                return null;
            }
        }

        public static IControl LabTestsTable
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
                    IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labMainController]"));
                    IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                    return SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-pager-wrap.k-grid-pager.k-widget.k-floatwrap"));
                }
                return null;
            }
        }

        public static ReadOnlyCollection<IControl> GetHeaderRows()
        {
            if (IsInLabManagementPage())
            {
                IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labMainController]"));
                IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                IControl headerHost = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-header"));
                IControl header = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.TagName("thead"));
                return SyncUtilities.FindVisibleElements_Parent(header.WebElement, By.TagName("tr"));
            }
            return null;
        }

        public static ReadOnlyCollection<IControl> GetLabsTestHeaderRows()
        {
                IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labMainController]"));
                IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                IControl headerHost = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-header"));
                IControl header = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.TagName("thead"));
                return SyncUtilities.FindVisibleElements_Parent(header.WebElement, By.TagName("tr"));
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

        public static IControl LabsTestGridTitleRow
        {
            get
            {
                ReadOnlyCollection<IControl> headerRows = GetLabsTestHeaderRows();
                if (headerRows != null && headerRows.Count > 0)
                {
                    return headerRows[0];
                }
                return null;
            }
        }

        public static IControl FilterTextBox
        {
            get
            {
                IControl inputTextField = SyncUtilities.FindVisibleElement(By.CssSelector("input[class=k-textbox]"));

                if (!Control_PropertyUtilities.IsControlNull(inputTextField))
                {
                    return inputTextField;
                }
                return null;
            }

        }

        public static IControl LabsTestGridFilterRow
        {
            get
            {
                ReadOnlyCollection<IControl> headerRows = GetLabsTestHeaderRows();
                if (headerRows != null && headerRows.Count > 1)
                {
                    return headerRows[1];
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
                //IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                //IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labMainController]"));
                IControl titleSpan = SyncUtilities.FindVisibleElement(By.CssSelector(".sptitle.fl"));
                if (!Control_PropertyUtilities.IsControlNull(titleSpan) && titleSpan.WebElement.Text.Equals("Manage Reference Ranges", StringComparison.InvariantCultureIgnoreCase))
                {
                    return true;
                }
            }
            return found;
        }

        public static IControl LabsTestTable
        {
            get
            {
                    IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                    IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labMainController]"));
                    IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                    IControl tableHost = SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-grid-content.k-auto-scrollable"));
                    return SyncUtilities.FindVisibleElement_Parent(tableHost.WebElement, By.TagName("table"));
            }
        }

        public static IControl PageNav
        {
            get
            {
                    IControl labAppDiv = SyncUtilities.FindElement(By.CssSelector("div[ng-app=labApp]"));
                    IControl labControllerDiv = SyncUtilities.FindElement_Parent(labAppDiv.WebElement, By.CssSelector("div[ng-controller=labMainController]"));
                    IControl grid = SyncUtilities.FindVisibleElement_Parent(labControllerDiv.WebElement, By.CssSelector("div#grid.k-grid.k-widget"));
                    return SyncUtilities.FindVisibleElement_Parent(grid.WebElement, By.CssSelector("div.k-pager-wrap.k-grid-pager.k-widget.k-floatwrap"));
            }
        }
    }
}
