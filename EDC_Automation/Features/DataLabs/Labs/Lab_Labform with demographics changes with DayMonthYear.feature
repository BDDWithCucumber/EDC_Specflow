Feature: US61714-Assign Reference Range - Day, Month, Year-Labform Changes
	
Labs_DL: Re-associate Reference Range to a Patient Lab Value (Day,Month,Year & Gender change)_Item History
System shall recalculate Reference ranges for all lab questions on LabForm and History shall be displayed as expected.

Lab Test Questions on LabForm CRF:

1.	Lab Test Name
2.	Test Description
3.	Lab Value- No history -Input fields
4.	Lab (Original) Unit- No History-Input fields
5.	Lab Test Name
6.	Lab Test Code
7.	LOINC Code
8.	Category
9.	Sub Category
10.	Specimen
11.	Method
12.	Result Type
13.	Normal Reference range low 
14.	Normal Reference range high 
15.	Critical Reference range low 
16.	Critical Reference range high
17.	Reference Range Not Applicable
18.	Reference range Id
19.	Out of Normal Range Indicator
20.	Normalized Patient Lab Value
21.	Normalized Lab unit
22.	Normalized Normal Reference range low 
23.	Normalized Normal Reference range high 
24.	Normalized Critical Reference range low 
25.	Normalized Critical Reference range high
26.	Precision
27.	Conversion Factor


@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

#Recalculate Reference Range values  with Gender, Age, Age Unit changes for DOB as Day, Month and Year.

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base1_DayMonthYear.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header

Scenario: 04_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 10/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 05_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 10/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 06_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Add RR records in RR screen
Scenario: 07_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |
	| {ReferenceRangeID2} |

