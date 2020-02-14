Feature: ReassociateRROnLabDictionaryMappingChangesStudyUpdate

Test Summary:

			1. Verify Reference Ranges are cleared and Visual Indicator disappears when LabTest Mapping is updated in LabDictionary Mappings.
			2. Verify Reference Ranges are retained and Visual Indicator displays when Display in Reference Range for LabTest is checked in atleast one of the latest two protocols.
			3. Verify Reference Ranges are cleared and Visual Indicator disappears when Display in Reference Range for LabTest is unchecked in latest two protocols.
			4. Verify Reference Ranges are cleared and Visual Indicator disappears when LabUnit Mapping is updated in LabDictionary Mappings.

#Userstory: US61406,US56640
#Userstory Link US61406: https://rally1.rallydev.com/#/244270786880ud/detail/userstory/294019141724
#Userstory Link US56640: https://rally1.rallydev.com/#/244270786880ud/detail/userstory/264610732832
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
    And I upload a study "Test4500_Labs_Original.zip" with study label "Test4500_CodleistLinkages_Base"
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
	And I click Link "Manage Laboratories" In StudyAdministrationPage
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
     | 01       | PAT             | 06/13/2019 |
	 Then I see below patients added in the Patients table.
     | PatientID |
     | 01-PAT    |
     
 Scenario: 09_Add a new lab test reference range record
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 03/03/2030 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 01   | False |
	 Then a Reference ID is auto generated for a newly added lab test in ReferenceRangesPage

 Scenario: 10_Add a new lab test reference range record
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "03" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 03/03/2030 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 01   | False |
	 Then I see the reference range ids in the Reference Range Table.
	 | ReferenceRangeID    |
	 | {ReferenceRangeID2} |

Scenario: 11_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Enter data on Demographics form
Scenario: 12_Expand the Visit (Screening) and open the demographics form to update the data for 01-PAT
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
Scenario: 13_Expand the Visit (Week 2) event and open the LabForm2 form and update the data for 01-PAT
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 05/28/2019  | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  | No        | 3         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 3         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Verify Reference Ranges are populated on eCRF
Scenario: 14_Verify the Lab Form data for 01-PAT
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"	
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
	  	| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
	  	| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
	  	| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
	  	| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
	  	| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
	  	| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
	  	| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
	  	| 2         | Precision                                | 2                       | Text            |                  |
	  	| 2         | Conversion Factor                        | 1                       | Text            |                  |

#Verify Visual Indicator 
Scenario: 15_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

#Verify Reference Ranges are populated on eCRF
Scenario: 16_Verify the Lab Form data for 01-PAT
	  When I click table row button "OK" of table "Autobuild Table:"
	  And I expand row "3" of table "Autobuild Table:"	
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	  	| 3         | CRF Lab Test Name                        | Test2                   | Text            |                  |
	  	| 3         | CRF Lab Unit                             | 01                      | Text            |                  |
	  	| 3         | CRF Lab value                            | 16                      | Text            |                  |

#Verify Visual Indicator 
Scenario: 17_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "3" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:". 

Scenario: 18_Expand the Visit (Week 2) event and open the LabForm1 form and update the data for 01-PAT
	  When I click on "cancel" button on "LabForm2" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
      And I click "Checkout" button on "LabForm1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 05/28/2019  | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 2           | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  | No        | 3         | CRF Lab value  | 2           | TextBox         |                  |
	  | No        | 3         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 19_Verify the Lab Form data for 01-PAT
	  When I expand row "2" of table "Autobuild Table:"
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                 | AnswerValue         | AnswerFieldType | RowButtonToClick |
	  	| 2         | CRF Lab Test Name              | Test1               | Text            |                  |
	  	| 2         | Lab Test Description           | 01                  | Text            |                  |
	  	| 2         | CRF Lab Unit                   | 01                  | Text            |                  |
	  	| 2         | CRF Lab value                  | 2                   | Text            |                  |
	  	| 2         | Reference Range ID             | {ReferenceRangeID1} | Text            |                  |
	  	| 2         | Reference Range Not Applicable | No                  | Text            |                  |

Scenario: 20_Below Normal Range Low Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

