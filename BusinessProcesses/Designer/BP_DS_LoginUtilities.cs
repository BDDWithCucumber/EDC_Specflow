using Framework.Actions;
using Pages.Designer.Login;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer
{
    public class BP_DS_LoginUtilities
    {
        public static bool Login(String browserType, String url, String userName, String password)
        {
            try
            {
                BrowserUtilities.LaunchBrowser(browserType, url);
                Control_ActionUtilities.Textbox_SetText(DS_LoginPage.UserNameTextBox, userName, "Unable to set user name in LoginPage");
                Control_ActionUtilities.Textbox_SetText(DS_LoginPage.PasswordTextBox, password, "Unable to set password in LoginPage");
                Control_ActionUtilities.Click_PerssEnterKey(DS_LoginPage.LoginButton, "Unable to click login button in LoginPage");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }
        public static bool Login_prompt_download_false(String browserType, String url, String userName, String password)
        {
            try
            {
                BrowserUtilities.LaunchBrowser_prompt_download_false(browserType, url);
                Control_ActionUtilities.Textbox_SetText(DS_LoginPage.UserNameTextBox, userName, "Unable to set user name in LoginPage");
                Control_ActionUtilities.Textbox_SetText(DS_LoginPage.PasswordTextBox, password, "Unable to set password in LoginPage");
                Control_ActionUtilities.Click_PerssEnterKey(DS_LoginPage.LoginButton, "Unable to click login button in LoginPage");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return true;
        }
    }
}
