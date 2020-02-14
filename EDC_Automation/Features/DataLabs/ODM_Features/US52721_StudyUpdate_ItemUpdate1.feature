Feature: DataLabs_V5.7.0_ODM Eventing for Item Update on Study Update
	Test Summary:
	1. Verification of ODM eventing xml for Study Update on item Update on derivation on major study update
	2. Verification of ODM eventing xml for Study Update on Codelist Item delete on Major study update
	3. Verifiaction of ODM eventing xml for Study Update on Codelist Item value update on Major Study Update
	4. Verification of ODM not evented out when Conditional questions are changed on the Study design
	5. Verification of ODM not evented out when questions are deleted on the Study update
	6. Verification of ODM not evented as study update when derivation is updated on minor study update

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test3210_Base_ODMStudy_1.Zip" with study label "TestBase"
	Then I see study label "Test3210_Query Smoke Test" in header

Scenario: T04_Add Site 01-Site and assign it to testadmin user
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: T05_Navigate to the Edit Preferences page and set the CRF Default save to Complete and update the Endpoint URL
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Complete" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then The CRF with data is saved and checked-in successfully.
	

Scenario: T06_Add patient 001-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 001      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 001-Patient |

Scenario: T07_Select and enroll patient 001-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "001-Patient" from patients table.
	When I enroll the patient "001-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 001       | 09/04/2018 | Yes           |
	Then I see patient "001-Patient" status as "Enrolled" on Patient details page.

Scenario: T08_Select Visit (Week 2) - Form1 and Submit the form
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt           | AnswerValue | AnswerFieldType |
         | Sample text question:    | Text        | Textbox         |
         | Sample select question:  | Yes         | Listbox         |
         | Sample radio question:   | Yes         | RadioButton     |
         | Sample integer question: | 10          | Textbox         |
         | Sample float question:   | 11.11       | Textbox         |
         | Sample date question:    | 09/04/1992  | Textbox         |
	And I select "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T09_Select Visit (Week 3) - Demographics and Submit the form
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I select "Checkout" button on "Demographics" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt | AnswerValue       | AnswerFieldType |
         | Date of Birth: | 09/08/1990        | Textbox         |
         | Gender:        | Male              | Listbox         |
         | Race:          | Hispanic American | Listbox         |
	And I select "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	
Scenario: T10_Select Visit (Week 3) - Vital Signs and Submit the form
	Given I expand "Visit (Week 3)" to select and open "Vital Signs" CRF.
	When I select "Checkout" button on "Vital Signs" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt      | AnswerValue | AnswerFieldType |
         | Was exam performed? | Yes         | Listbox         |
         | Date of Exam:       | 09/04/2018  | Textbox         |
         | Weight:             | 190         | Textbox         |
         | Weight Units:       | LB          | Listbox         |
         | Height:             | 72          | Textbox         |
         | Height Units:       | in          | Listbox         |
	And I select "Save & Close" button on "Vital Signs" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	#Add Unscheduled Event with Case Form
Scenario: T11_Add unscheduled event with a Case form
	When I click ActionPalette Item "Add Unscheduled Event" in "PatientPortalActions" ActionPalette
	And I select "Visit (Week 2)" from events list on AddUnscheduledEventStep1Page
	And I click on Next button on AddUnscheduledEventStep1Page
	And I select below forms on on AddUnscheduledEventStep2Page
		| FormName  |
		| Case_Form |		
	And I click on Next button on AddUnscheduledEventStep2Page
	And I click on Finish button on AddUnscheduledEventStep3Page
	Then I see event "Visit (Week 2).1" in PatientPortalPage

Scenario: T12_Select Visit (Week 2)1 - Case_Form and Submit the form
	Given I expand "Visit (Week 2).1" to select and open "Case_Form" CRF.
	When I select "Checkout" button on "Case_Form" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt                                                                      | AnswerValue | AnswerFieldType |
         | True or False:                                                                      | True        | Listbox         |
         | Text Value (Active if Question 1 is True):                                          | Zithromax   | TextArea         |
         | Float Value (Active if Question 2 is "CIPRO", "LEVAQUIN", "BIAXIN" or "ZITHROMAX"): | 4.4         | Textbox         |    
	And I enter below "Table_1:" table questions data in the CRF.
		| AddNewRow | RowNumber | QuestionPrompt                                                                     | AnswerValue | AnswerFieldType | RowButtonToClick |
		| Yes       | 1         | True or False:                                                                     | True        | ListBox         |                  |
		| No        | 1         | Text Value (Active if Question 1 is True):                                         | Zithromax   | Textbox         |                  |
		| No        | 1         | Float Value (Active if Question 2 is "CIPRO", "LEVAQUIN", "BIAXIN" or "ZITHROMAX): | 3.3         | Textbox         |                  |
		| No        | 1         | Second Float Value:                                                                | 88.87       | Textbox         |                  |
		| No        | 1         | Second Text Value (Active if Question 6.x.6 is not 88.88):                         | Text        | Textbox         | Save & Close Row |
	And I select "Save & Close" button on "Case_Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T13_Select Visit (Week 40) - Form1 and Submit the form
	Given I expand "Visit (Week 40)" to select and open "Form1" CRF.
	When I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt           | AnswerValue | AnswerFieldType |
         | Sample text question:    | Text        | Textbox         |
         | Sample select question:  | Yes         | Listbox         |
         | Sample radio question:   | Yes         | RadioButton     |
         | Sample integer question: | 15          | Textbox         |
         | Sample float question:   | 16.66       | Textbox         |
         | Sample date question:    | 09/04/1992  | Textbox         |
	And I select "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T14_Select Visit (Week 40) - DerivedStarForm and Submit the form
	Given I expand "Visit (Week 40)" to select and open "DerivedStarForm" CRF. 
	When I select "Checkout" button on "DerivedStarForm" CRF.
	And I click table row button "Add New Row" of table "Using * in Parameter field:" 
	And I click table row button "Save & Close Row" of table "Using * in Parameter field:" 
	And I select "Save & Close" button on "DerivedStarForm" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T15_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base_ODMStudy_Update1.zip" with Label "Update1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Update1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Study file (Update1) - complete.                                                                                                     |

Scenario: T16_Verify updating/submitting Study Update Item data is not evented out for conditional questions.
	When I execute the query "select * from OdmSubscriberDetail where StudyEventKey = 16".
	Then I have "0" records resulted on querying the DB.

Scenario: T17_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base_ODMStudy_Update2" with Label "Update2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Update2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Study file (Update2) - complete.                                                                                                    |
	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.9
Scenario: T18_Verify the XML Data evented out for the Item Data is entered via Study Update
	Given I save the Event XML data in "UpdateItemData1UsingStudyUpdateMajorActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16"
	And I have the XML file "UpdateItemData1UsingStudyUpdateMajorExpected.xml" available in the project folder.
	And I have the XML file "UpdateItemData1UsingStudyUpdateMajorActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |


Scenario: T19_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base_ODMStudy_Update3" with Label "Update3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select scripting "Derivations" in PublishStudyPage of MinorStudyUpdate
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                        |
	| Derivations: #1 - complete. View summary.      |
	
	
	
Scenario: T20_Verify updating/submitting Study Update Item data is not evented out for conditional questions.
	When I execute the query "select * from ODMsubscriberdetail where xmlmessage like '%200702153.1%' and StudyEventKey=16".
	Then I have "0" records resulted on querying the DB.

