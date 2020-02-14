Feature: DataLabs_V5.7.0_ODMforQueryWithMajorandMinorStudyUpdate

Test Summary:
	1. Verification of ODM eventing for Query created on item update.
	2. Verification of ODM eventing for Query Response on item update.
	3. Verification of ODM eventing for query created on form(Manual Query).
	4. Verification of ODM eventing for query created on item in form(Manual Query).
	5. Verification of ODM eventing for query status update (Sent,Viewed,Closed,Requery,Resolved).
	6. Verification of ODM eventing for Custom fields add.
	7. Verification of ODM eventing for Custom fields update.
	8. Verification of ODM eventing for custom fields off.
	9. Verification of ODM eventing for query response on manual query.
	10. Verification of ODM eventing for query category and status update.
	11. Verification of ODM eventing for query created on L4 and L5 queries.
	12. Verification of ODM eventing for query update on minor study update.
	13.Verification of ODM eventing for query  update on major study update.

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
	Then I see success message "Save Successful"
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

Scenario: T08_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T09_Navigate to Form1 in visit screening event and update the data for integer question
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt				 | AnswerValue | AnswerFieldType |
	| Sample integer question:		 | 1050        | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T10_Verify the XML For raised system query for integer question
	Given I save the Event XML data in "QueryCreateActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="Integer" TransactionType="Insert" Value="1050"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected1.xml" available in the project folder.
	And I have the XML file "QueryCreateActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T11_Update the integer question and verify the closed query details
	Given I navigate to "Patients" tab from main menu.	
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
		| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes          |
		| Sample integer question: | 1050               | TextBox         | 14             | DCF             | Updated Value            |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T12_Verify the generated XML file for closed queries.
	Given I save the Event XML data in "QueryCreateActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Integer" TransactionType="Update" Value="14"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected2.xml" available in the project folder.
	And I have the XML file "QueryCreateActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T13_Update the date question in form1 in visit screening
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt				 | AnswerValue    | AnswerFieldType |
	| Sample date question:		     | 12/10/2018     | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.
	
	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T14_Verify the generated XML for date question update
	Given I save the Event XML data in "QueryCreateActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Date" TransactionType="Insert" Value="12/10/2018"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected3.xml" available in the project folder.
	And I have the XML file "QueryCreateActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T15_Update the date question and verify the closed query and raised the same queries details
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
		| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes          |
		| Sample date question:    | 12/10/2018         | TextBox         | 08/26/2005     | DCF             | Updated date             |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T16_Verify the generated XML file for closed and Created queries.
	Given I save the Event XML data in "QueryCreateActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Date" TransactionType="Update" Value="08/26/2005"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected4.xml" available in the project folder.
	And I have the XML file "QueryCreateActual4.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T17_update the status from sent to viewed on opening the existing query
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription                                                         |
	|       | Sent   | Q6: Value is not within the expected normal range (1/1/1950 to 1/1/2000) |     
	Then I see header details in EditDCFPage
	| DCFStatus |
	| Viewed    |

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T18_Verify the XML for updated status from sent to Viewed query details
	Given I save the Event XML data in "QueryCreateActual5.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%ItemData ItemOID="Date" Value="08/26/2005"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected5.xml" available in the project folder.
	And I have the XML file "QueryCreateActual5.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |		
	|         | SourceSystemVersion |
	
Scenario: T19_Create Manual DCF through actions at form level and check in DCF tab for created DCF
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click ActionPalette Item "Create DCF" in "CRFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription                   | ActionRequest          |
	| Draft     | Please enter the value.            | Please Verify.         |
	And I click save button in CreateDCFDialog
	Then I see success message "Dcf Create Successful"
	
	@ObjectiveEvidence @ReqID:3.1.5.3,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T20_Verify the XML for updated status from sent to Viewed query details
	Given I save the Event XML data in "QueryCreateActual6.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%Description="Please enter the value." Request="Please Verify."%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected6.xml" available in the project folder.
	And I have the XML file "QueryCreateActual6.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |		
	|         | SourceSystemVersion |

