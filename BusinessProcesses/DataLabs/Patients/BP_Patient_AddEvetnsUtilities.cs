using Framework.Actions;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_Patient_AddEvetnsUtilities
    {
        public static bool ClickPublishButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Patient_AddEvetnsPage.PublishButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
