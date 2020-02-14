using System;
using System.Collections.ObjectModel;
using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Main.CRF
{
    public class DL_CRF_PDEP_EventsPage
    {
        public static IControl EventsTable { get { return SyncUtilities.FindVisibleElement(By.Id("tblEvents")); } }

        public static ReadOnlyCollection<IControl> GetRowsEventRows(String identifier)
        {
            identifier = identifier.Replace("Events", "Forms");
            String cssSelector = "tr[identifier='" + identifier + "']";
            return SyncUtilities.FindElements_Parent(EventsTable.WebElement, By.CssSelector(cssSelector));
        }

        public static IControl GetFormLink(IControl formCell)
        {
            return SyncUtilities.FindElement_Parent(formCell.WebElement, By.TagName("a"));
        }

        public static IControl GetIcon(IControl cell)
        {
            return SyncUtilities.FindElement_Parent(cell.WebElement, By.TagName("img"));
        }
    }
}