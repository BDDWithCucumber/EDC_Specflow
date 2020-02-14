Feature: F10746_DL_Labs Demo
	

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@US68898.3 
Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

@US68898.3 
Scenario: 03_When I Upload and publish the study with Local Labs Enabled then I should see Local Labs in the header.
    When I click breadcrumb "Study Management"
    And I upload a study "Local_Labs_Enab.zip" with study label "Study1"
	Then I see main tab "Local Labs"

@US68898.3 @ US70483.1
Scenario: 04_When I Upload and publish the study with Local Labs Not Enabled then I should see Local Labs in the header.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Not_Enbled.zip" with Label "Study2"
    And I click continue in modal dialog having title "Confirm" and message "Uploaded study version has Local Labs as Not Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
    And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	And I check subjects in inbox folder "Jobs"
    | Subject                                      |
    | Publishing of Study file (Study2) - complete. |
	Then  I see main tab "Local Labs"

@US68898.3
Scenario: 05_When I Upload and publish the study with Local Labs Not Enabled then I should not see Local Labs in the header.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Not_Enabl_CL.zip" with Label "Study3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
    And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	And I check subjects in inbox folder "Jobs"
    | Subject                                      |
    | Publishing of Study file (Study3) - complete. |
	Then  I dont see main tab "Local Labs"

@US68898.3 @US70483.1
Scenario: 06_When I Upload and publish the study with Local Labs Enabled then I should see Local Labs in the header.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Local_Labs_Enab.zip" with Label "Study4"
    And I click continue in modal dialog having title "Confirm" and message "Uploaded study version has Local Labs as Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
    And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	And I check subjects in inbox folder "Jobs"
    | Subject                                      |
    | Publishing of Study file (Study4) - complete. |
	Then I see main tab "Local Labs"

@US68898.3 
Scenario: 07_When I delete a study then I should not see Local Labs in the header.
	When I delete study
	Then I dont see main tab "Local Labs"

Scenario: 08_Site and Lab Setup
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 05     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "05" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	Then I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In Lab Management Page
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| Lab01 | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	And I open lab with labid "Lab01" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I enter filter text "05" in associated sites filter textbox in AssociateSitesPage
	Then I add and save sites to assocaited sites in LabManagementSitesPage
	| Site		  |
	| 05 - Site   |
	
@US68898.3
Scenario: 09_When I select a LabName  on the Labs Tests page Then I should see TestLabel along with Test Description in the left pane.
  When I click breadcrumb "Study Administration"
  And I click Link "Study Management" In StudyAdministrationPage
  And I upload a study "Local_Labs_Enab.zip" with study label "Study1"
  And I navigate to "Local Labs" tab from main menu.
  And I open lab with labid "Lab01" from ManageReferenceRanges page
  And I open labtest with labname "BMI" from labtests page
  Then I see below ActionPalette Items in Left ActionPalette
	| ActionPaletteItems |
	| BMI(06)            |
	| M.R.I(03)          |
	| Sugar(02)          |
	| Weight(05)         |
	| X-Ray(04)          |
	         
Scenario: 10_When I give search criteria on reference range page Then I should see Test label along with test description 
  When I enter search text "Sugar" in Lab Test (Name) search box in ReferenceRangesPage
  Then I see below ActionPalette Items in Left ActionPalette
  	| ActionPaletteItems |
	| Sugar(02)          |

Scenario: 11_When I give search criteria on reference range page Then I should see Test label along with test description 
  When I enter search text "ABC" in Lab Test (Name) search box in ReferenceRangesPage
  Then I do not see any ActionPalette Items in Left ActionPalette
  	| ActionPaletteItems |
	
	     
@US68912.1
Scenario: 12_When I click on the Add button on  Lab Test (Name) Then the cancel button icon should be shown as red multiplication sign
    When I click on Add button to create a new lab test range record
   	Then I should that the cancel button has cross icon in red color.

Scenario: 13_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page 