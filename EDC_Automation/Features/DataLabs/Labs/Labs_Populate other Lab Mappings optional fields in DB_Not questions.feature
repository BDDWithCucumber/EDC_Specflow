Feature: PopulateOtherLabMappingsOptionalFieldsInDB

		Test Summary:

		1. Verify data is populated for Lab Test Description, Reference Range Not Applicable, Reference Range ID, Precision,Conversion Factor in DB based on Lab Mappings.

#Userstory: US59797
#Userstory Link US59797: https://rally1.rallydev.com/#/244270786880ud/detail/userstory/284975541128
#Author:Swathi Polishetty
#Copyright © 2018 PAREXEL International

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Labs_Original_R.zip" with study label "Test4500_CodleistLinkages_Base"
    Then I see study label "Test4500_CodleistLinkages_Base" in header

Scenario: 04_Add sites and associate user.
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
Scenario: 05_Add Labs
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

Scenario: 07_Add Patient
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    When I add patient with below details.
     | ScreenID | PatientInitials | ScreenDate |
     | 01       |   PAT           | 06/13/2019 |
	Then I see below patients added in the Patients table.
     | PatientID |
     | 01-PAT    |

Scenario: 08_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2019| Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

##Add RR records in RR screen
Scenario: 09_Add a new lab test reference range record
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 03/03/2020 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 1.41                | <                       | 25.71                | in   | False |
	  Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

Scenario: 10_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: 11_Expand the Visit (Screening) and open the demographics form to update the data.
	  And I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 31          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 12_Expand the Visit (Week2) event and open the LabForm3 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
      And I click "Checkout" button on "LabForm3" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt       | AnswerValue | AnswerFieldType |
      | Lab ID2              | Lab01 (L01) | ListBox         |
      | CRF Collection Date2 | 10/28/2019  | TextBox         |
	  And I enter below "Autobuild Table2:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab Value2 | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit2  | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm3" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Verify Lab Mappings optional field values in Database which are not questions
@ObjectiveEvidence US59797.1
Scenario: 13_Verify Lab Mappings optional fields in DB.
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0'".
	  Then The below result should be retrieved with Reference Range ID.
	| Data Value              |
	| 01                      |
	| > 3.00                  |
	| < 15.00                 |
	| > 20.41                 |
	| < 25.71                 |
	| No                      |
	| {ReferenceRangeID1}     |
	| Above normal range high |
	| 2                       |
	| 2                       |
	
 Scenario: 14_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Gender:        | Male               | Female         | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

 Scenario: 15_Verify Lab Mappings optional fields in DB.
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0'".
	  Then The below result should be retrieved with Reference Range ID.
	| Data Value |
	| 01         |
	|            |
	|            |
	|            |
	|            |
	|            |
	|            |
	|            |
	| 2          |
	| 2          |