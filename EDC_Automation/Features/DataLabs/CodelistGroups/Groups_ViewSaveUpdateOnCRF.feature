Feature: Groups_ViewSaveUpdateOnCRF
		Able to see codelist items on eCRF based on codelist groups.

@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And  I upload a study "TestCGstudy_FlatandTable-Auto1.Zip" with study label "TestCGstudy_FlatandTable-Auto1"
	Then I see study label "Test3210" in header

Scenario: 04_Add Sites
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	Then I see site "01-Site" in SiteManagementPage

Scenario: 05_Assign testadmin testadmin user to site 01
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: 06_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 12/06/2017 |
	| 02       | PAT             | 12/06/2017 |
	| 03       | PAT             | 12/06/2017 |
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
	| 01       | 12/06/2017 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 08_Select a site and a patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

	@ObjectiveEvidence @US40602.1
Scenario: 09_Flat Questions_Verify Listbox and radio items of and un-submitted CRF and without checking out.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	Then I Verify below "ListBox" items are displayed in "Race:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Asian        |
	| Black        |
	| White        |	   
	And I verify below "RadioGroup" items are displayed in "Gender:" on the CRF.
	| ItemToVerify |
	| Male         |
	| Female       |
	And I Verify below "ListBox" items are not displayed in "Race:" on the CRF.
	| ItemToVerify      |
	| Hispanic American |
	| Native American   |
	| Other             |
	And I verify below "RadioGroup" items are not displayed in "Gender:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	And I click on "Cancel" button on "Demographics" CRF.

#
#	#US40602.1
#Scenario: 10_Verify unavailable Listbox and radio items of and un-submitted CRF and without checking out.
#	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	

	@ObjectiveEvidence @US40602.1
Scenario: 11_Select a Form with only flat questions and enter data in CRF.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	Then I Verify below "ListBox" items are displayed in "Race:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Asian        |
	| Black        |
	| White        |	   
	And I verify below "RadioGroup" items are displayed in "Gender:" on the CRF.
	| ItemToVerify |
	| Male         |
	| Female       |
	And I click on "Cancel" button on "Demographics" CRF.

	@ObjectiveEvidence @US40602.1
Scenario: 12_Select a Form with only flat questions and enter data in CRF.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	Then I Verify below "ListBox" items are not displayed in "Race:" on the CRF.
	| ItemToVerify      |
	| Hispanic American |
	| Native American   |
	| Other             |
	And I verify below "RadioGroup" items are not displayed in "Gender:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	And I click on "Cancel" button on "Demographics" CRF.

Scenario: 13_Table Questions_Verify available listbox and radio items of unsubmitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I click on "Add New Row" button in "Table:" table.
	Then I verify below "ListBox" items are displayed for "Color" question in row "1" of "Table:" table.
	| ItemToVerify   |
	| Not Applicable |
	| Red            |
	| Blue           |
	| Green          |
	And I verify below "RadioGroup" items are displayed for "Position" question in row "1" of "Table:" table.
	| ItemToVerify |
	| [Blank]      |
	| Sitting      |
	| Standing     |
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario: 14_Table Questions_Verify unavailable listbox and radio items of unsubmitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I click on "Add New Row" button in "Table:" table.
	Then I verify below "RadioGroup" items are not displayed for "Position" question in row "1" of "Table:" table.
	| ItemToVerify |
	| Supine       |	
	And I verify below "ListBox" items are not displayed for "Color" question in row "1" of "Table:" table.
	| ItemToVerify |
	| Yellow       |
	| White        |
	And I click on "Cancel" button on "DT1 Form" CRF.

@ObjectiveEvidence @US40602.1
Scenario: 15_Select a Form with only flat questions and enter data in CRF.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date of Birth:                                     | 01/01/1980  | TextBox         |
	| Gender:                                            | Male        | Radio           |
	| Race:                                              | Asian       | ListBox         |
	| If Race is Asian, is Patient of Japanese Ancestry? | Yes         | ListBox         |
	| Was Patient Born in Japan?                         | No          | ListBox         |
	| Number of parents born in Japan:                   | 1           | ListBox         |
	| Number of Grandparents Born in Japan?              | 2           | ListBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @US40602.1
