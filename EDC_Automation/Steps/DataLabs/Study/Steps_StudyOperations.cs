using System;
using BusinessProcesses.DataLabs.Modal;
using BusinessProcesses.DataLabs.Study;
using TechTalk.SpecFlow;
using EDC_Automation.Steps.DataLabs.DataBase;
using Common;

namespace EDC_Automation.Steps.DataLabs.Study
{
    [Binding]
    class Steps_StudyOperations
    {
        [When(@"I delete study")]
        [Given(@"I delete the current study\.")]
        public void WhenIDeleteStudy()
        {
			SQLInfo Info = DatabaseSteps.StoreSQLInfo();

            if (!BP_StudyUtilities.DeleteStudy(Info))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I upload a study ""(.*)"" with study label ""(.*)""")]
        public void WhenIUploadAStudyWithStudyLabel(String studyFileName, String studyLabel)
        {
            if (!BP_StudyUtilities.UploadAndPublishStudy(studyFileName, studyLabel))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I upload a study ""(.*)"" with study name ""(.*)""")]
        public void WhenIUploadAStudyName(String studyFileName, String studyLabel)
        {
            if (!BP_StudyUtilities.UploadAStudy(studyFileName, studyLabel))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click ok in modal dialog having title ""(.*)"" and message ""(.*)""")]
        public void ThenIClickOkInModalDialogHavingTitleAndMessage(string titleText, string messageText)
        {
            if (!BP_ModalWindow.ClickOk(titleText, messageText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see notes ""(.*)"" in StudyVersionPropertiesPage")]
        [When(@"I see notes ""(.*)"" in StudyVersionPropertiesPage")]
        public void ThenISeeNotesInStudyVersionPropertiesPage(string notes)
        {
            if (!BP_StudyManagementUtilities.IsNotesExistInStudyVersionPropertiesPage(notes))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see PublishStudyFlagsPage")]
        public void ThenISeePublishStudyFlagsPage()
        {
            if (!BP_StudyManagementUtilities.IsPublishStudyFlagPageOpened())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select ""(.*)"" to reevaluate ""(.*)"" in PublishStudyFlagsPage")]
        [Given(@"I select ""(.*)"" to reevaluate ""(.*)"" in PublishStudyFlagsPage")]
        public void WhenISelectToReevaluateInPublishStudyFlagsPage(String radioButtonText, String flagOrSignature)
        {
            if (!BP_PublishStudyFlagsUtilities.SetFlagOrSignatureValue(radioButtonText, flagOrSignature))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I clicked Continue button in PublishStudyFlagsPage")]
        public void WhenIClickedContinueButtonInPublishStudyFlagsPage()
        {
            if (!BP_PublishStudyFlagsUtilities.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see PublishStudyPage")]
        public void ThenISeePublishStudyPage()
        {
            if (!BP_StudyManagementUtilities.IsPublishStudyPageOpened())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select patient migration option ""(.*)"" in PublishStudyPage")]
        public void WhenISelectPatientMigrationOptionInPublishStudyPage(String patientMaigrationOption)
        {
            if (!BP_PublishStudyPage_MajorStudyUpdateUtilities.SetPatientMigrateOption(patientMaigrationOption))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Publish button in PublishStudyPage")]
        public void WhenIClickPublishButtonInPublishStudyPage()
        {
            if (!BP_PublishStudyPage_MajorStudyUpdateUtilities.ClickPublishButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Publish button for Minor study update in PublishStudyPage")]
        public void WhenIClickPublishButtonForMinorStudyUpdateInPublishStudyPage()
        {
            if (!BP_PublishStudyPage_MajorStudyUpdateUtilities.ClickPublishButton_MinorUpdate())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select scripting ""(.*)"" in PublishStudyPage of MinorStudyUpdate")]
        public void WhenISelectScriptingInPublishStudyPageOfMinorStudyUpdate(string scriptingType)
        {
            if (!BP_PublishStudyPage_MinorStudyUpdateUtilities.SelectScriptingCheckboxToRun(scriptingType))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Publish button in PublishStudyPage of MinorStudyUpdate")]
        public void WhenIClickPublishButtonInPublishStudyPageOfMinorStudyUpdate()
        {
            if (!BP_PublishStudyPage_MinorStudyUpdateUtilities.ClickPublishButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}