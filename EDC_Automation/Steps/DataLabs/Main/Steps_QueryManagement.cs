using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.QueryManagement;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Main
{
    [Binding]
    public class Steps_QueryManagement
    {
        [When(@"I click RunAll button in QueryRunWizardPage")]
        public void WhenIClickRunAllButtonInQueryRunWizardPage()
        {
            if (!BP_QueryRunWizardUtilities.ClickRunAllButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Next button in QueryRunWizardPage")]
        public void WhenIClickNextButtonInQueryRunWizardPage()
        {
            if (!BP_QueryRunWizardUtilities.ClickNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click Next button in QueryRunWizardCriteriaPage")]
        public void WhenIClickNextButtonInQueryRunWizardCriteriaPage()
        {
            if (!BP_QueryRunWizardCriteriaUtilities.ClickNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }

        [When(@"I select site ""(.*)"" in QueryRunWizardSitesPage")]
        public void WhenISelectSiteInQueryRunWizardSitesPage(String site)
        {
            if (!BP_QueryRunWizardSitesUtilities.SelectSite(site))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Next button in QueryRunWizardSitesPage")]
        public void WhenIClickNextButtonInQueryRunWizardSitesPage()
        {
            if (!BP_QueryRunWizardSitesUtilities.ClickNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Finish button in QueryRunWizardPage")]
        public void WhenIClickFinishButtonInQueryRunWizardPage()
        {
            if (!BP_QueryRunWizardUtilities.ClickFinishButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter ""(.*)"" in ""(.*)"" search field\.")]
        public void WhenIEnterInSearchField_(string SearchValue, string FieldName)
        {
            if(!BP_QueryRunWizardUtilities.EnterValueInSearchField(FieldName, SearchValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
                ScenarioContext.Current["Comments"] = "Search criteria is not eneterd in the search field.";
            }
        }

        [When(@"I select checkbox for the query ""(.*)"" and version ""(.*)"" from the query run wizard page\.")]
        public void WhenISelectCheckboxForTheQueryAndVersionFromTheQueryRunWizardPage_(string QueryName, Decimal Version)
        {
            string ver = Version.ToString();
            if(!BP_QueryRunWizardUtilities.SelectQueryOnRunWizardPage(QueryName, ver))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
                ScenarioContext.Current["Comments"] = "Query is not selected to proceed.";
            }
        }

        [Then(@"I verify the success message displayed as ""(.*)""")]
        public void ThenIVerifyTheSuccessMessageDisplayedAs(string MsgToVerify)
        {
            if(!BP_DLPageUtilities.VerifySuccessMessageOnPage(MsgToVerify))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }




    }
}
