using BusinessProcesses.DataLabs.Modal;
using BusinessProcesses.DataLabs.Patients;
using BusinessProcesses.DataLabs.Patients.Form;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.CRF
{
    [Binding]
    class CRF_Comments_Operations
    {
        [When(@"I add commnet to a flat question")]
        public void WhenIAddCommnetToAFlatQuestion(Table table)
        {
            IEnumerable<AddCommentsForQuestion> data = table.CreateSet<AddCommentsForQuestion>();
            if (!BP_CRF_QuestionCommentsUtilities.AddCommentsToFlatQuestionsInCRF((List<AddCommentsForQuestion>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I do not see comments in comments tab")]
        public void ThenIDoNotSeeCommentsInCommentsTab()
        {
            if (!BP_CRF_CommentsTabUtilities.IsNoDataFoundMessageAvailable())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter form level comment ""(.*)"" in CommentsDialog")]
        public void WhenIEnterFormLevelCommentInCommentsDialog(String comment)
        {
            if (!BP_CRF_FormCommentsModalUtilities.EnterComment(comment))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in FormCommentModalaDialog")]
        public void WhenIClickSaveButtonInFormCommentModalaDialog()
        {
            if (!BP_CRF_FormCommentsModalUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see comments in comments tab")]
        public void ThenISeeCommentsInCommentsTab(Table table)
        {
            IEnumerable<CRF_CommentsData> data = table.CreateSet<CRF_CommentsData>();
            if (!BP_CRF_CommentsTabUtilities.VerifyComments((List<CRF_CommentsData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}