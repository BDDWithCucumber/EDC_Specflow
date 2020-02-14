using Framework.Actions;
using System;
using Utilities;
using Pages.DataLabs.Modal;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_ResetSession
    {
        public static bool ClickContinue(String bodyMessageText_Partial)
        {
            BrowserUtilities.SwitchToFrame();
            bool isClicked = false;
            if (BP_ModalWindow.IsModalExist_CheckBodyMessage(bodyMessageText_Partial))
            {
                isClicked = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_ResetSession.ContinueButton);
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }        
    }
}