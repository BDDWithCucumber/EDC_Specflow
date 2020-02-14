using System.Collections.Generic;
using TechTalk.SpecFlow;
using BusinessProcesses.DataLabs.Main;
using BusinessProcesses.DataLabs.Patients;
using Pages.DataLabs.Data;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.TempSteps
{
    [Binding]
    public class SampleTestSteps
    {
        [Given(@"I select ""(.*)"" tab from the main menu of DataLabs\.")]
        public void GivenISelectTabFromTheMainMenuOfDataLabs_(string MenuTab)
        {
            BP_MainNavigationUtilities.SelectPrimaryTabOnMenu("Patients");
        }

        [When(@"I enter add patient data as below")]
        public void WhenIEnterAddPatientDataAsBelow(Table table)
        {
            List<string> Failed = new List<string>();
            IEnumerable<AddPatientData> PatientData = table.CreateSet<AddPatientData>();
            List<AddPatientData> PatientsList = (List<AddPatientData>)PatientData;
            BP_PatientUtilities.AddPatients(PatientsList, out Failed);
        }

        [Given(@"I select site ""(.*)"" from Sites dropdown\.")]
        public void GivenISelectSiteFromSitesDropdown_(string SiteName)
        {
            BP_MainNavigationUtilities.SelectSiteFromSiteDropdown(SiteName);
        }

        [When(@"I select ""(.*)"" patient\.")]
        public void WhenISelectPatient_(string PatientDet)
        {
            BP_PatientUtilities.SelectPatientFromPatientsTable(PatientDet);
        }

       

        [When(@"I enroll the selected patient with below details for patient ""(.*)""\.")]
        public void WhenIEnrollTheSelectedPatientWithBelowDetailsForPatient_(string Patient, Table table)
        {
            IEnumerable<EnrollPatientData> PatientData = table.CreateSet<EnrollPatientData>();
            List<EnrollPatientData> Data = (List<EnrollPatientData>)PatientData;
            BP_PatientUtilities.EnrollAPatient(Patient, Data[0]);
        }

        [When(@"I select ""(.*)"" button on ""(.*)"" CRF\.")]
        public void WhenISelectButtonOnCRF_(string ButtonName, string CRFName)
        {
            BP_CRFUtilities.SelectButtonOnCRF(CRFName, ButtonName);
        }

        [When(@"I enter below data for Flat questions in CRF\.")]
        [Given(@"I enter below data for Flat questions in CRF\.")]
        public void WhenIEnterBelowDataForFlatQuestionsInCRF_(Table table)
        {
            IEnumerable<CRFFlatQuestionsData> Data = table.CreateSet<CRFFlatQuestionsData>();
            List<CRFFlatQuestionsData> Questions = (List<CRFFlatQuestionsData>)Data;
            List<string> UnfilledQuestions = new List<string>();
            BP_CRFUtilities.FillFlatQuestionsInCRF(Questions, out UnfilledQuestions);
        }

        [When(@"I select entry complete checkbox\.")]
        public void WhenISelectEntryCompleteCheckbox_()
        {
            BP_CRFUtilities.SelectEntryCompleteChkBox();
        }

        [When(@"I deselect entry complete checkbox")]
        public void WhenIDeselectEntryCompleteCheckbox_()
        {
            BP_CRFUtilities.DeselectEntryCompleteChkBox();
        }

        [Then(@"The CRF is saved and checked-in successfully\.")]
        public void ThenTheCRFIsSavedAndChecked_InSuccessfully_()
        {
            BP_CRFUtilities.VerifyCRFSavedSuccessfully();
        }

        [Then(@"I click on ""(.*)"" button for ""(.*)"" in CRF\.")]
        public void ThenIClickOnButtonForInCRF_(string ButtonName, string TableName)
        {
            //BP_CRFUtilities.CLickAddNewRowButtonForTable(TableName);
        }

        [Then(@"I enter below data in ""(.*)"" in CRF\.")]
        public void ThenIEnterBelowDataInInCRF_(string TableName, Table table)
        {
            IEnumerable<CRFTableQuestionsData> Data = table.CreateSet<CRFTableQuestionsData>();
            List<CRFTableQuestionsData> Questions = (List<CRFTableQuestionsData>)Data;
            List<string> Unfilled = new List<string>();
            BP_CRFUtilities.FillTableQuestionsNSaveInCRF(TableName, Questions, out Unfilled);
        }

        [Then(@"I enter below data in Autobuild table ""(.*)"" in CRF\.")]
        public void ThenIEnterBelowDataInAutobuildTableInCRF_(string TableName, Table table)
        {
            IEnumerable<CRFTableQuestionsData> Data = table.CreateSet<CRFTableQuestionsData>();
            List<CRFTableQuestionsData> Questions = (List<CRFTableQuestionsData>)Data;
            List<string> Unfilled = new List<string>();
            BP_CRFUtilities.FillAutoBuildTableQuestionsNSaveInCRF(TableName, Questions, out Unfilled);
        }


    }
}
