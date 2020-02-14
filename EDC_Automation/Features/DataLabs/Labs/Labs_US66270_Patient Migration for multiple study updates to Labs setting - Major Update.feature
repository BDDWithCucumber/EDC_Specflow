Feature: Labs_PatientMigrationformultiplestudyupdates-Major Update
	Test Summary:
	1. US66270_Verify the Study update functionality in DL when the Designer study Labs settings changed multiple times Yes->No->Yes

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "StudyPublish.zip" with study label "AllmappedforD1_1"
    Then I see study label "AllmappedforD1_1" in header 

Scenario: 04_Add site in Site Management and associate testadmin testadmin user to 01-Site
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	#And I enter sites details and Save
	#| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	#| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

#Scenario: T05_Add Labs
#	When I click breadcrumb "Study Administration"
#	And I click Link "Lab Management" In StudyAdministrationPage
#	And I click Link "Manage Laboratories" In StudyAdministrationPage
#	And I enter labs details and Save
#	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	Then I see labs with details in lab grid
#	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#
#Scenario: T06_Associate Lab L02 to 01-Site
#	When I click breadcrumb "Study Administration"
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "01" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
#	| L02   | Lab02          | PFIZER  | RD         | Active           |

Scenario: T07_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

Scenario: T08_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST2" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Female | >             | 0          | <           | 25       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 30                   | 4Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID2} |

Scenario: T09_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 02       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 02-PAT    |

Scenario: T10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T11_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T12_Expand the Visit (Screening) and open the demographics form to update the data
	When I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
    | QuestionPrompt      | AnswerValue | AnswerFieldType |
    | What is your age    | 31          | TextBox         |
    | Age Unit            | Year        | ListBox         |
    | What is your gender | Male        | ListBox         |
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully. 

Scenario: T13_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
	And I click "Checkout" button on "FormD1" CRF. 
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1              | Lab02 (L02) | ListBox         |
	| CRF Collection Date Q1 For D1 | 06/10/2019  | TextBox         |
    And I expand row "1" of table "AutoBuildQuestionsForD1:" 
	And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | CRF Lab Value For D1           | 20          | TextBox         |                  |
	| No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3      | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T14_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

Scenario: T15_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

Scenario: T16_Expand the Visit (Screening) and open the demographics form to update the data
	When I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
    | QuestionPrompt      | AnswerValue | AnswerFieldType |
    | What is your age    | 20          | TextBox         |
    | Age Unit            | Year        | ListBox         |
    | What is your gender | Female      | ListBox         |
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully. 

Scenario: T17_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
	And I click "Checkout" button on "FormD1" CRF. 
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1              | Lab02 (L02) | ListBox         |
	| CRF Collection Date Q1 For D1 | 06/10/2019  | TextBox         |
    And I expand row "2" of table "AutoBuildQuestionsForD1:" 
	And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 2         | CRF Lab Value For D1           | 30          | TextBox         |                  |
	| No        | 2         | CRF Lab (Original) Unit for D1 | Unit 4      | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T18_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "2" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2             | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 30                      | Text            |                  |
	| 2         | Lab Test Description For D1                     | Test2                   | Text            |                  |
	| 2         | Lab Test Code For D1                            | 2                       | Text            |                  |
	| 2         | Lab Test Name For D1                            | MRRTEST2                | Text            |                  |
	| 2         | LOINC Code For D1                               | 2                       | Text            |                  |
	| 2         | Category For D1                                 | RBC2                    | Text            |                  |
	| 2         | Specimen For D1                                 | Automated2              | Text            |                  |
	| 2         | Method For D1                                   | Quantitative2           | Text            |                  |
	| 2         | Result Type For D1                              | n/a                     | Text            |                  |
	| 2         | Normal Reference Range Low For D1               | > 10.000                | Text            |                  |
	| 2         | Normal Reference Range High For D1              | < 15.000                | Text            |                  |
	| 2         | Subcategory For D1                              | Serum2                  | Text            |                  |
	| 2         | Critical Reference Range High For D1            | < 30.000                | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | > 5.000                 | Text            |                  |
	| 2         | Reference Range ID For D1                       | {ReferenceRangeID2}     | Text            |                  |
	| 2         | Normalized Patient Lab Value For D1             | 120.000                 | Text            |                  |
	| 2         | Normalized Lab Unit For D1                      | 3Unit                   | Text            |                  |
	| 2         | Normalized Normal Reference Range Low For D1    | > 40.000                | Text            |                  |
	| 2         | Normalized Normal Reference Range High For D1   | < 60.000                | Text            |                  |
	| 2         | Normalized Critical Reference Range Low for D1  | > 20.000                | Text            |                  |
	| 2         | Normalized Critical Reference Range High For D1 | < 120.000               | Text            |                  |
	| 2         | Precision For D1                                | 3                       | Text            |                  |
	| 2         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 2         | Conversion Factor for D1                        | 4                       | Text            |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | Unit 4                  | Text            |                  |
	| 2         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

