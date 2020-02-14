using Framework.Actions;
using Pages.WebFocus;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.WebFocus
{
   public class BP_wf_LoginUtilities
    {
        public static bool wf_Login(String browserType, String url, String userName, String password)
        {
            try
            {
                BrowserUtilities.LaunchBrowser(browserType, url);
                Control_ActionUtilities.Textbox_SetText(wf_Page_Login.UserNameTextbox, userName, "Unable to set user name in LoginPage");
                Control_ActionUtilities.Textbox_SetText(wf_Page_Login.PasswordTextbox, password, "Unable to set password in LoginPage");
                Control_ActionUtilities.Click_PerssEnterKey(wf_Page_Login.LoginButton, "Unable to click login button in LoginPage");

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
