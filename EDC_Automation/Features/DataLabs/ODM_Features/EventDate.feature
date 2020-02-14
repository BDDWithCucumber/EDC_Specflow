Feature: DataLabs_V5.7.0_ODM Eventing for EventDate
	Test Summary:
	1. Verification of odm eventing xml for Event Date entry from UI.
	2. Verification of odm eventing xml for Event Date update from UI.
	3. Verification of Event date odm eventing xml for unscheduled event.
	4. Verification of Patient status override odm eventing xml from Enrolled to Screened in which the enrolled event have an Event Date entry.
	5. Verification of odm eventing xml for Event Date entry from Patient Event Web Service (SetEventDate service).

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_ODM_Eventing_Base.Zip" with study label "Test4500"
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
	Then I verify the success message displayed as "Save Successful"

Scenario: T05_Navigate to the Edit Preferences page and set the Endpoint URL
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Patient Data Eventing" in StudyEditPreferencesPage
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

	Scenario: T08_Enter event date for Visit (Screening) Event
	When I click event date value "<none>" for "Visit (Screening)" event
	And I set NeweventDate "06/28/2018" in EventActualDate modal.
	And I click Save button in EventActualDatePage
	Then I verify event date value "06/28/2018" for "Visit (Screening)" event

	@ReqID:3.1.2.7 @ObjectiveEvidence
Scenario: T09_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "EventDateFromUIActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%StudyEventOID="Screening" TransactionType="Insert"%' and XmlMessage like '%' +(Select SubjectKey from Patient where PatientIdentity='01-PAT')+ '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "EventDateFromUIExpected1.xml" available in the project folder.
	And I have the XML file "EventDateFromUIActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

	Scenario: T10_Update the event date for Visit (Screening) event
	When I click event date value "06/28/2018" for "Visit (Screening)" event
	And I update eventDate in EventActualDate modal.
	| EnterNewValue   | ReasonforChange  | AdditionalNotes    |
	| 06/29/2018      | DCF              | Testing            |
	And I click Save button in EventActualDatePage
	Then I verify event date value "06/29/2018" for "Visit (Screening)" event

	@ReqID:3.1.2.6,3.1.2.7 @ObjectiveEvidence
Scenario: T11_Verify the XML Data evented out for the Visit date udapted from Datalabs UI
	Given I save the Event XML data in "EventDateFromUIActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%StudyEventOID="Screening" TransactionType="Update"%' and XmlMessage like '%' +(Select SubjectKey from Patient where PatientIdentity='01-PAT')+ '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "EventDateFromUIExpected2.xml" available in the project folder.
	And I have the XML file "EventDateFromUIActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T12_Add an unscheduled event Visit (Week 4)
	When I click ActionPalette Item "Add Unscheduled Event" in "PatientPortalActions" ActionPalette
	And I select "Visit (Week 4)" from events list on AddUnscheduledEventStep1Page
	And I click on Next button on AddUnscheduledEventStep1Page
	And I select below forms on on AddUnscheduledEventStep2Page
	| FormName    |
	| Case_Form   |
	And I click on Next button on AddUnscheduledEventStep2Page
	And I click on Finish button on AddUnscheduledEventStep3Page
	Then I see event "Visit (Week 4).1" in PatientPortalPage
	
	Scenario: T13_Enter event date for Visit (Week 4)1 Event
	When I click event date value "<none>" for "Visit (Week 4).1" event
	And I set NeweventDate "06/28/2018" in EventActualDate modal.
	And I click Save button in EventActualDatePage
	Then I verify event date value "06/28/2018" for "Visit (Week 4).1" event

	@ReqID:3.1.2.7,3.1.2.8 @ObjectiveEvidence
Scenario: T14_Verify the XML Data evented out for the Visit date entered for an unscheduled event from Datalabs UI
	Given I save the Event XML data in "EventDateFromUIActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%StudyEventOID="Unscheduled%TransactionType="Insert"%' and XmlMessage like '%' +(Select SubjectKey from Patient where PatientIdentity='01-PAT')+ '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "EventDateFromUIExpected3.xml" available in the project folder.
	And I have the XML file "EventDateFromUIActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

	Scenario: T15_Enter event date for Visit (Week 4) Event
	When I click event date value "<none>" for "Visit (Week 4)" event
	And I set NeweventDate "06/28/2018" in EventActualDate modal.
	And I click Save button in EventActualDatePage
	Then I verify event date value "06/28/2018" for "Visit (Week 4)" event

	@ReqID:3.1.2.7 @ObjectiveEvidence
Scenario: T16_Verify the XML Data evented out for the Visit date entered for an event from Datalabs UI
	Given I save the Event XML data in "EventDateFromUIActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%StudyEventOID="Visit04" TransactionType="Insert"%' and XmlMessage like '%' +(Select SubjectKey from Patient where PatientIdentity='01-PAT')+ '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "EventDateFromUIExpected4.xml" available in the project folder.
	And I have the XML file "EventDateFromUIActual4.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |
		
	Scenario: T17_Override the patient status from Enrolled to Screened for patient 01-PAT
	When I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
	Given I select change to "Screened" in PatientStatusOverridePage
	And I enter reason "Status override from Enrolled to Screened" for patient status change in PatientStatusOverridePage
	And I Click save button in PatientStatusOverridePage
	Then I see success message "Status Override Changed Successfully."

	@ReqID:3.1.2.3,3.1.2.4 @ObjectiveEvidence
Scenario: T18_Verify the XML Data evented out for the Screened status due to status override.
	Given I save the Event XML data in "EnrollPatientOverrideEventDateActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%Status override from Enrolled to Screened%' and XmlMessage like '%' +(Select SubjectKey from Patient where PatientIdentity='01-PAT')+ '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "EnrollPatientOverrideEventDateExpected.xml" available in the project folder.
	And I have the XML file "EnrollPatientOverrideEventDateActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T19_Enter Visit date for Visit (Week 2) event via SetEventDate Webservice
	When I enter Visit date using SetEventDate webservice with below data.
	| PatientKeyData | PatientEventKeyData | EventDateData |
	| 1              | 4                   | 2018-06-28    |
	Then The response should contain success status code as "200".

	@ReqID:3.1.2.7
Scenario: T20_Verify the XML Data evented out for the Visit date is entered via Webservice
	Given I save the Event XML data in "EventDateUsingWebserviceActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 5 and XmlMessage like '%Changed by the PatientEvent Web Service%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "EventDateUsingWebserviceExpected.xml" available in the project folder.
	And I have the XML file "EventDateUsingWebserviceActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T21_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page
