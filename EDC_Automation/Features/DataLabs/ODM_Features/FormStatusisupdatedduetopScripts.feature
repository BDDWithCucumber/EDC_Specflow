Feature: DataLabs_V5.7.0_ODMEventingforFormStatusisupdatedduetopScripts

Test Summary:
	1. Verification of ODM eventing for Unpublished forms through Pscripts.
	2. Verification of ODM eventing for Unpublished forms through Pscripts study update.


Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test3210_FoStPsc_Base study V1.zip" with study label "V1"
	Then I see study label "Test3210_Query Smoke Test" in header

Scenario: T04_Add Site 01-Site
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: T05_Navigate to the Edit Preferences page and set the CRF Default save to Complete and update the Endpoint URL
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Partial" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T06_Add patient 01-PAT from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

Scenario: T07_Select and enroll patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 06/13/2018 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: T08_Enter data for Form1 (arma) in Screening to publish the Events
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Sample text question:                              | arma        | TextBox         |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T09_Enter data for Form1 (armb) in Screening to publish the Events
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes          |
	| Sample text question: | arma               | TextBox         | armb           | DCF             | PscriptUpdate            |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T10_Enter data for Form1 (armc) in Screening to publish the Events
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes          |
	| Sample text question: | armb               | TextBox         | armc           | DCF             | PscriptUpdate1           |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T11_Enter data for Form1 (AllDefault) in Screening to publish the Events
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes          |
	| Sample text question: | armc               | TextBox         | AllDefault     | DCF             | PscriptUpdate2           |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

############################## Unpublish forms with pscript data parameter #############################

Scenario: T12_Unpublish forms on update of data parameters.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue    | AnswerFieldType |
	| Sample text question: | Form2Unpublish | TextBox         |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

		@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T13_Verify the XML file which is generated for unpublish form.
	Given I save the Event XML data in "UpdateFormStatusUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 6 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '01-Pat') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateFormStatusUIExpected.xml" available in the project folder.
	And I have the XML file "UpdateFormStatusUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |

Scenario: T14_Update the Form1 in Screening event to publish the unpublish forms
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes          |
	| Sample text question: | AllDefault         | TextBox         | ABC            | DCF             | UpdatedValue             |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T15_Update the Form1 in Screening event to publish the unpublish forms
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes          |
	| Sample text question: | ABC                | TextBox         | AllDefault     | DCF             | PscriptUpdate4           |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

#########################################  Unpublish Forms with Pscript (Non Data parameter) ############################

Scenario: T16_Update the Conditional2 form in Visit (Week 9) Event.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 9)" to select and open "Conditional2" CRF.
	When I click "Checkout" button on "Conditional2" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                                              | AnswerValue      | AnswerFieldType |
	| This item is an integer value (Leave blank to activate question 3):         | 12               | TextBox         |
	| Float value (activated if Question 1 is not equal to <blank>):              | 12.34            | TextBox         |
	| Date Value (activated if Question 4 is not blank or 6.25):                  | SampleText       | TextBox         |
	When I click on "Save & Close" button on "Conditional2" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

Scenario: T17_Update the Form1 in Screening event to publish the unpublish forms
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample text question: | Form2Unpublish     | TextBox         | Sample Text    | DCF             | PscriptUpdate5  |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T18_Update the Form1 in visit (Week 2) event.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample select question:  | Yes         | ListBox         |
	| Sample radio question:   | No          | Radio           |
	| Sample integer question: | 10          | TextBox         |
	| Sample float question:   | 12.34       | TextBox         |
	| Sample date question:    | 01/01/1997  | TextBox         |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

		@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T19_Verify the XML file which is generated for unpublish form in week 9 conditional form.
	Given I save the Event XML data in "UpdateFormStatusUIActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 6 and XmlMessage like '%FormData FormOID="Conditional2"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateFormStatusUIExpected1.xml" available in the project folder.
	And I have the XML file "UpdateFormStatusUIActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |

