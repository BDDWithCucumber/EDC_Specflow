Feature: Labs_ReassociateRROnLabMappingChangesStudyUpdate
	
	Test Summary:

		1. Verify Reference Ranges are cleared and Visual Indicator disappears when LabID Mapping is updated in LabInstance.
		2. Verify Reference Ranges are retained and Visual Indicator displays when New domain item which is mapped for LabID also holds valid LabID.
		3. Verify Reference Ranges are cleared and Visual Indicator disappears when CRF Collection Date Mapping is updated in LabInstance.
		4. Verify Reference Ranges are updated when Reference Range Mappings are updated in LabInstance.
		5. Verify Reference Ranges are cleared and Visual Indicator disappears when CRF Lab Unit Mapping is updated in LabInstance/LabDictionary.
		6. Verify Reference Ranges are retained when CRF Lab value Mapping is updated in LabInstance.
		7. Verify Out of Normal Range Indicator value and visual indicator are cleared when CRF Lab value Mapping is updated in LabInstance.
		8. Verify Reference Ranges are cleared and Visual Indicator disappears when CRF Lab Test Name Mapping is updated in LabInstance.

#Userstory: US61408,US56638
#Userstory Link US61408: https://rally1.rallydev.com/#/244270786880ud/detail/userstory/294019147976
#Userstory Link US56638: https://rally1.rallydev.com/#/244270786880ud/detail/userstory/264610726432
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

#Scenario: 04_Add site in Site Management and associate user
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I enter sites details and Save
#	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
#	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#	And I open site with siteid "01" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then I see Site details page for "01-Site"
#
##Adding Labs
#Scenario: 05_Add Lab in Lab Management
#	When I click breadcrumb "Study Administration"
#	And I click Link "Lab Management" In StudyAdministrationPage
#	And I enter labs details and Save
#	| LabId | LaboratoryName | Company    | Department | Address1       | Address2  | Address3    | City      | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L01   | Lab01          | Perceptive | EDC        | Building No 20 | Mindspace | Hitech city | Hyderabad | TG    | 500081 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	Then I see labs with details in lab grid
#	| LabId | LaboratoryName | Company    | Department | Address1       | Address2  | Address3    | City      | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L01   | Lab01          | Perceptive | EDC        | Building No 20 | Mindspace | Hitech city | Hyderabad | TG    | 500081 | INDIA(IND) | INDIA   | 11111111 | 22222222 | Active           | Mr.XYZ        |
#
##Associating Lab to Site
#Scenario: 06_Associate Lab L01 to 01-Site
#	When I click breadcrumb "Study Administration"
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "01" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company    | Department | LaboratoryStatus |
#	| L01   | Lab01          | Perceptive | EDC        | Active           |

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
	 | 02       | PAT             | 06/13/2019 |
     Then I see below patients added in the Patients table.
     | PatientID |
     | 01-PAT    |
     | 02-PAT    |

 Scenario: 09_Add a new lab test reference range record
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 03/03/2030 | Male   | >             | 20          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 01 | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

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
      | CRF Collection Date | 05/28/2019  | TextBox         |
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
	  	| 2         | Critical Reference Range Low             | > 2.41                 | Text            |                  |
	  	| 2         | Normal Reference Range Low               | > 3.00                  | Text            |                  |
	  	| 2         | Critical Reference Range High            | < 25.71                 | Text            |                  |
	  	| 2         | Reference Range ID                       | {ReferenceRangeID1}     | Text            |                  |
	  	| 2         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
	  	| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
	  	| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
	  	| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
	  	| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
	  	| 2         | Normalized Critical Reference Range Low  | > 2.41                 | Text            |                  |
	  	| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
	  	| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
	  	| 2         | Precision                                | 2                       | Text            |                  |
	  	| 2         | Conversion Factor                        | 1                       | Text            |                  |

#Verify Visual Indicator 
Scenario: 14_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

