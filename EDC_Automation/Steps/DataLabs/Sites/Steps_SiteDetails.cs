using BusinessProcesses.DataLabs.Sites;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Sites
{
    [Binding]
    public class Steps_SiteDetails
    {
        [Then(@"I see Site details page for ""(.*)""")]
        public void ThenISeeSiteDetailsPageFor(String site)
        {
            if (!BP_SiteDetailsUtilities.IsSiteDetailsPageOpened(site))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click labid ""(.*)"" in Labs subtab of SitePage")]
        [When(@"I click labid ""(.*)"" in Labs subtab of SitePage")]
        public void WhenIClickLabidInLabsSubtabOfSitePage(String labId)
        {
            if (!BP_SiteCreationUtilities.OpenLab(labId))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
