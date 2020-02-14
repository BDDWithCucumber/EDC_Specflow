Feature: DataLabs_V5.7.0_ODM Eventing for ItemDataUpdate
	Test Summary:
	1. Verification of ODM eventing for Item Update on Flat Questions
	2. Verification of ODM eventing for Item Update on table Questions
	3. Verification of ODM eventing for Item Update on Mark Not Answered
	4. Verification of ODM eventing for Item Update on Clear Item
	5. Verification of ODM eventing for Item Update on Restore table row
	6. Verification of ODM eventing for Item Update on CDISC Webservice
	7. Verification of ODM eventing for Item Update on Status forms and non status forms

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_ItemUpdateVerification.Zip" with study label "Test4500"
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
	| 01       | PAT             | <Today>    |
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

Scenario: T08_Fill flat questions in Form1 and submit partially
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt          | AnswerValue | AnswerFieldType |
	| Sample text question:   | Test        | TextBox         |
	| Sample select question: | Yes         | ListBox         |
	| Sample radio question:  | No          | Radio           |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	#Partial Submit Data for Item Update
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.2,3.1.4.3
Scenario: T09_Verify the XML Data evented out for the partially submitted form data from Datalabs UI
	Given I save the Event XML data in "ItemUpdateFlatQuestionsActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%TransactionType="Insert" Value="Test"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateFlatQuestionsExpected1.xml" available in the project folder.
	And I have the XML file "ItemUpdateFlatQuestionsActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T10_Update the form by filling unanswered flat questions in Form1 and submit partially
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample integer question: | 12          | TextBox         |
	| Sample date question:    | 08/17/1999  | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	# Partial Submit Other questions
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.2,3.1.4.3
Scenario: T11_Verify the XML Data evented out for the partially submitted form data from Datalabs UI
	Given I save the Event XML data in "ItemUpdateFlatQuestionsActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Date" TransactionType="Insert" Value="08/17/1999"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateFlatQuestionsExpected2.xml" available in the project folder.
	And I have the XML file "ItemUpdateFlatQuestionsActual2.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |


Scenario: T12_Submit the Form1 completely
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

	# Form Fully Submit
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.2,3.1.4.3
Scenario: T13_Verify the XML Data evented out for the completely submitted form data from Datalabs UI
	Given I save the Event XML data in "ItemUpdateFlatQuestionsActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Float" TransactionType="Insert" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateFlatQuestionsExpected3.xml" available in the project folder.
	And I have the XML file "ItemUpdateFlatQuestionsActual3.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T14_Submit the blank Demographics completely
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I click "Check out" button on "Demographics" CRF.
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully.

	# New Form Fully Submit
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.2,3.1.4.3
Scenario: T15_Verify the XML Data evented out for the completely submitted with no data from Datalabs UI
	Given I save the Event XML data in "ItemUpdateFlatQuestionsActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="BRTHDT" TransactionType="Insert" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateFlatQuestionsExpected4.xml" available in the project folder.
	And I have the XML file "ItemUpdateFlatQuestionsActual4.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T16_Update the form by filling unanswered flat questions in Form1 and submit
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Check out" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt         | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample float question: | [Blank]            | TextBox         | 11.09          | SOR             | Test            |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.2,3.1.4.3
Scenario: T17_Verify the XML Data evented out for updating the submitted data from Datalabs UI
	Given I save the Event XML data in "ItemUpdateFlatQuestionsActual5.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Float" TransactionType="Update" Value="11.09"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateFlatQuestionsExpected5.xml" available in the project folder.
	And I have the XML file "ItemUpdateFlatQuestionsActual5.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T18_Update the form by filling table questions in Form1 and submit
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below "Sample Table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Drug Name:     | Test Drug 1 | TextBox         |                  |
	| No        | 1         | Condition:     | Initial     | TextBox         |                  |
	| No        | 1         | Start Date:    | 01/01/2000  | TextBox         | Save & Close Row |
	| Yes       | 2         | Drug Name:     | Test Drug 2 | TextBox         |                  |
	| N0        | 2         | Start Date:    | 01/01/2010  | TextBox         | Save & Close Row |
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.4,3.1.4.6
Scenario: T19_Verify the XML Data evented out for adding table row #1 in Form1 from Datalabs UI
	Given I save the Event XML data in "ItemUpdateTableQuestionsActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="T_Text1" TransactionType="Insert" Value="Test Drug 1"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateTableQuestionsExpected1.xml" available in the project folder.
	And I have the XML file "ItemUpdateTableQuestionsActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.4,3.1.4.6
