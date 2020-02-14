using BusinessProcesses.DataLabs.Modal;
using EDC_Automation.Helpers;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Modal
{
    [Binding]
    class Steps_QueriesResultOperations
    {
        [Given(@"I verify queries under queries type ""(.*)"" in Modal ""(.*)""")]
        [Then(@"I verify queries under queries type ""(.*)"" in Modal ""(.*)""")]
        public void GivenIVerifyQueriesUnderQueriesTypeInModal(String queriesType, String title, Table table)
        {
            if(!BP_CRF_QueriesModalUtilities.CheckQueriesInQuerisModal(title,queriesType, TableHelper.GetValuesFromColumn(table, 0)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Continue button of Modal ""(.*)""")]
        [When(@"I click continue button of Modal ""(.*)""")]
        [Given(@"I click continue button of Modal ""(.*)""")]
        [Then(@"I click Continue button of Modal ""(.*)""")]
        public void WhenIClickContinueButtonOfModal(String titleText)
        {
            if (!BP_CRF_QueriesModalUtilities.ClickContinue(titleText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click back to CRF button of Modal ""(.*)""")]
        [Then(@"I click back to CRF button of Modal ""(.*)""")]
        public void WhenIClickBackToCRFButtonOfModal(String titleText)
        {
            if (!BP_CRF_QueriesModalUtilities.ClickBacktoCRF(titleText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