Scenario: 21_Verify the Lab Form data for 01-PAT
	  When I click table row button "OK" of table "Autobuild Table:"
	  And I expand row "3" of table "Autobuild Table:"
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                 | AnswerValue         | AnswerFieldType | RowButtonToClick |
	  	| 3         | CRF Lab Test Name              | Test1               | Text            |                  |
	  	| 3         | CRF Lab Unit                   | 01                  | Text            |                  |
	  	| 3         | CRF Lab value                  | 2                   | Text            |                  |

#Verify Visual Indicator
Scenario: 22_Below Normal Range Low Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "3" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:".

#Scenario: 23_Verify Reference Ranges of LabForm1 in DB for 01-PAT
#	  Given I have connected to Database.
#	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm1')".
#	  Then The below result should be retrieved with Reference Range ID.
#	  | Data Value             |
#	  | 01                     |
#	  | 01                     |
#	  | 1                      |
#	  | Cat1                   |
#	  | SubCat1                |
#	  | Specimen1              |
#	  | Method1                |
#	  | Result1                |
#	  | > 3.00                 |
#	  | < 15.00                |
#	  | > 20.41                |
#	  | < 25.71                |
#	  | {ReferenceRangeID1}    |
#	  | Below normal range low |
#	  | 2                      |
#	  | cm                     |
#	  | > 3.00                 |
#	  | < 15.00                |
#	  | > 20.41                |
#	  | < 25.71                |
#	  | 2                      |
#	  | 1                      |

################################### Major Study Update 1 #########################################################
# Updated LabTest mapping in LabDictionary Mappings

Scenario: 24_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 25_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 26_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_A.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
    And I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         | Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.                                                                                       |

#01-PAT:Verify Reference Ranges are Cleared on eCRF when LabTest Mapping is updated in LabDictionaryMappings.
@ObjectiveEvidence @ReqId:US61406.1,2,3
Scenario: 27_Verify the Reference Ranges are cleared for Test1.
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | [Blank]     | Text            |                  |
		| 2         | CRF Lab Unit                             | 01          | Text            |                  |
		| 2         | CRF Lab value                            | 16          | Text            |                  |
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
		| 2         | Conversion Factor                        | [Blank]     | Text            |                  |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: 28_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:".

#01-PAT:Verify Reference Ranges are populated on eCRF for newly mapped LabTest.
@ObjectiveEvidence @ReqId:US61406.1,2,3
Scenario: 29_Verify the Reference Ranges are populated for Test2.
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "3" of table "Autobuild Table:"
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	  	| 3         | CRF Lab Test Name                        | Test2                   | Text            |                  |
	  	| 3         | Lab Test Description                     | 01                      | Text            |                  |
	  	| 3         | CRF Lab Unit                             | 01                      | Text            |                  |
	  	| 3         | CRF Lab value                            | 16                      | Text            |                  |
	  	| 3         | Lab Test Name                            | 01                      | Text            |                  |
	  	| 3         | Lab Test Code                            | 01                      | Text            |                  |
	  	| 3         | LOINC Code                               | 1                       | Text            |                  |
	  	| 3         | Category                                 | Cat1                    | Text            |                  |
	  	| 3         | Subcategory                              | SubCat1                 | Text            |                  |
	  	| 3         | Specimen                                 | Specimen1               | Text            |                  |
	  	| 3         | Method                                   | Method1                 | Text            |                  |
	  	| 3         | Result Type                              | Result1                 | Text            |                  |
	  	| 3         | Normal Reference Range High              | < 15.00                 | Text            |                  |
	  	| 3         | Critical Reference Range Low             | > 20.41                 | Text            |                  |
	  	| 3         | Normal Reference Range Low               | > 3.00                  | Text            |                  |
	  	| 3         | Critical Reference Range High            | < 25.71                 | Text            |                  |
	  	| 3         | Reference Range ID                       | {ReferenceRangeID1}     | Text            |                  |
	  	| 3         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
	  	| 3         | Normalized Patient Lab Value             | 16                      | Text            |                  |
	  	| 3         | Normalized Lab Unit                      | cm                      | Text            |                  |
	  	| 3         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
	  	| 3         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
	  	| 3         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
	  	| 3         | Reference Range Not Applicable           | No                      | Text            |                  |
	  	| 3         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
	  	| 3         | Precision                                | 2                       | Text            |                  |
	  	| 3         | Conversion Factor                        | 1                       | Text            |                  |

#01-PAT:Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: 30_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 3 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "3" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