#Study publish-Major study update
#US63142-Labs Yes to No- Do Not Migrate
Scenario: T19_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "StudyPublish_Yes_No.zip" with Label "Major1"
	And I click continue in modal dialog having title "Confirm" and partial message "Uploaded study version has Local Labs as Not Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T20_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                       |
    | Publishing of Study file (Major1) - complete. |

#After study publish and Before Patient Migration verify form data
Scenario: T21_Verify the Lab report data is populated with all the latest Dictionary lab values	
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

Scenario: T22_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T23_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF. 
    And I expand row "1" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3             | Unit 4         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T24_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 4                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: T25_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "AutoBuildQuestionsForD1:"
	And I expand row "1" of table "AutoBuildQuestionsForD1:"
	Then I should not see visual indicator for question "CRF Lab Value For D1" in table "AutoBuildQuestionsForD1:".

Scenario: T26_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF. 
    And I expand row "2" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 2         | CRF Lab (Original) Unit for D1 | Unit 4             | Unit 5         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T27_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "2" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 30            | Text            |                  |
	| 2         | Lab Test Description For D1                     | Test2         | Text            |                  |
	| 2         | Lab Test Code For D1                            | 2             | Text            |                  |
	| 2         | Lab Test Name For D1                            | MRRTEST2      | Text            |                  |
	| 2         | LOINC Code For D1                               | 2             | Text            |                  |
	| 2         | Category For D1                                 | RBC2          | Text            |                  |
	| 2         | Specimen For D1                                 | Automated2    | Text            |                  |
	| 2         | Method For D1                                   | Quantitative2 | Text            |                  |
	| 2         | Result Type For D1                              | n/a           | Text            |                  |
	| 2         | Normal Reference Range Low For D1               | [Blank]       | Text            |                  |
	| 2         | Normal Reference Range High For D1              | [Blank]       | Text            |                  |
	| 2         | Subcategory For D1                              | Serum2        | Text            |                  |
	| 2         | Critical Reference Range High For D1            | [Blank]       | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | [Blank]       | Text            |                  |
	| 2         | Reference Range ID For D1                       | [Blank]       | Text            |                  |
	| 2         | Normalized Patient Lab Value For D1             | [Blank]       | Text            |                  |
	| 2         | Normalized Lab Unit For D1                      | 3Unit         | Text            |                  |
	| 2         | Normalized Normal Reference Range Low For D1    | [Blank]       | Text            |                  |
	| 2         | Normalized Normal Reference Range High For D1   | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range Low for D1  | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range High For D1 | [Blank]       | Text            |                  |
	| 2         | Precision For D1                                | 3             | Text            |                  |
	| 2         | Reference Range Not Applicable For D1           | [Blank]       | Text            |                  |
	| 2         | Conversion Factor for D1                        | [Blank]       | Text            |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | Unit 5        | Text            |                  |
	| 2         | Out of Normal Range Indicator                   | [Blank]       | Text            |                  |

