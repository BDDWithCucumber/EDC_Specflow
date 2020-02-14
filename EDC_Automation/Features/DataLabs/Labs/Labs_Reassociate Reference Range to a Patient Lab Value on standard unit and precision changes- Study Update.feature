Feature: DataLabs_V5.8.0_Reassociate Reference Range to a Patient Lab Value on Study Update

#Userstory: US63238
#Userstory Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/305714311816
#Author:Sirisha Gorrumuchu
#Copyright © 2018 PAREXEL International


Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base1.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 

Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |

Scenario: 05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"
	
Scenario: 06_Assign testadmin testadmin user to 02-Site
	When I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: 07_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |

Scenario: 08_Associate Lab L01 and L02 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L02   | Lab02          | PFIZER  | RD         | Active           |

Scenario: 09_Associate Lab L01, L03 for 02-Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER   | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L03   | Lab03          | NOVARTIS | Research   | Active           |
	
Scenario: 10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 11_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 12_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 13_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |



Scenario: 14_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: 15_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 16_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

 Scenario: 17_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12      | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20      | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26      | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.01        | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 18_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12      | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20      | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26      | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.01        | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.


############# Majorstudy update #################
	
Scenario: 19_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

#[Update standard unit to different value [Ex:2Unit] in Test Tab]
#Lab Test Tab-Standard Unit>>3 Unit
#Converstion Factor Tab>> To Unit>>2 Unit 
Scenario: 20_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 21_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_2-Update standard unit to different value.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.                                                                                       |
	
Scenario: 22_Verify the Reference Range values for LabTest in LabForm2.
	#[Update standard unit to different value [Ex:3Unit] in Test Tab]
	#Lab Test Tab-Standard Unit>>3 Unit
    #Converstion Factor Tab>> To Unit>>2 Unit 
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 15.66         | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | 1             | Text            | Ok			    |



	#[Update standard unit to new value [Ex:3Unit] in both Test Tab and conversion factor tab]
	#Lab Test Tab-Standard Unit>>3 Unit
    #Converstion Factor Tab>> To Unit>>3 Unit
	Scenario: 23_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 24_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_3-Update Unit value to new value-.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |     


   Scenario: 25_Verify the Reference Range values for LabTest in LabForm2.
	#[Update standard unit to new value [Ex:3Unit] in both Test Tab and conversion factor tab]
	#Lab Test Tab-Standard Unit>>3 Unit
    #Converstion Factor Tab>> To Unit>>3 Unit 
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15          | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | 0.01          | Text            | Ok			    |


	#[Update standard unit to new value [Ex:2Unit] in both Test Tab and conversion factor tab]
	#Lab Test Tab-Precision factor>>2
	Scenario: 26_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 27_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_4-Update Precison to 3-.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |     


   Scenario: 28_Verify the Reference Range values for LabTest in LabForm2.
	#[Update standard unit to new value [Ex:2Unit] in both Test Tab and conversion factor tab]
	#Lab Test Tab-Precision factor>>2
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15          | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | 0.01          | Text            | Ok			    |

	#Lab Test Tab-Precision factor>>3
	Scenario: 29_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 30_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_5-Update Precison to 3-.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |
		      
Scenario: 31_Verify the Reference Range values for LabTest in LabForm2.
	#Lab Test Tab-Precision factor>>3
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.156         | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit         | Text            |                  |
		| 2         | Precision                                | 3             | Text            |                  |
		| 2         | Conversion Factor                        | 0.01          | Text            | Ok			    |

    #Update PrecisonandConversionfactor
	#Lab Test Tab-Precision factor>>2
	#Conversion Factor Tab-Conversion factor>>0.02
	Scenario: 32_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 33_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_6-Update PrecisonandConversionfactor-.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |
		      
