Feature: DataLabs_V5.8.0_ReassociateReferenceRange_LabDataChange
	Test Summary: US58098, US58186, US59251
	System shall associate/re-evaluate the reference range for a lab value when any of the below attributes are changed on eCRF and saved:
	Lab ID
	CRF Collection Date
	CRF Lab Test Name
	CRF Lab Value
	CRF Lab (Original) Unit
	System shall make a call to Lab API which will re-evaluate associated Reference Range record and associate matching record.
	Update of Reference Range Records shall happen asynchronously after form save. I can view updated reference ranges when form is accessed again.
	If Reference Ranges are added as questions & mapped on Lab Mappings, Re-evaluated Reference Ranges shall be displayed on eCRF.
	If Reference Ranges are not added as questions but mapped on Lab Mappings, Re-evaluated Reference Ranges shall not be displayed on eCRF.

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "TestLabs_Dictionary.zip" with study label "TestLabs_Data"
    Then I see study label "TestLabs_Data" in header 

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
	And I click Link "Manage Laboratories" In StudyAdministrationPage
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
	And I click breadcrumb "Site Management"
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L02   | Lab02          | PFIZER  | RD         | Active           |

Scenario: 09_01_Add a new lab test reference range record under Lab01 under WBC
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "WBC" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	 | 02/03/2019 | 03/03/2022 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 1.41               | <                       | 25.71                | µL    | False |
	 | 03/04/2022 | 05/03/2025 | Male   | >             | 20         | <           | 35       | >                    | 5                 | <                     | 10                 | >                      | 1.41               | <                       | 25.71                | gm/dL | False |
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |
	| {ReferenceRangeID2} |

Scenario: 09_02_Add a new lab test reference range record under Lab01 under RBC
	 When I click breadcrumb "Lab01(L01)"
	 And I open labtest with labname "RBC" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/03/2019 | 03/03/2022 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 1.41                | <                       | 25.71                | fL   | False |
	 | 03/04/2022 | 05/03/2025 | Male   | >             | 20         | <           | 35       | >                    | 5                 | <                     | 10                 | >                      | 1.41                | <                       | 25.71                | pg   | False |
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID3} |
	| {ReferenceRangeID4} |

Scenario: 10_01_Add a new lab test reference range record under Lab02 under RBC
	 Given I click breadcrumb "Manage Reference Ranges"
     When I open lab with labid "L02" from ManageReferenceRanges page
	 And I open labtest with labname "RBC" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/03/2019 | 03/03/2022 | Male   | >             | 20         | <           | 35       | >                    | 5                 | <                     | 17                 | >                      | 1.41               | <                       | 25.71                | fL   | False |
	 | 03/04/2022 | 05/03/2025 | Male   | >             | 20         | <           | 35       | >                    | 4                 | <                     | 12                 | >                      | 1.41               | <                       | 25.71                | pg   | False |
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID5} |
	| {ReferenceRangeID6} |

Scenario: 10_02_Add a new lab test reference range record under Lab02 under WBC
	 When I click breadcrumb "Lab02(L02)"
	 And I open labtest with labname "WBC" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	 | 02/03/2019 | 03/03/2022 | Male   | >             | 20         | <           | 35       | >                    | 5                 | <                     | 17                 | >                      | 1.41               | <                       | 25.71                | µL    | False |
	 | 03/04/2022 | 05/03/2025 | Male   | >             | 20         | <           | 35       | >                    | 4                 | <                     | 12                 | >                      | 1.41               | <                       | 25.71                | gm/dL | False |
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID7} |
	| {ReferenceRangeID8} |

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
	  And I click on "Save" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 14_Update the Flat questions in form LabForm2 under Visit(Week 2)
	When I click breadcrumb "01-PAT"
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 05/22/2024  | TextBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.

@ObjectiveEvidence @ReqID:
Scenario: 15_Update the WBC questions in form LabForm2 under Visit(Week 2)
	When I click "Checkout" button on "LabForm2" CRF.  
    And I enter below "Autobuild Table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         | No        | 1         | CRF Lab Unit   | gm/dL       | ListBox         |                  |
         | No        | 1         | CRF Lab value  | 11          | TextBox         | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                     | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC                     | TEXT            |                  |
		| 1         | CRF Lab Unit                             | gm/dL                   | TEXT            |                  |
		| 1         | CRF Lab value                            | 11                      | TEXT            |                  |
		| 1         | Lab Test Name                            | WBC                     | TEXT            |                  |
		| 1         | Lab Test Code                            | 01                      | TEXT            |                  |
		| 1         | LOINC Code                               | 1                       | TEXT            |                  |
		| 1         | Category                                 | Cat1                    | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1                 | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1               | TEXT            |                  |
		| 1         | Method                                   | Method1                 | TEXT            |                  |
		| 1         | Result Type                              | Result1                 | TEXT            |                  |
		| 1         | Normal Reference Range High              | < 10.00                 | TEXT            |                  |
		| 1         | Critical Reference Range Low             | > 1.41                 | TEXT            |                  |
		| 1         | Normal Reference Range Low               | > 5.00                  | TEXT            |                  |
		| 1         | Critical Reference Range High            | < 25.71                 | TEXT            |                  |
#		| 1         | Reference Range ID                       | {ReferenceRangeID2}     | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | 11                      | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | > 5.00                  | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | < 10.00                 | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | > 1.41                 | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | No                      | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | < 25.71                 | TEXT            |                  |
		| 1         | Precision                                | 2                       | TEXT            |                  |
		| 1         | Conversion Factor                        | 1                       | TEXT            |                  |


# CRF Lab Unit Update
@ObjectiveEvidence @ReqID:
Scenario: 16_Update the CRF Lab Unit question to remove reference ranges to questions in WBC test in form LabForm2 under Visit(Week 2)
	When I click "Checkout" button on "LabForm2" CRF.  
    And I enter below "Autobuild Table:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab Unit   | gm/dL              | µL             | SEC             | ListBox         | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                     | TEXT                |                  |
		| 1         | Lab Test Description                     | [Blank]                 | TEXT                |                  |
		| 1         | CRF Lab Unit                             | µL                      | TEXT                |                  |
		| 1         | Lab Test Name                            | WBC                     | TEXT                |                  |
		| 1         | CRF Lab value                            | 11                      | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                      | TEXT                |                  |
		| 1         | LOINC Code                               | 1                       | TEXT                |                  |
		| 1         | Category                                 | Cat1                    | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1                 | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1               | TEXT                |                  |
		| 1         | Method                                   | Method1                 | TEXT                |                  |
		| 1         | Result Type                              | Result1                 | TEXT                |                  |
		| 1         | Normal Reference Range High              | [Blank]                 | TEXT                |                  |
		| 1         | Critical Reference Range Low             | [Blank]                 | TEXT                |                  |
		| 1         | Normal Reference Range Low               | [Blank]                 | TEXT                |                  |
		| 1         | Critical Reference Range High            | [Blank]                 | TEXT                |                  |
		 #         | 1                                        | Reference Range ID      | {ReferenceRangeID2} | TEXT             |
		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]                 | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | [Blank]                 | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | [Blank]                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | [Blank]                 | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                      | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | [Blank]                 | TEXT                |                  |
		| 1         | Precision                                | 2                       | TEXT                |                  |
		| 1         | Conversion Factor                        | [Blank]                 | TEXT                |                  |


