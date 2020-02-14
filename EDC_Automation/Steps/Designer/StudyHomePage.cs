using BusinessProcesses.Designer.VerifyStudy;
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
    public sealed class StudyHomePage : TechTalk.SpecFlow.Steps
    {
        [Then(@"I Search for the study in the studies list of Home page and open the study")]
        [When(@"I Search for the study in the studies list of Home page and open the study")]
        public void ThenISeeStudyInTheStudiesListOfHomePage(Table table)
        {
            if (!DS_BP_VerifyStudyUtilities.IsStudyAvailable(table.CreateSet<StudyData>()))
            { 
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
        [When(@"I Search for the study in the studies list of Home page and delete the study")]
        public void ThenISeeStudyInTheStudiesListOfHomePageAndDelete(Table table)
        {
            if (!DS_BP_VerifyStudyUtilities.IsStudyAvailableinHomePage(table.CreateSet<StudyData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should not see these studies in the Home page")]
        public void ThenIShouldNotSeeTheseStudiesInTheHomePage(Table table)
        {
            if (!DS_BP_VerifyStudyUtilities.IsStudyDeleted(table.CreateSet<StudyData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"user should see the below mentioned Target APPS:")]
        public void ThenUserShouldSeeTheBelowMentionedTargetAPPS(Table table)
        {
            ScenarioContext.Current.Pending();
        }





    }
}
