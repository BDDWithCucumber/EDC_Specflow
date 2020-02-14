Feature: Linkages_StudyUpdate
	This feature is to test minor and major study update scenarios for Codelist Linkages
	It covers CRF display, submit, change history and DCF after study update.

@ObjectiveEvidence
Scenario: 01_Login to Datalabs and ppublish the study.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: 02_Delete current study and upload the test study.
	Given I delete the current study.
	And I click breadcrumb "Study Management".
	When I upload a study "Test4500_CodelistLinkages_Base.Zip" with study label "CLink1"
	Then I see study label "CLink1" in header

Scenario: 03_Add a Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName |
	| 01     | Site     |
	Then I see site "01-Site" in SiteManagementPage

Scenario: 04_Assign testadmin testadmin user to site and check for default value for New Patients
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "Bandaru Surya" to site users in SiteManageUsersPage
	And I click ActionPalette Item "Manage Versions" in "SiteActions" ActionPalette
	Then I see site manage version detials in ManageVersionsPage
	| Version | New Patients | Default | Patients | Published Date/Time | Status    |
	| 1.0     | Allow        | true    | 0        | 02/27/2018          | Published |

Scenario: 05_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 27/02/2018 |
	| 02       | PAT             | 27/02/2018 |
	| 03       | PAT             | 27/02/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |
	| 02-PAT    |
	| 03-PAT    |

Scenario: 06_Select and enroll a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 27/02/2018 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 07_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: 08_Fill data in 'Form1 with linkages' CRF.
	Given I expand "Visit (Week 2)" to select and open "Form1 with linkages" CRF.
	When I click "Checkout" button on "Form1 with linkages" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | TextBox         |
	| Problem:           | Injuries    | Listbox         |
	| Body Part:         | Hands       | Listbox         |
	| Medicine category: | Lotion      | Listbox         |
	| Medicine:          | Lotion2     | Listbox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1 with linkages" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 09_Fill data in 'Form2 with linkages' CRF.
	Given I expand "Visit (Week 2)" to select and open "Form2 with linkages" CRF.
	When I click "Checkout" button on "Form2 with linkages" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Gender:        | Male        | Radio           |
	| Age:           | 35          | Textbox         |
	| Age Unit:      | Years       | Textbox         |
	And I enter below "Patient visiting doctor information:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt            | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Day Type:                 | WorkingDay  | Radio           |                  |
	| No        | 1         | Day:                      | Monday      | Listbox         |                  |
	| No        | 1         | Doctor attended:          | Doc1        | Textbox         |                  |
	| No        | 1         | Shift:                    | Noon        | Checkbox        |                  |
	| No        | 1         | Has the problem resolved? | Yes         | Listbox         | Save & Close Row |
	| Yes       | 2         | Day Type:                 | Holiday     | Radio           |                  |
	| No        | 2         | Day:                      | Saturday    | Listbox         |                  |
	| No        | 2         | Doctor attended:          | Doc2        | Textbox         |                  |
	| No        | 2         | Shift:                    | [Blank]     | Checkbox        |                  |
	| No        | 2         | Has the problem resolved? | No          | Listbox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form2 with linkages" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 10_Fill data in 'Form3 with linkages' CRF.
	Given I expand "Visit (Week 2)" to select and open "Form3 with linkages" CRF.
	When I click "Checkout" button on "Form3 with linkages" CRF.
	And I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 2         | Specialization:     | Orthopedist | ListBox         |                  |
	| No        | 2         | Available Days:     | Friday      | Checkbox        | Save & Close Row |
	| Yes       | 4         | Surgeon or Medical? | Medical     | Radio           |                  |
	| No        | 4         | Specialization:     | Radiologist | Listbox         |                  |
	| No        | 4         | Available Days:     | Tuesday     | Checkbox        | Save & Close Row |
	And I enter below "Consultation Week:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt   | AnswerValue                 | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Consulted on:    | Monday                      | ListBox         |                  |
	| No        | 1         | Tests undergone: | Methacholine Challenge Test | Listbox         | Save & Close Row |
	| No        | 3         | Tests undergone: | Lachman Test                | Listbox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form3 with linkages" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 11_Select and enroll a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "02-PAT" from patients table.
	When I enroll the patient "02-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 02       | 27/02/2018 | Yes           |
	Then I see patient "02-PAT" status as "Enrolled" on Patient details page.

