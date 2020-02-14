Feature: SafetyTemp
	Safety Scenarios

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish a study
	When I click breadcrumb "Study Management"
	And  I upload a study "Breaze_Complete.zip" with study label "Breaze Study"
	Then I see study label "Breaze 8392" in header

Scenario: T04_Add Sites
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	Then I see site "01-Site" in SiteManagementPage
	
Scenario: T05_Assign testadmin testadmin user to site 01
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"
	
Scenario: T06_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add below patient without initials.
	| PatientID | Date        |
	| 01        | 16-sep-2019 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01        |

Scenario: T07_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01" from patients table.
	Then I see Patient details page for "01".
	
Scenario: T08_Select a Form with with both flat and table questions and enter data in CRF.
	Given I expand "Common" to select and open "Adverse Events" CRF.
	When I click "Checkout" button on "Adverse Events" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                    | AnswerValue | AnswerFieldType |
	| Were there any adverse events?                    | Yes         | Radio           |
	| Did any unusual and/or unexpected symptoms occur? | No          | LISTBOX         |
	And I enter below "Please specify Adverse Event:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                        | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Adverse Event Type:                                   | Adverse Event | LISTBOX         |                  |
	| No        | 1         | Adverse Event:                                        | Heartattack   | TextBox         |                  |
	| No        | 1         | Adverse Event Coding:                                 | 999           | TextBox         |                  |
	| No        | 1         | Serious (If Yes, select all that apply 3.X.5-3.X.10): | Yes           | Radio           |                  |
	| No        | 1         | - Results in Death:                                   | [Blank]       | Radio           | Save & Close Row |
	And I click Continue button of Modal "Queries Result"
	And I click on "Save & Close" button on "Adverse Events" CRF.
	Then The CRF with data is saved and checked-in successfully.

	Scenario: T09_Navigate to safety tab and verify the safety screen.
	Given I navigate to "Safety" tab from main menu.
	Then I see Safety details screen
	#to remove