#CRF Collection Date Update RR
#Normalized lab value on eCRF
@ObjectiveEvidence @ReqID:
Scenario: 17_Update the CRF Collection Date to re associate reference ranges to questions in WBC test in form LabForm2 under Visit(Week 2)
	When I click breadcrumb "01-PAT"
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
      | QuestionPrompt      | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
      | CRF Collection Date | 05/22/2024         | 05/22/2020     | SEC             | TextBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC                 | TEXT            |                  |
	| 1         | Lab Test Description                     | WBC                 | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL                  | TEXT            |                  |
	| 1         | CRF Lab value                            | 11                  | TEXT            |                  |
	| 1         | Lab Test Name                            | WBC                 | TEXT            |                  |
	| 1         | Lab Test Code                            | 01                  | TEXT            |                  |
	| 1         | LOINC Code                               | 1                   | TEXT            |                  |
	| 1         | Category                                 | Cat1                | TEXT            |                  |
	| 1         | Subcategory                              | SubCat1             | TEXT            |                  |
	| 1         | Specimen                                 | Specimen1           | TEXT            |                  |
	| 1         | Method                                   | Method1             | TEXT            |                  |
	| 1         | Result Type                              | Result1             | TEXT            |                  |
	| 1         | Normal Reference Range High              | < 15.00             | TEXT            |                  |
	| 1         | Critical Reference Range Low             | > 1.41             | TEXT            |                  |
	| 1         | Normal Reference Range Low               | > 3.00              | TEXT            |                  |
	| 1         | Critical Reference Range High            | < 25.71             | TEXT            |                  |
#	| 1         | Reference Range ID                       | {ReferenceRangeID1} | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | No                  | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | 33                  | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | gm/dL               | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | > 9.00              | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | < 45.00             | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | > 61.23             | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | No                  | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | < 77.13             | TEXT            |                  |
	| 1         | Precision                                | 2                   | TEXT            |                  |
	| 1         | Conversion Factor                        | 3                   | TEXT            |                  |

#LabID Update RR
@ObjectiveEvidence @ReqID:
Scenario: 18_Update the LabID to Lab02(L02) to re associate reference ranges to questions in WBC test in form LabForm2 under Visit(Week 2)
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
      | Lab ID         | Lab01              | Lab02 (L02)    | SEC             | ListBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue        | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                | TEXT                |                  |
		| 1         | Lab Test Description                     | WBC                | TEXT                |                  |
		| 1         | CRF Lab Unit                             | µL                 | TEXT                |                  |
		| 1         | CRF Lab value                            | 11                 | TEXT                |                  |
		| 1         | Lab Test Name                            | WBC                | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                 | TEXT                |                  |
		| 1         | LOINC Code                               | 1                  | TEXT                |                  |
		| 1         | Category                                 | Cat1               | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1            | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1          | TEXT                |                  |
		| 1         | Method                                   | Method1            | TEXT                |                  |
		| 1         | Result Type                              | Result1            | TEXT                |                  |
		| 1         | Normal Reference Range High              | < 17.00            | TEXT                |                  |
		| 1         | Critical Reference Range Low             | > 1.41            | TEXT                |                  |
		| 1         | Normal Reference Range Low               | > 5.00             | TEXT                |                  |
		| 1         | Critical Reference Range High            | < 25.71            | TEXT                |                  |
		 #         | 1                                        | Reference Range ID | {ReferenceRangeID7} | TEXT             |  
		| 1         | Out of Normal Range Indicator            | No                 | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | 33                 | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL              | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | > 15.00            | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | < 51.00            | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | > 61.23            | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | < 77.13            | TEXT                |                  |
		| 1         | Precision                                | 2                  | TEXT                |                  |
		| 1         | Conversion Factor                        | 3                  | TEXT                |                  |
		
#CRF Lab Value Update
@ObjectiveEvidence @ReqID:
Scenario: 19_Update the CRF Lab Value to re associate reference ranges to questions in WBC test in form LabForm2 under Visit(Week 2)
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below "Autobuild Table:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab value  | 11                 | 18             | SEC             | TEXTBOX            | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                     | TEXT                |                  |
		| 1         | Lab Test Description                     | WBC                     | TEXT                |                  |
		| 1         | CRF Lab Unit                             | µL                      | TEXT                |                  |
		| 1         | CRF Lab value                            | 18                      | TEXT                |                  |
		| 1         | Lab Test Name                            | WBC                     | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                      | TEXT                |                  |
		| 1         | LOINC Code                               | 1                       | TEXT                |                  |
		| 1         | Category                                 | Cat1                    | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1                 | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1               | TEXT                |                  |
		| 1         | Method                                   | Method1                 | TEXT                |                  |
		| 1         | Result Type                              | Result1                 | TEXT                |                  |
		| 1         | Normal Reference Range High              | < 17.00                 | TEXT                |                  |
		| 1         | Critical Reference Range Low             | > 1.41                  | TEXT                |                  |
		| 1         | Normal Reference Range Low               | > 5.00                  | TEXT                |                  |
		| 1         | Critical Reference Range High            | < 25.71                 | TEXT                |                  |
		 #         | 1                                        | Reference Range ID      | {ReferenceRangeID7} | TEXT             |  
		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | 54                      | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | > 15.00                 | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | < 51.00                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | > 61.23                 | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                      | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | < 77.13                 | TEXT                |                  |
		| 1         | Precision                                | 2                       | TEXT                |                  |
		| 1         | Conversion Factor                        | 3                       | TEXT                |                  |

#MNA CRF Lab Value
@ObjectiveEvidence @ReqID:
Scenario: 20_Update the CRF Lab Value to MNA
	When I click "Checkout" button on "LabForm2" CRF.  
	And I expand row "1" of table "Autobuild Table:"
	And I click "icon_mna_disabled.png" icon of a question "CRF Lab value" of table "Autobuild Table:"
    And I enter comments "MNA CRF Lab value" in MarkItemDialog 
    And I click ok button in MarkItemDialog
	And I click table row button "Save & Close Row" of table "Autobuild Table:"
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                 | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC                 | TEXT            |                  |
		| 1         | CRF Lab Unit                             | µL                  | TEXT            |                  |
		| 1         | CRF Lab value                            | icon_mna.png        | IMAGE           |                  |
		| 1         | Lab Test Name                            | WBC                 | TEXT            |                  |
		| 1         | Lab Test Code                            | 01                  | TEXT            |                  |
		| 1         | LOINC Code                               | 1                   | TEXT            |                  |
		| 1         | Category                                 | Cat1                | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1             | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1           | TEXT            |                  |
		| 1         | Method                                   | Method1             | TEXT            |                  |
		| 1         | Result Type                              | Result1             | TEXT            |                  |
		| 1         | Normal Reference Range High              | < 17.00             | TEXT            |                  |
		| 1         | Critical Reference Range Low             | > 1.41             | TEXT            |                  |
		| 1         | Normal Reference Range Low               | > 5.00              | TEXT            |                  |
		| 1         | Critical Reference Range High            | < 25.71             | TEXT            |                  |
	#	| 1         | Reference Range ID                       | {ReferenceRangeID7} | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | [Blank]             | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]             | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL               | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | > 15.00             | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | < 51.00             | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | > 61.23             | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | No                  | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | < 77.13             | TEXT            |                  |
		| 1         | Precision                                | 2                   | TEXT            |                  |
		| 1         | Conversion Factor                        | 3                   | TEXT            |                  |

