Feature:DataLabs_V5.7.0_ODMEventingforFormStateChangeonStudyUpdate

	Test Summary:
	1. Verification of ODM eventing for patient state update by adding question in form.
	2. Verification of ODM eventing for Patient state update by adding form in patient.
	
Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_Patient State Study Update V1.zip" with study label "V1"
	Then I see study label "Test4500" in header

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
	| 01       | PAT             | 10/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

#Freeze CRFs  - For Add question on CRF
Scenario: T07_Freeze all CRFs in the patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I click ActionPalette Item "Freeze CRFs" in "PatientPortalActions" ActionPalette
	When I click on "Select All" button in FreezeCRFsPage
	And I click on "Freeze" button in FreezeCRFsPage
	Then I see success message "Freeze CRF Successful"

#Import updated study with question add with Patient Migration
Scenario: T08_Import updated study and verify form state changed to Thaw and updated value in the form
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Patient State Study Update V2.zip" with Label "V2"
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
	| Migration of Site 01 for Study file (V2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Study file (V2) - complete.                                                                                                     |

	@ObjectiveEvidence @ReqID:3.1.6.3,3.1.6.4
Scenario: T09_Verify the XML Data evented out for the Thaw Patient from Datalabs UI
	Given I save the Event XML data in "PatientStateChangeonStudyUpdateActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%FormData FormOID="Form1"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "PatientStateChangeonStudyUpdateExpected1.xml" available in the project folder.
	And I have the XML file "PatientStateChangeonStudyUpdateActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

#Freeze CRFs  - For Add form on patient.
Scenario: T10_Freeze all CRFs in the patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I click ActionPalette Item "Freeze CRFs" in "PatientPortalActions" ActionPalette
	When I click on "Select All" button in FreezeCRFsPage
	And I click on "Freeze" button in FreezeCRFsPage
	Then I see success message "Freeze CRF Successful"
		 
#Import updated study with Added form.
Scenario: T11_Import updated study and verify form state changed to Thaw and updated value in the form
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Patient State Study Update V3.zip" with Label "V3"
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
	| Migration of Site 01 for Study file (V3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Study file (V3) - complete.                                                                                                     |

	@ObjectiveEvidence @ReqID:3.1.6.3,3.1.6.4
Scenario: T12_Verify the XML Data evented out for the Thaw Patient from Datalabs UI
	Given I save the Event XML data in "PatientStateChangeonStudyUpdateActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%LocationRef LocationOID="01-Site"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "PatientStateChangeonStudyUpdateExpected2.xml" available in the project folder.
	And I have the XML file "PatientStateChangeonStudyUpdateActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

#Freeze Patient.
Scenario: T13_Freeze Patient from all patients page.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I click ActionPalette Item "Freeze Patients" in "PatientSiteActions" ActionPalette
	When I select patients to freeze in FreezePatientsPage
	| PatientID |
	| 01-PAT    |
	And I click on Save button on in FreezepatientsPage
	Then I verify the success message displayed as "Freeze Patient Successful"
		 
#Import updated study with Added question.
Scenario: T14_Import updated study and verify form state changed to Thaw and updated value in the form
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Patient State Study Update V4.zip" with Label "V4"
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
	| Migration of Site 01 for Study file (V4) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Study file (V4) - complete.                                                                                                     |

	@ObjectiveEvidence @ReqID:3.1.6.3,3.1.6.4
Scenario: T14_Verify the XML Data evented out for the Thaw Patient from Datalabs UI
	Given I save the Event XML data in "PatientStateChangeonStudyUpdateActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%StudyEventData StudyEventOID="Screening"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "PatientStateChangeonStudyUpdateExpected3.xml" available in the project folder.
	And I have the XML file "PatientStateChangeonStudyUpdateActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

#Freeze Patient.
Scenario: T15_Freeze Patient from all patients page.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I click ActionPalette Item "Freeze Patients" in "PatientSiteActions" ActionPalette
	When I select patients to freeze in FreezePatientsPage
	| PatientID |
	| 01-PAT    |
	And I click on Save button on in FreezepatientsPage
	Then I verify the success message displayed as "Freeze Patient Successful"
		 
#Import updated study with Added form
Scenario: T16_Import updated study and verify form state changed to Thaw and updated value in the form
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Patient State Study Update V5.zip" with Label "V5"
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
	| Migration of Site 01 for Study file (V5) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Study file (V5) - complete.                                                                                                     |

	@ObjectiveEvidence @ReqID:3.1.6.3,3.1.6.4
Scenario: T17_Verify the XML Data evented out for the Thaw Patient from Datalabs UI
	Given I save the Event XML data in "PatientStateChangeonStudyUpdateActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%LocationRef LocationOID="01-Site"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "PatientStateChangeonStudyUpdateExpected4.xml" available in the project folder.
	And I have the XML file "PatientStateChangeonStudyUpdateActual4.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T18_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 
