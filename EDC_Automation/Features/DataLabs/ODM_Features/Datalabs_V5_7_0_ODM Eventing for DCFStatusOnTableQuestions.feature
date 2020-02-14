Feature: Datalabs_V5_7_0_ODM Eventing for DCFStatusOnTableQuestions

	Test Summary:
			1. Verification of ODM eventing for raised queries and updated form status on Study update
			2. Verification of ODM eventing for closed queries and updated form status on study update
			

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "DCFStatusOnTableQuestions V1.Zip" with study label "Test3210_Query Smoke Test"
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

Scenario: T07_Update the Form1 in visit (Week 2) event.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample text question:    | Test        | TextBox         |
	| Sample select question:  | Yes         | ListBox         |
	| Sample radio question:   | Yes         | Radio           |
	| Sample integer question: | 1000        | TextBox         |
	| Sample float question:   | 12.23       | TextBox         |
	| Sample date question:    | 01/01/1999  | TextBox         |
	And I enter below "Sample Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Drug Name:     | testing_1   | TextBox         | Save & Close Row |
	And I enter below "Sample Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 2         | Drug Name:     | testing_1   | TextBox         | Save & Close Row |
	And I enter below "Sample Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 3         | Drug Name:     | testing_1   | TextBox         | Save & Close Row |
	And I enter below "Sample Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 4         | Drug Name:     | testing_1   | TextBox         | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T08_Update the Form4 data in visit (Week 2) event.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form 4" CRF.
	When I click "Checkout" button on "Form 4" CRF.
	And I enter below "Text Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                               | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Text question: (Edit Check: Required {Sent}) | testing_1   | TextBox         | Save & Close Row |
	And I enter below "Text Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                               | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 2         | Text question: (Edit Check: Required {Sent}) | testing_1   | TextBox         | Save & Close Row |
	And I enter below "Text Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                               | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 3         | Text question: (Edit Check: Required {Sent}) | testing_1   | TextBox         | Save & Close Row |
	And I enter below "Text Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                               | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 4         | Text question: (Edit Check: Required {Sent}) | testing_1   | TextBox         | Save & Close Row |
	And I click on "Save & Close" button on "Form 4" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13,3.1.3.1,3.1.3.2,QC1685,QC1682,QC1680 
Scenario: T09_Update the study and verify the raised DCFs and verify the updated status of the form1 in visit Week2.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "DCFStatusOnTableQuestions V2.zip" with Label "V2"
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

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13,3.1.3.1,3.1.3.2,QC1685,QC1682,QC1680 
Scenario: T10_Verify the XML For raised queries on form1 and Form4 in visit week2
	Given I save the Event XML data in "DCFStatusOnTableQuestionsActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Float" TransactionType="Update" Value="12.23"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "DCFStatusOnTableQuestionsExpected1.xml" available in the project folder.
	And I have the XML file "DCFStatusOnTableQuestionsActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T11_Update the study and verify the Closed DCFs and verify the updated status of the form1 in visit Week2.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "DCFStatusOnTableQuestions V1.Zip" with Label "V3"
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
	| Migration of Site 01 for Study file (V3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Publishing of Study file (V3) - complete.                                                                                       |

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13,3.1.3.1,3.1.3.2	
Scenario: T12_Verify the XML For Closed queries on form1 and Form4 in visit week2
	Given I save the Event XML data in "DCFStatusOnTableQuestionsActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Float" TransactionType="Update" Value="12.23"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "DCFStatusOnTableQuestionsExpected2.xml" available in the project folder.
	And I have the XML file "DCFStatusOnTableQuestionsActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T13_Select and enroll patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 01/21/2019 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: T14_Update the data in Autobuild form03 in visit week 52.
	Given I navigate to "Patients" tab from main menu.	
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 52)" to select and open "AutoBuild Form03" CRF.
	When I click "Checkout" button on "AutoBuild Form03" CRF.
	And I enter below "Key Sequence is on question #1. Question (4 & 7) are derives. Table structure is open. Maximum Table Rows are 5.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | The some Text value: | testing_1   | TextBox         | Save & Close Row |
	| No        | 2         | The some Text value: | testing_1   | TextBox         | Save & Close Row |
	And I click on "Save & Close" button on "AutoBuild Form03" CRF.

Scenario: T15_Verify the raised DCF on Auto build Form03 in Visit week 52.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "DCFStatusOnTableQuestions V3.Zip" with Label "V4"
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
	| Migration of Site 01 for Study file (V4) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Publishing of Study file (V4) - complete.                                                                                       |

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13,3.1.3.1,3.1.3.2
Scenario: T16_Verify the XML For raised queries on form1 and Form4 in visit week2 and Auto build form03 in week 52
	Given I save the Event XML data in "DCFStatusOnTableQuestionsActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Float" TransactionType="Update" Value="12.23"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "DCFStatusOnTableQuestionsExpected3.xml" available in the project folder.
	And I have the XML file "DCFStatusOnTableQuestionsActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | OID              |
	|         | SourceSystemVersion |

Scenario: T17_Verify the Closed DCF on Auto build Form03 in Visit week 52.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "DCFStatusOnTableQuestions V1.Zip" with Label "V5"
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
	| Publishing of Study file (V5) - complete.                                                                                       |

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13	
Scenario: T18_Verify the XML For Closed queries on form1 and Form4 in visit week2 and Auto build form03 in week 52
	Given I save the Event XML data in "DCFStatusOnTableQuestionsActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Float" TransactionType="Update" Value="12.23"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "DCFStatusOnTableQuestionsExpected4.xml" available in the project folder.
	And I have the XML file "DCFStatusOnTableQuestionsActual4.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | OID              |
	|         | SourceSystemVersion |
	
Scenario: T19_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page
##########################################################  END  ###################################################################	
		