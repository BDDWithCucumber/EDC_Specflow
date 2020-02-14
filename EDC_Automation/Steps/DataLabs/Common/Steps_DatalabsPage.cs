
using BusinessProcesses.DataLabs.Common;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Common
{
    [Binding]
    public class Steps_DatalabsPage
    {
        [Then(@"I see Datalabs copyright text ""(.*)""")]
        public void ThenISeeDatalabsCopyrightText(String copyrightText)
        {
            if (!BP_DLPageUtilities.IsCopyrithTextExists(copyrightText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see ServerTime ""(.*)""")]
        public void ThenISeeServerTime(String serverTime)
        {
            if (!BP_DLPageUtilities.VerifyServerTime(serverTime))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