Scenario: 12_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

Scenario: 13_Fill data in 'Form1 with Codelists' CRF.
	Given I expand "Visit (Week 4)" to select and open "Form1 with Codelists" CRF.
	When I click "Checkout" button on "Form1 with Codelists" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | TextBox         |
	| Problem:           | Injuries    | Listbox         |
	| Body Part:         | Mouth       | Listbox         |
	| Medicine category: | Drops       | Listbox         |
	| Medicine:          | Drops1      | Listbox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1 with Codelists" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 14_Fill data in 'Form2 with Codelists' CRF.
	Given I expand "Visit (Week 4)" to select and open "Form2 with Codelists" CRF.
	When I click "Checkout" button on "Form2 with Codelists" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Gender:        | Female      | Radio           |
	| Age:           | 48          | Textbox         |
	| Age Unit:      | Years       | Textbox         |
	And I enter below "Patient visiting doctor information:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt            | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Day Type:                 | WorkingDay  | Radio           |                  |
	| No        | 1         | Day:                      | Wednesday   | Listbox         |                  |
	| No        | 1         | Doctor attended:          | Doc2        | Textbox         |                  |
	| No        | 1         | Shift:                    | Evening     | Checkbox        |                  |
	| No        | 1         | Has the problem resolved? | No          | Listbox         | Save & Close Row |
	| Yes       | 2         | Day Type:                 | Holiday     | Radio           |                  |
	| No        | 2         | Day:                      | Saturday    | Listbox         |                  |
	| No        | 2         | Doctor attended:          | Doc2        | Textbox         |                  |
	| No        | 2         | Shift:                    | [Blank]     | Checkbox        |                  |
	| No        | 2         | Has the problem resolved? | No          | Listbox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form2 with Codelists" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 15_Fill data in 'Form3 with Codelists' CRF.
	Given I expand "Visit (Week 4)" to select and open "Form3 with Codelists" CRF.
	When I click "Checkout" button on "Form3 with Codelists" CRF.
	And I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 3         | Specialization:     | Radiologist | ListBox         |                  |
	| No        | 3         | Available Days:     | Monday      | Checkbox        | Save & Close Row |
	| Yes       | 4         | Surgeon or Medical? | Surgeon     | Radio           |                  |
	| No        | 4         | Specialization:     | Oncologist  | Listbox         |                  |
	| No        | 4         | Available Days:     | Friday      | Checkbox        | Save & Close Row |
	And I enter below "Consultation Week:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt   | AnswerValue                 | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Consulted on:    | Monday                      | ListBox         |                  |
	| No        | 1         | Tests undergone: | Methacholine Challenge Test | Listbox         | Save & Close Row |
	| No        | 3         | Tests undergone: | Lachman Test                | Listbox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form3 with Codelists" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 16_Select and enroll a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "03-PAT" from patients table.
	When I enroll the patient "03-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 03       | 27/02/2018 | Yes           |
	Then I see patient "03-PAT" status as "Enrolled" on Patient details page.

Scenario: 17_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	Then I see Patient details page for "03-PAT".

