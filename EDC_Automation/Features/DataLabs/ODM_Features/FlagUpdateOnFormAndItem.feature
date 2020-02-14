Feature: DataLabs_V5.7.0_ODM Eventing for FlagUpdateOnFormAndItem
	Test Summary:
	1. Verification of ODM eventing xml for Flag Update on Question item
	2. Verification of ODM eventing xml for Flag Update on Form
	3. Verification of ODM eventing xml for Flag Update on Required and Non Required Items
	4. Verification of ODM eventing xml for Flag Update on Mutliple CRFs
	5. Verification of ODM eventing xml for Flag Update on Data Change

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test3210_Base2_ODMStudy.Zip" with study label "TestBase"
	Then I see study label "Test3210_Query Smoke Test" in header

Scenario: T04_Create a SD Verify Plan with following DataGroups
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Flag Management" In StudyAdministrationPage
	And I select "SD-Verify" flag type from Flag Management page.
	And I click Add Plan button to create a new plan.
	And I enter Plan Name as "SDVPlan1" and label as "SDVPlanL1" on Create Plan page.
	And I click "Next" button on Create Plan page.
	And I enter Data Group Name as "SDVDG1" and Data Group label as "SDVDGL1" on Create Flag Data Group page.
	And I select checkbox for form questions in protocol version.
	| FormName         | QuestionNum | QuestionPrompt                                                                                            | ProtocolVersion |
	| Form1            | 1.          | Sample text question:                                                                                     | 1.0             |
	| Form1            | 2.          | Sample select question:                                                                                   | 1.0             |
	| Form1            | 3.          | Sample radio question                                                                                     | 1.0             |
	| Form1            | 4.          | Sample integer question:                                                                                  | 1.0             |
	| Form1            | 7.R.1.      | Drug Name:                                                                                                | 1.0             |
	| Form1            | 7.R.2.      | Condition:                                                                                                | 1.0             |
	| Form1            | 7.R.3.      | Start Date:                                                                                               | 1.0             |
	| Form1            | 7.R.4.      | Stop Date:                                                                                                | 1.0             |
	| Demographics     | 4.          | If Race is Other, Specifiy:                                                                               | 1.0             |
	| Demographics     | 4.1.        | Dictionary Term verbatim for RACEO:                                                                       | 1.0             |
	| Demographics     | 4.2.        | Encoding Type for RACEO:                                                                                  | 1.0             |
	| Demographics     | 4.3.        | RACE + RACE01 combined for reporting purposes:                                                            | 1.0             |
	| Demographics     | 5.          | If Race is Asian, is Patient of Japanese Ancestry?                                                        | 1.0             |
	| Demographics     | 6.          | Was Patient Born in Japan?                                                                                | 1.0             |
	| Demographics     | 7.          | Number of parents born in Japan:                                                                          | 1.0             |
	| Demographics     | 8.          | Number of Grandparents Born in Japan?                                                                     | 1.0             |
	| Demographics     | 8.1.        | Treatment Group Code:                                                                                     | 1.0             |
	| Demographics     | 8.2.        | Treatment Group Description:                                                                              | 1.0             |
	| Demographics     | 8.3.        | Age at Study Start:                                                                                       | 1.0             |
	| Demographics     | 8.4.        | Age Units at Study Start:                                                                                 | 1.0             |
	| Vital Signs      | 3.          | Time of Exam (24 hour clock):                                                                             | 1.0             |
	| Vital Signs      | 4.          | Time of Exam (minutes):                                                                                   | 1.0             |
	| Vital Signs      | 7.          | Waist Circumference:                                                                                      | 1.0             |
	| Vital Signs      | 8.          | Waist Circumference Units:                                                                                | 1.0             |
	| Vital Signs      | 9.          | Height:                                                                                                   | 1.0             |
	| Vital Signs      | 10.         | Height Units:                                                                                             | 1.0             |
	| Vital Signs      | 11.         | Temperature:                                                                                              | 1.0             |
	| Vital Signs      | 12.         | Temperature Units:                                                                                        | 1.0             |
	| Vital Signs      | 13.         | Temperature Method:                                                                                       | 1.0             |
	| Vital Signs      | 14.         | Systolic (mmHg):                                                                                          | 1.0             |
	| Vital Signs      | 15.         | Diastolic (mmHg):                                                                                         | 1.0             |
	| Vital Signs      | 16.         | Blood Pressure Position:                                                                                  | 1.0             |
	| Vital Signs      | 17.         | Pulse Rate (Beats/Min):                                                                                   | 1.0             |
	| Vital Signs      | 18.         | Pulse Position:                                                                                           | 1.0             |
	| Vital Signs      | 19.         | Respiratory Rate (Breaths/Min):                                                                           | 1.0             |
	| AutoBuild Form01 | 1.R.1.      | Race:                                                                                                     | 1.0             |
	| AutoBuild Form01 | 1.R.2.      | Region of Body:                                                                                           | 1.0             |
	| AutoBuild Form01 | 1.R.3.      | Gender:                                                                                                   | 1.0             |
	| AutoBuild Form01 | 2.R.1.      | Drug Name:                                                                                                | 1.0             |
	| AutoBuild Form01 | 2.R.2.      | Placebo:                                                                                                  | 1.0             |
	| AutoBuild Form01 | 2.R.3.      | Time of Day that the drug is taken:                                                                       | 1.0             |
	| AutoBuild Form01 | 2.R.4.      | Name: {Required - Sent}                                                                                   | 1.0             |
	| AutoBuild Form01 | 2.R.5.      | Enter integer value between 10 and 99999: {Normal Range - Sent} (Condition - Q2 is in list "Yes" or "No") | 1.0             |
	| AutoBuild Form01 | 2.R.6.      | Enter patient date of birth:{Not Answered - Sent} (Condition - Q2 is not equal to "No")                   | 1.0             |
	And I click "Next" button on Create Flag Data Group page.
	And I click on Save & Close button.
	Then I verify the success message displayed as "Plan saved successfully"
	
