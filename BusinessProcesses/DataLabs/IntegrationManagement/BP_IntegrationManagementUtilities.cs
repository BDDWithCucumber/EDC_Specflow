using Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pages.DataLabs.IntegrationManagement;
using Framework.Actions;
using Pages.DataLabs.Data;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.IntegrationManagement
{
    public class BP_IntegrationManagementUtilities
    {
        public static bool SelectAddPatientSourceSystem(string SourceSystemName)
        {
            try
            {
                IControl RadioOption = DL_GeneralConfigurations.SourceSystemRadio(SourceSystemName);
                if (!Control_PropertyUtilities.IsControlNull(RadioOption))
                {
                    return Control_ActionUtilities.Click(RadioOption, "Unable to select '" + SourceSystemName + "' radio option.");
                }
                else
                {
                    return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool EnterWebServiceURLValue(string WebServiceURL)
        {
            try
            {
                IControl WebServiceURLFld = DL_GeneralConfigurations.WebServiceURL;
                if(!Control_PropertyUtilities.IsControlNull(WebServiceURLFld))
                {
                    return Control_ActionUtilities.Textbox_SetText(WebServiceURLFld, WebServiceURL, "Unable to set Web Service URL in the field.");
                }
                else { return false; }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickButtonOnGeneralConfigurationsPage(string ButtonName)
        {
            try
            {
                IControl Button;
                if(ButtonName.ToUpper() == "SAVE")
                {
                    Button = DL_GeneralConfigurations.SaveButton;
                }
                else
                {
                    Button = DL_GeneralConfigurations.CancelButton;
                }
                return Control_ActionUtilities.Click(Button, "Unable to click '" + ButtonName + "' on General Configurations page.");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectEventOnPatientIdentifiersPageAndWait(string EventToSelect)
        {
            try
            {
                IControl EventField = DL_DefinePatientIdentifiers.EventSelectionDropdown;
                if(!Control_ActionUtilities.Dropdown_SelectItem(EventField, EventToSelect, "Unable to select " + EventToSelect + " from Event dropdown."))
                {
                    return false;
                }
                IControl FormsLoadSection = DL_DefinePatientIdentifiers.FormsLoaded;
                if(FormsLoadSection != null && FormsLoadSection.WebElement != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ExpandOrCollapseFormInPatientIdentifiersPage(string CRFName)
        {
            try
            {
                IControl Icon = DL_DefinePatientIdentifiers.CRFExpandCollapseIcon(CRFName);
                if(Control_PropertyUtilities.IsControlNull(Icon))
                {
                    return false;
                }
                return Control_ActionUtilities.Click(Icon, "Unable to click expand/collapse icon of '" + CRFName + "' form.");
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickButtonOnDefinePatientIdentifiersPage(string ButtonName)
        {
            try
            {
                IControl Button;
                if (ButtonName.ToUpper() == "SAVE")
                {
                    Button = DL_DefinePatientIdentifiers.SaveButton;
                }
                else if(ButtonName.ToUpper() == "SAVE & NEXT")
                {
                    Button = DL_DefinePatientIdentifiers.SaveAndNextButton;
                }
                else
                {
                    Button = DL_DefinePatientIdentifiers.CancelButton;
                }
                return Control_ActionUtilities.Click(Button, "Unable to click '" + ButtonName + "' on General Configurations page.");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectDefaultAsYesForQuestions(List<DefinePatientIdentifiers> QuestionsData, out List<string> FailedQuestions)
        {
            FailedQuestions = new List<string>();
            bool isSuccess = true;
            try
            {
                foreach (DefinePatientIdentifiers DataItem in QuestionsData)
                {
                    IControl DefaultDropdown = DL_DefinePatientIdentifiers.DefaultDropdownForQuestionInCRF(DataItem.QuestionPrompt);
                    if(Control_PropertyUtilities.IsControlNull(DefaultDropdown))
                    {
                        isSuccess = false;
                    }
                    if(!Control_ActionUtilities.Dropdown_SelectItem(DefaultDropdown, "Yes", "Unable to select Yes in Default dropdown for question prompt '" + DataItem.QuestionPrompt + "'."))
                    {
                        FailedQuestions.Add(DataItem.QuestionPrompt);
                        isSuccess = false;
                    }
                }
                return isSuccess;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
