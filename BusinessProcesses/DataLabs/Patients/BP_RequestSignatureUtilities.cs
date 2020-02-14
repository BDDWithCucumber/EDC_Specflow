using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_RequestSignatureUtilities
    {
        public static bool SelectRequestCheckbox(List<RequestSignatureData> eventFormList)
        {
            try
            {
                foreach (RequestSignatureData eventFormData in eventFormList)
                {
                    if(!SelectRequestCheckbox(eventFormData.EventName, eventFormData.FormName))
                    {
                        return false;
                    }                        
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool SelectRequestCheckbox(String eventName,String formName)
        {
            try
            {
                IControl checkbox = DL_RequestSignaturePage.GetRequestCheckboxForForm(eventName, formName);
                if (!Control_PropertyUtilities.IsControlNull(checkbox))
                {
                    return Control_ActionUtilities.CheckCheckbox(checkbox);
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool UnselectRequestCheckbox(List<RequestSignatureData> eventFormList)
        {
            bool isSelected = true;
            try
            {
                foreach (RequestSignatureData eventFormData in eventFormList)
                {
                    if (!UnselectRequestCheckbox(eventFormData.EventName, eventFormData.FormName))
                    {
                        isSelected = false;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return isSelected;
        }

        static bool UnselectRequestCheckbox(String eventName, String formName)
        {
            try
            {
                IControl checkbox = DL_RequestSignaturePage.GetRequestCheckboxForForm(eventName, formName);
                if (!Control_PropertyUtilities.IsControlNull(checkbox))
                {
                    return Control_ActionUtilities.UncheckCheckbox(checkbox);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSubmitButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_RequestSignaturePage.SubmitButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickRequestSignatureSelectAll()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_RequestSignaturePage.SelectAllButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}