Scenario: 08_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: 09_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | AnswerValue | AnswerFieldType |
      | Gender:        | Male        | ListBox         |
      | Day            | 28          | TextBox         |
      | Month          | JAN         | TextBox         |
      | Year           | 2000        | TextBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 10_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 10/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

 Scenario: 11_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
	#	| 2         | Reference Range ID                       | {ReferenceRangeID3} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 12_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Link            |                  |
		| 2         | Lab Test Description                     | HEM1                | Link            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Link            |                  |
		| 2         | CRF Lab value                            | 15                  | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		#| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 13_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Year:          | 2000               |      1945      | DCF             |                 | TextBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 14_View-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And  I expand row "2" of table "Autobuild Table:"     
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
			| RowNumber | QuestionPrompt                           | AnswerValue        | AnswerFieldType | RowButtonToClick |
			| 2         | CRF Lab Test Name                        | Test1              | Text            |                  |
			| 2         | Lab Test Description                     | HEM1               | Text            |                  |
			| 2         | CRF Lab Unit                             | 03                 | Text            |                  |
			| 2         | CRF Lab value                            | 15                 | Text            |                  |
			| 2         | Lab Test Name                            | HEMOGLOBIN1        | Text            |                  |
			| 2         | Lab Test Code                            | 1                  | Text            |                  |
			| 2         | LOINC Code                               | 123                | Text            |                  |
			| 2         | Category                                 | RBC1               | Text            |                  |
			| 2         | Subcategory                              | Serum1             | Text            |                  |
			| 2         | Specimen                                 | Automated1         | Text            |                  |
			| 2         | Method                                   | Quantitative1      | Text            |                  |
			| 2         | Result Type                              | g/dl               | Text            |                  |
			| 2         | Normal Reference Range Low               | [Blank]            | Text            |                  |
			| 2         | Normal Reference Range High              | [Blank]            | Text            |                  |
			| 2         | Critical Reference Range High            | [Blank]            | Text            |                  |
			| 2         | Critical Reference Range Low             | [Blank]            | Text            |                  |
			 #         | 2                                        | Reference Range ID | [Blank]         | Text             |  
			| 2         | Out of Normal Range Indicator            | [Blank]            | Text            |                  |
			| 2         | Normalized Patient Lab Value             | [Blank]            | Text            |                  |
			| 2         | Normalized Lab Unit                      | 3Unit              | Text            |                  |
			| 2         | Normalized Normal Reference Range Low    | [Blank]            | Text            |                  |
			| 2         | Normalized Normal Reference Range High   | [Blank]            | Text            |                  |
			| 2         | Normalized Critical Reference Range Low  | [Blank]            | Text            |                  |
			| 2         | Reference Range Not Applicable           | [Blank]            | Text            |                  |
			| 2         | Normalized Critical Reference Range High | [Blank]            | Text            |                  |
			| 2         | Precision                                | 2                  | Text            |                  |
			| 2         | Conversion Factor                        | [Blank]            | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

 Scenario: 15_Checkout-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF. 
	  And  I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue        | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1              | Text            |                  |
		| 2         | Lab Test Description                     | HEM1               | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                 | Text            |                  |
		| 2         | CRF Lab value                            | 15                 | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1        | Text            |                  |
		| 2         | Lab Test Code                            | 1                  | Text            |                  |
		| 2         | LOINC Code                               | 123                | Text            |                  |
		| 2         | Category                                 | RBC1               | Text            |                  |
		| 2         | Subcategory                              | Serum1             | Text            |                  |
		| 2         | Specimen                                 | Automated1         | Text            |                  |
		| 2         | Method                                   | Quantitative1      | Text            |                  |
		| 2         | Result Type                              | g/dl               | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]            | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]            | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]            | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]            | Text            |                  |
		 #         | 2                                        | Reference Range ID | [Blank]         | Text             |  
		| 2         | Out of Normal Range Indicator            | [Blank]            | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]            | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit              | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]            | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]            | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]            | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]            | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]            | Text            |                  |
		| 2         | Precision                                | 2                  | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]            | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 16_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Day:           | 28                 |                | DCF             |                 | TextBox         |
      | Month:         | JAN                | 05             | DCF             |                 | TextBox         |
      | Year:          | 1945               | 1990           | DCF             |                 | TextBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 17_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		#| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 18_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Link            |                  |
		| 2         | Lab Test Description                     | HEM1                | Link            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Link            |                  |
		| 2         | CRF Lab value                            | 15                  | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		#| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 19_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Day:           | 28                 | 01             | DCF             |                 | TextBox         |
      | Month:         | 05                 |                | DCF             |                 | ListBox         |
       And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 20_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		#| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 21_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Day:           | 01                 |                | DCF             |                 | TextBox         |
      | Year:          | 1990               |                | DCF             |                 | TextBox        |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 22_View-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And  I expand row "2" of table "Autobuild Table:"     
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue        | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1              | Text            |                  |
		| 2         | Lab Test Description                     | HEM1               | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                 | Text            |                  |
		| 2         | CRF Lab value                            | 15                 | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1        | Text            |                  |
		| 2         | Lab Test Code                            | 1                  | Text            |                  |
		| 2         | LOINC Code                               | 123                | Text            |                  |
		| 2         | Category                                 | RBC1               | Text            |                  |
		| 2         | Subcategory                              | Serum1             | Text            |                  |
		| 2         | Specimen                                 | Automated1         | Text            |                  |
		| 2         | Method                                   | Quantitative1      | Text            |                  |
		| 2         | Result Type                              | g/dl               | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]            | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]            | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]            | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]            | Text            |                  |
		 #         | 2                                        | Reference Range ID | [Blank]         | Text             |  
		| 2         | Out of Normal Range Indicator            | [Blank]            | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]            | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit              | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]            | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]            | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]            | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]            | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]            | Text            |                  |
		| 2         | Precision                                | 2                  | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]            | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

 Scenario: 23_Checkout-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF. 
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue        | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1              | Text            |                  |
		| 2         | Lab Test Description                     | HEM1               | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                 | Text            |                  |
		| 2         | CRF Lab value                            | 15                 | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1        | Text            |                  |
		| 2         | Lab Test Code                            | 1                  | Text            |                  |
		| 2         | LOINC Code                               | 123                | Text            |                  |
		| 2         | Category                                 | RBC1               | Text            |                  |
		| 2         | Subcategory                              | Serum1             | Text            |                  |
		| 2         | Specimen                                 | Automated1         | Text            |                  |
		| 2         | Method                                   | Quantitative1      | Text            |                  |
		| 2         | Result Type                              | g/dl               | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]            | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]            | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]            | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]            | Text            |                  |
		#         | 2                                        | Reference Range ID | [Blank]         | Text             |  
		| 2         | Out of Normal Range Indicator            | [Blank]            | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]            | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit              | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]            | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]            | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]            | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]            | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]            | Text            |                  |
		| 2         | Precision                                | 2                  | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]            | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 24_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Year:          |                    | 1990           | DCF             |                 | Textbox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 25_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Link            |                  |
		| 2         | Lab Test Description                     | HEM1                | Link            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Link            |                  |
		| 2         | CRF Lab value                            | 15                  | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		#| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 26_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Day:           | 28                 | 01             | DCF             |                 | TextBox         |
      | Month:         | 05                 |                | DCF             |                 | Textbox         |
       And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 27_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		#| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

	Scenario: 28_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page