Scenario: T20_Verify the XML Data evented out for adding table row #2 in Form1 from Datalabs UI
	Given I save the Event XML data in "ItemUpdateTableQuestionsActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="T_Text1" TransactionType="Insert" Value="Test Drug 2"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateTableQuestionsExpected2.xml" available in the project folder.
	And I have the XML file "ItemUpdateTableQuestionsActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T21_Submit Form1 completely to submit unfilled table questions
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.4,3.1.4.6
Scenario: T22_Verify the XML Data evented out for submitting Form1 from Datalabs UI
	Given I save the Event XML data in "ItemUpdateTableQuestionsActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="T_S2Date" TransactionType="Insert" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateTableQuestionsExpected3.xml" available in the project folder.
	And I have the XML file "ItemUpdateTableQuestionsActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T23_Mark not answered and clear flat questions in Form1
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I click icon "icon_mna_disabled.png" for the flat question "Sample text question:" in CRF
    And I enter comments "MNA Comments for Q1" in MarkItemDialog
	And I click ok button in MarkItemDialog
	And I click icon "icon_mna_disabled.png" for the flat question "Sample radio question:" in CRF
	And I enter comments "MNA Comments for Q3" in MarkItemDialog
	And I click ok button in MarkItemDialog
	And I click ClearItem for the flat question "Sample select question:"
	And I enter notes "Clearing item for Q2" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	Then I see icon "icon_mna.png" against question "Sample text question:"
	And I see icon "icon_mna.png" against question "Sample radio question:"
	And I click on "Save & Close" button on "Form1" CRF.
	
	@ObjectiveEvidence @ReqID:3.1.4.2,3.1.4.3
Scenario: T24_Verify the XML Data evented out for MNA and clearing flat questions from Datalabs UI
	Given I save the Event XML data in "MNAClearItemFlatQuestionsActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="Text" TransactionType="Update" Value=""%<ReasonForChange>Marked Not Answered</ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "MNAClearItemFlatQuestionsExpected1.xml" available in the project folder.
	And I have the XML file "MNAClearItemFlatQuestionsActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T25_Mark not answered and clear table questions in Form1
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I expand row "2" of table "Sample Table:"
	And I click "icon_mna_disabled.png" icon of a question "Drug Name:" of table "Sample Table:"
	And I enter comments "Marking not answered for Q7.2.1" in MarkItemDialog
	And I click ok button in MarkItemDialog
	And I clear question "Start Date:" of table "Sample Table:"
	And I enter notes "Clearing item for Q7.2.3" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click table row button "Save & Close Row" of table "Sample Table:"
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	@ObjectiveEvidence @ReqID:3.1.4.2,3.1.4.3
Scenario: T26_Verify the XML Data evented out for MNA and clearing table questions from Datalabs UI
	Given I save the Event XML data in "MNAClearItemTableQuestionsActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="T_Text1" TransactionType="Update" Value=""%<ReasonForChange>Marked Not Answered</ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "MNAClearItemTableQuestionsExpected1.xml" available in the project folder.
	And I have the XML file "MNAClearItemTableQuestionsActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T27_Delete table row question #1 from Form1
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I expand row "1" of table "Sample Table:"
	And I click table row button "Delete Row" of table "Sample Table:"
	And I select reason for change "SEC" in DeleteTableRowModalDialog
	And I enter additional notes "Deleting Row#1" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.4,3.1.4.6
Scenario: T28_Verify the XML Data evented out for deleting table row questions from Datalabs UI
	Given I save the Event XML data in "DeleteTableRowActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%<ReasonForChange>Row # 1: Deleted (SEC)</ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "DeleteTableRowExpected1.xml" available in the project folder.
	And I have the XML file "DeleteTableRowActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |
	
Scenario: T29_Restore the table row question #1 from Form1
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I expand row "1" of table "Sample Table:"
	And I click table row button "Restore Row" of table "Sample Table:"
	And I select reason for change "SEC" in RestoreTableRowModalDialog
	And I enter additional notes "Restoring Row#1" in RestoreTableRowModalDialog
	And I click continue button in RestoreTableRowModalDialog
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.4,3.1.4.6
Scenario: T30_Verify the XML Data evented out for Restore table row questions from Datalabs UI
	Given I save the Event XML data in "RestoreTableRowActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%<ReasonForChange>Row # 1: Deleted (SEC)</ReasonForChange>%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "RestoreTableRowExpected1.xml" available in the project folder.
	And I have the XML file "RestoreTableRowActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |
	
