using BusinessProcesses.DataLabs.Common;
using EDC_Automation.Helpers;
using System;
using TechTalk.SpecFlow;
using Utilities;

namespace EDC_Automation.Common.DataLabs
{
    [Binding]
    class Login
    {
        [Given(@"I logged in to DataLabs")]
        [Given(@"I have logged into DataLabs application as an Administrator user\.")]
        public void GivenILoggedInToDataLabs()
        {
            if (!BP_LoginUtilities.Login(ConfigurationHelper.BrowserType, ConfigurationHelper.DataLabsURL, ConfigurationHelper.UserName, ConfigurationHelper.Password))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I logged in to DataLabs as DataManager user")]
        public void GivenILoggedInToDataLabsAsDataManagerUser()
        {
            if (!BP_LoginUtilities.Login(ConfigurationHelper.BrowserType, ConfigurationHelper.DataLabsURL, ConfigurationHelper.DataManager_UserName, ConfigurationHelper.DataManager_Password))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I logged in to DataLabs as DataManager user In ExistingPage")]
        public void GivenILoggedInToDataLabsAsDataManagerUserInExistingPage()
        {
            if (!BP_LoginUtilities.LoginInExistingPage(ConfigurationHelper.DataManager_UserName, ConfigurationHelper.DataManager_Password))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I logged in to DataLabs In ExistingPage")]
        public void GivenILoggedInToDataLabsInExistingPage()
        {
            if (!BP_LoginUtilities.LoginInExistingPage(ConfigurationHelper.UserName, ConfigurationHelper.Password))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I logged in to DataLabs as user ""(.*)"" with password ""(.*)""")]
        public void GivenILoggedInToDataLabsAsUserWithPassword(String user_ConfigKey, String password_ConfigKey)
        {
            if (!BP_LoginUtilities.Login(ConfigurationHelper.BrowserType, ConfigurationHelper.DataLabsURL, ConfigurationHelper.GetValue(user_ConfigKey), ConfigurationHelper.GetValue(password_ConfigKey)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}