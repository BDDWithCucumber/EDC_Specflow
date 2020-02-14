using Framework.Actions;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_CRF_AnswerDCFUtilities
    {
        public static bool EnterResponse(String response)
        {
            bool retVal = false;
            try
            {
                BrowserUtilities.SwitchToFrame();
                retVal = Control_ActionUtilities.Textbox_SetText(DL_ModalWindow_AnswerDCF.ResponseTextArea, response, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool ClickSaveButton()
        {
            bool retVal = false;
            try
            {
                BrowserUtilities.SwitchToFrame();
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_AnswerDCF.SaveButton);
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