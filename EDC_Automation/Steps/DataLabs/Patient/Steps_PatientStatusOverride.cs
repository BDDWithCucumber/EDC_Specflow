using BusinessProcesses.DataLabs.Patients;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Patient
{
    [Binding]
    class Steps_PatientStatusOverride
    {
        [Given(@"I select change to ""(.*)"" in PatientStatusOverridePage")]
        [Given(@"I select change to ""(.*)"" in PatientStatusOverridePage")]
        public void GivenISelectChangeToInPatientStatusOverridePage(String status)
        {
            if (!BP_PatientStatusOverrideUtilities.SetStatus(status))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I enter reason ""(.*)"" for patient status change in PatientStatusOverridePage")]
        public void GivenIEnterReasonForPatientStatusChangeInPatientStatusOverridePage(String reason)
        {
            if (!BP_PatientStatusOverrideUtilities.SetReasonForChange(reason))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I Click save button in PatientStatusOverridePage")]
        public void GivenIClickSaveButtonInPatientStatusOverridePage()
        {
            if (!BP_PatientStatusOverrideUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}