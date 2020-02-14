using System;
using BusinessProcesses.DataLabs.Common;
using TechTalk.SpecFlow;
using Framework.Actions;
using Pages.DataLabs.Main;
using Pages.DataLabs.Study;
using Pages.DataLabs.Labs;

namespace EDC_Automation.Steps.DataLabs.F6074
{
    [Binding]
    public class US36587_DL_SiteToLabAssociationIncludingLinkOnSiteManagementPage
    {

        [Given(@"I navigate to Study Administration page\.")]
        [When(@"I navigate to Study Administration page\.")]
        public void GivenINavigateToStudyAdministrationPage_()
        {
            Control_ActionUtilities.Dropdown_SelectItem(DL_MainPage.PortalSelectionDropDown, "Study Administration", "Unable to select Study Administration item.");
        }
        [Then(@"I should be able to see""(.*)"" description under Lab Mangement")]
        public void ThenIShouldBeAbleToSeeDescriptionUnderLabMangement(string desc)
        {
            if(BP_StudyAdministationUtilities.VerifyLabManagementDescription()!=desc)
            { 
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Given(@"I select Group Management link on Study Administration page\.")]
        public void GivenISelectGroupManagementLinkOnStudyAdministrationPage_()
        {
            Control_ActionUtilities.Click_PerssEnterKey(DL_StudyAdministrationPage.GetLink("Group Management"), "Unable to click Group Management link on Study Administration page.");
        }
    }
}
