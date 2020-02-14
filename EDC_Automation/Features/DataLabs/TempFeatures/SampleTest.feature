Feature: SampleTest
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

@mytag
Scenario: _0001_Login to Datalabs
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: _0002_Add a patient
	Given I select "Patients" tab from the main menu of DataLabs.
	#And I press "Add Patient" from actions palette.
	And I select site "01-Site" from Sites dropdown.
	When I enter add patient data as below
	| ScreenID | PatientInitials | ScreenDate |
	| 11       | PAT             | 11/28/2017 |
	#| 08       | PAT             | 11/28/2017 |
	#| 09       | PAT             | 11/28/2017 |
	#When I enter below patient data in Screening CRF.
	#| QuestionPrompt    | AnswerValue | AnswerFieldType |
	#| Screen ID:        | 01          | TextBox         |
	#| Patient Initials: | PAT         | TextBox         |
	#| Screen Date:      | {TODAY}     | TextBox         |
	#Then the result should be 120 on the screen

Scenario: _0003_Enroll a patient
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	When I select "01-PAT" patient.
	And I enroll the selected patient with below details for patient "11-PAT".
	| EnrollID | EnrollDate | EntryComplete |
	| 11       | 11/29/2017 | Yes           |

Scenario: _0005_Fill Demo CRF
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	When I select "06-PAT" patient.
	And I select "Checkout" button on "Demographics" CRF.
	And I enter below data for Flat questions in CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Date of Birth:                                     | 01/01/1980  | TextBox         |
	| Gender:                                            | Male        | ListBox         |
	| Race:                                              | White       | ListBox         |
	| If Race is Other, Specifiy:                        |             | TextBox         |
	| Dictionary Term verbatim for RACEO:                | NA          | TextBox         |
	| Encoding Type for RACEO:                           | NA          | TextBox         |
	| RACE + RACE01 combined for reporting purposes:     |             | TextBox         |
	| If Race is Asian, is Patient of Japanese Ancestry? | No          | ListBox         |
	| Treatment Group Code:                              | GRP1        | TextBox         |
	| Study Start Date:                                  | 11/28/2017  | TextBox         |
	And I select entry complete checkbox.
	And I select "Save & Close" button on "Demographics" CRF.
	Then The CRF is saved and checked-in successfully.

Scenario: _0004_Fill Form1 CRF
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	When I select "11-PAT" patient.
	And I select "Checkout" button on "Form1" CRF.
	And I enter below data for Flat questions in CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample text question:    | Text        | TextBox         |
	| Sample select question:  | Yes         | ListBox         |
	| Sample radio question:   | Yes         | RadioButton     |
	| Sample integer question: | 10          | TextBox         |
	| Sample float question:   | 11.12       | TextBox         |
	| Sample date question:    | 11/30/2017  | TextBox         |
	And I select entry complete checkbox.
	And I select "Save & Close" button on "Form1" CRF.
	Then The CRF is saved and checked-in successfully.

Scenario: _0006_Verification of CRF save success msg
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	When I select "11-PAT" patient.
	Then The CRF is saved and checked-in successfully.

Scenario: _0007_Fill Form6
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	When I select "02-PAT" patient.
	And I select "Checkout" button on "Form 6" CRF.
	#Then I click on "Add New Row" button for "Sample Table:" in CRF.
	Then I enter below data in "Table with All Data Types:" in CRF.
	| AddNewRow | RowNumber | QuestionPrompt           | AnswerValue | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Text:                    | Test        | TextBox         |                  |
	| No        | 1         | Text Area:               | Test2       | TextArea        |                  |
	| No        | 1         | Select:                  | Yes         | ListBox         |                  |
	| No        | 1         | Radio (PDE Verify Only): | No          | Radio           | Save & Close Row |
	| Yes       | 2         | Date:                    | 12/04/2017  | TextBox         |                  |
	| No        | 2         | Integer:                 | 20          | TextBox         |                  |
	| No        | 2         | Float:                   | 12.12       | TextBox         | Save & Close Row |
	| Yes       | 3         | Text:                    | Test        | TextBox         | Cancel Row       |

Scenario: _0008_Fill Autobuild Fixed 1
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	When I select "11-PAT" patient.
	And I select "Checkout" button on "Autobuild Fixed 1" CRF.
	Then I enter below data in Autobuild table "First auto build table (max rows: 6, structure: fixed):" in CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                                              | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Gender question (male or female):                                           | Male        | ListBox         |                  |
	| No        | 1         | Non-key sequence code list (inches or centimeters):                         | cm          | Radio           |                  |
	| No        | 1         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
	| No        | 3         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |


Scenario: _009_Verify selected list item and radio option in a form
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	When I select "01-PAT" patient.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I verify below data for Flat questions in CRF.
	| QuestionPrompt          | AnswerValue | AnswerFieldType |
	| Sample select question: | [Blank]     | ListBox         |
	| Sample radio question:  | [Blank]     | RadioButton     |

