using Framework.Actions;
using Interfaces;
using Pages.Designer.ModelDialog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.ModalDialogs
{
    public class BP_DS_LabMappingsSpecificationDialog
    {
        public static bool IsLabMappingsSpecificationDialogExist(String title, String message)
        {
            try
            {

                IControl titleControl = DS_LabMappingsSpecificationDialog.Title;
                if (!Control_PropertyUtilities.IsControlNull(titleControl) &&
                    Control_PropertyUtilities.GetText(titleControl).Contains(title))
                {
                    BrowserUtilities.DS_SwitchToFrame();
                    IControl messageControl = DS_LabMappingsSpecificationDialog.Message;
                    if (!Control_PropertyUtilities.IsControlNull(messageControl) &&
                        Control_PropertyUtilities.GetText(messageControl).Contains(message))
                    {
                        BrowserUtilities.SwitchToWindow();
                        return true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ClickContinueButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToFrame();
                bool isClicked = Control_ActionUtilities.Click(DS_LabMappingsSpecificationDialog.ContinueButton, String.Empty);
                BrowserUtilities.SwitchToWindow();
                return isClicked;
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool StudyPublishContinueButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToFrame();
                bool isClicked = Control_ActionUtilities.Click(DS_LabMappingsSpecificationDialog.StudyPublishContinue, String.Empty);
                BrowserUtilities.SwitchToWindow();
                return isClicked;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool IsCreateStudyFromExistingDialogExist(String title)
        {
            try
            {
                IControl titleControl = DS_LabMappingsSpecificationDialog.Title;
                if (!Control_PropertyUtilities.IsControlNull(titleControl) &&
                    Control_PropertyUtilities.GetText(titleControl).Contains(title))
                {
                    return true;
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }
}
