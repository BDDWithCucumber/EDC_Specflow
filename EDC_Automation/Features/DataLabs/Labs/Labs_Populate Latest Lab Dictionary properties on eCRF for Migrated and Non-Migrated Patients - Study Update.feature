Feature: LabItemsDSandDL

Scenario: 01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

#Scenario: 02_Delete a study
#	When I delete study
#	Then I see study label "No Study Loaded" in header
#
### Prepare a study by Mapping the Questions with Domain D1 for Lab mappings and with Questions and no mappings for Domain D2
#Scenario: 03_Prepare a study file that doesn't have Lab Parameter mapping for all the fields except for the mandatory fields and with valid Questions for the Lab parameter Mapping fields and publish it
#      When I click breadcrumb "Study Management"
#      And I upload a study "Questions_NoMapping_1D.zip" with study label "Questions"
#      Then I see study label "Questions" in header      

#Scenario: 04_Add Site 01-Site
#      When I select DataManagerPortal item "Study Administration" from drop down
#      And I click Link "Site Management" In StudyAdministrationPage
#      And I enter sites details and Save
#      | SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
#      | 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |	  
#      And I open site with siteid "01" and site name "Site" from SiteManagement page
#      And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#      And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#      And I click breadcrumb "Site Management"
#
#Scenario: 05_Add Labs
#	When I click breadcrumb "Study Administration"
#	And I click Link "Lab Management" In StudyAdministrationPage
#	And I enter labs details and Save
#	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	#| L04   | Lab04          | NOVARTIS | Research   | A1       | A2       | A3       | City4 | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
#	#| L05   | Lab05          | CIPLA    | Production | A1       | A2       | A3       | City5 | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	Then I see labs with details in lab grid
#	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	#| L04   | Lab04          | NOVARTIS | Research   | A1       | A2       | A3       | City4 | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
#	#| L05   | Lab05          | CIPLA    | Production | A1       | A2       | A3       | City5 | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#
#Scenario: 06_Associate Lab L01,L02 and L03 for 01-SIte
#	When I click breadcrumb "Study Administration"
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "01" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	#And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
#	#And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	#And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
#	#And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
#	| L01   | Lab01          | PFIZER  | RD         | Active           |
#	#And I see lab data in labs tab of Site in SitePage
#	#| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
#	#| L02   | Lab02          | PFIZER  | RD         | Active           |
#	#And I see lab data in labs tab of Site in SitePage
#	#| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
#	#| L03   | Lab03          | Novartis | Research   | Active           |

Scenario: 07_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 05/28/2019 |
	  | 02       |   PAT           | 05/28/2019 |
	  | 03       |   PAT           | 05/28/2019 |
	  | 04       |   PAT           | 05/28/2019 |
	  | 05       |   PAT           | 05/28/2019 |
	  | 06       |   PAT           | 05/28/2019 |
	  | 07       |   PAT           | 05/28/2019 |
	  | 08       |   PAT           | 05/28/2019 |
	  | 09       |   PAT           | 05/28/2019 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |
      | 02-PAT    |
      | 03-PAT    |
	  | 04-PAT    |
	  | 05-PAT    |
	  | 06-PAT    |
	  | 07-PAT    |
	  | 08-PAT    |
	  | 09-PAT    |

Scenario: 08_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 05/28/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 09_Discontinue the patient 01-PAT
	When I click ActionPalette Item "Discontinue Patient" in "PatientPortalActions" ActionPalette
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Discontinued Date: | 05/28/2019  | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 10_Select and enroll patient 02-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "02-PAT" from patients table.
      When I enroll the patient "02-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 02       | 05/28/2019 | Yes           |
      Then I see patient "02-PAT" status as "Enrolled" on Patient details page.

Scenario: 11_Select and enroll patient 03-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "03-PAT" from patients table.
      When I enroll the patient "03-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 03       | 05/28/2019 | Yes           |
      Then I see patient "03-PAT" status as "Enrolled" on Patient details page.

Scenario: 12_Complete the patient 03-PAT
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "03-PAT" from patients table.
	When I click ActionPalette Item "Complete Patient" in "PatientPortalActions" ActionPalette
	And I enter below flat questions data in the CRF.
	| QuestionPrompt  | AnswerValue | AnswerFieldType |
	| Completed Date: | 05/28/2019  | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "" CRF.
	Then The CRF with data is saved and checked-in successfully.
#
#Freeze patients		
Scenario: 13_Freeze the patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.	
	And I click ActionPalette Item "Freeze Patients" in "PatientSiteActions" ActionPalette
	When I select patients to freeze in FreezePatientsPage
	| PatientID |
	| 04-PAT    |
	And I click on Save button on in FreezepatientsPage
	Then I verify the success message displayed as "Freeze Patient Successful"
#
Scenario: 14_Freeze the patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.	
	And I click ActionPalette Item "Freeze Patients" in "PatientSiteActions" ActionPalette
	When I select patients to freeze in FreezePatientsPage
	| PatientID |
	| 05-PAT    |
	And I click on Save button on in FreezepatientsPage
	Then I verify the success message displayed as "Freeze Patient Successful"

