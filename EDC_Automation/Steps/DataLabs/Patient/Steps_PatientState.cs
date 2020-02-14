using Pages.DataLabs.Data;
using BusinessProcesses.DataLabs.Patients;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Patient
{
    [Binding]
    class Steps_PatientState
    {
        [Given(@"I click on Thaw button in ThawCRFPage")]
        public void GivenIClickOnThawButtonInThawCRFPage()
        {
            if( !BP_PatientState_ThawPatient.clickSaveBtnInThawPatient())
             {
                ScenarioContext.Current["ActResult"] = "Failed";
             }
        }

        [Given(@"I click on SelectAll button in ThawCRFPage")]
        public void GivenIClickOnSelectAllButtonInThawCRFPage()
        {
            if (!BP_PatientState_ThawPatient.clickSelectAllBtnInThawPatient())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Save button on in ThawPatientsPage")]
        public void WhenIClickOnSaveButtonOnInThawPatientsPage()
        {
            if (!BP_PatientState_ThawPatient.clickSaveBtnInThawPatient())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Save button on in FreezepatientsPage")]
        public void WhenIClickOnSaveButtonOnInFreezepatientsPage()
        {
            if (!BP_PatientState_FreezePatient.clickSaveBtnInFreezePatient())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Save button on in LockPatientsPage")]
        public void WhenIClickOnSaveButtonOnInLockPatientsPage()
        {
            if (!BP_PatientState_LockPatient.clickSaveBtnInLockPatient())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on Save button on in UnlockPatientsPage")]
        public void WhenIClickOnSaveButtonOnInUnlockPatientsPage()
        {
            if (!BP_PatientState_UnlockPatient.clickSaveBtnInUnlockPatient())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I select patients to lock in LockPatientsPage")]
        [When(@"I select patients to Thaw in ThawPatientsPage")]
        [When(@"I select patients to Unlock in UnlockPatientsPage")]
        [When(@"I select patients to freeze in FreezePatientsPage")]
        public void WhenISelectPatientsToInFreezePatientsPage(Table table)
        {
            IEnumerable<PatientTableData> Data = table.CreateSet<PatientTableData>();
            List<PatientTableData> PatientsList = (List<PatientTableData>)Data;
            List<string> FailedItems = new List<string>();
            StringBuilder FailData = new StringBuilder();

            BP_PatientState_FreezePatient.SelectCheckboxForPatients(PatientsList,out FailedItems);
            if(FailedItems.Count>0)
            {
                ScenarioContext.Current["Actual"] = "Failed";
                foreach (string Item in FailedItems)
                    FailData.Append(Item + ";");
            }
        }
    }
}