Scenario: T05_Assign Plan to Study
	When I select the "Assign Plan to Study" link on the Manage Plans & Flag Data Groups page.
	And I select "SDVPlanL1 (24%)" in the Select Plan dropdown.
	When I select "Entry correction" in Reason for change dropdown.
	When I enter text "New SDV FLag" in Additional Notes text box.
	When I click "Save" button on Assign Plan to Study page.
	Then I verify the success message displayed as "Plan assigned successfully."

Scenario: T06_Create a D Review Plan with following DataGroups
	When I click breadcrumb "Flag Management"
	And I select "M-Review" flag type from Flag Management page.
	And I click Add Plan button to create a new plan.
	And I enter Plan Name as "MRPlan1" and label as "MRPlanL1" on Create Plan page.
	And I click "Next" button on Create Plan page.
	And I enter Data Group Name as "MRDG1" and Data Group label as "MRDGL1" on Create Flag Data Group page.
	And I select checkbox for form questions in protocol version.
	| FormName         | QuestionNum | QuestionPrompt                                                                                            | ProtocolVersion |
	| Form1            | 1.          | Sample text question:                                                                                     | 1.0             |
	| Form1            | 2.          | Sample select question:                                                                                   | 1.0             |
	| Form1            | 3.          | Sample radio question                                                                                     | 1.0             |
	| Form1            | 4.          | Sample integer question:                                                                                  | 1.0             |
	| Form1            | 7.R.1.      | Drug Name:                                                                                                | 1.0             |
	| Form1            | 7.R.2.      | Condition:                                                                                                | 1.0             |
	| Form1            | 7.R.3.      | Start Date:                                                                                               | 1.0             |
	| Form1            | 7.R.4.      | Stop Date:                                                                                                | 1.0             |
	| Demographics     | 4.          | If Race is Other, Specifiy:                                                                               | 1.0             |
	| Demographics     | 4.1.        | Dictionary Term verbatim for RACEO:                                                                       | 1.0             |
	| Demographics     | 4.2.        | Encoding Type for RACEO:                                                                                  | 1.0             |
	| Demographics     | 4.3.        | RACE + RACE01 combined for reporting purposes:                                                            | 1.0             |
	| Demographics     | 5.          | If Race is Asian, is Patient of Japanese Ancestry?                                                        | 1.0             |
	| Demographics     | 6.          | Was Patient Born in Japan?                                                                                | 1.0             |
	| Demographics     | 7.          | Number of parents born in Japan:                                                                          | 1.0             |
	| Demographics     | 8.          | Number of Grandparents Born in Japan?                                                                     | 1.0             |
	| Demographics     | 8.1.        | Treatment Group Code:                                                                                     | 1.0             |
	| Demographics     | 8.2.        | Treatment Group Description:                                                                              | 1.0             |
	| Demographics     | 8.3.        | Age at Study Start:                                                                                       | 1.0             |
	| Demographics     | 8.4.        | Age Units at Study Start:                                                                                 | 1.0             |
	| Vital Signs      | 3.          | Time of Exam (24 hour clock):                                                                             | 1.0             |
	| Vital Signs      | 4.          | Time of Exam (minutes):                                                                                   | 1.0             |
	| Vital Signs      | 7.          | Waist Circumference:                                                                                      | 1.0             |
	| Vital Signs      | 8.          | Waist Circumference Units:                                                                                | 1.0             |
	| Vital Signs      | 9.          | Height:                                                                                                   | 1.0             |
	| Vital Signs      | 10.         | Height Units:                                                                                             | 1.0             |
	| Vital Signs      | 11.         | Temperature:                                                                                              | 1.0             |
	| Vital Signs      | 12.         | Temperature Units:                                                                                        | 1.0             |
	| Vital Signs      | 13.         | Temperature Method:                                                                                       | 1.0             |
	| Vital Signs      | 14.         | Systolic (mmHg):                                                                                          | 1.0             |
	| Vital Signs      | 15.         | Diastolic (mmHg):                                                                                         | 1.0             |
	| Vital Signs      | 16.         | Blood Pressure Position:                                                                                  | 1.0             |
	| Vital Signs      | 17.         | Pulse Rate (Beats/Min):                                                                                   | 1.0             |
	| Vital Signs      | 18.         | Pulse Position:                                                                                           | 1.0             |
	| Vital Signs      | 19.         | Respiratory Rate (Breaths/Min):                                                                           | 1.0             |
	| AutoBuild Form01 | 1.R.1.      | Race:                                                                                                     | 1.0             |
	| AutoBuild Form01 | 1.R.2.      | Region of Body:                                                                                           | 1.0             |
	| AutoBuild Form01 | 1.R.3.      | Gender:                                                                                                   | 1.0             |
	| AutoBuild Form01 | 2.R.1.      | Drug Name:                                                                                                | 1.0             |
	| AutoBuild Form01 | 2.R.2.      | Placebo:                                                                                                  | 1.0             |
	| AutoBuild Form01 | 2.R.3.      | Time of Day that the drug is taken:                                                                       | 1.0             |
	| AutoBuild Form01 | 2.R.4.      | Name: {Required - Sent}                                                                                   | 1.0             |
	| AutoBuild Form01 | 2.R.5.      | Enter integer value between 10 and 99999: {Normal Range - Sent} (Condition - Q2 is in list "Yes" or "No") | 1.0             |
	| AutoBuild Form01 | 2.R.6.      | Enter patient date of birth:{Not Answered - Sent} (Condition - Q2 is not equal to "No")                   | 1.0             |
	And I click "Next" button on Create Flag Data Group page.
	And I click on Save & Close button.
	Then I verify the success message displayed as "Plan saved successfully"


