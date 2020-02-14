using BusinessProcesses.DataLabs.PermissionGrop;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.PermissionGroup
{
    [Binding]
    public class Steps_GroupManagement
    {
        [When(@"I add GroupName ""(.*)"" with DefaultPortal ""(.*)""")]
        [Then(@"I add GroupName ""(.*)"" with DefaultPortal ""(.*)""")]
        public void WhenIAddGroupNameWithDefaultPortal(string groupName, string defaultPortal)
        {
            if (!BP_PermissionGroupUtilities.AddGroup(groupName, defaultPortal))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I remove group ""(.*)"" in DeleteGroupsPage")]
        public void WhenIRemoveGroupInDeleteGroupsPage(string groupName)
        {
            if (!BP_PermissionGroupUtilities.DeleteGroup(groupName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //To do
        [Then(@"I do not see group ""(.*)"" in GroupManagementPage")]
        public void ThenIDoNotSeeGroupInGroupManagementPage(string p0)
        {
        }

        //To do
        [Then(@"I see group ""(.*)"" in GroupManagementPage")]
        public void ThenISeeGroupInGroupManagementPage(string p0)
        {
        }
    }
}
