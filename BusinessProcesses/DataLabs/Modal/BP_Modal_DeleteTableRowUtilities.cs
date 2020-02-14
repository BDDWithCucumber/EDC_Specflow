using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_DeleteTableRowUtilities
    {
        public static bool VerifyDeleteTableRowTitle()
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                IControl titleLabel = DL_ModalWindow_DeleteTableRow.TitleLabel;
                retVal = Control_PropertyUtilities.GetText(titleLabel).Equals("Delete Table Row", StringComparison.InvariantCultureIgnoreCase);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool SetReasonForChange(String reason)
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                retVal = Control_ActionUtilities.Dropdown_SelectItem(DL_ModalWindow_DeleteTableRow.ReasonForChangeDropdown, reason, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public  static bool SetAdditionalNotes(String additionalNotes)
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                retVal = Control_ActionUtilities.Textbox_SetText(DL_ModalWindow_DeleteTableRow.AdditionalNotesTextArea, additionalNotes, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool ClickContinueButton()
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_DeleteTableRow.ContinueButton);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }
        
    }
}