Scenario: T07_Assign Plan to Study
	When I select the "Assign Plan to Study" link on the Manage Plans & Flag Data Groups page.
	And I select "MRPlanL1 (24%)" in the Select Plan dropdown.
	When I select "Entry correction" in Reason for change dropdown.
	When I enter text "New MR FLag" in Additional Notes text box.
	When I click "Save" button on Assign Plan to Study page.
	Then I verify the success message displayed as "Plan assigned successfully."

Scenario: T08_Add Site 01-Site and assign it to testadmin user
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: T09_Navigate to the Edit Preferences page and set the CRF Default save to Complete and update the Endpoint URL
	When I click breadcrumb "Study Administration"
	When I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Partial" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful"

Scenario: T10_Add patient 001-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 001      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 001-Patient |

Scenario: T11_Select and enroll patient 001-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "001-Patient" from patients table.
	When I enroll the patient "001-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 001       | 09/04/2018 | Yes           |
	Then I see patient "001-Patient" status as "Enrolled" on Patient details page.

Scenario: T12_Add patient 002-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 002      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 002-Patient |

Scenario: T13_Select and enroll patient 002-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "002-Patient" from patients table.
	When I enroll the patient "002-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 002       | 09/04/2018 | Yes           |
	Then I see patient "002-Patient" status as "Enrolled" on Patient details page.

Scenario: T14_Add patient 003-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 003      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 003-Patient |

Scenario: T15_Select and enroll patient 003-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "003-Patient" from patients table.
	When I enroll the patient "003-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 003       | 09/04/2018 | Yes           |
	Then I see patient "003-Patient" status as "Enrolled" on Patient details page.

Scenario: T16_Add patient 004-Patient from Datalabs UI.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 004      | Patient         | 09/04/2018 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 004-Patient |

