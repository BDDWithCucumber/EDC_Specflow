using BusinessProcesses.DataLabs.DerivationManagement;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Main
{
    [Binding]
    public class Steps_DerivationManagement
    {
        [When(@"I click Next button in DerivationRunWizardCriteriaPage")]
        public void WhenIClickNextButtonInDerivationRunWizardCriteriaPage()
        {
            if (!BP_DerivationRunWizardCriteriaUtilities.ClickNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        
        [When(@"I select site ""(.*)"" in DerivationRunWizardSitesPage")]
        public void WhenISelectSiteInDerivationRunWizardSitesPage(String site)
        {
            if (!BP_DerivationRunWizardSitesUtilities.SelectSite(site))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select patient ""(.*)"" in DerivationRunWizardPatientsPage")]
        public void WhenISelectPatientInDerivationRunWizardPatientsPage(string patientID)
        {
            if (!BP_DerivationRunWizardSitesUtilities.SelectPatient(patientID))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I click Next button in DerivationRunWizardSitesPage")]
        [When(@"I click Next button in DerivationRunWizardPatientsPage")]
        public void WhenIClickNextButtonInDerivationRunWizardSitesPage()
        {
            if (!BP_DerivationRunWizardSitesUtilities.ClickNextButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Finish button in DerivationRunWizardPage")]
        public void WhenIClickFinishButtonInDerivationRunWizardPage()
        {
            if (!BP_DerivationRunWizardUtilities.ClickFinishButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select ""(.*)"" radio button on Criteria to Run Derivations step\.")]
        public void WhenISelectRadioButtonOnCriteriaToRunDerivationsStep_(string RadioOption)
        {
            if(!BP_DerivationRunWizardCriteriaUtilities.SelectRunDerivationsCriteria(RadioOption))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select the " + RadioOption + " radio option.";
            }
        }
        [Given(@"I click derivation ""(.*)"" in DerivationManagementPage")]
        [When(@"I click derivation ""(.*)"" in DerivationManagementPage")]
        public void WhenIClickDerivationInDerivationManagementPage(string derivationName)
        {
            if (!BP_DerivationManagementUtilities.SelectDerivationByDerivationNameFilter(derivationName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select the " + derivationName + "derivation link";
            }
        }
        [Given(@"I Select ""(.*)"" from Status field in DerivationManagementPage")]
        [When(@"I Select ""(.*)"" from Status field in DerivationManagementPage")]
        public void WhenISelectFromStatusFieldInDerivationManagementPage(string derivationStatus)
        {
            if (!BP_DerivationManagementUtilities.SelectDerivationStatus(derivationStatus))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select the " + derivationStatus + "derivation status";
            }
        }
        [Given(@"I click on ""(.*)"" button in DerivationMangementPage")]
        [When(@"I click on ""(.*)"" button in DerivationMangementPage")]
        public void WhenIClickOnButtonInDerivationMangementPage(string buttonName)
        {
            if(!BP_DerivationManagementUtilities.ClickButtonOnDerivationPage(buttonName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to select the " + buttonName + " button";
            }
            
        }



    }
}