Feature: ReassociateReferenceRangeDemoFormchanges

		Test Summary:

			1. Verify Reference Ranges are cleared on Lab Form when Clear Item action is performed on Age and Gender.
			2. Verify Reference Ranges are cleared on Lab Form when MNA action is performed on Age and Gender.


Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete existing study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Labs_Original_R.zip" with study label "Test4500_CodleistLinkages_Base"
    Then I see study label "Test4500_CodleistLinkages_Base" in header

Scenario: 04_Add site in Site Management and associate user
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

#Adding Labs
Scenario: 05_Add Lab in Lab Management
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I enter labs details and Save
	| LabId | LaboratoryName | Company    | Department | Address1       | Address2  | Address3    | City      | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | Perceptive | EDC        | Building No 20 | Mindspace | Hitech city | Hyderabad | TG    | 500081 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company    | Department | Address1       | Address2  | Address3    | City      | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | Perceptive | EDC        | Building No 20 | Mindspace | Hitech city | Hyderabad | TG    | 500081 | INDIA(IND) | INDIA   | 11111111 | 22222222 | Active           | Mr.XYZ        |

#Associating Lab to Site
Scenario: 06_Associate Lab L01 to 01-Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company    | Department | LaboratoryStatus |
	| L01   | Lab01          | Perceptive | EDC        | Active           |

Scenario: 07_Add a Patient
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    When I add patient with below details.
     | ScreenID | PatientInitials | ScreenDate |
     | 01       |   PAT           | 06/13/2018 |
	Then I see below patients added in the Patients table.
     | PatientID |
     | 01-PAT    |

Scenario: 08_Select and enroll patient 01-PAT
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

##Add RR records in RR screen
Scenario: 09_Add a new lab test reference range record
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 03/03/2019 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 2.41                | <                       | 25.71                | in   | False |
	 Then a Reference ID is auto generated for a newly added lab test in ReferenceRangesPage

Scenario: 10_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Enter data on Demographics form
Scenario: 11_Expand the Visit (Screening) and open the demographics form to update the data
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
Scenario: 12_Expand the Visit (Week2) event and open the LabForm2 form and update the data
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 02/28/2019  | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 13_Verify the Lab Form data
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  #Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Link            |                  |
		| 2         | Lab Test Description                     | 01                      | Link            |                  |
		| 2         | CRF Lab Unit                             | 01                      | Link            |                  |
		| 2         | CRF Lab value                            | 16                      | Link            |                  |
		| 2         | Lab Test Name                            | 01                      | Text            |                  |
		| 2         | Lab Test Code                            | 01                      | Text            |                  |
		| 2         | LOINC Code                               | 1                       | Text            |                  |
		| 2         | Category                                 | Cat1                    | Text            |                  |
		| 2         | Subcategory                              | SubCat1                 | Text            |                  |
		| 2         | Specimen                                 | Specimen1               | Text            |                  |
		| 2         | Method                                   | Method1                 | Text            |                  |
		| 2         | Result Type                              | Result1                 | Text            |                  |
		| 2         | Normal Reference Range High              | < 15.00                 | Text            |                  |
		| 2         | Critical Reference Range Low             | > 20.41                 | Text            |                  |
		| 2         | Normal Reference Range Low               | > 3.00                  | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71                 | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1}     | Text            |                  |
		| 2         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 32                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 6.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 30.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 40.82                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 51.42                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 2                       | Text            | Save & Close Row |


