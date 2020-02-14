using BusinessProcesses.DataLabs.Common;
using System;
using System.Threading;
using TechTalk.SpecFlow;
using Utilities;

namespace EDC_Automation.Steps.DataLabs.Common
{
    [Binding]
    public class Steps_BrowserOperations
    {
        [When(@"I refresh the page")]
        public void WhenIRefreshThePage()
        {
            if (!BrowserUtilities.RefreshPage())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I scroll up the active page")]
        public void WhenIScrollUpTheActivePage()
        {
            if (!BP_KeyboardUtilities.PressPageUpKey())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I scroll donw the active page")]
        public void WhenIScrollDonwTheActivePage()
        {
            if (!BP_KeyboardUtilities.PressPageDownKey())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I wait for ""(.*)"" seconds for page to refresh")]
        public void WhenIWaitForSecondsForPageToRefresh(double wait)
        {
            Thread.Sleep(TimeSpan.FromSeconds(wait));
        }

    }
}