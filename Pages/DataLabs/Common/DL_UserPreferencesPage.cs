using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Common
{
    public class DL_UserPreferencesPage
    {
        public static IControl PortalDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("UserPref_ddlPortalList"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl CompleteChangeHistoryRadioButton { get { return SyncUtilities.FindVisibleElement(By.Id("UserPref_rdoChangeHistoryAll")); } }

        public static IControl BasicChangeHistory { get { return SyncUtilities.FindVisibleElement(By.Id("UserPref_rdoChangeHistorySubmit")); } }

        public static IControl DateTimeFormatDropdown
        {
            get
            {
                IControl dropdown = SyncUtilities.FindVisibleElement(By.Id("UserPref_ddlDateTime"));
                return new Control(dropdown.WebElement, new SelectElement(dropdown.WebElement));
            }
        }
        public static IControl TimeZoneDropdown
        {
            get
            {
                IControl dropdown = SyncUtilities.FindVisibleElement(By.Id("UserPref_ddlTimeZone"));
                return new Control(dropdown.WebElement, new SelectElement(dropdown.WebElement));
            }
        }
        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("UserPref_btnSave")); } }

        public static IControl SaveSuccessMsg { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[@id='tdConfirmMsg']/b[contains(text(), 'Save Successful')]")); } }
    }
}
