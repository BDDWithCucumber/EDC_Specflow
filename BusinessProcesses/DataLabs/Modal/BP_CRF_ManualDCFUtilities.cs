using Framework.Actions;
using Pages.DataLabs.Data;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_CRF_ManualDCFUtilities
    {
        public static bool SetDCFDetails(CRF_New_ManualDCFData dcfDetails)
        {
            BrowserUtilities.SwitchToFrame();
            bool retVal = false;
            try
            {
                retVal = Control_ActionUtilities.Dropdown_SelectItem(DL_ModalWindow_ManualDCF.DCFStatusDropdown, dcfDetails.DCFStatus, String.Empty) &&
                    Control_ActionUtilities.Textbox_SetText(DL_ModalWindow_ManualDCF.QueryDescriptionTextArea, dcfDetails.QueryDescription, String.Empty) &&
                    Control_ActionUtilities.Textbox_SetText(DL_ModalWindow_ManualDCF.ActionResultTextArea, dcfDetails.ActionRequest, String.Empty);  
                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool ClickSave()
        {
            BrowserUtilities.SwitchToFrame();
            bool retVal = false;
            try
            {
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_ManualDCF.SaveButton);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool ClickCancel()
        {
            BrowserUtilities.SwitchToFrame();
            bool retVal = false;
            try
            {
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_ManualDCF.CancelButton);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }
        public static bool SetCategoryDropdown(CRF_New_ManualDCFData dcfDetails)
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                if (dcfDetails.Category != null)
                {
                    retVal = Control_ActionUtilities.Dropdown_SelectItem(DL_ModalWindow_AnswerDCF.SelectCategoryDropdown, dcfDetails.Category, "Unable to select the Category dropdown " + dcfDetails.Category);
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);

            }

            BrowserUtilities.SwitchToWindow();
            return retVal;
        }
        public static bool SetCategoryStatusDropdown(CRF_New_ManualDCFData dcfDetails)
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                if (dcfDetails.Category != null)
                {
                    retVal = Control_ActionUtilities.Dropdown_SelectItem(DL_ModalWindow_AnswerDCF.SelectCategoryStatusDropdown, dcfDetails.CategoryStatus, "Unable to select the Category dropdown " + dcfDetails.CategoryStatus);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);

            }

            BrowserUtilities.SwitchToWindow();
            return retVal;
        }
    }
}
