using BusinessProcesses.DataLabs.AdvancedSearch;
using Pages.DataLabs.Data;
using System;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.AdvancedSearch
{
    [Binding]
    class Steps_AdvancedSearchResults
    {
        [Then(@"I see patients in AdvancedSearchResultsPage")]
        public void ThenISeePatientsInAdvancedSearchResultsPage(Table table)
        {
            if (!BP_AdvancedSearchResultsUtilities.ArePatientsAvailable(table.CreateSet<PatientTableData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I click Cancel Search button in AdvancedSearchResultsPage")]
        public void GivenIClickCancelSearchButtonInAdvancedSearchResultsPage()
        {
            if (!BP_AdvancedSearchResultsUtilities.ClickCancelSearch())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
