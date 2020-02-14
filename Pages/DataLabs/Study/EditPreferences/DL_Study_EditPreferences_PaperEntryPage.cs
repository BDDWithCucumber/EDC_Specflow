using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Study.EditPreferences
{
    public class DL_Study_EditPreferences_PaperEntryPage
    {
        public static IControl Checkbox_EnablePaperDataEntry { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_chkEnablePaperDataEntry")); } }

        public static IControl Checkbox_AllowOneUserToComplete { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_chkPDEAllowOneUserBothEntries")); } }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnSave")); } }
    }
}