Scenario: T17_Select and enroll patient 004-Patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "004-Patient" from patients table.
	When I enroll the patient "004-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 004      | 09/04/2018 | Yes           |
	Then I see patient "004-Patient" status as "Enrolled" on Patient details page.

Scenario: T18_Select the Patient 001-Patient, Open Visit(Screening) Form1, Save the form and Set the flag.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "001-Patient" patient.
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	And I select "Save" button on "Form1" CRF.
	And I set flag for below flat questions data in the CRFs.
	| QuestionPrompt           | SD-Verify | M-Review | D-Review |
	| Sample integer question: | On        |          |          |
	Then I see flag "SD-Verify" icon "flag_required_set.gif" against question "Sample text question:" 
@ObjectiveEvidence @ReqID:3.1.3.7,3.1.3.8
Scenario: T19_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "InitialFlagItemAndFormODMActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 9 order by OdmSubscriberDetailKey desc"
	And I have the XML file "InitialFlagItemAndFormODMExpected.xml" available in the project folder.
	And I have the XML file "InitialFlagItemAndFormODMActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T20_Select the Checkout button Add New Row and Save and Set the Flag for the table question
	When I select "Checkout" button on "Form1" CRF.
	And I click table row button "Add New Row" of table "Sample Table:" 
	And I click table row button "Save & Close Row" of table "Sample Table:" 
	And I select "Save" button on "Form1" CRF.
	And I set flag for below "Sample Table:" table questions data in the CRFs.
	| RowNumber | QuestionPrompt | SD-Verify | M-Review | D-Review | RowButtonToClick |
	| 1         | Drug Name:     | On        |          |          |                  |
	| 1         | Condition:     |           |          |          | OK               |
	Then I see flag "SD-Verify" icon "flag_required_set.gif" of a question "Drug Name:" of table "Sample Table:"
@ObjectiveEvidence @ReqID:3.1.3.7,3.1.3.8	
 Scenario: T21_Verify the XML Data evented out for the Flag Update
	Given I save the Event XML data in "FlagItemODMTableRowActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where studyeventkey = 9 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FlagItemODMTableRowExpected.xml" available in the project folder.
	And I have the XML file "FlagItemODMTableRowActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |       
	|         | SourceSystemVersion |

Scenario: T22_Request Signature for the Form and Update the data for the Question
	Given I click breadcrumb "001-Patient".
	When I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName         | FormName |
	| Visit (Screening) | Form1    |
	And I click on Submit button in RequestSignaturePage
	Then I see success message "CRF for Signature Saved Successful"

Scenario: T23_Sign Casebook
	When I click ActionPalette Item "Sign Casebook" in "PatientPortalActions" ActionPalette
	And I select radio button for below forms in SignCasebookPage
	| EventName         | FormName | Radiobutton |
	| Visit (Screening) | Form1    | Accept      |
	And I given username as "testadmin" in SignCasebookPage
	And I given password as "Datalabs1234" in SignCasebookPage
	And I click on Submit button in SignCasebbokPage
	Then I see success message "CRFs for Casebook Saved Successful"


Scenario: T24_Select the Visit (Screening) Form1 and update the value of any item
	When I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt           | AnswerValue | AnswerFieldType |
         | Sample integer question: | 11          | TextBox         |
	And I select "Save" button on "Form1" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"

@ObjectiveEvidence @ReqID:3.1.3.7,3.1.3.8,3.1.3.9
 Scenario: T25_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "FlaggingWithSignatureUpdateActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FlaggingWithSignatureUpdateExpected.xml" available in the project folder.
	And I have the XML file "FlaggingWithSignatureUpdateActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |   
	|         | SourceSystemVersion |

Scenario: T26_Go to Visit (Week 2) - Mark All Required and Add new row and Save
	Given I click breadcrumb "001-Patient".
	When I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	And I select "Save" button on "Form1" CRF.
	And I click link "Mark Required" for the flag type "SD-Verify" in FlagPalette of CRF
	And I select "Checkout" button on "Form1" CRF.
	And I click table row button "Add New Row" of table "Sample Table:" 
	And I click table row button "Save & Close Row" of table "Sample Table:"
	And I select "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.
@ObjectiveEvidence @ReqID:3.1.3.7,3.1.3.8
Scenario: T27_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "FlagUpdateOnFormWhenTableRowAddedActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FlagUpdateOnFormWhenTableRowAddedExpected.xml" available in the project folder.
	And I have the XML file "FlagUpdateOnFormWhenTableRowAddedActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         | 
	|         | SourceSystemVersion |

