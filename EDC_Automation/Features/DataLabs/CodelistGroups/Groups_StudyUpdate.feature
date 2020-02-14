Feature: Groups_StudyUpdate

@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete A study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_Codelist groups Minor and major study Upadate Base study V1.Zip" with study label "L1"
	Then I see study label "Test3210" in header

Scenario: 04_Add Sites
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: 06_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 08/02/2018 |
	| 02       | PAT             | 08/02/2018 |
	| 03       | PAT             | 08/02/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |
	| 02-PAT    |
	| 03-PAT    |

Scenario: 07_Select and enroll a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 08/02/2018 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 08_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

############### Minor study Update ##################

Scenario: 09_Upload and Stage a Study which has Minor study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Codelist Groups Minor study Update V2.zip" with Label "MinorUpdate"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage
	
Scenario: 10_Publish study which has minor study changes
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                            |
         | Publishing of Study file (MinorUpdate) - complete. |
	
Scenario: 11_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: 12_Flat Questions_Verify Listbox items of and un-submitted CRF with checking out.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Check out" button on "DT1 Form" CRF.
	Then I Verify below "ListBox" items are displayed in "Update Group Desc for Minor:" on the CRF.
	| ItemToVerify		|
	| [Blank]			|
	| Asia				|
	| Africa			|
	| USA				|
	And I click on "Cancel" button on "DT1 Form" CRF.
	
Scenario: 13_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page

############# Majorstudy update #################
	
Scenario: 16_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 17_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 18_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_CL_Major study update V3.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 3 out of 3 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.                                                                                       |
	
Scenario: 19_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: 20_Flat Questions_Verify Listbox items of and un-submitted CRF with checking out.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	Then I Verify below "ListBox" items are displayed in "Continents:" on the CRF.
	| ItemToVerify		|
	| [Blank]			|
	| Asia				|
	| AfricaContinent	|
	| USA				|
	And I verify below "ListBox" items are displayed in "Countries:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| India        |
	| Srilanka     |
	| Southafrica  |
	| Kenya		   |			
	And I verify below "ListBox" items are displayed in "States:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| AP           |
	| Telangana    |
	| Galle        |
	| Kandy        |
	| Durban       |
	| Capetown     |
	| Barbadose    |
	| NewYork      |		
	And I verify below "ListBox" items are displayed in "Colors:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Red          |
	| Green        |
	| Blue         |
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario: 21_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page
	 
