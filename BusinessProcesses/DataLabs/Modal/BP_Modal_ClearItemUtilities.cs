using Framework.Actions;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_ClearItemUtilities
    {
        public static bool EnterNotes(String notes)
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                retVal = Control_ActionUtilities.Textbox_SetText(DL_ModalWindow_ClearItem.NotesTextArea, notes, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool ClickOkButton()
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_ClearItem.OkButton);
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