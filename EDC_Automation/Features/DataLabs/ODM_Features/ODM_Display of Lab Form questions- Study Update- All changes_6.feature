Feature: Labs__DL-Display of Lab Form questions- Study Update- All changes_6	

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

#Scenario: T02_Select Complete Change History in User preferences
#	When I select DataManagerPortal item "User Preferences" from drop down
#	And I enable CompleteChangeHistory in UserPreferencesPage
#	And I click save button in UserPreferencesPage
#	Then I see Save Success message on User Preferences page.
#
#	##############Publish the base study ########################
#Scenario: T03_Delete a study
#	When I delete study
#	Then I see study label "No Study Loaded" in header
##publish the base study
#Scenario: T04_Upload and publish the study.
#    When I click breadcrumb "Study Management"
#    And I upload a study "Import_Study1_BaseFile_No.zip" with study label "Base"
#    Then I see study label "Test4500_CodleistLinkages_Base" in header 

#Scenario: T05_Add a new lab test reference range record under Lab01
#	 Given I navigate to "Local Labs" tab from main menu.
#     When I open lab with labid "L01" from ManageReferenceRanges page
#	 And I open labtest with labname "01" from labtests page
#	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
#	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
#	 | 02/25/2019 | 02/03/2025 | Male   | >             | 20         | <           | 35       | =                    | 3                 | =                     | 15                 | =                      | 2.41                | =                       | 25.71                | 01   | False |	 
#	 Then I see the reference range ids in the Reference Range Table.
#	| ReferenceRangeID    |
#	| {ReferenceRangeID1} |

#Scenario: T06_Add patient 01-PAT from Datalabs UI
#      Given I navigate to "Patients" tab from main menu.
#      And I select the site "01-Site" from Sites dropdown.
#      When I add patient with below details.
#      | ScreenID | PatientInitials | ScreenDate |
#      | 01       |   PAT           | 06/14/2019 |
#	 Then I see below patients added in the Patients table.
#      | PatientID |
#      | 01-PAT    |
#	
#
#Scenario: T07_Navigate to site and select patient
#      Given I navigate to "Patients" tab from main menu.
#      And I select the site "01-Site" from Sites dropdown.
#      When I select the patient "01-PAT" from patients table.
#      Then I see Patient details page for "01-PAT".
#
#Scenario: T08_Expand the Visit (Screening) event and open the Demographics RTSM form and submit the form data.
#	  Given I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
#      When I click "Checkout" button on "Demographics RTSM" CRF.      
#      And I enter below flat questions data in the CRF.
#      | QuestionPrompt            | AnswerValue | AnswerFieldType |
#      | Date of Birth:            | 08/09/2019  | TextBox         |
#      | Gender:                   | Male        | ListBox         |
#      | Age at Study Start:       | 28          | TextBox         |
#      | Age Units at Study Start: | Years       | ListBox         |
#	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
#	  Then The CRF with data is saved and checked-in successfully.
#
#Scenario: T09_Expand the Visit (Week 2) event and open the LabForm1 form and submit the form data.
#	  Given I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
#      When I click "Checkout" button on "LabForm1" CRF.      
#      And I enter below flat questions data in the CRF.
#      | QuestionPrompt      | AnswerValue | AnswerFieldType |
#      | Lab ID              | Lab01 (L01) | ListBox         |
#      | CRF Collection Date | 05/21/2019  | TextBox         | 
#	   And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
#	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
#	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
#	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
#	  And I click on "Save & Close" button on "LabForm1" CRF.
#	  Then The CRF with data is saved and checked-in successfully.     
###	  And I click on "Save" button on "LabForm1" CRF.
###	  Then The CRF with data is saved and checked-in successfully.

