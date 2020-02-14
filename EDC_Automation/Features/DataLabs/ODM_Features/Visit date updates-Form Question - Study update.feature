Feature: DataLabs_V5.7.0_ODM EventingforVisitdateupdatesOnForm

Test Summary:
	1. Verification of ODM eventing for added date from form for event.
	2. Verification of ODM eventing for updated date from form for event.
	3. Verification of ODM eventing for updated with blank date for event from form.
	4. Verification of ODM eventing for updated mapped form for event on study update.
	

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_ODM_Eventing1_Base V1.Zip" with study label "V1"
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
	Then I see Site details page for "01-Site"

Scenario: T05_Navigate to the Edit Preferences page and set the CRF Default save to Complete and update the Endpoint URL
	When I click breadcrumb "Study Administration"
	When I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Partial" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful"

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

	@ObjectiveEvidence @ReqID:3.1.2.6,3.1.2.7,3.1.2.8
Scenario: T08_Navigate to form and enter date value and verify the event for derived date.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date (DT1_Date1):                                  | 12/05/2018  | TextBox         |
	When I click on "Save & Close" button on "DT1 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.
	Then I verify event date value "12/05/2018" for "Visit (Week 7)" event

	@ObjectiveEvidence @ReqID:3.1.2.6,3.1.2.7,3.1.2.8
Scenario: T09_Verify the date value which is derived from form to event.
	Given I save the Event XML data in "UpdateEventDateFromUIActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '01-Pat') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateEventDateFromUIExpected1.xml" available in the project folder.
	And I have the XML file "UpdateEventDateFromUIActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T10_Update the form date value and verify the event for updated value.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt    | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Date (DT1_Date1): | 12/05/2018         | TextBox         | 12/06/2018     | DCF             | test            |
	When I click on "Save & Close" button on "DT1 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.
	Then I verify event date value "12/06/2018" for "Visit (Week 7)" event

	@ObjectiveEvidence @ReqID:3.1.2.6,3.1.2.7,3.1.2.8
Scenario: T11_Verify the date value which is derived from form to event.
	Given I save the Event XML data in "UpdateEventDateFromUIActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '01-Pat') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateEventDateFromUIExpected2.xml" available in the project folder.
	And I have the XML file "UpdateEventDateFromUIActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T12_Update the form date value to blank and verify the event for updated value.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt    | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Date (DT1_Date1): | 12/06/2018         | TextBox         |                | SEC             | Updated Value   |
	When I click on "Save & Close" button on "DT1 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.
	Then I verify event date value "<none>" for "Visit (Week 7)" event

	@ObjectiveEvidence @ReqID:3.1.2.6,3.1.2.7,3.1.2.8
Scenario: T13_Verify the date value which is derived from form to event.
	Given I save the Event XML data in "UpdateEventDateFromUIActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '01-Pat') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateEventDateFromUIExpected3.xml" available in the project folder.
	And I have the XML file "UpdateEventDateFromUIActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T14_Update the form date value from blank and verify the event for updated value.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 Form" CRF.
	When I click "Checkout" button on "DT1 Form" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt    | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Date (DT1_Date1): | [Blank]            | TextBox         | 12/07/2018     | SOR             | Updated Blank   |
	When I click on "Save & Close" button on "DT1 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.
	Then I verify event date value "12/07/2018" for "Visit (Week 7)" event

	@ObjectiveEvidence @ReqID:3.1.2.6,3.1.2.7,3.1.2.8
Scenario: T15_Verify the date value which is derived from form to event.
	Given I save the Event XML data in "UpdateEventDateFromUIActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '01-Pat') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateEventDateFromUIExpected4.xml" available in the project folder.
	And I have the XML file "UpdateEventDateFromUIActual4.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

#####  Study Update Scenarios ################

Scenario: T16_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_ODM_Eventing_Updated Mapped Form V2.Zip" with Label "V2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                        |
	| Publishing of Study file (V2) - complete. |

	@ObjectiveEvidence @ReqID:3.1.2.6,3.1.2.7,3.1.2.8
Scenario: T17_Verify the date value which is derived from form to event.
	Given I save the Event XML data in "UpdateEventDateFromUIActual5.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '01-Pat') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateEventDateFromUIExpected5.xml" available in the project folder.
	And I have the XML file "UpdateEventDateFromUIActual5.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |
	
##################  Update the Mapped form and verify the derived date value  ################


Scenario: T18_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_ODM_Eventing_Updated Mapped Form V3.Zip" with Label "V3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                   |
	| Publishing of Study file (V3) - complete. |

	@ObjectiveEvidence @ReqID:3.1.2.6,3.1.2.7,3.1.2.8
Scenario: T19_Verify the date value which is derived from form to event.
	Given I save the Event XML data in "UpdateEventDateFromUIActual6.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '01-Pat') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UpdateEventDateFromUIExpected6.xml" available in the project folder.
	And I have the XML file "UpdateEventDateFromUIActual6.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |
Scenario: T20_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 

########################################################################################################################################################