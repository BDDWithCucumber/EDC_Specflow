Feature: DataLabs_V5.7.0_ODMEventingforFormStatusUpdatewithPSO
	
	Test Summary:
	1. Verification of ODM eventing for submitted form status.
	2. Verification of ODM eventing for incompleted form status.
	3. Verification of ODM eventing for patient status over ride for unpublished forms.


Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_FoStUPD_Base study V1.Zip" with study label "Test4500"
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

Scenario: T07_Select and enroll patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 06/13/2018 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: T08_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

##########  Update the form with fully submitted ########################################
Scenario: T09_Navigate to Patient and submit the form (Form1) in visit (Week2)
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt				 | AnswerValue | AnswerFieldType |
	| Sample text question:			 | Text        | TextBox         |
	| Sample select question:		 | No          | ListBox         |
	| Sample radio question:		 | Yes         | Radio	         |
	| Sample integer question:		 | 12          | TextBox         |
	| Sample float question:		 | 12.345      | TextBox         |
	| Sample date question:			 | 09/08/1998  | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T10_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStatusUpdateActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Text" TransactionType="Insert" Value="Text"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStatusUpdateExpected1.xml" available in the project folder.
	And I have the XML file "FormStatusUpdateActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

######   Update the Form with Saved Incomplete Status ###############

Scenario: T11_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T12_Navigate to Patient and save(Incomplete) the form (Form1) in visit (Week2)
	And I expand "Visit (Week 4)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt				 | AnswerValue | AnswerFieldType |
	| Sample text question:			 | Text Val    | TextBox         |
	| Sample select question:		 | Yes         | ListBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T13_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStatusUpdateActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Text" TransactionType="Insert" Value="Text Val"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStatusUpdateExpected2.xml" available in the project folder.
	And I have the XML file "FormStatusUpdateActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

#############  Update the form from fully submitted to Saved Incomplete status  ######################

Scenario: T14_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T15_Navigate to patient and update the form status from submitted to Incomplete(Clear item for Text question)
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I clear question "Sample text question:".
	And I enter notes "Clear Sample text question Value" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Sample text question: | [Blank]     | Text            |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T16_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStatusUpdateActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="Text" TransactionType="Update" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStatusUpdateExpected3.xml" available in the project folder.
	And I have the XML file "FormStatusUpdateActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

	##################  Update the Saved incomplete form status to fully submitted status ########################################

	Scenario: T17_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T18_Navigate to Patient and form status from Incomplete to Submitted
	And I expand "Visit (Week 4)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt				 | AnswerValue | AnswerFieldType |
	| Sample radio question:		 | No          | Radio	         |
	| Sample integer question:		 | 19          | TextBox         |
	| Sample float question:		 | 11.367      | TextBox         |
	| Sample date question:			 | 09/05/1999  | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T19_Verify questions data of flat questions in completely submitted CRF.
	Given I expand "Visit (Week 4)" to select and open "Form1" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt				 | AnswerValue | AnswerFieldType |
	| Sample text question:			 | Text Val    | Text	         |
	| Sample select question:		 | Yes         | Text	         |
	| Sample radio question:		 | No          | Text	         |
	| Sample integer question:		 | 19          | Text		     |
	| Sample float question:		 | 11.367      | Text		     |
	| Sample date question:			 | 09/05/1999  | Text			 |
	And I click on "Cancel" button on "Form1" CRF.

	@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T20_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStatusUpdateActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="Radio" TransactionType="Insert" Value="2"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStatusUpdateExpected4.xml" available in the project folder.
	And I have the XML file "FormStatusUpdateActual4.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T21_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

############### Forms Unpublished on Patient Status Override (Enrolled to screened) ########################################

Scenario: T22_Override the patient status from Enrolled to Screened for patient 01-PAT
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Given I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
	And I select change to "Screened" in PatientStatusOverridePage
	And I enter reason "Status override from Enrolled to Screened" for patient status change in PatientStatusOverridePage
	And I Click save button in PatientStatusOverridePage
	Then I see success message "Status Override Changed Successfully."

	@ObjectiveEvidence @ReqID:3.1.3.1,3.1.3.2
Scenario: T23_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStatusUpdateActual5.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity = '01-Pat') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStatusUpdateExpected5.xml" available in the project folder.
	And I have the XML file "FormStatusUpdateActual5.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T24_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 