#01-PAT:Verify Reference Ranges are Cleared on eCRF when LabTest Mapping is updated in LabDictionaryMappings.
@ObjectiveEvidence @ReqId:US61406.1,2,3
Scenario: 31_Verify the Lab Form data for 01-PAT
	  When I click on "cancel" button on "LabForm2" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  	| 2         | CRF Lab Test Name              | Test1       | Text            |                  |
	  	| 2         | Lab Test Description           | [Blank]     | Text            |                  |
	  	| 2         | CRF Lab Unit                   | 01          | Text            |                  |
	  	| 2         | CRF Lab value                  | 2           | Text            |                  |
	  	| 2         | Reference Range ID             | [Blank]     | Text            |                  |
	  	| 2         | Reference Range Not Applicable | [Blank]     | Text            |                  |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: 32_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:".

#01-PAT:Verify Reference Ranges are populated on eCRF for newly mapped LabTest.
@ObjectiveEvidence @ReqId:US61406.1,2,3
Scenario: 33_Verify the Lab Form data for 01-PAT
	  When I click table row button "OK" of table "Autobuild Table:"
	  And I expand row "3" of table "Autobuild Table:"
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                 | AnswerValue         | AnswerFieldType | RowButtonToClick |
	  	| 3         | CRF Lab Test Name              | Test2               | Text            |                  |
	  	| 3         | Lab Test Description           | 01                  | Text            |                  |
	  	| 3         | CRF Lab Unit                   | 01                  | Text            |                  |
	  	| 3         | CRF Lab value                  | 2                   | Text            |                  |
	  	| 3         | Reference Range ID             | {ReferenceRangeID1} | Text            |                  |
	  	| 3         | Reference Range Not Applicable | No                  | Text            |                  |

#01-PAT:Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: 34_Below Normal Range Low Visual indicator is displayed for the question CRF Lab Value in row 3 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "3" of table "Autobuild Table:"
	Then I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

##01-PAT:Verify Reference Ranges are cleared for Test1 and populated for newly mapped LabTest in DB.
#@ObjectiveEvidence @ReqId:US61406.1,2,4
#@ObjectiveEvidence @ReqId:US56640.1,3
#Scenario: 35_Verify Reference Ranges of LabForm1 in DB for 01-PAT
#	  Given I have connected to Database.
#	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm1')".
#	  Then The below result should be retrieved with Reference Range ID.
#	  | Data Value             |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  |                        |
#	  | 01                     |
#	  | 01                     |
#	  | 1                      |
#	  | Cat1                   |
#	  | SubCat1                |
#	  | Specimen1              |
#	  | Method1                |
#	  | Result1                |
#	  | > 3.00                 |
#	  | < 15.00                |
#	  | > 20.41                |
#	  | < 25.71                |
#	  | {ReferenceRangeID1}    |
#	  | Below normal range low |
#	  | 2                      |
#	  | cm                     |
#	  | > 3.00                 |
#	  | < 15.00                |
#	  | > 20.41                |
#	  | < 25.71                |
#	  | 2                      |
#	  | 1                      |

#Enter data on Lab form for Test3
Scenario: 36_Expand the Visit (Week 2) event and open the LabForm2 form and update the data for 01-PAT
	  When I click on "cancel" button on "LabForm1" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF.      
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 4         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 4         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Verify Reference Ranges are populated on eCRF
Scenario: 37_Verify the Lab Form data for 01-PAT
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "4" of table "Autobuild Table:"	
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	  	| 4         | CRF Lab Test Name                        | Test3                   | Text            |                  |
	  	| 4         | Lab Test Description                     | 03                      | Text            |                  |
	  	| 4         | CRF Lab Unit                             | 01                      | Text            |                  |
	  	| 4         | CRF Lab value                            | 16                      | Text            |                  |
	  	| 4         | Lab Test Name                            | 03                      | Text            |                  |
	  	| 4         | Lab Test Code                            | 03                      | Text            |                  |
	  	| 4         | Normal Reference Range High              | < 15                    | Text            |                  |
	  	| 4         | Critical Reference Range Low             | > 20                    | Text            |                  |
	  	| 4         | Normal Reference Range Low               | > 3                     | Text            |                  |
	  	| 4         | Critical Reference Range High            | < 26                    | Text            |                  |
	  	| 4         | Reference Range ID                       | {ReferenceRangeID2}     | Text            |                  |
	  	| 4         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
	  	| 4         | Normalized Patient Lab Value             | 16                      | Text            |                  |
	  	| 4         | Normalized Normal Reference Range Low    | > 3                     | Text            |                  |
	  	| 4         | Normalized Normal Reference Range High   | < 15                    | Text            |                  |
	  	| 4         | Normalized Critical Reference Range Low  | > 20                    | Text            |                  |
	  	| 4         | Reference Range Not Applicable           | No                      | Text            |                  |
	  	| 4         | Normalized Critical Reference Range High | < 26                    | Text            |                  |
	  	| 4         | Precision                                | 0                       | Text            |                  |
	  	| 4         | Conversion Factor                        | 1                       | Text            |                  |

