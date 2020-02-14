using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Labs;
using BusinessProcesses.DataLabs.Main;
using BusinessProcesses.DataLabs.ManageReferenceRanges;
using Framework.Actions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Pages.DataLabs.Common;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.ManageReferenceRanges
{
    [Binding]
    public sealed class ManageReferenceRanges : TechTalk.SpecFlow.Steps
    {
        [Given(@"I click breadcrumb ""(.*)""")]
        public void GivenIClickBreadcrumb(string breadCrumbItemText)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ClickBreadCrumbItem(breadCrumbItemText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
        [Then(@"I see page ""(.*)""")]
        public void ThenISeePage(string PageName)
        {
            string HlpText = Control_ActionUtilities.GetTextOfAnObject(DL_Lab_ManageReferenceRanges.ManageReferenceRanges, "Lab Management Help text", "Study Administration", "Unable to verify help text for Lab Management page.");
            if (!PageName.Equals(HlpText))
            {
                Control_ActionUtilities.LogException("Verification of Lab Management help text as '" + PageName + "'", string.Empty, "Help text for Lab Management is not displayed as " + PageName + " on Study Administration page.");
            }
            //Control_ActionUtilities.VerifyObjectExistOnPage(DL_Lab_ManageReferenceRanges.ManageReferenceRanges, "Manage Reference Ranges title", "Lab Management", "Unable to verify manage reference range page");
        }

        [Then(@"I see ""(.*)"" left action palette for a Lab Test")]
        public void ThenISeeLeftActionPaletteForALabTest(string p0)
        {
            Control_ActionUtilities.VerifyObjectExistOnPage(DL_Lab_ManageReferenceRanges.RRLabTestName, "Lab Management Left Action Palette", "Lab Management", "Unable to verify left action palatte on reference range page.");
        }

        [When(@"I click test ""(.*)"" in reference range page")]
        public void WhenIClickTestInReferenceRangePage(string labtestName)
        {
            if (!BP_ReferenceRangesUtilities.ReferenceRangeLabTestSearch(labtestName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see ""(.*)"" test details in ReferenceRangesPage")]
        [When(@"I see ""(.*)"" test details in ReferenceRangesPage")]
        public void WhenISeeTestDetailsInReferenceRangePage(string p0)
        {
            Control_ActionUtilities.VerifyObjectExistOnPage(DL_Lab_ManageReferenceRanges.LabTestOnHeader, "Lab Test Details", "Manage Reference Ranges", "Unable to verify the details on Lab Tests page.");
        }

        [Then(@"I verify the below columns names displayed in the Manage Reference Ranges table")]
        public void ThenIVerifyTheBelowColumnsNamesDisplayedInTheManageReferenceRangesTable(Table tableheader)
        {
            IEnumerable<ManageReferenceLabGridColumnName> tableheadernames = tableheader.CreateSet<ManageReferenceLabGridColumnName>();

            if (!BP_ManageReferenceRange_MRRUtilities.AreColumnsAvailable((List<ManageReferenceLabGridColumnName>)tableheadernames))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I open lab with labid ""(.*)"" from ManageReferenceRanges page")]
        [Given(@"I open lab with labid ""(.*)"" from ManageReferenceRanges page")]
        public void GivenIOpenLabWithLabidFromManageReferenceRangesPage(string labId)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.OpenLab(labId))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
               
       [When(@"I open the lab with the following details in Manage Reference Ranges page")]
        public void WhenIOpenTheLabWithTheFollowingDetailsInManageReferenceRangesPage(Table table)
        {
            ManageReferenceLabGridRowData labGridRowData = table.CreateInstance<ManageReferenceLabGridRowData>();

            if (!BP_ManageReferenceRange_MRRUtilities.OpenLab(labGridRowData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I open labtest with labname ""(.*)"" from labtests page")]
        [Given(@"I open labtest with labname ""(.*)"" from labtests page")]
        public void GivenIOpenLabtestWithLabnameFromLabtestsPage(string labName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.OpenLabTest(labName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter search text ""(.*)"" in Lab Test \(Name\) search box in ReferenceRangesPage")]
        public void WhenIEnterSearchTextInLabTestNameSearchBoxInReferenceRangesPage(string searchText)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.SetSearchText_ReferenceRanges(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see lab tests based on searchtext ""(.*)"" in ReferenceRangesPage")]
        public void ThenISeeLabTestsBasedOnSearchtextInReferenceRangesPage(string searchText)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.VerifySearchedItems_ReferenceRanges(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see No records message in ReferenceRangesPage")]
        public void ThenISeeNoRecordsMessageInReferenceRangesPage()
        {
            if (!BP_ManageReferenceRange_MRRUtilities.IsNoRecordsMessageExistInSitesTable())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I clear filter on column ""(.*)"" in ReferenceRangesPage")]
        public void ThenIClearFilterOnColumnInReferenceRangesPage(string columnName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ClearFilter(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I navigate to ""(.*)"" tab to refesh the page\.")]
        public void ThenINavigateToTabToRefeshThePage_(string p0)
        {
            if (!BP_MainNavigationUtilities.SelectPrimaryTabOnMenu(p0))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "User unable to navigate to Patients tab. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I apply filter on column ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in ManageReferenceRangesPage")]
        public void WhenIApplyFilterOnColumnWithFilterTextByFilterCriteriaInManageReferenceRangesPage(String columnName, String filterText, String filterCriteria)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ApplyFilter(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[When(@"I apply filter on column ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in Mrr Lab Test Name Grid")]
        //public void WhenIApplyFilterOnColumnWithFilterTextByFilterCriteriaInMrrLabTestNameGrid(String columnName, string filterText, String filterCriteria)
        //{
        //    if (!BP_ManageReferenceRange_MRRUtilities.ApplyFilter(columnName, filterText, filterCriteria))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        [When(@"I apply filter on columns (.*),(.*) by filter criteria ""(.*)"" in ManageReferenceRangesPage")]
        public void WhenIApplyFilterOnColumnsByFilterCriteriaInManageReferenceRangesPage(string columnName, string columnData, string filterCriteria)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ApplyFilterWithInvalidData(columnName, columnData, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see filtered data in column ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in ManageReferenceRangesPage")]
        public void ThenISeeFilteredDataInColumnWithFilterTextAndFilterCriteriaInManageReferenceRangesPage(String columnName, String filterText, String filterCriteria)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.IsDataFiltered(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[Then(@"I see filtered data in column ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in Mrr Lab Test Name Grid")]
        //public void ThenISeeFilteredDataInColumnWithFilterTextAndFilterCriteriaInMrrLabTestNameGrid(String columnName, String filterText, String filterCriteria)
        //{
        //    if (!BP_ManageReferenceRange_MRRUtilities.IsDataFilteredForAge(columnName, filterText, filterCriteria))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        [Then(@"I clear filter on column ""(.*)"" in ManageReferenceRangesPage")]
        public void ThenIClearFilterOnColumnInManageReferenceRangesPage(string columnName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ClearFilter(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[When(@"breadcrumb shall display as ""(.*)"" > ""(.*)"" > ""(.*)""")]
        //[Then(@"breadcrumb shall display as ""(.*)"" > ""(.*)"" > ""(.*)""")]
        //public void ThenBreadcrumbShallDisplayAs(string labId, string labTestName, string labTestPage)
        //{
        //    List<string> BreadCrumbs = new List<string>();
        //    BreadCrumbs.Add(labId);
        //    BreadCrumbs.Add(labTestName);
        //    BreadCrumbs.Add(labTestPage);
        //    String MissingItem = String.Empty;
        //    if (!BP_BreadCrumbUtilities.HasBreadCrumbItems(DL_CommonObjects.BreadCrumbContainer, BreadCrumbs, out MissingItem))
        //    {
        //        Assert.Fail("BreadCrumbItem " + MissingItem + " is not displayed.");
        //    }
        //}

        [Then(@"Page header should be displaye as ""(.*)""")]
        public void ThenPageHeaderShouldBeDisplayeAs(string p0)
        {
            Control_ActionUtilities.VerifyObjectExistOnPage(DL_Lab_ManageReferenceRanges.LabTestOnHeader, "Lab Test Details", "Manage Reference Ranges", "Unable to verify the details on Lab Tests page.");
        }

        [Then(@"I see No records message in Reference Range Page")]
        [Then(@"I see No records message in Manage Reference Range Page")]
        public void ThenISeeNoRecordsMessageInManageReferenceRangePage()
        {
            if (!BP_ManageReferenceRange_MRRUtilities.IsNoRecordsMessageExistInSitesTable())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see No records message in labTests Page")]
        public void ThenISeeNoRecordsMessageInLabTestsPage()
        {
            if (!BP_ManageReferenceRange_MRRUtilities.IsNoRecordsMessageExistInSitesTable())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[Then(@"breadcrumb should display as ""(.*)"" > ""(.*)""")]
        //public void ThenBreadcrumbShouldDisplayAs(string labId, string labTestName)
        //{
        //    List<string> BreadCrumbs = new List<string>();
        //    BreadCrumbs.Add(labId);
        //    BreadCrumbs.Add(labTestName);
        //    String MissingItem = String.Empty;
        //    if (!BP_BreadCrumbUtilities.HasBreadCrumbItems(DL_CommonObjects.BreadCrumbContainer, BreadCrumbs, out MissingItem))
        //    {
        //        Assert.Fail("BreadCrumbItem " + MissingItem + " is not displayed.");
        //    }
        //}

        [Then(@"I see breadcrumb items in order")]
        public void ThenISeeBreadcrumbItemsInOrder(Table table)
        {
            IEnumerable<BreadCrumbData> data = table.CreateSet<BreadCrumbData>();
            if (!BP_BreadCrumbUtilities.HasBreadCrumbItems(DL_CommonObjects.BreadCrumbContainer, data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see the header details ""(.*)"",""(.*)"",""(.*)"",""(.*)"" in Labtests page")]
        public void ThenISeeTheHeaderDetailsInLabtestsPage(string labId, string laboratoryName, string company, string department)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.VerifyHeader(labId, laboratoryName, company, department))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see the lab address details ""(.*)"",""(.*)"",""(.*)"",""(.*)"" in the Labtests page")]
        public void ThenISeeTheLabAddressDetailsInTheLabtestsPage(string address, string city, string state, string country)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.VerifyLabAddress(address, city, state, country))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I verify the below columns names displayed in the labTests table")]
        public void ThenIVerifyTheBelowColumnsNamesDisplayedInTheLabTestsTable(Table table)
        {
            IEnumerable<ManageReferenceLabGridColumnName> tableheader = table.CreateSet<ManageReferenceLabGridColumnName>();

            if (!BP_ManageReferenceRange_MRRUtilities.AreColumnsAvailable((List<ManageReferenceLabGridColumnName>)tableheader))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I sort column ""(.*)"" in LabsGrid of ManageReferenceRangesPage")]
        public void WhenISortColumnInLabsGridOfManageReferenceRangesPage(string columnName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ClickOnColumnHeader(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I sort column ""(.*)"" in LabsGrid of LabTestsPage")]
        public void WhenISortColumnInLabsGridOfLabTestsPage(string columnName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ClickOnLabsTestColumnHeader(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should that the cancel button has cross icon in red color\.")]
        public void ThenIShouldThatTheCancelButtonHasCrossIconInRedColor_()
        {
            if (!BP_ReferenceRangesUtilities.VerifyCancelButtonIcon())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see data in sort order ""(.*)"" in column ""(.*)"" in ManageReferenceRangesPage")]
        public void ThenISeeDataInSortOrderInColumnInManageReferenceRangesPage(String sortOrder, String columnName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.IsDataInSortOrder(sortOrder, columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see data in sort order ""(.*)"" in column ""(.*)"" in LabTestsPage")]
        public void ThenISeeDataInSortOrderInColumnInLabTestsPage(String sortOrder, String columnName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.IsLabsTestsDataInSortOrder(sortOrder, columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I apply filter on column ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in LabTestsGrid")]
        public void WhenIApplyFilterOnColumnWithFilterTextByFilterCriteriaInLabTestsGrid(String columnName, String filterText, String filterCriteria)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ApplyLabsTestFilter(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I see filtered data in column ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in LabTestsGrid")]
        [Then(@"I see filtered data in column ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in LabTestsGrid")]
        public void ThenISeeFilteredDataInColumnWithFilterTextAndFilterCriteriaInLabTestsGrid(String columnName, String filterText, String filterCriteria)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.IsLabsTestDataFiltered(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I clear filter on column ""(.*)"" in LabTestsGrid")]
        public void ThenIClearFilterOnColumnInLabTestsGrid(String columnName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.ClearLabsTestFilter(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see below ActionPalette Items in ""(.*)"" ActionPalette")]
        [Then(@"I see below ActionPalette Items in ""(.*)"" ActionPalette")]
        public void ThenISeeBelowActionPaletteItemsInActionPalette(string actionPalette, Table table)
        {
            IEnumerable<ReferenceRangeLeftActionPalette> tableheadernames = table.CreateSet<ReferenceRangeLeftActionPalette>();
            if (!BP_ManageReferenceRange_MRRUtilities.IsActionPaletteLinkAvailable((List<ReferenceRangeLeftActionPalette>)tableheadernames, actionPalette))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see below ActionPalette Items in Left ActionPalette")]
        public void ThenISeeBelowActionPaletteItemsInLeftActionPalette(Table table)
        {
            IEnumerable<ReferenceRangeLeftActionPalette> tableheadernames = table.CreateSet<ReferenceRangeLeftActionPalette>();
            if (!BP_ManageReferenceRange_MRRUtilities.IsLeftActionPaletteLinkAvailable((List<ReferenceRangeLeftActionPalette>)tableheadernames))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I do not see any ActionPalette Items in Left ActionPalette")]
        public void ThenIDoNotSeeAnyActionPaletteItemsInLeftActionPalette(Table table)
        {
            IEnumerable<ReferenceRangeLeftActionPalette> tableheadernames = table.CreateSet<ReferenceRangeLeftActionPalette>();
            if (BP_ManageReferenceRange_MRRUtilities.IsLeftActionPaletteLinkAvailable((List<ReferenceRangeLeftActionPalette>)tableheadernames))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter ""(.*)"" in ""(.*)"" search field")]
        public void WhenIEnterInSearchField(string SearchValue, string FieldName)
        {
            if (!BP_ManageReferenceRange_MRRUtilities.EnterValueInSearchField(FieldName, SearchValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
                ScenarioContext.Current["Comments"] = "Search criteria is not eneterd in the search field.";
            }
        }

        [Then(@"I see palette display the ""(.*)"" search criteria matching records")]
        public void ThenISeePaletteDisplayTheSearchCriteriaMatchingRecords(string searchCriteria, Table table)
        {
            IEnumerable<ReferenceRangeLeftActionPalette> tableheadernames = table.CreateSet<ReferenceRangeLeftActionPalette>();
            if (!BP_ManageReferenceRange_MRRUtilities.IsActionPaletteLinkAvailable((List<ReferenceRangeLeftActionPalette>)tableheadernames, searchCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
