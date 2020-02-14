using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using Pages.DataLabs.Data;
using TechTalk.SpecFlow.Assist;
using BusinessProcesses.DataLabs.Patients;

namespace EDC_Automation.Steps.DataLabs.Patient
{
    [Binding]
    public class Steps_FreezeThawCRFs
    {
        [When(@"I select Thaw checkbox for below forms in ThawCRFsPage")]
        public void WhenISelectThawCheckboxForBelowFormsInThawCRFsPage(Table table)
        {
            IEnumerable<RequestSignatureData> dataList = table.CreateSet<RequestSignatureData>();
            if (!BP_FreezeThawCRFUtilities.SelectFreezeThawCheckbox((List<RequestSignatureData>)dataList, "Thaw"))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I select Freeze checkbox for below forms in FreezeCRFsPage")]
        public void WhenISelectFreezeCheckboxForBelowFormsInFreezeCRFsPage(Table table)
        {
            IEnumerable<RequestSignatureData> dataList = table.CreateSet<RequestSignatureData>();
            if (!BP_FreezeThawCRFUtilities.SelectFreezeThawCheckbox((List<RequestSignatureData>)dataList, "Freeze"))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click on ""(.*)"" button in ThawCRFsPage")]
        [When(@"I click on ""(.*)"" button in FreezeCRFsPage")]
        public void WhenIClickOnButtonInFreezeThawCRFsPage(string buttonName)
        {
            if(!BP_FreezeThawCRFUtilities.SelectFreezeThawButton(buttonName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


    }
}
