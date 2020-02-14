Feature: DataLabs_V5.7.0_ODM Eventing for SignatureStatusUpdate

Test Summary:
	1. Verification of ODM eventing for request signature.
	2. Verification of ODM eventing for cancel signature.
	3. Verification of ODM eventing for Signn signature.
	4. Verification of ODM eventing for Reject signature.
	5. Verification of ODM eventing for Off signature.
	6. Verification of ODM eventing for change signature.

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_QUER_Base study V1.zip" with study label "V1"
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

Scenario: T09_Navigate to Patient and submit the form Form1 in visit (Week2)
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt				 | AnswerValue | AnswerFieldType |
	| Sample text question:			 | Text        | TextBox         |
	| Sample select question:		 | No          | ListBox         |
	| Sample radio question:		 | Yes         | Radio	         |
	| Sample integer question:		 | 12          | TextBox         |
	| Sample float question:		 | 12.35       | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T10_Request signature for form1 in visit Week2 event.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName |
	| Visit (Week 2) | Form1    |
	And I click on Submit button in RequestSignaturePage
	Then I see success message "CRF for Signature Saved Successful"	

	@ObjectiveEvidence @ReqID:3.1.3.5,3.1.3.6
Scenario: T11_Verify the XML file for request signature form in week2.
	Given I save the Event XML data in "SignatureStatusUpdateActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 10 and XmlMessage like '%StudyEventData StudyEventOID="Visit02"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SignatureStatusUpdateExpected1.xml" available in the project folder.
	And I have the XML file "SignatureStatusUpdateActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T12_Request signature for multiple forms in the same event.
	When I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName |
	| Visit (Week 2) | Form 2   |
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName |
	| Visit (Week 2) | Form 3   |
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName |
	| Visit (Week 2) | Form 4   |
	And I click on Submit button in RequestSignaturePage
	Then I see success message "CRF for Signature Saved Successful"	

	@ObjectiveEvidence @ReqID:3.1.3.5,3.1.3.6
Scenario: T13_Verify the XMl file for request signature for multipple forms in single event.
	Given I save the Event XML data in "SignatureStatusUpdateActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 10 and XmlMessage like '%StudyEventData StudyEventOID="Visit02"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SignatureStatusUpdateExpected2.xml" available in the project folder.
	And I have the XML file "SignatureStatusUpdateActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T14_Request Signature for multiple forms in multiple events.
	When I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName     |
	| Visit (Week 2) | Form 5       |
    And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName     |
	| Visit (Week 2) | Form 6       |
    And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName     |
	| Visit (Week 3) | Demographics |
    And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName     |
	| Visit (Week 3) | Vital Signs  |
    And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName     |
	| Visit (Week 4) | Form1        |
	And I click on Submit button in RequestSignaturePage
	Then I see success message "CRF for Signature Saved Successful"	

	@ObjectiveEvidence @ReqID:3.1.3.5,3.1.3.6
Scenario: T15_Verify the XML file for request signature for multiple forms in multiple events.
	Given I save the Event XML data in "SignatureStatusUpdateActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 10 and XmlMessage like '%FormData FormOID="Form6"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SignatureStatusUpdateExpected3.xml" available in the project folder.
	And I have the XML file "SignatureStatusUpdateActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T16_Sign the Requested case book for single form in week 2 event.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I click ActionPalette Item "Sign Casebook" in "PatientPortalActions" ActionPalette
	And I select radio button for below forms in SignCasebookPage
	| EventName      | FormName | RadioButton |
	| Visit (Week 2) | Form1    | Accept      |
	And I given username as "testadmin" in SignCasebookPage
	And I given password as "Datalabs1234" in SignCasebookPage
	And I click on Submit button in SignCasebbokPage
	Then I see success message "CRFs for Casebook Saved Successful"

	@ObjectiveEvidence @ReqID:3.1.3.5,3.1.3.6
Scenario: T17_Verify the XML file for signed case book form.
	Given I save the Event XML data in "SignatureStatusUpdateActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 10 and XmlMessage like '%ItemData ItemOID="Text" Value="Text"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SignatureStatusUpdateExpected4.xml" available in the project folder.
	And I have the XML file "SignatureStatusUpdateActual4.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | SourceSystemVersion |

