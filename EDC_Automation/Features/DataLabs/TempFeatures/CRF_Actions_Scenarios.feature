Feature: CRF_Actions_Scenarios
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

@mytag
Scenario: CRF_001_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: CRF_002_Navigate to Patients tab and select a site and add patient(s).
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

Scenario: CRF_003_Select and enroll a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 12/06/2017 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: CRF_004_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: CRF_005_Select a Form with only flat questions and enter data in CRF.
	#Given I navigate to "Patients" tab from main menu.
	#And I select the site "01-Site" from Sites dropdown.
	#And I select the patient "01-PAT" from patients table.
	#And I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Checkout" button on "Demographics" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date of Birth:                                     | 01/01/1980  | TextBox         |
	| Gender:                                            | Male        | ListBox         |
	| Race:                                              | Asian       | ListBox         |
	| Dictionary Term verbatim for RACEO:                | NA          | TextBox         |
	| Encoding Type for RACEO:                           | NA          | TextBox         |
	| RACE + RACE01 combined for reporting purposes:     | NA          | TextBox         |
	| If Race is Asian, is Patient of Japanese Ancestry? | Yes         | ListBox         |
	| Was Patient Born in Japan?                         | No          | ListBox         |
	| Number of parents born in Japan:                   | 1           | ListBox         |
	| Number of Grandparents Born in Japan?              | 2           | ListBox         |
	| Treatment Group Code:                              | G1          | TextBox         |
	| Treatment Group Description:                       | Group1      | TextBox         |
	| Age at Study Start:                                | 37          | TextBox         |
	| Age Units at Study Start:                          | Years       | TextBox         |
	| Study Start Date:                                  | 11/28/2017  | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: CRF_006_Select a Form with with both flat and table questions and enter data in CRF.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt         | AnswerValue | AnswerFieldType |
	| Sample text question:  | Text        | TextBox         |
	| Sample radio question: | No          | Radio           |
	And I enter below "Sample Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Drug Name:     | Test Drug   | TextBox         |                  |
	| No        | 1         | Condition:     | Initial     | TextBox         |                  |
	| No        | 1         | Start Date:    | 01/01/2000  | TextBox         | Save & Close Row |
	| Yes       | 2         | Drug Name:     | Test Drug 2 | TextBox         |                  |
	| N0        | 2         | Start Date:    | 01/01/2010  | TextBox         | Save & Close Row |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: CRF_007_Select a Form with table questions and enter data in CRF.
	Given I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	When I click "Checkout" button on "Form 6" CRF.
	And I enter below "Table with All Data Types:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt           | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Text:                    | Test        | TextBox         |                  |
	| No        | 1         | Text Area:               | Initial     | TextArea        |                  |
	| No        | 1         | Select:                  | Yes         | ListBox         |                  |
	| No        | 1         | Radio (PDE Verify Only): | No          | Radio           |                  |
	| N0        | 1         | Date:                    | 01/01/2010  | TextBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form 6" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: CRF_008_Select a Form with questions in multiple tables. Enter data in CRF and handle queries popup.
	Given I expand "Visit (Week 8)" to select and open "Form 4" CRF.
	When I click "Checkout" button on "Form 4" CRF.
	And I enter below "Text Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Text question: (MinL: 3)(Edit Check: MinL {Sent})   | T12         | TextBox         |                  |
	| No        | 1         | Text question: (MaxL: 10)(Edit Check: MaxL {Draft}) | T2          | TextBox         | Save & Close Row |
	And I enter below "Date Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                               | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Date question: (Edit Check: Required {Sent}) | 12/06/2017  | TextBox         | Save & Close Row |
	And I enter below "Integer Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Integer question (Edit Check: Required {Sent}) | 12          | TextBox         | Save & Close Row |
	And I enter below "Float Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Float question: (Edit Check: Required {Sent}) | 12.12       | TextBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form 4" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
	| Queries                                                                              |
	| Row # 1: (Q4.10) This is a required item.                                            |
	| Row # 1: (Q1.3) This is a required item.                                             |
	| Row # 1: (Q1.5) This is a required item.                                             |
	| Row # 1: (Q2.6) This is a required item.                                             |
	| Row # 1: (Q3.8) This is a required item.                                             |
	| Row # 1: (Q4.5) The value entered does not meet the minimum length requirement of 2. |
	| Row # 1: (Q4.7) The value entered does not meet the minimum precision of 1.          |
	| Row # 1: (Q3.5) Item does not meet minimum length requirement of 2.                  |
	And I click Continue button of Modal "Queries Result"
	And The CRF with data is saved and checked-in successfully.

