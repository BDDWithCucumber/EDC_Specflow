using BusinessProcesses.DataLabs.Patients;
using BusinessProcesses.DataLabs.Patients.Form;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Patient
{
    [Binding]
    class Steps_EventFormOperations
    {
        [When(@"I open form ""(.*)"" of event ""(.*)""")]
        public void WhenIOpenFormOfEvent(String formName, String eventName)
        {
            if (!BP_Patient_EventFormUtilities.OpenForm(eventName, formName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see CRF ""(.*)"" of event ""(.*)""")]
        public void ThenISeeCRFOfEvent(String formName, String eventName)
        {
            if (!BP_FormUtilities.IsFormInvoked(eventName, formName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