Scenario: T20_Enter event date for Visit week2 event
	When I click event date value "<none>" for "Visit (Week 2)" event
	And I set NeweventDate "10/03/2018" in EventActualDate modal.
	And I click Save button in EventActualDatePage
	Then I verify event date value "10/03/2018" for "Visit (Week 2)" event

Scenario: T21_Update the date question in week 2 event for form1.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample date question: | 01/01/1997         | TextBox         | 10/04/2018     | DCF             | Updated Date    |
	When I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

		@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T22_Verify the XML file which is generated for unpublish form in auto build form2 in week 51.
	Given I save the Event XML data in "UpdateFormStatusUIActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 6 and XmlMessage like '%StudyEventData StudyEventOID="AutoBuild_Event51"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateFormStatusUIExpected2.xml" available in the project folder.
	And I have the XML file "UpdateFormStatusUIActual2.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |

Scenario: T23_Update the data in screening event form1 data for text question
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue  | ReasonForChange | AdditionalNotes |
	| Sample text question: | AllDefault         | TextBox         | UnPublishDFinSE | DCF             | Updated Text    |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T24_Enter the data in screening event Form1 to unpublish the events.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue     | AnswerFieldType |
	| Sample select question:  | Yes             | ListBox         |
	| Sample radio question:   | Yes             | Radio           |
	| Sample integer question: | 10              | TextBox         |
	| Sample float question:   | 10.10           | TextBox         |
	| Sample date question:    | 10/10/2010      | TextBox         |
	When I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

		@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T25_Verify the XML file which is generated for unpublish form in auto build form2 in week 51.
	Given I save the Event XML data in "UpdateFormStatusUIActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 6 and XmlMessage like '%FormData FormOID="Form2"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateFormStatusUIExpected3.xml" available in the project folder.
	And I have the XML file "UpdateFormStatusUIActual3.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |

############################  Publish the all forms by updating the data in form1 screening event   ##################################


Scenario: T26_Enter data for Form1 (armb) in Screening to publish the Events
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample text question: | UnPublishDFinSE    | TextBox         | arma           | DCF             | test            |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T27_Enter data for Form1 (armb) in Screening to publish the Events
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample text question: | arma               | TextBox         | armb           | DCF             | test1           |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T28_01Enter data for Form1 (armb) in Screening to publish the Events
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample text question: | armb               | TextBox         | armc           | DCF             | test2           |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T29_Enter data for Form1 (AllDefault) in Screening to publish the Events
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample text question: | armc               | TextBox         | AllDefault     | DCF             | test3           |
	When I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

#######################################   Study Update ###########################################

Scenario: T30_Activate the query and verify the raised query.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_FoStPsA_Major study Update V2.zip" with Label "V2"
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
	| Subject                                                                                                                         |
	| Migration of Site 01 for Study file (V2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Publishing of Study file (V2) - complete.                                                                                       |


############################   Study update minor ##################################################

Scenario: T31_Update study with minor updates as updated form question item to unpublish forms.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_FoStPsA_Minor study Update V3.zip" with Label "V3"
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
	| Subject                                   |
	| Derivations: #1 - complete. View summary. |
	| Publishing of Study file (V3) - complete. |

		@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T32_Verify the XML file which is generated for Item update which is derived.
	Given I save the Event XML data in "UpdateFormStatusUIActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Text" TransactionType="Update" Value="Unpublish12"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateFormStatusUIExpected4.xml" available in the project folder.
	And I have the XML file "UpdateFormStatusUIActual4.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	
		@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T33_Verify the XML file which is generated for Unpublished form.
	Given I save the Event XML data in "UpdateFormStatusUIActual5.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 6 and XmlMessage like '%StudyEventData StudyEventOID="Visit10"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateFormStatusUIExpected5.xml" available in the project folder.
	And I have the XML file "UpdateFormStatusUIActual5.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |

Scenario: T34_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 

###################################################  END ##############################################################################















































