Scenario: 16_Verify questions data of flat questions in completely submitted CRF.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date of Birth:                                     | 01/01/1980  | Text         |
	| Gender:                                            | Male        | Text         |
	| Race:                                              | Asian       | Text         |
	| If Race is Asian, is Patient of Japanese Ancestry? | Yes         | Text         |
	| Was Patient Born in Japan?                         | No          | Text         |
	| Number of parents born in Japan:                   | 1           | Text         |
	| Number of Grandparents Born in Japan?              | 2           | Text         |

	@ObjectiveEvidence @US40602.1
Scenario: 17_Checkout and verify questions data of flat questions in submitted CRF.
	#Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date of Birth:                                     | 01/01/1980  | Link         |
	| Gender:                                            | Male        | Link         |
	| Race:                                              | Asian       | Link         |
	| If Race is Asian, is Patient of Japanese Ancestry? | Yes         | Link         |
	| Was Patient Born in Japan?                         | No          | Link         |
	| Number of parents born in Japan:                   | 1           | Link         |
	| Number of Grandparents Born in Japan?              | 2           | Link         |

	@ObjectiveEvidence @US40602.1
Scenario: 18_0_Select a Form with flat questions and verify Codelist group items for flat questions for submitted form.
	#Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	#When I click "Checkout" button on "Demographics" CRF.
	When I click on "Asian" answer value link for flat question "Race:".
	Then I Verify below "ListBox" items are displayed in "Race:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Asian        |
	| Black        |
	| White        |
	And I click on "Cancel" button on "Demographics" CRF.

	@ObjectiveEvidence @US40602.1
Scenario: 18_1_Select a Form with flat questions and verify Codelist group items for flat questions for submitted form.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	And I click on "Male" answer value link for flat question "Gender:".
	Then I verify below "RadioGroup" items are displayed in "Gender:" on the CRF.
	| ItemToVerify |
	| Male         |
	| Female       |
	And I click on "Cancel" button on "Demographics" CRF.
	
Scenario: 19_Table Questions_Verify available listbox and radio items of unsubmitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I click on "Add New Row" button in "Table:" table.
	Then I verify below "ListBox" items are displayed for "Color" question in row "1" of "Table:" table.
	| ItemToVerify   |
	| Not Applicable |
	| Red            |
	| Blue           |
	| Green          |
	And I verify below "RadioGroup" items are displayed for "Position" question in row "1" of "Table:" table.
	| ItemToVerify |
	| [Blank]      |
	| Sitting      |
	| Standing     |
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario:20_Select a Form with table questions and enter data in CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	#And I click on "Add New Row" button in "Table:" table.
	And I enter below "Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt          | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Text (DT1_Text2):       | Test        | TextBox         |                  |
	| No        | 1         | Date (DT1_Date2):       | 01/01/2010  | TextBox         |                  |
	| No        | 1         | Integer (DT1_Integer2): | 10          | TextBox         |                  |
	| No        | 1         | Float (DT1_Float2):     | 10.10       | TextBox         |                  |
	| No        | 1         | Color                   | Red         | ListBox         |                  |
	| No        | 1         | Position                | Sitting     | Radio           | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "DT1 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 21_Verify questions data of Table questions in completely submitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	Then I verify below "Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt          | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Text (DT1_Text2):       | Test        | Text            |                  |
	| 1         | Date (DT1_Date2):       | 01/01/2010  | Text            |                  |
	| 1         | Integer (DT1_Integer2): | 10          | Text            |                  |
	| 1         | Float (DT1_Float2):     | 10.10       | Text            |                  |
	| 1         | Color                   | Red         | Text            |                  |
	| 1         | Position                | Sitting     | Text            | OK               |
	#And I click on "Cancel" button on "Table:" CRF.
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario: 22_Checkout and verify questions data of table questions in submitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	Then I verify below "Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt          | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Text (DT1_Text2):       | Test        | Link            |                  |
	| 1         | Date (DT1_Date2):       | 01/01/2010  | Link            |                  |
	| 1         | Integer (DT1_Integer2): | 10          | Link            |                  |
	| 1         | Float (DT1_Float2):     | 10.10       | Link            |                  |
	| 1         | Color                   | Red         | Link            |                  |
	| 1         | Position                | Sitting     | Link            | Cancel Row       |
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario: 23_Checkout and verify Codelist group items for table questions in submitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I click on "Red" answer value link for table "Table:" question "Color" in row "1".
	Then I verify below "ListBox" items are displayed for "Color" question in row "1" of "Table:" table.
	| ItemToVerify   |
	| Not Applicable |
	| Red            |
	| Blue           |
	| Green          |
	And I verify below "RadioGroup" items are displayed for "Position" question in row "1" of "Table:" table.
	| ItemToVerify |
	| [Blank]      |
	| Sitting      |
	| Standing     |
	And I click table row button "Cancel Row" of table "Table:" 
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario: 24_Checkout and update questions data of table questions in submitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I enter below "Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	| No        | 1         | Color          | Red                | ListBox         | Blue           | SOR             |                 | OK               |
	| No        | 1         | Position       | Sitting            | Radio           | Standing       | DCF             |                 | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "DT1 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 25_Verify codelist group data of Table questions in completely submitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	Then I verify below "Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt          | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Text (DT1_Text2):       | Test        | Text            |                  |
	| 1         | Date (DT1_Date2):       | 01/01/2010  | Text            |                  |
	| 1         | Integer (DT1_Integer2): | 10          | Text            |                  |
	| 1         | Float (DT1_Float2):     | 10.10       | Text            |                  |
	| 1         | Color                   | Blue        | Text            |                  |
	| 1         | Position                | Standing    | Text            | OK               |
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario: 26_Checkout and verify updated codelist group data of table questions in submitted CRF.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	Then I verify below "Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt          | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Date (DT1_Date2):       | 01/01/2010  | Link            |                  |
	| 1         | Integer (DT1_Integer2): | 10          | Link            |                  |
	| 1         | Float (DT1_Float2):     | 10.10       | Link            |                  |
	| 1         | Color                   | Blue        | Link            |                  |
	| 1         | Position                | Standing    | Link            | Cancel Row       |
	And I click on "Cancel" button on "DT1 Form" CRF.

	#Codelist Group applied for AutoBuild Table questions.
	@ObjectiveEvidence @US40601.1
Scenario: 27_Verify Autobuild table questions data in unsubmitted form and without checking out.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	Then I verify below "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" table questions data in the CRF.
	| RowNumber | QuestionPrompt  | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Region of Body: | Head        | Textbox         |                  |
	| 1         | Gender:         | Male        | Radio           |                  |
	| 1         | Patient Status: | Enrolled    | Textbox         | Cancel Row                 |
	| 2         | Region of Body: | Eyes        | Textbox         |                  |
	| 2         | Gender:         | Male        | Radio           |                  |
	| 2         | Patient Status: | Enrolled    | Textbox         |Cancel Row                  |
	| 3         | Region of Body: | Ears        | Textbox         |                  |
	| 3         | Gender:         | Male        | Radio           |                  |
	| 3         | Patient Status: | Enrolled    | Textbox         |Cancel Row                  |
	| 4         | Region of Body: | Nose        | Textbox         |                  |
	| 4         | Gender:         | Male        | Radio           |                  |
	| 4         | Patient Status: | Enrolled    | Textbox         |  Cancel Row                |
	And I verify below "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                                                          | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Drug Name:                                                                              | Tylenol     | Textbox         |                  |
	| 1         | Placebo:                                                                                | [Blank]     | Listbox         |                  |
	| 1         | Name: {Required - Sent}                                                                 |             | Textbox         |                  |
	| 1         | Enter patient date of birth:{Not Answered - Sent} (Condition - Q2 is not equal to "No") |             | Textbox         | Cancel Row       |
	| 2         | Drug Name:                                                                              | Tylenol     | Textbox         |                  |
	| 2         | Placebo:                                                                                | [Blank]     | Listbox         |                  |
	| 2         | Name: {Required - Sent}                                                                 |             | Textbox         |                  |
	| 2         | Enter patient date of birth:{Not Answered - Sent} (Condition - Q2 is not equal to "No") |             | Textbox         | Cancel Row       |
	| 3         | Drug Name:                                                                              | Contact     | Textbox         |                  |
	| 3         | Placebo:                                                                                | [Blank]     | Listbox         |                  |
	| 3         | Name: {Required - Sent}                                                                 |             | Textbox         |                  |
	| 3         | Enter patient date of birth:{Not Answered - Sent} (Condition - Q2 is not equal to "No") |             | Textbox         | Cancel Row       |
	| 4         | Drug Name:                                                                              | Contact     | Textbox         |                  |
	| 4         | Placebo:                                                                                | [Blank]     | Listbox         |                  |
	| 4         | Name: {Required - Sent}                                                                 |             | Textbox         |                  |
	| 4         | Enter patient date of birth:{Not Answered - Sent} (Condition - Q2 is not equal to "No") |             | Textbox         | Cancel Row       |
	
	@ObjectiveEvidence @US40601.1
