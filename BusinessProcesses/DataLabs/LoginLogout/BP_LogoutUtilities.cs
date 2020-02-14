using Framework.Actions;
using Pages.DataLabs.Main;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_LogoutUtilities
    {
        public static bool Logout()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Common_TopBar.LogoutLink, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
