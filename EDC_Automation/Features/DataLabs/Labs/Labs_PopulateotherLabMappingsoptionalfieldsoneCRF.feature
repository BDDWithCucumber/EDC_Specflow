Feature: US56330_DL: Populate other Lab Mappings optional fields on eCRF

Acceptance Criteria:
1.System shall populate data for the following fields on eCRF (as they are questions) based on Lab Mappings.
◾Lab Test Description
◾Reference Range Not Applicable
◾Reference Range ID
◾Precision
◾Conversion Factor


@ObjectiveEvidence
Scenario: 1_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "QuestionAllMapped_D1.zip" with study label "Questions"
    Then I see study label "Questions" in header 

Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |

Scenario: 05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"
	
Scenario: 06_Assign testadmin testadmin user to 02-Site
	When I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: 07_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |

Scenario: 08_Associate Lab L01 and L02 for 01-SIte
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

Scenario: 09_Associate Lab L01, L03 for 02-Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER   | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L03   | Lab03          | NOVARTIS | Research   | Active           |
	
Scenario: 10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/13/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 11_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 12_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 13_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	 | 02/25/2019 | 03/03/2020 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 9Unit | False |
	 | 02/26/2019 | 03/04/2020 | Female | >             | 30         | <           | 40       | >                    | 4                 | <                     | 16                 | >                      | 40.42               | <                       | 45.72                | 6Unit | False |

Scenario: 14_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: 15_Expand the Event1 and open the demographics form to update the data.
	  And I expand "Event 1" to select and open "Demographics" CRF.
      When I click "Checkout" button on "Demographics" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | What is your age    | 28          | TextBox         |
      | Age Unit            | Year        | ListBox         |
      | What is your gender | Male        | ListBox         |
	  And I click on "Save & Close" button on "Demographics" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 16_Expand the Visit (week2) event and open the FormD1 form and update the data.
	  And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID Q1 For D1              | LAB01(L01)  | ListBox         |
      | CRF Collection Date Q1 For D1 | 10/28/2019  | TextBox         |
	  And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 1         | CRF Lab Value For D1           | 6           | TextBox         |                  |
	  | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 9      | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 17_Verify the Lab report data.
	  And I expand "Visit (week2)" to select and open "FormD1" CRF.
	  When I click "Checkout" button on "FormD1" CRF.      
	  Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                                  | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1         | Text            |                  |
		| 1         | CRF Lab Value For D1                            | 6                   | Text            |                  |
		| 1         | Lab Test Description For D1                     | HEM1                | TextBox         |                  |
		| 1         | Lab Test Code For D1                            | 1                   | TextBox         |                  |
		| 1         | Lab Test Name For D1                            | HEMOGLOBIN1         | TextBox         |                  |
		| 1         | LOINC Code For D1                               | 111                 | TextBox         |                  |
		| 1         | Category For D1                                 | RBC1                | TextBox         |                  |
		| 1         | SAS Label For D1                                |                     | TextBox         |                  |
		| 1         | Specimen For D1                                 | Automated1          | TextBox         |                  |
		| 1         | Method For D1                                   | Quantitative1       | TextBox         |                  |
		| 1         | Result Type For D1                              | g/dl                | TextBox         |                  |
		| 1         | Normal Reference Range Low For D1               | > 3.00              | Text            |                  |
		| 1         | Normal Reference Range High For D1              | < 15.00             | Text            |                  |
		| 1         | Subcategory For D1                              | Serum1              | TextBox         |                  |
		| 1         | Critical Reference Range High For D1            | < 25.71             | Text            |                  |
		| 1         | Critical Reference Range Low For D1             | > 20.41             | Text            |                  |
		| 1         | Reference Range ID For D1                       | {ReferenceRangeID1} | TextBox         |                  |
		| 1         | Normalized Patient Lab Value For D1             | 0.6                 | TextBox         |                  |
		| 1         | Normalized Lab Unit For D1                      | 2Unit               | TextBox         |                  |
		| 1         | Normalized Normal Reference Range Low For D1    | > 0.300             | TextBox         |                  |
		| 1         | Normalized Normal Reference Range High For D1   | < 1.500             | TextBox         |                  |
		| 1         | Normalized Critical Reference Range Low for D1  | > 2.041             | TextBox         |                  |
		| 1         | Normalized Critical Reference Range High For D1 | < 2.571             | TextBox         |                  |
		| 1         | Precision For D1                                | 1                   | TextBox         |                  |
		| 1         | Reference Range Not Applicable For D1           | False               | TextBox         |                  |
		| 1         | Conversion Factor for D1                        | 0.1                 | TextBox         |                  |
		| 1         | CRF Lab (Original) Unit for D1                  | Unit 9              | Text            |                  |
		| 1         | Out of Normal Range Indicator For D1            | No                  | TextBox         | Save & Close Row |
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully.









































































































































































































































































































































































