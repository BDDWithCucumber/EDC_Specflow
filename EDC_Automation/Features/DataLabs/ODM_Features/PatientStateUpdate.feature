Feature: DataLabs_V5.7.0_ODMEventingforPatientStateUpdate

	Test Summary:
	1. Verification of ODM eventing xml for Patient State Update on Freeze single patient
	2. Verification of ODM eventing xml for Patient State Update on Thaw single patient
	3. Verification of ODM eventing xml for Patient State Update on Lock single patient
	4. Verification of ODM eventing xml for Patient State Update on unlock single patient
	5. Verification of ODM eventing xml for Patient State Update on Freeze multiple patients
	6. Verification of ODM eventing xml for Patient State Update on Thaw multiple patients
	7. Verification of ODM eventing xml for Patient State Update on Lock multiple patients
	8. Verification of ODM eventing xml for Patient State Update on Unlock multiple patients
	9. Verification of ODM eventing xml for Patient State Update on Freeze Patient by a form freeze
	10. Verification of ODM eventing xml for Patient State Update on Thaw Patient by a form thaw

Scenario: T01_Login to Datalabs
		Given I logged in to DataLabs
		Then I see Datalabs Home Page

Scenario: T02_Delete the current study
		When I delete study
		Then I see study label "No Study Loaded" in header

Scenario: T03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Test3210_Base_ODMStudy_1" with study label "TestBase"
	Then I see study label "Test3210_Query Smoke Test" in header

Scenario: T04_Add Sites
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) | India   | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	Then I see site "01-Site" in SiteManagementPage
	
Scenario: T05_Assign testadmin testadmin user to site 01
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: T06_Navigate to the Edit Preferences page and set the CRF Default save to Complete and update the Endpoint URL
	When I click breadcrumb "Study Administration"
	When I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Complete" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful"

Scenario: T07_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 02       | PAT             | 10/05/2018 |
	| 03       | PAT             | 10/05/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 02-PAT    |
	| 03-PAT    |

#Freeze patients		
Scenario: T08_Freeze the patient
	Given I click ActionPalette Item "Freeze Patients" in "PatientSiteActions" ActionPalette
	When I select patients to freeze in FreezePatientsPage
	| PatientID |
	| 02-PAT    |
	And I click on Save button on in FreezepatientsPage
	Then I verify the success message displayed as "Freeze Patient Successful"
	
	@ObjectiveEvidence @ReqID:3.1.2.5	
Scenario: T09_Verify the XML Data evented out for the Freeze Patient from Datalabs UI
	Given I save the Event XML data in "FreezePatientFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%<ReasonForChange>Frozen</ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FreezePatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "FreezePatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

#Lock Patient		
Scenario: T10_Lock the patient	
	Given I click ActionPalette Item "Lock Patients" in "PatientSiteActions" ActionPalette
	When I select patients to lock in LockPatientsPage
	| PatientID |
	| 02-PAT    |
	And I click on Save button on in LockPatientsPage
	Then I verify the success message displayed as "Lock Patient Successful"
	@ObjectiveEvidence @ReqID:3.1.2.5	
Scenario: T11_Verify the XML Data evented out for the Locked Patient from Datalabs UI
	Given I save the Event XML data in "LockPatientFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 order by OdmSubscriberDetailKey desc"
	And I have the XML file "LockPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "LockPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |
				
#Unlock the patient
Scenario: T12_Unlock Patient
	Given I click ActionPalette Item "Unlock Patients" in "PatientSiteActions" ActionPalette
	When I select patients to Unlock in UnlockPatientsPage
	| PatientID |
	| 02-PAT    |
	And I click on Save button on in UnlockPatientsPage
	Then I verify the success message displayed as "Unlock Patient Successful"
	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T13_Verify the XML Data evented out for the Unlocked Patient from Datalabs UI
	Given I save the Event XML data in "UnlockPatientFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 order by OdmSubscriberDetailKey desc"
	And I have the XML file "UnlockPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "UnlockPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |
		
