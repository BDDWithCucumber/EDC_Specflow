using TechTalk.SpecFlow;
using BusinessProcesses.DataLabs.ManageReferenceRanges;
using Pages.DataLabs.Data;
using TechTalk.SpecFlow.Assist;
using BusinessProcesses.DataLabs.Labs;
using Framework.Actions;

namespace EDC_Automation.Steps.DataLabs.ManageReferenceRanges
{
    [Binding]
    class Steps_MRR_Permissions
    {
        
        [When(@"I open lab with labid ""(.*)"" from Mrr page")]
        public void WhenIOpenLabWithLabidFromMrrPage(string labId)
        {
            if (!BP_LabManagementUtilities.OpenLab(labId))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I open Lab Test named ""(.*)"" from Mrr page")]
        public void WhenIOpenLabTestNamedFromMrrPage(string labTestName)
        {
            if (!BP_MrrCreationUtilities.OpenLabTest(labTestName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see Edit Icon, Copy Icon, Add button, Delete Icon, Delete button aganist each Reference Range record")]
        public void ThenIShouldSeeEditIconCopyIconAddButtonDeleteIconDeleteButtonAganistEachReferenceRangeRecord()
        {
            if (!BP_ManageReferenceRangeUtilities.EditMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see only History Icon")]
        public void ThenIShouldSeeOnlyHistoryIcon()
        {
            if (!BP_ManageReferenceRangeUtilities.EditMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I shouldnot see the buttons Add and Delete")]
        [Then(@"I shouldnot see the buttons Add and Delete in Mrr table of ManageReferenceRanges page")]
        public void ThenIShouldnotSeeTheButtonsAddAndDelete()
        {
            if (!BP_ManageReferenceRangeUtilities.ViewMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the buttons Add new record and Delete in enabled state")]
        public void ThenIShouldSeeTheButtonsAddNewRecordAndDeleteInEnabledState()
        {
            if (!BP_ManageReferenceRangeUtilities.EditMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the ""(.*)"" icon in disabled state")]        
        [Then(@"I shouldnot see the ""(.*)"" icon")]
        [Then(@"I shouldnot see the ""(.*)"" icon for Reference Range records in Mrr table of ManageReferenceRanges page")]
        public void ThenIShouldSeeTheIconInDisabledState(string actionicon)
        {
            if (!BP_ManageReferenceRangeUtilities.ActionIconsInViewMode(actionicon))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the ""(.*)"" icon in enabled state")]
        [Then(@"I should see the ""(.*)"" icon in enabled state for Reference Range record in Mrr table of ManageReferenceRanges page")]
        public void ThenIShouldSeeTheIconInEnabledState(string actionicon)
        {
            if (!BP_ManageReferenceRangeUtilities.ActionIconsInEditMode(actionicon))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see blank Manage Reference Ranges screen with message ""(.*)""")]
        public void ThenIShouldSeeBlankManageReferenceRangesScreenWithMessage(string MRR_Message)
        {
            if (!BP_ManageReferenceRangeUtilities.VerifyText(MRR_Message))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }         

    }
}
