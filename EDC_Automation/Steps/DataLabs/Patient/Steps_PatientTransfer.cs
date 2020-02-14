using BusinessProcesses.DataLabs.Patients;
using Pages.DataLabs.Data;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Patient
{
    [Binding]
    public class Steps_PatientTransfer
    {
        [When(@"I set transfer patient data in TransferPatientPage")]
        public void WhenISetTransferPatientDataInTransferPatientPage(Table table)
        {
            PatientTransferData data = table.CreateInstance<PatientTransferData>();
            if (!BP_TransferPatientUtilities.SetDataToTransaferPatient(data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Transfer button in TransferPatientPage")]
        public void WhenIClickTransferButtonInTransferPatientPage()
        {
            if (!BP_TransferPatientUtilities.ClickTransferButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