#MNA CRF Lab Unit
@ObjectiveEvidence @ReqID:
Scenario: 21_Update the CRF Lab Unit to MNA
	When I click "Checkout" button on "LabForm2" CRF.  
	And I expand row "1" of table "Autobuild Table:"
	And I click "icon_mna_disabled.png" icon of a question "CRF Lab Unit" of table "Autobuild Table:"
    And I enter comments "MNA CRF Lab Unit" in MarkItemDialog 
    And I click ok button in MarkItemDialog
	And I click table row button "Save & Close Row" of table "Autobuild Table:"
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                     | TEXT                |                  |
		| 1         | Lab Test Description                     | WBC                     | TEXT                |                  |
		| 1         | CRF Lab Unit                             | icon_mna.png            | IMAGE               |                  |
		| 1         | CRF Lab value                            | icon_mna.png            | IMAGE               |                  |
		| 1         | Lab Test Name                            | WBC                     | TEXT                |                  |
		| 1         | CRF Lab value                            | 11                      | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                      | TEXT                |                  |
		| 1         | LOINC Code                               | 1                       | TEXT                |                  |
		| 1         | Category                                 | Cat1                    | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1                 | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1               | TEXT                |                  |
		| 1         | Method                                   | Method1                 | TEXT                |                  |
		| 1         | Result Type                              | Result1                 | TEXT                |                  |
		| 1         | Normal Reference Range High              | [Blank]                 | TEXT                |                  |
		| 1         | Critical Reference Range Low             | [Blank]                 | TEXT                |                  |
		| 1         | Normal Reference Range Low               | [Blank]                 | TEXT                |                  |
		| 1         | Critical Reference Range High            | [Blank]                 | TEXT                |                  |
		| #         | 1                                        | Reference Range ID      | {ReferenceRangeID2} | TEXT             |
		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]                 | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | [Blank]                 | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | [Blank]                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | [Blank]                 | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                      | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | [Blank]                 | TEXT                |                  |
		| 1         | Precision                                | 2                       | TEXT                |                  |
		| 1         | Conversion Factor                        | [Blank]                 | TEXT                |                  |


#Update Lab Unit reasscoiate reference range values except Normalized Patient Lab Value and Out of Normal Range Indicator
@ObjectiveEvidence @ReqID:
Scenario: 22_Update CRF Lab Unit and Re associate the reference ranges except the Normalized Patient lab value and Out of Normal Range Indicator
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below "Autobuild Table:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab Unit   | µL                 | µL             | SEC             | ListBox         | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue        | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                | TEXT                |                  |
		| 1         | Lab Test Description                     | WBC                | TEXT                |                  |
		| 1         | CRF Lab Unit                             | µL                 | TEXT                |                  |
		| 1         | CRF Lab value                            | icon_mna.png       | IMAGE               |                  |
		| 1         | Lab Test Name                            | WBC                | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                 | TEXT                |                  |
		| 1         | LOINC Code                               | 1                  | TEXT                |                  |
		| 1         | Category                                 | Cat1               | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1            | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1          | TEXT                |                  |
		| 1         | Method                                   | Method1            | TEXT                |                  |
		| 1         | Result Type                              | Result1            | TEXT                |                  |
		| 1         | Normal Reference Range High              | < 17.00            | TEXT                |                  |
		| 1         | Critical Reference Range Low             | > 1.41             | TEXT                |                  |
		| 1         | Normal Reference Range Low               | > 5.00             | TEXT                |                  |
		| 1         | Critical Reference Range High            | < 25.71            | TEXT                |                  |
		 #         | 1                                        | Reference Range ID | {ReferenceRangeID1} | TEXT             |  
		| 1         | Out of Normal Range Indicator            | [Blank]            | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]            | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL              | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | > 15.00            | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | < 51.00            | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | > 61.23            | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | < 77.13            | TEXT                |                  |
		| 1         | Precision                                | 2                  | TEXT                |                  |
		| 1         | Conversion Factor                        | 3                  | TEXT                |                  |

#Update CRF Lab value to reasscoiate reference range
@ObjectiveEvidence @ReqID:
Scenario: 23_Update CRF Lab value to reasscoiate reference ranges
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below "Autobuild Table:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab value  | [Blank]            | 5              | SEC             | TextBox         | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue            | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                    | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC                    | TEXT            |                  |
		| 1         | CRF Lab Unit                             | µL                     | TEXT            |                  |
		| 1         | CRF Lab value                            | 5                      | TEXT            |                  |
		| 1         | Lab Test Name                            | WBC                    | TEXT            |                  |
		| 1         | Lab Test Code                            | 01                     | TEXT            |                  |
		| 1         | LOINC Code                               | 1                      | TEXT            |                  |
		| 1         | Category                                 | Cat1                   | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1                | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1              | TEXT            |                  |
		| 1         | Method                                   | Method1                | TEXT            |                  |
		| 1         | Result Type                              | Result1                | TEXT            |                  |
		| 1         | Normal Reference Range High              | < 17.00                | TEXT            |                  |
		| 1         | Critical Reference Range Low             | > 1.41                | TEXT            |                  |
		| 1         | Normal Reference Range Low               | > 5.00                 | TEXT            |                  |
		| 1         | Critical Reference Range High            | < 25.71                | TEXT            |                  |
		#| 1         | Reference Range ID                       | {ReferenceRangeID1}    | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | Below normal range low | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | 15                     | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                  | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | > 15.00                 | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | < 51.00                | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | > 61.23                | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | No                     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | < 77.13                | TEXT            |                  |
		| 1         | Precision                                | 2                      | TEXT            |                  |
		| 1         | Conversion Factor                        | 3                      | TEXT            |                  |

#CRF Lab value clear item to remove values for Normalized Patient Lab Value and Out of Normal Range Indicator
@ObjectiveEvidence @ReqID:
Scenario: 24_Perform the CRF Lab value Clear Item to remove the reference ranges for Normalized Patient Lab Value and Out of Normal Range Indicator
	When I click "Checkout" button on "LabForm2" CRF.  
	And I expand row "1" of table "Autobuild Table:"
	And I clear question "CRF Lab value" of table "Autobuild Table:"
	And I enter notes "CRF Lab value cleared" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click table row button "Save & Close Row" of table "Autobuild Table:"
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue        | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                | TEXT                |                  |
		| 1         | Lab Test Description                     | WBC                | TEXT                |                  |
		| 1         | CRF Lab Unit                             | µL                 | TEXT                |                  |
		| 1         | CRF Lab value                            |                    | TEXTBox             |                  |
		| 1         | Lab Test Name                            | WBC                | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                 | TEXT                |                  |
		| 1         | LOINC Code                               | 1                  | TEXT                |                  |
		| 1         | Category                                 | Cat1               | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1            | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1          | TEXT                |                  |
		| 1         | Method                                   | Method1            | TEXT                |                  |
		| 1         | Result Type                              | Result1            | TEXT                |                  |
		| 1         | Normal Reference Range High              | < 17.00            | TEXT                |                  |
		| 1         | Critical Reference Range Low             | > 1.41             | TEXT                |                  |
		| 1         | Normal Reference Range Low               | > 5.00             | TEXT                |                  |
		| 1         | Critical Reference Range High            | < 25.71            | TEXT                |                  |
		#         | 1                                        | Reference Range ID | {ReferenceRangeID1} | TEXT             |  
		| 1         | Out of Normal Range Indicator            | [Blank]            | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]            | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL              | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | > 15.00            | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | < 51.00            | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | > 61.23            | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | < 77.13            | TEXT                |                  |
		| 1         | Precision                                | 2                  | TEXT                |                  |
		| 1         | Conversion Factor                        | 3                  | TEXT                |                  |