Scenario: CRF_009_Select a Form with Autobuild table (fixed) questions and enter data in CRF.
	Given I expand "Visit (Week 20)" to select and open "Autobuild Fixed 1" CRF.
	When I click "Checkout" button on "Autobuild Fixed 1" CRF.
	And I enter below "First auto build table (max rows: 6, structure: fixed):" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                                              | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Gender question (male or female):                                           | Male        | ListBox         |                  |
	| No        | 1         | Non-key sequence code list (inches or centimeters):                         | cm          | Radio           |                  |
	| No        | 1         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
	| No        | 3         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Autobuild Fixed 1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: CRF_010_Select a Form with Autobuild table (non-fixed) questions and enter data in CRF.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I enter below "Key Sequence is not used.  Maximum table rows are 3.  Hidden Questions (Integer, Float, Text, Date) are derives:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt               | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Does the chicken come first? | Yes         | ListBox         |                  |
	| No        | 1         | Enter hour in military time: | 14          | ListBox         |                  |
	| No        | 1         | Enter Minutes:               | 12          | ListBox         | Save & Close Row |
	| Yes       | 2         | Does the chicken come first? | No          | ListBox         |                  |
	| No        | 2         | Enter hour in military time: | 11          | ListBox         |                  |
	| No        | 2         | Enter Minutes:               | 13          | ListBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "AutoBuild Form02" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: CRF_011_Select a Form with questions in multiple Autobuild tables (fixed and non-fixed) questions. Enter data in CRF and handle queries popup.
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form03" CRF.
	When I click "Checkout" button on "AutoBuild Form03" CRF.
	And I enter below "Key Sequence is not used.  Maximum rows is 2.  Question (4-7) have queries.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt     | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Select the color:  | Red         | Radio           |                  |
	| No        | 1         | Select your drug:  | Contact     | ListBox         |                  |
	| No        | 1         | Select Work Shift: | AM          | ListBox         | Save & Close Row |
	| Yes       | 2         | Select the color:  | Red         | Radio           |                  |
	| No        | 2         | Select your drug:  | Contact     | ListBox         |                  |
	| No        | 2         | Select Work Shift: | PM          | ListBox         | Save & Close Row |
	And I enter below "Key Sequence is on question #1.  Question (4 & 7) are derives.  Table structure is open.  Maximum Table Rows are 5.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Race:                | Asian       | ListBox         |                  |
	| No        | 1         | The some Text value: | Test        | TextBox         | Save & Close Row |
	| Yes       | 3         | Race:                | White       | ListBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "AutoBuild Form03" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
	| Queries                                              |
	| Row # 1: Required date value                         |
	| Row # 1: Value does not meet the minimum length of 1 |
	| Row # 2: Required date value                         |
	| Row # 2: Value does not meet the minimum length of 1 |
	And I click Continue button of Modal "Queries Result"
	And The CRF with data is saved and checked-in successfully.

Scenario: CRF_012_Select a Form with questions in multiple Autobuild tables (fixed) questions. Enter data in CRF and handle queries popup.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	And I enter below "Key Sequence on question #2.  Table Structure is fixed.  Maximum Rows is not exact.  Questions (4-7) are derives.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Race:          | Asian       | ListBox         |                  |
	| No        | 1         | Gender:        | Male        | Radio           | Save & Close Row |
	| No        | 4         | Race:          | Asian       | ListBox         |                  |
	| No        | 4         | Gender:        | Male        | Radio           | Save & Close Row |
	And I enter below "Key Sequence on question #1 & #3.  Table Structure is fixed.  Maximum Rows is exact.  Questions (4-7) have queries.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt          | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 2         | Placebo:                | Yes         | ListBox         |                  |
	| No        | 2         | Name: {Required - Sent} | Drug1       | TextBox         | Save & Close Row |
	| No        | 5         | Placebo:                | No          | ListBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "AutoBuild Form01" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
	| Queries                                             |
	| Row # 1: Patient's Name is required                 |
	| Row # 2: Value does not have minimum precision of 1 |
	| Row # 3: Patient's Name is required                 |
	| Row # 4: Patient's Name is required                 |
	| Row # 5: Patient's Name is required                 |
	| Row # 6: Patient's Name is required                 |
	And I click Continue button of Modal "Queries Result"
	And The CRF with data is saved and checked-in successfully.

