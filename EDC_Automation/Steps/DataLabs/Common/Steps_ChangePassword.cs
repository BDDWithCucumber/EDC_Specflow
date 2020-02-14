using BusinessProcesses.DataLabs.Common;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Common
{
    [Binding]
    class Steps_ChangePassword
    {

        [When(@"I set current password ""(.*)"" in ChangePasswordPage")]
        public void WhenISetCurrentPasswordInChangePasswordPage(String currentPassword)
        {
            if (!BP_ChangePasswordUtilities.SetCurrentPassword(currentPassword))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I set new password ""(.*)"" in ChangePasswordPage")]
        public void WhenISetNewPasswordInChangePasswordPage(String newPassword)
        {
            if (!BP_ChangePasswordUtilities.SetNewPassword(newPassword))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I set retype password ""(.*)"" in ChangePasswordPage")]
        public void WhenISetRetypePasswordInChangePasswordPage(String newPassword)
        {
            if (!BP_ChangePasswordUtilities.SetRetypePassword(newPassword))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in ChangePasswordPage")]
        public void WhenIClickSaveButtonInChangePasswordPage()
        {
            if (!BP_ChangePasswordUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}