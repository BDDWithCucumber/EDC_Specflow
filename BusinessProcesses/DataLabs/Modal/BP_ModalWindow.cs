using Framework.Actions;
using System;
using Utilities;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_ModalWindow
    {
        public static bool ClickContinue(String titleText, String bodyMessageText_Partial)
        {
            BrowserUtilities.SwitchToFrame();
            bool isClicked = false;
            if (IsModalExist_CheckHeaderTextAndBodyMessage(titleText, bodyMessageText_Partial))
            {
                isClicked = Control_ActionUtilities.ClickModalButton(DL_ModalWindow.ContinueButton);
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        public static bool ClickOk(String titleText, String bodyMessageText)
        {
            BrowserUtilities.SwitchToFrame();
            bool isClicked = false;
            if (IsModalExist_VerifyHeaderTextAndBodyMessage(titleText, bodyMessageText))
            {
                isClicked = Control_ActionUtilities.ClickModalButton(DL_ModalWindow.ContinueButton);
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        public static bool ClickCancel(String titleText, String bodyMessageText_Partial)
        {
            BrowserUtilities.SwitchToFrame();
            bool isClicked = false;
            try
            {
                if (IsModalExist_CheckHeaderTextAndBodyMessage(titleText, bodyMessageText_Partial))
                {
                    isClicked = Control_ActionUtilities.ClickModalButton(DL_ModalWindow.CancelButton);
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                isClicked = false;
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        internal static bool IsModalExist_CheckHeaderText(String titleText)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(DL_ModalWindow.Header).Trim());
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        internal static bool IsModalExist_CheckBodyMessage(String bodyMessageText_Partial)
        {
            try
            {
                return Control_PropertyUtilities.GetText(DL_ModalWindow_ResetSession.Message).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickYesButton(String title)
        {
            BrowserUtilities.SwitchToFrame();
            bool isClicked = false;
            try
            {
                if (IsModalExist_CheckHeaderText(title))
                {
                    isClicked = Control_ActionUtilities.ClickModalButton(DL_ModalWindow.YesButton);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                isClicked = false;
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;

        }

        public static bool ClickContinue(String title)
        {
            return ClickYesButton(title);
        }

        public static bool IsModalExist_CheckHeaderTextAndBodyMessage(String titleText, String bodyMessageText_Partial)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(DL_ModalWindow.Header).Trim()) &&
                Control_PropertyUtilities.GetText(DL_ModalWindow.Message).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsModalExist_VerifyHeaderTextAndBodyMessage(String titleText, String bodyMessageText)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(DL_ModalWindow.Header).Trim()) &&
                Control_PropertyUtilities.GetText(DL_ModalWindow.Message).Contains(bodyMessageText);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        internal static bool IsRadModalExist_CheckHeaderText(String titleText)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(DL_RadModalWindow.Header).Trim());
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickSaveButton(String title)
        {
            BrowserUtilities.SwitchToFrame();
            bool isClicked = false;
            try
            {
                if (!IsRadModalExist_CheckHeaderText(title))
                {
                    isClicked = Control_ActionUtilities.ClickModalButton(DL_ModalWindow.SaveButton);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                isClicked = false;
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;

        }
    }
}