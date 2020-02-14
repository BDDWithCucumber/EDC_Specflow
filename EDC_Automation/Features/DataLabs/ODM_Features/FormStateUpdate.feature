Feature: DataLabs_V5.7.0_ODM Eventing for FormStateUpdate

	Test Summary:
	1. Verification of ODM eventing xml for Form State Update to Freeze
	2. Verification of ODM eventing xml for Form State Update to Thaw
	3. Verification of ODM eventing xml for Form State Update to Freeze on Mutliple CRFs
	4. Verification of ODM eventing xml for Form State Update to Thaw on Multiple CRFs
	

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_ODM_Eventing_Base.Zip" with study label "Test4500"
	And I navigate to "Patients" tab from main menu.
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                         |
         | Publishing of Study file (Test4500) - complete. |

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
	When I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Complete" for Default Save: in StudyEditPreferencesFormsPage.
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

Scenario: T08_Select Visit (Week 2) - Form1 and Submit the form in Patient 01-PAT
	When I click breadcrumb "All Patients"
	And I select "01-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt           | AnswerValue | AnswerFieldType |
         | Sample text question:    | Text        | Textbox         |
         | Sample select question:  | Yes         | Listbox         |
         | Sample radio question:   | Yes         | RadioButton     |
         | Sample integer question: | 10          | Textbox         |
         | Sample float question:   | 11.11       | Textbox         |
         | Sample date question:    | 09/04/1992  | Textbox         |
	And I enter below "Sample Table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         | Yes       | 1         | Drug Name:     | DrugText    | Textbox         |                  |
         | No        | 1         | Stop Date:     | DateText    | Textbox         | Save & Close Row |
	And I select "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T09_Select Visit (Week 2) - Form1 and Select Freeze CRF link
	When I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I click ActionPalette Item "Freeze CRF" in "CRFAction" ActionPalette
	Then I verify the success message displayed as "CRF Frozen"

	@ObjectiveEvidence @ReqID:3.1.3.3,3.1.3.4
Scenario: T10_Verify the Form State is evented out when CRF is Frozen
	Given I save the Event XML data in "FormStateCRFFreezeActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 7 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStateCRFFreezeExpected.xml" available in the project folder.
	And I have the XML file "FormStateCRFFreezeActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T11_Select Thaw CRF
	When I click ActionPalette Item "Thaw CRF" in "CRFAction" ActionPalette
	Then I verify the success message displayed as "CRF Thawed"

	@ObjectiveEvidence @ReqID:3.1.3.3,3.1.3.4
Scenario: T12_Verify the Form State is evented out when CRF is Thawed
	Given I save the Event XML data in "FormStateCRFThawedActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 7 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStateCRFThawedExpected.xml" available in the project folder.
	And I have the XML file "FormStateCRFThawedActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T13_Navigate to site and patient and freeze the form (Form1) in Screening event
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I click ActionPalette Item "Freeze CRFs" in "PatientPortalActions" ActionPalette
	And I select Freeze checkbox for below forms in FreezeCRFsPage
	| EventName			 | FormName |
	| Visit (Screening)  | Form1    |	
	And I click on "Freeze" button in FreezeCRFsPage
	Then I see success message "Freeze CRF Successful"
	
	@ObjectiveEvidence @ReqID:3.1.3.3,3.1.3.4
Scenario: T14_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStateSingleCRFFreezeActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 7 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStateSingleCRFFreezeExpected.xml" available in the project folder.
	And I have the XML file "FormStateSingleCRFFreezeActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T15_Navigate to site and patient and Thaw the form (Form1) in Screening event
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I click ActionPalette Item "Thaw CRFs" in "PatientPortalActions" ActionPalette
	And I select Thaw checkbox for below forms in ThawCRFsPage
	| EventName			 | FormName |
	| Visit (Screening)  | Form1    |	
	And I click on "Thaw" button in ThawCRFsPage
	Then I see success message "Thaw CRF Successful"
	
	@ObjectiveEvidence @ReqID:3.1.3.3,3.1.3.4
Scenario: T16_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStateSingleCRFThawedActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 7 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStateSingleCRFThawedExpected.xml" available in the project folder.
	And I have the XML file "FormStateSingleCRFThawedActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T17_Navigate to patient and freeze multile forms(Form1,Demographics RTSM) in Screening event
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I click ActionPalette Item "Freeze CRFs" in "PatientPortalActions" ActionPalette
	And I select Freeze checkbox for below forms in FreezeCRFsPage
	| EventName			 | FormName			    |
	| Visit (Screening)  | Form1			    |	
	| Visit (Screening)  | Demographics RTSM    |
	And I click on "Freeze" button in FreezeCRFsPage
	Then I see success message "Freeze CRF Successful"
	@ObjectiveEvidence @ReqID:3.1.3.3,3.1.3.4
Scenario: T18_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStateMultipleCRFsFreezeActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 7 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStateMultipleCRFsFreezeExpected.xml" available in the project folder.
	And I have the XML file "FormStateMultipleCRFsFreezeActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T19_Navigate to patient and Thaw multile forms(Form1,Demographics RTSM) in Screening event
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I click ActionPalette Item "Thaw CRFs" in "PatientPortalActions" ActionPalette
	And I select Thaw checkbox for below forms in ThawCRFsPage
	| EventName				 | FormName				    |
	| Visit (Screening)		 | Form1				    |	
	| Visit (Screening)		 | Demographics RTSM	    |
	And I click on "Thaw" button in ThawCRFsPage
	Then I see success message "Thaw CRF Successful"
	@ObjectiveEvidence @ReqID:3.1.3.3,3.1.3.4
Scenario: T20_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "FormStateMultipleCRFsThawedActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 7 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FormStateMultipleCRFsThawedExpected.xml" available in the project folder.
	And I have the XML file "FormStateMultipleCRFsThawedActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

###	===========================