using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Modal;
using System;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.AdvancedSearch
{
    [Binding]
    public class Steps_AdvancedSearch
    {
        [Then(@"I see available sites in selected sites section in AdvancedSearchWindow")]
        public void ThenISeeAvailableSitesInSelectedSitesSectionInAdvancedSearchWindow(Table table)
        {
            if (!BP_AdvancedSearchUtilities.AreSitesAvailable(table.CreateSet<String>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select status ""(.*)"" for status type ""(.*)"" in AdvancedSearchWindow")]
        public void WhenISelectStatusForStatusTypeInAdvancedSearchWindow(String status, String statusType)
        {
            if (!BP_AdvancedSearchUtilities.SetStatus(status,statusType))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click search button in AdvancedSearchWindow")]
        public void WhenIClickSearchButtonInAdvancedSearchWindow()
        {
            if (!BP_AdvancedSearchUtilities.ClickSearchButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I set patient id ""(.*)"" in AdvancedSearchWindow")]
        public void WhenISetPatientIdInAdvancedSearchWindow(String patientId)
        {
            if (!BP_AdvancedSearchUtilities.SetPatientID(patientId))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}