Scenario: T01_Add a patient and verify tags
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

Scenario: T02_Verify the XML Data evented out for the Add Patient
	Given I save the Event XML data in "AddPatient1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscripberDetail order by OdmSubscriberDetailKey desc where StudyEventkey = (select StudyEventKey from MF_StudyEvent where StudyEventName = 'PatientAdd')"
	And I have opened the XML file "AddPatient1.xml" located in test folder.
	Then I verify tags structure in the XML file as displayed in the table.
	| TagName            |
	| ODM                |
	| Study              |
	| GlobalVariables    |
	| StudyName          |
	| StudyDescription   |
	| ProtocolName       |
	| ClinicalData       |
	| SubjectData        |
	| AuditRecord        |
	| UserRef            |
	| LocationRef        |
	| DateTimeStamp      |
	| ReasonForChange    |
	| SourceID           |
	| SiteRef            |
	| Annotation         |
	| Comment            |
	| StudyEventData     |
	| FormData           |
	| ItemGroupData      |
	| ItemData           |
	| MeasurementUnitRef |
	| ItemData           |
	| MeasurementUnitRef |
	| ItemData           |
	| MeasurementUnitRef |
	| StudyEventData     |
	| FormData           |
	| FormData           |
	| FormData           |
	| FormData           |

Scenario: T03_Verify tags in test XML from standard input file
	Given I have the XML file "SampleAddPatientODM.xml" available in the project folder.
	And I have the XML file "SampleAddPatientODM.xml" available in the Test XML Files folder.
	Then I compare and verify the tags in source XML file from project and target xml file from test folder are same.

Scenario: T04_Verification of fields in a tag in a test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "ODM" tag in the XML file.
	| FieldName   | Data Value   |
	| Description | Description1 |
	| FileType    | FileType1    |
	| ODMVersion  | ODMVersion1  |
	| ID          | ID1          |

Scenario: T05_Verification of Study field tags in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "Study" tag in the XML file.
	| FieldName   | Data Value   |
	| OID		  | OID1		 |
	And I verify below data in the respective fields for "GlobalVariables" tag in the XML file.
	| FieldName           | DataValue                |
	| StudyName			  | StudyName1               |
	| StudyDescription    | StudyDescription1        |
	| ProtocolName        | ProtocolName1            |

Scenario: T06_Verification of Clinicle data fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "ClinicleData" tag in the XML file.
	| FieldName          | Data Value          |
	| StudyOID           | StudyOID1           |
	| MetaDataVersionOID | MetaDataVersionOID1 |

Scenario: T07_Verification of Subjectdata fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "SubjectData" tag in the XML file.
	| FieldName       | Data Value       |
	| SubjectKey      | SubjectKey1      |
	| TransactionType | TransactionType1 |
	| SiteRef         | SiteRef1         |
		
Scenario: T08_Verification of auditrecord fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "AuditRecord" tag in the XML file.
	| FieldName       | Data Value       |
	| UserOID         | UserOID1         |
	| LocationOID     | LocationOID1	 |
	| DateTimeStamp   | DateTimeStamp1	 |
	| ReasonForChange | ReasonForChange1 |
	| SourceID        | SourceID1        |
		
Scenario: T09_Verification of StudyEventData fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "StudyEventData" tag in the XML file.
	| FieldName		  | Data Value     |
	| StudyEventOID   | StudyEventOID1 |

Scenario: T10_Verification of FormData fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "Formdata" tag in the XML file.
	| FieldName           | Data Value            |
	| FormOIDOID          | FormOID1              |
	| TransactionType     | TransactionType1	  |
	And I verify below data in the respective fields for "ItemGroupData" tag in the XML file.
	| FieldName       | DataValue        |
	| ItemGroupOID    | ItemGroupOID1    |
	| TransactionType | TransactionType1 |
	And I verify below data in the respective fields for "ItemData" tag in the XML file.
	| FieldName       | DataValue        |
	| ItemOID         | ItemOID1         |
	| TransactionType | TransactionType1 |
	| Value           | Value1           |

Scenario: T11_Verification of AuditRecord fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "AuditRecord" tag in the XML file.
	| FieldName       | Data Value       |
	| UserOID         | UserOID2         |
	| LocationOID     | LocationOID2	 |
	| DateTimeStamp   | DateTimeStamp2	 |
	| ReasonForChange | ReasonForChange2 |
	| SourceID        | SourceID2        |

Scenario: T12_Verification of itemdata fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "ItemData" tag in the XML file.
	| FieldName       | Data Value       |
	| ItemOID         | ItemOID2         |
	| TransactionType | TransactionType2 |
	| Value           | Value2           |

