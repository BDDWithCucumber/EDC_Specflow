Feature: Labs_DL_DisplayofLabFormquestions_StudyUpdateAllchanges

#US67399	
Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Import_Study1_BaseFileForDictionaryChanges.zip" with study label "Base"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 

#Scenario: T04_Add sites to associate to labs.
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I enter sites details and Save
#	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
#	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#
#Scenario: T05_Assign testadmin testadmin user to 01-Site
#	When I open site with siteid "01" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	And I click breadcrumb "Site Management"
#	
#Scenario: T06_Assign testadmin testadmin user to 02-Site
#	When I open site with siteid "02" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	And I click breadcrumb "Site Management"
#
#Scenario: T07_Add Labs
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
#Scenario: T08_Associate Lab L01 and L02 for 01-SIte
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
#Scenario: T09_Associate Lab L01, L03 for 02-Site
#	When I click breadcrumb "Study Administration"
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "02" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
#	| L01   | Lab01          | PFIZER   | RD         | Active           |
#	And I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
#	| L03   | Lab03          | NOVARTIS | Research   | Active           |
#	
Scenario: T10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T11_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T12_Verify the Lab report data 
	 When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.	  
	  And I click "Checkout" button on "LabForm1" CRF.
	  Then I see "Save" button on the CRF page.
###Initial study publish
#@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T13_Verify the Lab report data before Site Changes
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

Scenario: T14_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

@ObjectiveEvidence @ReqIDUS67403.2
##Change the in Lab Tests Reference Range check Box and lab dict fields: Lab Test Description, Lab Test Code, LOINC Code, Category, Subcategory, Specimen, Method, Result Type, Precision, Unit Description and Conversion Factor
##Major study update
Scenario: T15_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_AllDictionaryChanges.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
Scenario: T16_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.  |

Scenario: T17_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".
#
####publish the study that has change in all the Dictionary values
Scenario: T18_Verify the Lab report data is populated with all the latest Dictionary lab values	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 011         | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 011         | Text            |                  |
		| 2         | LOINC Code           | 111         | Text            |                  |
		| 2         | Category             | cup11       | Text            |                  |
		| 2         | Subcategory          | subcup11    | Text            |                  |
		| 2         | Specimen             | speccup11   | Text            |                  |
		| 2         | Method               | Metcup11    | Text            |                  |
		| 2         | ResultType           | Rescup11    | Text            |                  |
		| 2         | NormalizedLabUnit    | 02          | Text            |                  |
		| 2         | Precision            | 3           | Text            |                  |	
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | CancelRow        |
	  And I click "Cancel" button on "LabForm1" CRF.

Scenario: T19_MigragePatients
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

Scenario: T20_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

###publish the study that has change in all the Dictionary values >> After patient migration Verify the Dictionary values
Scenario: T21_Verify the Lab report data is populated with all the latest Dictionary lab values
	 # When I click on "Save" button on "LabForm1" CRF.
	 # Then The CRF with data is saved and checked-in successfully.	 
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  And I click "Checkout" button on "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 011         | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 011         | Text            |                  |
		| 2         | LOINC Code           | 111         | Text            |                  |
		| 2         | Category             | cup11       | Text            |                  |
		| 2         | Subcategory          | subcup11    | Text            |                  |
		| 2         | Specimen             | speccup11   | Text            |                  |
		| 2         | Method               | Metcup11    | Text            |                  |
		| 2         | ResultType           | Rescup11    | Text            |                  |
		| 2         | NormalizedLabUnit    | 02          | Text            |                  |
		| 2         | Precision            | 3           | Text            |                  |	
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | Cancel Row       |
	  And I click "Cancel" button on "LabForm1" CRF.


Scenario: T22_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"		
													
#Change the Attribute mapping from DOB to Age unit form Here Publish the study that has all the Dictionary values as null except the Lab Test Description,Lab Test Code
#System should treat it as Minor update	
@ObjectiveEvidence @ReqIDUS67403.2
#Change the lab dict fields: Lab Test Description, Lab Test Code, LOINC Code, Category, Subcategory, Specimen, Method, Result Type, Precision, Unit Description and Conversion Factor

