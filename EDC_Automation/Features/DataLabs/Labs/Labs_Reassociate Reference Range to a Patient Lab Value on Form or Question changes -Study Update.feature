Feature: ReassociateRR_FormQuestionChanges_StudyUpdate
 
		Test Summary:

		1. Verify Reference Ranges are retained on eCRF and DB when Domain Item of "Lab ID" is changed to other question within same form.
		2. Verify Reference Ranges are retained on eCRF and DB when Domain Item of "CRF Collection Date" is changed to other question within same form.
		3. Verify Reference Ranges are retained on eCRF and DB when Domain Item of "Lab Unit" is changed to other question within same form.
		4. Verify Reference Ranges are retained on eCRF and DB when Domain Item of "Lab Value" is changed to other question within same form.
	
#Userstory: US58068,US56642
#Userstory Link US58068: https://rally1.rallydev.com/#/244270786880ud/detail/userstory/271128258816
#Userstory Link US56642: https://rally1.rallydev.com/#/244270786880ud/detail/userstory/264611743484
#Author:Swathi Polishetty
#Copyright © 2018 PAREXEL International


Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete existing study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Labs_Original_S.zip" with study label "Test4500_CodleistLinkages_Base"
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

Scenario: 07_Select Complete Change History in User preferences
	When I select DataManagerPortal item "User Preferences" from drop down
	And I enable CompleteChangeHistory in UserPreferencesPage
	And I click save button in UserPreferencesPage
	Then I see Save Success message on User Preferences page.

Scenario: 08_Add a Patient
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    When I add patient with below details.
     | ScreenID | PatientInitials | ScreenDate |
     | 01       | PAT             | 06/13/2018 |
     | 02       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
     | PatientID |
     | 01-PAT    |
	 | 02-PAT    |

##Add RR records in RR screen
Scenario: 09_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 03/03/2019 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | in   | False |
	 Then a Reference ID is auto generated for a newly added lab test in ReferenceRangesPage

Scenario: 10_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Enter data on Demographics form
Scenario: 11_Expand the Visit (Screening) and open the demographics form to update the data for 01-PAT
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
Scenario: 12_Expand the Visit (Week 2) event and open the LabForm2 form and update the data for 01-PAT
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

#Verify Reference Ranges are populated on eCRF
Scenario: 13_Verify the Lab Form data for 01-PAT
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.	
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
		| 2         | CRF Lab Unit                             | 01                      | Text            |                  |
		| 2         | CRF Lab value                            | 16                      | Text            |                  |
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
		| 2         | Conversion Factor                        | 2                       | Text            | Ok               |

#Verify Visual Indicator 
Scenario: 14_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 


Scenario: 15_Expand the Visit (Week 2) event and open the LabForm3 form and update the data for 01-PAT
	  When I click on "cancel" button on "LabForm2" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
      And I click "Checkout" button on "LabForm3" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt       | AnswerValue | AnswerFieldType |
      | Lab ID2              | Lab01 (L01) | ListBox         |
      | CRF Collection Date2 | 02/28/2019  | TextBox         |
	  And I enter below "Autobuild Table2:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab Value2 | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit2  | 01          | ListBox         | Save & Close Row |
	  And I click on "Save" button on "LabForm3" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 16_Verify Reference Ranges of LabForm3 in DB for 01-PAT
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0'".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | 01                      |
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
	  | No                      |
	  | {ReferenceRangeID1}     |
	  | Above normal range high |
	  | 32                      |
	  | cm                      |
	  | > 6.00                  |
	  | < 30.00                 |
	  | > 40.82                 |
	  | < 51.42                 |
	  | 2                       |
	  | 2                       |

#Verify Visual Indicator
Scenario: 17_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I expand row "2" of table "Autobuild Table2:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab Value2" in table "Autobuild Table2:".

Scenario: 18_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "02-PAT" from patients table.
      Then I see Patient details page for "02-PAT".

#Enter data on Demographics form
Scenario: 19_Expand the Visit (Screening) and open the demographics form to update the data for 02-PAT
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
Scenario: 20_Expand the Visit (Week 2) event and open the LabForm2 form and update the data for 02-PAT
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 02/28/2019  | TextBox         |
      | Lab ID1             | 01          | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 21_Verify the Lab Form data for 02-PAT
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.	
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
		| 2         | CRF Lab Unit                             | 01                      | Text            |                  |
		| 2         | CRF Lab value                            | 16                      | Text            |                  |
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
		| 2         | Conversion Factor                        | 2                       | Text            | Ok               |