Scenario: 28_Verify Autobuild table questions "Race" and " Gender" codelist group data in unsubmitted form and with checking out.
	When I expand row "1" of table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
	Then I verify below "ListBox" items are displayed for "Race:" question in row "1" of "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" table.
	| ItemToVerify |
	| [Blank]      |
	| Asian        |
	| Black        |
	| White        |
	And I verify below "RadioGroup" items are displayed for "Gender:" question in row "1" of "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" table.
	| ItemToVerify |
	| Male         |
	| Female       |
	And I click table row button "Save & Close Row" of table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
	And I verify below "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Drug Name:                          | Tylenol     | TextBox         |                  |
	| No        | 1         | Time of Day that the drug is taken: | AM          | TextBox         | Save & Close Row |
	| No        | 2         | Drug Name:                          | Tylenol     | TextBox         |                  |
	| No        | 2         | Time of Day that the drug is taken: | PM          | TextBox         | Save & Close Row |
	| No        | 3         | Drug Name:                          | Contact     | TextBox         |                  |
	| No        | 3         | Time of Day that the drug is taken: | AM          | TextBox         | Save & Close Row |
	| No        | 4         | Drug Name:                          | Contact     | TextBox         |                  |
	| No        | 4         | Time of Day that the drug is taken: | AM          | TextBox         | Save & Close Row |
	And I click on "Save & Close" button on "AutoBuild Form01" CRF.

	#Codelist Group applied for AutoBuild Fixed Table questions with key sequence 1 and 2 defined for 1.1 and 1.2 in a table:
	@ObjectiveEvidence @US40601.1
Scenario: 29_Select a Form with Autobuild table (fixed) questions and enter data in CRF.
	Given I expand "Visit (Week 20)" to select and open "Autobuild Fixed 1" CRF.
	When I click "Checkout" button on "Autobuild Fixed 1" CRF.
	And I enter below "First auto build table (max rows: 6, structure: fixed):" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                                              | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Non-key sequence code list (inches or centimeters):                         | cm          | Radio           |                  |
	| No        | 1         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
	| No        | 2         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
	| No        | 3         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
	#| No        | 4         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Autobuild Fixed 1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @US40601.1
Scenario: 30_Select a Form with Autobuild table (fixed) questions and Edit data on saved form
	Given I expand "Visit (Week 20)" to select and open "Autobuild Fixed 1" CRF.
	When I click "Checkout" button on "Autobuild Fixed 1" CRF.
	And I enter below "First auto build table (max rows: 6, structure: fixed):" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                                              | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	| No        | 1         | Non-key sequence code list (inches or centimeters):                         | cm                 | Radio           | in             | SOR             |                 | Save & Close Row |
	| No        | 3         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12             | TextBox         | 170.12         | DCF             |                 | Cancel Row       |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Autobuild Fixed 1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @US40601.1
Scenario: 31_Select a Form with questions in multiple Autobuild tables (fixed and non-fixed) questions. Enter data in CRF.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
	When I click "Checkout" button on "AutoBuild Form03" CRF.
	And I enter below "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt     | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Select the color:  | Red         | Radio           |                  |
	| No        | 1         | Select your drug:  | Contact     | ListBox         |                  |
	| No        | 1         | Select Work Shift: | AM          | ListBox         | Save & Close Row |
	| Yes       | 2         | Select the color:  | Red         | Radio           |                  |
	| No        | 2         | Select your drug:  | Contact     | ListBox         |                  |
	| No        | 2         | Select Work Shift: | PM          | ListBox         | Save & Close Row |
	And I enter below "Key Sequence is on question #1. Question (4 & 7) are derives. Table structure is open. Maximum Table Rows are 5.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Race:                | Asian       | ListBox         |                  |
	| No        | 1         | The some Text value: | Test        | TextBox         | Save & Close Row |
	| Yes       | 3         | Race:                | White       | ListBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "AutoBuild Form03" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @US40601.1
