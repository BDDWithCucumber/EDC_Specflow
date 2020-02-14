using BusinessProcesses.DataLabs.Main.CRF;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Main
{
    [Binding]
    public class Steps_MainCRFsTab
    {
        [When(@"I select patient ""(.*)"" in CRFsPage")]
        public void WhenISelectPatientInCRFsPage(String patient)
        {
            if (!BP_CRF_MainPageUtilities.OpenPatient(patient))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see icon ""(.*)"" for form ""(.*)"" of event ""(.*)""")]
        public void ThenISeeIconForFormOfEvent(String iconName, String formName, String eventName)
        {
            if (!BP_CRF_PDEP_EventsPageUtilities.VerifyFormStautsIcon(eventName,formName,iconName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I dont see ActionPaletteItem ""(.*)"" in ActionPalette ""(.*)""")]
        public void ThenIDontSeeActionPaletteItemInActionPalette(String actionPaletteItem, String actionPalette)
        {
            ScenarioContext.Current["ActResult"] = "Failed";
        }
    }
}