Scenario: T28_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 02-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T29_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "2" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 30            | Text            |                  |
	| 2         | Lab Test Description For D1                     | Test2         | Text            |                  |
	| 2         | Lab Test Code For D1                            | 2             | Text            |                  |
	| 2         | Lab Test Name For D1                            | MRRTEST2      | Text            |                  |
	| 2         | LOINC Code For D1                               | 2             | Text            |                  |
	| 2         | Category For D1                                 | RBC2          | Text            |                  |
	| 2         | Specimen For D1                                 | Automated2    | Text            |                  |
	| 2         | Method For D1                                   | Quantitative2 | Text            |                  |
	| 2         | Result Type For D1                              | n/a           | Text            |                  |
	| 2         | Normal Reference Range Low For D1               | [Blank]       | Text            |                  |
	| 2         | Normal Reference Range High For D1              | [Blank]       | Text            |                  |
	| 2         | Subcategory For D1                              | Serum2        | Text            |                  |
	| 2         | Critical Reference Range High For D1            | [Blank]       | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | [Blank]       | Text            |                  |
	| 2         | Reference Range ID For D1                       | [Blank]       | Text            |                  |
	| 2         | Normalized Patient Lab Value For D1             | [Blank]       | Text            |                  |
	| 2         | Normalized Lab Unit For D1                      | 3Unit         | Text            |                  |
	| 2         | Normalized Normal Reference Range Low For D1    | [Blank]       | Text            |                  |
	| 2         | Normalized Normal Reference Range High For D1   | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range Low for D1  | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range High For D1 | [Blank]       | Text            |                  |
	| 2         | Precision For D1                                | 3             | Text            |                  |
	| 2         | Reference Range Not Applicable For D1           | [Blank]       | Text            |                  |
	| 2         | Conversion Factor for D1                        | [Blank]       | Text            |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | Unit 5        | Text            |                  |
	| 2         | Out of Normal Range Indicator                   | [Blank]       | Text            |                  |

#Study Publish
#Labs No to No - Major study update
Scenario: T30_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "AllmappedforD1_1_20200108_T16201803.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T31_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	And I check subjects in inbox folder "Jobs"
    | Subject                                       |
    | Publishing of Study file (Major1) - complete. |
	Then  I do not see the Tab "Local Labs"

#After study publish and Before Patient Migration verify form data
Scenario: T32_Verify the Lab report data is populated with all the latest Dictionary lab values
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 4                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

Scenario: T33_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T34_Verify the Lab report data is populated with all the latest Dictionary lab values
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 4                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

Scenario: T35_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF. 
    And I expand row "1" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 4             | Unit 3         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T36_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

Scenario: T37_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF. 
    And I expand row "2" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 2         | CRF Lab (Original) Unit for D1 | Unit 5             | Unit 4         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T38_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "2" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 30            | Text            |                  |
	| 2         | Lab Test Description For D1                     | Test2         | Text            |                  |
	| 2         | Lab Test Code For D1                            | 2             | Text            |                  |
	| 2         | Lab Test Name For D1                            | MRRTEST2      | Text            |                  |
	| 2         | LOINC Code For D1                               | 2             | Text            |                  |
	| 2         | Category For D1                                 | RBC2          | Text            |                  |
	| 2         | Specimen For D1                                 | Automated2    | Text            |                  |
	| 2         | Method For D1                                   | Quantitative2 | Text            |                  |
	| 2         | Result Type For D1                              | n/a           | Text            |                  |
	| 2         | Normal Reference Range Low For D1               | [Blank]       | Text            |                  |
	| 2         | Normal Reference Range High For D1              | [Blank]       | Text            |                  |
	| 2         | Subcategory For D1                              | Serum2        | Text            |                  |
	| 2         | Critical Reference Range High For D1            | [Blank]       | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | [Blank]       | Text            |                  |
	| 2         | Reference Range ID For D1                       | [Blank]       | Text            |                  |
	| 2         | Normalized Patient Lab Value For D1             | [Blank]       | Text            |                  |
	| 2         | Normalized Lab Unit For D1                      | 3Unit         | Text            |                  |
	| 2         | Normalized Normal Reference Range Low For D1    | [Blank]       | Text            |                  |
	| 2         | Normalized Normal Reference Range High For D1   | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range Low for D1  | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range High For D1 | [Blank]       | Text            |                  |
	| 2         | Precision For D1                                | 3             | Text            |                  |
	| 2         | Reference Range Not Applicable For D1           | [Blank]       | Text            |                  |
	| 2         | Conversion Factor for D1                        | [Blank]       | Text            |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | Unit 4        | Text            |                  |
	| 2         | Out of Normal Range Indicator                   | [Blank]       | Text            |                  |

