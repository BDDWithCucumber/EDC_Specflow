using BusinessProcesses.DataLabs.ManageReferenceRanges;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.ManageReferenceRanges
{
    [Binding]
    public class Steps_MRR_Attributes
    {
                
        [When(@"I click on ""(.*)"" icon for the first record")]
        [When(@"I click on ""(.*)"" icon for the first record in the MRR table of ManageReferenceRanges page")]        
        public void WhenIClickOnIconForTheFirstRecordInTheMRRTableOfManageReferenceRangesPage(string action)
        {
            if (!BP_Mrr_EditUtilities.GetFirstRowFromTableAndClickOnAction(action))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Add button")]
        [When(@"I click on Add button in the MRR table grid of Manage Reference Ranges page")]
        public void WhenIClickOnAddButtonInTheMRRTableGridOfManageReferenceRangesPage()
        {
            if (!BP_Mrr_EditUtilities.ClickOnAddButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the below mentioned values in the ""(.*)"" drop down once I click on dropdown in ManageReferenceRanges page")]
        [When(@"I should see the below mentioned values in the ""(.*)"" drop down once I click on dropdown in ManageReferenceRanges page")]
        public void ThenIShouldSeeTheBelowMentionedValuesInTheDropDown(String fieldName,Table table)
        {
            IEnumerable<DropDownInfo> dropdown = table.CreateSet<DropDownInfo>();
            if (!BP_Mrr_EditUtilities.VerifyValuesInDropdown((List<DropDownInfo>)dropdown, fieldName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the default value as ""(.*)"" in the ""(.*)"" drop down")]
        public void ThenIShouldSeeTheDefaultValueAsInTheDropDown(string value, string fieldName)
        {
            if (!BP_Mrr_EditUtilities.VerifyTheDefaultValueInInputField(value, fieldName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }

}

