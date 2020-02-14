using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Inbox
{
    public class DL_InboxPage
    {
        public static IControl GetActionPaletteItemToInvoke(IControl actionPaletteGroup, String actionPaletteItemName)
        {
            ReadOnlyCollection<IControl> tdList = SyncUtilities.FindVisibleElements_Parent(actionPaletteGroup.WebElement, By.TagName("td"));
            if (tdList.Count > 0)
            {
                foreach (IControl td in tdList)
                {
                    if (td.WebElement.Text.Contains(actionPaletteItemName))
                    {
                        return SyncUtilities.FindVisibleElement_Parent(td.WebElement, By.TagName("span"));
                    }
                }
            }
            return null;
        }
        public static IControl InboxTable
        {
            get
            {
                return SyncUtilities.FindElement(By.ClassName("Inbox"));
            }
        }
    }
}
