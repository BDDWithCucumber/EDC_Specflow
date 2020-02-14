Feature: DataLabs_V5.7.0_ODMEventingforFormSignatureItemonStudyUpdate

	Test Summary:
	1. Verification of ODM eventing xml for Study Update on item Update on derivation on major study update
	2. Verification of ODM eventing xml for Study Update on Form Signature Change Update on major study update
	3. Verification of ODM eventing xml for Study Update on Form Status change from partially submitted to submitted during study update
	4. Verification of ODM eventing xml for Study Update on Form Status change from submitted to partially submitted during study update
	5. Verification of ODM eventing xml for Study Update on Form State change from Frozen to thaw during study update
	6. Verification of ODM eventing xml for Study Update on DCF's Closed during Study Update
	7. Verification of ODM not evented for Study Update on question moved from Flat to table and viceversa
	

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test3210_Base2_ODMStudy.Zip" with study label "TestBase"
	And I navigate to "Patients" tab from main menu.
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                         |
         | Publishing of Study file (TestBase) - complete. |

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
	When I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Complete" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful"
	

Scenario: T06_Add patient 001-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 001      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 001-Patient |

Scenario: T07_Select and enroll patient 001-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "001-Patient" from patients table.
	When I enroll the patient "001-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 001       | 09/04/2018 | Yes           |
	Then I see patient "001-Patient" status as "Enrolled" on Patient details page.

Scenario: T08_Add patient 002-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 002      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 002-Patient |

Scenario: T09_Select and enroll patient 002-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "002-Patient" from patients table.
	When I enroll the patient "002-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 002       | 09/04/2018 | Yes           |
	Then I see patient "002-Patient" status as "Enrolled" on Patient details page.

Scenario: T10_Add patient 003-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 003      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 003-Patient |

Scenario: T11_Select and enroll patient 003-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "003-Patient" from patients table.
	When I enroll the patient "003-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 003       | 09/04/2018 | Yes           |
	Then I see patient "003-Patient" status as "Enrolled" on Patient details page.

Scenario: T12_Add patient 004-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 004      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 004-Patient |

Scenario: T13_Select and enroll patient 004-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "004-Patient" from patients table.
	When I enroll the patient "004-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 004      | 09/04/2018 | Yes           |
	Then I see patient "004-Patient" status as "Enrolled" on Patient details page.


Scenario: T14_Select Visit (Week 2) - Form 4 and Submit the form in Patient 001-Patient
	When I click breadcrumb "All Patients"
	And I select "001-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "Form 4" CRF.
	And I select "Checkout" button on "Form 4" CRF.
	And I enter below "Integer Table:" table questions data in the CRF.
		| AddNewRow | RowNumber | QuestionPrompt                                                                                                                                                                                                            | AnswerValue | AnswerFieldType | RowButtonToClick |
		| Yes       | 1         | Integer question (Edit Check: DataType {Draft})                                                                                                                                                                           | 50          | Textbox         |                  |
		| No        | 1         | Integer question (Edit Check: Required {Sent})                                                                                                                                                                            | 51          | Textbox         |                  |
		| No        | 1         | Integer question (Range Check: Normal Study 10 thru 1000 {Draft})                                                                                                                                                         | 52          | Textbox         |                  |
		| No        | 1         | Integer question (Range Check: Study Normal 50 thru 5000 {Sent})                                                                                                                                                          | 53          | Textbox         |                  |
		| No        | 1         | Integer question: (MinL: 2) (Edit Check: MinLength {Draft})                                                                                                                                                               | 54          | Textbox         |                  |
		| No        | 1         | Integer question: (MaxL: 5)(Edit Check: MaxLength {Sent})                                                                                                                                                                 | 55          | Textbox         |                  |
		| No        | 1         | Integer question: (Edit Check: NotAnswered {Draft})                                                                                                                                                                       | 56          | Textbox         |                  |
		| No        | 1         | Integer question: (MinL: 2, MaxL: 5)(Edit Checks: DataType {Draft}, Required {Sent}, Normal Range 10 thru 1000 {Draft}, Study Normal Range 50 thru 5000 {Sent}, MinLength {Draft}, MaxLength {Sent}, NotAnswered {Draft}) | 57          | Textbox         | Save & Close Row |
	And I select "Save & Close" button on "Form 4" CRF.
	Then The CRF with data is saved and checked-in successfully.

#Submit the form1 in visit 02
Scenario: T15_Select Visit (Week 2) - Form1 and Submit the form in Patient 002-Patient
	When I click breadcrumb "All Patients"
	And I select "002-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt           | AnswerValue | AnswerFieldType |
         | Sample text question:    | Text        | Textbox         |
         | Sample select question:  | Yes         | Listbox         |
         | Sample radio question:   | Yes         | RadioButton     |
         | Sample integer question: | 10          | Textbox         |
         | Sample float question:   | 11.11       | Textbox         |
         | Sample date question:    | 09/04/1992  | Textbox         |
	And I enter below "Sample Table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         | Yes       | 1         | Drug Name:     | DrugText    | Textbox         |                  |
         | No        | 1         | Stop Date:     | DateText    | Textbox         | Save & Close Row |
	And I select "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T16_Select Visit (Week 2) - Form 6 and submit the form
	When I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	And I select "Checkout" button on "Form 6" CRF.
	And I enter below "Table with All Data Types:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue  | AnswerFieldType | RowButtonToClick |
         | Yes       | 1         | Text:          | Text_Updated | Textbox         | Save & Close Row |
	And I select "Save & Close" button on "Form 6" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T17_Select Visit (Week 40) - Form1 and Submit the form in Patient 003-Patient
	When I click breadcrumb "All Patients"
	And I select "003-Patient" patient.
	And I expand "Visit (Week 40)" to select and open "Form1" CRF.
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
	
