using BusinessProcesses.DataLabs.Main;
using BusinessProcesses.DataLabs.Modal;
using BusinessProcesses.DataLabs.Patients;
using EDC_Automation.Helpers;
using Pages.DataLabs.Data;
using Pages.DataLabs.Labs;
using System;
using System.Collections.Generic;
using System.Text;
using Framework.Actions;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;
using Utilities;
using BusinessProcesses.DataLabs.Common;

namespace EDC_Automation.Steps.DataLabs.Patient
{
    [Binding]
    public class CRF_Standard_Scenarios
    {
        [Given(@"I navigate to ""(.*)"" tab from main menu\.")]
        [When(@"I navigate to ""(.*)"" tab from main menu\.")]
        [Then(@"I navigate to ""(.*)"" tab from main menu\.")]
        public void GivenINavigateToTabFromMainMenu_(string p0)
        {
            if(!BP_MainNavigationUtilities.SelectPrimaryTabOnMenu(p0))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "User unable to navigate to Patients tab. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I select the site ""(.*)"" from Sites dropdown\.")]
        [When(@"I select the site ""(.*)"" from Sites dropdown\.")]
        public void GivenISelectTheSiteFromSitesDropdown_(string SiteName)
        {
            if(!BP_MainNavigationUtilities.SelectSiteFromSiteDropdown(SiteName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "User unable to select '" + SiteName + "' from Site selection dropdown. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I add patient with below details\.")]
        public void WhenIAddPatientWithBelowDetails_(Table table)
        {
            StringBuilder FailedPats = new StringBuilder();
            List<string> Failed = new List<string>();
            IEnumerable<AddPatientData> PatientData = table.CreateSet<AddPatientData>();
            List<AddPatientData> PatientsList = (List<AddPatientData>)PatientData;
            BP_PatientUtilities.AddPatients(PatientsList, out Failed);
            if(Failed.Count > 0)
            {
                foreach(string patID in Failed)
                {
                    FailedPats.Append(patID + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to add patient with ID:" + FailedPats + " \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I add below patient without initials\.")]
        public void WhenIAddBelowPatientWithoutInitials_(Table table)
        {
            StringBuilder FailedPats = new StringBuilder();
            List<string> Failed = new List<string>();
            IEnumerable<AddPatientData> PatientData = table.CreateSet<AddPatientData>();
            List<AddPatientData> PatientsList = (List<AddPatientData>)PatientData;
            BP_PatientUtilities.AddPatients(PatientsList, out Failed);
            if (Failed.Count > 0)
            {
                foreach (string patID in Failed)
                {
                    FailedPats.Append(patID + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to add patient with ID:" + FailedPats + " \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see below patients added in the Patients table\.")]
        public void ThenISeeBelowPatientsAddedInThePatientsTable_(Table table)
        {
            StringBuilder FailedPats = new StringBuilder();
            IEnumerable<PatientTableData> Data = table.CreateSet<PatientTableData>();
            List<PatientTableData> List = (List<PatientTableData>)Data;
            foreach (PatientTableData Pat in List)
            {
                if (!BP_PatientUtilities.VerifyPatientInPatientsTable(Pat.PatientID))
                {
                    FailedPats.Append(Pat.PatientID + ",");
                }
            }
            if(FailedPats.Equals(string.Empty))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Patients with ID: " + FailedPats + " is/are not displayed in patients table. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            
        }

        [Given(@"I select the patient ""(.*)"" from patients table\.")]
        [When(@"I select the patient ""(.*)"" from patients table\.")]
        public void GivenISelectThePatientFromPatientsTable_(string PatientDet)
        {
            if(!BP_PatientUtilities.SelectPatientFromPatientsTable(PatientDet))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Patient '" + PatientDet + "' is not selected. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enroll the patient ""(.*)"" with below data\.")]
        public void WhenIEnrollThePatientWithBelowData_(string Patient, Table table)
        {
            IEnumerable<EnrollPatientData> PatientData = table.CreateSet<EnrollPatientData>();
            List<EnrollPatientData> Data = (List<EnrollPatientData>)PatientData;
            if(!BP_PatientUtilities.EnrollAPatient(Patient, Data[0]))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to enroll patient '" + Patient + "'. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see patient ""(.*)"" status as ""(.*)"" on Patient details page\.")]
        public void ThenISeePatientStatusAsOnPatientDetailsPage_(string PatientID, string Status)
        {
            if (!BP_PatientUtilities.VerifyDetailsOnPatientDetailsPage(PatientID, Status, string.Empty, string.Empty))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Patient details page is not displayed for '" + PatientID + "' on selecting the patient. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Patient details page for ""(.*)""\.")]
        public void ThenISeePatientDetailsPageFor_(string PatientID)
        {
            if(!BP_PatientUtilities.VerifyDetailsOnPatientDetailsPage(PatientID, string.Empty, string.Empty, string.Empty))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Patient details page is not displayed for '" + PatientID + "' on selecting the patient. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should be able to see""(.*)"" link left side")]
        public void ThenIShouldBeAbleToSeeLinkLeftSide(string link)
        {
            if (!BP_StudyAdministationUtilities.IsLinkAvailable(link))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            
        }

        [Given(@"I expand ""(.*)"" to select and open ""(.*)"" CRF\.")]
        [When(@"I expand ""(.*)"" to select and open ""(.*)"" CRF\.")]
        public void GivenIExpandToSelectAndOpenCRF_(string Event, string Form)
        {
            if(!BP_Patient_EventFormUtilities.OpenForm(Event, Form))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select and open CRF '" + Form + "' from event '" + Event + "'. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on ""(.*)"" button on ""(.*)"" CRF\.")]
        [When(@"I click ""(.*)"" button on ""(.*)"" CRF\.")]
        [Then(@"I click on ""(.*)"" button on ""(.*)"" CRF\.")]
        [Then(@"I click ""(.*)"" button on ""(.*)"" CRF\.")]
        public void WhenIClickButtonOnCRF_(string ButtonName, string CRFName)
        {
            if(!BP_CRFUtilities.SelectButtonOnCRF(CRFName, ButtonName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select '" + ButtonName + "' on '" + CRFName + "' CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see ""(.*)"" button on the CRF page\.")]
        public void ThenISeeButtonOnTheCRFPage_(string ButtonName)
        {
            if (!BP_CRFUtilities.VerifyButtonOnCRF(ButtonName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify '" + ButtonName + "' on CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter ""(.*)"" for flat ""(.*)"" question ""(.*)"" in the CRF\.")]
        public void WhenIEnterForFlatQuestionInTheCRF_(string AnswerValue, string AnswerFieldType, string QuestionPrompt)
        {
            if(!BP_CRFUtilities.FillValueForAFlatQuestionInCRF(QuestionPrompt, AnswerFieldType, AnswerValue))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to fill " + AnswerValue + " in " + QuestionPrompt + " question in CRF.";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I enter below flat questions data in the CRF\.")]
        [Then(@"I Verify below items are displayed in ""(.*)"" list box on the CRF\.")]
        public void WhenIEnterBelowFlatQuestionsDataInTheCRF_(Table table)
        {
            StringBuilder UnfilledQs = new StringBuilder();
            IEnumerable<CRFFlatQuestionsData> Data = table.CreateSet<CRFFlatQuestionsData>();
            List<CRFFlatQuestionsData> Questions = (List<CRFFlatQuestionsData>)Data;
            List<string> UnfilledQuestions = new List<string>();
            BP_CRFUtilities.FillFlatQuestionsInCRF(Questions, out UnfilledQuestions);
            if(UnfilledQuestions.Count > 0)
            {
                foreach (string Question in UnfilledQuestions)
                {
                    UnfilledQs.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to fill questions '" + UnfilledQs + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I add comments to flat questions in the ""(.*)"" CRF\.")]
        [Then(@"I add comments to flat questions in the CRF\.")]
        public void ThenIAddCommentsToFlatQuestionsInTheCRF_(Table table)
        {
            IEnumerable<AddCommentsForQuestion> Data = table.CreateSet<AddCommentsForQuestion>();
            List<AddCommentsForQuestion> Questions = (List<AddCommentsForQuestion>)Data;
            BP_CRF_QuestionCommentsUtilities.AddCommentsToFlatQuestionsInCRF(Questions);
        }
     
        [Then(@"I add comments to questions of table ""(.*)"" in the CRF\.")]
        public void ThenIAddCommentsToQuestionsOfTableInTheCRF_(string TableName, Table table)
        {
            IEnumerable<AddCommentsForQuestion> Data = table.CreateSet<AddCommentsForQuestion>();
            List<AddCommentsForQuestion> Questions = (List<AddCommentsForQuestion>)Data;
            BP_CRF_QuestionCommentsUtilities.AddCommentsToTableQuestionsInCRF(TableName, Questions);
        }

        [When(@"I verify below flat questions data in the CRF\.")]
        [Then(@"I verify below flat questions data in the CRF\.")]
        public void ThenIVerifyBelowFlatQuestionsDataInTheCRF_(Table table)
        {
            StringBuilder UnVerifiedQs = new StringBuilder();
            IEnumerable<CRFFlatQuestionsData> Data = table.CreateSet<CRFFlatQuestionsData>();
            List<CRFFlatQuestionsData> Questions = (List<CRFFlatQuestionsData>)Data;
            List<string> UnVerifiedQuestions = new List<string>();
            BP_CRFUtilities.VerifyFlatQuestionsDataInCRF(Questions, out UnVerifiedQuestions);
            if (UnVerifiedQuestions.Count > 0)
            {
                foreach (string Question in UnVerifiedQuestions)
                {
                    UnVerifiedQs.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify questions '" + UnVerifiedQs + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify below flat questions status in the CRF\.")]
        public void ThenIVerifyBelowFlatQuestionsStatusInTheCRF_(Table table)
        {
            StringBuilder UnVerifiedQs = new StringBuilder();
            IEnumerable<CRFFlatQuestionsData> Data = table.CreateSet<CRFFlatQuestionsData>();
            List<CRFFlatQuestionsData> Questions = (List<CRFFlatQuestionsData>)Data;
            List<string> UnVerifiedQuestions = new List<string>();            
            BP_CRFUtilities.VerifyFlatQuestionsAnswerStatusInCRF(Questions, out UnVerifiedQuestions);
            if (UnVerifiedQuestions.Count > 0)
            {
                foreach (string Question in UnVerifiedQuestions)
                {
                    UnVerifiedQs.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify questions '" + UnVerifiedQs + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I Verify below ""(.*)"" items are displayed in ""(.*)"" on the CRF\.")]
        [Then(@"I Verify below ""(.*)"" items are displayed in ""(.*)"" on the CRF\.")]
        [Then(@"I verify below ""(.*)"" items are displayed in ""(.*)"" on the CRF\.")]
        public void ThenIVerifyBelowItemsAreDisplayedInOnTheCRF_(string FieldType, string QuestionPrompt, Table table)
        {
            IEnumerable<ListItemsDataOnCRF> Data = table.CreateSet<ListItemsDataOnCRF>();
            List<ListItemsDataOnCRF> ListItems = (List<ListItemsDataOnCRF>)Data;
            List<string> Items = new List<string>();
            foreach(ListItemsDataOnCRF Item in ListItems)
            {
                Items.Add(Item.ItemToVerify);
            }
            switch(FieldType.ToUpper())
            {
                case "LISTBOX": case "LIST BOX":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfFlatQuestionInCRF(QuestionPrompt, "ListBox", Items, true))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Not all list items for the question '" + QuestionPrompt + "' are displayed in the CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
                case "RADIO": case "RADIO GROUP": case "RADIOGROUP":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfFlatQuestionInCRF(QuestionPrompt, "RADIO", Items, true))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Not all radio items for the question '" + QuestionPrompt + "' are displayed in the CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
                case "CHECKBOX": case "CHECK BOX":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfFlatQuestionInCRF(QuestionPrompt, "CHECKBOX", Items, true))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Not all checkbox items for the question '" + QuestionPrompt + "' are displayed in the CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
            }
            
        }

        [Then(@"I Verify below ""(.*)"" items are not displayed in ""(.*)"" on the CRF\.")]
        [Then(@"I verify below ""(.*)"" items are not displayed in ""(.*)"" on the CRF\.")]
        public void ThenIVerifyBelowItemsAreNotDisplayedInOnTheCRF_(string FieldType, string QuestionPrompt, Table table)
        {
            IEnumerable<ListItemsDataOnCRF> Data = table.CreateSet<ListItemsDataOnCRF>();
            List<ListItemsDataOnCRF> ListItems = (List<ListItemsDataOnCRF>)Data;
            List<string> Items = new List<string>();
            foreach (ListItemsDataOnCRF Item in ListItems)
            {
                Items.Add(Item.ItemToVerify);
            }
            switch (FieldType.ToUpper())
            {
                case "LISTBOX": case "LIST BOX":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfFlatQuestionInCRF(QuestionPrompt, "ListBox", Items, false))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "One or more list items for the question '" + QuestionPrompt + "' are displayed in the CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
                case "RADIO": case "RADIO GROUP": case "RADIOGROUP":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfFlatQuestionInCRF(QuestionPrompt, "RADIO", Items, false))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "One or more radio items for the question '" + QuestionPrompt + "' are displayed in the CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
                case "CHECKBOX": case "CHECK BOX": 
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfFlatQuestionInCRF(QuestionPrompt, "CHECKBOX", Items, false))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "One or more checkbox items for the question '" + QuestionPrompt + "' are displayed in the CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
            }
        }

        [Then(@"I verify below ""(.*)"" items are displayed for ""(.*)"" question in row ""(.*)"" of ""(.*)"" table\.")]
        public void ThenIVerifyBelowItemsAreDisplayedForQuestionInRowOfTable_(string FieldType, string QuestionPrompt, int RowNum, string TableName, Table table)
        {
            IEnumerable<ListItemsDataOnCRF> Data = table.CreateSet<ListItemsDataOnCRF>();
            List<ListItemsDataOnCRF> ListItems = (List<ListItemsDataOnCRF>)Data;
            List<string> Items = new List<string>();
            foreach (ListItemsDataOnCRF Item in ListItems)
            {
                Items.Add(Item.ItemToVerify);
            }
            string RowNo = RowNum.ToString();
            switch (FieldType.ToUpper())
            {
                case "LISTBOX": case "LIST BOX":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfTableQuestionInCRF(TableName, RowNo, QuestionPrompt, "ListBox", Items, true))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Not all list items for the question '" + QuestionPrompt + "' are displayed in row '" + RowNo + "' of the table in CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
                case "RADIO": case "RADIO GROUP": case "RADIOGROUP":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfTableQuestionInCRF(TableName, RowNo, QuestionPrompt, "Radio", Items, true))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Not all radio items for the question '" + QuestionPrompt + "' are displayed in row '" + RowNo + "' of the table in CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
                case "CHECKBOX": case "CHECK BOX":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfTableQuestionInCRF(TableName, RowNo, QuestionPrompt, "CheckBox", Items, true))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Not all checkbox items for the question '" + QuestionPrompt + "' are displayed in row '" + RowNo + "' of the table in CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;

                case "TEXT": 
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfTableQuestionInCRF(TableName, RowNo, QuestionPrompt, "Text", Items, true))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Not all Text items for the question '" + QuestionPrompt + "' are displayed in row '" + RowNo + "' of the table in CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
            }
        }

        [Then(@"I verify below ""(.*)"" items are not displayed for ""(.*)"" question in row ""(.*)"" of ""(.*)"" table\.")]
        public void ThenIVerifyBelowItemsAreNotDisplayedForQuestionInRowOfTable_(string FieldType, string QuestionPrompt, int RowNum, string TableName, Table table)
        {
            IEnumerable<ListItemsDataOnCRF> Data = table.CreateSet<ListItemsDataOnCRF>();
            List<ListItemsDataOnCRF> ListItems = (List<ListItemsDataOnCRF>)Data;
            List<string> Items = new List<string>();
            foreach (ListItemsDataOnCRF Item in ListItems)
            {
                Items.Add(Item.ItemToVerify);
            }
            string RowNo = RowNum.ToString();
            switch (FieldType.ToUpper())
            {
                case "LISTBOX": case "LIST BOX":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfTableQuestionInCRF(TableName, RowNo, QuestionPrompt, "ListBox", Items, false))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "One or more list items for the question '" + QuestionPrompt + "' are displayed in row '" + RowNo + "' of the table in CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
                case "RADIO": case "RADIO GROUP": case "RADIOGROUP":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfTableQuestionInCRF(TableName, RowNo, QuestionPrompt, "Radio", Items, false))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "One or more radio items for the question '" + QuestionPrompt + "' are displayed in row '" + RowNo + "' of the table in CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
                case "CHECKBOX": case "CHECK BOX":
                    if (!BP_CRFUtilities.VerifyAnswerItemsOfTableQuestionInCRF(TableName, RowNo, QuestionPrompt, "CheckBox", Items, false))
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "One or more checkbox items for the question '" + QuestionPrompt + "' are displayed in row '" + RowNo + "' of the table in CRF. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    break;
            }
        }

        [When(@"I select entry complete checkbox on CRF\.")]
        public void WhenISelectEntryCompleteCheckboxOnCRF_()
        {
            if(!BP_CRFUtilities.SelectEntryCompleteChkBox())
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select entry complete checkbox in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"The CRF with data is saved and checked-in successfully\.")]
        public void ThenTheCRFWithDataIsSavedAndChecked_InSuccessfully_()
        {
            if(!BP_CRFUtilities.VerifyCRFSavedSuccessfully())
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "CRF is not saved and checked-in successfully. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter below ""(.*)"" table questions data in the CRF\.")]
        [Then(@"I enter below ""(.*)"" table questions data in the CRF\.")]
        public void WhenIEnterBelowTableQuestionsDataInTheCRF_(string TableName, Table table)
        {
            StringBuilder UnfilledQs = new StringBuilder();
            IEnumerable<CRFTableQuestionsData> Data = table.CreateSet<CRFTableQuestionsData>();
            List<CRFTableQuestionsData> Questions = (List<CRFTableQuestionsData>)Data;
            List<string> Unfilled = new List<string>();
            BP_CRFUtilities.FillTableQuestionsNSaveInCRF(TableName, Questions, out Unfilled);
            if(Unfilled.Count > 0)
            {
                foreach (string Question in Unfilled)
                {
                    UnfilledQs.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to fill table questions '" + UnfilledQs + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter below ""(.*)"" autobuild table questions data in the CRF\.")]
        [Then(@"I enter below ""(.*)"" autobuild table questions data in the CRF\.")]
        public void WhenIEnterBelowAutobuildTableQuestionsDataInTheCRF_(string TableName, Table table)
        {
            StringBuilder UnfilledQs = new StringBuilder();
            IEnumerable<CRFTableQuestionsData> Data = table.CreateSet<CRFTableQuestionsData>();
            List<CRFTableQuestionsData> Questions = (List<CRFTableQuestionsData>)Data;
            List<string> Unfilled = new List<string>();
            BP_CRFUtilities.FillAutoBuildTableQuestionsNSaveInCRF(TableName, Questions, out Unfilled);
            if(Unfilled.Count > 0)
            {
                foreach (string Question in Unfilled)
                {
                    UnfilledQs.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to fill table questions '" + UnfilledQs + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I verify below ""(.*)"" table questions data in the CRF\.")]
        public void ThenIVerifyBelowAutobuildTableQuestionsDataInTheCRF_(string TableName, Table table)
        {
            StringBuilder UnverifiedQs = new StringBuilder();
            IEnumerable<CRFTableQuestionsData> Data = table.CreateSet<CRFTableQuestionsData>();
            List<CRFTableQuestionsData> Questions = (List<CRFTableQuestionsData>)Data;
            List<string> Unverified = new List<string>();
            BP_CRFUtilities.VerifyTableQuestionsDataInCRF(TableName, Questions, out Unverified);
            if (Unverified.Count > 0)
            {
                foreach (string Question in Unverified)
                {
                    UnverifiedQs.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify table questions '" + UnverifiedQs + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I shouldnot see the below ""(.*)"" table questions data in the CRF\.")]
        public void ThenIShouldnotSeeTheBelowTableQuestionsDataInTheCRF_(string TableName, Table table)
        {
            StringBuilder UnverifiedQs = new StringBuilder();
            IEnumerable<CRFTableQuestionsData> Data = table.CreateSet<CRFTableQuestionsData>();
            List<CRFTableQuestionsData> Questions = (List<CRFTableQuestionsData>)Data;
            List<string> Unverified = new List<string>();
            BP_CRFUtilities.VerifyQuestionsThatAreNotDisplayedInCRF(TableName, Questions, out Unverified);
            if (Unverified.Count > 0)
            {
                foreach (string Question in Unverified)
                {
                    UnverifiedQs.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify table questions '" + UnverifiedQs + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



        [Then(@"I verify below ReferenceRange CRF ""(.*)"" table questions data in the CRF\.")]
        public void ThenIVerifyBelowReferenceRangeCRFTableQuestionsDataInTheCRF_(string tableName, Table table)
        {
            ReferenceRangeDataFormatter newTable = new ReferenceRangeDataFormatter();
            newTable.FillReferenceRangeId("AnswerValue", table);
            ThenIVerifyBelowAutobuildTableQuestionsDataInTheCRF_(tableName, table);
        }


        [Then(@"I verify below ""(.*)"" table questions answer data status in the CRF\.")]
        public void ThenIVerifyBelowTableQuestionsAnswerDataStatusInTheCRF_(string TableName, Table table)
        {
            StringBuilder UnverifiedQs = new StringBuilder();
            IEnumerable<CRFTableQuestionsData> Data = table.CreateSet<CRFTableQuestionsData>();
            List<CRFTableQuestionsData> Questions = (List<CRFTableQuestionsData>)Data;
            List<string> Unverified = new List<string>();
            BP_CRFUtilities.VerifyTableQuestionsAnswerStateInCRF(TableName, Questions, out Unverified);
            if (Unverified.Count > 0)
            {
                foreach (string Question in Unverified)
                {
                    UnverifiedQs.Append(Question + ",");
                }
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to verify table questions '" + UnverifiedQs + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on ""(.*)"" button in ""(.*)"" table\.")]
        public void WhenIClickOnButtonInTable_(string ButtonName, string TableName)
        {
            
            if(!BP_CRFUtilities.ClickAddNewRowButtonForTable(TableName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to click Add New Row button for table '" + TableName + "' in the CRF. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on ""(.*)"" answer value link for flat question ""(.*)""\.")]
        public void WhenIClickOnAnswerValueLinkForFlatQuestion_(string AnswerValue, string QuestionPrompt)
        {
            BP_CRFUtilities.ClickAnswerLinkOfFlatQuestion(QuestionPrompt, AnswerValue);
        }

        [When(@"I click on ""(.*)"" answer value link for table ""(.*)"" question ""(.*)"" in row ""(.*)""\.")]
        public void WhenIClickOnAnswerValueLinkForTableQuestionInRow_(string AnswerValue, string TableName, string QuestionPrompt, int RowNum)
        {
            BP_CRFUtilities.ClickAnswerLinkOfTableQuestion(TableName, RowNum.ToString(), QuestionPrompt, AnswerValue);
        }


        [When(@"I enter below flat mismatched questions data in the PDEP CRF")]
        public void WhenIEnterBelowFlatMismatchedQuestionsDataInThePDEPCRF(Table table)
        {
            IEnumerable<PDEP_MismatchedFlatQuestionData> dataList = table.CreateSet<PDEP_MismatchedFlatQuestionData>();
            if (!BP_CRFUtilities.AnswerMismatchedFlatQuestions(dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click ExpandAll events in PatientPage")]
        public void WhenIClickExpandAllEventsInPatientPage()
        {
            if (!BP_Patient_EventFormUtilities.ExpandAllEvents())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see form ""(.*)"" under event ""(.*)""")]
        public void ThenISeeFormUnderEvent(String formName, String eventName)
        {
            if (!BP_Patient_EventFormUtilities.IsFormAvailable(eventName, formName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I dont see event ""(.*)"" in PatientPortalPage")]
        public void ThenIDontSeeEventInPatientPortalPage(String eventName)
        {
            if (BP_Patient_EventFormUtilities.IsEventAvailable(eventName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see event ""(.*)"" in PatientPortalPage")]
        public void ThenISeeEventInPatientPortalPage(String eventName)
        {
            if (!BP_Patient_EventFormUtilities.IsEventAvailable(eventName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I expand event ""(.*)"" in PatientPortal")]
        public void WhenIExpandEventInPatientPortal(String eventName)
        {
            String patientEventKey = String.Empty;
            if (!BP_Patient_EventFormUtilities.ExpandEvent(eventName, out patientEventKey))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I collapse event ""(.*)"" in PatientPortal")]
        [Given(@"I collapse event ""(.*)"" in PatientPortal")]
        public void WhenICollapseEventInPatientPortal(String eventName)
        {
            String patientEventKey = String.Empty;
            if (!BP_Patient_EventFormUtilities.CollapseEvent(eventName, out patientEventKey))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see forms under event ""(.*)""")]
        public void ThenISeeFormsUnderEvent(String eventName, Table table)
        {
            IEnumerable<String> formList = table.CreateSet<String>();
            if (!BP_Patient_EventFormUtilities.AreFormsAvailable(eventName, (List<String>)formList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Publish button in AddEventsPage")]
        public void WhenIClickPublishButtonInAddEventsPage()
        {
            if (!BP_Patient_AddEvetnsUtilities.ClickPublishButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click event date value ""(.*)"" for ""(.*)"" event")]
        public void WhenIClickEventDateValueForEvent(string DateValue, string EventName)
        {
            if(!BP_Patient_EventFormUtilities.ClickEventDateForAnEvent(EventName, DateValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I set NeweventDate ""(.*)"" in EventActualDate modal\.")]
        public void WhenISetNeweventDateInEventActualDateModal(string NewEventDateValue)
        {
            if (!BP_Patient_EventFormUtilities.SetNewEventDate(NewEventDateValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Save button in EventActualDatePage")]
        public void WhenIClickSaveButtonInEventActualDatePage()
        {
            if (!BP_ModalWindow.ClickSaveButton("Event Actual Date"))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify event date value ""(.*)"" for ""(.*)"" event")]
        public void ThenIVerifyEventDateValueForEvent(String EventDate, string Eventname)
        {
            if (!BP_Patient_EventFormUtilities.VerifyEventDateForAnEvent(EventDate, Eventname))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I update eventDate in EventActualDate modal\.")]
        public void WhenIupdateeventDateInEventActualDateModal_(Table table)
        {
            Event_New_EventDate EventDateDetails = table.CreateInstance<Event_New_EventDate>();
            
            if(!BP_Patient_EventFormUtilities.UpdateEventDate(EventDateDetails))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I set flag for below flat questions data in the CRFs\.")]
        public void WhenISetFlagForBelowFlatQuestionsDataInTheCRFs(Table table)
        {
            StringBuilder FailedData = new StringBuilder();
            IEnumerable<CRFFlatQuestionsData> Data = table.CreateSet<CRFFlatQuestionsData>();
            List<CRFFlatQuestionsData> Questions = (List<CRFFlatQuestionsData>)Data;
            List<string> Items = new List<string>();

            if(!BP_CRFUtilities.SetFlagsForFlatQuestionInCRF(Questions, out Items))
            {
                foreach (string Item in Items)
                {
                    FailedData.Append(Item + ";\n");
                }
                ScenarioContext.Current["Comments"] = "unable to set the flags for the following \n" + FailedData;
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            
        }
        [When(@"I set flag for below ""(.*)"" table questions data in the CRFs\.")]
        public void WhenISetFlagForBelowTableQuestionsDataInTheCRFs_(string TableName, Table table)
        
        {
            StringBuilder FailedData = new StringBuilder();
            IEnumerable<CRFTableQuestionsData> Data = table.CreateSet<CRFTableQuestionsData>();
            List<CRFTableQuestionsData> Questions = (List<CRFTableQuestionsData>)Data;
            List<string> Items = new List<string>();
            if(!BP_CRFUtilities.SetFlagsForTableQuestionsInCRF(TableName, Questions, out Items))
            {
                foreach(string Item in Items)
                {
                    FailedData.Append(Item + ";\n");
                }
                ScenarioContext.Current["ActResult"] = "Failed";
                ScenarioContext.Current["Comments"] = "Unabel to set the flags for the following table questions \n" + FailedData;

            }
        }
        [When(@"I select radio button for below forms in M-Review CRFs")]
        public void WhenISelectRadioButtonForBelowFormsInM_ReviewCRFs(Table table)
        {
            IEnumerable<FlagMultipleCRFsData> dataList = table.CreateSet<FlagMultipleCRFsData>();
            if (!BP_FlagCRFsUtilities.SelectFormForFlag((List<FlagMultipleCRFsData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on Save button in M-Review CRFs Page")]
        public void WhenIClickOnSaveButtonInM_ReviewCRFsPage()
        {
            if (!BP_FlagCRFsUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click ""(.*)"" button on CRF\.")]
        public void WhenIClickButtonCRF_(string buttonName)
        {
            if (!BP_CRFUtilities.ClickButtonOnCRF(buttonName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }




    }
}
