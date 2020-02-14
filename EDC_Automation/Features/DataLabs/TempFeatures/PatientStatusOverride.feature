Feature: PatientStatusOverride

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
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

Scenario: 07_Enroll "01-Pat" patient.
	Given I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 02       | 06/27/2018 | Yes           |
	Then I see patient "02-Pat" status as "Enrolled" on Patient details page.

Scenario: 08_Patient status override to screened
	Given I select the patient "02-PAT" from patients table.
	And I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
	And I select change to "Screened" in PatientStatusOverridePage
	And I enter reason "Status override from Enroll to Screened" for patient status change in PatientStatusOverridePage
	And I Click save button in PatientStatusOverridePage
	Then I see success message " Status Override Changed Successfully."
	And I dont see ActionPaletteItem "PatientStatusOverride" in ActionPalette "PatientPortalActions"
	And I see patient "01-PAT" status as "Screened" on Patient details page.