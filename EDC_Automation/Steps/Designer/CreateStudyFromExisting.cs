using BusinessProcesses.Designer;
using BusinessProcesses.Designer.Warningpopup;
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
        
    public sealed class CreateStudyFromExisting : TechTalk.SpecFlow.Steps
    {


        [When(@"I select the pop up having title ""(.*)"" and partial message ""(.*)""")]
        public void WhenISelectThePopUpHavingTitleAndPartialMessage(string title, string message)
        {
            if (!(BP_DS_CreateStudyFromExistingUtilities.WhenISelectThePopupWindow(title, message)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }

        [When(@"I Search for the study in the studies list of Create Study from Existing  and click on the study")]
        [Then(@"I Search for the study in the studies list of Create Study from Existing  and click on the study")]
        public void ThenISearchForTheStudyInTheStudiesListOfCreateStudyFromExistingAndOpenTheStudy(Table table)
        {
            if (!(BP_DS_CreateStudyFromExistingUtilities.IsStudyAvailable(table.CreateSet<StudyData>())))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I change the Study Name to ""(.*)""")]
        public void WhenIChangeTheStudyNameTo(string StudyNameChange)
        {
            if (!(BP_DS_CreateStudyFromExistingUtilities.ChangeTheStudyName(StudyNameChange)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }       

    }
}
