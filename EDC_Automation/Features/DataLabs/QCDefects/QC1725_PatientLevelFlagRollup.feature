Feature: DataLabs_V5.7.2_QC1725_Patient level Flag rollup
 
Test Summary:
		1. Verification of Patient level Flag rollup when all the required items and Forms are flagged.



Scenario: T01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page   
@ignore
Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header
@ignore
Scenario: T03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "AZ234674.zip" with study label "QC1725"
	Then I see study label "LUCY" in header
@ignore
Scenario: T04_Add Site.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             |            |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "Narendra, Konduparthy" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"
@ignore
Scenario: T05_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | Patient         | 12/06/2017 |
	| 02       | Patient         | 13/07/2017 |
	| 03       | Patient         | 14/08/2017 |
	| 04       | Patient         | 15/09/2017 |
	| 05       | Patient         | 16/10/2017 |
	| 06       | Patient         | 17/11/2017 | 
	
	Then I see below patients added in the Patients table.
	| PatientID  |
	| 01-Patient |
	| 02-Patient |
	| 03-Patient |
	| 04-Patient |
	| 05-Patient |
	| 06-Patient |
@ignore
Scenario: T06_Enroll all Patients .
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "Patients" from patients table.
	When I enroll the patient "Patients" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 12/06/2017 | Yes           |
	| 02       | 13/07/2017 | Yes           |
	| 03       | 14/08/2017 | Yes           |
	| 04       | 15/09/2017 | Yes           |
	| 05       | 16/10/2017 | Yes           |
	| 06       | 17/11/2017 | Yes           | 

	Then I see patient "Patients" status as "Enrolled" on Patient details page.
@ignore
Scenario: T07_Create Flag Plans and DataGroups from Flag Management
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Flag Management" In StudyAdministrationPage
	And I select "SD-Verify" flag type from Flag Management page.
	And I select the "Assign Plan to Patient" link on the Manage Plans & Flag Data Groups page.
	And I select checkbox for the below Sites.
         | SiteID | CheckONOrOff |
         | 01     | ON           |
   	And I click "Get Patients" button on Assign Plan to Patient page.
	And I select checkbox for the below patients.
         | PatientID  | CheckONOrOff |
         | 01-Patient | ON           |
   	And I click "Next" button on Assign Plan to Patient page.
	And I select "All (100%)" in the Select Plan dropdown.
	And I select "New information" in Reason for change dropdown.
	And I enter text "New SDV Flag" in Additional Notes text box.
	And I click "Save" button on Assign Plan to Patient page.
	Then I should see the notification "Plan assigned to patient(s) job successfully created"
@ignore
Scenario: T08_Create Flag Plans and Datagroups from Flag Management
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Flag Management" In StudyAdministrationPage
	And I select "SD-Verify" flag type from Flag Management page.
	And I click Add Plan button to create a new plan.
	And I enter Plan Name as "SDVCustomPlan1" and label as "SDVCustomPlan1" on Create Plan page.
	And I enter Data Group Name as "SDVDG1" and Data Group label as "SDVDG1" on Create Flag Data Group page.
	And I select checkbox for form questions in protocol version.
         | FormName                                       | QuestionNum | QuestionPrompt | ProtocolVersion |
         | Date of Visit                                  | All         | All            | 1.0             |
         | Informed Consent                               | All         | All            | 1.0             |
         | Demographics                                   | All         | All            | 1.0             |
         | Inclusion//Exclusion Criteria Not Met          | All         | All            | 1.0             |
         | Adverse Events & Serious Adevers Events Report | All         | All            | 1.0             |
         | Exposure                                       | All         | All            | 1.0             |
         | Radiotherapy                                   | All         | All            | 1.0             |
         | Blood transfusions - history and during study  | All         | All            | 1.0             |
         | Overdose Report                                | All         | All            | 1.0             |
         | Discontinuation of Investigational Product     | All         | All            | 1.0             |
         | Discontinuation of study                       | All         | All            | 1.0             |
         | Statement of Death                             | All         | All            | 1.0             |
         | Post study drug discontinuation Cancer Therapy | All         | All            | 1.0             |

	And I click "Next" button on Create Flag Data Group page.
	And I click "Save & Close" button on Create Flag Data Group page.
	Then I verify the success message displayed as "Plan saved successfully"

Scenario: T09_Mark some of the Required Forms for SD-Verify flag
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	Then I see flag "SD-Verify" icon "flag_no.gif" for patient "01-Patient"