Scenario: T31_Select Visit (Week 5) - Form1 and Submit the form
	Given I expand "Visit (Week 5)" to select and open "Form1" CRF.
	When I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt           | AnswerValue | AnswerFieldType |
         | Sample text question:    | Text        | Textbox         |
         | Sample select question:  | Yes         | Listbox         |
         | Sample radio question:   | Yes         | RadioButton     |
         | Sample integer question: | 5           | Textbox         |
         | Sample float question:   | 16.66       | Textbox         |
         | Sample date question:    | 09/04/1992  | Textbox         |
	And I enter below "Sample Table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         | Yes       | 1         | Drug Name:     | DrugName    | TextBox         |                  |
         | No        | 1         | Condition:     | Condition   | TextBox         |                  |
         | No        | 1         | Start Date:    | 09/04/1992  | TextBox         |                  |
         | No        | 1         | Stop Date:     | 09/04/1992  | TextBox         | Save & Close Row |
	And I select "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.
	@ObjectiveEvidence @ReqID:3.1.4.2,3.1.4.3
Scenario: T32_Verify the XML Data evented out for Item update Form Fully Submitted with DCFs from Datalabs UI
	Given I save the Event XML data in "ItemUpdateFullySubmitWithDCFActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="Integer" TransactionType="Insert" Value="5"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemUpdateFullySubmitWithDCFExpected1.xml" available in the project folder.
	And I have the XML file "ItemUpdateFullySubmitWithDCFActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T33_Flag on for the Flat Question 3 and 4 and Sign Casebook for the Form1
	Given I expand "Visit (Week 5)" to select and open "Form1" CRF.
	When I set flag for below flat questions data in the CRFs.
	| QuestionPrompt           | SD-Verify | M-Review | D-Review |
	| Sample radio question:   |           | On       |          |
	| Sample integer question: | On        |          |          |
	And I click breadcrumb "01-PAT"
	And I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I select Request checkbox for below forms in RequestSignaturePage
         | EventName      | FormName |
         | Visit (Week 5) | Form1    |
	And I click on Submit button in RequestSignaturePage
	And I click ActionPalette Item "Sign Casebook" in "PatientPortalActions" ActionPalette
	And I select radio button for below forms in SignCasebookPage
         | EventName      | FormName | Radiobutton |
         | Visit (Week 5) | Form1    | Accept      |
	And I given username as "testadmin" in SignCasebookPage
	And I given password as "Datalabs1234" in SignCasebookPage
	And I click on Submit button in SignCasebbokPage
	Then I see success message "CRFs for Casebook Saved Successful"
	
Scenario: T34_Select Reset CRF - Visit (Week 5) - Form1
	Given I expand "Visit (Week 5)" to select and open "Form1" CRF.
	When I click ActionPalette Item "Reset CRF" in "CRFAction" ActionPalette
	And I click Yes button in ResetCRFModalDialog
	And I enter reason "Reset CRF Testing" in ResetCRFModalDialog 
    And I click Continue button in ResetCRFModalDialog 
    And I navigate to "Inbox" tab from main menu. 
	Then I check subjects in inbox folder "Jobs" 
    | Subject                                                                       |
    | CRF Reset - Visit (Week 5)/Form1 for patient 01-PAT - COMPLETE. View Summary. |
	
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.2,3.1.4.3
Scenario: T35_Verify the XML Data evented out when Form is reset from Datalabs UI
	Given I save the Event XML data in "CRFResetItemUpdateActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%CRF [Reset]%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "CRFResetItemUpdateExpected1.xml" available in the project folder.
	And I have the XML file "CRFResetItemUpdateActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T36_Update the Form with CDISC WebService - ConsumeODM1_StrTransactional
	When I add item data using ConsumeODMStrTransactional webservice with below data and odmfile.
	| TransactionTypeData | AddNewPatientsData | ODMDATA                      |
	| Legacy              | true               | ODMUpdateWeekCommonForm1.xml |
	Then The response should contain success status code as "200".
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.2,3.1.4.3
Scenario: T37_Verify the XML Data evented out when an Item is updated from CDISC and DCF is created for an Item through CDISC.
	Given I save the Event XML data in "CDISCItemUpdateAndDCFCreatedActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%SubjectKey="72BC3B08-1701-45A3-AD42-9787C9D86786%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "CDISCItemUpdateAndDCFCreatedExpected1.xml" available in the project folder.
	And I have the XML file "CDISCItemUpdateAndDCFCreatedActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |

Scenario: T38_Update Enrolled form with new Enroll ID
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "02-PAT" from patients table.
	And I expand "Common" to select and open "Enrolled" CRF.
	When I click "Checkout" button on CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType |
         | Enroll ID:     | 02                 | 03             | SEC             | TextBox         |
	And I click "Save & Close" button on CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.2,3.1.4.3
Scenario: T39_Verify the Item Update is evented out when Enrolled form is updated
	Given I save the Event XML data in "StatusFormItemUpdateActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%FormData FormOID="Enroll"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StatusFormItemUpdateExpected1.xml" available in the project folder.
	And I have the XML file "StatusFormItemUpdateActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | QueryOID         |
	|         | SourceSystemVersion |
