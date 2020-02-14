Feature: Groups_EditChecks

@ObjectiveEvidence	
Scenario: 01_Login to DataLabs Application
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study.
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_CLGEC.zip" with study label "GroupsEditChecks"
	Then I see study label "Test4500" in header.

Scenario: 04_Add Site.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             |            |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: 05_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials	 | ScreenDate |
	| 01       | Patient             | 12/06/2017 |
	| 02       | Patient	         | 12/06/2017 |
	| 03       | Patient		     | 12/06/2017 |
	| 04       | Patient		     | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID		|
	| 01-Patient    |
	| 02-Patient    |
	| 03-Patient    |
	| 04-Patient    |

Scenario: 06_Select and enroll patient "01-Patient".
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-Patient" from patients table.
	When I enroll the patient "01-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 12/06/2017 | Yes           |
	Then I see patient "01-Patient" status as "Enrolled" on Patient details page.

Scenario: 07_Select and enroll patient "02-Patient".
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "02-Patient" from patients table.
	When I enroll the patient "02-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 02       | 12/06/2017 | Yes           |
	Then I see patient "02-Patient" status as "Enrolled" on Patient details page.

Scenario: 08_0_Select and enroll patient "03-Patient".
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "03-Patient" from patients table.
	When I enroll the patient "03-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 03       | 12/06/2017 | Yes           |
	Then I see patient "03-Patient" status as "Enrolled" on Patient details page.

Scenario: 08_1_Select and enroll patient "03-Patient".
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "04-Patient" from patients table.
	When I enroll the patient "04-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 04       | 12/06/2017 | Yes           |
	Then I see patient "04-Patient" status as "Enrolled" on Patient details page.

	@ObjectiveEvidence
Scenario: 09_Verify enforce edit check for flat question with EntryComplete
	Given I navigate to "Patients" tab from main menu.
	And I select the patient "01-Patient" from patients table.
	When I expand "Visit (Week 2)" to select and open "Form_GEC" CRF.
	And I select "Checkout" button on "Form_GEC" CRF.
	And I select entry complete checkbox.
	And I select "Save" button on "Form_GEC" CRF.
	Then I verify queries under queries type "Please Resolve Enforced Queries" in Modal "Queries Result"
    | Queries                      |
    | Tests_Urinalysis is missing. |
	And I click back to CRF button of Modal "Queries Result"

Scenario: 10_Verify required edit check for flat question with EntryComplete
	When I enter below flat questions data in the CRF.
	| QuestionPrompt   | AnswerValue | AnswerFieldType |
	| Tests_Urinalysis | pH          | Checkbox        |
	And I select "Save" button on "Form_GEC" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                      |
    | Tests_Hematalogy is missing. |
	And I click back to CRF button of Modal "Queries Result"

Scenario: 11_Verify MNA edit check for flat question with EntryComplete
	When I enter below flat questions data in the CRF.
	| QuestionPrompt   | AnswerValue           | AnswerFieldType |
	| Tests_Hematalogy | RBC (Red Blood Cells) | ListBox         |
	And I click icon "icon_mna_disabled.png" for the flat question "Colors_SecondaryColors" in CRF
    And I enter comments "MNA1" in MarkItemDialog
    And I click ok button in MarkItemDialog
	And I select "Save & Close" button on "Form_GEC" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                                 |
    | Colors_SecondaryColors cannot be marked "Not Answered". |
	And I click Continue button of Modal "Queries Result"
	And The CRF with data is saved and checked-in successfully.

Scenario: 12_Verify enforce edit check for non-autobuild table question with EntryComplete
	Given I expand "Visit (Week 2)" to select and open "Form_GEC" CRF.
	When I select "Checkout" button on "Form_GEC" CRF.
	And I select entry complete checkbox.
	And I enter below "CGEC_NonAutobuilTable:" table questions data in the CRF.
    | AddNewRow | RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
    | Yes       | 1         | Tests_Chemistry      | Cortisol    | ListBox         |                  |
    | No        | 1         | Colors_PrimaryColors | Red         | Checkbox         | Save & Close Row |
	Then I verify queries under queries type "Please Resolve Enforced Queries" in Modal "Queries Result"
    | Queries                               |
    | Row # 1: Tests_Urinalysis is missing. |
	And I click back to CRF button of Modal "Queries Result"
	And I click table row button "Cancel Row" of table "CGEC_NonAutobuilTable:"

