using BusinessProcesses.Designer;
using Pages.Designer.Data;
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
    public sealed class CreateStudy : TechTalk.SpecFlow.Steps
    {
        [Then(@"I should see study properties page")]
        public void ThenIShouldSeeStudyPropertiesPage()
        {
            if (!(DS_BP_StudyProperties.StudyPropertiesPage()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }        
        
        [Then(@"I Should not see the tab mentioned below")]
        public void ThenIShouldNotSeeTheTabMentionedBelow(Table table)
        {
            if ((DS_BP_StudyProperties.SelecttheTab(table.CreateSet<Tabs>())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the tabs mentioned below")]
        [Then(@"under the Actions panel I should see the tabs mentioned below")]
        public void ThenIShouldSeeTheTabsMentionedBelow(Table table)
        {           
            if (!(DS_BP_StudyProperties.SelecttheTab(table.CreateSet<Tabs>())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Edit icon For ""(.*)"" Field\.")]
        public void WhenIClickOnIconForField(string field)
        {
            if (!(DS_BP_StudyProperties.ClickEditButtonOnLabMappingsPage(field)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Codelist Mapping Button for ""(.*)"" Field\.")]
        public void WhenIClickCodelistMappingButtonForField(string field)
        {
        if (!DS_BP_StudyProperties.ClickEditCodelistMapping(field))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Cancel Button in Grey color")]
        public void ThenISeeButtonColor()
        {
            if (!DS_BP_StudyProperties.VerifyColorOfButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on Cancel button on Codelist Mappings popup\.")]
        public void WhenIClickOnButtonOnPopup()
        {
            if (!DS_BP_StudyProperties.ClickCancelButtonOnPopup())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [Then(@"I should see the Labs Icon in next to Labs tab")]
        public void ThenIShouldSeeTheLabsIconInNextToLabsTab()
        {
            if (!(DS_BP_StudyProperties.VerifyLabsIcon()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I shouldnot see the Labs Icon in next to Labs tab")]
        public void ThenIShouldnotSeeTheLabsIconInNextToLabsTab()
        {
            if (!(DS_BP_StudyProperties.VerifyLabsIcon()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"I click on the ""(.*)"" tab")]
        [When(@"I click on the ""(.*)"" link")]

        public void WhenIClickOnTheTab(string tabName)
        {
            if (!(DS_BP_StudyProperties.ClickOnTheTab(tabName)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Filter button")]
        public void WhenIClickOnTheFilterButton()
        {
            if (!(DS_BP_StudyProperties.ClickOnTheFilterButtoninCodeListsPage()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter the Codelist ""(.*)"" in CodelistName and Search")]
        public void WhenIClickOnButton(string FilterIcon)
        {
            if (!(DS_BP_StudyProperties.ClickOnTheFilterButton(FilterIcon)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }       

        [When(@"I enter the Codelist ""(.*)"" in CodelistName")]
        public void WhenIEnterTheCodelistInCodelistName(string Codelist)
        {
            if (!(DS_BP_StudyProperties.EnterTheCodeLIst(Codelist)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the Codelist ""(.*)""")]
        public void ThenIShouldSeeTheCodelist(string Codelist)
        {
            if (!(DS_BP_StudyProperties.UserShouldSeeTheCodelist(Codelist)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on the Codelist ""(.*)""")]
        public void WhenIClickOnTheCodelist(string CodeListName)
        {
            if (!(DS_BP_StudyProperties.ClickOnTheCodeList(CodeListName)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I should see the ""(.*)"" page")]
        [Then(@"I should see the ""(.*)"" page")]
        public void ThenIShouldSeeThePage(string header)
        {
            if (!(DS_BP_StudyProperties.UserShouldSeeThePage(header)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}