#Clear Gender and verify Reference Ranges
@ObjectiveEvidence @ReqId:US60583.1,2,3,4
Scenario: 14_Clear Gender and verify Reference ranges are re-evaluated on Lab Form
	When I click on "Save & Close" button on "LabForm2" CRF.
	And I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	And I click "Checkout" button on "Demographics RTSM" CRF.
	And I clear question "Gender:".
	And I enter notes "Clear Item 2 for testing" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.
	Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue | AnswerFieldType |
		| Lab Name       | Lab01                               | Text            |
		| Company        | Perceptive                          | Text            |
		| Lab Address    | Building No 20 Mindspace Hitechcity | Text            |
		| Country        | INDIA                               | Text            |
	#Given I am on "LabForm2" CRF
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Link            |                  |
		| 2         | Lab Test Description                     | [Blank]     | Link            |                  |
		| 2         | CRF Lab Unit                             | 01          | Link            |                  |
		| 2         | CRF Lab value                            | 16          | Link            |                  |
		| 2         | Lab Test Name                            | [Blank]     | Text            |                  |
		| 2         | Lab Test Code                            | [Blank]     | Text            |                  |
		| 2         | LOINC Code                               | [Blank]     | Text            |                  |
		| 2         | Category                                 | [Blank]     | Text            |                  |
		| 2         | Subcategory                              | [Blank]     | Text            |                  |
		| 2         | Specimen                                 | [Blank]     | Text            |                  |
		| 2         | Method                                   | [Blank]     | Text            |                  |
		| 2         | Result Type                              | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]     | Text            |                  |
		| 2         | Reference Range ID                       | [Blank]     | Text            |                  |
		| 2         | Out of Normal Range Indicator            | [Blank]     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]     | Text            |                  |
		| 2         | Normalized Lab Unit                      | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]     | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]     | Text            |                  |
		| 2         | Precision                                | [Blank]     | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]     | Text            | Save & Close Row |
	  

#Select Gender again
Scenario: 15_Expand the Visit (Screening) event and open the Demographics RTSM form and update the data
	  When I click on "Save & Close" button on "LabForm2" CRF.
	  And I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	  And I click "Checkout" button on "Demographics RTSM" CRF.      
	  And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Clear Age and verify Reference Ranges
@ObjectiveEvidence @ReqId:US60583.1,2,3,4
Scenario: 16_Clear Age and verify References ranges are re-evaluated on Lab Form
	When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	And I click "Checkout" button on "Demographics RTSM" CRF.
	And I clear question "Age at Study Start:".
	And I enter notes "Clear Item 9 for testing" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.
	Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue | AnswerFieldType |
		| Lab Name       | Lab01                               | Text            |
		| Company        | Perceptive                          | Text            |
		| Lab Address    | Building No 20 Mindspace Hitechcity | Text            |
		| Country        | INDIA                               | Text            |
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Link            |                  |
		| 2         | Lab Test Description                     | [Blank]     | Link            |                  |
		| 2         | CRF Lab Unit                             | 01          | Link            |                  |
		| 2         | CRF Lab value                            | 16          | Link            |                  |
		| 2         | Lab Test Name                            | [Blank]     | Text            |                  |
		| 2         | Lab Test Code                            | [Blank]     | Text            |                  |
		| 2         | LOINC Code                               | [Blank]     | Text            |                  |
		| 2         | Category                                 | [Blank]     | Text            |                  |
		| 2         | Subcategory                              | [Blank]     | Text            |                  |
		| 2         | Specimen                                 | [Blank]     | Text            |                  |
		| 2         | Method                                   | [Blank]     | Text            |                  |
		| 2         | Result Type                              | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]     | Text            |                  |
		| 2         | Reference Range ID                       | [Blank]     | Text            |                  |
		| 2         | Out of Normal Range Indicator            | [Blank]     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]     | Text            |                  |
		| 2         | Normalized Lab Unit                      | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]     | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]     | Text            |                  |
		| 2         | Precision                                | [Blank]     | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]     | Text            | Save & Close Row |

#Select Age again
Scenario: 17_Expand the Visit (Screening) event and open the Demographics RTSM form and update the data
	  When I click on "Save & Close" button on "LabForm2" CRF.
	  And  I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	  And I click "Checkout" button on "Demographics RTSM" CRF.      
	  And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Age at Study Start: | 31          | TextBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Clear Age Unit and verify Reference Ranges
