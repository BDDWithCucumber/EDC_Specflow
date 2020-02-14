using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.WebFocus;
using EDC_Automation.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.WebFocus
{
    [Binding]
   public class wf_steps_Login
    {
        [When(@"I logged in to WebFocus")]
        public void WhenILoggedInToWebfocus()
            {
                if (!BP_wf_LoginUtilities.wf_Login(ConfigurationHelper.BrowserType, ConfigurationHelper.WebFocusURL, ConfigurationHelper.WFUserName, ConfigurationHelper.WFPassword))
                {
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }

        }
    }
