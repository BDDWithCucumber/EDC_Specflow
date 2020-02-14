using Framework.Actions;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_TransferPatientUtilities
    {
        public static bool SetDataToTransaferPatient(PatientTransferData data)
        {
            try
            {
                if (!String.IsNullOrEmpty(data.ToSite))
                {
                    Control_ActionUtilities.Dropdown_SelectItem(DL_TransferPatientPage.ToSiteDropdown, data.ToSite, String.Empty);
                }
                if (!String.IsNullOrEmpty(data.Reason))
                {
                    Control_ActionUtilities.Dropdown_SelectItem(DL_TransferPatientPage.ReasonDropdown, data.Reason, String.Empty);
                }
                if (!String.IsNullOrEmpty(data.AdditionalNotes))
                {
                    Control_ActionUtilities.Textbox_SetText(DL_TransferPatientPage.AdditionalNotesTextArea, data.AdditionalNotes, String.Empty);
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickTransferButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_TransferPatientPage.TransferButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}