#Verify Visual Indicator 
Scenario: 38_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "4" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

################################### Major Study Update 2 #########################################################
# Unchecked DisplayInReferenceRange Checkbox for Test3 in LabDictionary Mappings

Scenario: 39_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 40_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 41_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_B.zip" with Label "Major2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         | Migration of Site 01 for Study file (Major2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major2) - complete.                                                                                       |

#01-PAT:Verify Reference Ranges are retained on eCRF for Test3 as DisplayInReferenceRange is checked in one of the latest two protocols.
@ObjectiveEvidence @ReqId:US61406.1,2,3
Scenario: 42_Verify the Reference Ranges are retained for Test3.
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 And I expand row "4" of table "Autobuild Table:"	
	 Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	  	| 4         | CRF Lab Test Name                        | Test3                   | Text            |                  |
	  	| 4         | Lab Test Description                     | 03                      | Text            |                  |
	  	| 4         | CRF Lab Unit                             | 01                      | Text            |                  |
	  	| 4         | CRF Lab value                            | 16                      | Text            |                  |
	  	| 4         | Lab Test Name                            | 03                      | Text            |                  |
	  	| 4         | Lab Test Code                            | 03                      | Text            |                  |
	  	| 4         | Normal Reference Range High              | < 15                    | Text            |                  |
	  	| 4         | Critical Reference Range Low             | > 20                    | Text            |                  |
	  	| 4         | Normal Reference Range Low               | > 3                     | Text            |                  |
	  	| 4         | Critical Reference Range High            | < 26                    | Text            |                  |
	  	| 4         | Reference Range ID                       | {ReferenceRangeID2}     | Text            |                  |
	  	| 4         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
	  	| 4         | Normalized Patient Lab Value             | 16                      | Text            |                  |
	  	| 4         | Normalized Normal Reference Range Low    | > 3                     | Text            |                  |
	  	| 4         | Normalized Normal Reference Range High   | < 15                    | Text            |                  |
	  	| 4         | Normalized Critical Reference Range Low  | > 20                    | Text            |                  |
	  	| 4         | Reference Range Not Applicable           | No                      | Text            |                  |
	  	| 4         | Normalized Critical Reference Range High | < 26                    | Text            |                  |
	  	| 4         | Precision                                | 0                       | Text            |                  |
	  	| 4         | Conversion Factor                        | 1                       | Text            |                  |

#Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: 43_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 4 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "4" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

################################### Major Study Update 3 #########################################################
# Updated LabUnit Mapping in LabDictionary Mappings

Scenario: 44_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 45_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 46_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_C.zip" with Label "Major3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         | Migration of Site 01 for Study file (Major3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major3) - complete.                                                                                       |

#01-PAT:Verify Reference Ranges are Cleared on eCRF when LabUnit Mapping is updated in LabDictionaryMappings.
@ObjectiveEvidence @ReqId:US61406.1,2,3
Scenario: 47_Verify the Reference Ranges are cleared for Test1.
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | [Blank]     | Text            |                  |
		| 2         | CRF Lab Unit                             | 01          | Text            |                  |
		| 2         | CRF Lab value                            | 16          | Text            |                  |
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
		| 2         | Conversion Factor                        | [Blank]     | Text            |                  |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: 48_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:".

