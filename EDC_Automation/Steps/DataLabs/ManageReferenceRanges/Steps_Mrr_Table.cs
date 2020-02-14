using BusinessProcesses.DataLabs.ManageReferenceRanges;
using Framework.Actions;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
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
    public class Steps_Mrr_Table
    {
        [Then(@"I should see the below mentioned column header names in the MRR table of Manage Reference Ranges page")]
        public void ThenIShouldTheBelowMentionedColumnHeaderNames(Table mrrTableHeader)
        {
            IEnumerable<MRRTableGridColumnNames> mrrTableHeaderNames = mrrTableHeader.CreateSet<MRRTableGridColumnNames>();

            if (!BP_MrrTableUtilities.AreColumnsAvailable((List<MRRTableGridColumnNames>)mrrTableHeaderNames))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            
        }

        [Then(@"I should see the checkbox in the MRR table column header of Manage Reference Ranges page")]
        public void ThenIShouldTheCheckboxInTheInTheMRRTableColumnHeaderOfManageReferenceRangesPage()
        {
            if (!BP_MrrTableUtilities.CheckboxVerticationInMRRTableColumnHeader())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I should see the below mentioned sub column header names under the header Normal Range in the MRR table of Manage Reference Ranges page")]        
        public void ThenIShouldSeeTheBelowMentionedSubColumnHeaderNamesUnderTheHeaderNormalRange(Table mrrTableHeader)
        {
            IEnumerable<MRRTableGridColumnNames> mrrTableHeaderNames = mrrTableHeader.CreateSet<MRRTableGridColumnNames>();

            if (!BP_MrrTableUtilities.AreColumnsAvailableInSubHeadingForNormalRange((List<MRRTableGridColumnNames>)mrrTableHeaderNames))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the below mentioned sub column header names under the header Critical Range in the MRR table of Manage Reference Ranges page")]
        public void ThenIShouldSeeTheBelowMentionedSubColumnHeaderNamesUnderTheHeader(Table mrrTableHeader)
        {
            IEnumerable<MRRTableGridColumnNames> mrrTableHeaderNames = mrrTableHeader.CreateSet<MRRTableGridColumnNames>();

            if (!BP_MrrTableUtilities.AreColumnsAvailableInSubHeadingForCriticalRange((List<MRRTableGridColumnNames>)mrrTableHeaderNames))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I sort column ""(.*)"" in MrrGrid of ManageReferenceRangesPage")]
        [Then(@"I sort column ""(.*)"" in MrrGrid of ManageReferenceRangesPage to clear sorting")]
        public void WhenISortColumnInLabsGridOfManageReferenceRangesPage(string columnName)
        {
            if (!BP_MrrTableUtilities.ClickOnColumnHeader(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I sort column ""(.*)"" of occurence ""(.*)"" in Normal Range MrrGrid of ManageReferenceRangesPage")]
        [When(@"I sort column Normal Range ""(.*)"" of occurence ""(.*)"" in Normal Range MrrGrid of ManageReferenceRangesPage")]
        [When(@"I sort column ""(.*)"" of occurence ""(.*)"" in Critical Range MrrGrid of ManageReferenceRangesPage")]
        [Then(@"I sort column ""(.*)"" of occurence ""(.*)"" in Normal Range MrrGrid of ManageReferenceRangesPage")]
        [Then(@"I sort column ""(.*)"" of occurence ""(.*)"" in Critical Range MrrGrid of ManageReferenceRangesPage")]
        [Then(@"I sort column ""(.*)"" of occurence ""(.*)"" in Normal Range MrrGrid of ManageReferenceRangesPage to clear sorting")]
        [Then(@"I sort column ""(.*)"" of occurence ""(.*)"" in Critical Range MrrGrid of ManageReferenceRangesPage to clear sorting")]
        public void WhenISortColumnOfOccurenceInNormalRangeMrrGridOfManageReferenceRangesPage(string columnName, int occurence)
        {
            if (!BP_MrrTableUtilities.ClickOnColumnHeader(columnName, occurence))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see data in sort order ""(.*)"" in column ""(.*)"" in the MrrGrid of Mrr page")]
        public void ThenISeeDataInSortOrderInColumnInLabGrid(String sortOrder, String columnName)
        {
            if (!BP_MrrTableUtilities.IsDataInSortOrder(sortOrder, columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see data in sort order ""(.*)"" in column ""(.*)"" in the MrrGrid of Mrr page for RefID")]
        [Then(@"I see data in sort order ""(.*)"" in column ""(.*)"" in the MrrGrid of Mrr page for Gender")]
        public void ThenISeeDataInSortOrderInColumnInTheMrrGridOfMrrPageForRefID(string sortOrder, string columnName)
        {
            if (!BP_MrrTableUtilities.IsDataInSortOrderFor(sortOrder, columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see data in sort order ""(.*)"" in column ""(.*)"" in the MrrGrid of Mrr page")]
        public void ThenIShouldSeeDataInSortOrderInColumnInTheMrrGridOfMrrPage(string sortOrder, string columnName)
        {
            if (!BP_MrrTableUtilities.IsDateDataInSortOrder(sortOrder, columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see data in sort order ""(.*)"" in column ""(.*)"" of ""(.*)"" in the MrrGrid of Mrrpage")]
        public void ThenISeeDataInSortOrderInColumnOfInTheMrrGridOfMrrpage(string sortOrder, string columnName, string range)
        {
            if (!BP_MrrTableUtilities.IsDataInSortOrder(sortOrder, columnName, range))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I apply filter on column ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in LabsGrid")]
        public void WhenIApplyFilterOnColumnWithFilterTextByFilterCriteriaInLabsGrid(String columnName, String filterText, String filterCriteria)
        {
            //if (!BP_MrrTableUtilities.ApplyFilter(columnName, filterText, filterCriteria))
            //{
            //    ScenarioContext.Current["ActResult"] = "Failed";
            //}
        }


        [Then(@"I see the lab address details ""(.*)"",""(.*)"",""(.*)"",""(.*)"" in the Mrr Labtests page")]
        public void ThenISeeTheLabAddressDetailsInTheMrrLabtestsPage(string address, string city, string state, string country)
        {
            if (!BP_MrrTableUtilities.VerifyLabAddress(address, city, state, country))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"breadcrumb should display as ""(.*)"" > ""(.*)"" > ""(.*)"" in Mrr Lab Test page")]
        public void ThenBreadcrumbShouldDisplayAsInMrrLabTestPage(string p0, string p1, string p2)
        {
            ScenarioContext.Current.Pending();
        }

        [Then(@"I see the header details ""(.*)"",""(.*)"",""(.*)"",""(.*)"" in Mrr Labtests page")]
        public void ThenISeeTheHeaderDetailsInMrrLabtestsPage(String labId, String laboratoryName, String company, String department)
        {
            if (!BP_MrrTableUtilities.VerifyHeader(labId, laboratoryName, company, department))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see lab Test name ""(.*)"" in the right corner of the page above the lab address")]
        public void ThenISeeLabTestNameInTheRightCornerOfThePageAboveTheLabAddress(string labTestName)
        {
            if (!BP_MrrTableUtilities.VerifyLabTestName(labTestName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see Add and Delete buttons in the table header of Mrr page")]
        public void ThenIShouldSeeAddAndDeleteButtonsInTheTableHeaderOfMrrPage()
        {
            if (!BP_MrrTableUtilities.VerifyAddAndDeleteButtons())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see ""(.*)"" check box in the table header of Mrr page")]
        public void ThenIShouldSeeCheckBoxInTheTableHeaderOfMrrPage(string checkBoxName)
        {
            Control_ActionUtilities.VerifyObjectExistOnPage(DL_Lab_MRR_Table.DeleteCheckbox, checkBoxName, "LabTestName", "Unable to verify Delete Checkbox in Lab Test Name page.");
        }

        [Then(@"I should see the name for check box as ""(.*)""")]
        public void ThenIShouldSeeTheNameForCheckBoxAs(string checkBoxName)
        {
            if (!BP_MrrTableUtilities.VerifyText(checkBoxName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I apply filter on column ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in Mrr Lab Test Name Grid")]
        public void WhenIApplyFilterOnColumnWithFilterTextByFilterCriteriaInMrrLabTestNameGrid(String columnName, string filterText, String filterCriteria)
        {
            if (!BP_MrrTableUtilities.ApplyFilter(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I apply filter on column ""(.*)"" by selecting ""(.*)"" option in Mrr Lab Test Name Grid in MRR page")]
        public void WhenIApplyFilterOnColumnBySelectingOptionInMrrLabTestNameGridInMRRPage(string columnName, string filterText)
        {
            if (!BP_MrrTableUtilities.ApplyFilterForNAColumnInMRRTable(columnName, filterText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I apply filter on column ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in Mrr Lab Test Name Grid for ""(.*)"" sub column")]
        [When(@"I apply filter on column Normal Range ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in Mrr Lab Test Name Grid for ""(.*)"" sub column")]
        [When(@"I apply filter on column Critical Range ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in Mrr Lab Test Name Grid for ""(.*)"" sub column")]
        public void WhenIApplyFilterOnColumnWithFilterTextByFilterCriteriaInMrrLabTestNameGridForSubColumn(String columnName, String filterText, String filterCriteria, int occurence)
        {
            if (!BP_MrrTableUtilities.ApplyFilterForSubHeading(columnName, filterText, filterCriteria ,occurence))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }      


        [Then(@"I see filtered data in column ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in Mrr Lab Test Name Grid")]
        public void ThenISeeFilteredDataInColumnWithFilterTextAndFilterCriteriaInMrrLabTestNameGrid(String columnName, String filterText, String filterCriteria)
        {
            if (!BP_MrrTableUtilities.IsDataFilteredForAge(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see filtered data in column ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in Mrr Lab Test Name Grid for ""(.*)"" sub column")]
        [Then(@"I see filtered data in column Normal Range ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in Mrr Lab Test Name Grid for ""(.*)"" sub column")]
        [Then(@"I see filtered data in column Critical Range ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in Mrr Lab Test Name Grid for ""(.*)"" sub column")]
        public void ThenISeeFilteredDataInColumnWithFilterTextAndFilterCriteriaInMrrLabTestNameGridForSubColumn(String columnName, String filterText, String filterCriteria, int occurence)
        {
            if (!BP_MrrTableUtilities.IsDataFiltered(columnName, filterText, filterCriteria, occurence))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }      


        [Then(@"I clear filter on column ""(.*)"" in Mrr Lab Test Name Grid")]
        public void ThenIClearFilterOnColumnInMrrLabTestNameGrid(string columnName)
        {
            if (!BP_MrrTableUtilities.ClearFilter(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I clear filter on column ""(.*)"" in Mrr Lab Test Name Grid for subcolumn ""(.*)""")]
        [Then(@"I clear filter on column Normal Range ""(.*)"" in Mrr Lab Test Name Grid for subcolumn ""(.*)""")]        
        [Then(@"I clear filter on column Critical Range ""(.*)"" in Mrr Lab Test Name Grid for subcolumn ""(.*)""")]
        public void ThenIClearFilterOnColumnInMrrLabTestNameGridForSubcolumn(string columnName, int occurence)
        {
            if (!BP_MrrTableUtilities.ClearFilterForSubColumns(columnName, occurence))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }        

        [Then(@"I see the message ""(.*)"" before adding the records")]
        public void ThenISeeTheMessageBeforeAddingTheRecords(string message)
        {
            if (!BP_MrrTableUtilities.VerifyTextInTable(message))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }     


    }
}
