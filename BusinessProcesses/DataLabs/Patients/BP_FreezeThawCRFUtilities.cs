using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Pages.DataLabs.Data;
using Reports.DebugLog;
using Pages.DataLabs.Patients;
using Framework.Actions;
using Interfaces;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_FreezeThawCRFUtilities
    {
        public static bool SelectFreezeThawCheckbox(List<RequestSignatureData> eventFormList, string checkboxName)
        {
            bool isSuccess = false;
            try
            {
                foreach (RequestSignatureData eventFormData in eventFormList)
                {
                    if (!SelectFreezeThawCheckboxEventForm(eventFormData.EventName, eventFormData.FormName, checkboxName))
                    {
                        return false;
                    }
                    else
                    {
                        isSuccess = true;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return isSuccess;
        }
        static bool SelectFreezeThawCheckboxEventForm(String eventName, String formName, string checkboxName)
        {
            try
            {
                IControl checkbox = DL_FreezeThawCRFs.GetFreezeThawCheckboxForForm(eventName, formName, checkboxName);
                if (!Control_PropertyUtilities.IsControlNull(checkbox))
                {
                    return Control_ActionUtilities.CheckCheckbox(checkbox);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectFreezeThawButton(String buttonName)
        {
            try
            {
                switch (buttonName.ToUpper())
                {
                    case "FREEZE":
                        return Control_ActionUtilities.Click(DL_FreezeThawCRFs.freezeButton, "Unable to Select the Freeze button");
                    case "THAW":
                        return Control_ActionUtilities.Click(DL_FreezeThawCRFs.thawButton, "Unable to Select the Thaw button");
                    case "CANCEL":
                        return Control_ActionUtilities.Click(DL_FreezeThawCRFs.cancelButton, "Unable to Select the Cancel button");
                    case "SELECT ALL":
                        return Control_ActionUtilities.Click(DL_FreezeThawCRFs.selectAllButton, "Unable to Select the Select All button");
                    case "CLEAR ALL":
                        return Control_ActionUtilities.Click(DL_FreezeThawCRFs.selectAllButton, "Unable to Select the Clear All button");
                }
                    
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
