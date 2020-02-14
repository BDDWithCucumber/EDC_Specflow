Feature: DataLabs_V5.7.0_ODM Eventing for NonDataParameterQuery
	
	Test Summary:
			1. Verification of odm eventing xml for NonData Parameter Queries.
			2. Verification of odm eventing xml which exclude queries that are closed due to the deletion event in study update.
	

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "TestStudy_Original_V1.zip" with study label "V1"
	Then I see study label "Test3210" in header

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

Scenario: T06_Add patient 222-JJJ from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 222       | JJJ             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 222-JJJ   |

Scenario: T07_Select and enroll patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "222-JJJ" from patients table.
	When I enroll the patient "222-JJJ" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 222      | 06/13/2018 | Yes           |
	Then I see patient "222-JJJ" status as "Enrolled" on Patient details page.

@ObjectiveEvidence @ReqID:3.1.5.16
Scenario: T08_verify the Non Data Parameter queries are not displayed in ODM XML .
	Given I save the Event XML data in "NondataparameterqueryActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%ItemOID="ENRLID" TransactionType="Insert" Value="222"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NondataparameterqueryExpected1.xml" available in the project folder.
	And I have the XML file "NondataparameterqueryActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |


Scenario: T09_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "222-JJJ" from patients table.
	Then I see Patient details page for "222-JJJ".

Scenario: T10_Navigate to Patient and submit the form Form1 in visit (Week2)
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample text question:    | Text        | TextBox         |
	| Sample select question:  | No          | ListBox         |
	| Sample radio question:   | Yes         | Radio           |
	| Sample integer question: | 1050        | TextBox         |
	| Sample float question:   | 12.23       | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

Scenario: T11_Navigate to Patient and submit the form Form1 in visit (Week2)
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample text question:    | Text        | TextBox         |
	| Sample select question:  | No          | ListBox         |
	| Sample radio question:   | Yes         | Radio           |
	| Sample integer question: | 1050        | TextBox         |
	| Sample float question:   | 12          | TextBox         |
	| Sample date question:    | 10/10/1997  | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

Scenario: T12_Update the signature status and DCF status after publish the study.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "TestStudy_Original_V2.zip" with Label "V2"
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

@ObjectiveEvidence @ReqID:3.1.6.12
Scenario: T13_verify the Closed queries because of the event delete are not displayed in ODM XML .
	Given I save the Event XML data in "NondataparameterqueryActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Integer" TransactionType="Update" Value="1050"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NondataparameterqueryExpected2.xml" available in the project folder.
	And I have the XML file "NondataparameterqueryActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |           
	|         | SourceSystemVersion |

Scenario: T14_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 

############################################################################  END ######################################################################