#Thaw Patient		
Scenario: T14_Thaw the Patient
	Given I click ActionPalette Item "Thaw Patients" in "PatientSiteActions" ActionPalette
	When I select patients to Thaw in ThawPatientsPage
	| PatientID |
	| 02-PAT    |
	And I click on Save button on in ThawPatientsPage
	Then I verify the success message displayed as "Thaw Patient Successful"
	@ObjectiveEvidence @ReqID:3.1.2.5	
Scenario: T15_Verify the XML Data evented out for the Thaw Patient from Datalabs UI
	Given I save the Event XML data in "ThawPatientFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 order by OdmSubscriberDetailKey desc"
	And I have the XML file "ThawPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "ThawPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |

#Freeze All CRFs
Scenario: T16_Freeze CRFs
	Given I select the patient "02-PAT" from patients table.
	And I click ActionPalette Item "Freeze CRFs" in "PatientPortalActions" ActionPalette
	When I select Freeze checkbox for below forms in FreezeCRFsPage
			 | EventName         | FormName           |
			 | Visit (Screening) | Form1              |
			 | Visit (Week 2)    | Form1              |
			 | Visit (Week 2)    | Form 2             |
			 | Visit (Week 2)    | Form 3             |
			 | Visit (Week 2)    | Form 4             |
			 | Visit (Week 2)    | Form 5             |
			 | Visit (Week 2)    | Form 6             |
			 | Visit (Week 2)    | Form 7             |
			 | Visit (Week 2)    | Form 8             |
			 | Visit (Week 2)    | Form 9             |
			 | Visit (Week 2)    | Duplicate Encoding |
			 | Common            | Form1              |
			 | Common            | Screened           |
	And I click on "Freeze" button in FreezeCRFsPage
	Then I verify the success message displayed as "Freeze CRFs Successful"
	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T17_Verify the XML Data evented out for the Freeze CRF from Datalabs UI
	Given I save the Event XML data in "FreezePatientFromCRFsActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=7 and XmlMessage like '%<ReasonForChange>Frozen</ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FreezePatientFromCRFsExpected.xml" available in the project folder.
	And I have the XML file "FreezePatientFromCRFsActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |		
	|         | SourceSystemVersion |

#Lock Patient
Scenario: T18_Lock the patient from CRF page
	And I click ActionPalette Item "Lock Patient" in "PatientPortalActions" ActionPalette
	When I click continue in modal dialog having title "Lock Patient" and partial message "Locking this patient will lock patient and all"
	Then I verify the success message displayed as "Patient has been locked successfully."
	@ObjectiveEvidence @ReqID:3.1.2.5	
Scenario: T19_Verify the XML Data evented out for the Locked Patient from Datalabs UI
	Given I save the Event XML data in "LockPatientFromCRFActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "LockPatientFromCRFExpected.xml" available in the project folder.
	And I have the XML file "LockPatientFromCRFActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |

#Unlock Patient
Scenario: T20_Unlock the patient from CRF page
	Given I click ActionPalette Item "Unlock Patient" in "PatientPortalActions" ActionPalette
	When I click continue in modal dialog having title "Unlock Patient" and partial message "Unlocking this patient will unlock patient and all"
	Then I verify the success message displayed as "Patient has been unlocked successfully." 	
	@ObjectiveEvidence @ReqID:3.1.2.5	
Scenario: T21_Verify the XML Data evented out for the Locked Patient from Datalabs UI
	Given I save the Event XML data in "UnlockPatientFromCRFActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "UnlockPatientFromCRFExpected.xml" available in the project folder.
	And I have the XML file "UnlockPatientFromCRFActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |							
	|         | SourceSystemVersion |