Scenario: 15_Expand the Visit (Week 2) event and open the LabForm1 form and update the data for 01-PAT
	  When I click on "cancel" button on "LabForm2" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
      And I click "Checkout" button on "LabForm1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | Lab ID1             | L01         | TextBox         |
      | CRF Collection Date | 05/28/2019  | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 2           | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 16_Verify the Lab Form data for 01-PAT
	  When I expand row "2" of table "Autobuild Table:"
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                 | AnswerValue         | AnswerFieldType | RowButtonToClick |
	  	| 2         | CRF Test Name                  | Test1               | Text            |                  |
	  	| 2         | Lab Test Description           | 01                  | Text            |                  |
	  	| 2         | CRF Lab Unit                   | 01                  | Text            |                  |
	  	| 2         | CRF Lab value                  | 2                   | Text            |                  |
	  	| 2         | Reference Range ID             | {ReferenceRangeID1} | Text            |                  |
	  	| 2         | Reference Range Not Applicable | No                  | Text            |                  |

#Scenario: 17_Verify Reference Ranges of LabForm1 in DB for 01-PAT
#	  Given I have connected to Database.
#	  When I execute the query "select DataValue from PatientData where DataRowActive = '0'".
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
#	  | > 2.41                |
#	  | < 25.71                |
#	  | {ReferenceRangeID1}    |
#	  | Below normal range low |
#	  | 2                      |
#	  | cm                     |
#	  | > 3.00                 |
#	  | < 15.00                |
#	  | > 2.41                |
#	  | < 25.71                |
#	  | 2                      |
#	  | 1                      |

#Verify Visual Indicator
Scenario: 18_Below Normal Range Low Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

################################### Major Study Update 1 #########################################################
# Updated LabID mapping in LabInstance

Scenario: 19_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 20_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 21_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_G.zip" with Label "Major1"
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

#01-PAT:Verify Reference Ranges are Cleared on eCRF when LabID Mapping is updated in LabInstance.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 22_Verify the Reference Ranges are cleared for LabForm2
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 Then I verify below flat questions data in the CRF.
		| QuestionPrompt | AnswerValue | AnswerFieldType |
		| Lab ID         | L01         | Text            |
	 And I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
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
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 23_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:".

#01-PAT:Verify Reference Ranges are retained on eCRF when New domain item which is mapped to LabID holds valid LabID before migration itself.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 24_Verify Reference Ranges are retained for LabForm1
	  When I click on "cancel" button on "LabForm2" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                 | AnswerValue         | AnswerFieldType | RowButtonToClick |
	  	| 2         | CRF Test Name                  | Test1               | Text            |                  |
	  	| 2         | Lab Test Description           | 01                  | Text            |                  |
	  	| 2         | CRF Lab Unit                   | 01                  | Text            |                  |
	  	| 2         | CRF Lab value                  | 2                   | Text            |                  |
	  	| 2         | Reference Range ID             | {ReferenceRangeID1} | Text            |                  |
	  	| 2         | Reference Range Not Applicable | No                  | Text            |                  |

#01-PAT:Verify Reference Ranges are retained in DB when New domain item which is mapped to LabID holds valid LabID before migration itself.
@ObjectiveEvidence @ReqId:US61408.1,2,3,5
Scenario: 25_Verify Reference Ranges are retained for LabForm1 in DB
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm1')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value             |
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
	  | > 2.41                |
	  | < 25.71                |
	  | {ReferenceRangeID1}    |
	  | Below normal range low |
	  | 2                      |
	  | cm                     |
	  | > 3.00                 |
	  | < 15.00                |
	  | > 2.41                |
	  | < 25.71                |
	  | 2                      |
	  | 1                      |

#01-PAT:Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 26_Below Normal Range Low Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
		When I click table row button "OK" of table "Autobuild Table:"
		And I expand row "2" of table "Autobuild Table:"
		Then I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

#Enter Lab Data
Scenario: 27_Expand the Visit (Week 2) event and open the LabForm3 form and update the data for 01-PAT
	  When I click on "cancel" button on "LabForm1" CRF.
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

Scenario: 28_Verify Reference Ranges of LabForm3 in DB for 01-PAT
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | > 3.00                  |
	  | < 15.00                 |
	  | > 2.41                 |
	  | < 25.71                 |


################################### Major Study Update 2 #########################################################
# Updated CRF CollectionDate mapping in LabInstance