@ObjectiveEvidence @ReqId:US60583.1,2,3,4
Scenario: 18_Clear Age Unit and verify References ranges are re-evaluated on Lab Form
	When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	And I click "Checkout" button on "Demographics RTSM" CRF.
	And I clear question "Age Units at Study Start:".
	And I enter notes "Clear Item 10 for testing" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.
	Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue | AnswerFieldType |
		| Lab Name       | Lab01                               | Text            |
		| Company        | Perceptive                          | Text            |
		| Lab Address    | Building No 20 Mindspace Hitechcity | Text            |
		| Country        | INDIA                               | Text            |
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Link            |                  |
		| 2         | Lab Test Description                     | [Blank]     | Link            |                  |
		| 2         | CRF Lab Unit                             | 01          | Link            |                  |
		| 2         | CRF Lab value                            | 16          | Link            |                  |
		| 2         | Lab Test Name                            | [Blank]     | Text            |                  |
		| 2         | Lab Test Code                            | [Blank]     | Text            |                  |
		| 2         | LOINC Code                               | [Blank]     | Text            |                  |
		| 2         | Category                                 | [Blank]     | Text            |                  |
		| 2         | Subcategory                              | [Blank]     | Text            |                  |
		| 2         | Specimen                                 | [Blank]     | Text            |                  |
		| 2         | Method                                   | [Blank]     | Text            |                  |
		| 2         | Result Type                              | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]     | Text            |                  |
		| 2         | Reference Range ID                       | [Blank]     | Text            |                  |
		| 2         | Out of Normal Range Indicator            | [Blank]     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]     | Text            |                  |
		| 2         | Normalized Lab Unit                      | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]     | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]     | Text            |                  |
		| 2         | Precision                                | [Blank]     | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]     | Text            | Save & Close Row |


#Select Age Unit again
Scenario: 19_Expand the Visit (Screening) event and open the Demographics RTSM form and update the data
	  When I click on "Save & Close" button on "LabForm2" CRF.
	  And I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	  And I click "Checkout" button on "Demographics RTSM" CRF.      
	  And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Perform Mark Not Answered action for Gender and verify Reference Ranges
@ObjectiveEvidence @ReqId:US60583.1,2,3,4
Scenario: 20_Clear Gender and verify References ranges are re-evaluated on Lab Form
	When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	And I click "Checkout" button on "Demographics RTSM" CRF.
	And I click icon "icon_mna_disabled.png" for the flat question "Gender:" in CRF
    And I enter comments "Comments for MarkItemNotAnswered" in MarkItemDialog 
    And I click ok button in MarkItemDialog
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.
	Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue                         | AnswerFieldType |
		| Lab Name       | Lab01                               | Text            |
		| Company        | Perceptive                          | Text            |
		| Lab Address    | Building No 20 Mindspace Hitechcity | Text            |
		| Country        | INDIA                               | Text            |
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Link            |                  |
		| 2         | Lab Test Description                     | [Blank]     | Link            |                  |
		| 2         | CRF Lab Unit                             | 01          | Link            |                  |
		| 2         | CRF Lab value                            | 16          | Link            |                  |
		| 2         | Lab Test Name                            | [Blank]     | Text            |                  |
		| 2         | Lab Test Code                            | [Blank]     | Text            |                  |
		| 2         | LOINC Code                               | [Blank]     | Text            |                  |
		| 2         | Category                                 | [Blank]     | Text            |                  |
		| 2         | Subcategory                              | [Blank]     | Text            |                  |
		| 2         | Specimen                                 | [Blank]     | Text            |                  |
		| 2         | Method                                   | [Blank]     | Text            |                  |
		| 2         | Result Type                              | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]     | Text            |                  |
		| 2         | Reference Range ID                       | [Blank]     | Text            |                  |
		| 2         | Out of Normal Range Indicator            | [Blank]     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]     | Text            |                  |
		| 2         | Normalized Lab Unit                      | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]     | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]     | Text            |                  |
		| 2         | Precision                                | [Blank]     | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]     | Text            | Save & Close Row |

 #Enter Gender value again
Scenario: 21_Expand the Visit (Screening) event and open the Demographics RTSM form and update the data
	  When I click on "Save & Close" button on "LabForm2" CRF.
	  And I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	  And I click "Checkout" button on "Demographics RTSM" CRF      
      And I enter below flat questions data in the CRF.
	   | QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	   | Gender:        | [Blank]            | ListBox         | Male           | DCF             | Updated         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Perform Mark Not Answered action on Age and verify Reference Ranges