#CRF Lab Unit clear item to remove all reference range values
@ObjectiveEvidence @ReqID:
Scenario: 25_Perform the CRF Lab value Clear Item to remove all reference range values
	When I click "Checkout" button on "LabForm2" CRF.  
	And I expand row "1" of table "Autobuild Table:"
	And I clear question "CRF Lab Unit" of table "Autobuild Table:"
	And I enter notes "CRF Lab Unit cleared" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click table row button "Save & Close Row" of table "Autobuild Table:"
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC         | TEXT            |                  |
		| 1         | CRF Lab Unit                             | µL          | TEXT            |                  |
		| 1         | CRF Lab value                            |             | TEXTBox         |                  |
		| 1         | Lab Test Name                            | WBC         | TEXT            |                  |
		| 1         | Lab Test Code                            | 01          | TEXT            |                  |
		| 1         | LOINC Code                               | 1           | TEXT            |                  |
		| 1         | Category                                 | Cat1        | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1     | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1   | TEXT            |                  |
		| 1         | Method                                   | Method1     | TEXT            |                  |
		| 1         | Result Type                              | Result1     | TEXT            |                  |
		| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
		| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
		| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL       | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
		| 1         | Precision                                | 2           | TEXT            |                  |
		| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |

#Update both CRF Lab value and CRF Lab Unit to Reassociate the reference range values
@ObjectiveEvidence @ReqID:
Scenario: 26_Update both CRF Lab value and CRF Lab Unit to Reassociate the reference range values
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below "Autobuild Table:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab Unit   | gm/dL       | ListBox         |                  |
        | No        | 1         | CRF Lab value  | 19           | TextBox         | Save & Close Row |
	And I enter below flat questions data in the CRF.
		| QuestionPrompt      | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
		| CRF Collection Date | 05/22/2020         | 05/22/2024     | SEC             | TextBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                     | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC                     | TEXT            |                  |
		| 1         | CRF Lab Unit                             | gm/dL                   | TEXT            |                  |
		| 1         | CRF Lab value                            | 19                      | TEXT            |                  |
		| 1         | Lab Test Name                            | WBC                     | TEXT            |                  |
		| 1         | Lab Test Code                            | 01                      | TEXT            |                  |
		| 1         | LOINC Code                               | 1                       | TEXT            |                  |
		| 1         | Category                                 | Cat1                    | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1                 | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1               | TEXT            |                  |
		| 1         | Method                                   | Method1                 | TEXT            |                  |
		| 1         | Result Type                              | Result1                 | TEXT            |                  |
		| 1         | Normal Reference Range High              | < 12.00                 | TEXT            |                  |
		| 1         | Critical Reference Range Low             | > 1.41                 | TEXT            |                  |
		| 1         | Normal Reference Range Low               | > 4.00                  | TEXT            |                  |
		| 1         | Critical Reference Range High            | < 25.71                 | TEXT            |                  |
	#	| 1         | Reference Range ID                       | {ReferenceRangeID8}     | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | 19                      | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | > 4.00                  | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | < 12.00                 | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | > 1.41                 | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | No                      | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | < 25.71                 | TEXT            |                  |
		| 1         | Precision                                | 2                       | TEXT            |                  |
		| 1         | Conversion Factor                        | 1                       | TEXT            |                  |

#MNA CRF Collection Date to remove reference range values
@ObjectiveEvidence @ReqID:
Scenario: 27_Updating CRF collection date to MNA removes the associated reference ranges to eCRF
	When I click "Checkout" button on "LabForm2" CRF.  
	And I click icon "icon_mna_disabled.png" for the flat question "CRF Collection Date" in CRF
	And I enter comments "MNA CRF Collection Date" in MarkItemDialog 
    And I click ok button in MarkItemDialog
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC         | TEXT            |                  |
		| 1         | CRF Lab Unit                             | µL          | TEXT            |                  |
		| 1         | CRF Lab value                            | 19          | TEXT            |                  |
		| 1         | Lab Test Name                            | WBC         | TEXT            |                  |
		| 1         | Lab Test Code                            | 01          | TEXT            |                  |
		| 1         | LOINC Code                               | 1           | TEXT            |                  |
		| 1         | Category                                 | Cat1        | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1     | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1   | TEXT            |                  |
		| 1         | Method                                   | Method1     | TEXT            |                  |
		| 1         | Result Type                              | Result1     | TEXT            |                  |
		| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
		| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
		| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL       | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
		| 1         | Precision                                | 2           | TEXT            |                  |
		| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |

#Update CRF Collection Date value to reassociate reference range values
@ObjectiveEvidence @ReqID:
Scenario: 28_Updating CRF collection date reassociate reference ranges to eCRF
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
		| QuestionPrompt      | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
		| CRF Collection Date | [Blank]            | 05/22/2024     | SEC             | TextBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                     | TEXT                |                  |
		| 1         | Lab Test Description                     | WBC                     | TEXT                |                  |
		| 1         | CRF Lab Unit                             | gm/dL                   | TEXT                |                  |
		| 1         | CRF Lab value                            | 19                      | TEXT                |                  |
		| 1         | Lab Test Name                            | WBC                     | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                      | TEXT                |                  |
		| 1         | LOINC Code                               | 1                       | TEXT                |                  |
		| 1         | Category                                 | Cat1                    | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1                 | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1               | TEXT                |                  |
		| 1         | Method                                   | Method1                 | TEXT                |                  |
		| 1         | Result Type                              | Result1                 | TEXT                |                  |
		| 1         | Normal Reference Range High              | < 12.00                 | TEXT                |                  |
		| 1         | Critical Reference Range Low             | > 1.41                  | TEXT                |                  |
		| 1         | Normal Reference Range Low               | > 4.00                  | TEXT                |                  |
		| 1         | Critical Reference Range High            | < 25.71                 | TEXT                |                  |
		 #         | 1                                        | Reference Range ID      | {ReferenceRangeID8} | TEXT             |  
		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | 19                      | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | > 4.00                  | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | < 12.00                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | > 1.41                  | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                      | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | < 25.71                 | TEXT                |                  |
		| 1         | Precision                                | 2                       | TEXT                |                  |
		| 1         | Conversion Factor                        | 1                       | TEXT                |                  |
		
