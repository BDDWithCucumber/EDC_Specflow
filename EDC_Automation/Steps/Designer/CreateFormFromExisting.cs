using BusinessProcesses.Designer.VerifyStudy;
using BusinessProcesses.Forms;
using Pages.DataLabs.Data;
using Pages.Designer.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.Designer
{
    [Binding]
    public class CreateFormFromExisting : TechTalk.SpecFlow.Steps
    {
       
        [Then(@"user should see Verify button before the save button")]
        public void ThenUserShouldSeeVerifyButtonBeforeTheSaveButton()
        {
            if (!(BP_DS_CreateFormFromExisitng.VerifyTheVerifyButtonAtTop()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"user should see Verify button before the save button at the top of the pop up window")]
        public void ThenUserShouldSeeVerifyButtonBeforeTheSaveButtonAtTheTopOfThePopUpWindow()
        {
            if (!(BP_DS_CreateFormFromExisitng.VerifyTheVerifyButtonAtTop()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"user should see Verify button before the save button at the bottom of the pop up window")]
        public void ThenUserShouldSeeVerifyButtonBeforeTheSaveButtonAtTheBottomOfThePopUpWindow()
        {
            if (!(BP_DS_CreateFormFromExisitng.VerifyTheVerifyButtonAtBottom()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }




        [Then(@"user should see the message ""(.*)""")]
        public void ThenUserShouldSeeTheMessage(string p0)
        {
            if (!(BP_DS_CreateFormFromExisitng.VerifyTheVerbiageComponents(p0)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"user should see the message ""(.*)"" with orange background above grid")]
        public void ThenUserShouldSeeTheMessageWithOrangeBackgroundAboveGrid(string p1)
        {
            if (!(BP_DS_CreateFormFromExisitng.VerifyTheVerbiageExistsinTarget(p1)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"should see all the ""(.*)"" and Domain Items in orange color")]
       // [Then(@"I should see all the ""(.*)"" in orange color")]
        public void ThenShouldSeeAllTheDomainsAndDomainItemsInOrangeColor(string field, Table table)
        {            
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;            
            if (!BP_DS_CreateFormFromExisitng.VerifyOrangeBackGroundColor(TableData, field))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see all the Codelist in orange color")]
        public void ThenIShouldSeeAllTheInOrangeColor(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifyOrangeBackGroundColorForCodelist(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }





        [Then(@"User shall be able to see the message ""(.*)"" with Orange color text above the table")]
        public void ThenUserShallBeAbleToSeeTheMessageWithOrangeColorTextAboveTheTable(string p0)
        {
            if (!(BP_DS_CreateFormFromExisitng.VerifyTheVerbiageUseExisting(p0)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
       
        [When(@"I click on the Cancel button on the popup page")]
        public void WhenIClickOnTheCancelButtonOnThePopupPage()
        {
            if (!(BP_DS_CreateFormFromExisitng.ClickOnCancelButton()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the columns headings in the popup page")]
        public void ThenIShouldSeeTheColumnsHeadingsInThePopupPage(Table table)
        {
            IEnumerable<CreateFrFromxisiting> tableHeaderNames = table.CreateSet<CreateFrFromxisiting>();
            
            if (!BP_DS_CreateFormFromExisitng.ColumnHeadingRow((List<CreateFrFromxisiting>)tableHeaderNames))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should not see the Column headings in the popup page")]
        public void ThenIShouldNotSeeTheColumnHeadingsInThePopupPage(Table table)
        {
            IEnumerable<CreateFrFromxisiting> tableHeaderNames = table.CreateSet<CreateFrFromxisiting>();

            if (!BP_DS_CreateFormFromExisitng.ColumnHeadingRowNotBeDisplayed((List<CreateFrFromxisiting>)tableHeaderNames))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I search for the Form and open Form ""(.*)""")]
        public void WhenISearchForTheFormAndOpenForm(string form)
        {
            if (!BP_DS_CreateFormFromExisitng.FindForm(form))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
           
        }

        [Then(@"I should see the columns headings in the popup page as below")]
        public void ThenIShouldSeeTheColumnsHeadingsInThePopupPageAsBelow(Table table)
        {
           // StringBuilder UnverifiedQs = new StringBuilder();
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyTableData(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            
                //foreach (string Question in Unverified)
                //{
                //    UnverifiedQs.Append(Question + ",");
                //}
                //ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify table questions '" + UnverifiedQs + "' in the CRF. \n";
                //ScenarioContext.Current["ActResult"] = "Failed";
            
        }        
       
        //[Then(@"I should see the all the checkboxes in disabled state and unchecked by default")]
        //public void ThenIShouldSeeTheAllTheCheckboxesInEnabledStateAndUncheckedByDefault(Table table)
        //{
        //    StringBuilder UnverifiedQs = new StringBuilder();
        //    IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
        //    List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
        //    List<string> Unverified = new List<string>();
        //    if (!BP_DS_CreateFormFromExisitng.VerifyCheckboxstatus(TableData))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}
        [Then(@"I should see the all the checkboxes in enabled state and checked by default for the Domain Items")]
        public void ThenIShouldSeeTheAllTheCheckboxesInEnabledStateAndCheckedByDefaultForTheDomainItems(Table table)
        {
            //StringBuilder UnverifiedQs = new StringBuilder();
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;            
            if (!BP_DS_CreateFormFromExisitng.VerifyCheckBoxStatusForTheDomainItems(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        //[Then(@"I should see the checkbox in enabled state and checked by default for the Domain Item ""(.*)""")]
        //public void ThenIShouldSeeTheCheckboxInEnabledStateAndCheckedByDefaultForTheDomainItem(string DomainItem)
        //{
        //    if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterRenamingTheDomainItem(DomainItem))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}
        [Then(@"I should see the checkbox in enabled state and checked by default for the Domain Item ""(.*)"" in row ""(.*)""")]
        public void ThenIShouldSeeTheCheckboxInEnabledStateAndCheckedByDefaultForTheDomainItemInRow(string DomainItem, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterRenamingTheDomainItem(DomainItem, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the checkbox in enabled state and checked by default for the Domain Item")]
        public void ThenIShouldSeeTheCheckboxInEnabledStateAndCheckedByDefaultForTheDomainItem(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterRenamingTheDomainItem1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        //[Then(@"I should see the checkbox in enabled state and checked by default for the CodeList ""(.*)""")]
        //public void ThenIShouldSeeTheCheckboxInEnabledStateAndCheckedByDefaultForTheCodeList(string CodeList)
        //{
        //    if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterRenamingTheCodeList(CodeList))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}
        [Then(@"I should see the checkbox in enabled state and checked by default for the CodeList ""(.*)"" in row ""(.*)""")]
        public void ThenIShouldSeeTheCheckboxInEnabledStateAndCheckedByDefaultForTheCodeListInRow(string Codelist, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterRenamingTheCodeList(Codelist, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"the CodeList Include Checkbox should be checked and enabled for the below Codelists")]
        public void ThenTheCodeListIncludeCheckboxShouldBeCheckedAndEnabledForTheBelowCodelists(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterRenamingTheCodeList1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the Codelist as ""(.*)"" in row ""(.*)""")]
        public void ThenIShouldSeeTheCodelistAsInRow(string codelist, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifyTheCodelist(codelist, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the renamed Codelist as below")]
        public void ThenIShouldSeeTheRenamedCodelistAsBelow(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;            
            if (!BP_DS_CreateFormFromExisitng.VerifyTheCodelist1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [Then(@"the CodeList Include Checkbox should be unchecked and disabled automatically for ""(.*)"" in row ""(.*)""")]
        public void ThenTheCodeListIncludeCheckboxShouldBeUncheckedAndDisabledAutomaticallyForInRow(string Codelist, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterUncheckingTheDomainItem(Codelist, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"the CodeList Include Checkbox should be unchecked and disabled automatically for codelists")]
        public void ThenTheCodeListIncludeCheckboxShouldBeUncheckedAndDisabledAutomaticallyForCodelists(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterUncheckingTheDomainItem1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        //[Then(@"the Domain Item textbox is disabled for Domain Item ""(.*)""")]
        //public void ThenTheDomainItemTextboxIsDisabledForDomainItem(string DomainItem)
        //{
        //    if (!BP_DS_CreateFormFromExisitng.VerifytheDomainItemTextBox(DomainItem))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}
        [Then(@"the Domain Item textbox is disabled for Domain Item ""(.*)"" in row ""(.*)""")]
        public void ThenTheDomainItemTextboxIsDisabledForDomainItemInRow(string DomainItem, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifytheDomainItemTextBox(DomainItem, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"the Domain Item textbox is disabled for Domain Item")]
        public void ThenTheDomainItemTextboxIsDisabledForDomainItem(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifytheDomainItemTextBox1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"the Domain Item textbox is enabled for Domain Item")]
        [Then(@"the Domain textbox should be enabled for Domain")]
        public void ThenTheDomainItemTextboxIsEnabledForDomainItem(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifytheEnabledDomainItemTextBox(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        //[Then(@"the CodeList textbox is disabled for CodeList ""(.*)"" in row ""(.*)""")]
        //public void ThenTheCodeListTextboxIsDisabledForCodeListInRow(string CodeList, int row)
        //{
        //    if (!BP_DS_CreateFormFromExisitng.VerifytheCodeListTextBox(CodeList, row))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}
        [Then(@"the CodeList textbox is disabled for CodeList ""(.*)"" in row ""(.*)""")]
        public void ThenTheCodeListTextboxIsDisabledForCodeListInRow(string Codelist, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifytheCodeListTextBox(Codelist, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"the CodeList textbox is disabled for CodeList")]
        public void ThenTheCodeListTextboxIsDisabledForCodeList(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifytheCodeListTextBox1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I check the Include checkbox for Domain Item")]
        public void WhenICheckTheIncludeCheckboxForDomainItem(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.CheckTheDomainItemCheckbox(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [When(@"I Uncheck the Include checkbox for Domain Item ""(.*)"" in row ""(.*)""")]
        public void WhenIUncheckTheIncludeCheckboxForDomainItemInRow(string DomainItem, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.UncheckTheDomainItemCheckbox(DomainItem, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I Uncheck the Include checkbox for Domain Item")]
        public void WhenIUncheckTheIncludeCheckboxForDomainItem(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.UncheckTheDomainItemCheckbox1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I Uncheck the Include checkbox for Codelist Item")]
        public void WhenIUncheckTheIncludeCheckboxForCodelistItem(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.UncheckTheCodelistItemCheckbox1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }




        [Then(@"I shouldnot see the orange background color for the Domain Item ""(.*)"" in row ""(.*)""")]
        public void ThenIShouldnotSeeTheOrangeBackgroundColorForTheDomainItemInRow(string DomainItem, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifytheOrangeBackGroundColorForDomainItem(DomainItem, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I shouldnot see the orange background color for the Domain Item")]
        public void ThenIShouldnotSeeTheOrangeBackgroundColorForTheDomainItem(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifytheOrangeBackGroundColorForDomainItem1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I shouldnot see the orange background color for the CodeList ""(.*)""\tin row ""(.*)""")]
        public void ThenIShouldnotSeeTheOrangeBackgroundColorForTheCodeListInRow(string CodeList, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifytheOrangeBackGroundColorForTheCodelist(CodeList, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I shouldnot see the Orange background color for the codelists")]
        [Then(@"I should see the blue background color for the codelists")]
        public void ThenIShouldnotSeeTheOrangeBackgroundColorForTheCodelists(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifytheOrangeBackGroundColorForTheCodelist1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the Orange background color for the DomainItems")]
        [Then(@"I should see the Orange background color for the Domain")]
        public void ThenIShouldnotSeeTheOrangeBackgroundColorForTheDomainItems(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifytheOrangeBackGroundColorForTheDomainItem1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the Orange background color for the codelists")]
        public void ThenIShouldSeeTheOrangeBackgroundColorForTheCodelists(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifytheOrangeBackGroundColorForTheCodeList(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        //[Then(@"I should see the Target Codelist textbox in enabled state for the codelist ""(.*)"" in row ""(.*)""")]
        //public void ThenIShouldSeeTheTargetCodelistTextboxInEnabledStateForTheCodelistInRow(string codelist, int row)
        //{
        //    if (!BP_DS_CreateFormFromExisitng.VerifyTheTextBoxOfCodelistName(codelist, row))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        [Then(@"I should see the Target Codelist textbox in enabled state as below")]
        public void ThenIShouldSeeTheTargetCodelistTextboxInEnabledStateAsBelow(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyTheTextBoxOfCodelistName(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I rename the DomainItem to ""(.*)"" in row ""(.*)""")]
        public void WhenIRenameTheDomainItemToInRow(string RenamedDomainItem, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.RenameTheDomainItem(RenamedDomainItem, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }        
        
        [When(@"I rename the DomainItem as below")]
        public void WhenIRenameTheDomainItemAsBelow(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;            
            if (!BP_DS_CreateFormFromExisitng.RenameTheDomainItem1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the lable as below")]       
        public void ThenIShouldTheLableAsBelow(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifyLabel(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should not see the lable")]
        public void ThenIShouldNotSeeTheLable(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (BP_DS_CreateFormFromExisitng.LabelDoesnotExist(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I rename the ""(.*)"" as below")]
        public void WhenIRenameTheAsBelow(string Form, Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.RenameTheFormDetails(TableData, Form))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I expand the domain of row")]
        public void WhenIExpandTheDomainOfRow(Table table)
        {

            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;           
            if (!BP_DS_CreateFormFromExisitng.ExpandTheDomain(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }  


        [When(@"I click on the Link ""(.*)"" in CreateFormfromExiting window")]
        public void WhenIClickOnTheLinkInCreateFormfromExitingWindow(string linkName)
        {
            if (!BP_DS_CreateFormFromExisitng.ClickOnTheLinkInPopupWindow(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I rename the Domain ""(.*)"" to ""(.*)"" in row ""(.*)""")]
        public void WhenIRenameTheDomainToInRow(string Domain, string RenamedDomain, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.RenameTheDomainItem(RenamedDomain, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see all the checkboxes in disabled state and unchecked by default for the Domain Items")]
        public void ThenIShouldSeeAllTheCheckboxesInDisabledStateAndUncheckedByDefaultForTheDomainItems(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyCheckBoxStatusForTheDomainItemsUnchecked(TableData))
             {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see all the checkboxes in disabled state and unchecked by default for the Codelist")]
        public void ThenIShouldSeeAllTheCheckboxesInDisabledStateAndUncheckedByDefaultForTheCodelist(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyCheckBoxStatusForDisabledCodelists(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see all the checkboxes in enabled state and checked by default for the codelist")]
        public void ThenIShouldSeeAllTheCheckboxesInEnabledStateAndCheckedByDefaultForTheCodelist(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyCheckBoxStatusForCodelists(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
               
        
        [Then(@"the Domain should get expanded")]
        public void ThenTheDomainShouldGetExpanded(Table table)
        {
            StringBuilder UnverifiedQs = new StringBuilder();
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyTheDomainData(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"User clicks on the save button")]
        public void WhenUserClicksOnTheSaveButton()
        {
            if (!BP_DS_CreateFormFromExisitng.SaveButtonAtBottom())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"user should see the Form ""(.*)"" in Forms page")]
        public void ThenUserShouldSeeTheFormInFormsPage(string Form)
        {
            if (!BP_DS_CreateFormFromExisitng.FindForm(Form))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Verify button")]
        public void WhenIClickOnVerifyButton()
        {
            if (!BP_DS_CreateFormFromExisitng.ClickOnVerify())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Verify button in Create form from existing popup")]
        public void WhenIClickOnVerifyButtonInCreateFormFromExistingPopup()
        {
            if (!BP_DS_CreateFormFromExisitng.ClickOnVerifyInPopUp())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Save button in Create form from existing popup")]
        public void WhenIClickOnSaveButtonInCreateFormFromExistingPopup()
        {
            if (!BP_DS_CreateFormFromExisitng.ClickOnSaveInPopUp())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click on the Save Button")]
        public void WhenIClickOnTheSaveButton()
        {
            if (!BP_DS_CreateFormFromExisitng.ClickOnSave())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the Save button in disabled state at top of the pop up window")]
        public void ThenIShouldSeeTheSaveButtonInDisabledStateAtTopOfThePopUpWindow()
        {
            if (!BP_DS_CreateFormFromExisitng.SaveButtonAtTop())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the Save button in disabled state at bottom of the pop up window")]
        public void ThenIShouldSeeTheSaveButtonInDisabledStateAtBottomOfThePopUpWindow()
        {
            if (!BP_DS_CreateFormFromExisitng.SaveButtonAtBottom())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the Save button in enabled state at top of the pop up window")]
        public void ThenIShouldSeeTheSaveButtonInEnabledStateAtTopOfThePopUpWindow()
        {
            if (!BP_DS_CreateFormFromExisitng.SaveButtonAtTopInEbaledState())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the Save button in enabled state at bottom of the pop up window")]
        public void ThenIShouldSeeTheSaveButtonInEnabledStateAtBottomOfThePopUpWindow()
        {
            if (!BP_DS_CreateFormFromExisitng.SaveButtonAtBottomInEnabledState())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"User sees the error message ""(.*)"" for the field ""(.*)""")]
        public void ThenUserSeesTheErrorMessageForTheField(string ErrorMessage, string FieldName)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifyTheErrorMessage(ErrorMessage, FieldName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"User should not see the error message ""(.*)"" for the field ""(.*)""")]
        public void ThenUserShouldNotSeeTheErrorMessageForTheField(string ErrorMessage, string FieldName)
        {
            if (!BP_DS_CreateFormFromExisitng.ErrorMsgShouldDisappear(ErrorMessage, FieldName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see the orange background color for the Domain")]
        public void ThenISeeTheOrangeBackgroundColorForTheDomain(Table table)
        {            
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyDuplicateDomainData(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
        [When(@"I rename the CodeList from ""(.*)"" to ""(.*)"" in row ""(.*)""")]
        public void WhenIRenameTheCodeListFromToInRow(string Codelist, string RenamedCodelist, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.RenameTheCodeList(Codelist, RenamedCodelist, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I rename the Codelist as below")]
        public void WhenIRenameTheCodelistAsBelow(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.RenameTheCodeList1(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I should not see the orange background color for the ""(.*)""")]
        public void ThenIShouldNotSeeTheOrangeBackgroundColorForThe(string field, Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyNonDuplicateDomainData(TableData, field))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I should see the orange background color for the Domain Items")]
        public void ThenIShouldSeeTheOrangeBackgroundColorForTheDomainItems(Table table)
        {
            
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyDuplicateDomainItem(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
                
        [Then(@"I should not see the orange background color for the Domain Items ""(.*)""")]
        public void ThenIShouldNotSeeTheOrangeBackgroundColorForTheDomainItems(string field, Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyNonDuplicateDomainItem(TableData, field))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[Then(@"I should see the checkbox in disabled state")]
        //public void ThenIShouldSeeTheCheckboxInDisabledState(Table table)
        //{
        //    IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
        //    List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
        //    List<string> Unverified = new List<string>();
        //    if (BP_DS_CreateFormFromExisitng.(TableData))
        //    {
        //        if (BP_DS_CreateFormFromExisitng.VerifyCheckBoxForDomainItem(TableData))
        //        {
        //            ScenarioContext.Current["ActResult"] = "Failed";
        //        };
        //    }
        //}



        [When(@"I change the field Name for Form name, Form Label, Table Name and AutoBuild as below")]
        public void WhenIChangeTheFieldNameForFormNameFormLabelTableNameAndAutoBuildAsBelow(Table table)
        {
            
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.SetFormFields(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I Change the Domain as")]
        public void WhenIChangeTheDomainAs(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.SetDomainFields(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
        [When(@"I change the Domain Item for ""(.*)""")]
        public void WhenIChangeTheDomainItemFor(string field, Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.SetDomainItemFields(TableData, field))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the Checkbox enabled for the ""(.*)""")]
        public void ThenIShouldSeeTheCheckboxEnabledForThe(string field, Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyCheckboxEnabled(TableData, field))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I check the Domain Item for ""(.*)""")]
        public void WhenICheckTheDomainItemFor(string field, Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.SelectCheckbox(TableData, field))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the DomainItem as below for the Questions")]
        public void ThenIShouldSeeTheDomainItemAsBelowForTheQuestions(Table table)
        {
            IEnumerable<FormQuestion> Data = table.CreateSet<FormQuestion>();
            List<FormQuestion> TableData = (List<FormQuestion>)Data;
            List<string> Unverified = new List<string>();
            if (!FormQuestionsUtilities.FormQuestion(table.CreateSet<FormQuestion>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the error message ""(.*)"" in row ""(.*)""")]
        public void ThenIShouldSeeTheErrorMessageInRow(string ErrorMessage, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifyTheErrorMessageforTheDomainItem(ErrorMessage, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the error message ""(.*)""")]
        public void ThenIShouldSeeTheErrorMessage(string EorrMsg, Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            if (!BP_DS_CreateFormFromExisitng.VerifyTheErrorMessageforTheDomainItem1(TableData, EorrMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I navigate to the page ""(.*)""")]
        public void WhenINavigateToThePage(int pageNumber)
        {
            if (!BP_DS_CreateFormFromExisitng.NavigateToPage(pageNumber))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on the Link in the popup ""(.*)""")]
        public void WhenIClickOnTheLinkInThePopup(string Link)
        {
            if (!BP_DS_CreateFormFromExisitng.ClickOnTheLink(Link))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click on cancel button")]
        public void WhenIClickOnCancelButton()
        {
            if (!BP_DS_CreateFormFromExisitng.ClickOnCancelButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I navigate to the page")]
        public void WhenINavigateToThePage()
        {
            if (!BP_DS_CreateFormFromExisitng.ClickOnCancelButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"the CodeList Include Checkbox should be unchecked and disabled for the Codelist""(.*)""(.*)""")]
        public void ThenTheCodeListIncludeCheckboxShouldBeUncheckedAndDisabledForTheCodelist(string Codelist, int row)
        {
            if (!BP_DS_CreateFormFromExisitng.VerifytheCheckBoxStatusAfterUncheckingTheDomainItem(Codelist, row))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"the CodeList Include Checkbox should be unchecked and disabled for the below Codelists")]
        public void ThenTheCodeListIncludeCheckboxShouldBeUncheckedAndDisabledForTheBelowCodelists(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyTheIncludeCheckBoxOfCodelistName(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"the Domain Include Checkbox should be unchecked and disabled for the below DomainItems")]
        public void ThenTheDomainIncludeCheckboxShouldBeUncheckedAndDisabledForTheBelowDomainItems(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyTheIncludeCheckBoxOfDomainItem(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"the CodeList Include Checkbox should be disabled for the below Codelists")]
        public void ThenTheCodeListIncludeCheckboxShouldBeDisabledForTheBelowCodelists(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyTheIncludeCheckBoxOfCodelistName(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the Codelist as below")]
        public void ThenIShouldSeeTheCodelistAsBelow(Table table)
        {
            IEnumerable<CreateFormfromExistingTable> Data = table.CreateSet<CreateFormfromExistingTable>();
            List<CreateFormfromExistingTable> TableData = (List<CreateFormfromExistingTable>)Data;
            List<string> Unverified = new List<string>();
            if (!BP_DS_CreateFormFromExisitng.VerifyCodelistBox(TableData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


    }
}
