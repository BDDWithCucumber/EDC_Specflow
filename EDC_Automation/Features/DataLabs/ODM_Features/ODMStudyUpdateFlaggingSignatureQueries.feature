Feature: DataLabs_V5.7.0_ODMEventingforStudyUpdatewithFlagandQueries
	
	Test Summary:
	1. Verification of ODM eventing xml for Study Update on Flag changes on Item
	2. Verification of ODM eventing xml for Study Update on Flag changes on Form
	3. Verification of ODM eventing xml for Study Update on Flag changes on Required and Non Required flag Items
	4. Verification of ODM eventing xml for Study Update on DCF created


Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test3210_Flag_Base_01.Zip" with study label "TestBase"
	Then I see study label "Test3210_Query Smoke Test" in header

Scenario: T04_Create a SD Verify Plan with following DataGroups
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Flag Management" In StudyAdministrationPage
	And I select "SD-Verify" flag type from Flag Management page.
	And I click Add Plan button to create a new plan.
	And I enter Plan Name as "SDVPlan1" and label as "SDVPlanL1" on Create Plan page.
	And I click "Next" button on Create Plan page.
	And I enter Data Group Name as "SDVDG1" and Data Group label as "SDVDGL1" on Create Flag Data Group page.
	And I select checkbox for form questions in protocol version.
	| FormName    | QuestionNum | QuestionPrompt                | ProtocolVersion |
	| Form1       | 1.          | Sample text question:         | 1.0             |
	| Form 6      | 1.R.6.      | Integer:                      | 1.0             |
	| Vital Signs | 1.          | Was exam performed?           | 1.0             |
	| Vital Signs | 3.          | Time of Exam (24 hour clock): | 1.0             |
	| Vital Signs | 6.          | Weight Units:                 | 1.0             |
	| Vital Signs | 13.         | Temperature Method:           | 1.0             |
	And I click "Next" button on Create Flag Data Group page.
	And I click on Save & Close button.
	Then I verify the success message displayed as "Plan saved successfully"
	
Scenario: T05_Assign Plan to Study
	When I select the "Assign Plan to Study" link on the Manage Plans & Flag Data Groups page.
	And I select "SDVPlanL1 (3%)" in the Select Plan dropdown.
	When I select "Entry correction" in Reason for change dropdown.
	When I enter text "New SDV FLag" in Additional Notes text box.
	When I click "Save" button on Assign Plan to Study page.
	Then I verify the success message displayed as "Plan assigned successfully."

Scenario: T06_Add Site 01-Site and assign it to testadmin user
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: T07_Navigate to the Edit Preferences page and set the CRF Default save to Complete and update the Endpoint URL
	When I click breadcrumb "Study Administration"
	When I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Partial" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful"

Scenario: T08_Add patient 001-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 001      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 001-Patient |

Scenario: T09_Select and enroll patient 001-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "001-Patient" from patients table.
	When I enroll the patient "001-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 001       | 09/04/2018 | Yes           |
	Then I see patient "001-Patient" status as "Enrolled" on Patient details page.

Scenario: T10_Add patient 002-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 002      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 002-Patient |

Scenario: T11_Select and enroll patient 002-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "002-Patient" from patients table.
	When I enroll the patient "002-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 002       | 09/04/2018 | Yes           |
	Then I see patient "002-Patient" status as "Enrolled" on Patient details page.

Scenario: T12_Add patient 003-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 003      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 003-Patient |

Scenario: T13_Select and enroll patient 003-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "003-Patient" from patients table.
	When I enroll the patient "003-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 003       | 09/04/2018 | Yes           |
	Then I see patient "003-Patient" status as "Enrolled" on Patient details page.

Scenario: T14_Add patient 004-Patient from Datalabs UI.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 004      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 004-Patient |

Scenario: T15_Select and enroll patient 004-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "004-Patient" from patients table.
	When I enroll the patient "004-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 004      | 09/04/2018 | Yes           |
	Then I see patient "004-Patient" status as "Enrolled" on Patient details page.
# Updates on 001-Patient
Scenario: T16_Select Visit(Screening) - Form1 under patient 001-Patient, Enter Data and Submit
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "001-Patient" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
    | QuestionPrompt        | AnswerValue | AnswerFieldType |
    | Sample text question: | Text        | Textbox         |
	And I select "Save" button on "Form1" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"

Scenario: T17_Select Flag On for the Form for Question Sample text question
	When I set flag for below flat questions data in the CRFs.
	| QuestionPrompt        | SD-Verify | M-Review | D-Review |
	| Sample text question: | On        |          |          |
	Then I see flag "SD-Verify" icon "flag_required_set.gif" against question "Sample text question:" 