Scenario: 32_Select a Form with questions in multiple Autobuild tables (fixed and non-fixed) questions. Verify saved data.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
	#When I click "Checkout" button on "AutoBuild Form03" CRF.
	Then I verify below "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt     | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No       | 1         | Select the color:  | Red         | Text            |                  |
	| No        | 1         | Select your drug:  | Contact     | Text            |                  |
	| No        | 1         | Select Work Shift: | AM          | Text            | OK               |
	| No       | 2         | Select the color:  | Red         | Text            |                  |
	| No        | 2         | Select your drug:  | Contact     | Text            |                  |
	| No        | 2         | Select Work Shift: | PM          | Text            | OK               |
	And I enter below "Key Sequence is on question #1. Question (4 & 7) are derives. Table structure is open. Maximum Table Rows are 5.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Race:                | Asian       | Text         |                  |
	| No        | 1         | The some Text value: | Test        | Text         | OK               |
	| No       | 3         | Race:                | White       | Text         | OK               |
	And I click on "Cancel" button on "AutoBuild Form03" CRF.
		
	@ObjectiveEvidence @US40601.1
Scenario: 33_Enter value for Q1 and clear by clicking MarkNotAnswered
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample text question: | [Blank]            | TextBox         | text           | DCF             |                 |
	And I click icon "icon_mna_disabled.png" for the flat question "Sample text question:" in CRF
    And I enter comments "Comments for MarkItemNotAnswered" in MarkItemDialog
	And I click ok button in MarkItemDialog
	Then I see icon "icon_mna.png" against question "Sample text question:"
	And I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Sample text question: | [Blank]     | Text            |
	And I click "Cancel" button on "Form1" CRF.

	#US40601.1#US40601.1
#Scenario: 34_Delete Row and restore row for question associated with codelist group.
#	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
#	When I click "Checkout" button on "AutoBuild Form03" CRF.
#	Then I verify below "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:" table questions data in the CRF.
#	| AddNewRow | RowNumber | QuestionPrompt     | AnswerValue | AnswerFieldType | RowButtonToClick |
#	| Yes       | 1         | Select the color:  | Red         | Text            |                  |
#	| No        | 1         | Select your drug:  | Contact     | Text            |                  |
#	| No        | 1         | Select Work Shift: | AM          | Text            | Save & Close Row |
#	| Yes       | 2         | Select the color:  | Red         | Text            |                  |
#	| No        | 2         | Select your drug:  | Contact     | Text            |                  |
#	| No        | 2         | Select Work Shift: | PM          | Text            | Save & Close Row |
#	And I enter below "Key Sequence is on question #1. Question (4 & 7) are derives. Table structure is open.  Maximum Table Rows are 5.:" autobuild table questions data in the CRF.
#	| AddNewRow | RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
#	| No        | 1         | Race:                | Asian       | TextBox         |                  |
#	| No        | 1         | The some Text value: | Test        | TextBox         | Save & Close Row |
#	| Yes       | 3         | Race:                | White       | ListBox         | Save & Close Row |
#	And I click on "Save & Close" button on "AutoBuild Form03" CRF.

	@ObjectiveEvidence @US40601.1
Scenario: 35_Delete table row question associated with codelist group.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
	When I click "Checkout" button on "AutoBuild Form03" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
	And I click table row button "Delete Row" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "TestDelete" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I see deleted row "1" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"

#Scenario: 36_0_Restore table row 
#	When I expand row "1" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
#	And I click table row button "Restore Row" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"

Scenario: 36_1_Restore table row
	When I expand row "1" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
	And I click table row button "Restore Row" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
	And I select reason for change "DCF" in RestoreTableRowModalDialog
	And I enter additional notes "TestRestory" in RestoreTableRowModalDialog
	And I click continue button in RestoreTableRowModalDialog
	Then I see restored row "1" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
	And I click on "Save & Close" button on "AutoBuild Form03" CRF.