Scenario: T39_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 02-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T40_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "2" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 30            | Text            |                  |
	| 2         | Lab Test Description For D1                     | Test2         | Text            |                  |
	| 2         | Lab Test Code For D1                            | 2             | Text            |                  |
	| 2         | Lab Test Name For D1                            | MRRTEST2      | Text            |                  |
	| 2         | LOINC Code For D1                               | 2             | Text            |                  |
	| 2         | Category For D1                                 | RBC2          | Text            |                  |
	| 2         | Specimen For D1                                 | Automated2    | Text            |                  |
	| 2         | Method For D1                                   | Quantitative2 | Text            |                  |
	| 2         | Result Type For D1                              | n/a           | Text            |                  |
	| 2         | Normal Reference Range Low For D1               | [Blank]       | Text            |                  |
	| 2         | Normal Reference Range High For D1              | [Blank]       | Text            |                  |
	| 2         | Subcategory For D1                              | Serum2        | Text            |                  |
	| 2         | Critical Reference Range High For D1            | [Blank]       | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | [Blank]       | Text            |                  |
	| 2         | Reference Range ID For D1                       | [Blank]       | Text            |                  |
	| 2         | Normalized Patient Lab Value For D1             | [Blank]       | Text            |                  |
	| 2         | Normalized Lab Unit For D1                      | 3Unit         | Text            |                  |
	| 2         | Normalized Normal Reference Range Low For D1    | [Blank]       | Text            |                  |
	| 2         | Normalized Normal Reference Range High For D1   | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range Low for D1  | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range High For D1 | [Blank]       | Text            |                  |
	| 2         | Precision For D1                                | 3             | Text            |                  |
	| 2         | Reference Range Not Applicable For D1           | [Blank]       | Text            |                  |
	| 2         | Conversion Factor for D1                        | [Blank]       | Text            |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | Unit 4        | Text            |                  |
	| 2         | Out of Normal Range Indicator                   | [Blank]       | Text            |                  |

#Study publish-Major study update
#US63142-Labs No to Yes- Do Not Migrate
Scenario: T41_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Study Publish_No_Yes.zip" with Label "Major1"
	And I click continue in modal dialog having title "Confirm" and partial message "Uploaded study version has Local Labs as Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T42_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                       |
    | Publishing of Study file (Major1) - complete. |

#After study publish and Before Patient Migration verify form data
Scenario: T43_Verify the Lab report data is populated with all the latest Dictionary lab values
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

Scenario: T44_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T45_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
    When I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20            | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1         | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1             | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1      | Text            |                  |
	| 1         | LOINC Code For D1                               | 1             | Text            |                  |
	| 1         | Category For D1                                 | RBC1          | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1    | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1 | Text            |                  |
	| 1         | Result Type For D1                              | g/dl          | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | [Blank]       | Text            |                  |
	| 1         | Normal Reference Range High For D1              | [Blank]       | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1        | Text            |                  |
	| 1         | Critical Reference Range High For D1            | [Blank]       | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | [Blank]       | Text            |                  |
	| 1         | Reference Range ID For D1                       | [Blank]       | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | [Blank]       | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit         | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | [Blank]       | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | [Blank]       | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | [Blank]       | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | [Blank]       | Text            |                  |
	| 1         | Precision For D1                                | 5             | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | [Blank]       | Text            |                  |
	| 1         | Conversion Factor for D1                        | [Blank]       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3        | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | [Blank]       | Text            |                  |

Scenario: T46_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID3} |

Scenario: T47_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID3}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: T48_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "AutoBuildQuestionsForD1:"
	And I expand row "1" of table "AutoBuildQuestionsForD1:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:".

Scenario: T49_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST2" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Female | >             | 0          | <           | 25       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 30                   | 4Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID4} |