#Clear CRF Collection Date value to remove reference range values
@ObjectiveEvidence @ReqID:
Scenario: 29_Clear CRF Collection date removes the reference range values
	When I click "Checkout" button on "LabForm2" CRF.  
	And I clear question "CRF Collection Date".
	And I enter notes "CRF Collection Date cleared" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC         | TEXT            |                  |
		| 1         | CRF Lab Unit                             | µL          | TEXT            |                  |
		| 1         | CRF Lab value                            |             | TEXTBox         |                  |
		| 1         | Lab Test Name                            | WBC         | TEXT            |                  |
		| 1         | Lab Test Code                            | 01          | TEXT            |                  |
		| 1         | LOINC Code                               | 1           | TEXT            |                  |
		| 1         | Category                                 | Cat1        | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1     | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1   | TEXT            |                  |
		| 1         | Method                                   | Method1     | TEXT            |                  |
		| 1         | Result Type                              | Result1     | TEXT            |                  |
		| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
		| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
		| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL       | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
		| 1         | Precision                                | 2           | TEXT            |                  |
		| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |

# reassociate reference range values
@ObjectiveEvidence @ReqID:

Scenario: 30_Reassociate reference range values on CRF Collection Date and Lab ID update
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
		| QuestionPrompt      | AnswerValue | AnswerFieldType |
		| CRF Collection Date | 05/22/2024  | TextBox         |
	And I enter below flat questions data in the CRF.
		| QuestionPrompt      | CurrentAnswerValue |  NewAnswerValue | ReasonForChange | AnswerFieldType |
		| Lab ID              | Lab02              |  Lab01 (L01)    | SEC             | ListBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                     | TEXT                |                  |
		| 1         | Lab Test Description                     | WBC                     | TEXT                |                  |
		| 1         | CRF Lab Unit                             | gm/dL                   | TEXT                |                  |
		| 1         | CRF Lab value                            | 19                      | TEXT                |                  |
		| 1         | Lab Test Name                            | WBC                     | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                      | TEXT                |                  |
		| 1         | LOINC Code                               | 1                       | TEXT                |                  |
		| 1         | Category                                 | Cat1                    | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1                 | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1               | TEXT                |                  |
		| 1         | Method                                   | Method1                 | TEXT                |                  |
		| 1         | Result Type                              | Result1                 | TEXT                |                  |
		| 1         | Normal Reference Range High              | < 10.00                 | TEXT                |                  |
		| 1         | Critical Reference Range Low             | > 1.41                  | TEXT                |                  |
		| 1         | Normal Reference Range Low               | > 5.00                  | TEXT                |                  |
		| 1         | Critical Reference Range High            | < 25.71                 | TEXT                |                  |
		 #         | 1                                        | Reference Range ID      | {ReferenceRangeID2} | TEXT             |
		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | 19                      | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | > 5.00                  | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | < 10.00                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | > 1.41                  | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                      | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | < 25.71                 | TEXT                |                  |
		| 1         | Precision                                | 2                       | TEXT                |                  |
		| 1         | Conversion Factor                        | 1                       | TEXT                |                  |

#MNA LabID remove reference range values and Lab details
@ObjectiveEvidence @ReqID:
Scenario: 31_Update the Lab ID value to MNA removes reference range values and Lab details
	When I click "Checkout" button on "LabForm2" CRF.  
	And I click icon "icon_mna_disabled.png" for the flat question "Lab ID" in CRF
	And I enter comments "MNA Lab ID" in MarkItemDialog 
    And I click ok button in MarkItemDialog
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC         | TEXT            |                  |
		| 1         | CRF Lab Unit                             | gm/dL       | TEXT            |                  |
		| 1         | CRF Lab value                            | 19          | TEXT            |                  |
		| 1         | Lab Test Name                            | WBC         | TEXT            |                  |
		| 1         | Lab Test Code                            | 01          | TEXT            |                  |
		| 1         | LOINC Code                               | 1           | TEXT            |                  |
		| 1         | Category                                 | Cat1        | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1     | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1   | TEXT            |                  |
		| 1         | Method                                   | Method1     | TEXT            |                  |
		| 1         | Result Type                              | Result1     | TEXT            |                  |
		| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
		| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
		| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL       | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
		| 1         | Precision                                | 2           | TEXT            |                  |
		| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |
	And I verify below flat questions data in the CRF.
         | QuestionPrompt | AnswerValue | AnswerFieldType |
         | Lab Name       | [Blank]     | TEXT            |
         | Company        | [Blank]     | TEXT            |
         | Lab Address    | [Blank]     | TEXT            |
         | Country        | [Blank]     | TEXT            |

#Update LabID and reference range values are displayed
@ObjectiveEvidence @ReqID:
Scenario: 32_Update LabID and reference range values are displayed
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
		| QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
		| Lab ID         | [Blank]            | Lab01 (L01)    | SEC             | ListBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType     | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC                     | TEXT                |                  |
		| 1         | Lab Test Description                     | WBC                     | TEXT                |                  |
		| 1         | CRF Lab Unit                             | gm/dL                   | TEXT                |                  |
		| 1         | CRF Lab value                            | 19                      | TEXT                |                  |
		| 1         | Lab Test Name                            | WBC                     | TEXT                |                  |
		| 1         | Lab Test Code                            | 01                      | TEXT                |                  |
		| 1         | LOINC Code                               | 1                       | TEXT                |                  |
		| 1         | Category                                 | Cat1                    | TEXT                |                  |
		| 1         | Subcategory                              | SubCat1                 | TEXT                |                  |
		| 1         | Specimen                                 | Specimen1               | TEXT                |                  |
		| 1         | Method                                   | Method1                 | TEXT                |                  |
		| 1         | Result Type                              | Result1                 | TEXT                |                  |
		| 1         | Normal Reference Range High              | < 10.00                 | TEXT                |                  |
		| 1         | Critical Reference Range Low             | > 1.41                 | TEXT                |                  |
		| 1         | Normal Reference Range Low               | > 5.00                  | TEXT                |                  |
		| 1         | Critical Reference Range High            | < 25.71                 | TEXT                |                  |
		 #         | 1                                        | Reference Range ID      | {ReferenceRangeID2} | TEXT             |  |
		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT                |                  |
		| 1         | Normalized Patient Lab Value             | 19                      | TEXT                |                  |
		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT                |                  |
		| 1         | Normalized Normal Reference Range Low    | > 5.00                  | TEXT                |                  |
		| 1         | Normalized Normal Reference Range High   | < 10.00                 | TEXT                |                  |
		| 1         | Normalized Critical Reference Range Low  | > 1.41                 | TEXT                |                  |
		| 1         | Reference Range Not Applicable           | No                      | TEXT                |                  |
		| 1         | Normalized Critical Reference Range High | < 25.71                 | TEXT                |                  |
		| 1         | Precision                                | 2                       | TEXT                |                  |
		| 1         | Conversion Factor                        | 1                       | TEXT                |                  |