Scenario: 13_Verify requried edit check for non-autobuild table question with EntryComplete
	When I enter below "CGEC_NonAutobuilTable:" table questions data in the CRF.
    | AddNewRow | RowNumber | QuestionPrompt       | AnswerValue  | AnswerFieldType | RowButtonToClick |
    | Yes       | 1         | Tests_Chemistry      | Cortisol     | ListBox         |                  |
    | No        | 1         | Tests_Urinalysis     | Urobilinogen | Checkbox        |                  |
    | No        | 1         | Colors_PrimaryColors | Red          | Checkbox         | Save & Close Row |
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                               |
    | Row # 1: Tests_Hematalogy is missing. |
	And I click back to CRF button of Modal "Queries Result"
	And I click table row button "Cancel Row" of table "CGEC_NonAutobuilTable:"

Scenario: 14_Verify MNA edit check for non-autobuild table question with EntryComplete
	When I enter below "CGEC_NonAutobuilTable:" table questions data in the CRF.
    | AddNewRow | RowNumber | QuestionPrompt       | AnswerValue           | AnswerFieldType | RowButtonToClick |
    | Yes       | 1         | Tests_Chemistry      | Cortisol              | ListBox         |                  |
    | No        | 1         | Tests_Hematalogy     | PC (Platelette Count) | ListBox         |                  |
    | No        | 1         | Tests_Urinalysis     | Urobilinogen          | Checkbox        |                  |
    | No        | 1         | Colors_PrimaryColors | Red                   | Checkbox        |                  |
	And I click "icon_mna_disabled.png" icon of a question "Colors_SecondaryColors" of table "CGEC_NonAutobuilTable:"
	And I enter comments "Commetns for MarkItemNotAnswered" in MarkItemDialog
    And I click ok button in MarkItemDialog
	And I click table row button "Save & Close Row" of table "CGEC_NonAutobuilTable:"
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                                          |
    | Row # 1: Colors_SecondaryColors cannot be marked "Not Answered". |
	And I click Continue button of Modal "Queries Result"

Scenario: 15_Save form with MNA query
	When I select "Save & Close" button on "Form_GEC" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 16_Verify enforce edit check for autobuild table question with EntryComplete
	When I expand "Visit (Week 3)" to select and open "Form_GEC1" CRF.
	And I select "Checkout" button on "Form_GEC1" CRF.
	And I select entry complete checkbox.
	And I expand row "1" of table "CGEC_AutobuilTable:"
	And I click table row button "Save & Close Row" of table "CGEC_AutobuilTable:"
	Then I verify queries under queries type "Please Resolve Enforced Queries" in Modal "Queries Result"
    | Queries                         |
    | Row # 1: Urinalysis is missing. |
	And I click back to CRF button of Modal "Queries Result"
	And I click table row button "Cancel Row" of table "CGEC_AutobuilTable:"

Scenario: 17_Verify required edit check for autobuild table question with EntryComplete
	When I enter below "CGEC_AutobuilTable:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Urinalysis     | Bilirubin   | ListBox         | Save & Close Row |
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                         |
    | Row # 1: Hematalogy is missing. |
	And I click back to CRF button of Modal "Queries Result"
	And I click table row button "Cancel Row" of table "CGEC_AutobuilTable:"

Scenario: 18_Verify MNA edit check for autobuild table question with EntryComplete
	When I enter below "CGEC_AutobuilTable:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Urinalysis     | Bilirubin   | ListBox         |                  |
	| No        | 1         | Hematalogy     | Hemoglobin  | RadioButton     |                  |
	And I click "icon_mna_disabled.png" icon of a question "SecondaryColors" of table "CGEC_AutobuilTable:"
	And I enter comments "Commetns for MarkItemNotAnswered" in MarkItemDialog
    And I click ok button in MarkItemDialog
	And I click table row button "Save & Close Row" of table "CGEC_AutobuilTable:"
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                                   |
    | Row # 1: SecondaryColors cannot be marked "Not Answered". |
	And I click Continue button of Modal "Queries Result"