Scenario: 18_Fill data in 'Form1 with linkages and groups' CRF.
	Given I expand "Visit (Week 3)" to select and open "Form1 with linkages and groups" CRF.
	When I click "Checkout" button on "Form1 with linkages and groups" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | TextBox         |
	| Problem:           | Injuries    | Listbox         |
	| Body Part:         | Mouth       | Listbox         |
	| Medicine category: | Drops       | Listbox         |
	| Medicine:          | Drops1      | Listbox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1 with linkages and groups" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 19_Fill data in 'Form2 with linkages and groups' CRF.
	Given I expand "Visit (Week 3)" to select and open "Form2 with linkages and groups" CRF.
	When I click "Checkout" button on "Form2 with linkages and groups" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Gender:        | Female      | Radio           |
	| Age:           | 48          | Textbox         |
	| Age Unit:      | Years       | Textbox         |
	And I enter below "Patient visiting doctor information:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt            | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Day Type:                 | WorkingDay  | Radio           |                  |
	| No        | 1         | Day:                      | Wednesday   | Listbox         |                  |
	| No        | 1         | Doctor attended:          | Doc2        | Textbox         |                  |
	| No        | 1         | Shift:                    | Noon        | Checkbox        |                  |
	| No        | 1         | Has the problem resolved? | No          | Listbox         | Save & Close Row |
	| Yes       | 2         | Day Type:                 | Holiday     | Radio           |                  |
	| No        | 2         | Day:                      | Sunday      | Listbox         |                  |
	| No        | 2         | Doctor attended:          | Doc2        | Textbox         |                  |
	| No        | 2         | Shift:                    | [Blank]     | Checkbox        |                  |
	| No        | 2         | Has the problem resolved? | No          | Listbox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form2 with linkages and groups" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 20_Fill data in 'Form3 with linkages and groups' CRF.
	Given I expand "Visit (Week 3)" to select and open "Form3 with linkages and groups" CRF.
	When I click "Checkout" button on "Form3 with linkages and groups" CRF.
	And I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 3         | Specialization:     | Radiologist | ListBox         |                  |
	| No        | 3         | Available Days:     | Monday      | Checkbox        | Save & Close Row |
	| Yes       | 4         | Surgeon or Medical? | Surgeon     | Radio           |                  |
	| No        | 4         | Specialization:     | Oncologist  | Listbox         |                  |
	| No        | 4         | Available Days:     | Friday      | Checkbox        | Save & Close Row |
	And I enter below "Consultation Week:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt   | AnswerValue           | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Consulted on:    | Tuesday               | ListBox         |                  |
	| No        | 1         | Tests undergone: | Oxygen Titration Test | Listbox         | Save & Close Row |
	| No        | 3         | Tests undergone: | Lachman Test          | Listbox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form3 with linkages and groups" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 21_Navigate to StudyManagement page
	Given I select DataManagerPortal item "Study Administration" from drop down
	When I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 22_Upload and Stage a Study which has minor study changes
	Given I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	When I upload study "Test4500_CodelistLinkages_Minor_1.zip" with Label "Minor"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage

Scenario: 23_Publish Study which is in Staged status
	Given I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	Then I see PublishStudyFlagsPage

Scenario: 24_Enable or Disable of reevaluation of Falgs and Signatures
	Given I select "No" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "No" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "No" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "No" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	When I clicked Continue button in PublishStudyFlagsPage
	Then I see PublishStudyPage

Scenario: 25_Enable or Disable scripting execution at StudyPublish
	When I select scripting "Queries" in PublishStudyPage of MinorStudyUpdate
	#And I select scripting "pScripts" in PublishStudyPage of MinorStudyUpdate
	#And I select scripting "Derivations" in PublishStudyPage of MinorStudyUpdate
	And I click Publish button in PublishStudyPage of MinorStudyUpdate

Scenario: 26_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: 27_Verify Form1 with Linkages form data after minor study update.
	Given I expand "Visit (Week 2)" to select and open "Form1 with linkages" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | Text            |
	| Problem:           | Injuries    | Text            |
	| Body Part:         | Hands       | Text            |
	| Medicine category: | Lotion      | Text            |
	| Medicine:          | Lotion2     | Text            |
	And I click on "Cancel" button on "Form1 with linkages" CRF.

Scenario: 28_Verify Form2 with Linkages form data after minor study update.
	Given I expand "Visit (Week 2)" to select and open "Form2 with linkages" CRF.
	Then I verify below "Patient visiting doctor information:" table questions data in the CRF.
	| RowNumber | QuestionPrompt            | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Day Type:                 | WorkingDay  | Text            |                  |
	| 1         | Day:                      | Monday      | Text            |                  |
	| 1         | Doctor attended:          | Doc1        | Text            |                  |
	| 1         | Shift:                    | Noon        | Text            |                  |
	| 1         | Has the problem resolved? | Yes         | Text            | OK               |
	| 2         | Day Type:                 | Holiday     | Text            |                  |
	| 2         | Day:                      | Sunday      | Text            |                  |
	| 2         | Doctor attended:          | Doc2        | Text            |                  |
	| 2         | Shift:                    | [Blank]     | Text            |                  |
	| 2         | Has the problem resolved? | No          | Text            | OK               |
	And I click on "Cancel" button on "Form2 with linkages" CRF.

