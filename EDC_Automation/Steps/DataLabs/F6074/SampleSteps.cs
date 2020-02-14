using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.F6074
{
    [Binding]
    public class SampleSteps
    {
        [Given(@"I have published study XML of ""(.*)"" study\.")]
        public void GivenIHavePublishedStudyXMLOfStudy_(string p0)
        {
            //ScenarioContext.Current.Pending();
        }

        [When(@"I open the study XML file of ""(.*)"" study\.")]
        public void WhenIOpenTheStudyXMLFileOfStudy_(string p0)
        {
            //ScenarioContext.Current.Pending();
        }

        [Then(@"The following tags are displayed under ""(.*)"" section\.")]
        public void ThenTheFollowingTagsAreDisplayedUnderSection_(string p0, Table table)
        {
            //ScenarioContext.Current.Pending();
        }

        [Then(@"The folllowing are displayed under ""(.*)"" section\.")]
        public void ThenTheFolllowingAreDisplayedUnderSection_(string p0, Table table)
        {
            //ScenarioContext.Current.Pending();
        }

        [Then(@"The tag ""(.*)"" is displayed under ""(.*)"" section\.")]
        public void ThenTheTagIsDisplayedUnderSection_(string p0, string p1)
        {
            //ScenarioContext.Current.Pending();
        }
    }
}