#Scenario: T10_Navigate to site and select patient
#      Given I navigate to "Patients" tab from main menu.
#      And I select the site "01-Site" from Sites dropdown.
#      When I select the patient "01-PAT" from patients table.
#      Then I see Patient details page for "01-PAT".
#
#Scenario: T11_Verify the Lab report data 
#	 When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.	  
#	  And I click "Checkout" button on "LabForm1" CRF.
#	  Then I see "Save" button on the CRF page.
#
#Scenario: T12_Verify the Lab report data before Site Changes
#	  When I click on "Save" button on "LabForm1" CRF.
#	  Then The CRF with data is saved and checked-in successfully.
#	  And I verify below "Autobuild Table:" table questions data in the CRF.	  	 
#		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
#		| 2         | CRF Lab Test Name                    | Test1       | Text            |                  |
#		| 2         | Lab Test Description                 | 01          | Text            |                  |
#		| 2         | Lab Test Name                        | 01          | Text            |                  |
#		| 2         | Lab Test Code                        | 01          | Text            |                  |
#		| 2         | LOINC Code                           | 11          | Text            |                  |
#		| 2         | Category                             | cup1        | Text            |                  |
#		| 2         | Subcategory                          | subcup1     | Text            |                  |
#		| 2         | Specimen                             | speccup1    | Text            |                  |
#		| 2         | Method                               | Metcup1     | Text            |                  |
#		| 2         | ResultType                           | Rescup1     | Text            |                  |
#		| 2         | NormalizedLabUnit                    | 01          | Text            |                  |
#		| 2         | NormalizedLabValue                   | 16.00000    | Text            |                  |
#		| 2         | Precision                            | 5           | Text            |                  |
#		| 2         | CriticalReferenceRangeLow            | 2.41000     | Text            |                  |
#		| 2         | CriticalReferenceRangeHigh           | 25.71000    | Text            |                  |
#		| 2         | NormalizedNormalReferenceRangeHigh   | 15.00000    | Text            |                  |
#		| 2         | NormalizedCriticalReferenceRangeLow  | 2.41000     | Text            |                  |
#		| 2         | NormalizedReferenceRangeLow          | 3.00000     | Text            |                  |
#		| 2         | NormalizedCriticalReferenceRangeHigh | 25.71000    | Text            |                  |
#		| 2         | NormalReferenceRangeLow              | 3.00000     | Text            |                  |
#		| 2         | NormalReferenceRangeHigh             | 15.00000    | Text            |                  |
#		| 2         | ConversionFactor                     | 1           | Text            | OK               |
#		#| 2         | Reference Range ID                   | {ReferenceRangeID1} | Text            | OK               |
#		
#	#Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
# #     | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
# #     | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               |    
#     And I click "Cancel" button on "LabForm1" CRF.
#
#Scenario: T13_Add patient 01-PAT from Datalabs UI
#      Given I navigate to "Patients" tab from main menu.
#      And I select the site "01-Site" from Sites dropdown.
#     When I select the patient "01-PAT" from patients table.
#     Then I see Patient details page for "01-PAT".

#Scenario: T14_Verify the Lab report data before Site Changes
#	  When I open form "LabForm1" of event "Visit (Week 2)"	  
#	  And I expand row "2" of table "Autobuild Table:"

#Scenario: T15_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I open form "LabForm1" of event "Visit (Week 2)"	 
#	And I expand row "2" of table "Autobuild Table:"	
#	And I click "changeHistory.gif" icon of a question "Lab Test Description" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | 01       | Reason: Initial Entry[Derived] |  
#
#Scenario: T16_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "Lab Test Name" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
#	
#Scenario: T17_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "Lab Test Code" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
#	
#Scenario: T18_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "LOINC Code" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | 11       | Reason: Initial Entry[Derived] |
#	
#Scenario: T19_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "Category" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | cup1     | Reason: Initial Entry[Derived] |
#	
#Scenario: T20_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "Subcategory" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | subcup1  | Reason: Initial Entry[Derived] |
#	
#Scenario: T21_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "Method" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Metcup1  | Reason: Initial Entry[Derived] |	
#	
#Scenario: T22_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "ResultType" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Rescup1  | Reason: Initial Entry[Derived] |	
#	
#Scenario: T23_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "NormalizedLabUnit" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
#	
#Scenario: T24_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "Precision" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | 5        | Reason: Initial Entry[Derived] |	
#	
#Scenario: T25_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
#	When I click cancel button in ChangeHistoryModal	
#	And I click "changeHistory.gif" icon of a question "Specimen" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | speccup1 | Reason: Initial Entry[Derived] |	
	 ##########################Publish the study by changing the Reference Range to No for test 01 ########################333
#Scenario: T26_Navigate to StudyManagement page
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Study Management" In StudyAdministrationPage
#	Then I see BreadCrumb "Study Management"
#
#@ObjectiveEvidence @ReqIDUS67403.2
#
###Major study update
#Scenario: T27_Upload and Stage a Study which has major study changes
#	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
#	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
#	And I click browse button in upload study file page	
#	And I upload study "Import_Study1_LabsSettoNo.zip" with Label "Major1"
#	And I open study which has "Uploaded" status
#	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
#	And I open study which has "Staged" status
#	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
##
#Scenario: T28_Publish the study file that has Major changes	
#	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
#	And I clicked Continue button in PublishStudyFlagsPage
#	And I select patient migration option "Do not migrate" in PublishStudyPage
#	And I click Publish button in PublishStudyPage
#	And I navigate to "Inbox" tab from main menu.
#	Then I check subjects in inbox folder "Jobs"
#         | Subject                                                                                                                             |
#         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
#         | Publishing of Study file (Major1) - complete.  |
Scenario: T29_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T30_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                    | Test1       | Text            |                  |
		| 2         | Lab Test Description                 | 01          | Text            |                  |
		| 2         | Lab Test Name                        | 01          | Text            |                  |
		| 2         | Lab Test Code                        | 01          | Text            |                  |
		| 2         | LOINC Code                           | 11          | Text            |                  |
		| 2         | Category                             | cup1        | Text            |                  |
		| 2         | Subcategory                          | subcup1     | Text            |                  |
		| 2         | Specimen                             | speccup1    | Text            |                  |
		| 2         | Method                               | Metcup1     | Text            |                  |
		| 2         | ResultType                           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit                    | 02          | Text            |                  |
		| 2         | NormalizedLabValue                   | 35.68000    | Text            |                  |
		| 2         | Precision                            | 5           | Text            |                  |
		| 2         | CriticalReferenceRangeLow            | 2.41000     | Text            |                  |
		| 2         | CriticalReferenceRangeHigh           | 25.71000    | Text            |                  |
		| 2         | NormalizedNormalReferenceRangeHigh   | 33.45000    | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeLow  | 5.37430     | Text            |                  |
		| 2         | NormalizedReferenceRangeLow          | 6.69000     | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeHigh | 57.33330    | Text            |                  |
		| 2         | NormalReferenceRangeLow              | 3.00000     | Text            |                  |
		| 2         | NormalReferenceRangeHigh             | 15.00000    | Text            |                  |
		| 2         | ConversionFactor                     | 2.23           | Text            | OK               |
		#| 2         | Reference Range ID                   | {ReferenceRangeID1} | Text            | OK               |
	  And I click "Cancel" button on "LabForm1" CRF.