Scenario: 29_Verify Form3 with Linkages form data after minor study update.
	Given I expand "Visit (Week 2)" to select and open "Form3 with linkages" CRF.
	Then I verify below "Patient visiting doctor information:" table questions data in the CRF.
	| RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 2         | Specialization:     | Orthopedist | Text            |                  |
	| 2         | Available Days:     | Friday      | Text            | OK               |
	| 4         | Surgeon or Medical? | Medical     | Text            |                  |
	| 4         | Specialization:     | Radiologist | Text            |                  |
	| 4         | Available Days:     | Monday      | Text            | OK               |
	And I verify below "Consultation Week:" table questions data in the CRF.
	| RowNumber | QuestionPrompt   | AnswerValue                 | AnswerFieldType | RowButtonToClick |
	| 1         | Consulted on:    | Monday                      | Text            |                  |
	| 1         | Tests undergone: | Methacholine Challenge Test | Text            | OK               |
	| 3         | Tests undergone: | Lachman Test                | Text            | OK               |
	And I click on "Cancel" button on "Form3 with linkages" CRF.

Scenario: 30_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

Scenario: 31_Verify Form1 with Linkages form data after minor study update.
	Given I expand "Visit (Week 4)" to select and open "Form1 with Codelists" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | Text            |
	| Problem:           | Injuries    | Text            |
	| Body Part:         | Mouth       | Text            |
	| Medicine category: | Drops       | Text            |
	| Medicine:          | Drops1      | Text            |
	And I click on "Cancel" button on "Form1 with Codelists" CRF.

Scenario: 32_Verify Form2 with Linkages form data after minor study update.
	Given I expand "Visit (Week 4)" to select and open "Form2 with Codelists" CRF.
	Then I verify below "Patient visiting doctor information:" table questions data in the CRF.
	| RowNumber | QuestionPrompt            | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Day Type:                 | WorkingDay  | Text            |                  |
	| 1         | Day:                      | Wednesday   | Text            |                  |
	| 1         | Doctor attended:          | Doc2        | Text            |                  |
	| 1         | Shift:                    | Evening     | Text            |                  |
	| 1         | Has the problem resolved? | No          | Text            | OK               |
	| 2         | Day Type:                 | Holiday     | Text            |                  |
	| 2         | Day:                      | Saturday    | Text            |                  |
	| 2         | Doctor attended:          | Doc2        | Text            |                  |
	| 2         | Shift:                    | [Blank]     | Text            |                  |
	| 2         | Has the problem resolved? | No          | Text            | OK               |
	And I click on "Cancel" button on "Form2 with Codelists" CRF.

Scenario: 33_Verify Form3 with Linkages form data after minor study update.
	Given I expand "Visit (Week 4)" to select and open "Form3 with Codelists" CRF.
	Then I verify below "Patient visiting doctor information:" table questions data in the CRF.
	| RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 3         | Specialization:     | Radiologist | Text            |                  |
	| 3         | Available Days:     | Monday      | Text            | OK               |
	| 4         | Surgeon or Medical? | Surgeon     | Text            |                  |
	| 4         | Specialization:     | Oncologist  | Text            |                  |
	| 4         | Available Days:     | Friday      | Text            | OK               |
	And I verify below "Consultation Week:" table questions data in the CRF.
	| RowNumber | QuestionPrompt   | AnswerValue                 | AnswerFieldType | RowButtonToClick |
	| 1         | Consulted on:    | Monday                      | ListBox         |                  |
	| 1         | Tests undergone: | Methacholine Challenge Test | Listbox         | OK               |
	| 3         | Tests undergone: | Lachman Test                | Listbox         | OK               |
	And I click on "Cancel" button on "Form3 with Codelists" CRF.

Scenario: 34_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	Then I see Patient details page for "03-PAT".

Scenario: 35_Verify Form1 with linkages and groups form data after minor study update.
	Given I expand "Visit (Week 3)" to select and open "Form1 with linkages and groups" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | Text            |
	| Problem:           | Injuries    | Text            |
	| Body Part:         | Mouth       | Text            |
	| Medicine category: | Drops       | Text            |
	| Medicine:          | Drops1      | Text            |
	And I click on "Cancel" button on "Form1 with linkages and groups" CRF.

