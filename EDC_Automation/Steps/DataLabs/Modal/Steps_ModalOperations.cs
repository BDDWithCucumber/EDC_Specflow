using BusinessProcesses.DataLabs.Modal;
using BusinessProcesses.DataLabs.Patients;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Modal
{
    [Binding]
    class Steps_ModalOperations
    {
        [Then(@"I see changehistory details in ChangeHistoryModal")]
        public void ThenISeeChangehistoryDetailsInChangeHistoryModal(Table table)
        {
            IEnumerable<CRF_ItemChangeHistoryData> dataList = table.CreateSet<CRF_ItemChangeHistoryData>();
            if (!BP_Modal_ItemChangeHistoryUtilities.VerifyChangeHistory((List<CRF_ItemChangeHistoryData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click cancel button in ChangeHistoryModal")]
        [When(@"I click cancel button in ChangeHistoryModal")]
        [Given(@"I click cancel button in ChangeHistoryModal")]
        public void ThenIClickCancelButtonInChangeHistoryModal()
        {
            if (!BP_Modal_ItemChangeHistoryUtilities.ClickCloseButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ok button of Modal ""(.*)""")]
        public void WhenIClickOkButtonOfModal(string modalDialogTitle)
        {
            if (!BP_ModalWindow.ClickContinue(modalDialogTitle))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Yes button in ModalDialog ""(.*)""")]
        public void WhenIClickYesButtonInModalDialog(String modalDialogTitle)
        {
            if (!BP_ModalWindow.ClickYesButton(modalDialogTitle))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Yes button in ResetCRFModalDialog")]
        public void WhenIClickYesButtonInResetCRFModalDialog()
        {
            if (!BP_Modal_ResetCRFUtilities.ClickYesButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter reason ""(.*)"" in ResetCRFModalDialog")]
        public void WhenIEnterReasonInResetCRFModalDialog(string reason)
        {
            if (!BP_Modal_ResetCRFUtilities.EnterReason(reason))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Continue button in ResetCRFModalDialog")]
        public void WhenIClickContinueButtonInResetCRFModalDialog()
        {
            if (!BP_Modal_ResetCRFUtilities.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ClearItem for the flat question ""(.*)""")]
        public void WhenIClickClearItemForTheFlatQuestion(String questionPrompt)
        {
            if (!BP_CRF_QuestionCommentsUtilities.InvokeClearItem(questionPrompt))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter notes ""(.*)"" in ClearItemModalDialog")]
        public void WhenIEnterNotesInClearItemModalDialog(String notes)
        {
            if (!BP_Modal_ClearItemUtilities.EnterNotes(notes))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ok button in ClearItemModalDialog")]
        public void WhenIClickOkButtonInClearItemModalDialog()
        {
            if (!BP_Modal_ClearItemUtilities.ClickOkButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select reason for change ""(.*)"" in DeleteTableRowModalDialog")]
        public void WhenISelectReasonForChangeInDeleteTableRowModalDialog(String reason)
        {
            if (!BP_Modal_DeleteTableRowUtilities.SetReasonForChange(reason))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter additional notes ""(.*)"" in DeleteTableRowModalDialog")]
        public void WhenIEnterAdditionalNotesInDeleteTableRowModalDialog(String additionalNotes)
        {
            if (!BP_Modal_DeleteTableRowUtilities.SetAdditionalNotes(additionalNotes))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click continue button in DeleteTableRowModalDialog")]
        public void WhenIClickContinueButtonInDeleteTableRowModalDialog()
        {
            if (!BP_Modal_DeleteTableRowUtilities.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select reason for change ""(.*)"" in RestoreTableRowModalDialog")]
        public void WhenISelectReasonForChangeInRestoreTableRowModalDialgo(String reason)
        {
            if (!BP_Modal_RestoreTableRowUtilities.SetReasonForChange(reason))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter additional notes ""(.*)"" in RestoreTableRowModalDialog")]
        public void WhenIEnterAdditionalNotesInRestoreTableRowModalDialog(String additionalNotes)
        {
            if (!BP_Modal_RestoreTableRowUtilities.SetAdditionalNotes(additionalNotes))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click continue button in RestoreTableRowModalDialog")]
        public void WhenIClickContinueButtonInRestoreTableRowModalDialog()
        {
            if (!BP_Modal_RestoreTableRowUtilities.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter comment ""(.*)"" in AddCommentModalDialog")]
        public void WhenIEnterCommentInAddCommentModalDialog(String comment)
        {
            if (!BP_Modal_AddCommentUtilities.EnterComment(comment))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in AddCommentModalDialog")]
        public void WhenIClickSaveButtonInAddCommentModalDialog()
        {
            if (!BP_Modal_AddCommentUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see lab data in LabInformationModalDialog")]
        public void ThenISeeLabDataInLabInformationModalDialog(Table table)
        {
            if (!BP_Modal_LabInformationUtilities.VerifyLabInfo(table.CreateInstance<LabData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click close button in LabInformationModalDialog")]
        public void ThenIClickCloseButtonInLabInformationModalDialog()
        {
            if (!BP_Modal_LabInformationUtilities.ClickCloseButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"I invoke table hisotry for table ""(.*)""")]
        public void WhenIInvokeTableHisotryForTable(String tableName)
        {
            if (!BP_CRF_IconUtilities.InvokeTableHistory(tableName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see table history for table ""(.*)"" in TableHistoryModalDialog")]
        public void ThenISeeTableHistoryForTableInTableHistoryModalDialog(String tableName, Table table)
        {
            if (!BP_Modal_TableHistoryUtilities.VerifyTableChangeHistory(tableName, (List<CRF_TableHistoryData>)table.CreateSet<CRF_TableHistoryData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see ordered table history for table ""(.*)"" in TableHistoryModalDialog")]
        public void ThenISeeOrderedTableHistoryForTableInTableHistoryModalDialog(String tableName, Table table)
        {
            if (!BP_Modal_TableHistoryUtilities.VerifyTableChangeHistoryInOrder(tableName, (List<CRF_TableHistoryData>)table.CreateSet<CRF_TableHistoryData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }

        [Then(@"I close TableHistoryModalDialog")]
        public void ThenICloseTableHistoryModalDialog()
        {
            if (!BP_Modal_TableHistoryUtilities.ClickCloseButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
