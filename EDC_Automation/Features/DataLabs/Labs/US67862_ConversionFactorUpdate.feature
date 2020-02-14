Feature: US67862_ConversionFactorUpdate

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page	 

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Import_US61472_Base1.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header

Scenario: 10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 11_Add a new lab test reference range record under Lab01 and Test 01
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	 | 02/03/2019 | 03/03/2022 | Male   | =             | 20         | =           | 35       | =                    | 3                 | =                     | 15                 | =                      | 2.41                | =                       | 25.71                | 01   | Yes |
	 | 03/04/2022 | 05/03/2025 | Male   | =             | 20         | =           | 35       | =                    | 5                 | =                     | 10                 | =                      | 2.41                | =                       | 25.71                | 02   | Yes |
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |
	| {ReferenceRangeID2} |

Scenario: 13_Navigate to site and select patient 
	Given I navigate to "Patients" tab from main menu.
     When I select the site "01-Site" from Sites dropdown.     
      And I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Enter data on Demographics form
Scenario: 14_Expand the Visit (Screening) and open the demographics form to update the data
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 31          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

#Enter data on Lab form
Scenario: 15_Expand the Visit (Week2) event and open the LabForm1 form and update the data
	  When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
      And I click "Checkout" button on "LabForm1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 02/28/2019  | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm1" CRF.	  
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 16_Verify the Lab report data
		When I collapse event "Visit (Week 2)" in PatientPortal	 	 
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	  	 
		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRFLabTestName                       | Test1       | Text            |                  |
		| 2         | LabTestDescription                   | 01          | Text            |                  |
		| 2         | CRF Lab Unit                         | 01          | Text            |                  |
		| 2         | CRF Lab value                        | 16          | Text            |                  |
		| 2         | LabTestName                          | 01          | Text            |                  |
		| 2         | LabTestCode                          | 01          | Text            |                  |
		| 2         | LOINCCode                            | 11          | Text            |                  |
		| 2         | Category                             | cup1        | Text            |                  |
		| 2         | Subcategory                          | subcup1     | Text            |                  |
		| 2         | Specimen                             | speccup1    | Text            |                  |
		| 2         | Method                               | Metcup1     | Text            |                  |
		| 2         | ResultType                           | Rescup1     | Text            |                  |
		| 2         | NormalReferenceRangeHigh             | 15.00       | Text            |                  |
		| 2         | CriticalReferenceRangeLow            | 2.41        | Text            |                  |
		| 2         | NormalReferenceRangeLow              | 3.00        | Text            |                  |
		| 2         | CriticalReferenceRangeHigh           | 25.71       | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | Yes         | Text            |                  |
		| 2         | NormalizedPatientLabValue            | 144.00      | Text            |                  |
		| 2         | NormalizedLabUnit                    | 01          | Text            |                  |
		| 2         | NormalizedReferenceRangeLow          | 27.00       | Text            |                  |
		| 2         | NormalizedNormalReferenceRangeHigh   | 135.00      | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeLow  | 21.69       | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | Yes         | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeHigh | 231.39      | Text            |                  |
		| 2         | Precision                            | 2           | Text            |                  |
		| 2         | ConversionFactor                     | 9           | Text            | OK               |
		#| 2         | ReferenceRangeID                     | {ReferenceRangeID1} | Text            | 