Scenario: 22_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 02-PAT
	When I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

Scenario: 23_Expand the Visit (Week 2) event and open the LabForm3 form and update the data for 02-PAT
	  When I click on "cancel" button on "LabForm2" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
      And I click "Checkout" button on "LabForm3" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt       | AnswerValue | AnswerFieldType |
      | Lab ID2              | Lab01 (L01) | ListBox         |
      | CRF Collection Date2 | 02/28/2019  | TextBox         |
      | Lab ID3              | 01          | TextBox         |
	  And I enter below "Autobuild Table2:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab Value2 | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit2  | 01          | ListBox         | Save & Close Row |
	  And I click on "Save" button on "LabForm3" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 24_Verify Reference Ranges of LabForm3 in DB for 02-PAT
	  Given I have connected to Database.
	  When I execute the query "Select top 24 DataValue from PatientData where DataRowActive=0 and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3') order by DataDate desc".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | 01                      |
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
	  | No                      |
	  | {ReferenceRangeID1}     |
	  | Above normal range high |
	  | 32                      |
	  | cm                      |
	  | > 6.00                  |
	  | < 30.00                 |
	  | > 40.82                 |
	  | < 51.42                 |
	  | 2                       |
	  | 2                       |

Scenario: 25_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 02-PAT
	When I expand row "2" of table "Autobuild Table2:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab Value2" in table "Autobuild Table2:".	

################################### Major Study Update 1 #########################################################
# Updated Domain Item for Lab ID question in LabForm2
# Updated Domain Item for Lab ID question in LabForm3

Scenario: 26_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 27_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 28_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_T.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         | Migration of Site 01 for Study file (Major1) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.                                                                                       |

#01-PAT:Verify Reference Ranges are retained on eCRF when domain item is updated for Lab ID and mapped to other question within same form
@ObjectiveEvidence @ReqId:US58068.1,2,4
@ObjectiveEvidence @ReqId:US56642.2
Scenario: 29_Verify the Reference Ranges are retained for 01-PAT
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue | AnswerFieldType |
		| Lab ID1        | Lab01 (L01) | Text            |
	 And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
		| 2         | CRF Lab Unit                             | 01                      | Text            |                  |
		| 2         | CRF Lab value                            | 16                      | Text            |                  |
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
		| 2         | Conversion Factor                        | 2                       | Text            | Ok               |

#01-PAT:Verify Visual Indicator is also retained
@ObjectiveEvidence @ReqId:US56642.1
Scenario: 30_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

#01-PAT:Verify Reference Ranges are retained in DB when domain item is updated for Lab ID and mapped to other question within same form
@ObjectiveEvidence @ReqId:US58068.1,2,5
@ObjectiveEvidence @ReqId:US56642.3
Scenario: 31_Verify Reference Ranges of LabForm3 in DB for 01-PAT
	  Given I have connected to Database.
	  When I execute the query "Select top 24 DataValue from PatientData where DataRowActive=0 and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | 01                      |
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
	  | No                      |
	  | {ReferenceRangeID1}     |
	  | Above normal range high |
	  | 32                      |
	  | cm                      |
	  | > 6.00                  |
	  | < 30.00                 |
	  | > 40.82                 |
	  | < 51.42                 |
	  | 2                       |
	  | 2                       |

#01-PAT:Verify Visual Indicator is retained
@ObjectiveEvidence @ReqId:US56642.1
Scenario: 32_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
		When I click on "cancel" button on "LabForm2" CRF.
		And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
		And I expand row "2" of table "Autobuild Table2:"
		Then I should see icon Above Normal Range High indicator for question "CRF Lab Value2" in table "Autobuild Table2:".

Scenario: 33_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "02-PAT" from patients table.
      Then I see Patient details page for "02-PAT".

#02-PAT:Verify Reference Ranges are retained on eCRF when domain item is updated for Lab ID and mapped to other question within same form
@ObjectiveEvidence @ReqId:US58068.1,2,4
@ObjectiveEvidence @ReqId:US56642.2
Scenario: 34_Verify Reference Ranges are retained for 02-PAT
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.	
	  Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue | AnswerFieldType |
		| Lab ID         | 01          | Text            |
		| Lab ID1        | Lab01 (L01) | Text            |
	  And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
		| 2         | CRF Lab Unit                             | 01                      | Text            |                  |
		| 2         | CRF Lab value                            | 16                      | Text            |                  |
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
		| 2         | Conversion Factor                        | 2                       | Text            | Ok               |

