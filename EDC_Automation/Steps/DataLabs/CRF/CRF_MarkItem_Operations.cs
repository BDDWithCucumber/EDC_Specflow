using BusinessProcesses.DataLabs.Modal;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.CRF
{
    [Binding]
    public class CRF_MarkItem_Operations
    {
        [When(@"I enter comments ""(.*)"" in MarkItemDialog")]
        public void WhenIEnterCommentsInMarkItemDialog(String comment)
        {
            if (!BP_Modal_CRF_MarkItemUtilities.EnterComment(comment))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ok button in MarkItemDialog")]
        public void WhenIClickOkButtonInMarkItemDialog()
        {
            if (!BP_Modal_CRF_MarkItemUtilities.ClickOkButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}