using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using BusinessProcesses.DataLabs.IntegrationManagement;
using BusinessProcesses.DataLabs.Common;
using Pages.DataLabs.Data;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Main
{
    [Binding]
    public class Steps_IntegrationManagement
    {
        [When(@"I select ""(.*)"" as source system for Add or Screen Patient\.")]
        public void WhenISelectAsSourceSystemForAddOrScreenPatient_(string SystemName)
        {
            if(!BP_IntegrationManagementUtilities.SelectAddPatientSourceSystem(SystemName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select Add/Screen Patient source system as '" + SystemName + "'";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter ""(.*)"" in the Web Service URL field\.")]
        public void WhenIEnterInTheWebServiceURLField_(string URL)
        {
            if(!BP_IntegrationManagementUtilities.EnterWebServiceURLValue(URL))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to enter value '" + URL + "' in Web Service URL field.";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ""(.*)"" button on General Configurations page\.")]
        public void WhenIClickButtonOnGeneralConfigurationsPage_(string ButtonToClick)
        {
            if(!BP_IntegrationManagementUtilities.ClickButtonOnGeneralConfigurationsPage(ButtonToClick))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to click '" + ButtonToClick + "' button.";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Save Success message on ""(.*)"" page\.")]
        public void ThenISeeSaveSuccessMessageOnPage_(string PageName)
        {
            if (!BP_UserPreferencesUtilities.VerifySaveSuccessMsg())
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify Save Successful message on " + PageName + " page. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select ""(.*)"" event from the Event dropdown\.")]
        public void WhenISelectEventFromTheEventDropdown_(string EventName)
        {
            if(!BP_IntegrationManagementUtilities.SelectEventOnPatientIdentifiersPageAndWait(EventName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select '" + EventName + "' event from Event dropdown field. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on ""(.*)"" icon for ""(.*)"" CRF\.")]
        public void WhenIClickOnIconForCRF_(string Action, string FormName)
        {
            if(!BP_IntegrationManagementUtilities.ExpandOrCollapseFormInPatientIdentifiersPage(FormName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to " + Action + " the form '" + FormName + "'. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on ""(.*)"" button on Define Patient Identifiers page\.")]
        public void WhenIClickOnButtonOnDefinePatientIdentifiersPage_(string ButtonName)
        {
            if(!BP_IntegrationManagementUtilities.ClickButtonOnDefinePatientIdentifiersPage(ButtonName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to click " + ButtonName + "'. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select default value as Yes for below questions of ""(.*)""\.")]
        public void WhenISelectDefaultValueAsYesForBelowQuestionsOf_(string CRFName, Table table)
        {
            StringBuilder UnselectedQues = new StringBuilder();
            IEnumerable<DefinePatientIdentifiers> Data = table.CreateSet<DefinePatientIdentifiers>();
            List<DefinePatientIdentifiers> CRFData = (List<DefinePatientIdentifiers>)Data;
            List<string> FailedQs = new List<string>();
            BP_IntegrationManagementUtilities.SelectDefaultAsYesForQuestions(CRFData, out FailedQs);
            if(FailedQs.Count > 0)
            {
                foreach(string Ques in FailedQs)
                {
                    UnselectedQues.Append(Ques + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select Yes dropdown option for '" + UnselectedQues + "' questions for '" + CRFName + "' form. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


    }
}
