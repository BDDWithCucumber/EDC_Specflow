using BusinessProcesses.Designer;
using BusinessProcesses.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.Designer
{
    [Binding]
    public sealed class CreateForm : TechTalk.SpecFlow.Steps
    {

        [Then(@"I should see the ""(.*)""  page")]
        public void ThenIShouldSeeThePage(string PageName)
        {
            if (!(BP_DS_FormPageUtilities.VeifyPage(PageName)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter the FormName as ""(.*)""")]
        public void WhenIEnterTheFormNameAs(string FormName)
        {
            if (!(FormUtilities.SetFormName(FormName)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I enter the Formlabel as ""(.*)""")]
        public void WhenIEnterTheFormlabelAs(string FormLabel)
        {
            if (!(FormUtilities.SetFormlabel(FormLabel)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Form Save button")]
        public void WhenIClickOnFormSaveButton()
        {
            if (!(FormUtilities.FormSaveButton()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter the Question Data as ""(.*)""")]
        public void WhenIEnterTheQuestionDataAs(string QuestionData)
        {
            if (!(FormUtilities.SetQuestionData(QuestionData)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on QuestionData Save button")]
        public void WhenIClickOnQuestionDataSaveButton()
        {
            if (!(FormUtilities.QuestionSaveButton()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on QuestionData Save button in table question")]
        public void WhenIClickOnQuestionDataSaveButtonInTableQuestion()
        {
            if (!(FormUtilities.QuestionSaveButtonInTable()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
