Feature: DataLabs_V5.8.0_Labs_Normal Range indicator
	Test Summary: US60237, US58183, US58185

	1. Out of Normal Range Indicator shall be evaluated and visually indicated on eCRF if it is mapped on Lab Mappings and added as a eCRF question.
	2. Out of Normal Range Indicator shall be evaluated  if it is mapped on Lab Mappings.
	3. Out of Normal Range Indicator shall NOT be visually indicated on eCRF if it is not a eCRF question.
	4. Out of Normal Range Indicator shall be evaluated if there is a change in subject demographics.
	5. Out of Normal Range Indicator shall be evaluated if the lab association is updated.
	6. Out of Normal Range Indicator shall be evaluated if the Reference Range validation is modified.
	7. Indication types will be displayed in Database if it is not mapped to a eCRF question.    

	Indication types:
			- Below Normal Reference Range Low
			- Above Normal Reference Range High
			- No

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Labs_NormalRangeIndicator.zip" with study label "Test4500_CodleistLinkages_Base"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 

Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	Then I see site "01-Site" in SiteManagementPage
	And I see site "02-Site" in SiteManagementPage

Scenario: 05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: 06_Assign testadmin testadmin user to 02-Site
	When I click breadcrumb "Site Management"
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "02-Site"

Scenario: 07_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |

Scenario: 08_Associate Labs L01,L02 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L02   | Lab02          | PFIZER  | RD         | Active           |

###### Create MRR for the Lab01 under Test 01

Scenario: 09_Add a new lab test reference range record under Lab01
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 02/03/2025 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 2.41               | <                       | 25.71                | 02   | False |
	 | 02/25/2019 | 02/03/2025 | Female | >             | 20         | <           | 35       | >                    | 5                 | <                     | 10                 | >                      | 2.41               | <                       | 25.71                | 02   | False |
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |
	| {ReferenceRangeID2} |

Scenario: 10_Add a new lab test reference range record under Lab02
	 Given I click breadcrumb "Manage Reference Ranges"
     When I open lab with labid "L02" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 02/03/2025 | Male   | >             | 20         | <           | 35       | >                    | 5                 | <                     | 17                 | >                      | 2.41               | <                       | 25.71                | 02   | False |
	 | 02/25/2019 | 02/03/2025 | Female | >             | 20         | <           | 35       | >                    | 4                 | <                     | 12                 | >                      | 2.41               | <                       | 25.71                | 02   | False |
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID3} |
	| {ReferenceRangeID4} |


Scenario: 11_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 02/02/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 12_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 02/02/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

###### Submit Demographics_RTSM.
Scenario: 13_Expand the Visit (Screening) event and open the Demographics RTSM form and submit the form data.
	  Given I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Date of Birth:            | 08/09/1990  | TextBox         |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 14_Expand the Visit (Week 2) event and open the LabForm1 form and submit the form data.
	  Given I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
      When I click "Checkout" button on "LabForm1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt       | AnswerValue | AnswerFieldType |
      | Lab ID               | Lab01 (L01)  | ListBox         |
      | Lab ID1              | L01          | TextBox         |
      | CRF Collection Date  | 05/21/2019  | TextBox         |
      | CRF Collection Date1 | 05/21/2019  | TextBox         |
	  And I click on "Save" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 15_Checkout the CRF LabForm1 and Select the Row 2 of 	Autobuild Table: and Submit the row
	When I click "Checkout" button on "LabForm1" CRF.  
	And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 1         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 1         | CRF Lab Unit   | gm/dL       | ListBox         | Save & Close Row |
	And I click on "Save" button on "LabForm1" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
# Above Normal Range High indicator - non eCRF Question
	@ObjectiveEvidence @ReqID:
Scenario: 16_Verify the Database for Above Normal Range High indicator.
	When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=1".
	Then The below result should be retrieved.
         | DataValue              |
         | 01                      |
         | 01                      |
         | 1                       |
         | Cat1                    |
         | SubCat1                 |
         | Specimen1               |
         | Method1                 |
         | Result1                 |
         | > 3.00                  |
         | < 15.00                 |
         | > 20.41                 |
         | < 25.71                 |
         | Above normal range high |
         | 16                      |
         | cm                      |
         | > 3.00                  |
         | < 15.00                 |
         | > 20.41                 |
         | < 25.71                 |
         | 2                       |
         | 1                       |

	@ObjectiveEvidence @ReqID:US60237
Scenario: 17_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 1
	When I expand row "1" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:".

# No Normal Range indicator - non eCRF Question
Scenario: 18_Update the Value to 14 for CRF Lab value and save the form
	When I click "Checkout" button on "LabForm1" CRF.  
	And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
	  | No        | 1         | CRF Lab value  | 16                 | 14             | SOR             | TextBox         | Save & Close Row |
	And I click on "Save" button on "LabForm1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:US60237