Scenario: T18_Select Visit (Week 40) - DerivedStarForm and Submit the form 003-Patient
	Given I expand "Visit (Week 40)" to select and open "DerivedStarForm" CRF. 
	When I select "Checkout" button on "DerivedStarForm" CRF.
	And I click table row button "Add New Row" of table "Using * in Parameter field:" 
	And I click table row button "Save & Close Row" of table "Using * in Parameter field:" 
	And I select "Save & Close" button on "DerivedStarForm" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T19_Select Visit (Week 6) - PM Check (Patient) form and Submit
	Given I expand "Visit (Week 6)" to select and open "PM Check (Patient)" CRF. 
	When I select "Checkout" button on "PM Check (Patient)" CRF.
	And I select "Save & Close" button on "PM Check (Patient)" CRF.
	Then The CRF with data is saved and checked-in successfully.
 

Scenario: T20_Select Visit (Week 2) - Form 4 and Submit the form in Patient 004-Patient
	When I click breadcrumb "All Patients"
	And I select "004-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "Form 4" CRF.
	And I select "Checkout" button on "Form 4" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt | AnswerValue | AnswerFieldType |
         | Q5_text        | 2005        | Textbox         |
	And I select "Save" button on "Form 4" CRF.
	Then The CRF with data is saved and checked-in successfully.
#Freeze CRF
Scenario: T21_Select the Action Freeze CRF from Action Palette
	When I click ActionPalette Item "Freeze CRF" in "CRFAction" ActionPalette
	Then I verify the success message displayed as "CRF Frozen"

Scenario: T22_Select AutoBuild Form01 in Visit (Week 51) and submit
	Given I click breadcrumb "All Patients"
	When I select "004-Patient" patient.
	And I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	And I select "Checkout" button on "AutoBuild Form01" CRF.
	And I select "Save & Close" button on "AutoBuild Form01" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

Scenario: T23_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update1.zip" with Label "Update1"
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
	| Subject                                                                                                                              |
	| Migration of Site 01 for Study file (Update1) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update1) - complete.                                                                                                     |

# Verify Form Status from Submitted to Saved Incomplete and Form State from Frozen to Thaw during patient migration
	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.5,3.1.6.6
Scenario: T24_Verify updating/submitting Study Update event out for Form Status change from Fully submitted to Partial Submitted during Patient Migration.
	Given I save the Event XML data in "StudyUpdateFormStatusFullToPartialActual.xml" file by executing the query "Select xmlmessage from OdmSubscriberDetail where StudyEventKey=16 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='004-Patient') + '%'"
	And I have the XML file "StudyUpdateFormStatusFullToPartialExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateFormStatusFullToPartialActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

# Verify L4 DCFs closed due to Patient Migration
	@ObjectiveEvidence @ReqID:3.1.6.10
Scenario: T25_Verify updating/submitting Study Update event out for DCF Status change during Patient Migration.
	Given I save the Event XML data in "StudyUpdateDCFsClosedOnPatientMigrationActual.xml" file by executing the query "Select xmlmessage from OdmSubscriberDetail where StudyEventKey=16 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='001-Patient') + '%'"
	And I have the XML file "StudyUpdateDCFsClosedOnPatientMigrationExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateDCFsClosedOnPatientMigrationActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | QueryOID            |
	|         | SourceSystemVersion |

Scenario: T26_Verify Study Update event out for DCFs closed during patient Migration
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "004-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "Form 4" CRF.
	And I select "Checkout" button on "Form 4" CRF.
	And I clear question "Q5_text".
	And I enter notes "Clear Q5_text" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I enter below flat questions data in the CRF.
         | QuestionPrompt                                  | AnswerValue | AnswerFieldType |
         | Integer question (Edit Check: DataType {Draft}) | 52          | Textbox         |
	And I deselect entry complete checkbox
	And I select "Save" button on "Form 4" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"


Scenario: T27_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update2.zip" with Label "Update2"
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
	| Migration of Site 01 for Study file (Update2) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update2) - complete.                                                                                                     |

Scenario: T28_Verify updating/submitting Study Update Item data is not evented out for Display option change during Patient Migration.
	When I execute the query "select XmlMessage from OdmSubscriberDetail where StudyEventKey = 16".
	Then I have "2" records resulted on querying the DB.

Scenario: T29_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update3.zip" with Label "Update3"
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
	| Migration of Site 01 for Study file (Update3) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update3) - complete.                                                                                                    |