Scenario: 29_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 30_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 31_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_K.zip" with Label "Major2"
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

#01-PAT:Verify Reference Ranges are Cleared on eCRF when CRF Collection Date Mapping is updated in LabInstance.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 32_Verify the Reference Ranges are cleared for LabForm3 on eCRF
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
	 Then I verify below ReferenceRange CRF "Autobuild Table2:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                  | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Value2                  | 16          | Text            |                  |
		| 2         | CRF Test Name2                  | Test1       | Text            |                  |
		| 2         | CRF Lab Unit2                   | 01          | Text            |                  |
		| 2         | Reference Range Not Applicable2 | [Blank]     | Text            |                  |
		| 2         | Reference Range ID2             | [Blank]     | Text            |                  |

#01-PAT:Verify Reference Ranges are Cleared in DB when CRF Collection Date mapping is updated in LabInstance
@ObjectiveEvidence @ReqId:US61408.1,2,3,5
Scenario: 33_Verify Reference Ranges are cleared for LabForm3 in DB for 01-PAT
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value |
	  |            |
	  |            |
	  |            |
	  |            |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 34_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
		When I click table row button "OK" of table "Autobuild Table2:"
		And I expand row "2" of table "Autobuild Table2:"
		Then I should not see visual indicator for question "CRF Lab Value2" in table "Autobuild Table2:".

#Enter CRF Collection Date for newly mapped question
Scenario: 35_Expand the Visit (Week 2) event and open the LabForm3 form and update the data for 01-PAT
      When I click "Checkout" button on "LabForm3" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt       | AnswerValue | AnswerFieldType |
      | CRF Collection Date3 | 02/28/2019  | TextBox         |
	  And I click on "Save" button on "LabForm3" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#01-PAT:Verify Reference Ranges are populated oneCRF when CRF Collection Date is provided for newly mapped question
Scenario: 36_Verify the Reference Ranges are populated for 01-PAT
	 When I expand row "2" of table "Autobuild Table2:"	
	 Then I verify below ReferenceRange CRF "Autobuild Table2:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                  | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Value2                  | 16                  | Text            |                  |
		| 2         | CRF Test Name2                  | Test1               | Text            |                  |
		| 2         | CRF Lab Unit2                   | 01                  | Text            |                  |
		| 2         | Reference Range Not Applicable2 | No                  | Text            |                  |
		| 2         | Reference Range ID2             | {ReferenceRangeID1} | Text            |                  |

#01-PAT:Verify Reference Ranges are populated in DB when CRF Collection Date is provided for newly mapped question
Scenario: 37_Verify Reference Ranges of LabForm3 in DB for 01-PAT
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | > 3.00                  |
	  | < 15.00                 |
	  | > 2.41                 |
	  | < 25.71                 |
	  | Above normal range high |

#01-PAT:Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 38_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
		When I click table row button "OK" of table "Autobuild Table2:"
		And I expand row "2" of table "Autobuild Table2:"
		Then I should see icon Above Normal Range High indicator for question "CRF Lab Value2" in table "Autobuild Table2:".

################################### Major Study Update 3 #########################################################
# Updated Reference Ranges mapping in LabInstance - Updated for few, removed for few

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
	And I upload study "Test4500_Labs_Original_N.zip" with Label "Major3"
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

#01-PAT:Verify Reference Ranges are updated on eCRF when Reference Range Mappings are updated in LabInstance.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 42_Verify the Reference Ranges are updated for LabForm2
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
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
	  	| 2         | Normal Reference Range High              | > 3.00                  | Text            |                  |
	  	| 2         | Critical Reference Range Low             | > 2.41                 | Text            |                  |
	  	| 2         | Normal Reference Range Low               | < 15.00                 | Text            |                  |
	  	| 2         | Critical Reference Range High            | > 2.41                 | Text            |                  |
	  	| 2         | Reference Range ID                       | {ReferenceRangeID1}     | Text            |                  |
	  	| 2         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
	  	| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
	  	| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
	  	| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
	  	| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
	  	| 2         | Normalized Critical Reference Range Low  | > 2.41                 | Text            |                  |
	  	| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
	  	| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
	  	| 2         | Precision                                | 2                       | Text            |                  |
	  	| 2         | Conversion Factor                        | 1                       | Text            |                  |

#Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 43_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:". 

#01-PAT:Verify Reference Ranges are updated on eCRF when Reference Range Mappings are updated in LabInstance.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 44_Verify Reference Ranges are updated for LabForm1 on eCRF
	  When I click on "cancel" button on "LabForm2" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  When I expand row "2" of table "Autobuild Table:"
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                 | AnswerValue         | AnswerFieldType | RowButtonToClick |
	  	| 2         | CRF Test Name                  | Test1               | Text            |                  |
	  	| 2         | Lab Test Description           | 01                  | Text            |                  |
	  	| 2         | CRF Lab Unit                   | 01                  | Text            |                  |
	  	| 2         | CRF Lab value                  | 2                   | Text            |                  |
	  	| 2         | Reference Range ID             | {ReferenceRangeID1} | Text            |                  |
	  	| 2         | Reference Range Not Applicable | No                  | Text            |                  |

#01-PAT:Verify Reference Ranges are updated in DB when Reference Range Mappings are updated in LabInstance.
@ObjectiveEvidence @ReqId:US61408.1,2,3,5
Scenario: 45_Verify Reference Ranges are updated for LabForm1 in DB
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm1')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value             |
	  | 01                     |
	  | 01                     |
	  | 1                      |
	  | Cat1                   |
	  | SubCat1                |
	  | Specimen1              |
	  | Method1                |
	  | Result1                |
	  | < 15.00                |
	  | > 3.00                 |
	  | > 2.41                |
	  | > 2.41                |
	  | Below normal range low |
	  | 2                      |
	  | cm                     |
	  | > 3.00                 |
	  | < 15.00                |
	  | > 2.41                |
	  | < 25.71                |
	  | 2                      |
	  | 1                      |

#Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 46_Below Normal Range Low Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should see icon Below Normal Range Low indicator for question "CRF Lab value" in table "Autobuild Table:".

#01-PAT:Verify Reference Ranges are updated on eCRF when Reference Range Mappings are updated in LabInstance.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 47_Verify Reference Ranges are updated for LabForm3 on eCRF
      When I click on "cancel" button on "LabForm1" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
 	  And I expand row "2" of table "Autobuild Table2:"	
	  Then I verify below ReferenceRange CRF "Autobuild Table2:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                  | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Value2                  | 16                  | Text            |                  |
		| 2         | CRF Test Name2                  | Test1               | Text            |                  |
		| 2         | CRF Lab Unit2                   | 01                  | Text            |                  |
		| 2         | Reference Range Not Applicable2 | No                  | Text            |                  |
		| 2         | Reference Range ID2             | {ReferenceRangeID1} | Text            |                  |

#01-PAT:Verify Reference Ranges are updated in DB when Reference Range Mappings are updated in LabInstance.
@ObjectiveEvidence @ReqId:US61408.1,2,3,5
Scenario: 48_Verify Reference Ranges are updated for LabForm3 in DB 
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | < 15.00                 |
	  | > 3.00                  |
	  | < 25.71                 |
	  | > 2.41                 |
	  | Above normal range high |

#01-PAT:Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 49_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
		When I click table row button "OK" of table "Autobuild Table2:"
		And I expand row "2" of table "Autobuild Table2:"
		Then I should see icon Above Normal Range High indicator for question "CRF Lab Value2" in table "Autobuild Table2:".

################################### Major Study Update 4 #########################################################
# Updated Codelist for LabUnit domain item mapped in LabInstance and Lab Unit mapping is updated in Dictionary Mappings

Scenario: 50_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 51_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 52_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_O.zip" with Label "Major4"
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
         | Migration of Site 01 for Study file (Major4) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major4) - complete                                                                                        |

#01-PAT:Verify Reference Ranges are Cleared on eCRF when codelist for CRF Lab Unit domain item is updated.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 53_Verify the Reference Ranges are cleared for LabForm2
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 And I expand row "2" of table "Autobuild Table:"
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
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 54_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:".

