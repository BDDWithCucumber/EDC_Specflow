Feature: DataLabs_V5.7.0_ODM Eventing for AddNewPatient
	Test Summary:
	1. Verification of ODM eventing for Patient Add from UI
	2. Verification of ODM eventing for Patient Add from Site Service
	3. Verification of ODM eventing for Patient Add from CDISC Service
	4. Verification of ODM eventing for Patient Add using Study with and without Patient Initials

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
	Then I see success message "Save Successful"
	
Scenario: T05_01_Navigate to the Edit Preferences page and set the CRF Default save to Complete and update the Endpoint URL
	When I click breadcrumb "Study Administration"
	When I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Complete" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful"

Scenario: T05_Add a patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

	@ObjectiveEvidence @ReqID:3.1.2.1
Scenario: T06_Verify the XML Data evented out for the Added Patient from Datalabs UI
	Given I save the Event XML data in "AddPatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 1 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "AddPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "AddPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceSystemVersion |
	
Scenario: T07_Add a ptient using SiteService Add New Patient Webservice
	When I add a new patient using AddNewPatient webservice with below data.
	| SiteIDData | ScreenIDData | PatientInitialsData | ScreenedDateData |
	| 01         | 02           | PAT                 | 06/13/2018       |
	Then The response should contain success status code as "200".
	@ObjectiveEvidence @ReqID:3.1.2.1
Scenario: T08_Verify the XML Data evented out for the Added Patient using CDISC webservice
	Given I save the Event XML data in "AddPatientUsingWSActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 1 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "AddPatientUsingWSExpected.xml" available in the project folder.
	And I have the XML file "AddPatientUsingWSActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceSystemVersion |

Scenario: T09_Select the site 01-Site and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T10_Select Screened form and update the Screened Date value.
	Given I expand "Common" to select and open "Screened" CRF.
	When I click "Checkout" button on "" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Screen Date:   | 06/13/2018         | TextBox         | 06/28/2018     | SOR             | Test            |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T11_Verify updating/submitting Screened form with new data is not evented out as Patient Add.
	When I execute the query "select * from OdmSubscriberDetail where StudyEventKey = 1 and XmlMessage like '%ItemData ItemOID="SCRNID" TransactionType="Insert" Value="01"%'".
	Then I have "1" records resulted on querying the DB.

Scenario: T12_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T13_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_ODM_Eventing_NoInitials.Zip" with study label "Test4500"
	Then I see study label "Test4500" in header

Scenario: T14_Add a patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | ScreenDate |
	| 03       | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 03        |
	@ObjectiveEvidence @ReqID:3.1.2.1
Scenario: T15_Verify the XML Data evented out for the Added Patient from Datalabs UI
	Given I save the Event XML data in "AddPatientUsingUIActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 1 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "AddPatientUsingUIExpected2.xml" available in the project folder.
	And I have the XML file "AddPatientUsingUIActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceSystemVersion |
	
Scenario: T16_Add a ptient using Site Service Add New Patient Webservice
	When I add a new patient using AddNewPatient webservice with below data.
	| SiteIDData | ScreenIDData | PatientInitialsData | ScreenedDateData |
	| 01         | 04           | PAT                 | 06/13/2018       |
	Then The response should contain success status code as "200".
	@ObjectiveEvidence @ReqID:3.1.2.1
Scenario: T17_Verify the XML Data evented out for the Added Patient using CDISC webservice
	Given I save the Event XML data in "AddPatientUsingWSActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 1 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "AddPatientUsingWSExpected2.xml" available in the project folder.
	And I have the XML file "AddPatientUsingWSActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceSystemVersion |

Scenario: T18_Add a Patient using CDISC service 
	When I add a new patient using ConsumeODMStrAddNewPatients webservice with below data and odmfile.
	| ODMDATA                   | AddNewPatientsDATA |
	| AddPatientUsingCDISC1.xml | true               |
	Then The response should contain success status code as "200".

	@ObjectiveEvidence @ReqID:3.1.2.1
Scenario: T19_Verify the XML Data evented out for the Added Patient using CDISC webservice
	Given I save the Event XML data in "AddPatientUsingCDISCActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 1 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "AddPatientUsingCDISCExpected.xml" available in the project folder.
	And I have the XML file "AddPatientUsingCDISCActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceSystemVersion |
	
	
Scenario: T20_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page