Scenario: T30_Verify updating/submitting Study Update Item data is not evented out when a derived question is moved from Flat to Table.
	When I execute the query "select * from OdmSubscriberDetail where StudyEventKey = 16".
	Then I have "2" records resulted on querying the DB.

Scenario: T31_Request and Sign Casebook for the Visit (Week 2) - Form 4 under Patient 004-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select site "01-Site" from Sites dropdown.
	When I select "004-Patient" patient.
	And I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName |
	| Visit (Week 2) | Form 4   |
	And I click on Submit button in RequestSignaturePage
	And I click ActionPalette Item "Sign Casebook" in "PatientPortalActions" ActionPalette
	And I select radio button for below forms in SignCasebookPage
         | EventName      | FormName | Radiobutton |
         | Visit (Week 2) | Form 4   | Accept      |
	And I given username as "testadmin" in SignCasebookPage
	And I given password as "Datalabs1234" in SignCasebookPage
	And I click on Submit button in SignCasebbokPage
	Then I verify the success message displayed as "CRFs for Casebook Saved Successful"

Scenario: T32_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update4.zip" with Label "Update4"
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
	| Subject                                                                                                                              |
	| Migration of Site 01 for Study file (Update4) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update4) - complete.                                                                                                     |

	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.6,3.1.6.7
Scenario: T33_Verify updating/submitting Study Update is evented out for Form Status change from Saved[Incomplete] to Submitted and Signature Status from Signed to PI Signature Changed.
	Given I save the Event XML data in "StudyUpdateFormStatusPartialToFullSignatureChangedActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '004-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateFormStatusPartialToFullSignatureChangedExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateFormStatusPartialToFullSignatureChangedActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | QueryOID            |
	|         | SourceSystemVersion |

Scenario: T34_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update5.zip" with Label "Update5"
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
	| Subject                                                                                                                              |
	| Migration of Site 01 for Study file (Update5) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update5) - complete.                                                                                                     |

Scenario: T35_Verify updating/submitting Study Update Item data is not evented out when a derivation is updated
	When I execute the query "select * from OdmSubscriberDetail where StudyEventKey = 16".
	Then I have "3" records resulted on querying the DB.


Scenario: T36_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update6.zip" with Label "Update6"
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
	| Migration of Site 01 for Study file (Update6) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update6) - complete.                                                                                                    |

# Query fired on Study Update
	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.9,3.1.6.10
Scenario: T37_Verify updating/submitting Study Update is evented out when a DCF is fired during patient migration
	Given I save the Event XML data in "StudyUpdateDCFFiredOnPatientMigrationActual.xml" file by executing the query "Select xmlmessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%'+(SELECT SubjectKey From Patient WHERE PatientIdentity='003-Patient')+'%'"
	And I have the XML file "StudyUpdateDCFFiredOnPatientMigrationExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateDCFFiredOnPatientMigrationActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | QueryOID            |
	|         | SourceSystemVersion |

Scenario: T38_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update7.zip" with Label "Update7"
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
	| Migration of Site 01 for Study file (Update7) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update7) - complete.                                                                                                    |

	# Item derived on Study Update major
	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.9
Scenario: T39_Verify updating/submitting Study Update Item data is evented out when source of a Item is changed to Derivation.
	Given I save the Event XML data in "StudyUpdateItemDerivedOnPatientMigrationActual.xml" file by executing the query "Select xmlmessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%'+(SELECT SubjectKey From Patient WHERE PatientIdentity='002-Patient')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateItemDerivedOnPatientMigrationExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateItemDerivedOnPatientMigrationActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | QueryOID            |
	|         | SourceSystemVersion |

Scenario: T40_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update8.zip" with Label "Update8"
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
	| Subject                                                                                                                              |
	| Migration of Site 01 for Study file (Update8) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update8) - complete.                                                                                                     |

Scenario: T41_Verify updating/submitting Study Update Item data is not evented out when a new item is added to CRF
	When I execute the query "select * from ODMsubscriberdetail where xmlmessage like '%200702159.0%' and StudyEventKey=16".
	Then I have "0" records resulted on querying the DB.

Scenario: T42_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Base2_ODMStudy_Update9.zip" with Label "Update9"
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
	| Subject                                                                                                                              |
	| Migration of Site 01 for Study file (Update9) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |
	| Study file (Update9) - complete.                                                                                                     |
	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.10
Scenario: T43_Verify updating/submitting Study Update Item data is not evented out for conditional questions.
	Given I save the Event XML data in "StudyUpdateDCFMultipleFiredOnPatientMigrationActual.xml" file by executing the query "Select top 1 xmlmessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%'+(SELECT SubjectKey From Patient WHERE PatientIdentity='002-Patient')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateDCFMultipleFiredOnPatientMigrationExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateDCFMultipleFiredOnPatientMigrationActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below fields.
	| TagName       | FieldName           |
	| DateTimeStamp | CreationDateTime    |
	| SourceID      | SubjectKey          |
	|               | FileOID             |
	|               | QueryOID            |
	|               | OID                 |
	|               | SourceSystemVersion |
