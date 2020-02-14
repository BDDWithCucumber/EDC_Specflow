using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.UserPreferences
{
    public class DL_ChangePasswordPage
    {
        public static IControl CurrentPasswordTextbox { get { return SyncUtilities.FindVisibleElement(By.Id("UserPrefChgPwd_txtCurrentPassword")); } }

        public static IControl NewPasswordTextbox { get { return SyncUtilities.FindVisibleElement(By.Id("UserPrefChgPwd_txtNewPassword")); } }

        public static IControl RetypePasswordTextbox { get { return SyncUtilities.FindVisibleElement(By.Id("UserPrefChgPwd_txtRetypePassword")); } }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("UserPrefChgPwd_btnSave")); } }

        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector("input[type=button][name=UserPrefChgPwd$ctl21][class=btnNormal]")); } }

    }
}