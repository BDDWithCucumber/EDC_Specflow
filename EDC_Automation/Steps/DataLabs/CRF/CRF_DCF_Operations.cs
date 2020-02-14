using BusinessProcesses.DataLabs.Modal;
using BusinessProcesses.DataLabs.Patients.Form;
using Pages.DataLabs.Data;
using Pages.DataLabs.Modal;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.CRF
{
    [Binding]
    class CRF_DCF_Operations
    {
        [When(@"I enter manual DCF details in CreateDCFDialog")]
        public void WhenIEnterManualDCFDetailsInCreateDCFDialog(Table table)
        {
            CRF_New_ManualDCFData dcfDetails = table.CreateInstance<CRF_New_ManualDCFData>();
            if (!BP_CRF_ManualDCFUtilities.SetDCFDetails(dcfDetails))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in CreateDCFDialog")]
        public void WhenIClickSaveButtonInCreateDCFDialog()
        {
            if (!BP_CRF_ManualDCFUtilities.ClickSave())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I open DCFs subtab ""(.*)"" in Form")]
        public void WhenIOpenDCFsSubtabInForm(String dcfSubTab)
        {
            if (!BP_CRF_DCFUtilities.OpenSubTabUnderDCFTab(dcfSubTab))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see DCF details in DCFs subtab in Form")]
        public void ThenISeeDCFDetailsInDCFsSubtabInForm(Table table)
        {
            CRF_DCFTabData data = table.CreateInstance<CRF_DCFTabData>();
            if (!BP_CRF_DCFUtilities.VerifyDCF(data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see workflow items in CRF")]
        public void ThenISeeWorkflowItemsInCRF(Table table)
        {
            IEnumerable<CRF_WorkflowTabData> data = table.CreateSet<CRF_WorkflowTabData>();
            if (!BP_CRF_WorkflowUtilities.VerifyWorkflowItems((List<CRF_WorkflowTabData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the DCF row")]
        public void WhenISelectTheDCFRow(Table table)
        {
            CRF_DCFTabData data = table.CreateInstance<CRF_DCFTabData>();
            if (!BP_CRF_DCFUtilities.OpenDCFRow(data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter response ""(.*)"" in AnswerDCFDialog")]
        public void WhenIEnterResponseInAnswerDCFDialog(String response)
        {
            if (!BP_CRF_AnswerDCFUtilities.EnterResponse(response))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click SaveButton in AnswerDCFDialog")]
        public void WhenIClickSaveButtonInAnswerDCFDialog()
        {
            if (!BP_CRF_AnswerDCFUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see header details in EditDCFPage")]
        public void ThenISeeHeaderDetailsInEditDCFPage(Table table)
        {
            EditDCFPageHeaderData data = table.CreateInstance<EditDCFPageHeaderData>();
            if (!BP_EditDCFPageUtilities.VerifyEditDCFPageHeaderDetails(data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I select category dropdown value as ""(.*)""")]
        public void WhenISelectCategoryDropdownValueAs(string Category)
        {
            CRF_New_ManualDCFData data = new CRF_New_ManualDCFData();
            data.Category = Category;
            if (!BP_CRF_ManualDCFUtilities.SetCategoryDropdown(data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I select category status dropdown value as ""(.*)""")]
        public void WhenISelectCategoryStatusDropdownValueAs(string CategoryStatus)
        {
            CRF_New_ManualDCFData data = new CRF_New_ManualDCFData();
            data.CategoryStatus = CategoryStatus;
            if (!BP_CRF_ManualDCFUtilities.SetCategoryDropdown(data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}