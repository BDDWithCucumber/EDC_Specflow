using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Labs;
using BusinessProcesses.DataLabs.ManageReferenceRanges;
using EDC_Automation.Helpers;
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
    public class ReferenceRangesAddCopyModify : TechTalk.SpecFlow.Steps
    {
        //int referencerangeIDindex = 1;
        [When(@"I can see the Reference Ranges of a ""(.*)"" lab test in ReferenceRangesPage")]
        [Then(@"I can see the Reference Ranges of a ""(.*)"" lab test in ReferenceRangesPage")]
        public void ThenICanSeeTheReferenceRangesOfALabTestInReferenceRangesPage(string labTest)
        {
            string HlpText = Control_ActionUtilities.GetTextOfAnObject(ReferenceRangesPage.LabTest, "Lab Management Lab Test", "Lab Management", "Unable to verify Lab Test on Lab Management page.");
            if (!labTest.Equals(HlpText))
            {
                Control_ActionUtilities.LogException("Verification of Lab Test '" + labTest + "'", string.Empty, "Unable to verify Lab Test " + labTest + " on Lab Management page.");
            }           
        }

        [Then(@"Page header should be displayed as ""(.*)""")]
        public void ThenPageHeaderShouldBeDisplayedAs(string labDetails)
        {
            string HlpText = Control_ActionUtilities.GetTextOfAnObject(ReferenceRangesPage.LabTestDetails, "Lab Management Help text", "Study Administration", "Unable to verify help text for Lab Management page.");
            if (!labDetails.Equals(HlpText))
            {
                Control_ActionUtilities.LogException("Verification of Lab Management help text as '" + labDetails + "'", string.Empty, "Help text for Lab Management is not displayed as " + labDetails + " on Study Administration page.");
            }
        }

        [When(@"I click on add button to create the record with the overlap data in ReferenceRangesPage")]
        [When(@"I click on add button to create the record with the duplicate data in ReferenceRangesPage")]
        [When(@"I click add button to add a new lab test in ReferenceRangesPage")]
        [When(@"I click add button to add a new lab test in ReferenceRangesPage")]
        [When(@"I click on Add button to create a new lab test range record")]
        public void WhenIClickOnAddButtonToCreateANewLabTestRangeRecord()
        {
            if (!BP_ReferenceRangesUtilities.ClickOnAddButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click on cancel button of the first record")]
        public void WhenIClickOnCancelButtonOfTheFirstRecord()
        {
            if (!BP_ReferenceRangesUtilities.ClickOnCancelButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Save the empty record")]
        public void WhenSaveTheEmptyRecord()
        {
            ScenarioContext.Current.Pending();
        }

        [Then(@"I see error message ""(.*)"" for column ""(.*)""")]
        public void ThenISeeReferenceRangeCreationErrorMessageForColumn(String errorMessage, String column)
        {
            if (!BP_ReferenceRangesUtilities.VerifyErrorMessage(errorMessage, column))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click add and enter reference ranges of a lab test and Save and can see ""(.*)"" message upon each record save in ReferenceRangesPage")]
        [Then(@"I click add and enter reference ranges of a lab test and Save and can see ""(.*)"" message upon each record save in ReferenceRangesPage")]
        public void WhenIClickAddAndEnterReferenceRangesOfALabTestAndSaveAndCanSeeMessageUponEachRecordSaveInReferenceRangesPage(string successmessage, Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.SetRowDataForCreate((List<ReferenceRangesData>)rowdata, successmessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I click add and enter reference ranges of a lab test and Save and can see ""(.*)"" message upon each record save in ReferenceRangesPage including NA")]
        [When(@"I click add and enter reference ranges of a lab test and Save and can see ""(.*)"" message upon each record save in ReferenceRangesPage including NA")]
        public void WhenIClickAddAndEnterReferenceRangesOfALabTestAndSaveAndCanSeeMessageUponEachRecordSaveInReferenceRangesPageIncludingNA(string successmessage, Table labList)
        {
            
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.SetRowDataForCreateWithNA((List<ReferenceRangesData>)rowdata, successmessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            foreach (ReferenceRangesData dataval in rowdata)
            {
                List<string> ReferenceRangesData = new List<string>
                {
                    dataval.ReferenceRangeID
                };
                int referencerangeIDindex = Convert.ToInt32(FeatureContext.Current["RRIndexCounter"]);
                FeatureContext.Current["ReferenceRangeID" + (FeatureContext.Current["RRIndexCounter"])] = dataval.ReferenceRangeID;
                FeatureContext.Current["RRIndexCounter"] = ++referencerangeIDindex;
            }
        }                    

        [When(@"I click on ""(.*)"" icon of the first record and enter the below lab data and click on save and I can see ""(.*)"" message upon each record save in ReferenceRangesPage")]
        [Then(@"I click on ""(.*)"" icon of the first record and enter the below lab data and click on save and I can see ""(.*)"" message upon each record save in ReferenceRangesPage")]
        public void WhenIClickOnIconOfTheFirstRecordAndEnterTheBelowLabDataAndClickOnSaveAndICanSeeMessageUponEachRecordSaveInReferenceRangesPage(string successmessage, string operation, Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.SetRowDataForLabCreation((List<ReferenceRangesData>)rowdata, successmessage, operation))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter the below lab data and click on save and I can see ""(.*)"" error message upon each record save for column ""(.*)""")]
        [Then(@"enter the below lab data and click on save and I can see ""(.*)"" error message upon each record save for column ""(.*)""")]
        public void WhenEnterTheBelowLabDataAndClickOnSaveAndICanSeeErrorMessageUponEachRecordSaveForColumn(string errormessage, string columnname, Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.SetInvalidDataForLabCreation((List<ReferenceRangesData>)rowdata, errormessage, columnname))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click add and enter reference ranges of a lab test and Save and can see ""(.*)"" error message upon each record save for column ""(.*)""")]
        [Then(@"I click add and enter reference ranges of a lab test and Save and can see ""(.*)"" error message upon each record save for column ""(.*)""")]
        public void WhenIClickAddAndEnterReferenceRangesOfALabTestAndSaveAndCanSeeErrorMessageUponEachRecordSaveForColumn(string errormessage, string columnname, Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.SetInvalidDataForCreate((List<ReferenceRangesData>)rowdata, errormessage, columnname))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on add button to create the record with the overlap data and I can see ""(.*)"" error message upon each record save in ReferenceRangesPage")]
        [When(@"I create a new record with the same data and I can see ""(.*)"" error message upon each record save in ReferenceRangesPage")]
        [Then(@"I create a new record with the same data and I can see ""(.*)"" error message upon each record save in ReferenceRangesPage")]
        public void WhenICreateANewRecordWithTheSameDataAndICanSeeErrorMessageUponEachRecordSaveInReferenceRangesPage(string errormessage, Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.SetDuplicateorOverlapDataForCreate((List<ReferenceRangesData>)rowdata, errormessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"Click the lab test link to refresh the page")]
        public void ThenClickTheLabTestLinkToRefreshThePage()
        {
            if (!BP_ReferenceRangesUtilities.ClickOnLabTestLink())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"enter the below default lab data in ReferenceRangesPage")]
        public void WhenEnterTheBelowDefaultLabData(Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.SetDefaultDataForCreation((List<ReferenceRangesData>)rowdata))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the checkbox to delete the all records")]
        public void WhenISelectTheCheckboxtoDeleteTheAllRecords()
        {
            if (!BP_ReferenceRangesUtilities.CompleteChkBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I select the uncheckbox the checkbox to delete the all records")]
        public void ThenISelectTheUncheckboxTheCheckboxToDeleteTheAllRecords()
        {
            if (!BP_ReferenceRangesUtilities.UnCheckCompleteChkBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I change the data of a deleted copied record in ReferenceRangesPage")]
        [When(@"I change the data to same as of already existing record in ReferenceRangesPage")]
        [When(@"I update the copied record with the overlap data in ReferenceRangesPage")]
        [When(@"enter the below lab data in ReferenceRangesPage")]
        public void WhenEnterTheBelowLabData(Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.SetValidDataForCreation((List<ReferenceRangesData>)rowdata))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[When(@"enter the below lab data and click on save and I can see ""(.*)"" error message upon each record save in ReferenceRangesPage")]
        //public void WhenEnterTheBelowLabDataAndClickOnSaveAndICanSeeErrorMessageUponEachRecordSave(string errormessage, Table labList)
        //{
        //    IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
        //    if (!BP_ReferenceRangesUtilities.SetInvalidDataForCreate((List<ReferenceRangesData>)rowdata, errormessage))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        [When(@"I modify reference ranges of a existing lab test and Save in ReferenceRangesPage")]
        [When(@"I change reference ranges of a copied lab test and Save in ReferenceRangesPage")]
        public void WhenIChangeReferenceRangesOfACopiedLabTestAndSaveInReferenceRangesPage(Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.RowDataChangeBySelectedRow((List<ReferenceRangesData>)rowdata))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on ""(.*)"" button of the first record to change the data to same as of already existing record in ReferenceRangesPage")]
        public void IClickOnButtonOfTheFirstRecirdToChangeThedataTosameAsOfAlreadyExistingRecordInReferenceRangesPage(string operation, Table labList)
        {
            IEnumerable<ReferenceRangesData> rowdata = labList.CreateSet<ReferenceRangesData>();
            if (!BP_ReferenceRangesUtilities.RowDataChangeForEdit((List<ReferenceRangesData>)rowdata, operation))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I Click the save button in ReferenceRangesPage")]
        public void WhenIClickTheSaveButtonInReferenceRangesPage()
        {
            if (!BP_ReferenceRangesUtilities.ClickOnSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I check the not applicable checkbox in ReferenceRangesPage")]
        public void WhenICheckTheNotApplicableCheckboxInReferenceRangesPage()
        {
            if (!BP_ReferenceRangesUtilities.CheckNotApplicableCheckbox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I uncheck the not applicable checkbox in ReferenceRangesPage")]
        public void WhenIUncheckTheNotApplicableCheckboxInReferenceRangesPage()
        {
            if (!BP_ReferenceRangesUtilities.UncheckNotApplicableCheckbox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on ""(.*)"" button to create a new record from a deleted record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" button of the record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" button in ReferenceRangesPage")]
        [When(@"click on ""(.*)"" button in ReferenceRangesPage")]
        [Then(@"I click on the ""(.*)"" button in ReferenceRangesPage")]
        [When(@"click on the ""(.*)"" button of the copied record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" button to create a duplicate record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" button to create a new record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" icon for the newly created record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" icon for the modified record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" icon for the copied record in ReferenceRangesPage")]
        [Then(@"I click on ""(.*)"" icon of the first record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" icon of the first record in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" icon for the first record to copy the data in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" icon for the first record to modify the data in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" icon for the first record to copy the data in ReferenceRangesPage")]
        public void WhenIClickOnIconForTheFirstRecordToCopyTheDataInReferenceRangesPage(string action)
        {
            if (!BP_ReferenceRangesUtilities.GetFirstRowFromTableAndClickOnAction(action))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I click on ""(.*)"" button I can see ""(.*)"" error message upon each record save in ReferenceRangesPage")]
        [When(@"I click on ""(.*)"" button I can see ""(.*)"" error message upon each record save in ReferenceRangesPage")]
        public void WhenIClickOnButtonICanSeeErrorMessageUponEachRecordSaveInReferenceRangesPage(string action, string Errormsg)
        {
            if (!BP_ReferenceRangesUtilities.GetFirstRowFromTableAndClickOnActionandVerifyError(action, Errormsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I can see ""(.*)"" error message upon each record save in ReferenceRangesPage")]
        public void ThenICanSeeErrorMessageUponEachRecordSaveInReferenceRangesPage(string ErrorMsg)
        {
            if (!BP_ReferenceRangesUtilities.GetFirstRowFromTableAndClickOnSave(ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        //[Then(@"I click on ""(.*)"" icon of the first record in ReferenceRangesPage")]
        //[When(@"I click on ""(.*)"" icon of the first record in ReferenceRangesPage")]
        //public void WhenIClickOnIconOfTheFirstRecordInReferenceRangesPage(string action)
        //{
        //    if (!BP_ReferenceRangesUtilities.GetFirstRowFromTableAndClickOnAction(action))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        [When(@"Reference Range ID in readonly mode in ReferenceRangesPage")]
        public void WhenReferenceRangeIDInReadonlyModeInReferenceRangesPage()
        {
            if (!BP_ReferenceRangesUtilities.GetReferenceID())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see ""(.*)"" message upon record save in ReferenceRangesPage")]
        [When(@"I can see the ""(.*)"" message upon record save in ReferenceRangesPage")]
        [When(@"a ""(.*)"" message should be displayed in ReferenceRangesPage")]
        [Then(@"a ""(.*)"" message should be displayed in ReferenceRangesPage")]
        public void ThenAMessageShouldBeDisplayedInReferenceRangesPage(string successMessage)
        {
            if (!BP_ReferenceRangesUtilities.VerifySuccessMessageOnPage(successMessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see ""(.*)"" error message upon record save in ReferenceRangesPage")]
        [Then(@"I see ""(.*)"" error message in ReferenceRangesPage")]
        public void ThenISeeErrorMessageInReferenceRangesPage(string errorMessage)
        {
            if (!BP_ReferenceRangesUtilities.VerifyErrorMessageOnPage(errorMessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see ""(.*)"" error message on duplicate record save in ReferenceRangesPage")]
        public void ThenISeeErrorMessageOnDuplicateRecordSaveInReferenceRangesPage(string errorMessage)
        {
            if (!BP_ReferenceRangesUtilities.VerifyErrorMessageOnDuplicateRecordSave(errorMessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"a Reference ID is auto generated for a newly added lab test in ReferenceRangesPage")]
        public void ThenAReferenceIDIsAutoGeneratedForANewlyAddedLabTestInReferenceRangesPage()
        {
            if (!BP_ReferenceRangesUtilities.GetReferenceId())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I see the reference range ids in the Reference Range Table\.")]
        public void ThenISeeTheReferenceRangeIdsInTheReferenceRangeTable_(Table table)
        {
            ReferenceRangeDataFormatter newTable = new ReferenceRangeDataFormatter();
            newTable.FillReferenceRangeId("ReferenceRangeID", table);
            StringBuilder sb = new StringBuilder();
            IEnumerable <ReferenceRangesData> ReferenceRangeData = table.CreateSet<ReferenceRangesData>();
            List<ReferenceRangesData> dataList = (List<ReferenceRangesData>)ReferenceRangeData;
            List<string> FailedItems = new List<string>();
            if(!BP_ReferenceRangesUtilities.VerifyReferenceRangeIds(dataList, out FailedItems))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
                foreach(string item in FailedItems)
                {
                    sb.Append(item);
                    sb.Append(",");
                    ScenarioContext.Current["Comments"] = "Following Items cannot be verified" + sb;
                }
            }
            else
            {
                sb.Append("Reference Range IDs");
                sb.Append("\r\n");
                foreach (var data in dataList)
                {
                    sb.Append(" - ");
                    sb.Append(data.ReferenceRangeID);
                    //sb.Append(FeatureContext.Current[data.ReferenceRangeID].ToString());
                    sb.Append("\r\n");
                }
                ScenarioContext.Current["Comments"] = sb;
            }
        }
        [When(@"I click on ""(.*)"" icon for the reference range ""(.*)"" in ReferenceRangesPage\.")]
        public void WhenIClickOnIconForTheReferenceRangeInReferenceRangesPage_(string action, string rrID)
        {
            ReferenceRangeDataFormatter RRFormatter = new ReferenceRangeDataFormatter();
            string FormattedID = RRFormatter.FillRRID(rrID);
            if (!BP_ReferenceRangesUtilities.GetIConFromRowTableByRRIDandClickAction(action, FormattedID))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
