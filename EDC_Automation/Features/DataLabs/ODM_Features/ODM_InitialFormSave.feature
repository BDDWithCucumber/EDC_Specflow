Feature: ODM_InitialFormSave

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "AllmappedforD1_1_20191213_T12120518.zip" with study label "AllmappedforD1_1"
    Then I see study label "AllmappedforD1_1" in header 

Scenario: 04_Add site in Site Management and associate testadmin testadmin user to 01-Site
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: T05_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |

Scenario: T06_Associate Lab L02 to 01-Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L02   | Lab02          | PFIZER  | RD         | Active           |

Scenario: T07_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST21" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

Scenario: T08_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T09_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T10_Expand the Visit (Screening) and open the demographics form to update the data
	When I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
    | QuestionPrompt      | AnswerValue | AnswerFieldType |
    | What is your age    | 31          | TextBox         |
    | Age Unit            | Year        | ListBox         |
    | What is your gender | Male        | ListBox         |
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully. 

#Autobuild Table Row save
Scenario: T11_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
	And I click "Checkout" button on "FormD1" CRF. 
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1              | Lab02 (L02) | ListBox         |
	| CRF Collection Date Q1 For D1 | 06/10/2019  | TextBox         |
    And I expand row "1" of table "AutoBuildQuestionsForD1:" 
	Then I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | CRF Lab Value For D1           | 20          | TextBox         |                  |
	| No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3      | ListBox         | Save & Close Row |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T12_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "RowSaveODMActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "RowSaveODMExpected.xml" available in the project folder.
	And I have the XML file "RowSaveODMActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

#Autobuild Table Row save with Entry complete 
Scenario: T13_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	When I select entry complete checkbox on CRF. 
	And I expand row "1" of table "AutoBuildQuestionsForD1:"
	#And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
    Then I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
    | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
    | No        | 1         | CRF Lab Value For D1 | 20                 | 20             | SEC             | TextBox         | Save & Close Row |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T14_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "RowSaveWithEntryCompleteODMActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "RowSaveWithEntryCompleteODMExpected.xml" available in the project folder.
	And I have the XML file "RowSaveWithEntryCompleteODMActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

#Form Save
Scenario: T15_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	When I click on "Save" button on "FormD1" CRF.
	And I expand row "1" of table "AutoBuildQuestionsForD1:"
	Then I verify below ReferenceRange CRF "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1             | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 20                      | Text            |                  |
	| 1         | Lab Test Description For D1                     | Test11                  | Text            |                  |
	| 1         | Lab Test Code For D1                            | 21                      | Text            |                  |
	| 1         | Lab Test Name For D1                            | MRRTEST21               | Text            |                  |
	| 1         | LOINC Code For D1                               | 21                      | Text            |                  |
	| 1         | Category For D1                                 | RBC01                   | Text            |                  |
	| 1         | Specimen For D1                                 | Automated01             | Text            |                  |
	| 1         | Method For D1                                   | Quantitative01          | Text            |                  |
	| 1         | Result Type For D1                              | g/dl                    | Text            |                  |
	| 1         | Normal Reference Range Low For D1               | > 10.00000              | Text            |                  |
	| 1         | Normal Reference Range High For D1              | < 15.00000              | Text            |                  |
	| 1         | Subcategory For D1                              | Serum01                 | Text            |                  |
	| 1         | Critical Reference Range High For D1            | < 20.00000              | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | > 5.00000               | Text            |                  |
	| 1         | Reference Range ID For D1                       | {ReferenceRangeID1}     | Text            |                  |
	| 1         | Normalized Patient Lab Value For D1             | [Blank]                 | Text            |                  |
	| 1         | Normalized Lab Unit For D1                      | 5Unit                   | Text            |                  |
	| 1         | Normalized Normal Reference Range Low For D1    | [Blank]                 | Text            |                  |
	| 1         | Normalized Normal Reference Range High For D1   | [Blank]                 | Text            |                  |
	| 1         | Normalized Critical Reference Range Low for D1  | [Blank]                 | Text            |                  |
	| 1         | Normalized Critical Reference Range High For D1 | [Blank]                 | Text            |                  |
	| 1         | Precision For D1                                | 3                       | Text            |                  |
	| 1         | Reference Range Not Applicable For D1           | No                      | Text            |                  |
	| 1         | Conversion Factor for D1                        | [Blank]                 | Text            |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | Unit 3                  | Text            |                  |
	| 1         | Out of Normal Range Indicator                   | Above normal range high | Text            |                  |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T16_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "InitialFormSaveODMActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "InitialFormSaveODMExpected.xml" available in the project folder.
	And I have the XML file "InitialFormSaveODMActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