#01-PAT:Verify Reference Ranges are cleared on eCRF when codelist for CRF Lab Unit domain item is updated.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 55_Verify Reference Ranges are updated for LabForm1 on eCRF
	  When I click on "cancel" button on "LabForm2" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  When I expand row "2" of table "Autobuild Table:"
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	  	| RowNumber | QuestionPrompt                 | AnswerValue         | AnswerFieldType | RowButtonToClick |
	  	| 2         | CRF Test Name                  | Test1               | Text            |                  |
	  	| 2         | Lab Test Description           | 01                  | Text            |                  |
	  	| 2         | CRF Lab Unit                   | 01                  | Text            |                  |
	  	| 2         | CRF Lab value                  | 2                   | Text            |                  |
	  	| 2         | Reference Range ID             | {ReferenceRangeID1} | Text            |                  |
	  	| 2         | Reference Range Not Applicable | No                  | Text            |                  |

#01-PAT:Verify Reference Ranges are cleared in DB when codelist for CRF Lab Unit domain item is updated..
@ObjectiveEvidence @ReqId:US61408.1,2,3,5
Scenario: 56_Verify Reference Ranges are updated for LabForm1 in DB
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm1')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  | > 2.41    |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |
	  |            |

#Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 57_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:".

#01-PAT:Verify Reference Ranges are retained on eCRF when newly mapped Lab Unit is already associated on CRF before migration.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4.
Scenario: 58_Verify Reference Ranges are updated for LabForm3 on eCRF
      When I click on "cancel" button on "LabForm1" CRF.
	  And I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
 	  And I expand row "2" of table "Autobuild Table2:"	
	  Then I verify below ReferenceRange CRF "Autobuild Table2:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                  | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Value2                  | 16                  | Text            |                  |
		| 2         | CRF Test Name2                  | Test1               | Text            |                  |
		| 2         | CRF Lab Unit2                   | 01                  | Text            |                  |
		| 2         | Reference Range Not Applicable2 | No                  | Text            |                  |
		| 2         | Reference Range ID2             | {ReferenceRangeID1} | Text            |                  |

#01-PAT:Verify Reference Ranges are retained in DB when newly mapped Lab Unit is already associated on CRF before migration.
@ObjectiveEvidence @ReqId:US61408.1,2,3,5
Scenario: 59_Verify Reference Ranges are updated for LabForm3 in DB 
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value              |
	  | > 3.00                  |
	  | < 15.00                 |
	  | > 2.41                 |
	  | < 25.71                 |
	  | Above normal range high |

#01-PAT:Verify Visual Indicator displays
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 60_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
		When I click table row button "OK" of table "Autobuild Table2:"
		And I expand row "2" of table "Autobuild Table2:"
		Then I should see icon Above Normal Range High indicator for question "CRF Lab Value2" in table "Autobuild Table2:".

################################### Major Study Update 5 #########################################################
# Updated CRF Lab Value mapping in LabInstance

Scenario: 61_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 62_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 63_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_P.zip" with Label "Major5"
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
         | Migration of Site 01 for Study file (Major5) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major5) - complete                                                                                        |

#01-PAT:Verify Reference Ranges are retained on eCRF when CRF Lab Value mapping is updated.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4.
Scenario: 64_Verify Reference Ranges are updated for LabForm3 on eCRF
		Given I navigate to "Patients" tab from main menu.
		And I select the site "01-Site" from Sites dropdown.
		And I select the patient "01-PAT" from patients table.
		When I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
 		And I expand row "2" of table "Autobuild Table2:"	
		Then I verify below ReferenceRange CRF "Autobuild Table2:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                  | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Value2                  | 16                  | Text            |                  |
		| 2         | CRF Test Name2                  | Test1               | Text            |                  |
		| 2         | CRF Lab Unit2                   | 01                  | Text            |                  |
		| 2         | Reference Range Not Applicable2 | No                  | Text            |                  |
		| 2         | Reference Range ID2             | {ReferenceRangeID1} | Text            |                  |

#01-PAT:Verify Reference Ranges are retained but Out of Normal Range Indicator is cleared in DB when CRF Lab Value mapping is updated.
@ObjectiveEvidence @ReqId:US61408.1,2,3,5
Scenario: 65_Verify Reference Ranges are updated for LabForm3 in DB 
	  Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where DataRowActive = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved with Reference Range ID.
	  | Data Value |
	  | > 3.00     |
	  | < 15.00    |
	  | > 2.41    |
	  | < 25.71    |
	  |            |

#01-PAT:Verify Visual Indicator disappears
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 66_Verify Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
		When I click table row button "OK" of table "Autobuild Table2:"
		And I expand row "2" of table "Autobuild Table2:"
		Then I should not see visual indicator for question "CRF Lab Value2" in table "Autobuild Table2:".

################################### Autobuild Fixed #########################################################

Scenario: 67_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 68_Delete existing study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 69_Upload and publish the study
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Labs_Original_W.zip" with study label "Test4500_CodleistLinkages_Base"
    Then I see study label "Test4500_CodleistLinkages_Base" in header

Scenario: 70_Add a Patient
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    When I add patient with below details.
     | ScreenID | PatientInitials | ScreenDate |
     | 01       | PAT             | 06/13/2018 |
	 Then I see below patients added in the Patients table.
     | PatientID |
     | 01-PAT    |
 
 Scenario: 71_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 03/03/2019 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 2.41               | <                       | 25.71                | 01   | False |
	 Then a Reference ID is auto generated for a newly added lab test in ReferenceRangesPage

Scenario: 72_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Enter data on Demographics form
Scenario: 73_Expand the Visit (Screening) and open the demographics form to update the data for 01-PAT
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
Scenario: 74_Expand the Visit (Week 2) event and open the LabForm2 form and update the data for 01-PAT
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt       | AnswerValue | AnswerFieldType |
      | Lab ID               | Lab01 (L01) | ListBox         |
      | CRF Collection Date1 | 02/28/2019  | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Verify Reference Ranges are populated on eCRF
Scenario: 75_Verify the Lab Form data for 01-PAT
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
	  	| 2         | Critical Reference Range Low             | > 2.41                 | Text            |                  |
	  	| 2         | Normal Reference Range Low               | > 3.00                  | Text            |                  |
	  	| 2         | Critical Reference Range High            | < 25.71                 | Text            |                  |
	  	| 2         | Reference Range ID                       | {ReferenceRangeID1}     | Text            |                  |
	  	| 2         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
	  	| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
	  	| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
	  	| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
	  	| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
	  	| 2         | Normalized Critical Reference Range Low  | > 2.41                 | Text            |                  |
	  	| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
	  	| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
	  	| 2         | Precision                                | 2                       | Text            |                  |
	  	| 2         | Conversion Factor                        | 1                       | Text            |                  |

#Verify Visual Indicator 
Scenario: 76_Above Normal Range High Visual indicator is displayed for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should see icon Above Normal Range High indicator for question "CRF Lab value" in table "Autobuild Table:".   

################################### Major Study Update 6 #########################################################
# Updated Codelist for CRFLabTest Domain Item

Scenario: 77_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

Scenario: 78_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 79_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_X.zip" with Label "Major6"
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
         | Migration of Site 01 for Study file (Major6) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major6) - complete                                                                                        |

#01-PAT:Verify Reference Ranges are Cleared on eCRF when codelist for CRF Lab Test Name domain item is updated.
@ObjectiveEvidence @ReqId:US61408.1,2,3,4
Scenario: 80_Verify the Reference Ranges are cleared for LabForm2
     Given I navigate to "Patients" tab from main menu.
     And I select the site "01-Site" from Sites dropdown.
     And I select the patient "01-PAT" from patients table.
     When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	 And I expand row "2" of table "Autobuild Table:"
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
@ObjectiveEvidence @ReqId:US56638.1,2
Scenario: 81_Visual indicator disappears for the question CRF Lab Value in row 2 for 01-PAT
	When I click table row button "OK" of table "Autobuild Table:"
	And I expand row "2" of table "Autobuild Table:"
	Then I should not see visual indicator for question "CRF Lab value" in table "Autobuild Table:".