Scenario: T18_Update the data in the form1 week2 and verify the updated signature value.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample integer question: | 12                 | TextBox         | 1050           | DCF             | Updated Value   |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.3.5,3.1.3.6
Scenario: T19_Verify the generated XML file for updated signature and raised query on integer question.
	Given I save the Event XML data in "SignatureStatusUpdateActual5.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Integer" TransactionType="Update" Value="1050"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SignatureStatusUpdateExpected5.xml" available in the project folder.
	And I have the XML file "SignatureStatusUpdateActual5.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T20_Navigate to form3 in visit week2 and update the data.
	And I expand "Visit (Week 2)" to select and open "Form 3" CRF.
	When I click "Checkout" button on "Form 3" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date question: (Edit Check: Not Answered {Draft})  | 12/17/2018  | TextBox         |
	| Integer question (Edit Check: DataType {Draft})    | 19          | TextBox         |
	| Float question: (MaxP: 3)(Edit Check: MaxP {Sent}) | 12.32       | TextBox         |
	And I click on "Save & Close" button on "Form 3" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T21_Navigate to Patient and submit the form Form1 in visit (Week 4)
	And I expand "Visit (Week 4)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample text question:    | Sample Text | TextBox         |
	| Sample integer question: | 19          | TextBox         |
	| Sample float question:   | 12.32       | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T22_Sign the requested case book and reject the form.
    Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I click ActionPalette Item "Sign Casebook" in "PatientPortalActions" ActionPalette
	And I select radio button for below forms in SignCasebookPage
	| EventName      | FormName | RadioButton | 
	| Visit (Week 4) | Form1    | Accept      |  
	And I select radio button for below forms in SignCasebookPage
	| EventName      | FormName | RadioButton | AddReason    |
	| Visit (Week 2) | Form 3   | Reject      | Invalid data |
	And I given username as "testadmin" in SignCasebookPage
	And I given password as "Datalabs1234" in SignCasebookPage
	And I click on Submit button in SignCasebbokPage
	Then I see success message "CRFs for Casebook Saved Successful"

	@ObjectiveEvidence @ReqID:3.1.3.5,3.1.3.6
Scenario: T23_Verify the generated XML file for updated signature and rejected signature changes.
	Given I save the Event XML data in "SignatureStatusUpdateActual6.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 10 and XmlMessage like '%FormData FormOID="Form3"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SignatureStatusUpdateExpected6.xml" available in the project folder.
	And I have the XML file "SignatureStatusUpdateActual6.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | SourceSystemVersion |

Scenario: T24_Drop the signature on request signature form.
	When I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I Unselect Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName     |
	| Visit (Week 2) | Form 2       |
	And I Unselect Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName     |
	| Visit (Week 3) | Demographics |
	And I Unselect Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName     |
	| Visit (Week 3) | Vital Signs  |
	And I click on Submit button in RequestSignaturePage
	Then I see success message "CRF for Signature Saved Successful"	

	@ObjectiveEvidence @ReqID:3.1.3.5,3.1.3.6
Scenario: T25_Verify the generated XML file for updated signature cancellled.
	Given I save the Event XML data in "SignatureStatusUpdateActual7.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 10 and XmlMessage like '%StudyEventData StudyEventOID="Visit02"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SignatureStatusUpdateExpected7.xml" available in the project folder.
	And I have the XML file "SignatureStatusUpdateActual7.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | SourceSystemVersion |
	
Scenario: T26_Request signature for Form1 in week 4 event
    Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
    And I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName |
	| Visit (Week 4) | Form1    |
	And I click on Submit button in RequestSignaturePage
	Then I see success message "CRF for Signature Saved Successful"	

Scenario: T27_Reset CRf and verify for signature off forms.
	Given I expand "Visit (Week 4)" to select and open "Form1" CRF.
	When I click ActionPalette Item "Reset CRF" in "CRFAction" ActionPalette
	And I click Yes button in ResetCRFModalDialog
	And I enter reason "Reset CRF Testing" in ResetCRFModalDialog 
    And I click Continue button in ResetCRFModalDialog 
    And I navigate to "Inbox" tab from main menu. 
	Then I check subjects in inbox folder "Jobs" 
    | Subject                                                                       |
    | CRF Reset - Visit (Week 4)/Form1 for patient 01-PAT - COMPLETE. View Summary. |

	@ObjectiveEvidence @ReqID:3.1.3.5,3.1.3.6
Scenario: T28_Verify the generated XML file for signature off on form.
	Given I save the Event XML data in "SignatureStatusUpdateActual8.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Text" TransactionType="Update" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "SignatureStatusUpdateExpected8.xml" available in the project folder.
	And I have the XML file "SignatureStatusUpdateActual8.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | SourceSystemVersion |

Scenario: T29_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 
 
