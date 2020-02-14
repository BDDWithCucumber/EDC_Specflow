using BusinessProcesses.DataLabs.Common;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Common
{
    [Binding]
    public class Steps_UserPreferences
    {
        [When(@"I select portal ""(.*)"" in UserPreferencesPage")]
        public void WhenISelectPortalInUserPreferencesPage(String portal)
        {
            if (!BP_UserPreferencesUtilities.SetPortal(portal))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in UserPreferencesPage")]
        [When(@"I click Save button on User Preferences page\.")]
        public void WhenIClickSaveButtonInUserPreferencesPage()
        {
            if (!BP_UserPreferencesUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Save Success message on User Preferences page\.")]
        public void ThenISeeSaveSuccessMessageOnUserPreferencesPage_()
        {
            if(!BP_UserPreferencesUtilities.VerifySaveSuccessMsg())
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify Save Successful message on User Preferences page. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select DateTime format ""(.*)"" in UserPreferencesPage")]
        public void WhenISelectDateTimeFormatInUserPreferencesPage(String dateTimeFormat)
        {
            if(!BP_UserPreferencesUtilities.SetDateTimeFormat(dateTimeFormat))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select DateTime zone ""(.*)"" in UserPreferencesPage")]
        public void WhenISelectDateTimeZoneInUserPreferencesPage(String timeZone)
        {
            if (!BP_UserPreferencesUtilities.SetTimeZone(timeZone))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enable CompleteChangeHistory in UserPreferencesPage")]
        [When(@"I select Complete Change History radio button on User Preferences page\.")]
        public void WhenIEnableCompleteChangeHistoryInUserPreferencesPage()
        {
            if (!BP_UserPreferencesUtilities.ClickCompleteChangeHistroyRadioButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enable BasicChangeHisotry in UserPreferencesPage")]
        public void WhenIEnableBasicChangeHisotryInUserPreferencesPage()
        {
            if (!BP_UserPreferencesUtilities.ClickBasicChangeHistroyRadioButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
