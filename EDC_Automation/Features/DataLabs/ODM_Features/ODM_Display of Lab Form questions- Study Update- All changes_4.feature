Feature: Labs__DL-Display of Lab Form questions- Study Update- All changes_4

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

	##############Publish the base study ########################
Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header
#publish the base study
Scenario: T03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Import_Study1_Base_AgeUnit.zip" with study label "Base"
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
	  ##################Add the reference record for ################################

Scenario: T08_Add a new lab test reference range record under Lab01
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 | 02/03/2025 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 2.41               | <                       | 25.71                | 02   | False |	 
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |
	

Scenario: T09_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T10_Expand the Visit (Screening) event and open the Demographics RTSM form and submit the form data.
	  Given I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Date of Birth:            | 08/09/2019  | TextBox         |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: T11_Expand the Visit (Week 2) event and open the LabForm1 form and submit the form data.
	  Given I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
      When I click "Checkout" button on "LabForm1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 05/21/2019  | TextBox         |      
	  And I click on "Save" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

  #################Now added the new codelist Test -Female in Attribute mappings and publish the study ##################
Scenario: T12_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

@ObjectiveEvidence @ReqIDUS67403.2
#Major study update
Scenario: T13_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_NewCodelistAddedInAttributeMappings.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
Scenario: T14_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.  |

Scenario: T15_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".
#

Scenario: T16_Verify the Lab report data is populated with all the latest Dictionary lab values	 
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

Scenario: T17_MigragePatients
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

Scenario: T19_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".	 

###publish the study that has change in all the Dictionary values >> After patient migration Verify the Dictionary values
Scenario: T20_Verify the Lab report data is populated with all the latest Dictionary lab values
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
	 ###############Now change the Gender vaue to test in the Demographics Form and save still the Dictionary values should be disaplyed ###############
Scenario: T21_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Gender:        | Male               | Test           | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.
	  
Scenario: T22_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".	 
	  
Scenario: T23_Verify the Lab report data is populated with all the latest Dictionary lab values	 
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
	 ####################### Now change the value in Demograpihcs form to get the lab values  #################
Scenario: T24_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Gender:        | Test               | Male           | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.	  
	 ##########################Now change the Attribute value for Years in the study File and publish the study ##############  

Scenario: T25_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

@ObjectiveEvidence @ReqIDUS67403.2
#Major study update
Scenario: T26_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_ChangedtheAttributeMappingsForAgeUnit.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
Scenario: T27_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.  |

Scenario: T28_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".
#

Scenario: T29_Verify the Lab report data is populated with all the latest Dictionary lab values	 
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

Scenario: T30_MigragePatients
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

Scenario: T31_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T32_Verify the Lab report data is populated with all the latest Dictionary lab values	 
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