#Clear LabID value and reference ranges are removed
@ObjectiveEvidence @ReqID:
Scenario: 33_Update LabID and reference range values are displayed
	When I click "Checkout" button on "LabForm2" CRF.  
	And I clear question "Lab ID".
	And I enter notes "Lab ID cleared" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
		| 1         | Lab Test Description                     | WBC     | TEXT            |                  |
		| 1         | CRF Lab Unit                             | gm/dL       | TEXT            |                  |
		| 1         | CRF Lab value                            | 19          | TEXT            |                  |
		| 1         | Lab Test Name                            | WBC         | TEXT            |                  |
		| 1         | Lab Test Code                            | 01          | TEXT            |                  |
		| 1         | LOINC Code                               | 1           | TEXT            |                  |
		| 1         | Category                                 | Cat1        | TEXT            |                  |
		| 1         | Subcategory                              | SubCat1     | TEXT            |                  |
		| 1         | Specimen                                 | Specimen1   | TEXT            |                  |
		| 1         | Method                                   | Method1     | TEXT            |                  |
		| 1         | Result Type                              | Result1     | TEXT            |                  |
		| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
		| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
		| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
		| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
		| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
		| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
		| 1         | Normalized Lab Unit                      | gm/dL       | TEXT            |                  |
		| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
		| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
		| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
		| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
		| 1         | Precision                                | 2           | TEXT            |                  |
		| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |
	And I verify below flat questions data in the CRF.
         | QuestionPrompt | AnswerValue | AnswerFieldType |
         | Lab Name       | [Blank]     | TEXT            |
         | Company        | [Blank]     | TEXT            |
         | Lab Address    | [Blank]     | TEXT            |
         | Country        | [Blank]     | TEXT            |

