using BusinessProcesses.Designer;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.Designer
{
    [Binding]
    public class Scripting : TechTalk.SpecFlow.Steps
    {
        [Then(@"user should see the below values in Testvalue dropdown")]
        public void ThenUserShouldSeeTheBelowValuesInTestvalueDropdown(Table table)
        {
            IEnumerable<DropDownInfo> dropdown = table.CreateSet<DropDownInfo>();
            if (!BP_DS_ScriptingUtilities.VerifyTestCaseDropDownValues((List<DropDownInfo>)dropdown))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Parameters Sub tab")]
        public void WhenIClickOnTheParametersSubTab()
        {
            if (!BP_DS_ScriptingUtilities.Clickonparameter())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on  User sees the ""(.*)"" page")]
        public void WhenIClickOnUserSeesThePage(string QueryPage)
        {
            if (!BP_DS_ScriptingUtilities.VerifyThePageLoaded(QueryPage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}
