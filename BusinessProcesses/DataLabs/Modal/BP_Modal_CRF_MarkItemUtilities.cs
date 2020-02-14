using Framework.Actions;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_CRF_MarkItemUtilities
    {
        public static bool EnterComment(String comment)
        {
            BrowserUtilities.SwitchToFrame();
            bool retVal = false;
            try
            {
                retVal = Control_ActionUtilities.Textbox_SetText(DL_ModalWindow_CRF_MarkItem.CommentTextArea, comment, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool ClickOkButton()
        {
            BrowserUtilities.SwitchToFrame();
            bool retVal = false;
            try
            {
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_CRF_MarkItem.OkButton);
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
