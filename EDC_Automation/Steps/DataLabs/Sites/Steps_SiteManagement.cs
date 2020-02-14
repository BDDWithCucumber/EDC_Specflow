using BusinessProcesses.DataLabs.Sites;
using Pages.DataLabs.Data;
using System;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Sites
{
    [Binding]
    public class Steps_SiteManagement
    {
        [Then(@"I see site ""(.*)"" in SiteManagementPage")]
        public void ThenISeeSiteInSiteManagementPage(String site)
        {
            if (!BP_SiteManagementUtilities.IsSiteAvailableInSiteManagementPage(site))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see site manage version detials in ManageVersionsPage")]
        public void ThenISeeSiteManageVersionDetialsInManageVersionsPage(Table table)
        {
            Site_ManageVersionsData mismatchedData = null;
            if (!BP_Site_ManageVersionsUtilities.IsVersionDetailsAvailable(table.CreateSet<Site_ManageVersionsData>(), out mismatchedData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I edit site and Save in SiteDetailsPage")]
        public void WhenIEditSiteAndSaveInSiteDetailsPage(Table table)
        {
            SiteData siteData = table.CreateInstance<SiteData>();
            if (!BP_SiteCreationUtilities.EnterSiteData(siteData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}