Scenario: T50_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "2" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 30            | Text            |                  |
	| 2         | Lab Test Description For D1                     | Test2         | Text            |                  |
	| 2         | Lab Test Code For D1                            | 2             | Text            |                  |
	| 2         | Lab Test Name For D1                            | MRRTEST2      | Text            |                  |
	| 2         | LOINC Code For D1                               | 2             | Text            |                  |
	| 2         | Category For D1                                 | RBC2          | Text            |                  |
	| 2         | Specimen For D1                                 | Automated2    | Text            |                  |
	| 2         | Method For D1                                   | Quantitative2 | Text            |                  |
	| 2         | Result Type For D1                              | n/a           | Text            |                  |
	| 2         | Normal Reference Range Low For D1               | [Blank]       | Text            |                  |
	| 2         | Normal Reference Range High For D1              | [Blank]       | Text            |                  |
	| 2         | Subcategory For D1                              | Serum2        | Text            |                  |
	| 2         | Critical Reference Range High For D1            | [Blank]       | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | [Blank]       | Text            |                  |
	| 2         | Reference Range ID For D1                       | [Blank]       | Text            |                  |
	| 2         | Normalized Patient Lab Value For D1             | [Blank]       | Text            |                  |
	| 2         | Normalized Lab Unit For D1                      | 3Unit         | Text            |                  |
	| 2         | Normalized Normal Reference Range Low For D1    | [Blank]       | Text            |                  |
	| 2         | Normalized Normal Reference Range High For D1   | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range Low for D1  | [Blank]       | Text            |                  |
	| 2         | Normalized Critical Reference Range High For D1 | [Blank]       | Text            |                  |
	| 2         | Precision For D1                                | 3             | Text            |                  |
	| 2         | Reference Range Not Applicable For D1           | [Blank]       | Text            |                  |
	| 2         | Conversion Factor for D1                        | [Blank]       | Text            |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | Unit 4        | Text            |                  |
	| 2         | Out of Normal Range Indicator                   | [Blank]       | Text            |                  |

Scenario: T51_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 02-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T52_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "2" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2             | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 30                      | Text            |                  |
	| 2         | Lab Test Description For D1                     | Test2                   | Text            |                  |
	| 2         | Lab Test Code For D1                            | 2                       | Text            |                  |
	| 2         | Lab Test Name For D1                            | MRRTEST2                | Text            |                  |
	| 2         | LOINC Code For D1                               | 2                       | Text            |                  |
	| 2         | Category For D1                                 | RBC2                    | Text            |                  |
	| 2         | Specimen For D1                                 | Automated2              | Text            |                  |
	| 2         | Method For D1                                   | Quantitative2           | Text            |                  |
	| 2         | Result Type For D1                              | n/a                     | Text            |                  |
	| 2         | Normal Reference Range Low For D1               | > 10.000                | Text            |                  |
	| 2         | Normal Reference Range High For D1              | < 15.000                | Text            |                  |
	| 2         | Subcategory For D1                              | Serum2                  | Text            |                  |
	| 2         | Critical Reference Range High For D1            | < 30.000                | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | > 5.000                 | Text            |                  |
	| 2         | Reference Range ID For D1                       | {ReferenceRangeID4}     | Text            |                  |
	| 2         | Normalized Patient Lab Value For D1             | 120.000                 | Text            |                  |
	| 2         | Normalized Lab Unit For D1                      | 3Unit                   | Text            |                  |
	| 2         | Normalized Normal Reference Range Low For D1    | > 40.000                | Text            |                  |
	| 2         | Normalized Normal Reference Range High For D1   | < 60.000                | Text            |                  |
	| 2         | Normalized Critical Reference Range Low for D1  | > 20.000                | Text            |                  |
	| 2         | Normalized Critical Reference Range High For D1 | < 120.000               | Text            |                  |
	| 2         | Precision For D1                                | 3                       | Text            |                  |
	| 2         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 2         | Conversion Factor for D1                        | 4                       | Text            |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | Unit 4                  | Text            |                  |
	| 2         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

Scenario: T53_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "AutoBuildQuestionsForD1:"
	And I expand row "1" of table "AutoBuildQuestionsForD1:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:".

#Initial Data Setup
Scenario: T54_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T55_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "StudyPublish.zip" with study label "AllmappedforD1_1"
    Then I see study label "AllmappedforD1_1" in header 

Scenario: T56_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