#Thaw All CRFs
Scenario: T22_Thaw CRFs
	Given I click ActionPalette Item "Thaw CRFs" in "PatientPortalActions" ActionPalette
	When I click on "Select All" button in ThawCRFsPage
	And I click on "Thaw" button in ThawCRFsPage
	Then I verify the success message displayed as "Thaw CRFs Successful"			
	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T23_Verify the XML Data evented out for the Thaw CRF from Datalabs UI
	Given I save the Event XML data in "ThawCRFFromCRFActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=7 and XmlMessage like '%<ReasonForChange>Thawed</ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ThawCRFFromCRFExpected.xml" available in the project folder.
	And I have the XML file "ThawCRFFromCRFActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |			
	|         | SourceSystemVersion |

#Freeze all CRFs except one
Scenario: T24_Freeze few CRFs
	Given I click ActionPalette Item "Freeze CRFs" in "PatientPortalActions" ActionPalette
	When I select Freeze checkbox for below forms in FreezeCRFsPage
			 | EventName         | FormName           |
			 | Visit (Screening) | Form1              |
			 | Visit (Week 2)    | Form1              |
			 | Visit (Week 2)    | Form 2             |
			 | Visit (Week 2)    | Form 3             |
			 | Visit (Week 2)    | Form 4             |
			 | Visit (Week 2)    | Form 5             |
			 | Visit (Week 2)    | Form 6             |
			 | Visit (Week 2)    | Form 7             |
			 | Visit (Week 2)    | Form 8             |
			 | Visit (Week 2)    | Form 9             |
			 | Visit (Week 2)    | Duplicate Encoding |
			 | Common            | Form1              |
	And I click on "Freeze" button in FreezeCRFsPage
	Then I verify the success message displayed as "Freeze CRFs Successful"

#Freeze one CRF from specific form
Scenario: T25_Freeze one CRF
	Given I expand "Common" to select and open "Screened" CRF.
	And I click ActionPalette Item "Freeze CRF" in "CRFAction" ActionPalette
	Then I verify the success message displayed as "CRF Frozen"
	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T26_Verify the XML Data evented out for the Freeze CRF from Datalabs UI
	Given I save the Event XML data in "FreezePatientFromCRFFormActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 7 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FreezePatientFromCRFFormExpected.xml" available in the project folder.
	And I have the XML file "FreezePatientFromCRFFormActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |
	|         | SourceSystemVersion |
	
#Thaw All CRFs
Scenario: T27_Thaw CRFs
	Given I click breadcrumb "02-PAT".
	And I click ActionPalette Item "Thaw CRFs" in "PatientPortalActions" ActionPalette
	When I click on "Select All" button in ThawCRFsPage
	And I click on "Thaw" button in ThawCRFsPage
	Then I verify the success message displayed as "Thaw CRFs Successful"
	
#Freeze multiple patients		
Scenario: T28_Freeze the patient
	Given I click breadcrumb "All Patients".
	And I click ActionPalette Item "Freeze Patients" in "PatientSiteActions" ActionPalette
	When I select patients to freeze in FreezePatientsPage
	| PatientID |
	| 02-PAT    |
	| 03-PAT    |
	And I click on Save button on in FreezepatientsPage
	Then I verify the success message displayed as "Freeze Patients Successful"
	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T29_Verify the XML Data evented out for the Freeze multiple Patients from Datalabs UI
	Given I save the Event XML data in "FreezeMultiPatientOneFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%Description="Patient State"%'+(Select SubjectKey from Patient where PatientIdentity = '02-PAT')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FreezeMultiPatientOneFromUIExpected.xml" available in the project folder.
	And I have the XML file "FreezeMultiPatientOneFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |
	|         | SourceSystemVersion |

	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T30_Verify the XML Data evented out for the Freeze multiple Patients from Datalabs UI
	Given I save the Event XML data in "FreezeMultiPatientTwoFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%Description="Patient State"%'+(Select SubjectKey from Patient where PatientIdentity = '03-PAT')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FreezeMultiPatientTwoFromUIExpected.xml" available in the project folder.
	And I have the XML file "FreezeMultiPatientTwoFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |			
	|         | SourceSystemVersion |

