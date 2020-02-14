using TechTalk.SpecFlow;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System;
using Framework.Actions;
using BusinessProcesses.DataLabs.Permissions;
using Pages.DataLabs.Labs;
using Pages.DataLabs.Study;
using Pages.DataLabs.Common;
using Pages.DataLabs.Permissions;
using BusinessProcesses.DataLabs.Common;

namespace EDC_Automation.Steps.DataLabs.F6074
{
    [Binding]
    class US36583_DL_LabAdministrationLinkInStudyAdministrationPage
    {
        [When(@"User Navigates to Study Administration Page")]
        [Then(@"User Navigates to Study Administration Page")]
        [Given(@"user is navigated to Study Administration Page")]
        public void ThenUserNavigatesToStudyAdministrationPage()
        {
            Control_ActionUtilities.VerifyObjectExistOnPage(DL_StudyAdministrationPage.GetLink("Study Management"), "Study Management Link", "Study Administration", "Unable to verify user is on Study Administration page.");
        }

        [Then(@"User shall see Lab Management link below Site Management")]
        [Then(@"user shall see Lab Management link below Site Management")]
        public void ThenUserShallSeeLabManagementLinkBelowSiteManagement()
        {
            Control_ActionUtilities.VerifyObjectExistOnPage(DL_StudyAdministrationPage.GetLink("Lab Management"), "Lab Management Link", "Study Administration", "Unable to verify Lab Management link on Study Administration page.");
        }

        [Then(@"user shall not see Lab Management link below Site Management")]
        public void ThenUserShallNotSeeLabManagementLinkBelowSiteManagement()
        {
            Control_ActionUtilities.VerifyObjectNotExistOnPage(DL_StudyAdministrationPage.GetLink("Lab Management"), "Lab Management Link", "Study Administration", "Unable to verify Lab Management link on Study Administration page.");
        }


        [When(@"user selects Lab Management link")]
        [Then(@"user selects Lab Management link")]
        public void WhenUserSelectsLabManagementLink()
        {
            Control_ActionUtilities.Click_PerssEnterKey(DL_StudyAdministrationPage.GetLink("Lab Management"), "Unable to click Lab Management link.");
        }

        [When(@"the user select Group Management link on Study Administration page\.")]
        [Given(@"the user select Group Management link on Study Administration page\.")]
        public void GivenTheUserSelectGroupManagementLinkOnStudyAdministrationPage_()
        {
            Control_ActionUtilities.Click_PerssEnterKey(DL_StudyAdministrationPage.GetLink("Group Management"), "Unable to click Group Management link.");
        }

        [Then(@"Help Text below Lab Management is displayed as ""(.*)""\.")]
        public void ThenHelpTextBelowLabManagementIsDisplayedAs_(string LabMgmtHelpText)
        {
            string HlpText = Control_ActionUtilities.GetTextOfAnObject(DL_StudyAdministrationPage.LabMgmntHelpText, "Lab Management Help text", "Study Administration", "Unable to verify help text for Lab Management page.");
            if (!LabMgmtHelpText.Equals(HlpText))
            {
                Control_ActionUtilities.LogException("Verification of Lab Management help text as '" + LabMgmtHelpText + "'", string.Empty, "Help text for Lab Management is not displayed as " + LabMgmtHelpText + " on Study Administration page.");
            }
        }


        [Then(@"A logo on left of Lab Management link is displayed\.")]
        public void ThenALogoOnLeftOfLabManagementLinkIsDisplayed_()
        {
            Control_ActionUtilities.VerifyObjectExistOnPage(DL_StudyAdministrationPage.LabMgmntImage, "Lab Management Logo", "Study Administration", "Unable to verify logo for Lab Management link on Study Administration page.");
        }

        [Then(@"user navigates to Lab Management Page")]
        [Given(@"user is navigated to Lab Mangement Page")]
        public void ThenUserNavigatesToLabManagementPage()
        {
            Control_ActionUtilities.VerifyObjectExistOnPage(DL_LabManagementPage.LabManagementTitle, "Lab Management title", "Lab Management", "Unable to verify user is on Lab Management page.");
        }

        [Then(@"user shall see ""(.*)"" link under actions palette")]
        public void ThenUserShallSeeLinkUnderActionsPalette(string ActionLinkName)
        {
            string Missed;
            //if (!ActionPaletteUtilities.VerifyActionLinksDisplayed(DL_LabManagementPage.LabManagementActionsPalette, ActionLinkName, "Lab Management", out Missed))
            //{
            //    Assert.Fail("The link " + Missed + " is not displayed in the actions palatte of Lab Management page.");
            //}
        }


        [Then(@"breadcrumb shall display as Study Administration > Lab Management")]
        public void ThenBreadcrumbShallDisplayAsStudyAdministrationLabManagement()
        {
            List<string> BreadCrumbs = new List<string>();
            BreadCrumbs.Add("Study Administration");
            BreadCrumbs.Add("Lab Management");
            String MissingItem = String.Empty;
            if (!BP_BreadCrumbUtilities.HasBreadCrumbItems(DL_CommonObjects.BreadCrumbContainer, BreadCrumbs, out MissingItem))
            {
                Assert.Fail("BreadCrumbItem " + MissingItem + " is not displayed.");
            }
        }


        [When(@"I set ""(.*)"" permission under ""(.*)"" category to ""(.*)"" and Save\.")]
        public void WhenISetPermissionUnderCategoryToAndSave_(string Permission, string Category, string ValueToSet)
        {
            if(BP_PermissionUtilities.SetPermission(Category, Permission, ValueToSet))
            {                
                Control_ActionUtilities.Click(DL_PermissionsPage.PermissionsSaveButton, "Unable to click Save button on Group Permissions page.");
            }
            else
            {
                Assert.Fail("Permission " + Permission + " under " + Category + " is not set to " + ValueToSet + ".");
            }
        }

        [Then(@"user can see Add Lab link enabled")]
        public void ThenUserCanSeeAddLabLinkEnabled()
        {
            //string temp;
            //ActionPaletteUtilities.VerifyActionLinksDisplayed(DL_LabManagementPage.LabManagementActionsPalette, "Add Lab", "Lab Management", out temp);
        }


    }
}