Scenario: 37_Verify Restored data in table row.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
	#When I click "Checkout" button on "AutoBuild Form03" CRF.
	Then I verify below "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt     | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Select the color:  | Red         | Text            |                  |
	| No        | 1         | Select your drug:  | Contact     | Text            |                  |
	| No        | 1         | Select Work Shift: | AM          | Text            | OK               |
	And I click "Cancel" button on "AutoBuild Form03" CRF.

@ObjectiveEvidence 		
Scenario: 38_Verify Item change history for non table question 
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Race:					   | Asian              | ListBox         | White		   | DCF             |                 |
	And I click on "Save & Close" button on "Demographics" CRF.
	And I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	And I click icon "changeHistory.gif" for the flat question "Race:" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Asian    | Reason: Initial Entry\r\nNotes: Submitted |
	|          | White    | Reason: DCF                               |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "Demographics" CRF.

@ObjectiveEvidence 
Scenario: 39_Verify Item change history for table question 
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I expand row "1" of table "Table:"
	# I expnad row "2" of table "Table:"
	And I click "changeHistory.gif" icon of a question "Color" of table "Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Blue     | Reason: SOR                               |
	|          | Red      | Reason: Initial Entry\r\nNotes: Submitted |
	And I click cancel button in ChangeHistoryModal

@ObjectiveEvidence 
Scenario: 40_Verify Item change history for table question 
	When I click "changeHistory.gif" icon of a question "Position" of table "Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Standing     | Reason: DCF                               |
	|          | Sitting      | Reason: Initial Entry\r\nNotes: Submitted |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "DT1 Form" CRF.

@ObjectiveEvidence 
Scenario: 41_Verify Item change history for Autobuild Fixed table question 
	Given I expand "Visit (Week 20)" to select and open "Autobuild Fixed 1" CRF.
	When I click "Checkout" button on "Autobuild Fixed 1" CRF.
	And I expand row "1" of table "First auto build table (max rows: 6, structure: fixed):"
	#I expnad row "1.1" of table "First auto build table (max rows: 6, structure: fixed):"
	And I click "changeHistory.gif" icon of a question "Non-key sequence code list (inches or centimeters):" of table "First auto build table (max rows: 6, structure: fixed):"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | in       | Reason: SOR                               |
	|          | cm      | Reason: Initial Entry\r\nNotes: Submitted |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "Autobuild Fixed 1" CRF.

Scenario: 42_Update the values for questions in multiple Autobuild tables (fixed and non-fixed)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
	When I click "Checkout" button on "AutoBuild Form03" CRF.
	And I enter below "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt	 | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	| No        | 1         | Select the color:  | Red                | Radio           | Green          | SEC             |                 |					|
	| No        | 1         | Select Work Shift: | AM                 | ListBox         | PM             | DCF             |                 | Save & Close Row |
	#And I click on "Save & Close Row" button
	#And I click on "Save & Close" button on "AutoBuild Form03" CRF.
	And I enter below "Key Sequence is on question #1. Question (4 & 7) are derives. Table structure is open. Maximum Table Rows are 5.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick  |
	| No	    | 1         | Race:          | Asian              | ListBox         | Black          | DCF             |                 |	Save & Close Row |
	#And I click on "Save & Close Row" button
	#And I click on "Save & Close" button on "AutoBuild Form03" CRF.
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "AutoBuild Form03" CRF.
	Then The CRF with data is saved and checked-in successfully.

@ObjectiveEvidence 
Scenario: 43_Verify Item change history for questions in multiple Autobuild tables (fixed and non-fixed)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
	When I click "Checkout" button on "AutoBuild Form03" CRF.
	#And I expnad row "1.1" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
	And I expand row "1" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
	And I click "changeHistory.gif" icon of a question "Select the color:" of table "Key Sequence is not used. Maximum rows is 2. Question (4-7) have queries.:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Green    | Reason: SEC                               |
	|          | Red      | Reason: Initial Entry\r\nNotes: Submitted |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "AutoBuild Form03" CRF.

@ObjectiveEvidence
Scenario: 44_Verify Item change history for questions in multiple Autobuild tables (fixed and non-fixed)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
	When I click "Checkout" button on "AutoBuild Form03" CRF.
	#And I expnad row "2.1" of table "Key Sequence is on question #1.  Question (4 & 7) are derives.  Table structure is open.  Maximum Table Rows are 5.:"
	And I expand row "1" of table "Key Sequence is on question #1. Question (4 & 7) are derives. Table structure is open. Maximum Table Rows are 5.:"
	And I click "changeHistory.gif" icon of a question "Race:" of table "Key Sequence is on question #1. Question (4 & 7) are derives. Table structure is open. Maximum Table Rows are 5.:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Black    | Reason: DCF                               |
	|          | Asian    | Reason: Initial Entry\r\nNotes: Submitted |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "AutoBuild Form03" CRF.

