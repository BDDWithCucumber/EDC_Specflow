Feature: DataLabs_V5.7.0_ODM Eventing for SignatureStatusOnPatient

	Test Summary:
			1. Verification of odm eventing xml for Signature Status changed on Patient level.
	

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_Base study V1.Zip" with study label "Test4500"
	Then I see study label "Test4500" in header

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

Scenario: T07_Add custom fields to query for sample text question query in visit screening form1
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "DCFs" in StudyEditPreferencesPage
	And I enter text "Custom1" in FieldLabelTextbox1 in StudyEditPreferencesDCFsPage
	And I click ActiveRadioButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Item1" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage
	And I click AddButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Item2" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage
	And I click AddButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Item3" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage
	And I click AddButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Item4" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage
	And I click AddButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Custom2" in FieldLabelTextbox2 in StudyEditPreferencesDCFsPage
	And I click ActiveRadioButton2 in StudyEditPreferencesDCFsPage
	And I enter text "Item5" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage
	And I click AddButton2 in StudyEditPreferencesDCFsPage
	And I enter text "Item6" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage
	And I click AddButton2 in StudyEditPreferencesDCFsPage
	And I enter text "Item7" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage
	And I click AddButton2 in StudyEditPreferencesDCFsPage
	And I enter text "Item8" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage
	And I click AddButton2 in StudyEditPreferencesDCFsPage
	And I click SaveButton in StudyEditPreferencesDCFsPage

Scenario: T08_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".
	
Scenario: T09_Navigate to Patient and submit the form Form1 in visit (Week2)
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample text question:    | Text        | TextBox         |
	| Sample select question:  | No          | ListBox         |
	| Sample radio question:   | Yes         | Radio           |
	| Sample integer question: | 1050        | TextBox         |
	| Sample float question:   | 12.35       | TextBox         |
	| Sample date question:    | 10/10/1997  | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

Scenario: T10_Request signature for multiple forms in the same event.
	When I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	When I click on Select All button in RequestSignaturePage
	And I click on Submit button in RequestSignaturePage
	Then I see success message "CRF for Signature Saved Successful"

Scenario: T11_Request signature for multiple forms in the same event.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I click ActionPalette Item "Sign Casebook" in "PatientPortalActions" ActionPalette
	And I click on Accept All button in SignCasebookPage
	And I given username as "testadmin" in SignCasebookPage
	And I given password as "Datalabs1234" in SignCasebookPage
	And I click on Submit button in SignCasebbokPage
	Then I see success message "CRFs for Casebook Saved Successful"

Scenario: T12_Update the signature status and DCF status after publish the study.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Updated Study V2.zip" with Label "V2"
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

	@ObjectiveEvidence @ReqID:3.1.6.11
Scenario: T13_verify the Signature status and DCF status on patient level.
	Given I save the Event XML data in "SIgnatureAndDCFStatusUpdatedActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Date" TransactionType="Update" Value="10/10/1997"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SIgnatureAndDCFStatusUpdatedExpected1.xml" available in the project folder.
	And I have the XML file "SIgnatureAndDCFStatusUpdatedActual1.xml" available in the Test XML Files folder.
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

###################################################  END ##############################################################################