Scenario: T13_Verification of AuditRecord fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "AuditRecord" tag in the XML file.
	| FieldName       | Data Value       |
	| UserOID         | UserOID3         |
	| LocationOID     | LocationOID3	 |
	| DateTimeStamp   | DateTimeStamp3	 |
	| ReasonForChange | ReasonForChange3 |
	| SourceID        | SourceID3        |

Scenario: T14_Verification of itemdata fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "ItemData" tag in the XML file.
	| FieldName       | Data Value       |
	| ItemOID         | ItemOID3         |
	| TransactionType | TransactionType3 |
	| Value           | Value3           |

Scenario: T15_Verification of AuditRecord fields tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "AuditRecord" tag in the XML file.
	| FieldName       | Data Value       |
	| UserOID         | UserOID4         |
	| LocationOID     | LocationOID4	 |
	| DateTimeStamp   | DateTimeStamp4	 |
	| ReasonForChange | ReasonForChange4 |
	| SourceID        | SourceID4        |

Scenario: T16_Verification of created query DCF tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "ResponsetoFormQuestion" tag in the XML file.
	| FieldName | Data Value |
	|  Fileld1  | Field1     |
	
Scenario: T17_Verification of created query DCF tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "ItemChangeHistory" tag in the XML file.
	| FieldName | Data Value |
	|  Fileld1  | Field1     |

Scenario: T18_Verification of created query DCF tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "QueryCreation" tag in the XML file.
	| FieldName | Data Value |
	|  Fileld1  | Field1     |

Scenario: T19_Verification of created query DCF tag in test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "ChangesToQueryCategoryAndCustomFields" tag in the XML file.
	| FieldName | Data Value |
	|  Fileld1  | Field1     |

Scenario: T20_Select a query from Run wizard and run against a site.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Query Management" In StudyAdministrationPage
	And I click ActionPalette Item "Run Wizard" in "QueryListActions" ActionPalette
	And I enter "AutoBuild_Form84_TxtAB84_Required" in "Name" search field.
	And I select checkbox for the query "AutoBuild_Form84_TxtAB84_Required" and version "1.0" from the query run wizard page.
	And I click Next button in QueryRunWizardPage
	And I click Next button in QueryRunWizardCriteriaPage
	And I select site "01-Site" in QueryRunWizardSitesPage
	And I click Next button in QueryRunWizardSitesPage
	And I click Finish button in QueryRunWizardPage
	Then I verify the success message displayed as "Queries Successfully Queued To Run."

Scenario: T21_Enter event date for Visit(Screening) Event
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I click event date value "<none>" for "Visit (Screening)" event
	And I set NeweventDate "06/28/2018" in EventActualDate modal.
	And I click Save button in EventActualDatePage
	Then I verify event date value "06/28/2018" for "Visit (Screening)" event

Scenario: T22_Derivation Run wizard against a site.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click ActionPalette Item "Run Wizard" in "DerivationMgmtListActions" ActionPalette
	And I select "All Patients for Specific Sites" radio button on Criteria to Run Derivations step.
	And I click Next button in DerivationRunWizardCriteriaPage
	And I select site "01-Site" in DerivationRunWizardSitesPage
	And I click Next button in DerivationRunWizardSitesPage
	And I click Finish button in DerivationRunWizardPage
	Then I verify the success message displayed as "Derivations Successfully Queued To Run."

Scenario: T22_Derivation Run wizard against a patient.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click ActionPalette Item "Run Wizard" in "DerivationMgmtListActions" ActionPalette
	And I select "Specific Patients at a Single Site" radio button on Criteria to Run Derivations step.
	And I click Next button in DerivationRunWizardCriteriaPage
	And I select site "01-Site" in DerivationRunWizardSitesPage
	And I click Next button in DerivationRunWizardSitesPage
	And I select patient "01-PAT" in DerivationRunWizardPatientsPage
	And I click Next button in DerivationRunWizardPatientsPage
	And I click Finish button in DerivationRunWizardPage
	Then I verify the success message displayed as "Derivations Successfully Queued To Run."

Scenario: T23_Create a flag plan along with data group.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Flag Management" In StudyAdministrationPage
	And I select "D-Review" flag type from Flag Management page.
	And I click Add Plan button to create a new plan.
	And I enter Plan Name as "Dplan1" and label as "Dlabel1" on Create Plan page.
	And I click "Next" button on Create Plan page.
	And I enter Data Group Name as "DG1" and Data Group label as "DGL1" on Create Flag Data Group page.
	And I select checkbox for from questions in protocol version.
	| FormName | QuestionNum | QuestionPrompt          | ProtocolVersion |
	| Form 3   |             |                         | 1.0             |
	| Form1    | 1.          | Sample select question: | 2.0             |
	| Form1    | 6.R.1.      | Drug Name:              | 2.0             |
	And I select "Study Version(1.0)" protocol tab.
	And I check "off" Select All checkbox of Event Form Relation table.
	And I check Select All form checkbox for the forms.
	| FormName | CheckONOrOff |
	| Form 3   | On           |
	And I check Select All event checkbox for the events.
	| EventName         | CheckONOrOff |
	| Visit (Screening) | On           |
	And I select "Study Version(2.0)" protocol tab.
	And I check checkbox for a form corresponding to an event.
	| EventName | FormName    | CheckONOrOff |
	| Fail      | Fail Reason | Off          |
	And I click on Save & Close button.
	Then I verify the success message displayed as "Plan saved successfully"