Scenario: 34_Verify the Reference Range values for LabTest in LabForm2.
		#Lab Test Tab-Precision factor>>2
		#Conversion Factor Tab-Conversion factor>>0.02
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.31          | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | 0.02          | Text            | Ok			    |


	#Lab Test Tab-Precision factor>>Blank
	Scenario: 35_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 36_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_7-Update Precison-Blank.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |


	Scenario: 37_Verify the Reference Range values for LabTest in LabForm2.
		#Lab Test Tab-Precision factor>>Blank
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.313356      | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit         | Text            |                  |
		| 2         | Precision                                | Blank         | Text            |                  |
		| 2         | Conversion Factor                        | 0.02          | Text            | Ok			    |

		#Lab Test Tab-Precision factor>>Blank
		#Lab Test Tab-Standard Unit>>Blank
	Scenario: 38_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 39_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_7-Update Precisionandstandardunit-Blank.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |


	Scenario: 40_Verify the Reference Range values for LabTest in LabForm2.
		#Lab Test Tab-Precision factor>>Blank
		#Lab Test Tab-Standard Unit>>Blank
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 15.6678       | Text            |                  |
		| 2         | Normalized Lab Unit                      | Blank         | Text            |                  |
		| 2         | Precision                                | Blank         | Text            |                  |
		| 2         | Conversion Factor                        | 1		       | Text            | Ok			    |

		#Lab Test Tab-Precision factor>>new value
		#Lab Test Tab-Standard Unit>>Blank
	Scenario: 41_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 42_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_7-Update standardunit-Blank.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |


	Scenario: 43_Verify the Reference Range values for LabTest in LabForm2.
		#Lab Test Tab-Precision factor>2
		#Lab Test Tab-Standard Unit>>Blank
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 15.66         | Text            |                  |
		| 2         | Normalized Lab Unit                      | Blank         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | 1		       | Text            | Ok			    |



    #Update Precison,Conversionfactor, standard unit
	#Lab Test Tab-Precision factor>>2
	#Conversion Factor Tab-Conversion factor>>0.01
	#Lab Test Tab-Standard Unit>>2Unit
	Scenario: 44_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 45_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_6-Update Precison-Conversionfactorand standard unit.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |
		      
Scenario: 46_Verify the Reference Range values for LabTest in LabForm2.
		#Lab Test Tab-Precision factor>>2
		#Conversion Factor Tab-Conversion factor>>0.01
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15          | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | 0.01          | Text            | Ok			    |

	Scenario: 47_Add patient 02-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 02       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 02-PAT    |

Scenario: 48_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "02-PAT" from patients table.
      When I enroll the patient "02-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 02      | 06/14/2019  | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 49_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "02-PAT" from patients table.
      Then I see Patient details page for "02-PAT".

 #Unmap Lab mappings for Precision, Standard Unit questions
	
	Scenario: 50_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

	Scenario: 51_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_6-Update PrecisonandConversionfactor-.Zip" with Label "Major"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.  |
		      
Scenario: 52_Verify the Reference Range values for LabTest in LabForm2.
		#Lab Test Tab-Precision factor>>2
		#Conversion Factor Tab-Converrsion factor>>0.01
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15          | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | 0.01          | Text            | Ok			    |

Scenario: 53_Verify the Reference Range values for LabTest in LabForm2.
	   When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	    And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Link            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text           |                  |
		| 2         | CRF Lab Unit                             | 03            | Link            |                  |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15          | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | 0.01          | Text            | Ok			    |

Scenario: 54_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "02-PAT" from patients table.
      Then I see Patient details page for "02-PAT".

Scenario: 55_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 56_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.66       | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |


Scenario: 57_Verify the Reference Range values for LabTest in LabForm2.
 	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | Blank         | Text            |                  |
		| 2         | Normalized Lab Unit                      | Blank         | Text            |                  |
		| 2         | Precision                                | Blank         | Text            |                  |
		| 2         | Conversion Factor                        | 0.01          | Text            | Ok			    |


##Scenario: Repeat above scenarios when Normalized LabValue, Lab Unit and Precision are not CRF questions and are mapped