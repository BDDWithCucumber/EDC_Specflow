using BusinessProcesses.DataLabs.Patients;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Patient
{
    [Binding]
    public class Steps_RequestSignature 
    {
        [When(@"I select Request checkbox for below forms in RequestSignaturePage")]
        public void WhenISelectRequestCheckboxForBelowFormsInRequestSignaturePage(Table table)
        {
            IEnumerable<RequestSignatureData> dataList = table.CreateSet<RequestSignatureData>();
            if (!BP_RequestSignatureUtilities.SelectRequestCheckbox((List<RequestSignatureData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I Unselect Request checkbox for below forms in RequestSignaturePage")]
        public void WhenIUnselectRequestCheckboxForBelowFormsInRequestSignaturePage(Table table)
        {
            IEnumerable<RequestSignatureData> dataList = table.CreateSet<RequestSignatureData>();
            if (!BP_RequestSignatureUtilities.UnselectRequestCheckbox((List<RequestSignatureData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Submit button in RequestSignaturePage")]
        public void WhenIClickOnSubmitButtonInRequestSignaturePage()
        {
            if (!BP_RequestSignatureUtilities.ClickSubmitButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Select All button in RequestSignaturePage")]
        public void WhenIClickOnSelectAllButtonInRequestSignaturePage()
        {
            if (!BP_RequestSignatureUtilities.ClickRequestSignatureSelectAll())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select radio button for below forms in SignCasebookPage")]
        public void WhenISelectRadioButtonForBelowFormsInSignCasebookPage(Table table)
        {
            IEnumerable<SignCasebookData> dataList = table.CreateSet<SignCasebookData>();
            if (!BP_SignCasebookUtilities.SelectForm((List<SignCasebookData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I given username as ""(.*)"" in SignCasebookPage")]
        public void WhenIGivenUsernameAsInSignCasebookPage(String userName)
        {
            if (!BP_SignCasebookUtilities.SetUserName(userName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I given password as ""(.*)"" in SignCasebookPage")]
        public void WhenIGivenPasswordAsInSignCasebookPage(String password)
        {
            if (!BP_SignCasebookUtilities.SetPassword(password))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Submit button in SignCasebbokPage")]
        public void WhenIClickOnSubmitButtonInSignCasebbokPage()
        {
            if (!BP_SignCasebookUtilities.ClickSubmitButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on Accept All button in SignCasebookPage")]
        public void WhenIClickOnAcceptAllButtonInSignCasebookPage()
        {
            if (!BP_SignCasebookUtilities.ClickAcceptAllButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        //To do
        [Then(@"I see success message ""(.*)""")]
        public void ThenISeeSuccessMessage(String successMessage)
        {
        }

        [Then(@"I see signature info bar ""(.*)"" in CRF")]
        public void ThenISeeSignatureInfoBarInCRF(String signatureText)
        {

        }


    }
}