Scenario: T25:_test the DataGroupsList
	When I click Add Plan button to create a new plan.
	And I enter Plan Name as "Dplan1" and label as "Dlabel1" on Create Plan page.
	And I select checkbox "On" for Add/Remove existing flag data group(s).
	And I click "Next" button on Add/remove existing Flag Data Groups page.
	And I click "Back" button on Add/remove existing Flag Data Groups page.
	And I select checkbox "Off" for Add new flag data group(s).	
	And I click "Next" button on Add/remove existing Flag Data Groups page.
	And I select the FlagDataGroups to create the Plan
	| FlagDataGroup |
	| DGL1          |
	| DGL2          |
	| Select All    |   
	And I click "Save & Close" button on Add/remove existing Flag Data Groups page.
	Then I verify the success message displayed as "Plan saved successfully"

Scenario: T24:_Testing
	When I select "SD-verify" flag type from Flag Management page.
	When I click Add Plan button to create a new plan.
	When I enter Plan Name as "Plan1" and label as "PlanL1" on Create Plan page.
	When I click "Next" button on Create Plan page.
	When I enter Data Group Name as "DG1" and Data Group label as "DGL1" on Create Flag Data Group page.
	When I select checkbox for form questions in protocol version.
         | FormName | QuestionNum | QuestionPrompt | ProtocolVersion |
         | Screened | 1.          | Screen ID:     | 1.0             |
         | Enrolled |             |                | 2.0             |



Scenario: T25_Assign Plan to Patient
	When I select the "Assign Plan to Patient" link on the Manage Plans & Flag Data Groups page.
	When I select Select-All checkbox for the Select Sites(s) dropdown.
	When I click "Get Patients" button on Assign Plan to Patient page.
	When I select Select All checkbox "on" for the Assign Plan grid.
	And I select checkbox for the below patients.
	| PatientID   | CheckONOrOff |
	| 002-Patient | Off          |
	| 002-Patient | On           |
	When I click "Next" button on Assign Plan to Patient page.
	When I select "None (0%)" in the Select Plan dropdown.
	When I select "Entry correction" in Reason for change dropdown.
	When I enter text "Textupdate" in Additional Notes text box.
	When I click "Save" button on Assign Plan to Patient page.
	Then I verify the success message displayed as "Plan assigned to Patient(s) job created successfully." 

Scenario: T28_Assign Plan to Site
	When I select the "Assign Plan to Site" link on the Manage Plans & Flag Data Groups page.
	And I select Select All checkbox "On" for the Assign Plan grid.
	And I select checkbox for the below Sites.
	| Sites | CheckONOrOff |
	| Test  | Off          |
	| Test  | On           |
	And I click "Next" button on Assign Plan to Site page.
	When I select "None (0%)" in the Select Plan dropdown.
	When I select "Entry correction" in Reason for change dropdown.
	When I enter text "Textupdate" in Additional Notes text box.
	When I click "Save" button on Assign Plan to Site page.
	Then I verify the success message displayed as "Plan assigned to Site(s) successfully." 

Scenario: T29_Assign Plan to Study
	When I select the "Assign Plan to Study" link on the Manage Plans & Flag Data Groups page.
	And I select "None (0%)" in the Select Plan dropdown.
	When I select "Entry correction" in Reason for change dropdown.
	When I enter text "Textupdate" in Additional Notes text box.
	When I click "Save" button on Assign Plan to Study page.
	Then I verify the success message displayed as "Plan assigned successfully."

Scenario: T30 Identify the icon for the flag
	Then I see flag "SD-Verify" icon "flag_required_set.gif" against question "Sample text question:" 

Scenario: Update ODM Endpoint URL
		When I update the endpoint URL under Patient Data Eventing tab.
Scenario: Freeze Multiple CRFs
When I select Freeze checkbox for below forms in FreezeCRFsPage
	| EventName         | FormName    |
	| Visit (Screening) | Form1       |
	| Visit (Week 3)    | Vital Signs |
When I click on Select All button in RequestSignaturePage
When I click on Accept All button in SignCasebookPage

Scenario: ReferenceRangeIds List
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID |
	|                  |