Scenario: 36_Verify Form2 with linkages and groups form data after minor study update.
	Given I expand "Visit (Week 3)" to select and open "Form2 with linkages and groups" CRF.
	Then I verify below "Patient visiting doctor information:" table questions data in the CRF.
	| RowNumber | QuestionPrompt            | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Day Type:                 | WorkingDay  | Text            |                  |
	| 1         | Day:                      | Wednesday   | Text            |                  |
	| 1         | Doctor attended:          | Doc2        | Text            |                  |
	| 1         | Shift:                    | Evening     | Text            |                  |
	| 1         | Has the problem resolved? | No          | Text            | OK               |
	| 2         | Day Type:                 | Holiday     | Text            |                  |
	| 2         | Day:                      | Saturday    | Text            |                  |
	| 2         | Doctor attended:          | Doc2        | Text            |                  |
	| 2         | Shift:                    | [Blank]     | Text            |                  |
	| 2         | Has the problem resolved? | No          | Text            | OK               |
	And I click on "Cancel" button on "Form2 with linkages and groups" CRF.

Scenario: 37_Verify Form3 with linkages and groups form data after minor study update.
	Given I expand "Visit (Week 3)" to select and open "Form3 with linkages and groups" CRF.
	Then I verify below "Patient visiting doctor information:" table questions data in the CRF.
	| RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 3         | Specialization:     | Radiologist | Text            |                  |
	| 3         | Available Days:     | Monday      | Text            | OK               |
	| 4         | Surgeon or Medical? | Surgeon     | Text            |                  |
	| 4         | Specialization:     | Oncologist  | Text            |                  |
	| 4         | Available Days:     | Friday      | Text            | OK               |
	And I verify below "Consultation Week:" table questions data in the CRF.
	| RowNumber | QuestionPrompt   | AnswerValue                 | AnswerFieldType | RowButtonToClick |
	| 1         | Consulted on:    | Monday                      | Text            |                  |
	| 1         | Tests undergone: | Methacholine Challenge Test | Text            | OK               |
	| 3         | Tests undergone: | Lachman Test                | Text            | OK               |
	And I click on "Cancel" button on "Form3 with linkages and groups" CRF.

Scenario: 38_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 04       | PAT             | 27/02/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 04-PAT    |

Scenario: 39_Select and enroll a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "04-PAT" from patients table.
	When I enroll the patient "04-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 04       | 27/02/2018 | Yes           |
	Then I see patient "04-PAT" status as "Enrolled" on Patient details page.

Scenario: 40_Checkout Form1 with linkages CRF from Visit (Week 2)
	Given I expand "Visit (Week 2)" to select and open "Form1 with linkages" CRF.
	When I click "Checkout" button on "Form1 with linkages" CRF.
	Then I see "Save & Close" button on the CRF page.

Scenario Outline: 41_Fill data in 'Form1 with linkages' CRF and verify the list items.
	When I enter "AnswerValue" for flat "AnswerFieldType" question "QuestionPrompt" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Lotion       |
	And I Verify below "ListBox" items are not displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Drops        |
	Examples: 
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Body Part:     | Hair        | Listbox         |
	| Body Part:     | Hands       | Listbox         |
	| Body Part:     | Throat      | Listbox         |

Scenario: 42_Fill data in 'Form1 with linkages' CRF and verify the list items.
	When I enter "Lotion" for flat "ListBox" question "Medicine category:" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| Lotion1      |
	| Lotion2      |
	| Lotion3      |
	And I Verify below "ListBox" items are not displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| Drops1       |
	| Drops2       |

Scenario Outline: 43_Fill data in 'Form1 with linkages' CRF and verify the list items.
	When I enter "AnswerValue" for flat "AnswerFieldType" question "QuestionPrompt" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Drops        |
	And I Verify below "ListBox" items are not displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Lotion       |
	Examples: 
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Body Part:     | Eyes        | Listbox         |
	| Body Part:     | Nose        | Listbox         |
	| Body Part:     | Mouth       | Listbox         |
	| Body Part:     | Ears        | Listbox         |

Scenario: 44_Fill data in 'Form1 with linkages' CRF and verify the list items.
	When I enter "Lotion" for flat "ListBox" question "Medicine category:" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| Drops1       |
	| Drops2       |
	And I Verify below "ListBox" items are not displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| Lotion1      |
	| Lotion2      |
	| Lotion3      |
	And I click on "Cancel" button on "Form1 with linkages" CRF.