Scenario: 45_Add comment to flat question which is associated to codelist group 'Race'
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	And I add commnet to a flat question
	| QuestionPrompt | CommentsToAdd |
	| Race:          | testing item-level comment |
	Then I see icon "comment.gif" against question "Race:"
	And I open main tab "Comments" of Form
	Then I see comments in comments tab
	| QuestionNumberOrForm | Question | Value   | Comment                     | DateTime |
	| 3                    | Race:    | White   | testing item-level comment  |          |
	And I open main tab "CRF" of Form
	And I click on "Cancel" button on "Demographics" CRF.

	@ObjectiveEvidence @US40602.1	
Scenario: 46_Reset CRF which has Codelist group associated to a flat question.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click ActionPalette Item "Reset CRF" in "CRFAction" ActionPalette
	And I click Yes button in ResetCRFModalDialog
	And I enter reason "CRF is reset" in ResetCRFModalDialog
	And I click Continue button in ResetCRFModalDialog
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                  |
	|  CRF Reset - Visit (Week 3)/Demographics for patient 01-PAT - COMPLETE. View Summary. |

 Scenario: 47_Verify CRF with codelist group questions after Reset CRF is done.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	Then I Verify below "ListBox" items are displayed in "Race:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Asian        |
	| Black        |
	| White        |	   
	And I verify below "RadioGroup" items are displayed in "Gender:" on the CRF.
	| ItemToVerify |
	| Male         |
	| Female       |
	And  I click "Checkout" button on "Demographics" CRF.
	Then I Verify below "ListBox" items are displayed in "Race:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Asian        |
	| Black        |
	| White        |	   
	And I verify below "RadioGroup" items are displayed in "Gender:" on the CRF.
	| ItemToVerify |
	| Male         |
	| Female       |
	And I click on "Cancel" button on "Demographics" CRF.

	@ObjectiveEvidence @US40601.1
Scenario: 48_Reset CRF which has Codelist group associated to a table question.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click ActionPalette Item "Reset CRF" in "CRFAction" ActionPalette
	And I click Yes button in ResetCRFModalDialog
	And I enter reason "CRF is reset" in ResetCRFModalDialog
	And I click Continue button in ResetCRFModalDialog
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject|
	| CRF Reset - Visit (Week 7)/DT1 Form for patient 01-PAT - COMPLETE. View Summary. |
	
Scenario: 49_Verify CRF with table question with codelist group associated after Reset CRF is done.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	And I expand row "1" of table "Table:"
	Then I verify below "ListBox" items are displayed for "Color:" question in row "1" of "Table:" table.
	| ItemToVerify   |
	| Not Applicable |
	| Red            |
	| Blue           |
	| Green          |
	And I verify below "RadioGroup" items are displayed for "Position:" question in row "1" of "Table:" table.
	| ItemToVerify |
	| [Blank]      |
	| Sitting      |
	| Standing     |
	#And I click on "OK" button on "DT1 Form" CRF.
	And I click table row button "OK" of table "Table:" 
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario: 50_Checkout and verify CRF with table question with codelist group associated after Reset CRF is done.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I expand row "1" of table "Table:"
	Then I verify below "ListBox" items are displayed for "Color:" question in row "1" of "Table:" table.
	| ItemToVerify   |
	| Not Applicable |
	| Red            |
	| Blue           |
	| Green          |
	And I verify below "RadioGroup" items are displayed for "Position:" question in row "1" of "Table:" table.
	| ItemToVerify |
	| [Blank]      |
	| Sitting      |
	| Standing     |
	And I click table row button "OK" of table "Table:"
	And I click on "Cancel" button on "DT1 Form" CRF.

	@ObjectiveEvidence @US40601.1
