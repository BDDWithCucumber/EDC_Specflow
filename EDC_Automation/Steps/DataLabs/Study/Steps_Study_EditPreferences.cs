using BusinessProcesses.DataLabs.Study.EditPreferences;
using System;
using TechTalk.SpecFlow;
using EDC_Automation.Helpers;


namespace EDC_Automation.Steps.DataLabs.Study
{
    [Binding]
    public class Steps_Study_EditPreferences
    {
        [When(@"I open tab ""(.*)"" in StudyEditPreferencesPage")]
        public void WhenIOpenTabInStudyEditPreferencesPage(String tabName)
        {
            if (!BP_Study_EditPreferencesUtilities.OpenTab(tabName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I check checkbox ""(.*)"" in StudyEditPreferencesDCFsPage")]
        public void WhenICheckCheckboxInStudyEditPreferencesPage(String checkboxName)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.CheckCheckbox(checkboxName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I uncheck checkbox ""(.*)"" in StudyEditPreferencesDCFsPage")]
        public void WhenIUncheckCheckboxInStudyEditPreferencesPage(String checkboxName)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.UncheckCheckbox(checkboxName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click SaveButton in StudyEditPreferencesDCFsPage")]
        public void WhenIClickSaveButtonInStudyEditPreferencesDCFsPage()
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter text ""(.*)"" in FieldLabelTextbox1 in StudyEditPreferencesDCFsPage")]
        public void WhenIEnterTextInFieldLabelTextbox1InStudyEditPreferencesDCFsPage(String text)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.EnterTextInFieldLabel1(text))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I enter text ""(.*)"" in FieldLabelTextbox2 in StudyEditPreferencesDCFsPage")]
        public void WhenIEnterTextInFieldLabelTextbox2InStudyEditPreferencesDCFsPage(String text)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.EnterTextInFieldLabel2(text))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ActiveRadioButton1 in StudyEditPreferencesDCFsPage")]
        public void WhenIClickActiveRadioButton1InStudyEditPreferencesDCFsPage()
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.ClickActiveRadioButton1())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click ActiveRadioButton2 in StudyEditPreferencesDCFsPage")]
        public void WhenIClickActiveRadioButton2InStudyEditPreferencesDCFsPage()
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.ClickActiveRadioButton2())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click InactiveRadioButton1 in StudyEditPreferencesDCFsPage")]
        public void WhenIClickInactiveRadioButton1InStudyEditPreferencesDCFsPage()
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.ClickInactiveRadioButton1())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click InactiveRadioButton2 in StudyEditPreferencesDCFsPage")]
        public void WhenIClickInactiveRadioButton2InStudyEditPreferencesDCFsPage()
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.ClickInactiveRadioButton2())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I enter text ""(.*)"" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage")]
        public void WhenIEnterTextInAddNewItemTextbox1InStudyEditPreferencesDCFsPage(String text)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.EnterTextInAddNewItem1Textbox(text))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I enter text ""(.*)"" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage")]
        public void WhenIEnterTextInAddNewItemTextbox2InStudyEditPreferencesDCFsPage(String text)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.EnterTextInAddNewItem2Textbox(text))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click AddButton1 in StudyEditPreferencesDCFsPage")]
        public void WhenIClickAddButton1InStudyEditPreferencesDCFsPage()
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.ClickAddButton1())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click AddButton2 in StudyEditPreferencesDCFsPage")]
        public void WhenIClickAddButton2InStudyEditPreferencesDCFsPage()
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.ClickAddButton2())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I check checkbox EnablePaperDataEntry in StudyEditPreferencesPaperEntryPage")]
        public void WhenICheckCheckboxEnablePaperDataEntryInStudyEditPreferencesPaperEntryPage()
        {
            if (!BP_Study_EditPreferences_PaperEntryUtilities.CheckEnablePaperDataEntryCheckbox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I check checkbox AllowOneUserBothTheEntries in StudyEditPreferencesPaperEntryPage")]
        public void WhenICheckCheckboxAllowOneUserBothTheEntriesInStudyEditPreferencesPaperEntryPage()
        {
            if (!BP_Study_EditPreferences_PaperEntryUtilities.CheckAllowOneUserBothTheEntriesCheckbox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I uncheck checkbox AllowOneUserBothTheEntries in StudyEditPreferencesPaperEntryPage")]
        public void WhenIUncheckCheckboxAllowOneUserBothTheEntriesInStudyEditPreferencesPaperEntryPage()
        {
            if (!BP_Study_EditPreferences_PaperEntryUtilities.UncheckAllowOneUserBothTheEntriesCheckbox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }       

        [When(@"I click save button in StudyEditPreferencesPaperEntryPage")]
        public void WhenIClickSaveButtonInStudyEditPreferencesPaperEntryPage()
        {
            if (!BP_Study_EditPreferences_PaperEntryUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter DCFDescriptionReplacement text ""(.*)"" in StudyEditPreferencesDCFsPage")]
        public void WhenIEnterDCFDescriptionReplacementTextInStudyEditPreferencesDCFsPage(String dcfDescriptionReplacementText)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.SetDCFDescriptionReplacementText(dcfDescriptionReplacementText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select item ""(.*)"" in EditPreferencesItemList1 in StudyEditPreferencesDCFsPage")]
        public void WhenISelectItemInEditPreferencesItemListInStudyEditPreferencesDCFsPage(String item)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.SelectItemInItemList1(item))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Remove1 button in StudyEditPreferencesDCFsPage")]
        public void WhenIClickRemoveButtonInStudyEditPreferencesDCFsPage()
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.ClickRemove1Button())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I remove item ""(.*)"" in EditPreferencesItemList1 in StudyEditPreferencesDCFsPage")]
        public void WhenIRemoveItemInEditPreferencesItemListInStudyEditPreferencesDCFsPage(String itemName)
        {
            if (!BP_Study_EditPreferences_DCFsUtilities.RemoveItemFromList1(itemName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the ""(.*)"" for Default Save: in StudyEditPreferencesFormsPage.")]
        public void WhenISelectTheForDefaultSaveInStudyEditPreferencesFormsPage(string DefaultSaveOption)
        {
            if (!BP_Study_EditPreferences_FormsUtilities.DefaultSaveOptionSelect(DefaultSaveOption))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I update the endpoint URL under Patient Data Eventing tab\.")]
        public void WhenIUpdateTheEndpointURLUnderPatientDataEventingTab_()
        {
            if (!BP_Study_EditPreferences_PatientDataEventingUtilities.SetEndPointURL(ConfigurationHelper.ODMEndpointURL))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter the value ""(.*)"" for the Endpoint URL field.")]
        public void WhenIEnterTheValueForTheEndpointURLField(string EndpointURL=null)
        {
            if (EndpointURL == null)
            {
                EndpointURL = ConfigurationHelper.ODMEndpointURL;

            }
            if (!BP_Study_EditPreferences_PatientDataEventingUtilities.SetEndPointURL(EndpointURL))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }
        [When(@"I click ""(.*)"" button on the Edit Preferences page.")]
        public void WhenIClickButtonOnTheEditPreferencesPage(string ButtontoSelect)
        {
            if(!BP_Study_EditPreferencesUtilities.SelectButton(ButtontoSelect))
            ScenarioContext.Current["ActResult"] = "Failed";
        }
        [When(@"I remove the endpoint URL under Patient Data Eventing tab\.")]
        public void WhenIRemoveTheEndpointURLUnderPatientDataEventingTab_()
        {
            if (!BP_Study_EditPreferences_PatientDataEventingUtilities.RemoveEndPointURL())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}
