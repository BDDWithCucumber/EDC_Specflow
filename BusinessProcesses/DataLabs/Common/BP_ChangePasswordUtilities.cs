using Framework.Actions;
using Pages.DataLabs.UserPreferences;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_ChangePasswordUtilities
    {
        public static bool SetCurrentPassword(string currentPassword)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_ChangePasswordPage.CurrentPasswordTextbox, currentPassword,String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetNewPassword(string newPassword)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_ChangePasswordPage.NewPasswordTextbox, newPassword, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetRetypePassword(string newPassword)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_ChangePasswordPage.RetypePasswordTextbox, newPassword, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_ChangePasswordPage.SaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