Scenario: T21_Create DCF on question level for sample text question in visit screening form1
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click icon "icon_createdcf.png" for the flat question "Sample text question:" in CRF
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription                    | ActionRequest                               |
	| Draft     | Enter the correct value.            | Please Verify and update the value.         |
	And I click save button in CreateDCFDialog
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.5.3,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T22_Verify XML file for created DCF on sample text question in visit screening form1.
	Given I save the Event XML data in "QueryCreateActual7.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%ItemData ItemOID="Text" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected7.xml" available in the project folder.
	And I have the XML file "QueryCreateActual7.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T23_Update the manual query status from draft to sent raised on sample text question in visit screening form1.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription          | 
	|       | Draft  | Enter the correct value.  |
	And I click ActionPalette Item "Send" in "DCFAction" ActionPalette
	Then I see success message "Dcf Create Successful"
	
	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T24_Verify XML file for updated status from draft to sent of sample text question query in visit screening form1.
	Given I save the Event XML data in "QueryCreateActual8.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%ItemData ItemOID="Text" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected8.xml" available in the project folder.
	And I have the XML file "QueryCreateActual8.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T25_Update the status from sent to Viewed of sample text question query in visit screening form1
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription          | 
	|       | Sent   | Enter the correct value.  |
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T26_Verify XML file for updated status from sent to viewed of sample text question query in visit screening form1.
	Given I save the Event XML data in "QueryCreateActual9.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%ItemData ItemOID="Text" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected9.xml" available in the project folder.
	And I have the XML file "QueryCreateActual9.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T27_Update the status from viewed to answer for sample text question in visit screening form1.
Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription          | 
	|       | Viewed | Enter the correct value.  |
	When I click ActionPalette Item "Answer" in "DCFAction" ActionPalette
	And I enter response "DCF answered" in AnswerDCFDialog
	And I click SaveButton in AnswerDCFDialog
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T28_Verify XML file for updated status from viewed to answered of sample text question query in visit screening form1.
	Given I save the Event XML data in "QueryCreateActual10.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%<dl:ReasonForChange>Answered</dl:ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected10.xml" available in the project folder.
	And I have the XML file "QueryCreateActual10.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T29_Close and Requery the answered query Enter the correct value from the DCF page.
Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status   | QueryDescription          | 
	|       | Answered | Enter the correct value.  |
	And I click ActionPalette Item "Re-query" in "DCFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription  | ActionRequest                  |
	| Draft     | Re-query as DRAFT | Re-query, Please Verify Value. |
	And I click save button in CreateDCFDialog
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T30_Verify XML file for updated status from answered to closed of sample text question query in visit screening form1.
	Given I save the Event XML data in "QueryCreateActual11.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%<dl:Status CodeListOID="DCF">28</dl:Status>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected11.xml" available in the project folder.
	And I have the XML file "QueryCreateActual11.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |		
	|         | SourceSystemVersion |

Scenario: T31_Add custom fields to query for sample text question query in visit screening form1
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "DCFs" in StudyEditPreferencesPage
	And I enter text "Custom1" in FieldLabelTextbox1 in StudyEditPreferencesDCFsPage
	And I click ActiveRadioButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Item1" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage
	And I click AddButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Item2" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage
	And I click AddButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Custom2" in FieldLabelTextbox2 in StudyEditPreferencesDCFsPage
	And I click ActiveRadioButton2 in StudyEditPreferencesDCFsPage
	And I enter text "Item3" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage
	And I click AddButton2 in StudyEditPreferencesDCFsPage
	And I enter text "Item4" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage
	And I click AddButton2 in StudyEditPreferencesDCFsPage
	And I click SaveButton in StudyEditPreferencesDCFsPage
	Then I verify the success message displayed as "Edit Preferences Successful"

