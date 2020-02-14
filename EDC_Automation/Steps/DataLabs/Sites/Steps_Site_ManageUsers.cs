using BusinessProcesses.DataLabs.Sites;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Sites
{
    [Binding]
    class Steps_Site_ManageUsers
    {
        [Then(@"I add and save user ""(.*)"" to site users in SiteManageUsersPage")]
        [When(@"I add and save user ""(.*)"" to site users in SiteManageUsersPage")]
        public void WhenIAddAndSaveUserToSiteUsersInSiteManageUsersPage(String userName)
        {
            if (!BP_Site_ManageUsersUtilities.AddUserToSiteUsers(userName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I remove and save user ""(.*)"" from site users in SiteManageUsersPage")]
        public void WhenIRemoveAndSaveUserFromSiteUsersInSiteManageUsersPage(String userName)
        {
            if (!BP_Site_ManageUsersUtilities.RemoveUserFromSiteUsers(userName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select patients in MigratePatientsPage")]
        public void WhenISelectPatientsInMigratePatientsPage(Table table)
        {
            IEnumerable<SiteManagementMigratePatientsData> patients = table.CreateSet<SiteManagementMigratePatientsData>();
            if (!BP_MigratePatientsUtilities.SelectePatients((List<SiteManagementMigratePatientsData>)patients))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in MigratePatientsPage")]
        public void WhenIClickSaveButtonInMigratePatientsPage()
        {
            if (!BP_MigratePatientsUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}