using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.Designer
{
    public sealed class CreateEvent : TechTalk.SpecFlow.Steps
    {
        [When(@"I enter Events details")]
        public void WhenIEnterEventsDetails(Table table)
        {
            ScenarioContext.Current.Pending();
        }
    }
}