Scenario: T32_Add the custom field items for draft query in form1 screening event.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription          | 
	|       | Draft  | Please enter the value.   |
	And I selected dropdown item "Item2" for customdropdown1 in EditDCFPage
	And I selected dropdown item "Item3" for customdropdown2 in EditDCFPage
	And I click save button in EditDCFPage
	Then I see success message "Dcf Create Successful"
	
	@ObjectiveEvidence @ReqID:3.1.5.7,3.1.5.8,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T33_Verify the added custom field items to the query.
	Given I save the Event XML data in "QueryCreateActual12.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%Description="Please enter the value." Request="Please Verify."%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected12.xml" available in the project folder.
	And I have the XML file "QueryCreateActual12.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T34_Update the status to sent from draft.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription        |
	|       | Draft  | Please enter the value. |
	And I click ActionPalette Item "Send" in "DCFAction" ActionPalette
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.7,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T35_Verify the updated status from draft to send query.
	Given I save the Event XML data in "QueryCreateActual13.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%dl:Status CodeListOID="DCF">24</dl:Status>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected13.xml" available in the project folder.
	And I have the XML file "QueryCreateActual13.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |		
	|         | SourceSystemVersion |

Scenario: T36_Update the status from sent to viewed for visit screening form1.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription        |
	|       | Sent   | Please enter the value. |
	Then I see success message "Dcf Create Successful"	

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.7,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T37_Verify XML file for updated query custom field properties of visit screening form1.
	Given I save the Event XML data in "QueryCreateActual14.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%StudyEventData StudyEventOID="Screening"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected14.xml" available in the project folder.
	And I have the XML file "QueryCreateActual14.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T38_Update the status from viewed to answered and update the custom field items.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription        |
	|       | Viewed | Please enter the value. |
	And I selected dropdown item "Item1" for customdropdown1 in EditDCFPage
	And I selected dropdown item "Item4" for customdropdown2 in EditDCFPage
	When I click ActionPalette Item "Answer" in "DCFAction" ActionPalette
	And I enter response "DCF answered for query" in AnswerDCFDialog
	And I click SaveButton in AnswerDCFDialog
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T39_Verify XML file for updated status from viewed to answered of visit screening form1.
	Given I save the Event XML data in "QueryCreateActual15.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%<dl:ReasonForChange>Answered</dl:ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected15.xml" available in the project folder.
	And I have the XML file "QueryCreateActual15.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

	@ObjectiveEvidence @ReqID:3.1.5.7,3.1.5.8,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T40_Verify XML file for updated custom field items.
	Given I save the Event XML data in "QueryCreateActual16.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%<dl:ReasonForChange>Answered</dl:ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected16.xml" available in the project folder.
	And I have the XML file "QueryCreateActual16.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T41_Update the status to closed and off the custom fields.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "DCFs" in StudyEditPreferencesPage
	And I click InactiveRadioButton1 in StudyEditPreferencesDCFsPage
	And I click InactiveRadioButton2 in StudyEditPreferencesDCFsPage
	And I click SaveButton in StudyEditPreferencesDCFsPage
	Then I see success message "Dcf Create Successful"

Scenario: T42_Update the status from answered to Closed for visit screening form1 query.
Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I select the DCF row 
	| DCFID | Status   | QueryDescription          | 
	|       | Answered | Please enter the value.   |
	When I click ActionPalette Item "Close" in "DCFAction" ActionPalette
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T43_Verify XML file for updated status from answered to Closed of visit screening form1.
	Given I save the Event XML data in "QueryCreateActual17.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%<dl:ReasonForChange>Closed</dl:ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected17.xml" available in the project folder.
	And I have the XML file "QueryCreateActual17.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T44_Create query with New status on updating site settings.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I edit site and Save in SiteDetailsPage
	| DCFWorkflow |
	| Paper       |	
	Then I see site "01-Site" in SiteManagementPage