#Lock Patient		
Scenario: T31_Lock the patient	
	Given I click ActionPalette Item "Lock Patients" in "PatientSiteActions" ActionPalette
	When I select patients to lock in LockPatientsPage
	| PatientID |
	| 02-PAT    |
	| 03-PAT    |
	And I click on Save button on in LockPatientsPage
	Then I verify the success message displayed as "Lock Patients Successful"
	@ObjectiveEvidence @ReqID:3.1.2.5	
Scenario: T32_Verify the XML Data evented out for the Locked Multiple Patient from Datalabs UI
	Given I save the Event XML data in "LockMultiPatientOneFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%Description="Patient State"%'+(Select SubjectKey from Patient where PatientIdentity = '02-PAT')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "LockMultiPatientOneFromUIExpected.xml" available in the project folder.
	And I have the XML file "LockMultiPatientOneFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |

	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T33_Verify the XML Data evented out for the Locked Multiple Patient from Datalabs UI
	Given I save the Event XML data in "LockMultiPatientTwoFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%Description="Patient State"%'+(Select SubjectKey from Patient where PatientIdentity = '03-PAT')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "LockMultiPatientTwoFromUIExpected.xml" available in the project folder.
	And I have the XML file "LockMultiPatientTwoFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |
				
#Unlock the patient
Scenario: T34_Unlock Patient
		Given I click ActionPalette Item "Unlock Patients" in "PatientSiteActions" ActionPalette
		When I select patients to Unlock in UnlockPatientsPage
		| PatientID |
		| 02-PAT    |
		| 03-PAT    |
		And I click on Save button on in UnlockPatientsPage
		Then I verify the success message displayed as "Unlock Patients Successful"
	@ObjectiveEvidence @ReqID:3.1.2.5	
Scenario: T35_Verify the XML Data evented out for the Unlocked Multiple Patient from Datalabs UI
	Given I save the Event XML data in "UnlockMultiPatientOneFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%Description="Patient State"%'+(Select SubjectKey from Patient where PatientIdentity = '02-PAT')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UnlockMultiPatientOneFromUIExpected.xml" available in the project folder.
	And I have the XML file "UnlockMultiPatientOneFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |

	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T36_Verify the XML Data evented out for the Unlocked Multiple Patient from Datalabs UI
	Given I save the Event XML data in "UnlockMultiPatientTwoFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%Description="Patient State"%'+(Select SubjectKey from Patient where PatientIdentity = '03-PAT')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "UnlockMultiPatientTwoFromUIExpected.xml" available in the project folder.
	And I have the XML file "UnlockMultiPatientTwoFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |
		
#Thaw Patient		
Scenario: T37_Thaw the Patient
		Given I click ActionPalette Item "Thaw Patients" in "PatientSiteActions" ActionPalette
		When I select patients to Thaw in ThawPatientsPage
		| PatientID |
		| 02-PAT    |
		| 03-PAT    |
		And I click on Save button on in ThawPatientsPage
		Then I verify the success message displayed as "Thaw Patients Successful"
	@ObjectiveEvidence @ReqID:3.1.2.5	
Scenario: T38_Verify the XML Data evented out for the Thaw Patient from Datalabs UI
	Given I save the Event XML data in "ThawMultiPatientOneFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%Description="Patient State"%'+(Select SubjectKey from Patient where PatientIdentity = '02-PAT')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ThawMultiPatientOneFromUIExpected.xml" available in the project folder.
	And I have the XML file "ThawMultiPatientOneFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |	
	|         | SourceSystemVersion |

	@ObjectiveEvidence @ReqID:3.1.2.5
Scenario: T39_Verify the XML Data evented out for the Thaw Patient from Datalabs UI
	Given I save the Event XML data in "ThawMultiPatientTwoFromUIActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 4 and XmlMessage like '%Description="Patient State"%'+(Select SubjectKey from Patient where PatientIdentity = '03-PAT')+'%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ThawMultiPatientTwoFromUIExpected.xml" available in the project folder.
	And I have the XML file "ThawMultiPatientTwoFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | SourceID         |
	|         | FileOID          |					
	|         | SourceSystemVersion |