@ObjectiveEvidence @ReqId:US60583.1,2,3,4
Scenario: 22_Clear Age and verify References ranges are re-evaluated on Lab Form
	When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	And I click "Checkout" button on "Demographics RTSM" CRF.
	And I click icon "icon_mna_disabled.png" for the flat question "Age at Study Start:" in CRF
    And I enter comments "Comments for MarkItemNotAnswered" in MarkItemDialog 
    And I click ok button in MarkItemDialog
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.
	Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue                         | AnswerFieldType |
		| Lab Name       | Lab01                               | Text            |
		| Company        | Perceptive                          | Text            |
		| Lab Address    | Building No 20 Mindspace Hitechcity | Text            |
		| Country        | INDIA                               | Text            |
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Link            |                  |
		| 2         | Lab Test Description                     | [Blank]     | Link            |                  |
		| 2         | CRF Lab Unit                             | 01          | Link            |                  |
		| 2         | CRF Lab value                            | 16          | Link            |                  |
		| 2         | Lab Test Name                            | [Blank]     | Text            |                  |
		| 2         | Lab Test Code                            | [Blank]     | Text            |                  |
		| 2         | LOINC Code                               | [Blank]     | Text            |                  |
		| 2         | Category                                 | [Blank]     | Text            |                  |
		| 2         | Subcategory                              | [Blank]     | Text            |                  |
		| 2         | Specimen                                 | [Blank]     | Text            |                  |
		| 2         | Method                                   | [Blank]     | Text            |                  |
		| 2         | Result Type                              | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]     | Text            |                  |
		| 2         | Reference Range ID                       | [Blank]     | Text            |                  |
		| 2         | Out of Normal Range Indicator            | [Blank]     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]     | Text            |                  |
		| 2         | Normalized Lab Unit                      | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]     | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]     | Text            |                  |
		| 2         | Precision                                | [Blank]     | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]     | Text            | Save & Close Row |

#Enter Age value again
Scenario: 23_Expand the Visit (Screening) event and open the Demographics RTSM form and update the data
	  When I click on "Save & Close" button on "LabForm2" CRF.
	  And I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	  And I click "Checkout" button on "Demographics RTSM" CRF    
      And I enter below flat questions data in the CRF.
	   | QuestionPrompt      | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	   | Age at Study Start: | [Blank]            | TextBox         | 31             | DCF             | Updated         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Perform Mark Not Answered action on AgeUnit and verify Reference Ranges
@ObjectiveEvidence @ReqId:US60583.1,2,3,4
Scenario: 24_Clear AgeUnit and verify References ranges are re-evaluated on Lab Form
	When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	And I click "Checkout" button on "Demographics RTSM" CRF.
	And I click icon "icon_mna_disabled.png" for the flat question "Age Units at Study Start:" in CRF
    And I enter comments "Comments for MarkItemNotAnswered" in MarkItemDialog 
    And I click ok button in MarkItemDialog
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.
	Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue                         | AnswerFieldType |
		| Lab Name       | Lab01                               | Text            |
		| Company        | Perceptive                          | Text            |
		| Lab Address    | Building No 20 Mindspace Hitechcity | Text            |
		| Country        | INDIA                               | Text            |
	And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Link            |                  |
		| 2         | Lab Test Description                     | [Blank]     | Link            |                  |
		| 2         | CRF Lab Unit                             | 01          | Link            |                  |
		| 2         | CRF Lab value                            | 16          | Link            |                  |
		| 2         | Lab Test Name                            | [Blank]     | Text            |                  |
		| 2         | Lab Test Code                            | [Blank]     | Text            |                  |
		| 2         | LOINC Code                               | [Blank]     | Text            |                  |
		| 2         | Category                                 | [Blank]     | Text            |                  |
		| 2         | Subcategory                              | [Blank]     | Text            |                  |
		| 2         | Specimen                                 | [Blank]     | Text            |                  |
		| 2         | Method                                   | [Blank]     | Text            |                  |
		| 2         | Result Type                              | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range High              | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range Low             | [Blank]     | Text            |                  |
		| 2         | Normal Reference Range Low               | [Blank]     | Text            |                  |
		| 2         | Critical Reference Range High            | [Blank]     | Text            |                  |
		| 2         | Reference Range ID                       | [Blank]     | Text            |                  |
		| 2         | Out of Normal Range Indicator            | [Blank]     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]     | Text            |                  |
		| 2         | Normalized Lab Unit                      | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]     | Text            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]     | Text            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]     | Text            |                  |
		| 2         | Precision                                | [Blank]     | Text            |                  |
		| 2         | Conversion Factor                        | [Blank]     | Text            | Save & Close Row |