Scenario: T23_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Import_Study1_MajorAllNullValues.zip" with Label "Major2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

#
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
         | Publishing of Study file (Major2) - complete.  |		 
		   
####publish the study that has change in all the Dictionary values

Scenario: T25_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T26_Verify the Lab report data before Site Changes	
	 When I open form "LabForm1" of event "Visit (Week 2)"
	 And I click "Checkout" button on "LabForm1" CRF.
	 And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | [Blank]     | Text            |                  |
		| 2         | Category             | [Blank]     | Text            |                  |
		| 2         | Subcategory          | [Blank]     | Text            |                  |
		| 2         | Specimen             | [Blank]     | Text            |                  |
		| 2         | Method               | [Blank]     | Text            |                  |
		| 2         | ResultType           | [Blank]     | Text            |                  |
		| 2         | NormalizedLabUnit    | [Blank]     | Text            |                  |
		| 2         | Precision            | [Blank]     | Text            |                  |	
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | Cancel Row       |
	  And I click "Cancel" button on "LabForm1" CRF.

Scenario: T27_Migrate Patients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 01 for Study file (Major2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T28_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T29_Verify the Lab report data before Site Changes	
	 When I open form "LabForm1" of event "Visit (Week 2)"
	 And I click "Checkout" button on "LabForm1" CRF.
	 And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | [Blank]     | Text            |                  |
		| 2         | Category             | [Blank]     | Text            |                  |
		| 2         | Subcategory          | [Blank]     | Text            |                  |
		| 2         | Specimen             | [Blank]     | Text            |                  |
		| 2         | Method               | [Blank]     | Text            |                  |
		| 2         | ResultType           | [Blank]     | Text            |                  |
		| 2         | NormalizedLabUnit    | [Blank]     | Text            |                  |
		| 2         | Precision            | [Blank]     | Text            |                  |	
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor |             | DISABLEDTEXT1   | Disabled | Cancel Row       |
	  And I click "Cancel" button on "LabForm1" CRF.

#Publish the base study file
Scenario: T30_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

#@ObjectiveEvidence @ReqIDUS67403.2
###Major study update , Remove the Lab Mappings in Designer and Publish the study 
Scenario: T31_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_LabMappings_Removed.zip" with Label "Major3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T32_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major3) - complete.  |

Scenario: T33Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T34_Verify the Lab report data before Site Changes
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