Scenario: 19_Verify the Database for No indicator
	When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=1".
	Then The below result should be retrieved.
         | DataValue |
         | 01        |
         | 01        |
         | 1         |
         | Cat1      |
         | SubCat1   |
         | Specimen1 |
         | Method1   |
         | Result1   |
         | > 3.00    |
         | < 15.00   |
         | > 20.41   |
         | < 25.71   |
         | No        |
         | 14        |
         | cm        |
         | > 3.00    |
         | < 15.00   |
         | > 20.41   |
         | < 25.71   |
         | 2         |
         | 1         |
# Below Normal Range Low indicator - non eCRF Question
Scenario: 20_Update the Value to 2 for CRF Lab value and save the form
	When I click "Checkout" button on "LabForm1" CRF.  
	And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
	  | No        | 1         | CRF Lab value  | 14                 | 2              | SOR             | TextBox         | Save & Close Row |
	And I click on "Save" button on "LabForm1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:
Scenario: 21_Verify the Database for Below Normal Range Low indicator
	When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=1".
	Then The below result should be retrieved.
         | DataValue              |
         | 01                     |
         | 01                     |
         | 1                      |
         | Cat1                   |
         | SubCat1                |
         | Specimen1              |
         | Method1                |
         | Result1                |
         | > 3.00                 |
         | < 15.00                |
         | > 20.41                |
         | < 25.71                |
         | Below normal range low |
         | 2                      |
         | cm                     |
         | > 3.00                 |
         | < 15.00                |
         | > 20.41                |
         | < 25.71                |
         | 2                      |
         | 1                      |

	@ObjectiveEvidence @ReqID:US60237
Scenario: 22_Below Normal Range Low Visual indicator is displayed for the question CRF Lab Value in row 1
	When I expand row "1" of table "Autobuild Table:"
	Then I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

Scenario: 23_update the CRF Lab value to 4
	When I click "Checkout" button on "LabForm1" CRF.  
	And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
	  | No        | 1         | CRF Lab value  | 2                  | 4              | SOR             | TextBox         | Save & Close Row |
	And I click on "Save" button on "LabForm1" CRF.
	Then The CRF with data is saved and checked-in successfully.

# Below Normal Range Low when Demographics Gender is changed
Scenario: 24_update the demographics Gender to Female
	When I click breadcrumb "01-PAT"
	And I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	And I click "Checkout" button on "Demographics RTSM" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
         | Gender:        | Male               | Female         | SOR             | ListBox         |
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:
Scenario: 25_Verify the Database for Below Normal Range Low indicator
	When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=1".
	Then The below result should be retrieved.
         | DataValue              |
         | 01                     |
         | 01                     |
         | 1                      |
         | Cat1                   |
         | SubCat1                |
         | Specimen1              |
         | Method1                |
         | Result1                |
         | > 5.00                 |
         | < 10.00                |
         | > 20.41                |
         | < 25.71                |
         | Below normal range low |
         | 4                      |
         | cm                     |
         | > 5.00                 |
         | < 10.00                |
         | > 20.41                |
         | < 25.71                |
         | 2                      |
         | 1                      |

	@ObjectiveEvidence @ReqID:US60237
Scenario: 26_Below Normal Range Low Visual indicator is displayed for the question CRF Lab Value in table
	When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	And I expand row "1" of table "Autobuild Table:"
	Then I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

# Out of Normal Range Indicator as No on eCRF Question
Scenario: 27_Update the form LabForm2 under Visit(Week 2)
	When I click breadcrumb "01-PAT"
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab02 (L02) | ListBox         |
      | CRF Collection Date | 05/21/2019  | TextBox         |
    And I enter below "Autobuild Table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         | No        | 1         | CRF Lab Unit   | gm/dL       | ListBox         |                  |
         | No        | 1         | CRF Lab value  | 11          | TextBox         | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:
Scenario: 28_Verify the "Out of Normal Range Indicator" is No
	When I expand row "1" of table "Autobuild Table:"
	Then I verify below "Autobuild Table:" table questions data in the CRF.
         | RowNumber | QuestionPrompt                | AnswerValue | AnswerFieldType | RowButtonToClick |
         | 1         | Out of Normal Range Indicator | No          | TEXT            |                  |

# Below Normal Range Low Visual Indicator on eCRF Question
Scenario: 29_Update the form LabForm2 under Visit(Week 2)
	When I click "Checkout" button on "LabForm2" CRF.  
    And I enter below "Autobuild Table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
         | No        | 1         | CRF Lab value  | 11                 | 4              | SOR             | TextBox         | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:US60237
Scenario: 30_Verify the value Above Normal Range High indicator for CRF Question "Out of Normal Range Indicator" under row 1
	When I expand row "1" of table "Autobuild Table:"
	Then I verify below "Autobuild Table:" table questions data in the CRF.
         | RowNumber | QuestionPrompt                | AnswerValue            | AnswerFieldType | RowButtonToClick |
         | 1         | Out of Normal Range Indicator | Below normal range low | TEXT            |                  |
	And I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

Scenario: 31_Update the form LabForm2 under Visit(Week 2)
	When I click "Checkout" button on "LabForm2" CRF.  
    And I enter below "Autobuild Table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
         | No        | 1         | CRF Lab value  | 4                  | 15             | SOR             | TextBox         | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:US60237