Scenario: CRF_013_Verify questions data of flat questions in un-submitted CRF.
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt          | AnswerValue            | AnswerFieldType |
	#| Sample radio question: | [Blank]         | Radio |
	| Sample select question: | [Blank]                | ListBox         |
	| Sample radio question:  | [Blank]                | Radio           |

Scenario: CRF_014_Verify questions data of flat questions in completely submitted CRF.
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date of Birth:                                     | 01/01/1980  | Text         |
	| Gender:                                            | Male        | Text         |
	| Race:                                              | Asian       | Text         |
	| Dictionary Term verbatim for RACEO:                | NA          | Text         |
	| Encoding Type for RACEO:                           | NA          | Text         |
	| RACE + RACE01 combined for reporting purposes:     | NA          | Text         |
	| If Race is Asian, is Patient of Japanese Ancestry? | Yes         | Text         |
	| Was Patient Born in Japan?                         | No          | Text         |
	| Number of parents born in Japan:                   | 1           | Text         |
	| Number of Grandparents Born in Japan?              | 2           | Text         |
	| Treatment Group Code:                              | G1          | Text         |
	| Treatment Group Description:                       | Group1      | Text         |
	| Age at Study Start:                                | 37          | Text         |
	| Age Units at Study Start:                          | Years       | Text         |
	| Study Start Date:                                  | 11/28/2017  | Text         |

Scenario: CRF_015_Checkout and verify questions data of flat questions in submitted CRF.
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt          | AnswerValue | AnswerFieldType |
	| Sample text question:   | Test        | Link            |
	| Sample select question: | Yes         | Link            |
	| Sample radio question:  | No          | Link            |
	And I click on "Cancel" button on "Form1" CRF.

Scenario: CRF_016_Verify Listbox and radio items of and un-submitted CRF and without checking out.
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	Then I Verify below "ListBox" items are displayed in "Sample select question:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Yes          |
	| No           |
	And I verify below "RadioGroup" items are displayed in "Sample radio question:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Yes          |
	| No           |

Scenario: CRF_017_Verify unavailable Listbox and radio items of and un-submitted CRF and without checking out.
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	Then I Verify below "ListBox" items are not displayed in "Sample select question:" on the CRF.
	| ItemToVerify |
	| [NoBlank]    |
	| Yes          |
	And I verify below "RadioGroup" items are not displayed in "Sample radio question:" on the CRF.
	| ItemToVerify |
	| [NoBlank]    |
	| Yes          |

Scenario: CRF_018_Verify table questions data in submitted form and without checking out.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	Then I verify below "Key Sequence on question #2.  Table Structure is fixed.  Maximum Rows is not exact.  Questions (4-7) are derives.:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Race:          | Asian       | Text            |                  |
	| 1         | Gender:        | Male        | Text            | OK               |
	| 4         | Race:          | Asian       | Text            |                  |
	| 4         | Gender:        | Male        | Text            | OK               |

Scenario: CRF_019_Verify table questions data in submitted form and checking out.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form03" CRF.
	When I click "Checkout" button on "AutoBuild Form03" CRF.
	Then I verify below "Key Sequence is on question #1.  Question (4 & 7) are derives.  Table structure is open.  Maximum Table Rows are 5.:" table questions data in the CRF.
	| RowNumber | QuestionPrompt            | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Race:                     | [Blank]     | ListBox         |                  |
	| 1         | Region of body:           | Head        | ListBox         |                  |
	| 1         | Row Count on Table above: | 0           | TextBox         |                  |
	| 1         | Form03 Created Date:      | 12/22/2017  | TextBox         | Cancel Row       |
	And I click on "Cancel" button on "AutoBuild Form03" CRF.

