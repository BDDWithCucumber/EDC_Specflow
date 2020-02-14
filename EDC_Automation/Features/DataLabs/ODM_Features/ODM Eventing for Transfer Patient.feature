Feature: DataLabs_V5.7.0_ODM Eventing for Transfer Patient
Test Summary:
1) Verification of the odm eventing xml for patient transfer from 01-Site to 02-Site. 
2) Verification of the odm eventing xml for patient transfer from 02-Site to 03-Site.
3) Verification of the odm eventing xml for patient transfer from 03-Site to 01-Site.

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish a study
	When I click breadcrumb "Study Management"
	And  I upload a study "Test4500_ODM_Eventing_Base.zip" with study label "Test4500_ODM_Eventing_Base"
	Then I see study label "Test4500" in header

Scenario: T04_Add Sites
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 03     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 77777777777 | Active     | Electronic  | No             | -          |
	Then I see site "01-Site" in SiteManagementPage
	And I see site "02-Site" in SiteManagementPage
	And I see site "03-Site" in SiteManagementPage

Scenario: T05_Assign testadmin testadmin user to site 01
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"
	

Scenario: T06_Assign testadmin testadmin user to site 02
	When I click breadcrumb "Site Management"
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "02-Site"

Scenario: T07_Assign testadmin testadmin user to site 02
	When I click breadcrumb "Site Management"
	And I open site with siteid "03" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "03-Site"

Scenario: T08_Navigate to the Edit Preferences page and set the Endpoint URL
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Patient Data Eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful" 

Scenario: T09_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials     | ScreenDate |
	| 01       | Patient             | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-Patient    |
	
	Scenario: T10_Navigate to Patient and do the Transfer patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-Patient" from patients table.
	When I click ActionPalette Item "Transfer Patient" in "PatientPortalActions" ActionPalette
	And I set transfer patient data in TransferPatientPage
	| ToSite   | Reason                | AdditionalNotes    |
	| 02-Site  | Patient changed site  | Patient transferred from 01-Site to 02-Site |
	And I click Transfer button in TransferPatientPage
	And I click continue in modal dialog having title "Transfer Patient Confirmation" and partial message "01-Patient will be moved to site 02-Site."
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                    |
	| Transfer Patient - complete. View Summary. |

	@ReqID:3.1.2.2 @ObjectiveEvidence
Scenario: T11_Verify the XML Data evented out for the Transfer Patient
	Given I save the Event XML data in "TransferPatientActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventkey = 2 and XmlMessage like '%01-Patient transferred from 01-Site%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "TransferPatientExpected1.xml" available in the project folder.
	And I have the XML file "TransferPatientActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T12_Verify transferred patient site
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	And I select the patient "01-Patient" from patients table.
	Then I see Patient details page for "01-Patient".

Scenario: T13_Enroll "01-Patient" patient.
	When I enroll the patient "01-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 06/13/2018 | Yes           |
	Then I see patient "01-Patient" status as "Enrolled" on Patient details page.

	Scenario: T14_Navigate to Patient and do the Transfer patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	And I select the patient "01-Patient" from patients table.
	When I click ActionPalette Item "Transfer Patient" in "PatientPortalActions" ActionPalette
	And I set transfer patient data in TransferPatientPage
	| ToSite   | Reason                | AdditionalNotes    |
	| 03-Site  | Entry error		   | Patient transferred from 02-Site to 03-Site	|
	And I click Transfer button in TransferPatientPage
	And I click continue in modal dialog having title "Transfer Patient Confirmation" and partial message "01-Patient will be moved to site 03-Site."
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                    |
	| Transfer Patient - complete. View Summary. |

	@ReqID:3.1.2.2 @ObjectiveEvidence
Scenario: T15_Verify the XML Data evented out for the Transfer Patient
	Given I save the Event XML data in "TransferPatientActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventkey =(select StudyEventKey from MF_StudyEvent where StudyEventName = 'PatientTransfer') order by OdmSubscriberDetailKey desc"
	And I have the XML file "TransferPatientExpected2.xml" available in the project folder.
	And I have the XML file "TransferPatientActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T16_Verify transferred patient site
	Given I navigate to "Patients" tab from main menu.
	And I select the site "03-Site" from Sites dropdown.
	And I select the patient "01-Patient" from patients table.
	Then I see Patient details page for "01-Patient".

	Scenario: T17_Navigate to Patient and do the Transfer patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "03-Site" from Sites dropdown.
	And I select the patient "01-Patient" from patients table.
	When I click ActionPalette Item "Transfer Patient" in "PatientPortalActions" ActionPalette
	And I set transfer patient data in TransferPatientPage
	| ToSite   | Reason                | AdditionalNotes    |
	| 01-Site  | Other				   | Patient transferred from 03-Site to 01-Site	|
	And I click Transfer button in TransferPatientPage
	And I click continue in modal dialog having title "Transfer Patient Confirmation" and partial message "01-Patient will be moved to site 01-Site."
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                    |
	| Transfer Patient - complete. View Summary. |

	@ReqID:3.1.2.2 @ObjectiveEvidence
Scenario: T18_Verify the XML Data evented out for the Transfer Patient
	Given I save the Event XML data in "TransferPatientActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventkey =(select StudyEventKey from MF_StudyEvent where StudyEventName = 'PatientTransfer') order by OdmSubscriberDetailKey desc"
	And I have the XML file "TransferPatientExpected3.xml" available in the project folder.
	And I have the XML file "TransferPatientActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T19_Verify transferred patient site
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-Patient" from patients table.
	Then I see Patient details page for "01-Patient".

Scenario: T20_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page
	