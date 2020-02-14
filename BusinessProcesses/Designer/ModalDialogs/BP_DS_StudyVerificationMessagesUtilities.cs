using Framework.Actions;
using Interfaces;
using Pages.Designer.Data;
using Pages.Designer.ModelDialog;
using Pages.Designer.StudyVerificationMessages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.ModalDialogs
{
    public class BP_DS_StudyVerificationMessagesUtilities
    {
        public static bool VerifyWarnings(List<StudyVerificationWarningsData> warningsList)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                foreach (StudyVerificationWarningsData warning in warningsList)
                {
                    IControl warningLink = DS_StudyVerificationMessagesDialog.GetWarningLink(warning.Warning);
                    if (Control_PropertyUtilities.IsControlNull(warningLink))
                    {
                        return false;
                    }
                }
                Control_ActionUtilities.Click(StudyVerificationMessagesPopup.Close, "Unable to click Close button");
                BrowserUtilities.SwitchToWindow();
                return true;

            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool VerifyErrors(List<StudyVerificationErrorsData> errorsList)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                foreach (StudyVerificationErrorsData error in errorsList)
                {
                    IControl errorLink = DS_StudyVerificationMessagesDialog.GetErrorLink(error.Error);
                    if (Control_PropertyUtilities.IsControlNull(errorLink))
                    {
                        return false;

                    }
                }
                Control_ActionUtilities.Click(StudyVerificationMessagesPopup.Close, "Unable to click Close button");
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool VerifyErrorWarnings(List<StudyVerificationErrorsData> errorsList)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                foreach (StudyVerificationErrorsData error in errorsList)
                {
                    IControl errorLink = DS_StudyVerificationMessagesDialog.GetErrorLink(error.Error);
                    if (Control_PropertyUtilities.IsControlNull(errorLink))
                    {
                        return false;

                    }
                }
                Control_ActionUtilities.Click(StudyVerificationMessagesPopup.Close, "Unable to click Close button");
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool NotDisplayErrors(List<StudyVerificationErrorsData> errorsList)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                foreach (StudyVerificationErrorsData error in errorsList)
                {
                    IControl errorLink = DS_StudyVerificationMessagesDialog.GetErrorLinkToVerify(error.Error);
                    if (!Control_PropertyUtilities.IsControlNull(errorLink))
                    {
                        return false;
                    }
                }
                //Control_ActionUtilities.Click(StudyVerificationMessagesPopup.Close, "Unable to click Close button");
                BrowserUtilities.SwitchToWindow();
                return true;
            }

            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ClickWarning(String warning)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl warningLink = DS_StudyVerificationMessagesDialog.GetWarningLink(warning);
                Control_ActionUtilities.Click(warningLink, "Unable to click warning " + warning);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool ClickError(String error)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl errorLink = DS_StudyVerificationMessagesDialog.GetErrorLink(error);
                Control_ActionUtilities.Click(errorLink, "Unable to click error " + error);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }
    }
}