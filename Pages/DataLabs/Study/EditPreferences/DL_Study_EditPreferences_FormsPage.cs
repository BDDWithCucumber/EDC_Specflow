using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;


namespace Pages.DataLabs.Study.EditPreferences
{
    public class DL_Study_EditPreferences_FormsPage
    {
        public static IControl DefaultSaveDropDown { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_ddlItemLevelSubmitDefaultSave")); } }
        public static IControl DefaultSave { get { return new Control(DefaultSaveDropDown.WebElement, new SelectElement(DefaultSaveDropDown.WebElement)); } }
    }
}
