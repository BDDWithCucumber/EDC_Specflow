using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using BusinessProcesses.DataLabs.FlagManagement;
using Pages.DataLabs.Data;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Main
{
    [Binding]
    public class Steps_FlagManagement
    {
        [When(@"I select ""(.*)"" flag type from Flag Management page\.")]
        public void WhenISelectFlagTypeFromFlagManagementPage_(string FlagTypeName)
        {
            if(!BP_FlagManagementUtilities.SelectFlagPlanTypeOnFlagManagement(FlagTypeName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Add Plan button to create a new plan\.")]
        public void WhenIClickAddPlanButtonToCreateANewPlan_()
        {
            if (!BP_FlagManagementUtilities.ClickAddPlanButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter Plan Name as ""(.*)"" and label as ""(.*)"" on Create Plan page\.")]
        public void WhenIEnterPlanNameAsAndLabelAsOnCreatePlanPage_(string PlanNameData, string PlanLabelData)
        {
            if (!BP_FlagManagementUtilities.EnterFlagPlanNameAndLabel(PlanNameData, PlanLabelData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click ""(.*)"" button on Assign Plan to Patient page\.")]
        [When(@"I click ""(.*)"" button on Assign Plan to Site page\.")]
        [When(@"I click ""(.*)"" button on Assign Plan to Study page\.")]
        [When(@"I click ""(.*)"" button on Add/remove existing Flag Data Groups page\.")]
        [When(@"I click ""(.*)"" button on Create Plan page\.")]
        [When(@"I click ""(.*)"" button on Create Flag Data Group page\.")]
        public void WhenIClickOnButtonOnCreatePlanPage_(string ButtonName)
        {
            if (!BP_FlagManagementUtilities.ClickButtonOnCreatePlanPage(ButtonName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
   
        [When(@"I select icon\.")]
        public void WhenISelectIcon_()
        {
            BP_FlagManagementUtilities.sampletest();
        }

        [When(@"I enter Data Group Name as ""(.*)"" and Data Group label as ""(.*)"" on Create Flag Data Group page\.")]
        public void WhenIEnterDataGroupNameAsAndDataGroupLabelAsOnCreateFlagDataGroupPage_(string GroupName, string GroupLabel)
        {
            if(!BP_FlagManagementUtilities.EnterFlagDataGroupNameAndLabel(GroupName, GroupLabel))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select checkbox for form questions in protocol version\.")]
        public void WhenISelectCheckboxForFormQuestionsInProtocolVersion_(Table table)
        {
            StringBuilder FailData = new StringBuilder();
            IEnumerable<FlagManagementData> Data = table.CreateSet<FlagManagementData>();
            List<FlagManagementData> Items = (List<FlagManagementData>)Data;
            List<string> FailedItems = new List<string>();
            BP_FlagManagementUtilities.SelectChkBoxesInCreateDataGroup(Items, out FailedItems);
            if(FailedItems.Count > 0)
            {
                foreach (string Question in FailedItems)
                {
                    FailData.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select following Form/Questions '" + FailData+ "' in create flag data group page. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I check ""(.*)"" Select All checkbox of Event Form Relation table\.")]
        public void WhenICheckSelectAllCheckboxOfEventFormRelationTable_(string CheckOnOrOff)
        {
            if(!BP_FlagManagementUtilities.ChkOnOrOffSelectAllChkBoxInEventFormRelation(CheckOnOrOff))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select ""(.*)"" protocol tab\.")]
        public void WhenISelectProtocolTab_(string TabName)
        {
            if(!BP_FlagManagementUtilities.SelectStudyProtocolTab(TabName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I check Select All form checkbox for the forms\.")]
        public void WhenICheckSelectAllFormCheckboxForTheForms_(Table table)
        {
            StringBuilder FailData = new StringBuilder();
            IEnumerable<FlagManagementData> Data = table.CreateSet<FlagManagementData>();
            List<FlagManagementData> Items = (List<FlagManagementData>)Data;
            List<string> FailedItems = new List<string>();
            BP_FlagManagementUtilities.ChkOrUnChkSelectAllFormChkBoxInEventFormRelation(Items, out FailedItems);
            if(FailedItems.Count > 0)
            {
                foreach (string Question in FailedItems)
                {
                    FailData.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select checkbox for '" + FailData + "' forms in Event Form relation table. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I check Select All event checkbox for the events\.")]
        public void WhenICheckSelectAllEventCheckboxForTheEvents_(Table table)
        {
            StringBuilder FailData = new StringBuilder();
            IEnumerable<FlagManagementData> Data = table.CreateSet<FlagManagementData>();
            List<FlagManagementData> Items = (List<FlagManagementData>)Data;
            List<string> FailedItems = new List<string>();
            BP_FlagManagementUtilities.ChkOrUnChkSelectAllEventChkBoxInEventFormRelation(Items, out FailedItems);
            if (FailedItems.Count > 0)
            {
                foreach (string Question in FailedItems)
                {
                    FailData.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select checkbox for '" + FailData + "' events in Event Form relation table. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I check checkbox for a form corresponding to an event\.")]
        public void WhenICheckCheckboxForAFormCorrespondingToAnEvent_(Table table)
        {
            StringBuilder FailData = new StringBuilder();
            IEnumerable<FlagManagementData> Data = table.CreateSet<FlagManagementData>();
            List<FlagManagementData> Items = (List<FlagManagementData>)Data;
            List<string> FailedItems = new List<string>();
            BP_FlagManagementUtilities.ChkOrUnChkSelectAllEventFormChkBoxInEventFormRelation(Items, out FailedItems);
            if (FailedItems.Count > 0)
            {
                foreach (string Question in FailedItems)
                {
                    FailData.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select checkbox for '" + FailData + "' forms corresponding to event in Event Form relation table. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Save & Close button\.")]
        public void WhenIClickOnSaveCloseButton_()
        {
            if(!BP_FlagManagementUtilities.ClickSaveNCloseButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the FlagDataGroups to create the Plan")]
        public void WhenISelectTheFlagDataGroupsToCreateThePlan_(Table table)
            
        {
            StringBuilder FailData = new StringBuilder();
            IEnumerable<FlagManagementData> Data1 = table.CreateSet<FlagManagementData>();
            List<FlagManagementData> Items = (List<FlagManagementData>)Data1;
            List<String> FailedItems = new List<string>();
            if (!BP_FlagManagementUtilities.SelectFlagDataGroupList(Items,out FailedItems))
            {
                foreach( string FailedItem in FailedItems)
                {
                    FailData.Append(FailedItem + ",");
                }
                
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select the Data Group" + FailData + " in the dropdown \n";
                ScenarioContext.Current["ActResult"] = "Failed";

            }
            
            
        }

        [When(@"I select checkbox ""(.*)"" for Add/Remove existing flag data group\(s\)\.")]
        public void WhenISelectCheckboxForAddRemoveExistingFlagDataGroupS_(string ChkboxOnOff)
        {
           if (!BP_FlagManagementUtilities.SelectCheckboxAddRemoveDataGroup(ChkboxOnOff))
            
                {
                ScenarioContext.Current["ActResult"] = "Failed";
                }
        }

        [When(@"I select checkbox ""(.*)"" for Add new flag data group\(s\)\.")]
        public void WhenISelectCheckboxForAddNewFlagDataGroupS_(string ChkboxOnOff)
        {
            if (!BP_FlagManagementUtilities.SelectCheckboxAddNewFlagDataGroup(ChkboxOnOff))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I select the ""(.*)"" link on the Manage Plans & Flag Data Groups page\.")]
        public void WhenISelectTheLinkOnTheManagePlansFlagDataGroupsPage(string ManageFlagAction)
        {
            if (!BP_FlagManagementUtilities.SelectActionOnManageFlagPlanandDataGroupsPage(ManageFlagAction))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
           
        }
        [When(@"I select Select-All checkbox for the Select Sites\(s\) dropdown\.")]
        public void WhenISelectSelect_AllCheckboxForTheSelectSitesSDropdown_()
        {
            if(!BP_FlagManagementUtilities.SelectSelectAllCheckboxinSelectSitesDropdown())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select checkbox for the below patients\.")]
        public void WhenISelectCheckboxForTheBelowPatients_(Table table)
        {
            StringBuilder FailData = new StringBuilder();
            IEnumerable<FlagManagementData> Data1 = table.CreateSet<FlagManagementData>();
            List<FlagManagementData> Items = (List<FlagManagementData>)Data1;
            List<string> FailedItems = new List<string>();
            if (!BP_FlagManagementUtilities.SelectPatientRowCheckboxAssignPlanGrid(Items, out FailedItems))
            {
                foreach (string FailedItem in FailedItems)
                {
                    FailData.Append(FailedItem + ",");
                }
                ScenarioContext.Current["Comments"] = "Unable to Select checkbox for the Patients " + FailData;
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }

        [When(@"I select checkbox for the below Sites\.")]
        public void WhenISelectCheckboxForTheBelowSites_(Table table)
        {
            StringBuilder FailData = new StringBuilder();
            IEnumerable<FlagManagementData> Data1 = table.CreateSet<FlagManagementData>();
            List<FlagManagementData> Items = (List<FlagManagementData>)Data1;
            List<string> FailedItems = new List<string>();
            if (!BP_FlagManagementUtilities.SelectSiteRowCheckboxAssignPlanGrid(Items, out FailedItems))
            {
                foreach (string FailedItem in FailedItems)
                {
                    FailData.Append(FailedItem + ",");
                }
                ScenarioContext.Current["Comments"] = "Unable to Select checkbox for the Sites " + FailData;
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }



        [When(@"I select Select All checkbox ""(.*)"" for the Assign Plan grid\.")]
        public void WhenISelectSelectAllCheckboxForTheAssignPlanGrid_(string CheckboxOnOff)
        {
            if (!BP_FlagManagementUtilities.SelectSelectAllCheckboxAssignPlanGrid(CheckboxOnOff))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }

        [When(@"I select ""(.*)"" in the Select Plan dropdown\.")]
        public void WhenISelectInTheSelectPlanDropdown_(string AvailablePlan)
        {
            if (!BP_FlagManagementUtilities.SelectPlanFromSelectNewPlanDropdown(AvailablePlan))
            {
                ScenarioContext.Current["ActResult"] = "Failed";

            }
        }
        [When(@"I select ""(.*)"" in Reason for change dropdown\.")]
        public void WhenISelectInReasonForChangeDropdown_(string AvailableReasonforchange)
        {
            if(!BP_FlagManagementUtilities.SelectReasonFromReasonforchangeDropdown(AvailableReasonforchange))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I enter text ""(.*)"" in Additional Notes text box\.")]
        public void WhenIEnterTextInAdditionalNotesTextBox_(string TexttoEnter)
        {
            if (!BP_FlagManagementUtilities.EnterTextAdditionalNotes(TexttoEnter))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



    }
}
