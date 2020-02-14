using BusinessProcesses.DataLabs.Patients;
using Pages.DataLabs.Data;
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
    class Steps_PatientCasebook
    {
        [Then(@"I see form details of event ""(.*)"" in PatientCaseBookPage")]
        public void ThenISeeFormDetailsOfEventInPatientCaseBookPage(String eventName, Table table)
        {
            IEnumerable<PatientCasebookData> dataList = table.CreateSet<PatientCasebookData>();
            if(!BP_PatientCasebookUtilities.VerifyPatientCasebook(eventName, (List<PatientCasebookData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
