using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pages.DataLabs.FlagManagement;
using Framework.Actions;
using Reports.DebugLog;
using System.Reflection;
using Pages.DataLabs.Data;
using Interfaces;

namespace BusinessProcesses.DataLabs.FlagManagement
{
    public class BP_FlagManagementUtilities
    {
        public static bool ClickSelectSitesDropdown { get; private set; }
        public static bool SelectFlagPlanTypeOnFlagManagement(string FlagType)
        {
            try
            {
                return Control_ActionUtilities.Click(DL_FlagManagementPage.GetFlagTypeLink(FlagType), "Unable to select '" + FlagType + "' on Flag Management page.");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickAddPlanButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_CreateFlagPlanPage.AddPlanButton, "Unable to click Add Plan button to add a new plan.");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool EnterFlagPlanNameAndLabel(string PlanName, string PlanLabel)
        {
            bool ValEntered = true;
            try
            {
                if (!Control_ActionUtilities.Textbox_SetText(DL_CreateFlagPlanPage.PlanNameTextBox, PlanName, "Unable to enter Plan Name in the input field on Create Plan page."))
                {
                    ValEntered = false;
                }
                if (!Control_ActionUtilities.Textbox_SetText(DL_CreateFlagPlanPage.PlanLabelTextBox, PlanLabel, "Unable to enter Plan Label in the input field on Create Plan page."))
                {
                    ValEntered = false;
                }
                return ValEntered;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickButtonOnCreatePlanPage(string ButtonNameToClick)
        {
            try
            {
                switch (ButtonNameToClick.ToUpper())
                {
                    case "NEXT":
                        return Control_ActionUtilities.Click(DL_CreateFlagPlanPage.NextButton, "Unable to click Next button on the page.");
                    case "CANCEL":
                        return Control_ActionUtilities.Click(DL_CreateFlagPlanPage.CancelButton, "Unable to click Cancel button on the page.");
                    case "SAVE & CLOSE":
                        return Control_ActionUtilities.Click(DL_CreateFlagPlanPage.SaveCloseButton, "Unable to click Save & Close button");
                    case "BACK":
                        return Control_ActionUtilities.Click(DL_CreateFlagPlanPage.BackButton, "Unable to click Back button");
                    case "GET PATIENTS":
                        return Control_ActionUtilities.Click(DL_FlagManagementPage.GetPatientsButton, "Unable to click Get Patients button");
                    case "SAVE":
                        return Control_ActionUtilities.Click(DL_FlagManagementPage.SaveButton, "Unable to select Save button");
                    default:
                        return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool EnterFlagDataGroupNameAndLabel(string GroupName, string GroupLabel)
        {
            bool ValEntered = true;
            try
            {
                if (!Control_ActionUtilities.Textbox_SetText(DL_CreateFlagDataGroupPage.FlagDataGroupName, GroupName, "Unable to enter Data Group Name in the input field on Create Flag Data Group page."))
                {
                    ValEntered = false;
                }
                if (!Control_ActionUtilities.Textbox_SetText(DL_CreateFlagDataGroupPage.FlagDataGroupLabel, GroupLabel, "Unable to enter Data Grouup Label in the input field on Create Flag Data Group page."))
                {
                    ValEntered = false;
                }
                return ValEntered;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectExpandAllIcon()
        {
            try
            {
                if (!Control_ActionUtilities.MouseClick(DL_CreateFlagDataGroupPage.ExpandAllIcon, "Unable to select the Expand all icon on the Flag DataGroup Page"))
                {
                    return false;
                }
                else
                {
                    return true;
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectChkBoxesInCreateDataGroup(List<FlagManagementData> ItemsToSelect, out List<string> FailedItems)
        {
            bool isSuccess = true;
            FailedItems = new List<string>();
            try
            {
                if (SelectExpandAllIcon())
                {

                    foreach (FlagManagementData item in ItemsToSelect)
                    {
                        if (String.IsNullOrEmpty(item.QuestionPrompt))
                        {
                            if (!SelectCheckboxForForm(item.FormName, item.ProtocolVersion))
                            {
                                isSuccess = false;
                                FailedItems.Add(item.FormName);
                            }
                        }
                        else
                        {
                            if (!SelectCheckboxForFormQuestion(item.FormName, item.QuestionNum, item.QuestionPrompt, item.ProtocolVersion))
                            {
                                isSuccess = false;
                                FailedItems.Add(item.FormName + "->" + item.QuestionNum + " " + item.QuestionPrompt);
                            }

                        }
                    }
                }
                else
                {
                    return false;
                }
                return isSuccess;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectCheckboxForForm(string FormName, string ProtocolVersion)
        {
            try
            {
                IControl chkBox = DL_CreateFlagDataGroupPage.GetProtocolChkBoxForForm(FormName, ProtocolVersion);
                if (Control_PropertyUtilities.IsControlNull(chkBox))
                {
                    return false;
                }
                return Control_ActionUtilities.CheckCheckbox(chkBox);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectExpandFormIcon(string FormName)
        {
            try
            {
                return Control_ActionUtilities.Click(DL_CreateFlagDataGroupPage.ExpandFormIcon(FormName), "Unable to Select the Form expand icon for " + FormName + "");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectCheckboxForFormQuestion(string FormName, string QuestionNo, string QuestionPrmt, string ProtocolVer)
        {
            try
            {
                IControl chkBox = DL_CreateFlagDataGroupPage.GetProtocolChkBoxForFormQuestion(FormName, QuestionNo, QuestionPrmt, ProtocolVer);
                if (Control_PropertyUtilities.IsControlNull(chkBox))
                {
                    return false;
                }
                return Control_ActionUtilities.CheckCheckbox(chkBox);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ChkOnOrOffSelectAllChkBoxInEventFormRelation(string SelectOnOff)
        {
            try
            {
                if (SelectOnOff.ToUpper() == "ON")
                {
                    return Control_ActionUtilities.UncheckCheckbox(DL_CreateFlagDataGroupPage.GetSelectAllChkBoxInEventFormRelation);
                }
                else if (SelectOnOff.ToUpper() == "OFF")
                {
                    return Control_ActionUtilities.CheckCheckbox(DL_CreateFlagDataGroupPage.GetSelectAllChkBoxInEventFormRelation);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectStudyProtocolTab(string ProtocolTabName)
        {
            try
            {
                return Control_ActionUtilities.Click(DL_CreateFlagDataGroupPage.StudyVersionTab(ProtocolTabName), "Unable to click study protocol version tab.");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ChkOrUnChkSelectAllFormChkBoxInEventFormRelation(List<FlagManagementData> FormsData, out List<string> FailedForms)
        {
            FailedForms = new List<string>();
            bool isSuccess;
            bool areAllFormsSuccess = true;
            try
            {
                foreach (FlagManagementData form in FormsData)
                {
                    if (form.CheckONOrOff.ToUpper() == "ON")
                    {
                        isSuccess = Control_ActionUtilities.CheckCheckbox(DL_CreateFlagDataGroupPage.GetSelectAllChkBoxForFormInEventFormRelation(form.FormName));
                    }
                    else if (form.CheckONOrOff.ToUpper() == "OFF")
                    {
                        isSuccess = Control_ActionUtilities.UncheckCheckbox(DL_CreateFlagDataGroupPage.GetSelectAllChkBoxForFormInEventFormRelation(form.FormName));
                    }
                    else
                    {
                        isSuccess = false;
                    }
                    if (!isSuccess)
                    {
                        FailedForms.Add(form.FormName);
                        areAllFormsSuccess = false;
                    }
                }
                return areAllFormsSuccess;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ChkOrUnChkSelectAllEventChkBoxInEventFormRelation(List<FlagManagementData> EventsData, out List<string> FailedEvents)
        {
            FailedEvents = new List<string>();
            bool isSuccess;
            bool areAllEventsSuccess = true;
            try
            {
                foreach (FlagManagementData eventName in EventsData)
                {
                    if (eventName.CheckONOrOff.ToUpper() == "ON")
                    {
                        isSuccess = Control_ActionUtilities.CheckCheckbox(DL_CreateFlagDataGroupPage.GetSelectAllChkBoxForEventInEventFormRelation(eventName.EventName));
                    }
                    else if (eventName.CheckONOrOff.ToUpper() == "OFF")
                    {
                        isSuccess = Control_ActionUtilities.UncheckCheckbox(DL_CreateFlagDataGroupPage.GetSelectAllChkBoxForFormInEventFormRelation(eventName.EventName));
                    }
                    else
                    {
                        isSuccess = false;
                    }
                    if (!isSuccess)
                    {
                        FailedEvents.Add(eventName.EventName);
                        areAllEventsSuccess = false;
                    }
                }
                return areAllEventsSuccess;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ChkOrUnChkSelectAllEventFormChkBoxInEventFormRelation(List<FlagManagementData> EventFormData, out List<string> FailedEventForms)
        {
            FailedEventForms = new List<string>();
            bool isSuccess;
            bool areAllEventsSuccess = true;
            try
            {
                foreach (FlagManagementData eventFormName in EventFormData)
                {
                    if (eventFormName.CheckONOrOff.ToUpper() == "ON")
                    {
                        isSuccess = Control_ActionUtilities.CheckCheckbox(DL_CreateFlagDataGroupPage.GetChkBoxInFormEventRelation(eventFormName.EventName, eventFormName.FormName));
                    }
                    else if (eventFormName.CheckONOrOff.ToUpper() == "OFF")
                    {
                        isSuccess = Control_ActionUtilities.UncheckCheckbox(DL_CreateFlagDataGroupPage.GetChkBoxInFormEventRelation(eventFormName.EventName, eventFormName.FormName));
                    }
                    else
                    {
                        isSuccess = false;
                    }
                    if (!isSuccess)
                    {
                        FailedEventForms.Add(eventFormName.EventName + "->" + eventFormName.FormName);
                        areAllEventsSuccess = false;
                    }
                }
                return areAllEventsSuccess;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickSaveNCloseButton()
        {
            return Control_ActionUtilities.Click(DL_CreateFlagDataGroupPage.SaveNCloseButton, "Unable to click on Save & Close button.");
        }
        public static bool sampletest()
        {
            bool test = DL_CreateFlagDataGroupPage.SampleHdr();
            return true;
        }
        public static bool SelectFlagDataGroupList(List<FlagManagementData> ItemstoSelect, out List<String> FailedItemsList)
        {
            FailedItemsList = new List<String>();
            bool isSuccess = true;
            bool areAllDGOptions = true;
            string DropdownName = "Select Flag Data Group(s)";
            try
            {
                if (!SelectFlagDataGroupDropdown(DropdownName))
                {
                    return false;
                }
                foreach (FlagManagementData ItemOption in ItemstoSelect)
                {
                    isSuccess = Control_ActionUtilities.Click(DL_CreateFlagPlanPage.GetFlagDataGroupListValue(ItemOption.FlagDataGroup), "Unable to Select the Flag Data Group Option");


                    if (!isSuccess)
                    {
                        FailedItemsList.Add(ItemOption.FlagDataGroup);
                        areAllDGOptions = false;
                    }

                }

                return areAllDGOptions;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return areAllDGOptions;
        }
        public static bool SelectFlagDataGroupDropdown(string DropdownName)
        {
            try
            {
                return Control_ActionUtilities.Click(DL_CreateFlagPlanPage.FlagManagementMultiSelectdropdown, "Unable to Select the Drop down Dropdown -" + DropdownName + ".");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectCheckboxAddRemoveDataGroup(string chkboxOnOff)
        {
            bool isSuccess = true;
            try
            {
                if (chkboxOnOff.ToUpper() == "ON")
                {
                    isSuccess = Control_ActionUtilities.CheckCheckbox(DL_CreateFlagPlanPage.AddRemoveExistingDataGrpChk);
                }
                else if (chkboxOnOff.ToUpper() == "OFF")
                {
                    isSuccess = Control_ActionUtilities.UncheckCheckbox(DL_CreateFlagPlanPage.AddRemoveExistingDataGrpChk);

                }
                return isSuccess;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectCheckboxAddNewFlagDataGroup(string chkboxOnOff)
        {
            bool isSuccess = true;
            try
            {
                if (chkboxOnOff.ToUpper() == "ON")
                {
                    isSuccess = Control_ActionUtilities.CheckCheckbox(DL_CreateFlagPlanPage.AddNewDataGrpChk);
                }
                else if (chkboxOnOff.ToUpper() == "OFF")
                {
                    isSuccess = Control_ActionUtilities.UncheckCheckbox(DL_CreateFlagPlanPage.AddNewDataGrpChk);

                }
                return isSuccess;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectActionOnManageFlagPlanandDataGroupsPage(string ManageActionOnFlag)
        {
            try
            {
                return Control_ActionUtilities.MouseClick(DL_FlagManagementPage.FlagActionOnManage(ManageActionOnFlag), "Unable to Select the Action - " + ManageActionOnFlag + " on Manage Flags & Data Groups page.");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectSelectAllCheckboxinSelectSitesDropdown()
        {
            try
            {
                if (!ClickSelectSitesDropdowninAssignPatient())
                {
                    return false;
                }
                else
                {
                    return Control_ActionUtilities.Click(DL_FlagManagementPage.GetSelectAllSitesinDropdown, "unable to select select-all option");
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickSelectSitesDropdowninAssignPatient()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_FlagManagementPage.SelectSitesDropdown, "unable to click Select Site(s) dropdown");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectSelectAllCheckboxAssignPlanGrid(string CheckboxOnOff)
        {
            try
            {
                if (CheckboxOnOff.ToUpper() == "ON")
                {
                    return Control_ActionUtilities.CheckCheckbox(DL_FlagManagementPage.SelectAllPatientsSitesCheckbox);
                }
                else if (CheckboxOnOff.ToUpper() == "OFF")
                {
                    return Control_ActionUtilities.UncheckCheckbox(DL_FlagManagementPage.SelectAllPatientsSitesCheckbox);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectPlanFromSelectNewPlanDropdown(string AvailablePlan)
        {
            try
            {
                if (AvailablePlan != null)
                {
                    return Control_ActionUtilities.Dropdown_SelectItem(DL_FlagManagementPage.SelectNewPlanDropDown, AvailablePlan, "Unable to select the Plan " + AvailablePlan + " in the Select New Plan dropdown");
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectReasonFromReasonforchangeDropdown(string AvailableReasonforchange)
        {
            try
            {
                if (AvailableReasonforchange != null)
                {
                    return Control_ActionUtilities.Dropdown_SelectItem(DL_FlagManagementPage.ReasonForChangeDropDown, AvailableReasonforchange, "Unable to select the reason " + AvailableReasonforchange + " from the Reason for change dropdown");
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool EnterTextAdditionalNotes(string TexttoEnter)
        {
            try
            {
                if (TexttoEnter != null)
                {
                    return Control_ActionUtilities.Textbox_SetText(DL_FlagManagementPage.AdditionalTextNotes, TexttoEnter, "Unable to enter text " + TexttoEnter + " in the Additional Notes field");
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectPatientRowCheckboxAssignPlanGrid(List<FlagManagementData> ItemstoSelect, out List<String> FailedItemsList)
        {
            bool isSuccess = true;
            bool areAllChckboxSelect = true;
            FailedItemsList = new List<String>();
            //List<string> FailedItemsList = new List<string>();

            try
            {

                foreach (FlagManagementData ItemOptions in ItemstoSelect)
                {
                    if (ItemOptions.PatientID != null)
                    {
                        if (ItemOptions.CheckONOrOff.ToUpper() == "ON")
                        {
                            isSuccess = Control_ActionUtilities.CheckCheckbox(DL_FlagManagementPage.RowCheckBoxAssignGrid(ItemOptions.PatientID));
                        }
                        else if (ItemOptions.CheckONOrOff.ToUpper() == "OFF")
                        {
                            isSuccess = Control_ActionUtilities.UncheckCheckbox(DL_FlagManagementPage.RowCheckBoxAssignGrid(ItemOptions.PatientID));
                        }
                        if (!isSuccess)
                        {
                            FailedItemsList.Add(ItemOptions.PatientID);
                            areAllChckboxSelect = false;
                        }

                    }
                }
                return areAllChckboxSelect;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return areAllChckboxSelect;
        }
        public static bool SelectSiteRowCheckboxAssignPlanGrid(List<FlagManagementData> ItemstoSelect, out List<String> FailedItemsList)
        {
            bool isSuccess = true;
            bool areAllChckboxSelect = true;
            FailedItemsList = new List<String>();
            try
            {

                foreach (FlagManagementData ItemOptions in ItemstoSelect)
                {
                    if (ItemOptions.SiteID != null)
                    {
                        if (ItemOptions.CheckONOrOff.ToUpper() == "ON")
                        {
                            isSuccess = Control_ActionUtilities.CheckCheckbox(DL_FlagManagementPage.RowCheckBoxAssignGrid(ItemOptions.SiteID));
                        }
                        else if (ItemOptions.CheckONOrOff.ToUpper() == "OFF")
                        {
                            isSuccess = Control_ActionUtilities.UncheckCheckbox(DL_FlagManagementPage.RowCheckBoxAssignGrid(ItemOptions.SiteID));
                        }
                        if (!isSuccess)
                        {
                            FailedItemsList.Add(ItemOptions.SiteID);
                            areAllChckboxSelect = false;
                        }
                    }
                }
                return areAllChckboxSelect;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return areAllChckboxSelect;
        }
    }
}