Scenario: CRF_020_Verify available listbox and radio items of unsubmitted CRF.
	Given I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	When I click "Checkout" button on "Form 6" CRF.
	And I click on "Add New Row" button in "Table with All Data Types:" table.
	Then I verify below "ListBox" items are displayed for "Select:" question in row "2" of "Table with All Data Types:" table.
	| ItemToVerify |
	| [Blank]      |
	| Yes          |
	| No           |
	And I verify below "RadioGroup" items are displayed for "Radio (PDE Verify Only):" question in row "2" of "Table with All Data Types:" table.
	| ItemToVerify |
	| [Blank]      |
	| Yes          |
	| No           |
	And I click on "Cancel" button on "Form 6" CRF.

Scenario: CRF_021_Verify available listbox and radio items of unsubmitted CRF.
	Given I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	When I click "Checkout" button on "Form 6" CRF.
	And I click on "Add New Row" button in "Table with All Data Types:" table.
	Then I verify below "ListBox" items are not displayed for "Select:" question in row "2" of "Table with All Data Types:" table.
	| ItemToVerify |
	| [NoBlank]    |
	| Yesabc       |
	And I verify below "RadioGroup" items are not displayed for "Radio (PDE Verify Only):" question in row "2" of "Table with All Data Types:" table.
	| ItemToVerify |
	| [NoBlank]    |
	| Yesabc       |
	And I click on "Cancel" button on "Form 6" CRF.

Scenario: CRF_022_Fill values for submitted questions in CRF.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt          | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample text question:   | Text               | TextBox         | TextN          | DCF             | Test            |
	| Sample radio question:  | No                 | Radio           | Yes            | SOR             |                 |
	| Sample select question: | No                 | ListBox         | Yes            | SOR             | Updated         |
	And I enter below "Sample Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	| No        | 1         | Drug Name:     | Test Drug          | TextBox         | Test Drug1     | SOR             |                 |                  |
	| No        | 1         | Start Date:    | 01/01/2000         | TextBox         | 01/01/2002     | DCF             | Test            | Cancel Row       |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: CRF_023_Fill values in submitted questions of a Form with Autobuild table (fixed) questions.
	Given I expand "Visit (Week 20)" to select and open "Autobuild Fixed 1" CRF.
	When I click "Checkout" button on "Autobuild Fixed 1" CRF.
	And I enter below "First auto build table (max rows: 6, structure: fixed):" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                                              | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	| No        | 1         | Gender question (male or female):                                           | Male               | ListBox         | Female         | DCF             | Notes           |                  |
	| No        | 1         | Non-key sequence code list (inches or centimeters):                         | cm                 | Radio           | in             | SOR             |                 | Save & Close Row |
	| No        | 3         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12             | TextBox         | 170.12         | DCF             |                 | Cancel Row       |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Autobuild Fixed 1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: CRF_024_Add Comments to flat questions on a CRF.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	#When I click "Checkout" button on "Form1" CRF.
	Then I add comments to flat questions in the CRF.
	| QuestionPrompt         | CommentsToAdd |
	| Sample text question:  | Text Comment  |
	| Sample radio question: | radio comment |
	
Scenario: CRF_025_Add Comments to table questions on a CRF.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	Then I add comments to questions of table "Sample Table:" in the CRF.
	| RowNumber | QuestionPrompt | CommentsToAdd | RowButtonToClick |
	| 1         | Drug Name:     | Comment 1.1   |                  |
	| 1         | Condition:     | Comment 1.2   | OK               |
	| 2         | Condition:     | Comment 2.1   | OK               |

Scenario: CRF_026_Verify items of a submitted flat question on a CRF.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I click on "[Blank]" answer value link for flat question "Sample select question:".
	Then I Verify below "ListBox" items are displayed in "Sample select question:" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Yes          |
	| No           |

Scenario: CRF_027_Verify items of a submitted table question on a CRF.
	Given I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I click on "[Blank]" answer value link for table "Table with All Data Types:" question "Select:" in row "1".
	Then I verify below "ListBox" items are displayed for "Select:" question in row "1" of "Table with All Data Types:" table.
	| ItemToVerify |
	| [Blank]      |
	| Yes          |
	| No           |