Scenario: T45_Update the integer question for to raise a query with status "New"
	Given I navigate to "Patients" tab from main menu.	
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
		| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes          |
		| Sample integer question: | 14                 | TextBox         | 1080           | SOR             | Updated Value1           |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

		@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T46_Verify XML file for updated status from answered to Closed of visit screening form1.
	Given I save the Event XML data in "QueryCreateActual18.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Integer" TransactionType="Update" Value="1080"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected18.xml" available in the project folder.
	And I have the XML file "QueryCreateActual18.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T47_Update the status from Sent to New from site settings.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I edit site and Save in SiteDetailsPage
	| DCFWorkflow      |
	| Electronic       |	
	Then I see site "01-Site" in SiteManagementPage

Scenario: T48_Create L4 query on updating two forms of data (AB_date query) and update auto build form07.
	Given I navigate to "Patients" tab from main menu.	
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 53)" to select and open "AutoBuild Form07" CRF.
	When I click "Checkout" button on "AutoBuild Form07" CRF.
	And I enter below "Key Sequence is on questions #1 & #3. Maximum Row is exactly 8. Table Structure is open.:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                                        | AnswerValue       | AnswerFieldType | RowButtonToClick |
	| No        | 1         | What Color is it?													    | Red			    | ListBox         |                  |
	| No        | 1         | Date (Condition - Q1 is not equal to "Not Applicable")                | 08/26/1990        | TextBox         | Save & Close Row |
	And I click on "Save & Close" button on "AutoBuild Form07" CRF.
	Then I see success message "Dcf Create Successful"

Scenario: T49_Update the data in autobuild form06 in visit week 53.
	And I expand "Visit (Week 53)" to select and open "AutoBuild Form06" CRF.
	When I click "Checkout" button on "AutoBuild Form06" CRF.
	And I enter below "Key Sequence is on questions #1 & #2. Maximum Table Rows is 25:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt   | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Date Field:&#x20 | 08/26/1990  | TextBox         | Save & Close Row |
	And I click on "Save & Close" button on "AutoBuild Form06" CRF.
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.4.5,3.1.4.6,3.1.5.3,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T50_Verify XML file for created L4 query on visit week 53 auto build form 06 and 07.
	Given I save the Event XML data in "QueryCreateActual19.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%ItemData ItemOID="AB_Date11" Value="08/26/1990"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected19.xml" available in the project folder.
	And I have the XML file "QueryCreateActual19.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T51_update the data in visit screening form1.
	Given I navigate to "Patients" tab from main menu.	
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt				 | AnswerValue | AnswerFieldType |
	| Sample float question:		 | 1234        | TextBox         |	
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13
Scenario: T52_verify the XML file for generated query against float question in form1.
	Given I save the Event XML data in "QueryCreateActual20.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Float" TransactionType="Insert" Value="1234"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected20.xml" available in the project folder.
	And I have the XML file "QueryCreateActual20.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |			
	|         | QueryOID         |
	|         | SourceSystemVersion |

########################      Study Update Major scenarios:   ##########################################

Scenario: T53_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_QUER_Major study Update V2.zip" with Label "V2"
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

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13.,3.1.6.10,3.1.6.1
Scenario: T54_verify the XML file for generated query against float question in form1.
	Given I save the Event XML data in "QueryCreateActual21.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Float" TransactionType="Update" Value="1234"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected21.xml" available in the project folder.
	And I have the XML file "QueryCreateActual21.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T55_update query category status and query deactivate study update major.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_QUER_Major study Update V3.zip" with Label "V3"
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

	@ObjectiveEvidence @ReqID:3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13,3.1.5.14,3.1.6.10,3.1.6.1
Scenario: T56_verify the XML file for generated query against float question in form1.
	Given I save the Event XML data in "QueryCreateActual22.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="AB_Date11" TransactionType="Update" Value="08/26/1990"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected22.xml" available in the project folder.
	And I have the XML file "QueryCreateActual22.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |		
	|         | SourceSystemVersion |