Scenario: T35_Migrate Patients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 01 for Study file (Major3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T36_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T37_Verify the Lab report data before Site Changes
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
###################################### Incorrect Lab mappings at Question level****************************************************
#Publish the base study file
Scenario: T38_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

#@ObjectiveEvidence @ReqIDUS67403.2
###Major study update , Change the lab Mapping at Question level for the Form category, Sub category, Specimen, Method, Result Type,precision, CRFLabDescription,Conversation Factor
###NormalizedlabUnit,Precision
Scenario: T39_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_IncorrectLabMappingAtQuestionLevel.zip" with Label "Major4"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T40_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major4) - complete.  |

Scenario: T41_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T42_Verify the Lab report data before Site Changes
	  When I open form "LabForm1" of event "Visit (Week 2)"
	 And I click "Checkout" button on "LabForm1" CRF.
	 And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
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

Scenario: T43_Migrate Patients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 01 for Study file (Major3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T44_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T45_Verify the Lab report data before Site Changes
	   When I open form "LabForm1" of event "Visit (Week 2)"
	   And I click "Checkout" button on "LabForm1" CRF.
	   And I expand row "2" of table "Autobuild Table:"
	   Then I verify below "Autobuild Table:" table questions data in the CRF.
	   And I verify below "Autobuild Table:" table questions data in the CRF.	  	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |		
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |		
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | ConversionFactor     |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | LOINC Code           |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | Category             |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | Subcategory          |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | Specimen             |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | Method               |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | ResultType           |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | NormalizedLabUnit    |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | Precision            |             | DISABLEDTEXT1   | Disabled |                  |
      | 2         | Lab Test Description |             | DISABLEDTEXT1   | Disabled | OK               |
     And I click "Cancel" button on "LabForm1" CRF.	  	 
		
##################################Both Forms Mapped to same Domain###########################################

#Publish the base study file
Scenario: T46_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

#@ObjectiveEvidence @ReqIDUS67403.2
###Major study update , Change the lab Mapping at Question level for the Form category, Sub category, Specimen, Method, Result Type,precision, CRFLabDescription,Conversation Factor
###NormalizedlabUnit,Precision
Scenario: T47_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_BothFormsMappedTosameDomain.zip" with Label "Major5"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T48_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major5) - complete.  |

Scenario: T49_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T50_Verify the Lab report data before Site Changes
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

Scenario: T51_Verify the Lab report data 
	 When I open form "LabForm2" of event "Visit (Week 2)"	  
	  And I click "Checkout" button on "LabForm1" CRF.
	  Then I see "Save" button on the CRF page.
##Initial study publish
@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T52_Verify the Lab report data before Site Changes
	  When I click on "Save" button on "LabForm2" CRF.
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
     And I click "Cancel" button on "LabForm2" CRF.


Scenario: T53_Migrate Patients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 01 for Study file (Major3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T54_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T55_Verify the Lab report data before Site Changes
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

Scenario: T56_Verify the Lab report data before Site Changes
	   When I open form "LabForm2" of event "Visit (Week 2)"
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

########################################### Map a different Domain and Add them to the Form ##################################################
Scenario: T57_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

#@ObjectiveEvidence @ReqIDUS67403.2
Scenario: T58_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_AddDomain3andLabForm3.zip" with Label "Major5"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T59_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                             |
         #| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major5) - complete.  |

Scenario: T60_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T61_Verify the Lab report data before Site Changes
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

Scenario: T62_Verify the Lab report data 
	 When I open form "LabForm2" of event "Visit (Week 2)"	  
	  And I click "Checkout" button on "LabForm1" CRF.
	  Then I see "Save" button on the CRF page.

###Initial study publish
#@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T63_Verify the Lab report data before Site Changes
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
     And I click "Cancel" button on "LabForm2" CRF.


Scenario: T64_Verify the Lab report data 
	 When I open form "LabForm3" of event "Visit (Week 2)"	  
	  And I click "Checkout" button on "LabForm1" CRF.
	  Then I see "Save" button on the CRF page.

Scenario: T65_Verify the Lab report data before Site Changes
	  When I click on "Save" button on "LabForm3" CRF.
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


Scenario: T66_Verify the Lab report data 
	 When I open form "LabForm2" of event "Visit (Week 2)"	  
	  And I click "Checkout" button on "LabForm1" CRF.
	  Then I see "Save" button on the CRF page.
###Initial study publish
#@ObjectiveEvidence @ReqIDUS67403.1
Scenario: T67_Verify the Lab report data before Site Changes
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
     And I click "Cancel" button on "LabForm2" CRF.


Scenario: T68_Migrate Patients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 01 for Study file (Major3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T69_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T70_Verify the Lab report data before Site Changes
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

Scenario: T71_Verify the Lab report data before Site Changes
	   When I open form "LabForm2" of event "Visit (Week 2)"
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
     And I click "Cancel" button on "LabForm2" CRF.


Scenario: T72_Verify the Lab report data before Site Changes
	   When I open form "LabForm3" of event "Visit (Week 2)"
	 And I click "Checkout" button on "LabForm3" CRF.
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








#Scenario: T40_Upload and Stage a Study which has major study changes
#	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
#	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
#	And I click browse button in upload study file page
#	And I upload study "" with Label "Minor1"
#	And I open study which has "Uploaded" status
#	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
#	And I open study which has "Staged" status
#	And I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage
#	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
#	And I clicked Continue button in PublishStudyFlagsPage
#	And I click Publish button in PublishStudyPage
#	And I navigate to "Inbox" tab from main menu.
#	Then I check subjects in inbox folder "Jobs"
#         | Subject                                                                                                                             |
#         | Migration of Site 01 for Study file (Minor1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
#         | Publishing of Study file (Minor1) - complete.                                                                                       |



		






		
     