#01-PAT:Verify Reference Ranges are Cleared on eCRF when LabUnit Mapping is updated in LabDictionaryMappings
@ObjectiveEvidence @ReqId:US61406.1,2,3
Scenario: 49_Verify the Reference Ranges are cleared for Test2.
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "3" of table "Autobuild Table:"
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
	  	| 3         | CRF Lab Test Name                        | Test2       | Text            |                  |
	  	| 3         | Lab Test Description                     | [Blank]     | Text            |                  |
	  	| 3         | CRF Lab Unit                             | 01          | Text            |                  |
	  	| 3         | CRF Lab value                            | 16          | Text            |                  |
	  	| 3         | Lab Test Name                            | [Blank]     | Text            |                  |
	  	| 3         | Lab Test Code                            | [Blank]     | Text            |                  |
	  	| 3         | LOINC Code                               | [Blank]     | Text            |                  |
	  	| 3         | Category                                 | [Blank]     | Text            |                  |
	  	| 3         | Subcategory                              | [Blank]     | Text            |                  |
	  	| 3         | Specimen                                 | [Blank]     | Text            |                  |
	  	| 3         | Method                                   | [Blank]     | Text            |                  |
	  	| 3         | Result Type                              | [Blank]     | Text            |                  |
	  	| 3         | Normal Reference Range High              | [Blank]     | Text            |                  |
	  	| 3         | Critical Reference Range Low             | [Blank]     | Text            |                  |
	  	| 3         | Normal Reference Range Low               | [Blank]     | Text            |                  |
	  	| 3         | Critical Reference Range High            | [Blank]     | Text            |                  |
	  	| 3         | Reference Range ID                       | [Blank]     | Text            |                  |
	  	| 3         | Out of Normal Range Indicator            | [Blank]     | Text            |                  |
	  	| 3         | Normalized Patient Lab Value             | [Blank]     | Text            |                  |
	  	| 3         | Normalized Lab Unit                      | [Blank]     | Text            |                  |
	  	| 3         | Normalized Normal Reference Range Low    | [Blank]     | Text            |                  |
	  	| 3         | Normalized Normal Reference Range High   | [Blank]     | Text            |                  |
	  	| 3         | Normalized Critical Reference Range Low  | [Blank]     | Text            |                  |
	  	| 3         | Reference Range Not Applicable           | [Blank]     | Text            |                  |
	  	| 3         | Normalized Critical Reference Range High | [Blank]     | Text            |                  |
	  	| 3         | Precision                                | [Blank]     | Text            |                  |
	  	| 3         | Conversion Factor                        | [Blank]     | Text            |                  |                

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: 50_Visual indicator disappears for the question CRF Lab Value in row 3 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "3" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:". 

#01-PAT:Verify Reference Ranges are Cleared on eCRF when LabUnit Mapping is updated in LabDictionaryMappings
@ObjectiveEvidence @ReqId:US61406.1,2,3
Scenario: 51_Verify the Reference Ranges are cleared for Test3.
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "4" of table "Autobuild Table:"
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
	  	| 4         | CRF Lab Test Name                        | Test3       | Text            |                  |
	  	| 4         | Lab Test Description                     | [Blank]     | Text            |                  |
	  	| 4         | CRF Lab Unit                             | 01          | Text            |                  |
	  	| 4         | CRF Lab value                            | 16          | Text            |                  |
	  	| 4         | Lab Test Name                            | [Blank]     | Text            |                  |
	  	| 4         | Lab Test Code                            | [Blank]     | Text            |                  |
	  	| 4         | Normal Reference Range High              | [Blank]     | Text            |                  |
	  	| 4         | Critical Reference Range Low             | [Blank]     | Text            |                  |
	  	| 4         | Normal Reference Range Low               | [Blank]     | Text            |                  |
	  	| 4         | Critical Reference Range High            | [Blank]     | Text            |                  |
	  	| 4         | Reference Range ID                       | [Blank]     | Text            |                  |
	  	| 4         | Out of Normal Range Indicator            | [Blank]     | Text            |                  |
	  	| 4         | Normalized Patient Lab Value             | [Blank]     | Text            |                  |
	  	| 4         | Normalized Normal Reference Range Low    | [Blank]     | Text            |                  |
	  	| 4         | Normalized Normal Reference Range High   | [Blank]     | Text            |                  |
	  	| 4         | Normalized Critical Reference Range Low  | [Blank]     | Text            |                  |
	  	| 4         | Reference Range Not Applicable           | [Blank]     | Text            |                  |
	  	| 4         | Normalized Critical Reference Range High | [Blank]     | Text            |                  |
	  	| 4         | Precision                                | [Blank]     | Text            |                  |
	  	| 4         | Conversion Factor                        | [Blank]     | Text            |                  |

#Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56640.1,2
Scenario: 52_Visual indicator disappears for the question CRF Lab Value in row 4 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "4" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:". 