Scenario: 51_Reset CRF which has Codelist group associated to a autobuild table question.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click ActionPalette Item "Reset CRF" in "CRFAction" ActionPalette
	And I click Yes button in ResetCRFModalDialog
	And I enter reason "CRF is reset" in ResetCRFModalDialog
	And I click Continue button in ResetCRFModalDialog
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject|
	| CRF Reset - Visit (Week 51)/AutoBuild Form01 for patient 01-PAT - COMPLETE. View Summary. |
	
	
Scenario: 52_Verify CRF with autobuild table question associated with codelist group after Reset CRF is done.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	#When I click "Checkout" button on "AutoBuild Form01" CRF.
	Then I verify below "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Race:          | Blank       | ListBox         |                  |
	| No        | 1         | Race:          | Asian       | ListBox         |                  |
	| No        | 1         | Race:          | Black       | ListBox         |                  |
	| No        | 1         | Race:          | White       | ListBox         |                  |
	| No        | 1         | Gender:        | Male        | Radio           |                  |
	| No        | 1         | Gender:        | Female      | Radio           | Ok               |
	And I click on "Cancel" button on "AutoBuild Form01" CRF.

Scenario: 53_Checkout Form and Verify CRF with autobuild table question associated with codelist group after Reset CRF is done..
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	Then I verify below "Key Sequence on question #2.  Table Structure is fixed.  Maximum Rows is not exact.  Questions (4-7) are derives.:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Race:          | Blank       | ListBox         |                  |
	| No        | 1         | Race:          | Asian       | ListBox         |                  |
	| No        | 1         | Race:          | Black       | ListBox         |                  |
	| No        | 1         | Race:          | White       | ListBox         |                  |
	| No        | 1         | Gender:        | Male        | Radio           |                  |
	| No        | 1         | Gender:        | Female      | Radio           | Cancel Row       |
	And I click on "Cancel" button on "AutoBuild Form01" CRF.

Scenario: 54_Verify Clear item on CRF with table question associated with codelist group.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	#And I click on "Add New Row" button in "Table:" table.
	And I enter below "Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt          | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Text (DT1_Text2):       | Test        | TextBox         |                  |
	| No        | 1         | Date (DT1_Date2):       | 01/01/2010  | TextBox         |                  |
	| No        | 1         | Integer (DT1_Integer2): | 10          | TextBox         |                  |
	| No        | 1         | Float (DT1_Float2):     | 10.10       | TextBox         |                  |
	| No        | 1         | Color                   | Red         | ListBox         |                  |
	| No        | 1         | Position                | Sitting     | ListBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "DT1 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 55_Verify item cleared on CRF with  table question associated with codelist group.
	Given I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I expand row "1" of table "Table:"
	And I clear question "Color" of table "Table:"
	And I enter notes "Table question is cleared" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click on "Not Applicable" answer value link for table "Table:" question "Color" in row "1".
	Then I verify below "ListBox" items are displayed for "Color:" question in row "1" of "Table:" table.
	| ItemToVerify   |
	| Not Applicable |
	| Red            |
	| Blue           |
	| Green          |
	And I click table row button "Cancel Row" of table "Table:"
	And I click on "Cancel" button on "DT1 Form" CRF.

Scenario: 56_Verify Clear item on CRF with  flat question associated with codelist group.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date of Birth:                                     | 01/01/1980  | TextBox         |
	| Gender:                                            | Male        | Radio	         |
	| Race:                                              | Asian       | ListBox         |
	| If Race is Asian, is Patient of Japanese Ancestry? | Yes         | ListBox         |
	| Was Patient Born in Japan?                         | No          | ListBox         |
	| Number of parents born in Japan:                   | 1           | ListBox         |
	| Number of Grandparents Born in Japan?              | 2           | ListBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 57_Verify item cleared on CRF with  flat question associated with codelist group.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	And I click ClearItem for the flat question "Race:"
	And I enter notes "Flat question is cleared" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click on "[Blank]" answer value link for flat question "Race:".
	Then I Verify below "ListBox" items are displayed in "Race:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Asian        |
	| Black        |
	| White        |	   
    And I click on "Cancel" button on "Demographics" CRF.

Scenario: 58_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page


#US40602 - DL: CRF Changes to display Codeilst groups for questions (non-autobuild)
#US40601-DL: CRF Changes to display Codeilst group items to populate for autobuild table questions
#I shall be able to view only Group Codelist items on form questions assigned with Codelist groups.