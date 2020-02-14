using Framework.Actions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pages.DataLabs.Study.EditPreferences;
using System.Reflection;
using Reports.DebugLog;

namespace BusinessProcesses.DataLabs.Study.EditPreferences
{
    public class BP_Study_EditPreferences_PatientDataEventingUtilities
    {
        public static bool SetEndPointURL(string EndpointURL)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Study_EditPreferences_PatientDataEventingPage.EndPointURL, EndpointURL, "Unable to set the Endpoint URL " + EndpointURL + "");
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool RemoveEndPointURL()
        {
            try
            {
                DL_Study_EditPreferences_PatientDataEventingPage.EndPointURL.WebElement.Clear();
                return true;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
