using BusinessProcesses.DataLabs.Modal;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_SignCasebookUtilities
    {
        public static bool SelectForm(List<SignCasebookData> dataList)
        {
            try
            {
                foreach (SignCasebookData data in dataList)
                {
                    if (!SelectForm(data))
                    {
                        return false;
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool SelectForm(SignCasebookData data)
        {
            try
            {
                IControl radioButton = DL_SignCasebookPage.GetRadioButton(data.EventName, data.FormName, data.RadioButton);
                if (!Control_PropertyUtilities.IsControlNull(radioButton))
                {
                    if (data.RadioButton.Equals("Reject"))
                    {
                        Control_ActionUtilities.Click(radioButton, String.Empty);
                        Control_ActionUtilities.Click(DL_SignCasebookPage.GetAddReasonLink(data.EventName, data.FormName), "Unable to Select Add Reason link for " + data.EventName + "-" + data.FormName);
                        BP_Modal_CRF_MarkItemUtilities.EnterComment(data.AddReason);
                        return BP_Modal_CRF_MarkItemUtilities.ClickOkButton();
                    }
                    else if (!String.IsNullOrEmpty(data.RadioButton))
                    {
                        return Control_ActionUtilities.Click(radioButton, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetUserName(String userName)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_SignCasebookPage.UserNameTextbox, userName, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetPassword(String password)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_SignCasebookPage.PasswordTextbox, password, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSubmitButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_SignCasebookPage.SubmitButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickAcceptAllButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_SignCasebookPage.AcceptAllButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
    }
}