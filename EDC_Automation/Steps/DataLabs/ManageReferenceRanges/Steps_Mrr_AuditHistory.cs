using BusinessProcesses.DataLabs.ManageReferenceRanges;
using Pages.DataLabs.Data;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.ManageReferenceRanges
{
    [Binding]
    public class Steps_Mrr_AuditHistory
    {
        [When(@"I click on ""(.*)"" Icon for the added record in the MRR table grid of Manage Reference Range page")]
        [When(@"I click on ""(.*)"" Icon for the updated record in the MRR table grid of Manage Reference Range page")]
        [When(@"I click on ""(.*)"" Icon for the deleted record in the MRR table grid of Manage Reference Range page")]
        public void WhenIClickOnIconForTheThatRecord(string actionIcon)
        {            
            string refId = (string)ScenarioContext.Current["RefId"];

            if (!BP_Mrr_DeleteUtilities.DeleteTheRecordUsingDeleteIcon(refId, actionIcon))
                {
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
         }

        [When(@"I read the Ref ID of the created record in the MRR table of Manage Reference Ranges page")]
        public void WhenIReadTheRefIDOfTheCreatedRecordInTheMRRTableOfManageReferenceRangesPage()
        {
            ScenarioContext.Current["RefId"] = BP_Mrr_AuditHistory.ReadtheRefID();
        }

        [Then(@"I should see the ""(.*)"" as ""(.*)"" in the Change History window of MRR table grid in Manage Reference page")]
        public void ThenIShouldSeeTheInTheChangeHistoryWindowOfMRRTableGridInManageReferencePage(string field, string value)
        {
            if (!BP_Mrr_AuditHistory.VerifyTheValuesInChangeHistory(field, value))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I apply filter on column ""(.*)"" for the created record by filter criteria ""(.*)"" in Mrr Lab Test Name Grid")]
        public void WhenIApplyFilterOnColumnForTheCreatedRecordByFilterCriteriaInMrrLabTestNameGrid(string columnName, string filterCriteria)
        {
            string filterText = (string)ScenarioContext.Current["RefId"];
            if (!BP_MrrTableUtilities.ApplyFilter(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
        [Then(@"I should view the button ""(.*)"" in the Change History window of MRR table grid in Manage Reference page")]
        public void ThenIShouldViewTheButtonInTheChangeHistoryWindowOfMRRTableGridInManageReferencePage(string button)
        {
            if (!BP_Mrr_AuditHistory.VerifyTheActionButtonInChangeHistoryWindow(button))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the below mentioned details in the Change History Window")]
        public void ThenIShouldSeeTheBelowMentionedDetailsInTheChangeHistoryWindow(Table table)
        {
            IEnumerable<Mrr_ChangeHistoryData> dataList = table.CreateSet<Mrr_ChangeHistoryData>();
            if (!BP_Mrr_AuditHistory.VerifyChangeHistory((List<Mrr_ChangeHistoryData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"clicking on Filter button should display Is yes or Is No values")]
        public void ThenClickingOnFilterButtonShouldDisplayIsYesOrIsNoValues()
        {
           
            if (!BP_Mrr_AuditHistory.ClickNA())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            Utilities.BrowserUtilities.SwitchToNAFrame();
          
            if (((BP_Mrr_AuditHistory.GetNAFilterValueNo()!= "Is No")) || ((BP_Mrr_AuditHistory.GetNAFilterValueYes()!= "Is Yes")))
            {
                
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I Click on ""(.*)"" button in the in the Change History window of MRR table grid in Manage Reference page")]
        public void ThenIClickOnButtonInTheInTheChangeHistoryWindowOfMRRTableGridInManageReferencePage(string button)
        {
            if (!BP_Mrr_AuditHistory.PerformTheAction(button))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


    }
}