Scenario: T57_Update the query category to OFF and verify the XML file.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_QUER_Major study Update V4.zip" with Label "V4"
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

	@ObjectiveEvidence @ReqID:3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13,3.1.5.14,3.1.6.10,3.1.6.1
Scenario: T58_verify the XML file for generated query category status to off.
	Given I save the Event XML data in "QueryCreateActual23.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="AB_Date11" TransactionType="Update" Value="08/26/1990"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected23.xml" available in the project folder.
	And I have the XML file "QueryCreateActual23.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T59_Activate the query and verify the raised query.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_QUER_Major study Update V5.zip" with Label "V5"
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

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13,3.1.6.10,3.1.6.1
Scenario: T60_verify the XML file for generated query on integer question in form1.
	Given I save the Event XML data in "QueryCreateActual24.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="AB_Date11" TransactionType="Update" Value="08/26/1990"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected24.xml" available in the project folder.
	And I have the XML file "QueryCreateActual24.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T61_Create Manual DCF through actions at form level and check in DCF tab for created DCF
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click ActionPalette Item "Create DCF" in "CRFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription                      | ActionRequest                  |
	| Draft     | Please enter the value for all items. | Please Verify the given value. |
	And I click save button in CreateDCFDialog
	Then I see success message "Dcf Create Successful"

	@ObjectiveEvidence @ReqID:3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13,3.1.5.14,3.1.6.10,3.1.6.1
Scenario: T62_verify the XML file for added query category for manual query.
	Given I save the Event XML data in "QueryCreateActual25.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%FormData FormOID="Form1"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected25.xml" available in the project folder.
	And I have the XML file "QueryCreateActual25.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

###########################    Study update minor Scenarios :	########################################

Scenario: T63_Update study with minor updates as updated description, action request and added query category status.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_QUER_Minor study Update V1.zip" with Label "V6"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select scripting "Queries" in PublishStudyPage of MinorStudyUpdate
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                   |
	| Queries: #1 - complete. View summary.     |
	| Publishing of Study file (V6) - complete. |

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13.,3.1.6.10,3.1.6.1
Scenario: T64_verify the XML file for generated query on integer question in form1.
	Given I save the Event XML data in "QueryCreateActual26.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Date" Value="08/26/2005"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected26.xml" available in the project folder.
	And I have the XML file "QueryCreateActual26.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13.,3.1.6.10,3.1.6.1
Scenario: T65_verify the XML file for generated query on integer question in form1.
	Given I save the Event XML data in "QueryCreateActual27.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%ItemData ItemOID="Float" Value="1234"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected27.xml" available in the project folder.
	And I have the XML file "QueryCreateActual27.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T66_Update study with minor updates as deactivated the query and updated query category status.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_QUER_Minor study Update V2.zip" with Label "V7"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select scripting "Queries" in PublishStudyPage of MinorStudyUpdate
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                   |
	| Queries: #2 - complete. View summary.     |
	| Publishing of Study file (V7) - complete. |

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13.,3.1.6.10,3.1.6.1
Scenario: T67_verify the XML file for generated query on integer question in form1.
	Given I save the Event XML data in "QueryCreateActual28.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID="Integer" Value="1080"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected28.xml" available in the project folder.
	And I have the XML file "QueryCreateActual28.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

	@ObjectiveEvidence @ReqID:3.1.5.1,3.1.5.2,3.1.5.4,3.1.5.5,3.1.5.6,3.1.5.8,3.1.5.9,3.1.5.10,3.1.5.11,3.1.5.12,3.1.5.13.,3.1.6.10,3.1.6.1
Scenario: T68_verify the XML file for generated query on integer question in form1.
	Given I save the Event XML data in "QueryCreateActual29.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 17 and XmlMessage like '%ItemData ItemOID="AB_Date12" Value="08/26/1990"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "QueryCreateExpected29.xml" available in the project folder.
	And I have the XML file "QueryCreateActual29.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T69_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 

############################################################################  END ######################################################################































































































































































































































































