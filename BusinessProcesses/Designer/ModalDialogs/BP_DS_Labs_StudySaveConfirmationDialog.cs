using Framework.Actions;
using Interfaces;
using Pages.Designer.ModelDialog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.Designer.ModalDialogs
{
    public class BP_Labs_DialogBase
    {
        public static bool ISDialogExist(String title, String message)
        {
            try
            {
                IControl titleControl = DS_Labs_StudySaveConfirmationDialog.Title;
                if (!Control_PropertyUtilities.IsControlNull(titleControl) &&
                    Control_PropertyUtilities.GetText(titleControl).Contains(title))
                {
                    IControl messageControl = DS_Labs_StudySaveConfirmationDialog.Message;
                    if (!Control_PropertyUtilities.IsControlNull(messageControl) &&
                        Control_PropertyUtilities.GetText(messageControl).Contains(message))
                    {
                        return true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }

    public class BP_DS_Labs_StudySaveConfirmationDialog : BP_Labs_DialogBase
    {
        public static bool ClickContinueButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Labs_StudySaveConfirmationDialog.ContinueButton, "Unable to click continue button");
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }

    public class BP_DS_Labs_StudyVerifyDialog : BP_DS_Labs_StudySaveConfirmationDialog
    {

    }

    public class BP_DS_Labs_MapLabDictionaryErrorDialog : BP_Labs_DialogBase
    {        
        public static bool ClickOKButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Labs_MapLabDictionaryErrorDialog.OkButton, String.Empty);
            }
            catch(Exception e)
            {

            }
            return false;
        }
    }

    public class BP_DS_Labs_MapLabDictionary_RRCheckboxWarningDialog : BP_Labs_DialogBase
    {
        //DS_Labs_MapLabDictionary_RRCheckboxWarningDialog
        public static bool ClickContinueButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Labs_MapLabDictionary_RRCheckboxWarningDialog.ContinueButton, String.Empty);
            }
            catch(Exception e)
            {

            }
            return false;
        }
    }

    public class BP_DS_Labs_MapLabDictionary_EditSelectedErrorDialog : BP_Labs_DialogBase
    {
        public static bool ClickOkButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Labs_MapLabDictionary_EditSelectedErrorDialog.OkButton, String.Empty);
            }
            catch(Exception e)
            {

            }
            return false;
        }
    }

    public class BP_DS_Labs_MapLabDictionary_Update_DuplicateMappingsDialog : BP_DS_Labs_MapLabDictionary_EditSelectedErrorDialog
    {
    }

    public class BP_DS_Labs_MapLabDictionary_Update_NomappingsDialog : BP_DS_Labs_MapLabDictionary_EditSelectedErrorDialog
    {
    }

    public class BP_DS_Labs_MapLabDictionay_Update_RRChekboxWarningDialog : BP_DS_Labs_StudySaveConfirmationDialog
    {

    }

    public class BP_DS_Labs_MapLabDictionry_DictionayChageDialog : BP_DS_Labs_StudySaveConfirmationDialog
    {

    }

    public class BP_DS_Study_TargetAppDialog : BP_DS_Labs_StudySaveConfirmationDialog
    {

    }
}
