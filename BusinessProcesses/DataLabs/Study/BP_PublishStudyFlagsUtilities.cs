using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Study;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Study
{
    public class BP_PublishStudyFlagsUtilities
    {
        public static bool SetFlagOrSignatureValue(String radioButtonText, String flagOrSignatureText)
        {
            try
            {
                IControl radioButton = DL_PublishStudyFlagsPage.GetRadioButton(radioButtonText, flagOrSignatureText);
                if (radioButton != null)
                {
                    return Control_ActionUtilities.Click(radioButton, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetReasonForNotChangingFlagOrSignature(String reason)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_PublishStudyFlagsPage.ReasonTextbox, reason, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickContinueButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_PublishStudyFlagsPage.ContinueButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickCancelButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_PublishStudyFlagsPage.CancelButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}