Scenario: 19_Remove entry complete and save form "Form_GEC1" 
	When I deselect entry complete checkbox
	And I select "Save & Close" button on "Form_GEC1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 20_Verify L3 queries
	Given I select "Patients" tab from the main menu of DataLabs.
	When I select "02-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "Form_GEC" CRF.
	And I click "Checkout" button on "Form_GEC" CRF.
	And I enter below data for Flat questions in CRF.
    | QuestionPrompt   | AnswerValue | AnswerFieldType |
    | SampleText       | Cortisol    | Textbox         |
    | Tests_Chemistry  | Cortisol    | ListBox         |
	And I click "Save & Close" button on "Form_GEC" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                                |
    | Chemistry question value is same as SampleTextQuestion |
	And I click Continue button of Modal "Queries Result"

Scenario: 21_Check L3 query in DCF tab
	Given I expand "Visit (Week 2)" to select and open "Form_GEC" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
	| DCFID | Status | QueryDescription                                       | DateTime |
	|       | Sent   | Chemistry question value is same as SampleTextQuestion |          |

Scenario: 22_Supply Param1 for L4 query
	Given I click breadcrumb "All Patients".
	And I select the patient "03-Patient" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form_GEC" CRF.
	When I select "Checkout" button on "Form_GEC" CRF.
	And I enter below data for Flat questions in CRF.
    | QuestionPrompt  | AnswerValue | AnswerFieldType |
    | Tests_Chemistry | Cortisol    | ListBox         |
	And I select "Save & Close" button on "Form_GEC" CRF.
	
Scenario: 23_Supply Param2 for L4 query
	Given I expand "Visit (Week 2)" to select and open "Form_GEC2" CRF.
	When I select "checkout" button on "Form_GEC2" CRF.
	And I enter below "CGEC_NonAutobuilTable:" table questions data in the CRF.
    | AddNewRow | RowNumber | QuestionPrompt  | AnswerValue | AnswerFieldType | RowButtonToClick |
    | Yes       | 1         | Tests_Chemistry | Cortisol    | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "Form_GEC2" CRF.

Scenario: 24_Verify L4 query DCF in form "Form_GEC"
	Given I expand "Visit (Week 2)" to select and open "Form_GEC" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
	| DCFID | Status | QueryDescription                                                             | DateTime |
	|       | Sent   | Form_GEC Tests_Chemistry value is same as Row 1 of Form_GEC2 Chemistry value |          |

Scenario: 25_Verify L4 query DCF in form "Form_GEC2"
	Given I click breadcrumb "03-Patient".
	And I expand "Visit (Week 2)" to select and open "Form_GEC2" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form 
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                                             | DateTime |
    |       | Sent   | Form_GEC Tests_Chemistry value is same as Row 1 of Form_GEC2 Chemistry value |          |

Scenario: 26_Supply Param1 for L5 query
	Given I select "Patients" tab from the main menu of DataLabs.
	When I select "04-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "Form_GEC" CRF.
	And I click "Check out" button on "Form_GEC" CRF.
	And I enter below data for Flat questions in CRF.
    | QuestionPrompt       | AnswerValue | AnswerFieldType |
    | Units_MeasuringUnits | MilliGrams  | ListBox         |
	And I click on "Save & Close" button on "Form_GEC" CRF.
	Then The CRF is saved and checked-in successfully.

Scenario: 27_Supply Param1 for L5 query
	When I expand "Visit (Week 3)" to select and open "Form_GEC1" CRF.
	And I click "Check out" button on "Form_GEC1" CRF.
	And I enter below "CGEC_AutobuilTable:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | MeasuringUnits | MilliGrams  | RadioButton     | Save & Close Row |
	And I click on "Save & Close" button on "Form_GEC1" CRF.
	Then The CRF is saved and checked-in successfully.

Scenario: 28_Verify L5 query DCF in DCF tab of form "Form_GEC"
	Given I expand "Visit (Week 2)" to select and open "Form_GEC" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
	| DCFID | Status | QueryDescription                                                                                                             | DateTime |
	|       | Sent   | Form_GEC of Visit (Week 02) Tests_MeasuringUnits Value is same as Row 1 MeasuringUnits Value of Form_GEC1 in Visit (Week 03) |          |
	
Scenario: 29_Verify L5 query DCF in DCF tab of form "Form_GEC1"
	Given I click breadcrumb "04-Patient".
	And I expand "Visit (Week 3)" to select and open "Form_GEC1" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form 
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                                                                                             | DateTime |
    |       | Sent   | Form_GEC of Visit (Week 02) Tests_MeasuringUnits Value is same as Row 1 MeasuringUnits Value of Form_GEC1 in Visit (Week 03) |          |
	
Scenario: 99_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page

