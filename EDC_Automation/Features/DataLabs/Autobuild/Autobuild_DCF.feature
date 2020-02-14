Feature: Autobuild_DCF
	
@ObjectiveEvidence
Scenario: 001_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: 002_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 003_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "AutobuildEnhancementStudies\Test4500_GREAT_FormStatus_Base.zip" with study label "TestBase"
	Then I see study label "Test4500_GREAT_FORMSTATUS" in header

Scenario: 004_Add Site 01-Site and assign it to testadmin user
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: 005_Add patient 001-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 001      | Patient         | 11/05/2019 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 001-Patient |

Scenario: 006_Select and enroll patient "01-Patient".
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "001-Patient" from patients table.
	When I enroll the patient "001-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 001      | 12/06/2017 | Yes           |
	Then I see patient "001-Patient" status as "Enrolled" on Patient details page.


Scenario: 007_Select the Patient 001-Patient, Open and save the form AB_WithOneKeySequenceColumn form under Visit(Screening)
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "001-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	And I select "Checkout" button on "AB_WithOneKeySequenceColumn" CRF.
	And I enter below "AutobuildFixed with key sequence 1:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |

