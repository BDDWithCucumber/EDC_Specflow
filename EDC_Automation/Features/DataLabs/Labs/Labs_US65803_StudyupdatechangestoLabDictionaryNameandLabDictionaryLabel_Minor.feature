Feature:DL_StudyupdatechangestoLabDictionaryNameandLabDictionaryLabel_Minor

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

#upload the base study file and publish the study base file
Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Labs_20190801_T09021325_V1.zip" with study label "V1"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 

#Scenario: 04_Add sites to associate to labs.
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I enter sites details and Save
#	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
#	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#
#Scenario: 05_Assign testadmin testadmin user to 01-Site
#	When I open site with siteid "01" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	And I click breadcrumb "Site Management"
#	
#Scenario: 06_Assign testadmin testadmin user to 02-Site
#	When I open site with siteid "02" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	And I click breadcrumb "Site Management"
#
#Scenario: 07_Add Labs
#	When I click breadcrumb "Study Administration"
#	And I click Link "Lab Management" In StudyAdministrationPage
#	And I enter labs details and Save
#	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |	
#	Then I see labs with details in lab grid
#	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#		
#Scenario: 08_Associate Lab L01,L02 and L03 for 01-SIte
#	When I click breadcrumb "Study Administration"
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "01" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page	
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
#	| L01   | Lab01          | PFIZER  | RD         | Active           |
#	And I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
#	| L02   | Lab02          | PFIZER  | RD         | Active           |	
#
#Scenario: 09_Associate Lab L01, L03, L04 and L05 for 02-Site
#	When I click breadcrumb "Study Administration"
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "02" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette	
#	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page	
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage	
#	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
#	| L03   | Lab03          | NOVARTIS | Research   | Active           |	

#Scenario: 10_Add a new lab test reference range record under Lab01 under WBC
#	 Given I navigate to "Labs" tab from main menu.
#     When I open lab with labid "L21" from ManageReferenceRanges page
#	 And I open labtest with labname "01" from labtests page
#	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
#	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
#	 | 02/03/2019 | 03/03/2022 | Male   | >             | 20         | <           | 35       | >                    | 100.34            | <                     | 123.34             | >                      | 89.34               | <                       | 144.34               | 01   | False |
#	 | 03/04/2022 | 05/03/2025 | Male   | >             | 20         | <           | 35       | =                    | 101.34            | =                     | 124.34             | =                      | 90.34               | =                       | 145.34               | 01   | False |
#	 Then I see the reference range ids in the Reference Range Table.
#	| ReferenceRangeID    |
#	| {ReferenceRangeID1} |
#	| {ReferenceRangeID2} |
#
#Scenario: 11_Add patient 01-PAT from Datalabs UI
#      Given I navigate to "Patients" tab from main menu.
#      And I select the site "01-Site" from Sites dropdown.
#      When I add patient with below details.
#      | ScreenID | PatientInitials | ScreenDate |
#      | 01       |   PAT           | 06/13/2018 |	  	 
#	 Then I see below patients added in the Patients table.
#      | PatientID |
#      | 01-PAT    |	
#
#Scenario: 12_Navigate to site and select patient      
#      When I select the patient "01-PAT" from patients table.
#      Then I see Patient details page for "01-PAT".
#
##Enter data on Demographics form
#Scenario: 13_Expand the Visit (Screening) and open the demographics form to update the data
#	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
#      And I click "Checkout" button on "Demographics RTSM" CRF.      
#      And I enter below flat questions data in the CRF.
#      | QuestionPrompt            | AnswerValue | AnswerFieldType |
#      | Gender:                   | Male        | ListBox         |
#      | Age at Study Start:       | 31          | TextBox         |
#      | Age Units at Study Start: | Years       | ListBox         |
#	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
#	  Then The CRF with data is saved and checked-in successfully. 
#
##Enter data on Lab form
#Scenario: 14_Expand the Visit (Week2) event and open the LabForm2 form and update the data
#	  When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
#      And I click "Checkout" button on "LabForm1" CRF.      
#      And I enter below flat questions data in the CRF.
#      | QuestionPrompt      | AnswerValue | AnswerFieldType |
#      | Lab ID              | Lab01 (L01) | ListBox         |
#      | CRF Collection Date | 02/28/2019  | TextBox         |
#	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
#	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
#	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
#	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
#	  And I click on "Save & Close" button on "LabForm1" CRF.	   
#	  Then The CRF with data is saved and checked-in successfully.
#
#Scenario: 15_Verify the Lab report data
#	  When I expand row "2" of table "Autobuild Table:"	     
#	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
#		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
#		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
#		| 2         | Lab Test Description                     | 01                      | Text            |                  |
#		| 2         | CRF Lab Unit                             | 01                      | Link            |                  |
#		| 2         | CRF Lab value                            | 16                      | Link            |                  |
#		| 2         | Lab Test Name                            | 01                      | Text            |                  |
#		| 2         | Lab Test Code                            | 01                      | Text            |                  |
#		| 2         | LOINC Code                               | 1                       | Text            |                  |
#		| 2         | Category                                 | Cat1                    | Text            |                  |
#		| 2         | Subcategory                              | SubCat1                 | Text            |                  |
#		| 2         | Specimen                                 | Specimen1               | Text            |                  |
#		| 2         | Method                                   | Method1                 | Text            |                  |
#		| 2         | Result Type                              | Result1                 | Text            |                  |
#		| 2         | Normal Reference Range High              | < 15.00                 | Text            |                  |
#		| 2         | Critical Reference Range Low             | > 20.41                 | Text            |                  |
#		| 2         | Normal Reference Range Low               | > 3.00                  | Text            |                  |
#		| 2         | Critical Reference Range High            | < 25.71                 | Text            |                  |
#		| 2         | Reference Range ID                       | {ReferenceRangeID1}     | Text            |                  |
#		| 2         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
#		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
#		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
#		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
#		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
#		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
#		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
#		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
#		| 2         | Precision                                | 2                       | Text            |                  |
#		| 2         | Conversion Factor                        | 1                       | Text            | Save & Close Row |

#Changed the Dictionary Name
Scenario: 16_Publish a new minor study and 
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_20190801_T09064798_V2.zip" with Label "V2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	Then  I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage

Scenario: 17_Publish Study which is in Staged status
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	Then I see PublishStudyFlagsPage

Scenario: 18_Publish a new minor study and verify the Lab Units list in Mrr page
	When I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate	
	And I navigate to "Inbox" tab from main menu.	
	Then I check subjects in inbox folder "Jobs"
         | Subject                                   |
         | Publishing of Study file (V2) - complete. | 

#Changed the Dictionary Label and it should treat it as Minor Dictionary change
Scenario: 19_Publish a new minor study and verify the Lab Units list in Mrr page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_20190802_T04193062_V3.zip" with Label "V3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	Then  I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage

Scenario: 20_Publish Study which is in Staged status
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	Then I see PublishStudyFlagsPage

Scenario: 21_Publish a new minor study and verify the Lab Units list in Mrr page
	When I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate	
	And I navigate to "Inbox" tab from main menu.	
	Then I check subjects in inbox folder "Jobs"
         | Subject                                   |
         | Publishing of Study file (V3) - complete. | 		         

#Changed the LabTests in Dictionary
Scenario: 22_Publish a new minor study and verify the Lab Units list in Mrr page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_20190802_T04435988_V4.zip" with Label "V4"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	Then  I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage

Scenario: 23_Publish Study which is in Staged status
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	Then I see PublishStudyFlagsPage

Scenario: 24_Publish a new minor study and verify the Lab Units list in Mrr page
	When I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate	
	And I navigate to "Inbox" tab from main menu.	
	Then I check subjects in inbox folder "Jobs"
        | Subject                                                                                                                               |
        | Migration of Site 01 for Study file (V4_Major) - complete. 0 out of 0 patients migrated successfully. To review see migration report. |
        | Publishing of Study file (V4_Major) - complete.                                                                                       |	


