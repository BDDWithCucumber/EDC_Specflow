using BusinessProcesses.DataLabs.Safety;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TechTalk.SpecFlow;


namespace EDC_Automation.Steps.DataLabs.Safety
{
    [Binding]
    class Steps_SafetyHome
    {
        // For additional details on SpecFlow step definitions see https://go.specflow.org/doc-stepdef

        //private readonly ScenarioContext context;

        //public SafetyHome(ScenarioContext injectedContext)
        //{
        //    context = injectedContext;
        //}



        [Then(@"I see Safety details screen")]
        public void ThenISeeSafetyDetailsScreen()
        {
            if (!BP_SafetyHome.SafetyHomePageVerification())
            {
                ScenarioContext.Current["ActResult"]= "Failed" ;
            }
        }

    }
}
