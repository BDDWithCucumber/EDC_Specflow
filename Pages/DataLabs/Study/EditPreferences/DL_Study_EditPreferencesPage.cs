using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Study.EditPreferences
{
    public class DL_Study_EditPreferencesPage
    {
        public static IControl GetTabHeader(String headerText)
        {
            IControl host = SyncUtilities.FindVisibleElement(By.Id("editPrefTabs"));
            ReadOnlyCollection<IControl> headerList = SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.TagName("li"));
            foreach (IControl c in headerList)
            {
                IControl link = SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("a"));
                String linkText = Control_PropertyUtilities.GetText(link);
                if(headerText.Equals(linkText, StringComparison.InvariantCultureIgnoreCase))
                {
                    return link;
                }
            }
            return null;
        }
        public static IControl SaveButtonEditPreferences { get { return SyncUtilities.FindVisibleElement(By.Id("btnSave")); } }
        public static IControl CancelButtonEditPreferences { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_btnCancel")); } }

    }
}
