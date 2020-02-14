Feature: PopulateLabInfoInDBbasedOnLabIDSelection_StudyUpdate
	
	Test Summary:

		1. Verify Lab Name, Company, Lab Address and Country are populated in database based on the Lab ID selection when they are mapped on Lab Mappings but not added as questions.

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
	And I click Link "Manage Laboratories" In Lab Management Page
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
     Then I see below patients added in the Patients table.
     | PatientID |
     | 01-PAT    |
	 
#Provide Lab ID on eCRF
Scenario: 10_Expand the Visit (Week 2) event and open LabForm3 and enter the LAB ID.
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
      And I click "Checkout" button on "LabForm3" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | AnswerValue | AnswerFieldType |
      | Lab ID2         | Lab01 (L01) | ListBox         |
	  And I click on "Save & Close" button on "LabForm3" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Verify Lab Information in DB based on Lab ID selection.
@ObjectiveEvidence @ReqID:US58122.8
Scenario: 11_Verify the lab information in database.
	Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where IsTableRow = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved.
	  | Data Value                           |
	  | L01                                  |
	  |                                      |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |

################################### Major Study Update 1 #########################################################
#Deleted Lab Instance to de-select LabMapping for LabID

Scenario: 12_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 13_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_H.zip" with Label "Major1"
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
         | Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major1) - complete.  |         

#Verify No New records are added in DB after deleting Lab Instance
@ObjectiveEvidence @ReqID:US58122.8
Scenario: 14_Verify the lab information in database.
	Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where IsTableRow = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved.
	  | Data Value                           |
	  | L01                                  |
	  |                                      |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |

################################### Major Study Update 2 #########################################################
#Added Lab Instance again and LabMappings provided for Lab fields

Scenario: 15_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 16_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_I.zip" with Label "Major2"
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
         | Migration of Site 01 for Study file (Major2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major2) - complete.  |         

#Verify New records are added in DB after adding Lab Instance back.
@ObjectiveEvidence @ReqID:US58122.8
Scenario: 17_Verify the lab information in database.
	Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where IsTableRow = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved.
	  | Data Value                           |
	  | L01                                  |
	  |                                      |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |


################################### Major Study Update 3 #########################################################
#Updated Domain Item for LabID question and mapped to different question within same form.

Scenario: 18_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 19_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_Q.zip" with Label "Major3"
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
         | Migration of Site 01 for Study file (Major3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major3) - complete.  |         

#Verify No New records are added in DB after adding updating Domain Item for LabID question and mapped to different question within same form
@ObjectiveEvidence @ReqID:US58122.2,8
Scenario: 20_Verify the lab information in database.
	Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where IsTableRow = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved.
	  | Data Value                           |
	  | L01                                  |
	  |                                      |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |


################################### Major Study Update 4 #########################################################
#Updated same Domain Item back to LabID question.

Scenario: 21_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 22_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_R.zip" with Label "Major4"
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
         | Migration of Site 01 for Study file (Major4) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major4) - complete.  |         

#Verify No New records are added in DB after adding updating same Domain Item back to LabID question 
@ObjectiveEvidence @ReqID:US58122.2,8
Scenario: 23_Verify the lab information in database.
	Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where IsTableRow = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved.
	  | Data Value                           |
	  | L01                                  |
	  |                                      |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |

################################### Major Study Update 5 #########################################################
#Updated LabID Mapping in LabInstance.

Scenario: 24_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 25_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_E.zip" with Label "Major5"
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
         | Migration of Site 01 for Study file (Major5) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major5) - complete.  |         

#Verify latest Lab information data is cleared in DB after updating LabID mapping in LabInstance
@ObjectiveEvidence @ReqID:US58122.2,8
Scenario: 26_Verify the lab information in database.
	Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where IsTableRow = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved.
	  | Data Value                           |
	  | L01                                  |
	  |                                      |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |
	  |                                      |
	  |                                      |
	  |                                      |
	  |                                      |
	
Scenario: 27_Select LabID for newly mapped domain item question
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I expand "Visit (Week 2)" to select and open "LabForm3" CRF.
      And I click "Checkout" button on "LabForm3" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | AnswerValue | AnswerFieldType |
      | Lab ID3        | Lab01 (L01) | ListBox         |
	  And I click on "Save & Close" button on "LabForm3" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 28_Verify the lab information in database.
		Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where IsTableRow = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved.
	  | Data Value                           |
	  | L01                                  |
	  |                                      |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |
	  | L01                                  |

################################### Major Study Update 6 #########################################################
#Updated Lab Information Fields Mapping in LabInstance. (Mappings Modified for few fields and deleted for one field)

Scenario: 29_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 30_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Labs_Original_F.zip" with Label "Major6"
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
         | Migration of Site 01 for Study file (Major6) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major6) - complete.  |         

#Verify lab data is updated in DB after updating Lab Information Fields Mapping in LabInstance
@ObjectiveEvidence @ReqID:US58122.2,8
Scenario: 31_Verify the lab information in database.
	Given I have connected to Database.
	  When I execute the query "select DataValue from PatientData where IsTableRow = '0' and PatientFormKey in (Select PatientFormKey from PatientForm where FormLabel='LabForm3')".
	  Then The below result should be retrieved.
	  | Data Value                           |
	  | L01                                  |
	  |                                      |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | Perceptive                           |
	  | INDIA                                |
	  | Lab01                                |
	  | Perceptive                           |
	  | Lab01                                |
	  | Building No 20 Mindspace Hitech city |
	  | L01                                  |
