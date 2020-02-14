using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_ResetCRFUtilities
    {
        public static bool ClickYesButton()
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                IControl modalHeaderLabel = DL_ModalWindow_ResetCRF.TitleLabel_Step1;
                if (!Control_PropertyUtilities.IsControlNull(modalHeaderLabel))
                {
                    String headerText = Control_PropertyUtilities.GetText(modalHeaderLabel);
                    if (headerText.Equals("Reset Form", StringComparison.InvariantCultureIgnoreCase))
                    {
                        retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_ResetCRF.YesButton);
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool EnterReason(String reason)
        {
            try
            {
                bool retVal = false;
                BrowserUtilities.SwitchToFrame();
                try
                {
                    IControl modalHeaderLabel = DL_ModalWindow_ResetCRF.TitleLabel_Step2;
                    if (!Control_PropertyUtilities.IsControlNull(modalHeaderLabel))
                    {
                        String headerText = Control_PropertyUtilities.GetText(modalHeaderLabel);
                        if (headerText.Equals("Reset Form", StringComparison.InvariantCultureIgnoreCase))
                        {
                            retVal = Control_ActionUtilities.Textbox_SetText(DL_ModalWindow_ResetCRF.ReasonTextArea, reason, String.Empty);
                        }
                    }
                }
                catch (Exception e)
                {
                    new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                }
                BrowserUtilities.SwitchToWindow();
                return retVal;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickContinueButton()
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                IControl modalHeaderLabel = DL_ModalWindow_ResetCRF.TitleLabel_Step2;
                if (!Control_PropertyUtilities.IsControlNull(modalHeaderLabel))
                {
                    String headerText = Control_PropertyUtilities.GetText(modalHeaderLabel);
                    if (headerText.Equals("Reset Form", StringComparison.InvariantCultureIgnoreCase))
                    {
                        retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_ResetCRF.ContinueButton);
                    }
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