Scenario: 45_Fill data in 'Form1 with linkages' CRF.
	Given I expand "Visit (Week 2)" to select and open "Form1 with linkages" CRF.
	When I click "Checkout" button on "Form1 with linkages" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | TextBox         |
	| Problem:           | Injuries    | Listbox         |
	| Body Part:         | Hands       | Listbox         |
	| Medicine category: | Lotion      | Listbox         |
	| Medicine:          | Lotion2     | Listbox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1 with linkages" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 46_Fill data in 'Form3 with linkages' CRF and verify the list items.
	Given I expand "Visit (Week 2)" to select and open "Form3 with linkages" CRF.
	When I click "Checkout" button on "Form3 with linkages" CRF.
	And I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 4         | Surgeon or Medical? | Medical     | Radio           |                  |
	Then I verify below "ListBox" items are displayed for "Specialization:" question in row "4" of "Consultation:" table.
	| ItemToVerify  |
	| Pulmonologist |
	| Orthopedist   |
	| Radiologist   |
	| Neurologist   |
	And I verify below "ListBox" items are not displayed for "Specialization:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Cardiologist |
	| Oncologist   |

Scenario: 47_Fill data in 'Form3 with linkages' CRF and verify the list items.
	When I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| No        | 4         | Specialization: | Pulmonologist | ListBox         |                  |
	Then I verify below "Checkbox" items are displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Monday       |
	| Thursday     |
	And I verify below "Checkbox" items are not displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Tuesday      |
	| Wednesday    |
	| Friday       |

Scenario: 48_Fill data in 'Form3 with linkages' CRF and verify the list items.
	When I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt  | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 4         | Specialization: | Orthopedist | ListBox         |                  |
	Then I verify below "Checkbox" items are displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Tuesday      |
	| Friday       |
	And I verify below "Checkbox" items are not displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Monday       |
	| Wednesday    |
	| Thursday     |

Scenario: 49_Fill data in 'Form3 with linkages' CRF and verify the list items.
	When I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt  | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 4         | Specialization: | Radiologist | ListBox         |                  |
	Then I verify below "Checkbox" items are displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Monday       |
	| Tuesday      |
	| Wednesday    |
	And I verify below "Checkbox" items are not displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Thursday     |
	| Friday       |

Scenario: 50_Fill data in 'Form3 with linkages' CRF and verify the list items.
	When I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt  | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 4         | Specialization: | Neurologist | ListBox         |                  |
	Then I verify below "Checkbox" items are displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Thursday     |
	And I verify below "Checkbox" items are not displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Monday       |
	| Tuesday      |
	| Wednesday    |
	| Friday       |

Scenario: 51_Fill data in 'Form3 with linkages' CRF and verify the list items.
	When I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 4         | Surgeon or Medical? | Surgeon     | Radio           |                  |
	Then I verify below "ListBox" items are displayed for "Specialization:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Cardiologist |
	| Orthopedist  |
	| Oncologist   |
	And I verify below "ListBox" items are not displayed for "Specialization:" question in row "4" of "Consultation:" table.
	| ItemToVerify  |
	| Pulmonologist |
	| Radiologist   |
	| Neurologist   |

Scenario: 52_Fill data in 'Form3 with linkages' CRF and verify the list items.
	When I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt  | AnswerValue  | AnswerFieldType | RowButtonToClick |
	| No        | 4         | Specialization: | Cardiologist | ListBox         |                  |
	Then I verify below "Checkbox" items are displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Monday       |
	| Wednesday    |
	| Friday       |
	Then I verify below "Checkbox" items are not displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Tuesday      |
	| Thursday     |

Scenario: 53_Fill data in 'Form3 with linkages' CRF and verify the list items.
	When I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt  | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 4         | Specialization: | Orthopedist | ListBox         |                  |
	Then I verify below "Checkbox" items are displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Monday       |
	| Wednesday    |
	| Thursday     |
	Then I verify below "Checkbox" items are not displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Tuesday      |
	| Friday       |

Scenario: 54_Fill data in 'Form3 with linkages' CRF and verify the list items.
	When I enter below "Consultation:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt  | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 4         | Specialization: | Orthopedist | ListBox         |                  |
	Then I verify below "Checkbox" items are displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Tuesday      |
	| Thursday     |
	| Friday       |
	Then I verify below "Checkbox" items are not displayed for "Available Days:" question in row "4" of "Consultation:" table.
	| ItemToVerify |
	| Monday       |
	| Wednesday    |