Scenario: T28_Select Visit (Week 5) - Form1 and Submit the form
	Given I expand "Visit (Week 5)" to select and open "Form1" CRF.
	When I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt           | AnswerValue | AnswerFieldType |
         | Sample text question:    | Text        | Textbox         |
         | Sample select question:  | Yes         | Listbox         |
         | Sample radio question:   | Yes         | RadioButton     |
         | Sample integer question: | 15          | Textbox         |
         | Sample float question:   | 16.66       | Textbox         |
         | Sample date question:    | 09/04/1992  | Textbox         |
	And I select "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
Scenario: T29_Select Visit (Week 3) - Demographics form and submit the form
	Given I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	When I select "Checkout" button on "Demographics" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt | AnswerValue       | AnswerFieldType |
         | Date of Birth: | 09/08/1990        | Textbox         |
         | Gender:        | Male              | Listbox         |
         | Race:          | Hispanic American | Listbox         |
	And I select entry complete checkbox on CRF.
	And I select "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T30_Select Visit (Week 2) - Form 4 and submit the form
	Given I expand "Visit (Week 2)" to select and open "Form 4" CRF.
	When I select "Checkout" button on "Form 4" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt | AnswerValue | AnswerFieldType |
         | Q5_text        | Text        | Textbox         |
	And I select "Save & Close" button on "Form 4" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T31_Add unscheduled event with a Case form
	When I click ActionPalette Item "Add Unscheduled Event" in "PatientPortalActions" ActionPalette
	And I select "Visit (Week 2)" from events list on AddUnscheduledEventStep1Page
	And I click on Next button on AddUnscheduledEventStep1Page
	And I select below forms on on AddUnscheduledEventStep2Page
		| FormName  |
		| Case_Form |		
	And I click on Next button on AddUnscheduledEventStep2Page
	And I click on Finish button on AddUnscheduledEventStep3Page
	Then I see event "Visit (Week 2).1" in PatientPortalPage

Scenario: T32_Select Visit (Week 2)1 - Case_Form and Submit the form
	Given I expand "Visit (Week 2).1" to select and open "Case_Form" CRF.
	When I select "Checkout" button on "Case_Form" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt                                                                      | AnswerValue | AnswerFieldType |
         | True or False:                                                                      | True        | Listbox         |
         | Text Value (Active if Question 1 is True):                                          | Zithromax   | TextArea         |
         | Float Value (Active if Question 2 is "CIPRO", "LEVAQUIN", "BIAXIN" or "ZITHROMAX"): | 4.4         | Textbox         |    
	And I enter below "Table_1:" table questions data in the CRF.
		| AddNewRow | RowNumber | QuestionPrompt                                                                     | AnswerValue | AnswerFieldType | RowButtonToClick |
		| Yes       | 1         | True or False:                                                                     | True        | ListBox         |                  |
		| No        | 1         | Text Value (Active if Question 1 is True):                                         | Zithromax   | Textbox         |                  |
		| No        | 1         | Float Value (Active if Question 2 is "CIPRO", "LEVAQUIN", "BIAXIN" or "ZITHROMAX): | 3.3         | Textbox         |                  |
		| No        | 1         | Second Float Value:                                                                | 88.87       | Textbox         |                  |
		| No        | 1         | Second Text Value (Active if Question 6.x.6 is not 88.88):                         | Text        | Textbox         | Save & Close Row |
	And I select "Save & Close" button on "Case_Form" CRF.
	Then The CRF with data is saved and checked-in successfully.	

Scenario: T33_Select M-Review CRFs and perform bulk Flag action on CRFs
	When I click ActionPalette Item "M-Review CRFs" in "PatientPortalActions" ActionPalette
	And I select radio button for below forms in M-Review CRFs
	| EventName        | FormName     | Radiobutton   |
	| Visit (Week 2)   | Form 4       | Mark All      |
	| Visit (Week 2).1 | Case_Form    | Mark All      |
	| Visit (Week 3)   | Demographics | Mark Required |
	| Visit (Week 5)   | Form1        | Mark Required |
	And I click on Save button in M-Review CRFs Page
	Then I see success message "M-Review Flags Update Successful"

@ObjectiveEvidence @ReqID:3.1.3.7,3.1.3.8
Scenario: T34_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "FlagUpdateActionPaletteMultipleCRFsActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 9 order by OdmSubscriberDetailKey desc"
	And I have the XML file "FlagUpdateActionPaletteMultipleCRFsExpected.xml" available in the project folder.
	And I have the XML file "FlagUpdateActionPaletteMultipleCRFsActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |
	