Scenario: T57_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T58_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T59_Expand the Visit (Screening) and open the demographics form to update the data
	When I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
    | QuestionPrompt      | AnswerValue | AnswerFieldType |
    | What is your age    | 31          | TextBox         |
    | Age Unit            | Year        | ListBox         |
    | What is your gender | Male        | ListBox         |
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully. 

Scenario: T60_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
	And I click "Checkout" button on "FormD1" CRF. 
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1              | Lab02 (L02) | ListBox         |
	| CRF Collection Date Q1 For D1 | 06/10/2019  | TextBox         |
    And I expand row "1" of table "AutoBuildQuestionsForD1:" 
	And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | CRF Lab Value For D1           | 20          | TextBox         |                  |
	| No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3      | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T61_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

@ObjectiveEvidence @ReqID:US32215.1, US32215.2, US32215.3, US32215.4, US32215.5
#Study publish-Major study update
#Labs yes to No- Migrate all patients
Scenario: T62_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "StudyPublish_Yes_No.zip" with Label "Major1"
	And I click continue in modal dialog having title "Confirm" and partial message "Uploaded study version has Local Labs as Not Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T62_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                                                                                                             |
    | Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
    | Publishing of Study file (Major1) - complete.                                                                                       |

Scenario: T63_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3             | Unit 4         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T64_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 4                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: T65_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "AutoBuildQuestionsForD1:"
	And I expand row "1" of table "AutoBuildQuestionsForD1:"
	Then I should not see visual indicator for question "CRF Lab Value For D1" in table "AutoBuildQuestionsForD1:".

#Labs No to No - Major study update
Scenario: T66_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "AllmappedforD1_1_20200108_T16201803.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T67_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	And I check subjects in inbox folder "Jobs"
    | Subject                                                                                                                             |
    | Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
    | Publishing of Study file (Major1) - complete.                                                                                       |
	Then  I do not see the Tab "Local Labs"

Scenario: T68_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 4             | Unit 3         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T69_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
    When I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

#Study publish-Major study update
#Labs No to Yes- Migrate all patients
Scenario: T70_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Study Publish_No_Yes.zip" with Label "Major1"
	And I click continue in modal dialog having title "Confirm" and partial message "Uploaded study version has Local Labs as Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T71_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                                                                                                             |
    | Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
    | Publishing of Study file (Major1) - complete.                                                                                       |

Scenario: T72_Verify the Lab report data is populated with all the latest Dictionary lab values	 
    Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    When I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20            | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1         | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1             | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1      | Text            |                  |
	| 1         | LOINC Code For D1                               | 1             | Text            |                  |
	| 1         | Category For D1                                 | RBC1          | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1    | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1 | Text            |                  |
	| 1         | Result Type For D1                              | g/dl          | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | [Blank]       | Text            |                  |
	| 1         | Normal Reference Range High For D1              | [Blank]       | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1        | Text            |                  |
	| 1         | Critical Reference Range High For D1            | [Blank]       | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | [Blank]       | Text            |                  |
	| 1         | Reference Range ID For D1                       | [Blank]       | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | [Blank]       | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit         | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | [Blank]       | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | [Blank]       | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | [Blank]       | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | [Blank]       | Text            |                  |
	| 1         | Precision For D1                                | 5             | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | [Blank]       | Text            |                  |
	| 1         | Conversion Factor for D1                        | [Blank]       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3        | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | [Blank]       | Text            |                  |

Scenario: T73_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID2} |

Scenario: T74_Verify the Lab report data is populated with all the latest Dictionary lab values	 
    Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    When I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"  
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test1                   | Text            |                  |
	| 1         | Lab Test Code For D1                            | 1                       | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST1                | Text            |                  |
	| 1         | LOINC Code For D1                               | 1                       | Text            |                  |
	| 1         | Category For D1                                 | RBC1                    | Text            |                  |
	| 1         | Specimen For D1                                 | Automated1              | Text            |                  |
	| 1         | Method For D1                                   | Quantitative1           | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum1                  | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID2}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | 100.00000               | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 1Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | > 50.00000              | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | < 75.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | > 25.00000              | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | < 100.00000             | Text            |                  |
	| 1         | Precision For D1                                | 5                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | 5                       | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: T75_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "AutoBuildQuestionsForD1:"
	And I expand row "1" of table "AutoBuildQuestionsForD1:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:".