#02-PAT:Verify Visual Indicator is retained
@ObjectiveEvidence @ReqId:US56642.1
Scenario: 35_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 02-PAT
	When I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

#02-PAT:Verify Reference Ranges are retained on eCRF when domain item is updated for Lab ID and mapped to other question within same form
@ObjectiveEvidence @ReqId:US58068.1,2,5
@ObjectiveEvidence @ReqId:US56642.3
Scenario: 36_Verify Reference Ranges of LabForm3 in DB for 02-PAT
	  Given I have connected to Database.
	  When I execute the query "Select top 24 DataValue from PatientData where DataRowActive=0 and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3') order by DataDate desc".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | 01                      |
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
	  | No                      |
	  | {ReferenceRangeID1}     |
	  | Above normal range high |
	  | 32                      |
	  | cm                      |
	  | > 6.00                  |
	  | < 30.00                 |
	  | > 40.82                 |
	  | < 51.42                 |
	  | 2                       |
	  | 2                       |

#02-PAT:Verify Visual Indicator is retained
@ObjectiveEvidence @ReqId:US56642.1
Scenario: 37_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 02-PAT
	When I click on "cancel" button on "LabForm2" CRF.
	And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
	When I expand row "2" of table "Autobuild Table2:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab Value2" in table "Autobuild Table2:".	

################################### Major Study Update 2 ########################################################
# Updated Domain Item for Collection Date question in LabForm2
# Updated Domain Item for Collection Date question in LabForm3

Scenario: 38_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 39_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 40_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_U.zip" with Label "Major2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         | Migration of Site 01 for Study file (Major2) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major2) - complete.                                                                                       |

#01-PAT:Verify Reference Ranges are retained on eCRF when domain item is updated for Collection Date and mapped to other question within same form
@ObjectiveEvidence @ReqId:US58068.1,2,4
@ObjectiveEvidence @ReqId:US56642.2
Scenario: 41_Verify Reference Ranges are retained for 01-PAT
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 Then I verify below flat questions data in the CRF.
		| QuestionPrompt       | AnswerValue | AnswerFieldType |
		| Lab ID1              | Lab01 (L01) | Text            |
		| CRF Collection Date1 | 02/28/2019  | Text            |
	 And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
		| 2         | CRF Lab Unit                             | 01                      | Text            |                  |
		| 2         | CRF Lab value                            | 16                      | Text            |                  |
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
		| 2         | Conversion Factor                        | 2                       | Text            | Ok               |

#01-PAT:Verify Visual Indicator is also retained
@ObjectiveEvidence @ReqId:US56642.1
Scenario: 42_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

#01-PAT:Verify Reference Ranges are retained in DB when domain item is updated for Collection Date and mapped to other question within same form
@ObjectiveEvidence @ReqId:US58068.1,2,5
@ObjectiveEvidence @ReqId:US56642.3
Scenario: 43_Verify Reference Ranges of LabForm3 in DB for 01-PAT
	  Given I have connected to Database.
	  When I execute the query "Select top 24 DataValue from PatientData where DataRowActive=0 and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | 01                      |
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
	  | No                      |
	  | {ReferenceRangeID1}     |
	  | Above normal range high |
	  | 32                      |
	  | cm                      |
	  | > 6.00                  |
	  | < 30.00                 |
	  | > 40.82                 |
	  | < 51.42                 |
	  | 2                       |
	  | 2                       |

#01-PAT:Verify Visual Indicator is retained
@ObjectiveEvidence @ReqId:US56642.1
Scenario: 44_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
		When I click on "cancel" button on "LabForm2" CRF.
		And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
		And I expand row "2" of table "Autobuild Table2:"
		Then I should see icon Above Normal Range High indicator for question "CRF Lab Value2" in table "Autobuild Table2:".

################################### Major Study Update 3 ########################################################
# Updated Domain Item for CRF Lab value question in LabForm2
# Updated Domain Item for CRF Lab Value question in LabForm3
# Updated Domain Item for CRF Lab Unit question in LabForm2
# Updated Domain Item for CRF Lab Unit question in LabForm3
# Deleted Reference Range questions in LabForm2
# Added Reference Range questions in LabForm3


Scenario: 45_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 46_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 47_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_V.zip" with Label "Major3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         | Migration of Site 01 for Study file (Major3) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major3) - complete.                                                                                       |

#01-PAT:Verify other Lab Parameter fields data is retained on eCRF when domain item is updated for Lab Value or Lab Unit and mapped to other question within same form.
@ObjectiveEvidence @ReqId:US58068.1,2,4
@ObjectiveEvidence @ReqId:US56642.2
Scenario: 48_Verify other Lab Parameter fields data is retained for 01-PAT
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 Then I verify below flat questions data in the CRF.
		| QuestionPrompt       | AnswerValue | AnswerFieldType |
		| Lab ID1              | Lab01 (L01) | Text            |
		| CRF Collection Date1 | 02/28/2019  | Text            |
	 And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | CRF Lab Unit1        | 01          | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | CRF Lab value1       | 16          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 1           | Text            |                  |
		| 2         | Category             | Cat1        | Text            |                  |
		| 2         | Subcategory          | SubCat1     | Text            |                  |
		| 2         | Specimen             | Specimen1   | Text            |                  |
		| 2         | Method               | Method1     | Text            |                  |
		| 2         | Result Type          | Result1     | Text            |                  |
		| 2         | Precision            | 2           | Text            |                  |
		| 2         | Conversion Factor    | 2           | Text            | Ok               |

#01-PAT:Verify Reference Ranges data is retained in DB for deleted questions
@ObjectiveEvidence @ReqId:US58068.1,2,5
@ObjectiveEvidence @ReqId:US56642.3
Scenario: 49_Verify Reference Ranges of LabForm2 in DB for 01-PAT
	  Given I have connected to Database.
	  When I execute the query "Select top 13 DataValue from PatientData where DataRowActive=0 and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm2') order by DataDate desc".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | > 3.00                  |
	  | < 15.00                 |
	  | > 20.41                 |
	  | < 25.71                 |
	  | No                      |
	  | {ReferenceRangeID1}     |
	  | Above normal range high |
	  | 32                      |
	  | cm                      |
	  | > 6.00                  |
	  | < 30.00                 |
	  | > 40.82                 |
	  | < 51.42                 |

#01-PAT:Verify Visual Indicator is also retained
@ObjectiveEvidence @ReqId:US56642.1
Scenario: 50_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value1" in table "Autobuild Table:".

#01-PAT:Verify Reference Ranges are retained and displayed on eCRF when added as questions & domain item is updated for CRF Lab Value / CRF Lab Unit and mapped to other question within same form
@ObjectiveEvidence @ReqId:US58068.1,2,4
@ObjectiveEvidence @ReqId:US56642.2
Scenario: 51_Verify Reference Ranges are retained for 01-PAT
	 When I click on "cancel" button on "LabForm2" CRF. 
     And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
	 Then I verify below flat questions data in the CRF.
		| QuestionPrompt       | AnswerValue | AnswerFieldType |
		| Lab ID3              | Lab01 (L01) | Text            |
		| CRF Collection Date3 | 02/28/2019  | Text            |
	 And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                            | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Test Name2                            | Test1                   | Text            |                  |
		| 2         | CRF Lab Unit3                             | 01                      | Text            |                  |
		| 2         | CRF Lab Value3                            | 16                      | Text            |                  |
		| 2         | Normal Reference Range High2              | < 15.00                 | Text            |                  |
		| 2         | Critical Reference Range Low2             | > 20.41                 | Text            |                  |
		| 2         | Normal Reference Range Low2               | > 3.00                  | Text            |                  |
		| 2         | Critical Reference Range High2            | < 25.71                 | Text            |                  |
		| 2         | Reference Range ID2                       | {ReferenceRangeID1}     | Text            |                  |
		| 2         | Out of Normal Range Indicator2            | Above normal range high | Text            |                  |
		| 2         | Normalized Patient Lab Value2             | 32                      | Text            |                  |
		| 2         | Normalized Lab Unit2                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low2    | > 6.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High2   | < 30.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low2  | > 40.82                 | Text            |                  |
		| 2         | Reference Range Not Applicable2           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High2 | < 51.42                 | Text            | Ok               |
  
#01-PAT:Verify Visual Indicator is retained
@ObjectiveEvidence @ReqId:US56642.1
Scenario: 52_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
		When I click on "cancel" button on "LabForm2" CRF.
		And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
		And I expand row "2" of table "Autobuild Table2:"
		Then I should see icon Above Normal Range High indicator for question "CRF Lab Value3" in table "Autobuild Table2:".