Scenario: 55_Checkout Form1 with linkages and groups CRF from Visit (Week 2)
	Given I expand "Visit (Week 3)" to select and open "Form1 with linkages and groups" CRF.
	When I click "Checkout" button on "Form1 with linkages and groups" CRF.
	Then I see "Save & Close" button on the CRF page.

Scenario Outline: 56_Fill data in 'Form1 with linkages and groups' CRF and verify the list items.
	When I enter "AnswerValue" for flat "AnswerFieldType" question "QuestionPrompt" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Lotion       |
	And I Verify below "ListBox" items are not displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Drops        |
	Examples: 
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Body Part:     | Hair        | Listbox         |
	| Body Part:     | Hands       | Listbox         |
	| Body Part:     | Throat      | Listbox         |

Scenario: 57_Fill data in 'Form1 with linkages and groups' CRF and verify the list items.
	When I enter "Lotion" for flat "ListBox" question "Medicine category:" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| Lotion1      |
	And I Verify below "ListBox" items are not displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| Drops1       |
	| Drops2       |
	| Lotion2      |
	| Lotion3      |

Scenario Outline: 58_Fill data in 'Form1 with linkages and groups' CRF and verify the list items.
	When I enter "AnswerValue" for flat "AnswerFieldType" question "QuestionPrompt" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Drops        |
	And I Verify below "ListBox" items are not displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Lotion       |
	Examples: 
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Body Part:     | Eyes        | Listbox         |
	| Body Part:     | Nose        | Listbox         |
	| Body Part:     | Mouth       | Listbox         |
	| Body Part:     | Ears        | Listbox         |

Scenario: 59_Fill data in 'Form1 with linkages and groups' CRF and verify the list items.
	When I enter "Lotion" for flat "ListBox" question "Medicine category:" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| Drops1       |
	And I Verify below "ListBox" items are not displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| Lotion1      |
	| Lotion2      |
	| Lotion3      |
	| Drops2       |
	And I click on "Cancel" button on "Form1 with linkages and groups" CRF.

Scenario: 60_Fill data in 'Form1 with linkages and groups' CRF.
	Given I expand "Visit (Week 3)" to select and open "Form1 with linkages and groups" CRF.
	When I click "Checkout" button on "Form1 with linkages and groups" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | TextBox         |
	| Problem:           | Injuries    | Listbox         |
	| Body Part:         | Hands       | Listbox         |
	| Medicine category: | Lotion      | Listbox         |
	| Medicine:          | Lotion1     | Listbox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1 with linkages and groups" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 61_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 62_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "TestStudy5100_MajorUpdate.zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: 63_Publish Study which is in Staged status
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	Then I see PublishStudyFlagsPage

Scenario: 64_Enable or Disable of reevaluation of Falgs and Signatures
	When I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	Then I see PublishStudyPage

Scenario: 65_Enable or Disable PatientMigration at StudyPublish
	#Given I select "{MenuTab}" tab from the main menu of DataLabs.
	When I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage

Scenario: 66_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario Outline: 67_Verification of linked primary codelist items doesn't display secodary codelist item which is added newly.
	Given I expand "Visit (Week 2)" to select and open "Form1 with linkages" CRF.
	When I enter "AnswerValue" for flat "AnswerFieldType" question "QuestionPrompt" in the CRF.
	Then I Verify below "ListBox" items are not displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| Tablet       |
	Examples: 
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Body Part:     | Hair        | Listbox         |
	| Body Part:     | Hands       | Listbox         |
	| Body Part:     | Throat      | Listbox         |
	| Body Part:     | Eyes        | Listbox         |
	| Body Part:     | Nose        | Listbox         |
	| Body Part:     | Mouth       | Listbox         |
	| Body Part:     | Ears        | Listbox         |

Scenario Outline: 68_Verification of new unlinked primary codelist item display all secodary codelist items.
	Given I expand "Visit (Week 2)" to select and open "Form1 with linkages" CRF.
	When I enter "AnswerValue" for flat "AnswerFieldType" question "QuestionPrompt" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine category:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Lotion       |
	| Drops        |
	| Tablet       |
	And I click on "Cancel" button on "Form1 with linkages" CRF.
	Examples: 
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Body Part:     | Feet        | Listbox         |
	

