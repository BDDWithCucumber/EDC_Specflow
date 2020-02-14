using Framework.Actions;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_PatientStatusOverrideUtilities
    {
        public static bool SetStatus(String status)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DL_PatientStatusOverridePage.ChangeToDropdown, status, String.Empty);                
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetReasonForChange(String reason)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_PatientStatusOverridePage.ReasonForChangeTextArea, reason, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_PatientStatusOverridePage.SaveButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
