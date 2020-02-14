using BusinessProcesses.DataLabs.ManageReferenceRanges;
using BusinessProcesses.DataLabs.Modal;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.ManageReferenceRanges
{
    [Binding]
    public class Steps_Mrr_Delete
    {    

        [Then(@"I Check the Checkbox View deleted Reference Ranges")]
        [When(@"I Check the Checkbox View deleted Reference Ranges")]        
        public void ThenICheckTheCheckboxViewDeletedReferenceRanges()
        {
            if (!BP_Mrr_DeleteUtilities.SelectViewDeletedReferenceRanges())
            {                
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I uncheck the Checkbox View deleted Reference ranges")]
        public void ThenIUnCheckTheCheckboxViewDeletedReferenceRanges()
        {
            if (!BP_Mrr_DeleteUtilities.UnSelectViewDeletedReferenceRanges())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }        

        [When(@"I click cancel in modal dialog having title ""(.*)"" and partial message ""(.*)""")]
        public void WhenIClickContinueInModalDialogHavingTitleAndPartialMessage(string titleText, string messageText_Partial)
        {
            if (!BP_ModalWindow.ClickCancel(titleText, messageText_Partial))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }        

        [When(@"I click on Delete button")]
        public void WhenIClickOnDeleteButton()
        {
            if (!BP_Mrr_DeleteUtilities.ClickOnDeleteButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I selected the below mentioned rows in the Mrr table")]
        public void WhenISelectedTheBelowMentionedRowsInTheMrrTable(Table table)       
        {
            List<RowIndex> rowindex = table.CreateSet<RowIndex>().ToList();
           
            if (!BP_Mrr_DeleteUtilities.SelectTheRecord(rowindex))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I read the RefID for the below records in Mrr table")]
        public void WhenIReadTheRefIDForTheBelowRecords(Table table)
        {
            List<RowIndex> rowindex = table.CreateSet<RowIndex>().ToList();           
            
            ScenarioContext.Current["RefIds"] = BP_Mrr_DeleteUtilities.GetTheRefIDS(rowindex);
            
        }

        [Then(@"I should see the records in strikethrough mode and no Checkbox displayed for the deleted record")]
        public void ThenIShouldSeeTheRecordsInStrikethroughMode()
        {
            List<string> refIDs = (List<string>)ScenarioContext.Current["RefIds"];         
           
           foreach(string s1 in refIDs)
            {
                if (!BP_Mrr_DeleteUtilities.VeifyTheStrikeThroughRecords(s1))
                {
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }            
        }       

        [Then(@"I shouldnot see the ""(.*)"" icon for the deleted records")]
        [Then(@"I should see the ""(.*)"" icon in enabled state for the deleted records")]
        public void ThenIShouldnotSeeTheIconForTheDeletedRecords(string actionicon)
        {
            List<string> refIDs = (List<string>)ScenarioContext.Current["RefIds"];
            foreach(string refId in refIDs)
            {
                if (!BP_Mrr_DeleteUtilities.VeifyTheIconsForTheDeletedRecords(refId, actionicon))
                {
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }            
        }

        [When(@"I click on ""(.*)"" icon for the that record")]
        public void WhenIClickOnIconForTheThatRecord(string actionIcon)
        {
            List<string> refIDs = (List<string>)ScenarioContext.Current["RefIds"];
            foreach (string refId in refIDs)
            {
                if (!BP_Mrr_DeleteUtilities.DeleteTheRecordUsingDeleteIcon(refId, actionIcon))
                {
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }
        }

        [Then(@"I shouldnot see the deleted records")]
        public void ThenIShouldnotSeeTheDeletedRecords()
        {
            List<string> refIDs = (List<string>)ScenarioContext.Current["RefIds"];            
            foreach (string s1 in refIDs)
            {
                if (!BP_Mrr_DeleteUtilities.VeifyTheRecords(s1))
                {
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }
        }

        [Then(@"I should still see the record in MRR table")]
        public void ThenIShouldStillSeeTheRecordInMRRTable()
        {
            List<string> refIDs = (List<string>)ScenarioContext.Current["RefIds"];
            foreach (string s1 in refIDs)
            {
                if (!BP_Mrr_DeleteUtilities.RecordsVerificationForCancel(s1))
                {
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }
        }
    }
}
