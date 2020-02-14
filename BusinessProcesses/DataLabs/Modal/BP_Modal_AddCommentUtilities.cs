using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_AddCommentUtilities
    {
        public static bool EnterComment(String comment)
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                IControl titleLabel = DL_ModalWindow_AddComment.TitleLabel;
                if (Control_PropertyUtilities.GetText(titleLabel).Equals("Add Comment", StringComparison.InvariantCultureIgnoreCase))
                {
                    retVal = Control_ActionUtilities.Textbox_SetText(DL_ModalWindow_AddComment.CommetnsTextArea, comment, String.Empty);
                }
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
            BrowserUtilities.SwitchToFrame();
            try
            {
                IControl titleLabel = DL_ModalWindow_AddComment.TitleLabel;
                if (Control_PropertyUtilities.GetText(titleLabel).Equals("Add Comment", StringComparison.InvariantCultureIgnoreCase))
                {
                    retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_AddComment.SaveButton);
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
