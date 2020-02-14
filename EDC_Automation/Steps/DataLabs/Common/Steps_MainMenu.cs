using BusinessProcesses.DataLabs.Main;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Common
{
    [Binding]
    class Steps_MainMenu
    {
        [When(@"I select AdvancedSearch from main menu")]
        public void WhenISelectAdvancedSearchFromMainMenu()
        {
            if (!BP_Common_TopBar_Utilities.InvokeAdvancedSearch())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see main tab ""(.*)""")]
        public void ThenISeeMainTab(String mainTabName)
        {
            if (!BP_Common_TopBar_Utilities.IsTabAvailable(mainTabName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I dont see main tab ""(.*)""")]
        public void ThenIDontSeeMainTab(String mainTabName)
        {
            if (BP_Common_TopBar_Utilities.IsTabAvailable(mainTabName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}