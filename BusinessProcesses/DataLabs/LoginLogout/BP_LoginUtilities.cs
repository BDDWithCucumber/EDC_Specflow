using Framework.Actions;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using Pages.DataLabs.Login;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_LoginUtilities
    {
        public static bool Login(String browserType, String url, String userName, String password)
        {
            try
            {
                BrowserUtilities.LaunchBrowser(browserType, url);
                Control_ActionUtilities.Textbox_SetText(DL_LoginPage.UserNameTextbox, userName, "Unable to set user name in LoginPage");
                Control_ActionUtilities.Textbox_SetText(DL_LoginPage.PasswordTextbox, password, "Unable to set password in LoginPage");
                Control_ActionUtilities.Click_PerssEnterKey(DL_LoginPage.LoginButton, "Unable to click login button in LoginPage");
                BrowserUtilities.SwitchToFrame();
                Control_ActionUtilities.ClickModalButton(DL_ActivityLogWindow.CloseButton);
                BrowserUtilities.SwitchToWindow();
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool LoginInExistingPage(String userName,String password)
        {
            try
            {
                Control_ActionUtilities.Textbox_SetText(DL_LoginPage.UserNameTextbox, userName, "Unable to set user name in LoginPage");
                Control_ActionUtilities.Textbox_SetText(DL_LoginPage.PasswordTextbox, password, "Unable to set password in LoginPage");
                Control_ActionUtilities.Click_PerssEnterKey(DL_LoginPage.LoginButton, "Unable to click login button in LoginPage");
                BrowserUtilities.SwitchToFrame();
                Control_ActionUtilities.ClickModalButton(DL_ActivityLogWindow.CloseButton);
                BrowserUtilities.SwitchToWindow();
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }

        public static bool IsInLoginPage()
        {
            return !Control_PropertyUtilities.IsControlNull(DL_LoginPage.UserNameTextbox) &&
                !Control_PropertyUtilities.IsControlNull(DL_LoginPage.PasswordTextbox) &&
                !Control_PropertyUtilities.IsControlNull(DL_LoginPage.LoginButton);
        }
    }
}