Scenario: 15_Lock the patient		
	When I click ActionPalette Item "Lock Patients" in "PatientSiteActions" ActionPalette
	And I select patients to lock in LockPatientsPage
	| PatientID |
	| 05-PAT    |
	And I click on Save button on in LockPatientsPage
	Then I verify the success message displayed as "Lock Patient Successful"

Scenario: 16_Freeze the patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.	
	And I click ActionPalette Item "Freeze Patients" in "PatientSiteActions" ActionPalette
	When I select patients to freeze in FreezePatientsPage
	| PatientID |
	| 06-PAT    |
	And I click on Save button on in FreezepatientsPage
	Then I verify the success message displayed as "Freeze Patient Successful"

#Thaw Patient		
Scenario: 17_Thaw the Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.	
	And I click ActionPalette Item "Thaw Patients" in "PatientSiteActions" ActionPalette
	When I select patients to Thaw in ThawPatientsPage
	| PatientID |
	| 06-PAT    |

	And I click on Save button on in ThawPatientsPage
	Then I verify the success message displayed as "Thaw Patient Successful"

Scenario: 18_Fail the patient 07-PAT
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "07-PAT" from patients table.
	When I click ActionPalette Item "Fail Patient" in "PatientPortalActions" ActionPalette
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Failed Date:   | 05/28/2019  | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 19_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 |         | Male          | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 01   | False |
	 | 02/25/2019 |         | Female        | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 01   | False |
	 | 02/25/2019 |         | Not Specified | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 01   | False |
	 Then a Reference ID is auto generated for a newly added lab test in ReferenceRangesPage

Scenario: 20_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Enter data on Demographics form
Scenario: 21_Expand the Visit (Screening) and open the demographics form to update the data
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
Scenario: 22_Expand the Visit (Week2) event and open the LabForm2 form and update the data
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 02/28/2019  | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm1" CRF.
	  And I click "Save" button on "LinkagesForm_FlatQuestions" CRF	  
	  Then The CRF with data is saved and checked-in successfully.
	  Scenario: 13_Verify the Lab report data
	  When I expand row "2" of table "Autobuild Table:"
	 # When I expand "Visit (Week2)" to select and open "LabForm1" CRF.
	  #And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | Save & Close Row | 

# Verify the same for Patient 1 to 7
#For Lock we need to see whether data will be reflected or not?

#Prepare the same with chnage Dictionary fields and migrate all the patients 
Scenario: 23_Publish a new major study with change in Dictionary 
When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181024_T10215882.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major1" Study

Scenario: 24_Verify the Lab report data for Lab Dictionary properties on eCRF for Migrated
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
	  When I expand "Visit (Week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | Save & Close Row | 


 # Verify the values for all the patients from 01 to 07  
 
 #Now prepare a study file with chnages in Lab Dictionary and publish it while publishing don't migrate any patient 
 
 Scenario: 25_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "TestStudy5100_MajorUpdate.zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: 26_Publish Study which is in Staged status
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	Then I see PublishStudyFlagsPage

Scenario: 27_Enable or Disable of reevaluation of Falgs and Signatures
	When I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	Then I see PublishStudyPage

Scenario: 28_Enable or Disable PatientMigration at StudyPublish
	#Given I select "{MenuTab}" tab from the main menu of DataLabs.
	When I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	#And I select "Inbox" tab from the main menu of DataLabs. 

Scenario: 29_MigragePatients
	When I click ActionPalette Item "Migrate Patients" in "SiteListActions" ActionPalette
	And I select patients in MigratePatientsPage
	| Patient |
	| 01-PAT  |
	| 02-PAT  |
	| 03-PAT  |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                         |
	| patients migrated successfully. To review see migration report. |

#Verify the latest Dictionary Property changes are reflected for Patient01
Scenario: 30_Verify the Lab report data for Lab Dictionary properties on eCRF for Migrated
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
	  When I expand "Visit (Week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | Ok               | 

#Verify the latest Dictionary Property changes are reflected for Patient02
Scenario: 31_Verify the Lab report data for Lab Dictionary properties on eCRF for Migrated
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "02-PAT" from patients table.
	  When I expand "Visit (Week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | ok               |

#Verify the latest Dictionary Property changes are reflected for Patient03
Scenario: 32_Verify the Lab report data for Lab Dictionary properties on eCRF for Migrated
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "03-PAT" from patients table.
	  When I expand "Visit (Week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | ok               |

#Verify the latest Dictionary Property changes are not reflected for Patient04
Scenario: 33_Verify the Lab report data for Lab Dictionary properties on eCRF for Migrated
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "04-PAT" from patients table.
	  When I expand "Visit (Week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | ok               |

#Verify the latest Dictionary Property changes are not reflected for Patient05
Scenario: 34_Verify the Lab report data for Lab Dictionary properties on eCRF for Migrated
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "05-PAT" from patients table.
	  When I expand "Visit (Week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | ok               |

#Verify the latest Dictionary Property changes are not reflected for Patient06
Scenario: 35_Verify the Lab report data for Lab Dictionary properties on eCRF for Migrated
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "06-PAT" from patients table.
	  When I expand "Visit (Week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | ok               |

#Verify the latest Dictionary Property changes are not reflected for Patient07
Scenario: 36_Verify the Lab report data for Lab Dictionary properties on eCRF for Migrated
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "07-PAT" from patients table.
	  When I expand "Visit (Week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
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
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | ok               |
	
#Remove,Enter, update scenarios