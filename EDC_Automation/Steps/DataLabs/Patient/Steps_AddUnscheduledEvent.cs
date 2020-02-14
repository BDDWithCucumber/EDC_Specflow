using BusinessProcesses.DataLabs.Patients.AddUnscheduledEvent;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Patient
{
    [Binding]
    public class Steps_AddUnscheduledEvent
    {
        [When(@"I select ""(.*)"" from events list on AddUnscheduledEventStep1Page")]
        public void WhenISelectFromEventsListOnAddUnscheduledEventStep1Page(String eventName)
        {
            if (!BP_AddUnscheduledEventUtilities.SelectEvent(eventName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Next button on AddUnscheduledEventStep1Page")]
        public void WhenIClickOnNextButtonOnAddUnscheduledEventStep1Page()
        {
            if (!BP_AddUnscheduledEventUtilities.ClickNextbuttonOnStep1Page())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select below forms on on AddUnscheduledEventStep2Page")]
        public void WhenISelectBelowFormsOnOnAddUnscheduledEventStep2Page(Table table)
        {
            IEnumerable<UnschedueledEventFormsData> dataList = table.CreateSet<UnschedueledEventFormsData>();
            if (!BP_AddUnscheduledEventUtilities.SelectForms((List<UnschedueledEventFormsData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Next button on AddUnscheduledEventStep2Page")]
        public void WhenIClickOnNextButtonOnAddUnscheduledEventStep2Page()
        {
            if (!BP_AddUnscheduledEventUtilities.ClickNextbuttonOnStep2Page())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Finish button on AddUnscheduledEventStep3Page")]
        public void WhenIClickOnFinishButtonOnAddUnscheduledEventStep3Page()
        {
            if (!BP_AddUnscheduledEventUtilities.ClickFinishButtonOnStep3Page())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