Scenario: 69_Verification of new unlinked primary codelist item display all secodary codelist items for a cascanding linkage question.
	When I enter "Tablet" for flat "ListBox" question "Medicine category:" in the CRF.
	Then I Verify below "ListBox" items are displayed in "Medicine:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Drops1       |
	| Drops2       |
	| Lotion1      |
	| Lotion2      |
	| Lotion3      |
	| Tablet1      |
	| Tablet2      |
	And I click on "Cancel" button on "Form1 with linkages and groups" CRF.

Scenario: 70_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 05       | PAT             | 27/02/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 05-PAT    |

Scenario: 71_Select and enroll the patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "05-PAT" from patients table.
	When I enroll the patient "05-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 05       | 27/02/2018 | Yes           |
	Then I see patient "05-PAT" status as "Enrolled" on Patient details page.

Scenario: 72_Fill data in 'Form1 with linkages' CRF.
	Given I expand "Visit (Week 2)" to select and open "Form1 with linkages" CRF.
	When I click "Checkout" button on "Form1 with linkages" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Visit Date:        | 02/27/2018  | TextBox         |
	| Problem:           | Injuries    | Listbox         |
	| Body Part:         | Feet        | Listbox         |
	| Medicine category: | Tablet      | Listbox         |
	| Medicine:          | Tablet1     | Listbox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1 with linkages" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 73_Fill data in 'Form2 with linkages' CRF and verify the newly added secondary codelist item is not displayed as it is not linked.
	Given I expand "Visit (Week 2)" to select and open "Form2 with linkages" CRF.
	When I click "Checkout" button on "Form2 with linkages" CRF.
	And I enter below "Patient visiting doctor information:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Day Type:      | WorkingDay  | Radio           |                  |
	| No        | 1         | Day:           | Monday      | ListBox         |                  |
	Then I verify below "Checkbox" items are not displayed for "Shift:" question in row "1" of "Patient visiting doctor information:" table.
	| ItemToVerify |
	| Night        |

Scenario: 74_Fill data in 'Form2 with linkages' CRF and verify the newly added secondary codelist item is not displayed as it is not linked.
	Given I expand "Visit (Week 2)" to select and open "Form2 with linkages" CRF.
	When I click "Checkout" button on "Form2 with linkages" CRF.
	And I enter below "Patient visiting doctor information:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Day:           | Tuesday     | ListBox         |                  |
	Then I verify below "Checkbox" items are not displayed for "Shift:" question in row "1" of "Patient visiting doctor information:" table.
	| ItemToVerify |
	| Night        |

Scenario: 75_Fill data in 'Form2 with linkages' CRF and verify the newly added secondary codelist item is not displayed as it is not linked.
	Given I expand "Visit (Week 2)" to select and open "Form2 with linkages" CRF.
	When I click "Checkout" button on "Form2 with linkages" CRF.
	And I enter below "Patient visiting doctor information:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Day Type:      | Holiday     | Radio           |                  |
	| No        | 1         | Day:           | Sunday      | ListBox         |                  |
	Then I verify below "Checkbox" items are not displayed for "Shift:" question in row "1" of "Patient visiting doctor information:" table.
	| ItemToVerify |
	| Night        |
	And I click on "Cancel" button on "Form2 with linkages" CRF.

Scenario: 76_Fill data in 'Form2 with linkages' CRF.
	Given I expand "Visit (Week 2)" to select and open "Form2 with linkages" CRF.
	When I click "Checkout" button on "Form2 with linkages" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Gender:        | Male        | Radio           |
	| Age:           | 35          | Textbox         |
	| Age Unit:      | Years       | Textbox         |
	And I enter below "Patient visiting doctor information:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt            | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Day Type:                 | WorkingDay  | Radio           |                  |
	| No        | 1         | Day:                      | Monday      | Listbox         |                  |
	| No        | 1         | Doctor attended:          | Doc1        | Textbox         |                  |
	| No        | 1         | Shift:                    | Noon        | Checkbox        |                  |
	| No        | 1         | Has the problem resolved? | Yes         | Listbox         | Save & Close Row |
	| Yes       | 2         | Day Type:                 | Holiday     | Radio           |                  |
	| No        | 2         | Day:                      | Saturday    | Listbox         |                  |
	| No        | 2         | Doctor attended:          | Doc2        | Textbox         |                  |
	| No        | 2         | Shift:                    | [Blank]     | Checkbox        |                  |
	| No        | 2         | Has the problem resolved? | No          | Listbox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form2 with linkages" CRF.
	Then The CRF with data is saved and checked-in successfully.