###########################################################################################################
## Scenarios for Non eCRF
##Update LabForm1 to associate normalized reference range values to Non e CRF questions
#Scenario: 34_Update LabForm1 Flat questions Lab ID and CRF collection Date
#	When I click breadcrumb "01-PAT"
#	And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
#	And I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below data for Flat questions in CRF.
#         | QuestionPrompt      | AnswerValue | AnswerFieldType |
#         | Lab ID              | Lab01 (L01) | ListBox         |
#         | CRF Collection Date | 02/03/2019  | TextBox         |
#	And I click "Save" button on "LabForm1" CRF
#	Then The CRF with data is saved and checked-in successfully.
#
##Add RBC CRF Lab Value and CRF Lab Unit to associate normalized reference range values to Non eCRF questions
##Normalized lab value on non eCRF
#@ObjectiveEvidence @ReqID:
#Scenario: 35_Add RBC CRF Lab Value and CRF Lab Unit to associate normalized reference range values to Non eCRF questions
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below "Autobuild Table:" table questions data in the CRF.
#         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
#         | No        | 2         | CRF Lab Unit   | fL          | ListBox         |                  |
#         | No        | 2         | CRF Lab value  | 16          | TextBox         | Save & Close Row |
#	And I click "Save" button on "LabForm1" CRF
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#         | DataValue               |
#         | RBC                     |
#         | 02                      |
#         | 2                       |
#         | Cat2                    |
#         | SubCat2                 |
#         | Specimen2               |
#         | Method2                 |
#         | Result2                 |
#         | > 3.00                  |
#         | < 15.00                 |
#         | > 1.41                 |
#         | < 25.71                 |
#         | Above normal range high |
#         | 80                      |
#         | pg                      |
#         | > 15.00                 |
#         | < 75.00                 |
#         | > 102.05                |
#         | < 128.55                |
#         | 3                       |
#         | 5                       |
#
##Update Lab Unit to remove the reference range values to a Non eCRF questions
#@ObjectiveEvidence @ReqID:
#Scenario: 36_Update the CRF Lab Unit question to remove reference ranges to questions in RBC test in form LabForm1 under Visit(Week 2)
#	When I click "Checkout" button on "LabForm1" CRF.  
#    And I enter below "Autobuild Table:" table questions data in the CRF.
#        | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
#        | No        | 2         | CRF Lab Unit   | fL              | pg             | SEC             | ListBox         | Save & Close Row |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The result should have empty values.
#		
#
##CRF Collection Date Update RR
##Normalized lab value on non eCRF
#@ObjectiveEvidence @ReqID:
#Scenario: 37_Update the CRF Collection Date to re associate reference ranges to non eCRF questions in RBC test in form LabForm1 under Visit(Week 2)
#	When I click breadcrumb "01-PAT"
#	And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
#	And I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below flat questions data in the CRF.
#      | QuestionPrompt      | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
#      | CRF Collection Date | 02/03/2019         | 02/03/2024     | SEC             | TextBox         |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue               |
#		| RBC                     |
#		| 02                      |
#		| 2                       |
#		| Cat2                    |
#		| SubCat2                 |
#		| Specimen2               |
#		| Method2                 |
#		| Result2                 |
#		| > 5.00                  |
#		| < 10.00                 |
#		| > 1.41                 |
#		| < 25.71                 |
#		| Above normal range high |
#		| 16                      |
#		| pg                      |
#		| > 5.00                  |
#		| < 10.00                 |
#		| > 1.41                 |
#		| < 25.71                 |
#		| 3                       |
#		| 1                       |
#	
##LabID Update RR
#@ObjectiveEvidence @ReqID:
#Scenario: 38_Update the LabID to Lab02(L02) to re associate reference ranges to non eCRF questions in RBC test in form LabForm1 under Visit(Week 2)
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below flat questions data in the CRF.
#      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
#      | Lab ID         | Lab01              | Lab02 (L02)    | SEC             | ListBox         |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue               |
#		| RBC                     |
#		| 02                      |
#		| 2                       |
#		| Cat2                    |
#		| SubCat2                 |
#		| Specimen2               |
#		| Method2                 |
#		| Result2                 |
#		| > 4.00                  |
#		| < 12.00                 |
#		| > 1.41                 |
#		| < 25.71                 |
#		| Above normal range high |
#		| 16                      |
#		| pg                      |
#		| > 4.00                  |
#		| < 12.00                 |
#		| > 1.41                 |
#		| < 25.71                 |
#		| 3                       |
#		| 1                       |
#
#		
##CRF Lab Value Update
#@ObjectiveEvidence @ReqID:
#Scenario: 39_Update the CRF Lab Value to re associate reference ranges to non eCRF questions in RBC test in form LabForm1 under Visit(Week 2)
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below "Autobuild Table:" table questions data in the CRF.
#        | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
#        | No        | 2         | CRF Lab value  | 16                 | 10             | SEC             | TEXTBOX         | Save & Close Row |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue |
#		| RBC       |
#		| 02        |
#		| 2         |
#		| Cat2      |
#		| SubCat2   |
#		| Specimen2 |
#		| Method2   |
#		| Result2   |
#		| > 4.00    |
#		| < 12.00   |
#		| > 1.41   |
#		| < 25.71   |
#		| No        |
#		| 10        |
#		| pg        |
#		| > 4.00    |
#		| < 12.00   |
#		| > 1.41   |
#		| < 25.71   |
#		| 3         |
#		| 1         |
#
##MNA CRF Lab Value
#@ObjectiveEvidence @ReqID:
#Scenario: 40_Update the CRF Lab Value to MNA
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I expand row "2" of table "Autobuild Table:"
#	And I click "icon_mna_disabled.png" icon of a question "CRF Lab value" of table "Autobuild Table:"
#    And I enter comments "MNA CRF Lab value" in MarkItemDialog 
#    And I click ok button in MarkItemDialog
#	And I click table row button "Save & Close Row" of table "Autobuild Table:"
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue |
#		| RBC       |
#		| 02        |
#		| 2         |
#		| Cat2      |
#		| SubCat2   |
#		| Specimen2 |
#		| Method2   |
#		| Result2   |
#		| > 4.00    |
#		| < 12.00   |
#		| > 1.41   |
#		| < 25.71   |
#		|           |
#		|           |
#		| pg        |
#		| > 4.00    |
#		| < 12.00   |
#		| > 1.41   |
#		| < 25.71   |
#		| 3         |
#		| 1         |
#
##MNA CRF Lab Unit
#@ObjectiveEvidence @ReqID:
#Scenario: 41_Update the CRF Lab Unit to MNA
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I expand row "2" of table "Autobuild Table:"
#	And I click "icon_mna_disabled.png" icon of a question "CRF Lab Unit" of table "Autobuild Table:"
#    And I enter comments "MNA CRF Lab Unit" in MarkItemDialog 
#    And I click ok button in MarkItemDialog
#	And I click table row button "Save & Close Row" of table "Autobuild Table:"
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The result should have empty values.
#
##Update Lab Unit reasscoiate reference range values except Normalized Patient Lab Value and Out of Normal Range Indicator
#@ObjectiveEvidence @ReqID:
#Scenario: 42_Update CRF Lab Unit and Re associate the reference ranges except the Normalized Patient lab value and Out of Normal Range Indicator
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below "Autobuild Table:" table questions data in the CRF.
#        | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
#        | No        | 2         | CRF Lab Unit   | µL                 | pg             | SEC             | ListBox         | Save & Close Row |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue |
#		| RBC       |
#		| 02        |
#		| 2         |
#		| Cat2      |
#		| SubCat2   |
#		| Specimen2 |
#		| Method2   |
#		| Result2   |
#		| > 4.00    |
#		| < 12.00   |
#		| > 1.41   |
#		| < 25.71   |
#		|           |
#		|           |
#		| pg        |
#		| > 4.00    |
#		| < 12.00   |
#		| > 1.41   |
#		| < 25.71   |
#		| 3         |
#		| 1         |
#
##Update CRF Lab value to reasscoiate reference range
#@ObjectiveEvidence @ReqID:
#Scenario: 43_Update CRF Lab value to reasscoiate reference ranges
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below "Autobuild Table:" table questions data in the CRF.
#        | AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
#        | No        | 2         | CRF Lab value  | [Blank]            | 3              | SEC             | TextBox         | Save & Close Row |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue              |
#		| RBC                    |
#		| 02                     |
#		| 2                      |
#		| Cat2                   |
#		| SubCat2                |
#		| Specimen2              |
#		| Method2                |
#		| Result2                |
#		| > 4.00                 |
#		| < 12.00                |
#		| > 1.41                |
#		| < 25.71                |
#		| Below normal range low |
#		| 3                      |
#		| pg                     |
#		| > 4.00                 |
#		| < 12.00                |
#		| > 1.41                |
#		| < 25.71                |
#		| 3                      |
#		| 1                      |
#
#
##CRF Lab value clear item to remove values for Normalized Patient Lab Value and Out of Normal Range Indicator
#@ObjectiveEvidence @ReqID:
#Scenario: 44_Perform the CRF Lab value Clear Item to remove the reference ranges for Normalized Patient Lab Value and Out of Normal Range Indicator
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I expand row "2" of table "Autobuild Table:"
#	And I clear question "CRF Lab value" of table "Autobuild Table:"
#	And I enter notes "CRF Lab value cleared" in ClearItemModalDialog
#	And I click ok button in ClearItemModalDialog
#	And I click table row button "Save & Close Row" of table "Autobuild Table:"
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue |
#		| RBC       |
#		| 02        |
#		| 2         |
#		| Cat2      |
#		| SubCat2   |
#		| Specimen2 |
#		| Method2   |
#		| Result2   |
#		| > 4.00    |
#		| < 12.00   |
#		| > 1.41   |
#		| < 25.71   |
#		|           |
#		|           |
#		| pg        |
#		| > 4.00    |
#		| < 12.00   |
#		| > 1.41   |
#		| < 25.71   |
#		| 3         |
#		| 1         |
#
##CRF Lab Unit clear item to remove all reference range values
#@ObjectiveEvidence @ReqID:
#Scenario: 45_Perform the CRF Lab value Clear Item to remove all reference range values
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I expand row "2" of table "Autobuild Table:"
#	And I clear question "CRF Lab Unit" of table "Autobuild Table:"
#	And I enter notes "CRF Lab Unit cleared" in ClearItemModalDialog
#	And I click ok button in ClearItemModalDialog
#	And I click table row button "Save & Close Row" of table "Autobuild Table:"
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The result should have empty values.
#
#########################################################################################
##Update both CRF Lab value and CRF Lab Unit to Reassociate the reference range values
#@ObjectiveEvidence @ReqID:
#Scenario: 46_Update both CRF Lab value and CRF Lab Unit to Reassociate the reference range values
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below "Autobuild Table:" table questions data in the CRF.
#        | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
#        | No        | 2         | CRF Lab Unit   | fL          | ListBox         |                  |
#        | No        | 2         | CRF Lab value  | 19          | TextBox         | Save & Close Row |
#	And I enter below flat questions data in the CRF.
#		| QuestionPrompt      | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
#		| CRF Collection Date | 02/03/2024         | 02/03/2019     | SEC             | TextBox         |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue              |
#		| RBC                    |
#		| 02                     |
#		| 2                      |
#		| Cat2                   |
#		| SubCat2                |
#		| Specimen2              |
#		| Method2                |
#		| Result2                |
#		| > 5.00                 |
#		| < 17.00                |
#		| > 1.41                |
#		| < 25.71                |
#		| Above normal range high |
#		| 95                     |
#		| pg                     |
#		| > 25.00                |
#		| < 85.00                |
#		| > 102.05               |
#		| < 128.55               |
#		| 3                      |
#		| 5                      |
#
##MNA CRF Collection Date to remove reference range values
#@ObjectiveEvidence @ReqID:
#Scenario: 47_Updating CRF collection date to MNA removes the associated reference ranges to non eCRF questions
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I click icon "icon_mna_disabled.png" for the flat question "CRF Collection Date" in CRF
#	And I enter comments "MNA CRF Collection Date" in MarkItemDialog 
#    And I click ok button in MarkItemDialog
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The result should have empty values.
#
##Update CRF Collection Date value to reassociate reference range values
#@ObjectiveEvidence @ReqID:
#Scenario: 48_Updating CRF collection date reassociate reference ranges to non eCRF questions
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below flat questions data in the CRF.
#		| QuestionPrompt      | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
#		| CRF Collection Date | [Blank]            | 03/03/2019     | SEC             | TextBox         |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue              |
#		| RBC                    |
#		| 02                     |
#		| 2                      |
#		| Cat2                   |
#		| SubCat2                |
#		| Specimen2              |
#		| Method2                |
#		| Result2                |
#		| > 5.00                 |
#		| < 17.00                |
#		| > 1.41                |
#		| < 25.71                |
#		| Above normal range high |
#		| 95                     |
#		| pg                     |
#		| > 25.00                |
#		| < 85.00                |
#		| > 102.05               |
#		| < 128.55               |
#		| 3                      |
#		| 5                      |
#
##Clear CRF Collection Date value to remove reference range values
#@ObjectiveEvidence @ReqID:
#Scenario: 49_Clear CRF Collection date removes the reference range values
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I clear question "CRF Collection Date".
#	And I enter notes "CRF Collection Date cleared" in ClearItemModalDialog
#	And I click ok button in ClearItemModalDialog
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The result should have empty values.
#
## reassociate reference range values
#@ObjectiveEvidence @ReqID:
#
#Scenario: 50_Reassociate reference range values on CRF Collection Date and Lab ID update
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below flat questions data in the CRF.
#		| QuestionPrompt      | AnswerValue | AnswerFieldType |
#		| CRF Collection Date | 02/03/2019  | TextBox         |
#	And I enter below flat questions data in the CRF.
#		| QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
#		| Lab ID         | Lab02              | Lab01 (L01)    | SEC             | ListBox         |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue              |
#		| RBC                    |
#		| 02                     |
#		| 2                      |
#		| Cat2                   |
#		| SubCat2                |
#		| Specimen2              |
#		| Method2                |
#		| Result2                |
#		| > 3.00                 |
#		| < 15.00                |
#		| > 1.41                |
#		| < 25.71                |
#		| Above normal range high |
#		| 95                     |
#		| pg                     |
#		| > 15.00                |
#		| < 75.00                |
#		| > 102.05               |
#		| < 128.55               |
#		| 3                      |
#		| 5                      |
#
##MNA LabID remove reference range values and Lab details
#@ObjectiveEvidence @ReqID:
#Scenario: 51_Update the Lab ID value to MNA removes reference range values and Lab details
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I click icon "icon_mna_disabled.png" for the flat question "Lab ID" in CRF
#	And I enter comments "MNA Lab ID" in MarkItemDialog 
#    And I click ok button in MarkItemDialog
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The result should have empty values.
#
##Update LabID and reference range values are displayed
#@ObjectiveEvidence @ReqID:
#Scenario: 52_Update LabID and reference range values are displayed
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I enter below flat questions data in the CRF.
#		| QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
#		| Lab ID         | [Blank]            | Lab01 (L01)    | SEC             | ListBox         |
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue              |
#		| RBC                    |
#		| 02                     |
#		| 2                      |
#		| Cat2                   |
#		| SubCat2                |
#		| Specimen2              |
#		| Method2                |
#		| Result2                |
#		| > 3.00                 |
#		| < 15.00                |
#		| > 1.41                |
#		| < 25.71                |
#		| Above normal range high |
#		| 95                     |
#		| pg                     |
#		| > 15.00                |
#		| < 75.00                |
#		| > 102.05               |
#		| < 128.55               |
#		| 3                      |
#		| 5                      |
#
##Clear LabID value and reference ranges are removed
#@ObjectiveEvidence @ReqID:
#Scenario: 53_Update LabID and reference range values are displayed
#	When I click "Checkout" button on "LabForm1" CRF.  
#	And I clear question "Lab ID".
#	And I enter notes "Lab ID cleared" in ClearItemModalDialog
#	And I click ok button in ClearItemModalDialog
#	And I click on "Save" button on "LabForm1" CRF.
#	And I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The result should have empty values.
#
##Update LabID for both LabForm1 and LabForm2 to reassociate the reference range values for both eCRF and non eCRF Questions--
#Scenario: 54_Update Item data of an existing patient
#	When I update existing item data of a patient "01-PAT" using ConsumeODMStrTransactional webservice with below data and odmfile.
#	| TransactionTypeData | AddNewPatientsData | ODMDATA                              |
#	| Transactional       | false              | 01_PAT_LabForm_Data_CDISCUpdate.xml |
#	Then The response should contain success status code as "200".
#
#@ObjectiveEvidence @ReqID:
#Scenario: 55_Reference range values reassociated to LabForm1 non eCRF questions
#	When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2".
#	Then The below result should be retrieved.
#		| DataValue              |
#		| RBC                    |
#		| 02                     |
#		| 2                      |
#		| Cat2                   |
#		| SubCat2                |
#		| Specimen2              |
#		| Method2                |
#		| Result2                |
#		| > 3.00                 |
#		| < 15.00                |
#		| > 1.41                |
#		| < 25.71                |
#		| Above normal range high |
#		| 95                     |
#		| pg                     |
#		| > 15.00                |
#		| < 75.00                |
#		| > 102.05               |
#		| < 128.55               |
#		| 3                      |
#		| 5                      |
#
#@ObjectiveEvidence @ReqID:
#Scenario: 56_Verify the reference range values reassociated to LabForm2 WBC test
#	Given I click breadcrumb "01-PAT".
#	When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
#	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
#		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType     | RowButtonToClick |
#		| 1         | CRF Lab Test Name                        | WBC                     | TEXT                |                  |
#		| 1         | Lab Test Description                     | WBC                     | TEXT                |                  |
#		| 1         | CRF Lab Unit                             | gm/dL                   | TEXT                |                  |
#		| 1         | CRF Lab value                            | 19                      | TEXT                |                  |
#		| 1         | Lab Test Name                            | WBC                     | TEXT                |                  |
#		| 1         | Lab Test Code                            | 01                      | TEXT                |                  |
#		| 1         | LOINC Code                               | 1                       | TEXT                |                  |
#		| 1         | Category                                 | Cat1                    | TEXT                |                  |
#		| 1         | Subcategory                              | SubCat1                 | TEXT                |                  |
#		| 1         | Specimen                                 | Specimen1               | TEXT                |                  |
#		| 1         | Method                                   | Method1                 | TEXT                |                  |
#		| 1         | Result Type                              | Result1                 | TEXT                |                  |
#		| 1         | Normal Reference Range High              | < 10.00                 | TEXT                |                  |
#		| 1         | Critical Reference Range Low             | > 1.41                 | TEXT                |                  |
#		| 1         | Normal Reference Range Low               | > 5.00                  | TEXT                |                  |
#		| 1         | Critical Reference Range High            | < 25.71                 | TEXT                |                  |
#		 #         | 1                                        | Reference Range ID      | {ReferenceRangeID2} | TEXT             |  |
#		| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT                |                  |
#		| 1         | Normalized Patient Lab Value             | 19                      | TEXT                |                  |
#		| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT                |                  |
#		| 1         | Normalized Normal Reference Range Low    | > 5.00                  | TEXT                |                  |
#		| 1         | Normalized Normal Reference Range High   | < 10.00                 | TEXT                |                  |
#		| 1         | Normalized Critical Reference Range Low  | > 1.41                 | TEXT                |                  |
#		| 1         | Reference Range Not Applicable           | No                      | TEXT                |                  |
#		| 1         | Normalized Critical Reference Range High | < 25.71                 | TEXT                |                  |
#		| 1         | Precision                                | 2                       | TEXT                |                  |
#		| 1         | Conversion Factor                        | 1                       | TEXT                |                  |
