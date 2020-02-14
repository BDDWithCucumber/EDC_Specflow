using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Inbox;
using BusinessProcesses.DataLabs.Labs;
using BusinessProcesses.DataLabs.Modal;
using BusinessProcesses.DataLabs.PermissionGrop;
using BusinessProcesses.DataLabs.Permissions;
using BusinessProcesses.DataLabs.Sites;
using BusinessProcesses.DataLabs.Study;
using BusinessProcesses.DataLabs.Main;
using Common.WebTable;
using EDC_Automation.Helpers;
using Framework;
using Framework.Actions;
using Interfaces;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Pages.DataLabs.Labs;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;
using Pages.DataLabs.PermissionsGroup;
using Pages.DataLabs.Main;
using Pages.DataLabs.Study;
using Pages.DataLabs.Common;
using Pages.DataLabs.Permissions;

namespace EDC_Automation.Steps.DataLabs.F6074
{
    [Binding]
    public sealed class US36590_PermissionsForLabs : TechTalk.SpecFlow.Steps
    {
        [Then(@"I see Datalabs Home Page")]
        public void ThenISeeDatalabssHomePage()
        {
            if (DL_MainPage.PortalDropDown == null)
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select DataManagerPortal item ""(.*)"" from drop down")]
        [Given(@"I select DataManagerPortal item ""(.*)"" from drop down")]
        public void WhenISelectDataManagerPortalItemFromDropDown(String dataManagerPortalItem)
        {
            if (!BP_DataManagerPortalDropdownUtilities.SelectPortalDropdownItem(dataManagerPortalItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see""(.*)""")]
        public void ThenIShouldSee(string s)
        {
            if (!(string.Equals(BP_LabManagementUtilities.NormalizationMessageNoStudy(), s) ))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Link ""(.*)"" In Add lab Page")]
        [When(@"I click Link ""(.*)"" In Lab Management Page")]
        [When(@"I click Link ""(.*)"" In Manage Laboratories Page")]
        [Then(@"I click Link ""(.*)"" In StudyAdministrationPage")]
        [When(@"I click Link ""(.*)"" In StudyAdministrationPage")]
        public void WhenIClickLinkInStudyAdministrationPage(String linkName)
        {
            if (!BP_StudyAdministationUtilities.InvokeLinkInStudyAdministrationPage(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click Link ""(.*)"" In LabManagementPage")]
        public void WhenIClickLinkInLabManagementPage(string linkName)
        {
            if (!BP_LabManagementUtilities.GetLabManagementLink())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see ""(.*)"",""(.*)""")]
        public void ThenIShouldSee(string LabManagementLink, string NormalizeDataLink)
        {
            if (!BP_StudyAdministationUtilities.IsLinkAvailable(LabManagementLink))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            if (!BP_StudyAdministationUtilities.IsLinkAvailable(NormalizeDataLink))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I see Normalize Lab Data Page in Edit mode")]
        public void ThenISeeNormalizationPageInEditMode()
        {
            if (!BP_PermissionUtilities.VerifyNormalizeLabDataPageInViewMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Normalize Lab Data Page in View mode")]
        public void ThenISeeNormalizeLabDataPageInViewMode()
        {
            if (BP_PermissionUtilities.VerifyNormalizeLabDataPageInViewMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see BreadCrumb ""(.*)""")]
        public void ThenISeeBreadCrumb(String breadCrumbItems)
        {
            String errorItem = String.Empty;
            if (!BP_BreadCrumbUtilities.HasBreadCrumbItems(DL_CommonObjects.BreadCrumbContainer, breadCrumbItems, out errorItem))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I select ""(.*)"" from Group Management page\.")]
        [When(@"I click GroupName ""(.*)"" in GroupManagement Page")]
        public void WhenIClickGroupNameInGroupManagementPage(string groupName)
        {
            WebTable_SearchCriteriaItemList searchCreteriaList = new WebTable_SearchCriteriaItemList();
            searchCreteriaList.AddSearchItem(new WebTable_SearchCriteriaItem(0, groupName, TableColumnContentType.Link));
            IControl tableRow = WebTableUtilities.Table_FindRow(DL_GroupManagementPage.GroupsTable, searchCreteriaList);
            IControl groupNameLink = WebTableUtilities.GetElement(tableRow, groupName, 0, TableColumnContentType.Link);
            Control_ActionUtilities.Click_PerssEnterKey(groupNameLink, string.Empty);
        }

        [When(@"I select status ""(.*)"" for the permission group and Save")]
        public void WhenISelectStatusForThePermissionGroupAndSave(String status)
        {
            if (!BP_PermissionGroupUtilities.ChangeStatusAndSave(status))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see Permissions Group ""(.*)""")]
        public void ThenISeePermissionsGroup(string category)
        {
            bool hasCategory = false;
            IControl categoryRow = DL_PermissionsPage.GetPermissionsCategoryRow(category, out hasCategory);
            if (!hasCategory)
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I expand PermissionsGroup ""(.*)""")]
        [When(@"I expand PermissionsGroup ""(.*)""")]
        public void WhenIExpandPermissionsGroup(string category)
        {
            if (!BP_PermissionUtilities.ExpandCategory(category))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see expanded PermissionsGroup ""(.*)""")]
        public void ThenISeeExpandedPermissionsGroup(string category)
        {
            bool isCategoryExpanded = false;
            IControl expandCollapseImage = DL_PermissionsPage.GetExpandCollapseImage_CategoryRow(category, out isCategoryExpanded);
            if (!isCategoryExpanded)
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I validate GroupPermissionsData for the premissons group ""(.*)""")]
        [Given(@"Value in category ""(.*)"" for permission Lab Management is selected as View in EditPermissions page")]
        [Given(@"Value in category ""(.*)"" for permission Lab Management is selected as Hide in EditPermissions page")]
        [Then(@"I validate GroupPermissionsData for the premissons group ""(.*)""")]
        public void ThenIValidateGroupPermissionsDataForThePremissonsGroup(string category, Table table)
        {
            if (!BP_PermissionUtilities.CheckPermissionsData(category, table.CreateSet<GroupPermissionData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see message ""(.*)"" on Lab Management Page in Red color with text aligned in center\.")]
        public void ThenIShouldSeeMessageOnLabManagementPageInRedColorWithTextAlignedInCenter_(String message)
        {
            if (!BP_PermissionUtilities.ValidateMessageOnPage(message))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see message ""(.*)"" on Run Normalization Page\.")]
        public void ThenIShouldSeeMessageOnRunNormalizationPage(string message)
        {
            if (!BP_PermissionUtilities.ValidateMessageOnRunNormalizationPage(message))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }




        [Then(@"I validate GroupPermissionsData for the premissons group ""(.*)"" for Enabled and Disabled\.")]
        public void ThenIValidateGroupPermissionsDataForThePremissonsGroupForEnabledAndDisabled(string category, Table table)
        {
            if (!BP_PermissionUtilities.CheckPermissionsStatus(category, table.CreateSet<GroupPermissionData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I validate GroupPermissionsData for the premissons group ""(.*)"" are in below order")]
        public void ThenIValidateGroupPermissionsDataForThePremissonsGroupAreInBelowOrder(string category, Table table)
        {
            if (!BP_PermissionUtilities.CheckPermissions(category, table.CreateSet<GroupPermissionData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"User select ""(.*)"" from the breadcrumb\.")]
        [When(@"I click breadcrumb ""(.*)""")]
        [Given(@"I click breadcrumb ""(.*)""\.")]
        [Then(@"User can navigate back to Study Administration Page from breadcrumb")]
        [Then(@"I click breadcrumb ""(.*)""")]
        public void WhenIClickBreadcrumb(string breadCrumbItemText)
        {
            if (!BP_BreadCrumbUtilities.ClickBreadCrumbItem(breadCrumbItemText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I enter sites details and Save")]
        [When(@"I enter sites details and Save")]
        public void WhenIEnterSitesDetailsAndSave(Table siteList)
        {
            List<String> failSiteList = new List<String>();
            if (!BP_SiteCreationUtilities.AddSites(siteList.CreateSet<SiteData>(), out failSiteList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I open site with siteid ""(.*)"" and site name ""(.*)"" from SiteManagement page")]
        public void WhenIOpenSiteWithSiteidAndSiteNameFromSiteManagementPage(String siteId, String siteName)
        {
            if (!BP_SiteManagementUtilities.OpenSite(siteId, siteName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter lab data")]
        public void WhenIEnterLabData(Table table)
        {
            IEnumerable<SiteData> sites = table.CreateSet<SiteData>();
            List<SiteData> siteList = (List<SiteData>)sites;
            if (!BP_SiteCreationUtilities.AddSite(siteList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I enter labs details and Save")]
        [When(@"I enter labs details and Save")]
        public void WhenIEnterLabsDetailsAndSave(Table labList)
        {
            if (!BP_LabManagementUtilities.AddLabs(labList.CreateSet<LabData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see labs with details in lab grid")]
        public void ThenISeeLabsWithDetailsInLabGrid(Table labList)
        {
            IEnumerable<LabData> labs = labList.CreateSet<LabData>();
            List<LabData> mismatchedLabs = null;
            if (!BP_LabManagementUtilities.AreLabsAvailableWithDetails(labs, out mismatchedLabs))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I edit Lab ""(.*)"" And Save Lab with details")]
        public void WhenIEditLabAndSaveLabWithDetails(String labId, Table labData)
        {
            if (!BP_LabManagementUtilities.EditLab(labId, labData.CreateInstance<LabData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I edit Lab ""(.*)"" And Save Lab with duplicate details")]
        public void WhenIEditLabAndSaveLabWithduplicateDetails(String labId, Table labData)
        {
            if (BP_LabManagementUtilities.EditLab(labId, labData.CreateInstance<LabData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see LabCreation error message ""(.*)"" for column ""(.*)""")]
        public void ThenISeeLabCreationErrorMessageForColumn(String errorMessage, String column)
        {
            if (!BP_LabCreationUtilities.IsErrorMessageShown(column, errorMessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I clik LabCreation save button")]
        public void WhenIClikLabCreationSaveButton()
        {
            if (!Control_ActionUtilities.Click(DL_AddLabPage.SaveButton, String.Empty))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I press LabCreation cancel button")]
        public void ThenIPressLabCreationCancelButton()
        {
            if (!Control_ActionUtilities.Click(DL_AddLabPage.CancelButton, String.Empty))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I sort column ""(.*)"" in LabsGrid of LabManagementPage")]
        public void WhenISortColumnInLabsGridOfLabManagementPage(String columnName)
        {
            if (!BP_LabManagementUtilities.ClickOnColumnHeader(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see data in sort order ""(.*)"" in column ""(.*)"" in LabGrid")]
        public void ThenISeeDataInSortOrderInColumnInLabGrid(String sortOrder, String columnName)
        {
            if (!BP_LabManagementUtilities.IsDataInSortOrder(sortOrder, columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I apply filter on column ""(.*)"" with filter text ""(.*)"" by filter criteria ""(.*)"" in LabsGrid")]
        public void WhenIApplyFilterOnColumnWithFilterTextByFilterCriteriaInLabsGrid(String columnName, String filterText, String filterCriteria)
        {
            if (!BP_LabManagementUtilities.ApplyFilter(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see filtered data in column ""(.*)"" with filter text ""(.*)"" and filter criteria ""(.*)"" in LabsGrid")]
        public void ThenISeeFilteredDataInColumnWithFilterTextAndFilterCriteriaInLabsGrid(String columnName, String filterText, String filterCriteria)
        {
            if (!BP_LabManagementUtilities.IsDataFiltered(columnName, filterText, filterCriteria))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I clear filter on column ""(.*)"" in LabsGrid")]
        public void ThenIClearFilterOnColumnInLabsGrid(String columnName)
        {
            if (!BP_LabManagementUtilities.ClearFilter(columnName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I enter labs details and Save to Edit")]
        public void WhenIEnterLabsDetailsAndSaveToEdit(Table labList)
        {
            if (!BP_LabManagementUtilities.EditLab(labList.CreateSet<LabData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I open lab with labid ""(.*)"" from LabManagement page")]
        public void WhenIOpenLabWithLabidFromLabManagementPage(String labId)
        {
            if (!BP_LabManagementUtilities.OpenLab(labId))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I remove and save sites from assocaited sites in LabManagementSitesPage")]
        public void WhenIRemoveAndSaveSitesFromAssocaitedSitesInLabManagementSitesPage(Table table)
        {
            List<SiteInfo> siteInfoList = (List<SiteInfo>)table.CreateSet<SiteInfo>();
            if (!BP_Lab_AssociateSitesUtilities.DissociateSites(siteInfoList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I add and save sites to assocaited sites in LabManagementSitesPage")]
        [Then(@"I add and save sites to assocaited sites in LabManagementSitesPage")]
        public void WhenIAddAndSaveSitesToAssocaitedSitesInLabManagementSitesPage(Table table)
        {
            IEnumerable<SiteInfo> sites = table.CreateSet<SiteInfo>();
            if (!BP_Lab_AssociateSitesUtilities.AssociateSites((List<SiteInfo>)sites))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see sites in available sites in AssociateSitesPage")]
        public void ThenISeeSitesInAvailableSitesInAssociateSitesPage(Table table)
        {
            IEnumerable<SiteInfo> sites = table.CreateSet<SiteInfo>();
            if (!BP_Lab_AssociateSitesUtilities.VerifySitesInAvailableSites((List<SiteInfo>)sites))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I add and save site id ""(.*)"" and site name ""(.*)"" to assocaited sites in LabManagementSitesPage")]
        public void WhenIAddAndSaveSiteIdAndSiteNameToAssocaitedSitesInLabManagementSitesPage(String siteId, String siteName)
        {
            if (!BP_Lab_AssociateSitesUtilities.AssociateSite(siteId, siteName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see site data in sites tab of Lab in LabPage")]
        public void ThenISeeSiteDataInSitesTabOfLabInLabPage(Table siteInfo)
        {
            SiteData siteData = siteInfo.CreateInstance<SiteData>();
            if (!BP_LabCreationUtilities.IsSiteExistInSitesTableOfLab(siteData))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I remove and save site id ""(.*)"" and site name ""(.*)"" from assocaited sites in LabManagementSitesPage")]
        public void WhenIRemoveAndSaveSiteIdAndSiteNameFromAssocaitedSitesInLabManagementSitesPage(String siteId, String siteName)
        {
            if (!BP_Lab_AssociateSitesUtilities.UnAssociateSite(siteId, siteName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see No records message in sites tab of Lab in LabPage")]
        public void ThenISeeNoRecordsMessageInSitesTabOfLabInLabPage()
        {
            if (!BP_LabCreationUtilities.IsNoRecordsMessageExistInSitesTable())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I set value in category ""(.*)"" for permission ""(.*)"" for permission type ""(.*)"" in EditPermissions page")]
        public void WhenISetValueInCategoryForPermissionForPermissionTypeInEditPermissionsPage(string category, string permission, string permissionType)
        {
            if (!BP_PermissionUtilities.SetPermission(category, permission, permissionType))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I set permissions for loggedin user group in EditPermissionsPage")]
        public void WhenISetPermissionsForLoggedinUserGroupInEditPermissionsPage(Table table)
        {
            IEnumerable<GroupPermissionsData> dataList = table.CreateSet<GroupPermissionsData>();
            if (!BP_PermissionUtilities.SetPermissionsForLoggedinUserGroup((List<GroupPermissionsData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I set permissions for nonloggedin user group in EditPermissionsPage")]
        public void WhenISetPermissionsForNonloggedinUserGroupInEditPermissionsPage(Table table)
        {
            IEnumerable<GroupPermissionsData> dataList = table.CreateSet<GroupPermissionsData>();
            if (!BP_PermissionUtilities.SetPermissionsForNonLoggedinUserGroup((List<GroupPermissionsData>)dataList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in edit permissions page")]
        [Then(@"I click save button in edit permissions page")]
        public void WhenIClickSaveButtonInEditPermissionsPage()
        {
            if (!BP_PermissionUtilities.SavePermissions())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I click continue in modal dialog having title ""(.*)"" and message ""(.*)""")]
        [Then(@"verify modal dialog having title ""(.*)"" and partial message ""(.*)""")]
        [When(@"I click continue in modal dialog having title ""(.*)"" and partial message ""(.*)""")]
        public void WhenIClickContinueInModalDialogHavingTitleAndPartialMessage(string titleText, string messageText_Partial)
        {
            if (!BP_ModalWindow.ClickContinue(titleText, messageText_Partial))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I click continue in reset session modal having partial message ""(.*)""")]
        [When(@"I click continue in reset session modal having partial message ""(.*)""")]
        [When(@"I click contineu in reset session modal having partial message ""(.*)""")]
        public void WhenIClickContineuInResetSessionModalHavingPartialMessage(String messageText_Partial)
        {
            if (!BP_Modal_ResetSession.ClickContinue(messageText_Partial))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Associate Labs Page in View mode")]
        public void ThenISeeAssociateLabsPageInViewMode()
        {
            if (!BP_Site_AssociateLabsUtilities.IsAssociateLabsToSiteInViewMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Associate Sites Page in View mode")]
        public void ThenISeeAssociateSitesPageInViewMode()
        {
            if (!BP_Lab_AssociateSitesUtilities.IsAssociateSitesToLabInViewMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Associate Sites Page in Edit mode")]
        public void ThenISeeAssociateSitesPageInEditMode()
        {
            if (BP_Lab_AssociateSitesUtilities.IsAssociateSitesToLabInViewMode())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I do not see ActionPalette Item ""(.*)"" in ""(.*)"" ActionPalette")]
        public void ThenIDoNotSeeActionPaletteItemInActionPalette(String linkName, String actionPalette)
        {
            if (BP_ActionPaletteUtilities.IsActionPaletteLinkAvailable(linkName, actionPalette))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see ActionPalette Item ""(.*)"" in ""(.*)"" ActionPalette")]
        public void ThenISeeActionPaletteItemInActionPalette(String linkName, String actionPalette)
        {
            if (!BP_ActionPaletteUtilities.IsActionPaletteLinkAvailable(linkName, actionPalette))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Lab page in Edit mode")]
        public void ThenISeeLabPageInEditMode()
        {
            if (Control_PropertyUtilities.IsControlDisabled(DL_AddLabPage.SaveButton))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see Lab page in view mode")]
        public void ThenISeeLabPageInViewMode()
        {
            if (!Control_PropertyUtilities.IsControlDisabled(DL_AddLabPage.SaveButton))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see Lab page in view mode")]
        public void WhenIShouldSeeLabPageInViewMode()
        {
            if (!BP_PermissionUtilities.VerifyLabPageInViewMode())
            {
                Console.WriteLine("Page is not in View  mode");
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see Lab page in edit mode")]
        public void WhenIShouldSeeLabPageInEditMode()
        {
            if (!BP_PermissionUtilities.VerifyLabPageInEditMode())
            {
                Console.WriteLine("Page is not in View  mode");
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see Add Lab page in view mode")]
        public void ThenISeeAddLabPageInViewMode()
        {
            if (!BP_PermissionUtilities.VerifyAddLabPageInViewMode())
            {
                Console.WriteLine("Page is not in View  mode");
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Add Lab page in Edit mode")]
        public void ThenISeeAddLabPageInEditMode()
        {
            if (!BP_PermissionUtilities.VerifyAddLabPageInEditMode())
            {
                Console.WriteLine("Page is not in Edit  mode");
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }




        [Then(@"I do not see link ""(.*)"" In Add Lab Page")]
        [Then(@"I do not see link ""(.*)"" In Lab Page")]
        [Then(@"I do not see link ""(.*)"" In Manage Laboratories Page")]
        [Then(@"I do not see link ""(.*)"" In Lab Management Page")]
        [Then(@"I do not see link ""(.*)"" In StudyAdministrationPage")]
        public void ThenIDoNotSeeLinkInStudyAdministrationPage(String link)
        {
            if (BP_StudyAdministationUtilities.IsLinkAvailable(link))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see link ""(.*)"" In StudyAdministrationPage")]
        public void ThenISeeLinkInStudyAdministrationPage(String link)
        {
            if (!BP_StudyAdministationUtilities.IsLinkAvailable(link))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click main tab ""(.*)""")]
        public void WhenIClickMainTab(String mainTabName)
        {
            if (!Control_ActionUtilities.Click(DL_PrimaryTabs.GetPrimaryTab(mainTabName), String.Empty))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I check subjects in inbox folder ""(.*)""")]
        [When(@"I check subjects in inbox folder ""(.*)""")]
        public void WhenICheckSubjectsInInboxFolder(String inboxFolderName, Table table)
        {
            if (!BP_InboxUtilities.CheckInbox_Subject_FromTop(inboxFolderName, TableHelper.GetValuesFromColumn(table, 0)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I check subjects in inbox folder ""(.*)"" for Normalization")]
        public void ThenICheckSubjectsInInboxFolderForNormalization(String inboxFolderName, Table table)
        {
            if (!BP_InboxUtilities.CheckInbox_NormalizationSubject_FromTop(inboxFolderName, TableHelper.GetValuesFromColumn(table, 0)))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I clik logout of Datalabs")]
        public void WhenIClikLogoutOfDatalabs()
        {
            if (!BP_LogoutUtilities.Logout())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see login page")]
        public void ThenISeeLoginPage()
        {
            if (!BP_LoginUtilities.IsInLoginPage())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I change study status ""(.*)"" in Study Management page And Save")]
        public void WhenIChangeStudyStatusInStudyManagementPageAndSave(String status)
        {
            if (!BP_StudyManagementUtilities.ChangeStatusInStudyManagementPage(status))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I add and save lab id ""(.*)"" and lab name ""(.*)"" to associated labs in AssociateLabs page")]
        public void WhenIAddAndSaveLabIdAndLabNameToAssociatedLabsInAssociateLabsPage(String labId, String labName)
        {
            if (!BP_Site_AssociateLabsUtilities.AssociateLab(labId, labName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I dissociate all labs in AssociateLabsPage")]
        public void WhenIDissociateAllLabsInAssociateLabsPage()
        {
            if (!BP_Site_AssociateLabsUtilities.DissociateAllLabs())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I remove and save lab id ""(.*)"" and lab name ""(.*)"" from associated labs in AssociateLabs page")]
        public void WhenIRemoveAndSaveLabIdAndLabNameFromAssociatedLabsInAssociateLabsPage(String labId, String labName)
        {
            if (!BP_Site_AssociateLabsUtilities.DissociateLab(labId, labName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select sub tab ""(.*)"" in site page")]
        public void WhenISelectSubTabInSitePage(String subTabName)
        {
            if (!BP_SiteCreationUtilities.OpenSubTab(subTabName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see lab data in labs tab of Site in SitePage")]
        public void ThenISeeLabDataInLabsTabOfSiteInSitePage(Table table)
        {
            LabData data = table.CreateInstance<LabData>();
            if (!BP_SiteCreationUtilities.IsLabExistInLabsTableOfSite(table.CreateInstance<LabData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I shouldnot see lab data in labs tab of Site in SitePage")]
        public void ThenIShouldnotSeeLabDataInLabsTabOfSiteInSitePage(Table table)
        {
            LabData data = table.CreateInstance<LabData>();
            if (BP_SiteCreationUtilities.IsLabExistInLabsTableOfSite(table.CreateInstance<LabData>()))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click browse button in upload study file page")]
        [Given(@"I click browse button in upload study file page")]
        public void WhenIClickBrowseButtonInUploadStudyFilePage()
        {
            if (!BP_UploadStudyFileUtilities.ClickFileBrowseButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I upload study ""(.*)"" with Label ""(.*)""")]
        public void WhenIUploadStudyWithLabel(string studyName, string label)
        {
            if (!BP_UploadStudyFileUtilities.UploadStudy(studyName, label))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I upload study ""(.*)"" with Label ""(.*)"" on Browse field\.")]
        public void WhenIUploadStudyWithLabelOnBrowseField_(string studyName, string label)
        {
            if (!BP_UploadStudyFileUtilities.UploadStudyOnBrowseField(studyName, label))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I open study which has ""(.*)"" status")]
        public void WhenIOpenStudyWhichHasStatus(String studyStatus)
        {
            if (!BP_StudyVersionManagementUtilities.InvokeStudyRow(studyStatus))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see study label ""(.*)"" in header")]
        [Then(@"I see study label ""(.*)"" in header\.")]
        public void ThenISeeStudyLabelInHeader(String studyName)
        {
            if (!BP_Common_TopBar_Utilities.IsStudyNameExist(studyName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see study label ""(.*)"" with status ""(.*)""")]
        public void ThenISeeStudyLabelWithStatus(String studyLabel, String studyStatus)
        {
            if (!BP_StudyVersionManagementUtilities.VerifyStudyStatus(studyLabel, studyStatus))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Lab\(s\) associated successfully message\.")]
        public void ThenISeeLabSAssociatedSuccessfullyMessage_()
        {
            if (!BP_LabCreationUtilities.VerifyLabsAssociatedSuccessMsg())
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Lab(s) associated successfully message is not displayed. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter filter text ""(.*)"" in available labs filter textbox in AssociateLabsPage")]
        public void WhenIEnterFilterTextInAvailableLabsFilterTextboxInAssociateLabsPage(String searchText)
        {
            if (!BP_Site_AssociateLabsUtilities.SetSearchText_AvailableLabs(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see filtered labs in available labs listbox based on searchtext ""(.*)"" in AssociateLabsPage")]
        public void ThenISeeFilteredLabsInAvailableLabsListboxBasedOnSearchtextInAssociateLabsPage(String searchText)
        {
            if (!BP_Site_AssociateLabsUtilities.VerifySearchedItems_AvailableLabs(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter filter text ""(.*)"" in associated labs filter textbox in AssociateLabsPage")]
        public void WhenIEnterFilterTextInAssociatedLabsFilterTextboxInAssociateLabsPage(String searchText)
        {
            if (!BP_Site_AssociateLabsUtilities.SetSearchText_AssociatedLabs(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see filtered labs in associated labs listbox based on searchtext ""(.*)"" in AssociateLabsPage")]
        public void ThenISeeFilteredLabsInAssociatedLabsListboxBasedOnSearchtextInAssociateLabsPage(String searchText)
        {
            if (!BP_Site_AssociateLabsUtilities.SetSearchText_AssociatedLabs(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter filter text ""(.*)"" in available sites filter textbox in AssociateSitesPage")]
        public void WhenIEnterFilterTextInAvailableSitesFilterTextboxInAssociateSitesPage(String searchText)
        {
            if (!BP_Lab_AssociateSitesUtilities.SetSearchText_AvailableSites(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see filtered sites in available sites listbox based on searchtext ""(.*)"" in AssociateSitesPage")]
        public void ThenISeeFilteredSitesInAvailableSitesListboxBasedOnSearchtextInAssociateSitesPage(String searchText)
        {
            if (!BP_Lab_AssociateSitesUtilities.VerifySearchedItems_AvailableSites(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter filter text ""(.*)"" in associated sites filter textbox in AssociateSitesPage")]
        public void WhenIEnterFilterTextInAssociatedSitesFilterTextboxInAssociateSitesPage(String searchText)
        {
            if (!BP_Lab_AssociateSitesUtilities.SetSearchText_AssociatedSites(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see filtered sites in associated sites listbox based on searchtext ""(.*)"" in AssociateSitesPage")]
        public void ThenISeeFilteredSitesInAssociatedSitesListboxBasedOnSearchtextInAssociateSitesPage(String searchText)
        {
            if (!BP_Lab_AssociateSitesUtilities.VerifySearchedItems_AssociatedSites(searchText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}