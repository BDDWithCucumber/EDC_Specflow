using BusinessProcesses.Designer;
using BusinessProcesses.Designer.Common;
using BusinessProcesses.Designer.CompareStudy;
using BusinessProcesses.Designer.LabMapping;
using BusinessProcesses.Designer.ManageLabs;
using BusinessProcesses.Designer.MapLabDict;
using BusinessProcesses.Designer.ModalDialogs;
using Pages.Designer.Data;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;
using Utilities;
using XMLUtilities;

namespace EDC_Automation.Steps.Designer
{
    [Binding]
    public sealed class LabItems : TechTalk.SpecFlow.Steps
    {

        [Then(@"I verify that the ""(.*)"" field is not present in the study xml file")]
        public void ThenIVerifyThatTheFieldIsNotPresentInTheStudyXmlFile(string fieldName)
        {
            string File1 = ScenarioContext.Current["XMLFileNameInProject"].ToString();
            if (!XMLActionUtilities.VerifyXMlContent(File1, fieldName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify data in the actual and expected XML files.\n Expected and Actual doesnot match";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify the below in the study xml file")]
        public void ThenIVerifyTheBelowInTheStudyXmlFile(Table table)
        {
            IEnumerable<XMLNodeData> xmlData = table.CreateSet<XMLNodeData>();
            string File1 = ScenarioContext.Current["XMLFileNameInProject"].ToString();
            if (!XMLActionUtilities.VerifyXMlContent(File1, (List<XMLNodeData>)xmlData))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify data in the actual and expected XML files.\n Expected and Actual doesnot match";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the error link")]
        public void WhenIClickOnTheErrorLink()
        {
            if (!ManageLabsUtilities.ClickErrorLink())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the Error Type ""(.*)"" from the drop down ""(.*)"" for filtering")]        
        public void WhenISelectTheErrorTypeFromTheDropDownForFiltering(string Error, string DropDownList)
        {
            if (!ManageLabsUtilities.SearchInImportLabDictionaryErrors(Error, DropDownList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I Unselect the Error Type ""(.*)"" from the drop down ""(.*)"" for filtering")]
        public void WhenIUnselectTheErrorTypeFromTheDropDownForFiltering(string Error, string DropDownList)
        {            
            if (!ManageLabsUtilities.Uncheckthecheckbox(Error, DropDownList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the filter option")]
        public void WhenIClickOnTheFilterOption()
        {
            if (!ManageLabsUtilities.ClickOnFilter())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
       
        [Then(@"I should see the pop up with the below values")]
        public void ThenIShouldSeeThePopUpWithTheBelowValues(Table table)
        {
            IEnumerable<ImportLabDictErrorData> dictData = table.CreateSet<ImportLabDictErrorData>();
            if (!ManageLabsUtilities.GetTableRowData((List<ImportLabDictErrorData>)dictData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should get the below mentioned rows in the table")]       
        public void ThenIShouldGetTheBelowMentionedRowsInTheTable(Table table)
        {
            IEnumerable<ImportLabDictErrorData> dictData = table.CreateSet<ImportLabDictErrorData>();
            if (!ManageLabsUtilities.GetTableRowDataForImportLabDictionaryErrors((List<ImportLabDictErrorData>)dictData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on the save button")]
        public void WhenClickOnTheSaveButton()
        {
            if (!MapLabDictUtilities.labDictSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on the update save button")]
        public void WhenClickOnTheUpdateSaveButton()
        {
            if (!MapLabDictUtilities.labDictUpdateSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on the update unit save button")]
        public void WhenClickOnTheUpdateUnitSaveButton()
        {
            if (!MapLabDictUtilities.labDictUpdateUnitSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see a warning dialog with title ""(.*)"" and warning message ""(.*)""")]
        [Then(@"I see a warning dialog with title ""(.*)"" and warning message ""(.*)""")]
        public void ThenISeeAWarningDialogWithTitleAndWarningMessage(string Title, string WarningMsg)
        {
            if (!BP_DS_Labs_MapLabDictionary_RRCheckboxWarningDialog.ISDialogExist(Title, WarningMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Continue button on the warning dialog")]
        public void WhenIClickContinueButtonOnTheWarningDialog()
        {
            if (!BP_DS_Labs_MapLabDictionary_RRCheckboxWarningDialog.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Edit Selected error popup with title ""(.*)"" and error message ""(.*)""")]
        public void ThenISeeEditSelectedErrorPopupWithTitleAndErrorMessage(string Title, string ErrorMsg)
        {
            if (!BP_DS_Labs_MapLabDictionary_EditSelectedErrorDialog.ISDialogExist(Title, ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ok button on the Edit Selected error popup")]
        public void WhenIClickOkButtonOnTheEditSelectedErrorPopup()
        {
            if (!BP_DS_Labs_MapLabDictionary_EditSelectedErrorDialog.ClickOkButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see duplicate mapping error dialog with title ""(.*)"" and error message ""(.*)""")]
        public void ThenISeeDuplicateMappingErrorDialogWithTitleAndErrorMessage(string Title, string ErrorMsg)
        {
            if (!BP_DS_Labs_MapLabDictionary_Update_DuplicateMappingsDialog.ISDialogExist(Title, ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ok button on the duplicate mapping error popup")]
        public void WhenIClickOkButtonOnTheDuplicateMappingErrorPopup()
        {
            if (!BP_DS_Labs_MapLabDictionary_Update_DuplicateMappingsDialog.ClickOkButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see no mapping error dialog with title ""(.*)"" and error message ""(.*)""")]
        public void ThenISeeNoMappingErrorDialogWithTitleAndErrorMessage(string Title, string ErrorMsg)
        {
            if (!BP_DS_Labs_MapLabDictionary_Update_NomappingsDialog.ISDialogExist(Title, ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ok button on the no mapping error popup")]
        public void WhenIClickOkButtonOnTheNoMappingErrorPopup()
        {
            if (!BP_DS_Labs_MapLabDictionary_Update_NomappingsDialog.ClickOkButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see lab test mapping update error dialog with title ""(.*)"" and error message ""(.*)""")]
        [Then(@"I see lab test mapping update error dialog with title ""(.*)"" and error message ""(.*)""")]
        public void ThenISeeLabTestMappingUpdateErrorDialogWithTitleAndErrorMessage(string Title, string ErrorMsg)
        {
            if (!BP_DS_Labs_MapLabDictionay_Update_RRChekboxWarningDialog.ISDialogExist(Title, ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click update Continue button on the lab test mapping error dialog")]
        public void WhenIClickUpdateContinueButtonOnTheLabTestMappingErrorDialog()
        {
            if (!BP_DS_Labs_MapLabDictionay_Update_RRChekboxWarningDialog.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see change map lab dict error dialog with title ""(.*)"" and error message ""(.*)""")]
        public void ThenISeeChangeMapLabDictErrorDialogWithTitleAndErrorMessage(string Title, string ErrorMsg)
        {
            if (!BP_DS_Labs_MapLabDictionry_DictionayChageDialog.ISDialogExist(Title, ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ok button on the change map lab dict error dialog")]
        public void WhenIClickOkButtonOnTheChangeMapLabDictErrorDialog()
        {
            if (!BP_DS_Labs_MapLabDictionry_DictionayChageDialog.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see LMS error dialog with title ""(.*)"" and message ""(.*)""")]
        public void WhenISeeLMSErrorDialogWithTitleAndMessage(string Title, string ErrorMsg)
        {
            if (!BP_DS_LabMappingsSpecificationDialog.IsLabMappingsSpecificationDialogExist(Title, ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the Verification Rules Messages dialog with title ""(.*)""")]
        [When(@"I should see the Verification Rules Messages dialog with title ""(.*)""")]
        [When(@"I see study publish dialog with title ""(.*)""")]
        [When(@"I select the create study from existing dialog having title ""(.*)""")]
        public void WhenISelectTheCreateStudyFromExistingDialogHavingTitle(string Title)
        {            
            if (!BP_DS_LabMappingsSpecificationDialog.IsCreateStudyFromExistingDialogExist(Title))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Continue button on the LMS error dialog")]
        public void WhenIClickContinueButtonOnTheLMSErrorDialog()
        {
            if (!BP_DS_LabMappingsSpecificationDialog.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see target app error dialog with title ""(.*)"" and error message ""(.*)""")]
        public void WhenISeeTargetAppErrorDialogWithTitleAndErrorMessage(string Title, string ErrorMsg)
        {
            if (!BP_DS_Study_TargetAppDialog.ISDialogExist(Title, ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on Continue button on the target app error dialog")]
        public void WhenClickOnContinueButtonOnTheTargetAppErrorDialog()
        {
            if (!BP_DS_Study_TargetAppDialog.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see a error dialog with title ""(.*)"" and error message ""(.*)""")]
        [Then(@"I see a error dialog with title ""(.*)"" and error message ""(.*)""")]
        public void ThenISeeAErrorDialogWithTitleAndErrorMessage(string title, string ErrorMsg)
        {
            if (!BP_DS_Labs_MapLabDictionaryErrorDialog.ISDialogExist(title, ErrorMsg))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I see popup having title ""(.*)"" and partial message ""(.*)""")]
        [When(@"I see a study verify dialog with title ""(.*)"" and verify message ""(.*)""")]
        [When(@"I see a confirmation dialog with title ""(.*)"" and confirmation message ""(.*)""")]
        [Then(@"I see a confirmation dialog with title ""(.*)"" and confirmation message ""(.*)""")]
        public void ThenISeeAConfirmationDialogWithTitleAndConfirmationMessage(string title, string confirmationMessage)
        {
            if (!BP_DS_Labs_StudySaveConfirmationDialog.ISDialogExist(title, confirmationMessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on yes button")]
        [When(@"I click Continue button on the study verify dialog")]
        [When(@"I click Continue button on the confirmation dialog")]
        public void WhenIClickContinueButtonOnTheConfirmationDialog()
        {
            if (!BP_DS_Labs_StudySaveConfirmationDialog.ClickContinueButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ok button on the error dialog")]
        public void WhenIClickOkButtonOnTheErrorDialog()
        {
            if (!BP_DS_Labs_MapLabDictionaryErrorDialog.ClickOKButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the tab ""(.*)""")]
        public void WhenIClickOnTheTab(string linkName)
        {
            if (!MapLabDictUtilities.ClickLabUnitTab(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        
        [Then(@"the pop up should close and Map Lab Dictionary page should be displayed")]
        public void ThenThePopUpShouldCloseAndMapLabDictionaryPageShouldBeDisplayed()
        {
            if (!MapLabDictUtilities.VerifyDesignerPageHeader())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the uncheck box display in RR table for any lab test")]
        public void WhenSelectTheUncheckBoxDisplayInRRTableForAnyLabTest()
        {
            if (!MapLabDictUtilities.UnCheckDisplayInRRThirdCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the check box display in RR table for any lab test")]
        public void WhenSelectTheCheckBoxDisplayInRRTableOfALabTest()
        {
            if (!MapLabDictUtilities.CheckDisplayInRRCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the check box display in RR table for first lab test")]
        public void WhenSelectTheCheckBoxDisplayInRRFirstLabTest()
        {
            if (!MapLabDictUtilities.CheckDisplayInRRFirstCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the check box display in RR table for third lab test")]
        public void WhenSelectTheCheckBoxDisplayInRRThirdLabTest()
        {
            if (!MapLabDictUtilities.CheckDisplayInRRThirdCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Enter Label for study publish as ""(.*)""")]
        public void WhenEnterLabelAs(string labDictLabel)
        {
            if (!MapLabDictUtilities.StudyPublishLabel(labDictLabel))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should not see the Link ""(.*)""")]
        public void ThenIShouldNotSeeTheLink(string linkName)
        {
            if (!DS_BP_StudyProperties.VerifyLMSLink(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see the Tab ""(.*)""")]
        public void ThenISeeTheTab(string TabName)
        {
            if (!DS_BP_StudyProperties.Verifytab(TabName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I do not see the Tab ""(.*)""")]
        public void ThenIDoNotSeeTheTab(string TabName)
        {
            BrowserUtilities.RefreshPage();
            if (!DS_BP_StudyProperties.VerifytabNotPresent(TabName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I should see the Link ""(.*)""")]
        public void ThenIShouldSeeTheLink(string linkName)
        {
            if (!DS_BP_StudyProperties.VerifyDisplayLMSLink(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"click the edit icon of the lab test ""(.*)""")]
        public void WhenClickTheEditIconOfTheLabTest(string labTest)
        {
            if (!MapLabDictUtilities.ClickLabTestEditLink(labTest))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select all lab test check box")]
        public void WhenSelectAllLabTestCheckBox()
        {
            if (!MapLabDictUtilities.CheckAllLabTestCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select all lab unit check box")]
        public void WhenSelectAllLabUnitCheckBox()
        {
            if (!MapLabDictUtilities.CheckAllLabUnitCheckBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see error message ""(.*)""")]
        public void ThenIShouldSeeErrorMessage(string messageText_Partial)
        {
            if (!ManageLabsUtilities.VerifyImportLabDictErrorMessage(messageText_Partial))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"verify the display of below fields in Attribute Mapping")]
        public void ThenVerifyTheDisplayOfBelowFieldsInAttributeMapping(Table table)
        {
            IEnumerable<AttributeMappingData> AttributeMapping = table.CreateSet<AttributeMappingData>();
            if (!DS_LabMappingUtilities.VerifyRaceField((List<AttributeMappingData>) AttributeMapping))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"verify the display of below fields in lab Mapping")]
        public void ThenVerifyTheDisplayOfBelowFieldsInLabMapping(Table table)
        {
            IEnumerable<AttributeMappingData> AttributeMapping = table.CreateSet<AttributeMappingData>();
            if (!DS_LabMappingUtilities.VerifySASField((List<AttributeMappingData>)AttributeMapping))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Compare within the same study radio button")]
        public void WhenIClickOnCompareWithinTheSameStudyRadioButton()
        {
            ScenarioContext.Current.Pending();
        }

        [When(@"click on study Next button")]
        public void WhenClickOnStudyNextButton()
        {
            if (!CompareStudyPopupUtilities.ClickStudyNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"click on study version Next button")]
        public void WhenClickOnStudyVersionNextButton()
        {
            if (!CompareStudyPopupUtilities.ClickStudyVersionNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the study")]
        public void WhenSelectTheStudy()
        {
            ScenarioContext.Current.Pending();
        }

        [When(@"select the study different versions as SourceStudy """"(.*)""""")]
        public void WhenSelectTheStudyDifferentVersionsAsSourceStudy(string p0)
        {
            ScenarioContext.Current.Pending();
        }

        [When(@"click on Compare button")]
        public void WhenClickOnCompareButton()
        {
            if (!CompareStudyPopupUtilities.ClickCompareStudyButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Navigate to Codelist Mappings in Attribute Mappings")]
        public void WhenNavigateToCodelistMappingsInAttributeMappings()
        {
            if (!CompareStudyUtilities.ExpandAttributeMappings())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"Click on the Map Lab Dict image link to expand")]
        public void WhenClickOnTheMapLabDictImageLinkToExpand()
        {
            if (!CompareStudyUtilities.ExpandLabDictMappings())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[Then(@"I see the changes in Attribute mappings of source and target study")]
        //public void ThenISeeTheChangesInAttributeMappingsOfSourceAndTargetStudy()
        //{
        //    if (!CompareStudyUtilities.SourceStudy())
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        [Then(@"And I see the changes in Attribute mappings of source and target study as below")]
        public void ThenAndISeeTheChangesInAttributeMappingsOfSourceAndTargetStudyAsBelow(Table sourcetarget)
        {
            List<StudyCompareReportData> sourcetargetData = (List<StudyCompareReportData>)sourcetarget.CreateSet<StudyCompareReportData>();
            if (!CompareStudyUtilities.SourceTargetStudy(sourcetargetData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click on Compare two different studies radio button")]
        public void WhenIClickOnCompareTwoDifferentStudiesRadioButton()
        {
            if (!CompareStudyPopupUtilities.ClickTwoDiffStudiesRadioButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Compare same study radio button")]
        public void WhenIClickOnCompareSameStudyRadioButton()
        {
            if (!CompareStudyPopupUtilities.ClickSameStudyRadioButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the SourceStudy as ""(.*)""")]
        public void WhenSelectTheSourceStudyAs(string studyName)
        {
            if (!CompareStudyPopupUtilities.ClickSourceStudy(studyName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the TargetStudy as ""(.*)""")]
        public void WhenSelectTheTargetStudyAs(string studyName)
        {
            if (!CompareStudyPopupUtilities.ClickTargetStudy(studyName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the version of SourceStudy ""(.*)""")]
        public void WhenSelectTheVersionOfSourceStudy(string studyVersion)
        {
            if (!CompareStudyPopupUtilities.ClickSourceStudyVersion(studyVersion))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"select the version of TargetStudy ""(.*)""")]
        public void WhenSelectTheVersionOfTargetStudy(string studyVersion)
        {
            if (!CompareStudyPopupUtilities.ClickTargetStudyVersion(studyVersion))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}