Scenario: T18_Select Visit (Week 2) - Form6 and enter value for Question and submit
	Given I click breadcrumb "001-Patient".
	And I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	When I select "Checkout" button on "Form 6" CRF.
	And I enter below "Table with All Data Types:" table questions data in the CRF.
		| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
		| Yes       | 1         | Integer:       | 3         | Textbox         | Save & Close Row   |
	And I select "Save" button on "Form 6" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"
		
Scenario: T19_Select SD-Verify Flag On for the Question Integer for the Form 6
	When I set flag for below "Table with All Data Types:" table questions data in the CRFs.
         | RowNumber | QuestionPrompt | SD-Verify | M-Review | D-Review | RowButtonToClick |
         | 1         | Integer:       | On        |          |          |                  |
	Then I see flag "SD-Verify" icon "flag_required_set.gif" of a question "Integer:" of table "Table with All Data Types:"

Scenario: T20_Select Visit (Week 3) - Vital Signs form, enter data and submit
	Given I click breadcrumb "001-Patient".
	And I expand "Visit (Week 3)" to select and open "Vital Signs" CRF.
	When I select "Checkout" button on "Vital Signs" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt                | AnswerValue | AnswerFieldType |
         | Was exam performed?           | Yes         | LISTBOX         |
         | Time of Exam (24 hour clock): | 08          | LISTBOX         |
         | Weight Units:                 | KG          | LISTBOX         |
         | Temperature Method:&#x20      | Auxillary   | LISTBOX         |
	And I select "Save" button on "Vital Signs" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"

Scenario: T21_Select flagging for the below questions
	When I click link "Mark Required" for the flag type "SD-Verify" in FlagPalette of CRF
	Then I see success message "M-Review On"
	And I see flag "SD-Verify" icon "flag_required_set.gif" against question "Was exam performed?"
	And I see flag "SD-Verify" icon "flag_required_set.gif" against question "Time of Exam (24 hour clock):"
	And I see flag "SD-Verify" icon "flag_required_set.gif" against question "Weight Units:"
	And I see flag "SD-Verify" icon "flag_required_set.gif" against question "Temperature Method:"

# Updates on 002-Patient
Scenario: T22_Select patient 002-Patient, Select Form 6 under visit (Week 2) submit the question Integer
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "002-Patient" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	When I select "Checkout" button on "Form 6" CRF.
	And I enter below "Table with All Data Types:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Integer:       | 4           | Textbox         | Save & Close Row   |
	And I select "Save" button on "Form 6" CRF.
	When I set flag for below "Table with All Data Types:" table questions data in the CRFs.
         | RowNumber | QuestionPrompt | SD-Verify | M-Review | D-Review | RowButtonToClick |
         | 1         | Integer:       | On        |          |          |                  |
	Then I see flag "SD-Verify" icon "flag_required_set.gif" of a question "Integer:" of table "Table with All Data Types:"

Scenario: T23_Select Checkout and update the value for Integer Question
	When I select "Checkout" button on "Form 6" CRF.
	And I enter below "Table with All Data Types:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | ReasonForChange | AnswerFieldType | NewAnswerValue | RowButtonToClick |
	| No        | 1         | Integer:       | 4                  | DCF             | Textbox         | 5              | Save & Close Row |
	And I select "Save" button on "Form 6" CRF. 
	And I expand row "1" of table "Table with All Data Types:"
	Then I see flag "SD-Verify" icon "flag_required_changed.gif" of a question "Integer:" of table "Table with All Data Types:"

# Updates on 003-Patient
Scenario: T24_Select Visit(Screening) - Form1 under patient 003-Patient, Enter Data and Submit
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "003-Patient" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
    | QuestionPrompt          | AnswerValue | AnswerFieldType |
    | Sample select question: | Yes         | LISTBOX        |
	And I select "Save" button on "Form1" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"

Scenario: T25_Select Flag On for the Form for Question Sample select question
	When I set flag for below flat questions data in the CRFs.
	| QuestionPrompt          | SD-Verify | M-Review | D-Review |
	| Sample select question: |           | On       |          |
	Then I see flag "SD-Verify" icon "flag_set.gif" against question "Sample select question:" 

Scenario: T26_Select Visit (Week 2) - Form6 and enter value for Question and submit
	Given I click breadcrumb "003-Patient".
	And I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	When I select "Checkout" button on "Form 6" CRF.
	And I enter below "Table with All Data Types:" table questions data in the CRF.
		| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
		| Yes       | 1         | Float:         | 11.11       | Textbox         | Save & Close Row |
	And I select "Save" button on "Form 6" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"
		
Scenario: T27_Select SD-Verify Flag On for the Question Integer for the Form 6
	When I set flag for below "Table with All Data Types:" table questions data in the CRFs.
         | RowNumber | QuestionPrompt | SD-Verify | M-Review | D-Review | RowButtonToClick |
         | 1         | Float:         |           | On       |          |                  |
	Then I see flag "SD-Verify" icon "flag_set.gif" of a question "Float:" of table "Table with All Data Types:"

