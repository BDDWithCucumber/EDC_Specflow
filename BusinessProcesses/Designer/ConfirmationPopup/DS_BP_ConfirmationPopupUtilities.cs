using Framework.Actions;
using Pages.Designer;
using Pages.Designer.ConfirmationPopup;
using Pages.Designer.ModelDialog;
using Pages.Designer.StudyVerificationMessages;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.Warningpopup
{
    public class DS_BP_ConfirmationPopupUtilities
    {
        public static bool ClickContinue(String titleText, String bodyMessageText_Partial)
        {
            try
            {
                if (IsModalExist_CheckHeaderTextAndBodyMessage(titleText, bodyMessageText_Partial))
                {
                    BrowserUtilities.DS_SwitchToConfirmationFrame();
                    //check message
                    Control_ActionUtilities.ClickModalButton(DS_ConfirmationPopup.Continue);
                    return BrowserUtilities.SwitchToWindow();
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool IsModalExist_CheckHeaderTextAndBodyMessage(String titleText, String bodyMessageText_Partial)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(DS_ConfirmationPopup.Header).Trim()) &&
                Control_PropertyUtilities.GetText(DS_ConfirmationPopup.ConfirmationMessage).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DeleteJobsContinue(String titleText, String bodyMessageText_Partial)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            bool isClicked = false;
            if (DeleteJobsModalExist_CheckHeaderTextAndBodyMessage(titleText, bodyMessageText_Partial))
            {
                isClicked = Control_ActionUtilities.ClickModalButton(DS_ConfirmationPopup.DeleteJobsContinue);
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        public static bool DeleteJobsModalExist_CheckHeaderTextAndBodyMessage(String titleText, String bodyMessageText_Partial)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(DS_ConfirmationPopup.DeleteJobsHeader).Trim()) &&
                Control_PropertyUtilities.GetText(DS_ConfirmationPopup.DeleteJobsMessage).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyandClickErrorLink(String popupTitle, String errorMessage, String errorLinkName)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            bool isClicked = false;
            if (IsModalExist_CheckHeaderTextAndErrorLinkMessage(popupTitle, errorMessage))
            {
                isClicked = Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(errorLinkName), "Unable to find link " + errorLinkName + " in Designer Home Page");
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        public static bool IsModalExist_CheckHeaderTextAndErrorLinkMessage(String titleText, String bodyMessageText_Partial)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(StudyVerificationMessagesPopup.SVRMessagesHeader).Trim()) &&
                Control_PropertyUtilities.GetText(StudyVerificationMessagesPopup.SVRMessagesErrorLinkMessage).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
