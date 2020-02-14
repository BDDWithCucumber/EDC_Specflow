Feature: Labs__DL-Display of Lab Form questions- Study Update- All changes_2
	
Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header
#publish the base study
Scenario: T03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Import_Study1_BaseFileForDictionaryChanges.zip" with study label "Base"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 

Scenario: T04_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T05_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T06_Verify the Lab report data 
	 When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.	  
	  And I click "Checkout" button on "LabForm1" CRF.
	  Then I see "Save" button on the CRF page.
###Initial study publish
#@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T07_Verify the Lab report data before Site Changes
	  When I click on "Save" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.
	  And I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Specimen             | speccup1    | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 5           | Text            | OK               |		
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               |    
     And I click "Cancel" button on "LabForm1" CRF.
	 ######################prepare the study by removing the Lab Mappings Then the previous values should still remain############################

Scenario: T08_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

@ObjectiveEvidence @ReqIDUS67403.2
##Removed the mappings for all the Dictionary fields upon study publish still it will display previous values
##Major study update
Scenario: T09_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_RemovedAllTheLabMappings.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
Scenario: T10_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.  |
Scenario: T11_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T12_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Specimen             | speccup1    | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 5           | Text            | OK               |		
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               | 
	  And I click "Cancel" button on "LabForm1" CRF.
##
Scenario: T13_MigragePatients
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

Scenario: T14_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

###After migration user should still see the Dictionary values
Scenario: T15_Verify the Lab report data is populated with all the latest Dictionary lab values
	 # When I click on "Save" button on "LabForm1" CRF.
	 # Then The CRF with data is saved and checked-in successfully.	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	 Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Specimen             | speccup1    | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 5           | Text            | OK               |		
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               | 
	  And I click "Cancel" button on "LabForm1" CRF.

	  ################################## publish the base study ###################
#Publish the base study
Scenario: T16_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T17_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Import_Study1_BaseFileForDictionaryChanges.zip" with study label "Base"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 

Scenario: T18_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T19_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T20_Verify the Lab report data 
	 When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.	  
	  And I click "Checkout" button on "LabForm1" CRF.
	  Then I see "Save" button on the CRF page.
###Initial study publish
#@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T21_Verify the Lab report data before Site Changes
	  When I click on "Save" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.
	  #############################Publish the study by removing the Dictionary Questions ############################################3
Scenario: T22_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

@ObjectiveEvidence @ReqIDUS67403.2
#publish the base study after deleting the Questions Category,Lionic code,Specimen,Method,SubCategory
Scenario: T23_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_RemovedQuestions.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
Scenario: T24_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.  |
Scenario: T25_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".
#
####publish the study that has change 
Scenario: T26_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Specimen             | speccup1    | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 5           | Text            | OK               |		
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               | 
	  And I click "Cancel" button on "LabForm1" CRF.
##
Scenario: T27_MigragePatients
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

Scenario: T28_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

###publish the study that has change in all the Dictionary values >> After patient migration Verify the Dictionary values
Scenario: T29_Verify the Lab report data is populated with all the latest Dictionary lab values
	 # When I click on "Save" button on "LabForm1" CRF.
	 # Then The CRF with data is saved and checked-in successfully.	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	 Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |		
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 5           | Text            | OK               |		
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               | 
	  And I click "Cancel" button on "LabForm1" CRF.

	  ###########################Now publish the study by including the Questions##############################
Scenario: T30_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

@ObjectiveEvidence @ReqIDUS67403.2
#publish the base study after deleting the Questions Category,Lionic code,Specimen,Method,SubCategory
Scenario: T31_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_BaseFileForDictionaryChanges.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
Scenario: T32_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.  |
Scenario: T33_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".
	  

Scenario: T34_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |		
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 5           | Text            | OK               |		
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               |
	  And I click "Cancel" button on "LabForm1" CRF.
##
Scenario: T35_MigragePatients
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

Scenario: T36_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

################################################
Scenario: T37_Verify the Lab report data is populated with all the latest Dictionary lab values
	 # When I click on "Save" button on "LabForm1" CRF.
	 # Then The CRF with data is saved and checked-in successfully.	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Specimen             | speccup1    | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 5           | Text            | OK               |		
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | OK               | 
	  And I click "Cancel" button on "LabForm1" CRF.