Scenario: T28_Select Visit (Week 3) - Vital Signs form, enter data and submit
	Given I click breadcrumb "003-Patient".
	And I expand "Visit (Week 3)" to select and open "Vital Signs" CRF.
	When I select "Checkout" button on "Vital Signs" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt          | AnswerValue | AnswerFieldType |
         | Was exam performed?     | Yes         | LISTBOX         |
         | Time of Exam (minutes): | 01          | LISTBOX         |
         | Height Units:           | in          | LISTBOX         |
	And I select "Save" button on "Vital Signs" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"

Scenario: T29_Select flagging for the below questions
	When I set flag for below flat questions data in the CRFs.
         | QuestionPrompt          | SD-Verify | M-Review | D-Review |
         | Time of Exam (minutes): |           | On       |          |
         | Height Units:           |           | On       |          |
	Then I see flag "M-Review" icon "flag_set.gif" against question ""
	And I see flag "M-Review" icon "flag_set.gif" against question ""

	#Updates on 004-Patient
Scenario: T30_Select patient 004-Patient, Select Form 6 under visit (Week 2) submit the question Integer
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "004-Patient" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form 6" CRF.
	When I select "Checkout" button on "Form 6" CRF.
	And I enter below "Table with All Data Types:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Float:         | 12.21       | Textbox         | Save & Close Row   |
	And I select "Save" button on "Form 6" CRF.
	When I set flag for below "Table with All Data Types:" table questions data in the CRFs.
         | RowNumber | QuestionPrompt | SD-Verify | M-Review | D-Review | RowButtonToClick |
         | 1         | Float:         |           | On       |          |                  |
	Then I see flag "SD-Verify" icon "flag_set.gif" of a question "Integer:" of table "Table with All Data Types:"

Scenario: T31_Select Checkout and update the value for Integer Question
	When I select "Checkout" button on "Form 6" CRF.
	And I enter below "Table with All Data Types:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | ReasonForChange | AnswerFieldType | NewAnswerValue | RowButtonToClick |
	| No        | 1         | Float:         | 12.21              | DCF             | Textbox         | 13.33         | Save & Close Row |
	And I select "Save" button on "Form 6" CRF.
	And I expand row "1" of table "Table with All Data Types:"
	Then I see flag "M-Review" icon "flag_changed.gif" of a question "Float:" of table "Table with All Data Types:"

Scenario: T32_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Flag_Update_02.zip" with Label "UpdateFlag"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                          |
	| Study file (UpdateFlag) - complete. |

Scenario: T33_Migrate Patient 001-Patient from Site Management
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID   |
	| 001-Patient |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                                 |
	| Migration of Site 01 for Study file (UpdateFlag) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.8
Scenario: T34_Verify the XML Data evented out via Study Update for Patient 001-Patient
	Given I save the Event XML data in "StudyUpdateFlagUpdatePatient001Actual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateFlagUpdatePatient001Expected.xml" available in the project folder.
	And I have the XML file "StudyUpdateFlagUpdatePatient001Actual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | QueryOID            |
	|         | SourceSystemVersion |

Scenario: T35_Migrate Patient 002-Patient from Site Management
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID    |
	| 002-Patient |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                                 |
	| Migration of Site 01 for Study file (UpdateFlag) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.9
Scenario: T36_Verify the XML Data evented out via Study Update for Patient 002-Patient
	Given I save the Event XML data in "StudyUpdateFlagUpdatePatient002Actual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateFlagUpdatePatient002Expected.xml" available in the project folder.
	And I have the XML file "StudyUpdateFlagUpdatePatient002Actual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |


Scenario: T37_Migrate Patient 003-Patient from Site Management
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID   |
	| 003-Patient |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                                 |
	| Migration of Site 01 for Study file (UpdateFlag) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.8
Scenario: T38_Verify the XML Data evented out via Study Update for Patient 003-Patient
	Given I save the Event XML data in "StudyUpdateFlagUpdatePatient003Actual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateFlagUpdatePatient003Expected.xml" available in the project folder.
	And I have the XML file "StudyUpdateFlagUpdatePatient003Actual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |


Scenario: T39_Migrate Patient 004-Patient from Site Management
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID   |
	| 004-Patient |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                                 |
	| Migration of Site 01 for Study file (UpdateFlag) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |	

	@ObjectiveEvidence @ReqID:3.1.6.1,3.1.6.2,3.1.6.9
Scenario: T40_Verify the XML Data evented out via Study Update for Patient 004-Patient
	Given I save the Event XML data in "StudyUpdateFlagUpdatePatient004Actual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateFlagUpdatePatient004Expected.xml" available in the project folder.
	And I have the XML file "StudyUpdateFlagUpdatePatient004Actual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |
