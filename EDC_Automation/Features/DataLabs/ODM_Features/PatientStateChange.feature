US US47452_Authoring BDD scenarios for patient state change

An ODM 1.3.2 file should generate when a patient state is successfully through UI.

Scenario: T01_Login to Datalabs
		Given I logged in to DataLabs
		Then I see Datalabs Home Page

Scenario: T02_Publish a study
		When I click breadcrumb "Study Management"
		And I upload a study "Base Study V1" with study label "L1"
		Then I see study label "Test3210" in header

Scenario: T03_Add Sites
		When I select DataManagerPortal item "Study Administration" from drop down
		And I click Link "Site Management" In StudyAdministrationPage
		And I enter sites details and Save
		| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
		| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) | India   | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
		Then I see "01-Site" in sites page

Scenario: T04_Assign testadmin testadmin user to site 01
		When I open site with siteid "01" and site name "Site" from SiteManagement page
		And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
		And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
		And I click breadcrumb "Site Management"

Scenario: T05_Navigate to Patients tab and select a site and add patient(s).
		Given I navigate to "Patients" tab from main menu.
		And I select the site "01-Site" from Sites dropdown.
		When I add patient with below details.
		| ScreenID | PatientInitials | ScreenDate |
		| 02       | PAT             | 05/21/2018 |
		Then I see below patients added in the Patients table.
		| PatientID |
		| 02-PAT    |

#Freeze patients		
Scenario: T06_Freeze the patient
		Given I click ActionPalette Item "Freeze Patients" in "PatientPortalActions" ActionPalette
		When I select patients to freeze in FreezePatientsPage
		| Patient |
		| 02-PAT  |
		And I click on "Save" button on in FreezepatientsPage
		Then I should see message "Freeze Patient Successfully"
		
Scenario: T07_Verify the XML Data evented out for the Added Patient from Datalabs UI
	Given I save the Event XML data in "FreezePatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FreezePatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "FreezePatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |	

#Lock Patient		
Scenario: T08_Lock the patient	
		Given I click ActionPalette Item "Lock Patients" in "PatientPortalActions" ActionPalette
		When I select patients to lock in LockPatientsPage
		| Patient |
		| 02-PAT  |
		And I click on "Save" button on in LockPatientsPage
		Then I should see message "Lock Patient Successfully"
		
Scenario: T09_Verify the XML Data evented out for the Locked Patient from Datalabs UI
	Given I save the Event XML data in "LockPatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "LockPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "LockPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |	
				
#Unlock the patient
Scenario: T10_Unlock Patient
		Given I click ActionPalette Item "Unlock Patients" in "PatientPortalActions" ActionPalette
		When I select patients to Unlock in UnlockPatientsPage
		| Patient |
		| 02-PAT  |
		And I click on "Save" button on in UnlockPatientsPage
		Then I should see message "Unlock Patient Successfully"
		
Scenario: T11_Verify the XML Data evented out for the Unlocked Patient from Datalabs UI
	Given I save the Event XML data in "UnlockPatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "UnlockPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "UnlockPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |	
		
#Thaw Patient		
Scenario: 07_Thaw the patient
		Given I click on Thaw Patients link
		And I click on check bos Thaw for "01-Pat" patient
		And I click on save button
		And I can see the message as "Thaw Patient Successful"
		And I can see the patient status as Thawed

Scenario: 08_Verification of the generated xml is as per of ODM 1.3.2 standards.
		Given I have access to the genearted ODM xml file.
		When I Open the ODM xml file.
		Then I should see the xml is as per of ODM 1.3.2 standards.		

Scenario: 09_Verification of ODM 1.3.2 xml file for screened patient.
		Given I have access to the genearted ODM xml file.
		When I Open the ODM xml file.
		Then I should see the added patient "01-Pat".
		And I see the patient state as "Thaw".
	
Scenario: 10_Verification of ODM 1.3.2 consumed by API .
		Given the ODM file is consumed by API.
		When I check the response from API.
		Then I should see the response has success.			
				