Scenario: 32_Verify the value Above Normal Range High indicator for CRF Question "Out of Normal Range Indicator" under row 1
	When I expand row "1" of table "Autobuild Table:"
	Then I verify below "Autobuild Table:" table questions data in the CRF.
         | RowNumber | QuestionPrompt                | AnswerValue             | AnswerFieldType | RowButtonToClick |
         | 1         | Out of Normal Range Indicator | Above normal range high | TEXT            |                  |
	And I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:".

# No Visual Indicator when Demographics Gender is changed for eCRF Question
Scenario: 33_update the demographics Gender to Female
	When I click breadcrumb "01-PAT"
	And I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	And I click "Checkout" button on "Demographics RTSM" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
         | Gender:        | Female             | Male           | SOR             | ListBox         |
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:
Scenario: 34_Verify the "Out of Normal Range Indicator" is No
	When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I expand row "1" of table "Autobuild Table:"
	Then I verify below "Autobuild Table:" table questions data in the CRF.
         | RowNumber | QuestionPrompt                | AnswerValue | AnswerFieldType | RowButtonToClick |
         | 1         | Out of Normal Range Indicator | No          | TEXT            |                  |

# Above Normal Range High visual indicator is displayed on eCRF Question when Lab association is changed
Scenario: 35_Change the Lab Association to Lab01 (L01) for LabForm2
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
      | Lab ID         | Lab02              | Lab01 (L01)    | SOR             | ListBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:US60237
Scenario: 36_Verify the Above Normal Range High indicator is displayed for LabForm2 question "Out of Normal Range indicator"
	When I expand row "1" of table "Autobuild Table:"
	Then I verify below "Autobuild Table:" table questions data in the CRF.
         | RowNumber | QuestionPrompt                | AnswerValue             | AnswerFieldType | RowButtonToClick |
         | 1         | Out of Normal Range Indicator | Above normal range high | TEXT            |                  |
	And I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:".

# Lab ID change for the Non eCRF question updates the Normal Reference Range Indicator	
Scenario: 37_Update the Lab ID for LabForm1 to Lab02 (L02)
	When I click breadcrumb "01-PAT"
	And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
    When I click "Checkout" button on "LabForm1" CRF.      
    And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
      | Lab ID         | Lab01              | Lab02 (L02)    | SOR             | ListBox         |
	And I click on "Save" button on "LabForm1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:
Scenario: 38_Verify the database for Below normal range low indicator
	When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=1".
	Then The below result should be retrieved.
         | DataValue              |
         | 01                     |
         | 01                     |
         | 1                      |
         | Cat1                   |
         | SubCat1                |
         | Specimen1              |
         | Method1                |
         | Result1                |
         | > 5.00                 |
         | < 17.00                |
         | > 20.41                |
         | < 25.71                |
         | Below normal range low |
         | 4                      |
         | cm                     |
         | > 5.00                 |
         | < 17.00                |
         | > 20.41                |
         | < 25.71                |
         | 2                      |
         | 1                      |

	@ObjectiveEvidence @ReqID:US60237
Scenario: 39_Verify the Below Normal Range Low indicator
	When I expand row "1" of table "Autobuild Table:"
	Then I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

# Normal Range Low update triggers Normal Range Indicator as No for a Non eCRF Question
Scenario: 40_Update the reference Range on Lab02
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click on "Edit" icon for the reference range "{ReferenceRangeID3}" in ReferenceRangesPage.
    And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| NormalRangeLowSet |
	| 3                 |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage
	@ObjectiveEvidence @ReqID:
Scenario: 41_Verify the database for No Normal Range Indicator
	When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=1".
	Then The below result should be retrieved.
         | DataValue |
         | 01        |
         | 01        |
         | 1         |
         | Cat1      |
         | SubCat1   |
         | Specimen1 |
         | Method1   |
         | Result1   |
         | > 3.00    |
         | < 17.00   |
         | > 20.41   |
         | < 25.71   |
         | No        |
         | 4         |
         | cm        |
         | > 3.00    |
         | < 17.00   |
         | > 20.41   |
         | < 25.71   |
         | 2         |
         | 1         |

# Normal Range Low/High value update triggers Normal Range Indicator for a eCRF Question
Scenario: 42_Update the reference Range on Lab01
Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click on "Edit" icon for the reference range "{ReferenceRangeID1}" in ReferenceRangesPage.
    And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| NormalRangeLowSet | NormalRangeHighSet |
	| 16                | 18                 |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

	@ObjectiveEvidence @ReqID:
Scenario: 43_Verify the out of normal range indicator for LabForm2
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
	When I select "01-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	When I expand row "1" of table "Autobuild Table:"
	Then I verify below "Autobuild Table:" table questions data in the CRF.
         | RowNumber | QuestionPrompt                | AnswerValue            | AnswerFieldType | RowButtonToClick |
         | 1         | Out of Normal Range Indicator | Below normal range low | TEXT            |                  |
	And I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".