using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Main.CRF;
using BusinessProcesses.DataLabs.Main.DCF;
using BusinessProcesses.DataLabs.Patients.Form;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Main
{
    [Binding]
    public class Steps_MainDCFsTab
    {

        [When(@"I expand search palette in MainDCFspage")]
        public void WhenIExpandSearchPaletteInMainDCFspage()
        {
            if (!BP_DCFs_PaletteUtilities.ExpandSearchPalette())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select value ""(.*)"" from ""(.*)"" dropdown of search palette in MainDCFspage")]
        public void WhenISelectValueFromDropdownOfSearchPaletteInMainDCFspage(String dropdownValue, String dropdownName)
        {
            if (!BP_DCFs_PaletteUtilities.SetDropdownValueForSearchCriteria(dropdownName, dropdownValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Go butotn in search palette in MainDCFspage")]
        public void WhenIClickGoButotnInSearchPaletteInMainDCFspage()
        {
            if (!BP_DCFs_PaletteUtilities.ClickGoButtonOfSearchPalette())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see searched DCFs in MainDCFspage")]
        public void ThenISeeSearchedDCFsInMainDCFspage(Table table)
        {
            IEnumerable<MainDCFsTab_SearchData> dataList = table.CreateSet<MainDCFsTab_SearchData>();
            if (!BP_MainDCFsTabUtilities.VerifyDCFs_SearchResult((List<MainDCFsTab_SearchData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I open DCF with DCF ID ""(.*)"" in MainDCFsPage")]
        public void WhenIOpenDCFWithDCFIDInMainDCFsPage(int dcfId)
        {
            if (!BP_MainDCFsTabUtilities.OpenDCF(dcfId))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I expand flags palette in EditDCFPage")]
        public void WhenIExpandFlagsPaletteInEditDCFPage()
        {
            if (!BP_EditDCFPageUtilities.ExpandFlagsPalette())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click flags palette item ""(.*)"" in EditDCFPage")]
        public void WhenIClickFlagsPaletteItemInEditDCFPage(string p0)
        {
            if (!BP_EditDCFPageUtilities.ClickReadyToPrintLink())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Ready to Print flag ""(.*)"" in EditDCFPage")]
        public void WhenIClickReadyToPrintFlagInEditDCFPage(string p0)
        {
            if (!BP_EditDCFPageUtilities.ClickReadyToPrintOn())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see Ready to Print Status ""(.*)""")]
        public void ThenISeeReadyToPrintStatus(String status)
        {
            if (!BP_EditDCFPageUtilities.VerifyReadyToPrintStatus(status))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see DCF details in DCFWizardStep1Page")]
        public void ThenISeeDCFDetailsInDCFWizardStepPage(Table table)
        {
            IEnumerable<DCFPrintWizardStep1Data> dataList = table.CreateSet<DCFPrintWizardStep1Data>();
            if (!BP_DCFPrintWizardStep1Utilites.VerifyDCFs(dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click NextButton in DCFWizardStep1Page")]
        public void WhenIClickNextButtonInDCFWizardStep1Page()
        {
            if (!BP_DCFPrintWizardStep1Utilites.ClickNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click NextButton in DCFWizardStep2Page")]
        public void WhenIClickNextButtonInDCFWizardStep2Page()
        {
            if (!BP_DCFPrintWizardStep2Utilites.ClickNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click FinishButton in DCFWizardStep3Page")]
        public void WhenIClickFinishButtonInDCFWizardStepPage()
        {
            if (!BP_DCFPrintWizardStep3Utilites.ClickFinishButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click draft dcfs ""(.*)"" for patient ""(.*)"" in MainDCFsPage")]
        public void WhenIClickDraftDcfsForPatientInMainDCFsPage(int draftDCFsCount, String patient)
        {
            if(!BP_DCF_PatientsPageUtilities.OpenDraftDCFs(patient, draftDCFsCount))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click dcfid ""(.*)"" in DraftDCFsPage")]
        public void WhenIClickDcfidInDraftDCFsPage(int dcfID)
        {
            if (!BP_DCF_DraftDCFsPage.OpenDCF(dcfID))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I selected dropdown item ""(.*)"" for customdropdown1 in EditDCFPage")]
        public void WhenISelectedDropdownItemForCustomdropdown1InEditDCFPage(String customDropdownValue)
        {
            if (!BP_EditDCFPageUtilities.SetValueForCustomFieldDropdown1(customDropdownValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I selected dropdown item ""(.*)"" for customdropdown2 in EditDCFPage")]
        public void WhenISelectedDropdownItemForCustomdropdown2InEditDCFPage(string customDropdownValue)
        {
            if (!BP_EditDCFPageUtilities.SetValueForCustomFieldDropdown2(customDropdownValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in EditDCFPage")]
        public void WhenIClickSaveButtonInEditDCFPage()
        {
            if (!BP_EditDCFPageUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see selected dropdown item ""(.*)"" for customdropdown1 in EditDCFPage")]
        public void ThenISeeSelectedDropdownItemForCustomdropdown1InEditDCFPage(String customDropdownValue)
        {
            if (!BP_EditDCFPageUtilities.VerifyCustomFieldDropdownValue1(customDropdownValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I see selected dropdown item ""(.*)"" for customdropdown2 in EditDCFPage")]
        public void ThenISeeSelectedDropdownItemForCustomdropdown2InEditDCFPage(String customDropdownValue)
        {
            if (!BP_EditDCFPageUtilities.VerifyCustomFieldDropdownValue1(customDropdownValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I expand ""(.*)"" to select and open ""(.*)"" CRF in CRF_PDEP_EventsPage")]
        public void WhenIExpandToSelectAndOpenCRFInCRF_PDEP_EventsPage(String eventName, String formName)
        {
            if(!BP_CRF_PDEP_EventsPageUtilities.OpenForm(eventName, formName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I expand ""(.*)"" to check ""(.*)"" CRF icons in CRF_PDEP_EventsPage")]
        public void ThenIExpandToCheckCRFIconsInCRF_PDEP_EventsPage(String eventName, String formName, Table table)
        {
            IEnumerable<PDEP_FormIconsData> dataList = table.CreateSet<PDEP_FormIconsData>();
            if (!BP_CRF_PDEP_EventsPageUtilities.VerifyFormIcons(eventName, formName, (List<PDEP_FormIconsData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I expand ""(.*)"" in CRF_PDEP_EventsPage")]
        public void WhenIExpandInCRF_PDEP_EventsPage(String eventName)
        {
            String identifier = String.Empty;
            if (!BP_CRF_PDEP_EventsPageUtilities.ExpandEvent(eventName, out identifier))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see form restriction message in CRF_PDEP_EventsPage")]
        public void ThenISeeFormRestrictionMessageInCRF_PDEP_EventsPage(Table table)
        {
            IEnumerable<PDEP_FormAccesssRestrictionMessageData> dataList = table.CreateSet<PDEP_FormAccesssRestrictionMessageData>();
            if (!BP_CRF_PDEP_EventsPageUtilities.VerifyFormRestrictionMessage((List<PDEP_FormAccesssRestrictionMessageData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}