##
Scenario: T31_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID   |
	| 01-PAT |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T32_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T33_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                    | Test1       | Text            |                  |
		| 2         | Lab Test Description                 | 01          | Text            |                  |
		| 2         | Lab Test Name                        | 01          | Text            |                  |
		| 2         | Lab Test Code                        | 01          | Text            |                  |
		| 2         | LOINC Code                           | 11          | Text            |                  |
		| 2         | Category                             | cup1        | Text            |                  |
		| 2         | Subcategory                          | subcup1     | Text            |                  |
		| 2         | Specimen                             | speccup1    | Text            |                  |
		| 2         | Method                               | Metcup1     | Text            |                  |
		| 2         | ResultType                           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit                    | 02          | Text            |                  |
		| 2         | NormalizedLabValue                   | 35.68000    | Text            |                  |
		| 2         | Precision                            | 5           | Text            |                  |
		| 2         | CriticalReferenceRangeLow            | 2.41000     | Text            |                  |
		| 2         | CriticalReferenceRangeHigh           | 25.71000    | Text            |                  |
		| 2         | NormalizedNormalReferenceRangeHigh   | 33.45000    | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeLow  | 5.37430     | Text            |                  |
		| 2         | NormalizedReferenceRangeLow          | 6.69000     | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeHigh | 57.33330    | Text            |                  |
		| 2         | NormalReferenceRangeLow              | 3.00000     | Text            |                  |
		| 2         | NormalReferenceRangeHigh             | 15.00000    | Text            |                  |
		| 2         | ConversionFactor                     | 2.23        | Text            | OK               |
		#| 2         | Reference Range ID                   | {ReferenceRangeID1} | Text            | OK               |
	#Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
 #     | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
 #     | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               | 
	  And I click "Cancel" button on "LabForm1" CRF.
	  ######################Again publish the same that has Reference Range as No for Lab Reference Range in Dictionary ###########

Scenario: T34_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

@ObjectiveEvidence @ReqIDUS67403.2

##Major study update
Scenario: T35_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Import_Study1_LabsSettoNo.zip" with Label "Minor1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         | Migration of Site 01 for Study file (Minor1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
#         | Publishing of Study file (Minor1) - complete.  

Scenario: T36_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T37_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                    | Test1       | Text            |                  |
		| 2         | Lab Test Description                 | 01          | Text            |                  |
		| 2         | Lab Test Name                        | 01          | Text            |                  |
		| 2         | Lab Test Code                        | 01          | Text            |                  |
		| 2         | LOINC Code                           | 11          | Text            |                  |
		| 2         | Category                             | cup1        | Text            |                  |
		| 2         | Subcategory                          | subcup1     | Text            |                  |
		| 2         | Specimen                             | speccup1    | Text            |                  |
		| 2         | Method                               | Metcup1     | Text            |                  |
		| 2         | ResultType                           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit                    | 01          | Text            |                  |
		| 2         | NormalizedLabValue                   | 16.00000    | Text            |                  |
		| 2         | Precision                            | 5           | Text            |                  |
		| 2         | CriticalReferenceRangeLow            | 2.41000     | Text            |                  |
		| 2         | CriticalReferenceRangeHigh           | 25.71000    | Text            |                  |
		| 2         | NormalizedNormalReferenceRangeHigh   | 15.00000    | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeLow  | 2.41000     | Text            |                  |
		| 2         | NormalizedReferenceRangeLow          | 3.00000     | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeHigh | 25.71000    | Text            |                  |
		| 2         | NormalReferenceRangeLow              | 3.00000     | Text            |                  |
		| 2         | NormalReferenceRangeHigh             | 15.00000    | Text            |                  |
		| 2         | ConversionFactor                     | 1           | Text            | OK               |
		#| 2         | Reference Range ID                   | {ReferenceRangeID1} | Text            | OK               |
	#Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
 #     | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
 #     | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               | 
	  And I click "Cancel" button on "LabForm1" CRF.
	  



