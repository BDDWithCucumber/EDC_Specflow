Feature: DataLabs_V5.9.0_Autobuild_CodeItemAdd

	1. Verification of Autobuild structure after study update which includes ADDITION of codelistitmes to key sequence questions and also verifies table history, item history.
	2. Verification of Flag status, Form status and Signature staus after each study update.
	3. Verification of ODM Eventing for Add Row for a Autobuild Table on Study Update.
Notes:
	1. This scirpt is written by targetting DL 5.8.0. However, this can be executed on higher versions when new DL versions are released by doing the instance upgrade.
	2. DB backup "Autobuild_BaseForAdd.bak" should be used to create DL instance. 
	3. The backup contains test data which is used as part of testing.
	4. Backup file is placed in "AutobuildEnhancementStudies/DB Backups", which is under "Study Files" folder of "BusinessProcesses" project.


@ObjectiveEvidence
Scenario: 001_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@ObjectiveEvidence
Scenario: 002_ADD CODE ITEM_Perform major study update, in which key sequence question codelist items are reordered
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Partial" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	And I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I upload study "AutobuildEnhancementStudies\Test4500_GREAT_FormStatus_2_AddReorder.zip" with Label "ADD" on Browse field.
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

@ObjectiveEvidence
Scenario: 003_ADD CODE ITEM_Publish Study with patient migration
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                              |
	| Migration of Site 01 for Study file (Add) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |

@ObjectiveEvidence @ReqID:US48808
Scenario: 004_ADD CODE ITEM_Verify data in the form AB_WithOneKeySequenceColumn of patinet 001-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "001-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	Then I verify below "AutobuildFixed with key sequence 1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | BodyRegion     | Hair                                                  | Text            |                |                  |
	| 1         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 1         | Date           |                                                       | Textbox         |                | OK               |
	| 2         | BodyRegion     | Eyes                                                  | Text            |                |                  |
	| 2         | Subjects       | Chemistry                                             | Text            |                |                  |
	| 2         | Measurement    | Meters\r\nKgs                                         | Text            |                |                  |
	| 2         | Text           | Text2                                                 | Text            |                |                  |
	| 2         | Integer        | 2                                                     | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | BodyRegion     | Ears                                                  | Text            |                |                  |
	| 3         | Subjects       | Botony                                                | Text            |                |                  |
	| 3         | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 3         | Text           | Text3                                                 | Text            |                |                  |
	| 3         | Integer        | 3                                                     | Text            |                |                  |
	| 3         | WT_Units       | KG                                                    | Text            |                |                  |
	| 3         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 4         | BodyRegion     | Nose                                                  | Text            |                |                  |
	| 4         | Subjects       | Zoology                                               | Text            |                |                  |
	| 4         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 4         | Text           | Text4                                                 | Text            |                |                  |
	| 4         | Integer        | 4                                                     | Text            |                |                  |
	| 4         | WT_Units       | KG                                                    | Text            |                |                  |
	| 4         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 5         | BodyRegion     | Chest                                                 | Text            |                |                  |
	| 5         | Subjects       | Civics                                                | Text            |                |                  |
	| 5         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 5         | Text           | Text5                                                 | Text            |                |                  |
	| 5         | Integer        | 5                                                     | Text            |                |                  |
	| 5         | WT_Units       | LB                                                    | Text            |                |                  |
	| 5         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 6         | BodyRegion     | Arm                                                   | Text            |                |                  |
	| 6         | Subjects       | Economics                                             | Text            |                |                  |
	| 6         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 6         | Text           | Text6                                                 | Text            |                |                  |
	| 6         | Integer        | 6                                                     | Text            |                |                  |
	| 6         | WT_Units       | LB                                                    | Text            |                |                  |
	| 6         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 7         | BodyRegion     | Leg                                                   | Text            |                |                  |
	| 7         | Subjects       | Commerce                                              | Text            |                |                  |
	| 7         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 7         | Text           | Text7                                                 | Text            |                |                  |
	| 7         | Integer        | 7                                                     | Text            |                |                  |
	| 7         | WT_Units       | LB                                                    | Text            |                |                  |
	| 7         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 8         | BodyRegion     | Head                                                  | Text            |                |                  |
	| 8         | Subjects       | Physics                                               | Text            |                |                  |
	| 8         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 8         | Text           | Text1                                                 | Text            |                |                  |
	| 8         | Integer        | 1                                                     | Text            |                |                  |
	| 8         | WT_Units       | KG                                                    | Text            |                |                  |
	| 8         | Date           | 02/12/2019                                            | Text            |                | OK               |

@ObjectiveEvidence
Scenario: 005_ADD CODE ITEM_Verify ItemHistory of a table question
	When I expand row "1" of table "AutobuildFixed with key sequence 1:"
	And I click "changeHistory.gif" icon of a question "BodyRegion" of table "AutobuildFixed with key sequence 1:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                                         |
	| System (System\System) | Hair     | Reason: Initial Entry\r\nNotes: Study Design Change |

@ObjectiveEvidence @ReqID:US53883,US55962
Scenario: 006_ADD CODE ITEM_Verify table history for table AutobuildFixed with key sequence 1: of 001-Patient
    When I click cancel button in ChangeHistoryModal
	And I invoke table hisotry for table "AutobuildFixed with key sequence 1:"
    Then I see ordered table history for table "Table Name" in TableHistoryModalDialog
    | Name                   | Action                  | AdditionalNotes     |
    | System (System\System) | Row #1: Added           | Study design change |
    | System (System\System) | Row #7 renumbered to #8 | Study design change |
    | System (System\System) | Row #6 renumbered to #7 | Study design change |
    | System (System\System) | Row #5 renumbered to #6 | Study design change |
    | System (System\System) | Row #4 renumbered to #5 | Study design change |
    | System (System\System) | Row #3 renumbered to #4 | Study design change |
    | System (System\System) | Row #2 renumbered to #3 | Study design change |
    | System (System\System) | Row #1 renumbered to #2 | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqID:US48808
Scenario: 007_ADD CODE ITEM_Verify Workflow for form AB_WithOneKeySequenceColumn of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v3.0) |

@ObjectiveEvidence @ReqID:US52679,US52808,US52673
Scenario: 008_ADD CODE ITEM_Verify Flags and Signature status for form AB_WithOneKeySequenceColumn of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                         | FormStatus    | DCF | SDVerify | MReview | DReview | Signed | Frozen | Locked |
	| AB_WithOneKeySequenceColumn | PartialSubmit |     | Some       | Some      | Some      | Ready  |        |        |
	#| AB_WithOneKeySequenceColumn      | Submit/PartialSubmit/NotSaved        |   On/Off/Some  | On/Off/Some       | On/Off/Some      | On/Off/Some      | Ready/Signed/Rejected    |  On/Off/Some      |  On/Off/Some      |	

@ObjectiveEvidence @ReqID:US48808
Scenario: 009_ADD CODE ITEM_Verify data in the form AB_WithTwoKeySequenceColumns of patinet 001-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithTwoKeySequenceColumns" CRF.
	Then I verify below "AutobuildFixed with key sequence 2_12:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 1         | STATUS         | [Blank]                                               | Text            |                |                  |
	| 1         | Subjects       | Civics                                                | Text            |                |                  |
	| 1         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 1         | Text           | Text5                                                 | Text            |                |                  |
	| 1         | Integer        | 5                                                     | Text            |                |                  |
	| 1         | WT_Units       | LB                                                    | Text            |                |                  |
	| 1         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 2         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 2         | STATUS         | Dead                                                  | Text            |                |                  |
	| 2         | Subjects       | C                                                     | Text            |                |                  |
	| 2         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 2         | Text           | Text8                                                 | Text            |                |                  |
	| 2         | Integer        | 8                                                     | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 3         | STATUS         | Critical                                              | Text            |                |                  |
	| 3         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 3         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 3         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 3         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 3         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 3         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 4         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 4         | STATUS         | Lost to follow-up                                     | Text            |                |                  |
	| 4         | Subjects       | Economics                                             | Text            |                |                  |
	| 4         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 4         | Text           | Text6                                                 | Text            |                |                  |
	| 4         | Integer        | 6                                                     | Text            |                |                  |
	| 4         | WT_Units       | LB                                                    | Text            |                |                  |
	| 4         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 5         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 5         | STATUS         | Alive                                                 | Text            |                |                  |
	| 5         | Subjects       | Commerce                                              | Text            |                |                  |
	| 5         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 5         | Text           | Text7                                                 | Text            |                |                  |
	| 5         | Integer        | 7                                                     | Text            |                |                  |
	| 5         | WT_Units       | LB                                                    | Text            |                |                  |
	| 5         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 6         | TATYPE         | [Blank]                                               | Text            |                |                  |
	| 6         | STATUS         | [Blank]                                               | Text            |                |                  |
	| 6         | Subjects       | Physics                                               | Text            |                |                  |
	| 6         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 6         | Text           | Text1                                                 | Text            |                |                  |
	| 6         | Integer        | 1                                                     | Text            |                |                  |
	| 6         | WT_Units       | KG                                                    | Text            |                |                  |
	| 6         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 7         | TATYPE         | [Blank]                                               | Text            |                |                  |
	| 7         | STATUS         | Dead                                                  | Text            |                |                  |
	| 7         | Subjects       | Zoology                                               | Text            |                |                  |
	| 7         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 7         | Text           | Text4                                                 | Text            |                |                  |
	| 7         | Integer        | 4                                                     | Text            |                |                  |
	| 7         | WT_Units       | KG                                                    | Text            |                |                  |
	| 7         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 8         | TATYPE         | [Blank]                                               | Text            |                |                  |
	| 8         | STATUS         | Critical                                              | Text            |                |                  |
	| 8         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 8         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 9         | Subjects       | Chemistry                                             | Text            |                |                  |
	| 9         | Measurement    | Meters\r\nKgs                                         | Text            |                |                  |
	| 9         | Text           | Text2                                                 | Text            |                |                  |
	| 9         | Integer        | 2                                                     | Text            |                |                  |
	| 9         | WT_Units       | KG                                                    | Text            |                |                  |
	| 9         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 10        | TATYPE         | [Blank]                                               | Text            |                |                  |
	| 10        | STATUS         | Alive                                                 | Text            |                |                  |
	| 10        | Subjects       | Botony                                                | Text            |                |                  |
	| 10        | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 10        | Text           | Text3                                                 | Text            |                |                  |
	| 10        | Integer        | 3                                                     | Text            |                |                  |
	| 10        | WT_Units       | KG                                                    | Text            |                |                  |
	| 10        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 11        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 11        | STATUS         | [Blank]                                               | Text            |                |                  |
	| 11        | Subjects       | C++                                                   | Text            |                |                  |
	| 11        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 11        | Text           | Text9                                                 | Text            |                |                  |
	| 11        | Integer        | 9                                                     | Text            |                |                  |
	| 11        | WT_Units       | LB                                                    | Text            |                |                  |
	| 11        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 12        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 12        | STATUS         | Dead                                                  | Text            |                |                  |
	| 12        | Subjects       | DigitalElectronics                                    | Text            |                |                  |
	| 12        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 12        | Text           | Text12                                                | Text            |                |                  |
	| 12        | Integer        | 12                                                    | Text            |                |                  |
	| 12        | WT_Units       | LB                                                    | Text            |                |                  |
	| 12        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 13        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 13        | STATUS         | Critical                                              | Text            |                |                  |
	| 13        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 13        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 13        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 13        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 13        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 13        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 14        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 14        | STATUS         | Lost to follow-up                                     | Text            |                |                  |
	| 14        | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 14        | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 14        | Text           | Text10                                                | Text            |                |                  |
	| 14        | Integer        | 10                                                    | Text            |                |                  |
	| 14        | WT_Units       | KG                                                    | Text            |                |                  |
	| 14        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 15        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 15        | STATUS         | Alive                                                 | Text            |                |                  |
	| 15        | Subjects       | DataStructures                                        | Text            |                |                  |
	| 15        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 15        | Text           | Text11                                                | Text            |                |                  |
	| 15        | Integer        | 11                                                    | Text            |                |                  |
	| 15        | WT_Units       | LB                                                    | Text            |                |                  |
	| 15        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 16        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 16        | STATUS         | [Blank]                                               | Text            |                |                  |
	| 16        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 16        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 17        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 17        | STATUS         | Dead                                                  | Text            |                |                  |
	| 17        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 17        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 18        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 18        | STATUS         | Critical                                              | Text            |                |                  |
	| 18        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 18        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 19        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 19        | STATUS         | Lost to follow-up                                     | Text            |                |                  |
	| 19        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 19        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 19        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 19        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 19        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 19        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 20        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 20        | STATUS         | Alive                                                 | Text            |                |                  |
	| 20        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 20        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 20        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 20        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 20        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 20        | Date           |                                                       | Textbox         | Unsaved        | OK               |

@ObjectiveEvidence @ReqID:US53883,US55962	
Scenario: 010_ADD CODE ITEM_Verify table history for table AutobuildFixed with key sequence 2_12 of form AB_WithTwoKeySequenceColumns of 001-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 2_12:"
    Then I see ordered table history for table "AutobuildFixed with key sequence 2_12:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #20: Added            | Study design change |
    | System (System\System) | Row #19: Added            | Study design change |
    | System (System\System) | Row #18: Added            | Study design change |
    | System (System\System) | Row #17: Added            | Study design change |
    | System (System\System) | Row #16: Added            | Study design change |
    | System (System\System) | Row #13: Added            | Study design change |
    | System (System\System) | Row #8: Added             | Study design change |
    | System (System\System) | Row #3: Added             | Study design change |
    | System (System\System) | Row #12 renumbered to #15 | Study design change |
    | System (System\System) | Row #11 renumbered to #14 | Study design change |
    | System (System\System) | Row #10 renumbered to #12 | Study design change |
    | System (System\System) | Row #9 renumbered to #11  | Study design change |
    | System (System\System) | Row #8 renumbered to #10  | Study design change |
    | System (System\System) | Row #7 renumbered to #9   | Study design change |
    | System (System\System) | Row #6 renumbered to #7   | Study design change |
    | System (System\System) | Row #5 renumbered to #6   | Study design change |
    | System (System\System) | Row #4 renumbered to #5   | Study design change |
    | System (System\System) | Row #3 renumbered to #4   | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqID:US48808
Scenario: 011_ADD CODE ITEM_Verify Workflow for form AB_WithTwoKeySequenceColumns of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Migration to 20090330 (v3.0) |

@ObjectiveEvidence @ReqID:US52679,US52808,US52673
Scenario: 012_ADD CODE ITEM_Verify Flags and Signature status for form AB_WithTwoKeySequenceColumn of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                          | FormStatus    | SDVerify | MReview | DReview | Signed   |
	| AB_WithTwoKeySequenceColumns | PartialSubmit | Some     | Some    | Some    | Rejected |

@ObjectiveEvidence @ReqID:US48808
Scenario: 013_ADD CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 001-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 1         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 1         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 1         | Subjects       | DataStructures                                        | Text            |                |                  |
	| 1         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 1         | Text           | Text11                                                | Text            |                |                  |
	| 1         | Integer        | 11                                                    | Text            |                |                  |
	| 1         | WT_Units       | LB                                                    | Text            |                |                  |
	| 1         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 2         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 2         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 2         | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 2         | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 2         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 2         | Text           | Text10                                                | Text            |                |                  |
	| 2         | Integer        | 10                                                    | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 3         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 3         | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 3         | Subjects       | DigitalElectronics                                    | Text            |                |                  |
	| 3         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 3         | Text           | Text12                                                | Text            |                |                  |
	| 3         | Integer        | 12                                                    | Text            |                |                  |
	| 3         | WT_Units       | LB                                                    | Text            |                |                  |
	| 3         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 4         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 4         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 4         | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 4         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 4         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 5         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 5         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 5         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 5         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 5         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 6         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 6         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 6         | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 6         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 6         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 6         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 6         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 6         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 6         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 7         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 7         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 7         | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 7         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 7         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 8         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 8         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 8         | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 8         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 8         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 9         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 9         | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 9         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 9         | Subjects       | C                                                     | Text            |                |                  |
	| 9         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 9         | Text           | Text8                                                 | Text            |                |                  |
	| 9         | Integer        | 8                                                     | Text            |                |                  |
	| 9         | WT_Units       | KG                                                    | Text            |                |                  |
	| 9         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 10        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 10        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 10        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 10        | Subjects       | Commerce                                              | Text            |                |                  |
	| 10        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 10        | Text           | Text7                                                 | Text            |                |                  |
	| 10        | Integer        | 7                                                     | Text            |                |                  |
	| 10        | WT_Units       | LB                                                    | Text            |                |                  |
	| 10        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 11        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 11        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 11        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 11        | Subjects       | C++                                                   | Text            |                |                  |
	| 11        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 11        | Text           | Text9                                                 | Text            |                |                  |
	| 11        | Integer        | 9                                                     | Text            |                |                  |
	| 11        | WT_Units       | LB                                                    | Text            |                |                  |
	| 11        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 12        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 12        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 12        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 12        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 12        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 12        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 12        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 12        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 12        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 13        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 13        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 13        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 13        | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 13        | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 13        | Text           | Text17                                                | Text            |                |                  |
	| 13        | Integer        | 17                                                    | Text            |                |                  |
	| 13        | WT_Units       | KG                                                    | Text            |                |                  |
	| 13        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 14        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 14        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 14        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 14        | Subjects       | C++                                                   | Text            |                |                  |
	| 14        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 14        | Text           | Text16                                                | Text            |                |                  |
	| 14        | Integer        | 16                                                    | Text            |                |                  |
	| 14        | WT_Units       | LB                                                    | Text            |                |                  |
	| 14        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 15        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 15        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 15        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 15        | Subjects       | DataStructures                                        | Text            |                |                  |
	| 15        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 15        | Text           | Text18                                                | Text            |                |                  |
	| 15        | Integer        | 18                                                    | Text            |                |                  |
	| 15        | WT_Units       | LB                                                    | Text            |                |                  |
	| 15        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 16        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 16        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 16        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 16        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 16        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 17        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 17        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 17        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 17        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 17        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 18        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 18        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 18        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 18        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 18        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 19        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 19        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 19        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 19        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 19        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 19        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 19        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 19        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 19        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 20        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 20        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 20        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 20        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 20        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 20        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 20        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 20        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 20        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 21        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 21        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 21        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 21        | Subjects       | Commerce                                              | Text            |                |                  |
	| 21        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 21        | Text           | Text14                                                | Text            |                |                  |
	| 21        | Integer        | 14                                                    | Text            |                |                  |
	| 21        | WT_Units       | LB                                                    | Text            |                |                  |
	| 21        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 22        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 22        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 22        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 22        | Subjects       | Economics                                             | Text            |                |                  |
	| 22        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 22        | Text           | Text13                                                | Text            |                |                  |
	| 22        | Integer        | 13                                                    | Text            |                |                  |
	| 22        | WT_Units       | LB                                                    | Text            |                |                  |
	| 22        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 23        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 23        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 23        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 23        | Subjects       | C                                                     | Text            |                |                  |
	| 23        | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 23        | Text           | Text15                                                | Text            |                |                  |
	| 23        | Integer        | 15                                                    | Text            |                |                  |
	| 23        | WT_Units       | KG                                                    | Text            |                |                  |
	| 23        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 24        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 24        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 24        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 24        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 24        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 24        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 24        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 24        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 24        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 25        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 25        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 25        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 25        | Subjects       | Civics                                                | Text            |                |                  |
	| 25        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 25        | Text           | Text5                                                 | Text            |                |                  |
	| 25        | Integer        | 5                                                     | Text            |                |                  |
	| 25        | WT_Units       | LB                                                    | Text            |                |                  |
	| 25        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 26        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 26        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 26        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 26        | Subjects       | Zoology                                               | Text            |                |                  |
	| 26        | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 26        | Text           | Text4                                                 | Text            |                |                  |
	| 26        | Integer        | 4                                                     | Text            |                |                  |
	| 26        | WT_Units       | KG                                                    | Text            |                |                  |
	| 26        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 27        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 27        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 27        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 27        | Subjects       | Economics                                             | Text            |                |                  |
	| 27        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 27        | Text           | Text6                                                 | Text            |                |                  |
	| 27        | Integer        | 6                                                     | Text            |                |                  |
	| 27        | WT_Units       | LB                                                    | Text            |                |                  |
	| 27        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 28        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 28        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 28        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 28        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 28        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 28        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 28        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 28        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 28        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 29        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 29        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 29        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 29        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 29        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 29        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 29        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 29        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 29        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 30        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 30        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 30        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 30        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 30        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 30        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 30        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 30        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 30        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 31        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 31        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 31        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 31        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 31        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 31        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 31        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 31        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 31        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 32        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 32        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 32        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 32        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 32        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 32        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 32        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 32        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 32        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 33        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 33        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 33        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 33        | Subjects       | Chemistry                                             | Text            |                |                  |
	| 33        | Measurement    | Meters\r\nKgs                                         | Text            |                |                  |
	| 33        | Text           | Text2                                                 | Text            |                |                  |
	| 33        | Integer        | 2                                                     | Text            |                |                  |
	| 33        | WT_Units       | KG                                                    | Text            |                |                  |
	| 33        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 34        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 34        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 34        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 34        | Subjects       | Physics                                               | Text            |                |                  |
	| 34        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 34        | Text           | Text1                                                 | Text            |                |                  |
	| 34        | Integer        | 1                                                     | Text            |                |                  |
	| 34        | WT_Units       | KG                                                    | Text            |                |                  |
	| 34        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 35        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 35        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 35        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 35        | Subjects       | Botony                                                | Text            |                |                  |
	| 35        | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 35        | Text           | Text3                                                 | Text            |                |                  |
	| 35        | Integer        | 3                                                     | Text            |                |                  |
	| 35        | WT_Units       | KG                                                    | Text            |                |                  |
	| 35        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 36        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 36        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 36        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 36        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 36        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 36        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 36        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 36        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 36        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 37        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 37        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 37        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 37        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 37        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 37        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 37        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 37        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 37        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 38        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 38        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 38        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 38        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 38        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 38        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 38        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 38        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 38        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 39        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 39        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 39        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 39        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 39        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 39        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 39        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 39        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 39        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 40        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 40        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 40        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 40        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 40        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 40        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 40        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 40        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 40        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 41        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 41        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 41        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 41        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 41        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 41        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 41        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 41        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 41        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 42        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 42        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 42        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 42        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 42        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 42        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 42        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 42        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 42        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 43        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 43        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 43        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 43        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 43        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 43        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 43        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 43        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 43        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 44        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 44        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 44        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 44        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 44        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 44        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 44        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 44        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 44        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 45        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 45        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 45        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 45        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 45        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 45        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 45        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 45        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 45        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 46        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 46        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 46        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 46        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 46        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 46        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 46        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 46        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 46        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 47        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 47        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 47        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 47        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 47        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 47        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 47        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 47        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 47        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 48        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 48        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 48        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 48        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 48        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 48        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 48        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 48        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 48        | Date           |                                                       | Textbox         | Unsaved        | OK               |

@ObjectiveEvidence @ReqID:US53883,US55962
Scenario: 014_ADD CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 001-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #48: Added            | Study design change |
    | System (System\System) | Row #47: Added            | Study design change |
    | System (System\System) | Row #46: Added            | Study design change |
    | System (System\System) | Row #45: Added            | Study design change |
    | System (System\System) | Row #44: Added            | Study design change |
    | System (System\System) | Row #43: Added            | Study design change |
    | System (System\System) | Row #42: Added            | Study design change |
    | System (System\System) | Row #41: Added            | Study design change |
    | System (System\System) | Row #40: Added            | Study design change |
    | System (System\System) | Row #39: Added            | Study design change |
    | System (System\System) | Row #38: Added            | Study design change |
    | System (System\System) | Row #37: Added            | Study design change |
    | System (System\System) | Row #36: Added            | Study design change |
    | System (System\System) | Row #32: Added            | Study design change |
    | System (System\System) | Row #31: Added            | Study design change |
    | System (System\System) | Row #30: Added            | Study design change |
    | System (System\System) | Row #29: Added            | Study design change |
    | System (System\System) | Row #28: Added            | Study design change |
    | System (System\System) | Row #24: Added            | Study design change |
    | System (System\System) | Row #20: Added            | Study design change |
    | System (System\System) | Row #19: Added            | Study design change |
    | System (System\System) | Row #18: Added            | Study design change |
    | System (System\System) | Row #17: Added            | Study design change |
    | System (System\System) | Row #16: Added            | Study design change |
    | System (System\System) | Row #12: Added            | Study design change |
    | System (System\System) | Row #8: Added             | Study design change |
    | System (System\System) | Row #7: Added             | Study design change |
    | System (System\System) | Row #6: Added             | Study design change |
    | System (System\System) | Row #5: Added             | Study design change |
    | System (System\System) | Row #4: Added             | Study design change |
    | System (System\System) | Row #18 renumbered to #35 | Study design change |
    | System (System\System) | Row #17 renumbered to #34 | Study design change |
    | System (System\System) | Row #16 renumbered to #33 | Study design change |
    | System (System\System) | Row #15 renumbered to #27 | Study design change |
    | System (System\System) | Row #14 renumbered to #26 | Study design change |
    | System (System\System) | Row #13 renumbered to #25 | Study design change |
    | System (System\System) | Row #12 renumbered to #23 | Study design change |
    | System (System\System) | Row #11 renumbered to #22 | Study design change |
    | System (System\System) | Row #10 renumbered to #21 | Study design change |
    | System (System\System) | Row #9 renumbered to #15  | Study design change |
    | System (System\System) | Row #8 renumbered to #14  | Study design change |
    | System (System\System) | Row #7 renumbered to #13  | Study design change |
    | System (System\System) | Row #6 renumbered to #11  | Study design change |
    | System (System\System) | Row #5 renumbered to #10  | Study design change |
    | System (System\System) | Row #4 renumbered to #9   | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqID:US48808
Scenario: 015_ADD CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Saved [Incomplete]           |
	| PI Signature [ Changed ]     |
	| Migration to 20090330 (v3.0) |

@ObjectiveEvidence @ReqID:US52679,US52808,US52673
Scenario: 016_ADD CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | SDVerify | MReview | DReview | Signed  |
	| AB_WithThreeKeySequenceColumns_4 | PartialSubmit | Some     | Some    | Some    | Changed |

############# ADD CODE ITEM 002-PATIENT ###############

@ObjectiveEvidence @ReqID:US48808
Scenario: 017_ADD CODE ITEM_Verify data in the form AB_WithOneKeySequenceColumn of patinet 002-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "002-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	Then I verify below "AutobuildFixed with key sequence 1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | BodyRegion     | Hair                                                  | Text            |                |                  |
	| 1         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 1         | Date           |                                                       | Textbox         |                | OK               |
	| 2         | BodyRegion     | Eyes                                                  | Text            |                |                  |
	| 2         | Subjects       | Chemistry                                             | Text            |                |                  |
	| 2         | Measurement    | Meters\r\nKgs                                         | Text            |                |                  |
	| 2         | Text           | Text2                                                 | Text            |                |                  |
	| 2         | Integer        | 2                                                     | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | BodyRegion     | Ears                                                  | Text            |                |                  |
	| 3         | Subjects       | Botony                                                | Text            |                |                  |
	| 3         | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 3         | Text           | Text3                                                 | Text            |                |                  |
	| 3         | Integer        | 3                                                     | Text            |                |                  |
	| 3         | WT_Units       | KG                                                    | Text            |                |                  |
	| 3         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 4         | BodyRegion     | Nose                                                  | Text            |                |                  |
	| 4         | Subjects       | Zoology                                               | Text            |                |                  |
	| 4         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 4         | Text           | Text4                                                 | Text            |                |                  |
	| 4         | Integer        | 4                                                     | Text            |                |                  |
	| 4         | WT_Units       | KG                                                    | Text            |                |                  |
	| 4         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 5         | BodyRegion     | Chest                                                 | Text            |                |                  |
	| 5         | Subjects       | Civics                                                | Text            |                |                  |
	| 5         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 5         | Text           | Text5                                                 | Text            |                |                  |
	| 5         | Integer        | 5                                                     | Text            |                |                  |
	| 5         | WT_Units       | LB                                                    | Text            |                |                  |
	| 5         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 6         | BodyRegion     | Arm                                                   | Text            |                |                  |
	| 6         | Subjects       | Economics                                             | Text            |                |                  |
	| 6         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 6         | Text           | Text6                                                 | Text            |                |                  |
	| 6         | Integer        | 6                                                     | Text            |                |                  |
	| 6         | WT_Units       | LB                                                    | Text            |                |                  |
	| 6         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 7         | BodyRegion     | Leg                                                   | Text            |                |                  |
	| 7         | Subjects       | Commerce                                              | Text            |                |                  |
	| 7         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 7         | Text           | Text7                                                 | Text            |                |                  |
	| 7         | Integer        | 7                                                     | Text            |                |                  |
	| 7         | WT_Units       | LB                                                    | Text            |                |                  |
	| 7         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 8         | BodyRegion     | Head                                                  | Text            |                |                  |
	| 8         | Subjects       | Physics                                               | Text            |                |                  |
	| 8         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 8         | Text           | Text1                                                 | Text            |                |                  |
	| 8         | Integer        | 1                                                     | Text            |                |                  |
	| 8         | WT_Units       | KG                                                    | Text            |                |                  |
	| 8         | Date           | 02/12/2019                                            | Text            |                | OK               |

@ObjectiveEvidence @ReqID:US53883,US55962
Scenario: 018_ADD CODE ITEM_Verify table history for table AutobuildFixed with key sequence 1: of 002-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 1:"
    Then I see ordered table history for table "Table Name" in TableHistoryModalDialog
    | Name                   | Action                  | AdditionalNotes     |
    | System (System\System) | Row #1: Added           | Study design change |
    | System (System\System) | Row #7 renumbered to #8 | Study design change |
    | System (System\System) | Row #6 renumbered to #7 | Study design change |
    | System (System\System) | Row #5 renumbered to #6 | Study design change |
    | System (System\System) | Row #4 renumbered to #5 | Study design change |
    | System (System\System) | Row #3 renumbered to #4 | Study design change |
    | System (System\System) | Row #2 renumbered to #3 | Study design change |
    | System (System\System) | Row #1 renumbered to #2 | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqID:US48808
Scenario: 019_ADD CODE ITEM_Verify Workflow for form AB_WithOneKeySequenceColumn of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v3.0) |
	
@ObjectiveEvidence @ReqID:US52679,US52808,US52673
Scenario: 020_ADD CODE ITEM_Verify Flags and Signature status for form AB_WithOneKeySequenceColumn of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                         | FormStatus    | DCF | SDVerify | MReview | DReview | Signed | Frozen | Locked |
	| AB_WithOneKeySequenceColumn | PartialSubmit |     | Some       | Some      | Some      | Ready  |        |        |
	#| AB_WithOneKeySequenceColumn      | Submit/PartialSubmit/NotSaved        |   On/Off/Some  | On/Off/Some       | On/Off/Some      | On/Off/Some      | Ready/Signed/Rejected    |  On/Off/Some      |  On/Off/Some      |	

@ObjectiveEvidence @ReqID:US48808
Scenario: 021_ADD CODE ITEM_Verify data in the form AB_WithTwoKeySequenceColumns of patinet 002-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithTwoKeySequenceColumns" CRF.
	Then I verify below "AutobuildFixed with key sequence 2_12:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 1         | STATUS         | [Blank]                                               | Text            |                |                  |
	| 1         | Subjects       | Civics                                                | Text            |                |                  |
	| 1         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 1         | Text           | Text5                                                 | Text            |                |                  |
	| 1         | Integer        | 5                                                     | Text            |                |                  |
	| 1         | WT_Units       | LB                                                    | Text            |                |                  |
	| 1         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 2         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 2         | STATUS         | Dead                                                  | Text            |                |                  |
	| 2         | Subjects       | C                                                     | Text            |                |                  |
	| 2         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 2         | Text           | Text8                                                 | Text            |                |                  |
	| 2         | Integer        | 8                                                     | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 3         | STATUS         | Critical                                              | Text            |                |                  |
	| 3         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 3         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 3         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 3         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 3         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 3         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 4         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 4         | STATUS         | Lost to follow-up                                     | Text            |                |                  |
	| 4         | Subjects       | Economics                                             | Text            |                |                  |
	| 4         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 4         | Text           | Text6                                                 | Text            |                |                  |
	| 4         | Integer        | 6                                                     | Text            |                |                  |
	| 4         | WT_Units       | LB                                                    | Text            |                |                  |
	| 4         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 5         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                |                  |
	| 5         | STATUS         | Alive                                                 | Text            |                |                  |
	| 5         | Subjects       | Commerce                                              | Text            |                |                  |
	| 5         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 5         | Text           | Text7                                                 | Text            |                |                  |
	| 5         | Integer        | 7                                                     | Text            |                |                  |
	| 5         | WT_Units       | LB                                                    | Text            |                |                  |
	| 5         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 6         | TATYPE         | [Blank]                                               | Text            |                |                  |
	| 6         | STATUS         | [Blank]                                               | Text            |                |                  |
	| 6         | Subjects       | Physics                                               | Text            |                |                  |
	| 6         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 6         | Text           | Text1                                                 | Text            |                |                  |
	| 6         | Integer        | 1                                                     | Text            |                |                  |
	| 6         | WT_Units       | KG                                                    | Text            |                |                  |
	| 6         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 7         | TATYPE         | [Blank]                                               | Text            |                |                  |
	| 7         | STATUS         | Dead                                                  | Text            |                |                  |
	| 7         | Subjects       | Zoology                                               | Text            |                |                  |
	| 7         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 7         | Text           | Text4                                                 | Text            |                |                  |
	| 7         | Integer        | 4                                                     | Text            |                |                  |
	| 7         | WT_Units       | KG                                                    | Text            |                |                  |
	| 7         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 8         | TATYPE         | [Blank]                                               | Text            |                |                  |
	| 8         | STATUS         | Critical                                              | Text            |                |                  |
	| 8         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 8         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 9         | Subjects       | Chemistry                                             | Text            |                |                  |
	| 9         | Measurement    | Meters\r\nKgs                                         | Text            |                |                  |
	| 9         | Text           | Text2                                                 | Text            |                |                  |
	| 9         | Integer        | 2                                                     | Text            |                |                  |
	| 9         | WT_Units       | KG                                                    | Text            |                |                  |
	| 9         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 10        | TATYPE         | [Blank]                                               | Text            |                |                  |
	| 10        | STATUS         | Alive                                                 | Text            |                |                  |
	| 10        | Subjects       | Botony                                                | Text            |                |                  |
	| 10        | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 10        | Text           | Text3                                                 | Text            |                |                  |
	| 10        | Integer        | 3                                                     | Text            |                |                  |
	| 10        | WT_Units       | KG                                                    | Text            |                |                  |
	| 10        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 11        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 11        | STATUS         | [Blank]                                               | Text            |                |                  |
	| 11        | Subjects       | C++                                                   | Text            |                |                  |
	| 11        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 11        | Text           | Text9                                                 | Text            |                |                  |
	| 11        | Integer        | 9                                                     | Text            |                |                  |
	| 11        | WT_Units       | LB                                                    | Text            |                |                  |
	| 11        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 12        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 12        | STATUS         | Dead                                                  | Text            |                |                  |
	| 12        | Subjects       | DigitalElectronics                                    | Text            |                |                  |
	| 12        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 12        | Text           | Text12                                                | Text            |                |                  |
	| 12        | Integer        | 12                                                    | Text            |                |                  |
	| 12        | WT_Units       | LB                                                    | Text            |                |                  |
	| 12        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 13        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 13        | STATUS         | Critical                                              | Text            |                |                  |
	| 13        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 13        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 13        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 13        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 13        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 13        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 14        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 14        | STATUS         | Lost to follow-up                                     | Text            |                |                  |
	| 14        | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 14        | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 14        | Text           | Text10                                                | Text            |                |                  |
	| 14        | Integer        | 10                                                    | Text            |                |                  |
	| 14        | WT_Units       | KG                                                    | Text            |                |                  |
	| 14        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 15        | TATYPE         | Lymphatic Lesion                                      | Text            |                |                  |
	| 15        | STATUS         | Alive                                                 | Text            |                |                  |
	| 15        | Subjects       | DataStructures                                        | Text            |                |                  |
	| 15        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 15        | Text           | Text11                                                | Text            |                |                  |
	| 15        | Integer        | 11                                                    | Text            |                |                  |
	| 15        | WT_Units       | LB                                                    | Text            |                |                  |
	| 15        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 16        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 16        | STATUS         | [Blank]                                               | Text            |                |                  |
	| 16        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 16        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 17        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 17        | STATUS         | Dead                                                  | Text            |                |                  |
	| 17        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 17        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 18        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 18        | STATUS         | Critical                                              | Text            |                |                  |
	| 18        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 18        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 19        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 19        | STATUS         | Lost to follow-up                                     | Text            |                |                  |
	| 19        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 19        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 19        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 19        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 19        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 19        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 20        | TATYPE         | Lesion                                                | Text            |                |                  |
	| 20        | STATUS         | Alive                                                 | Text            |                |                  |
	| 20        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 20        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 20        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 20        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 20        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 20        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	
@ObjectiveEvidence @ReqID:US53883,US55962
Scenario: 022_ADD CODE ITEM_Verify table history for table AutobuildFixed with key sequence 2_12 of form AB_WithTwoKeySequenceColumns of 002-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 2_12:"
    Then I see ordered table history for table "AutobuildFixed with key sequence 2_12:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #20: Added            | Study design change |
    | System (System\System) | Row #19: Added            | Study design change |
    | System (System\System) | Row #18: Added            | Study design change |
    | System (System\System) | Row #17: Added            | Study design change |
    | System (System\System) | Row #16: Added            | Study design change |
    | System (System\System) | Row #13: Added            | Study design change |
    | System (System\System) | Row #8: Added             | Study design change |
    | System (System\System) | Row #3: Added             | Study design change |
    | System (System\System) | Row #12 renumbered to #15 | Study design change |
    | System (System\System) | Row #11 renumbered to #14 | Study design change |
    | System (System\System) | Row #10 renumbered to #12 | Study design change |
    | System (System\System) | Row #9 renumbered to #11  | Study design change |
    | System (System\System) | Row #8 renumbered to #10  | Study design change |
    | System (System\System) | Row #7 renumbered to #9   | Study design change |
    | System (System\System) | Row #6 renumbered to #7   | Study design change |
    | System (System\System) | Row #5 renumbered to #6   | Study design change |
    | System (System\System) | Row #4 renumbered to #5   | Study design change |
    | System (System\System) | Row #3 renumbered to #4   | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqID:US48808
Scenario: 023_ADD CODE ITEM_Verify Workflow for form AB_WithTwoKeySequenceColumns of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Migration to 20090330 (v3.0) |

@ObjectiveEvidence @ReqID:US52679,US52808,US52673
Scenario: 024_ADD CODE ITEM_Verify Flags and Signature status for form AB_WithTwoKeySequenceColumn of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                          | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithTwoKeySequenceColumns | PartialSubmit | Some     | Some    | Some    | Ready  |

@ObjectiveEvidence @ReqID:US48808
Scenario: 025_ADD CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 002-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 1         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 1         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 1         | Subjects       | DataStructures                                        | Text            |                |                  |
	| 1         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 1         | Text           | Text11                                                | Text            |                |                  |
	| 1         | Integer        | 11                                                    | Text            |                |                  |
	| 1         | WT_Units       | LB                                                    | Text            |                |                  |
	| 1         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 2         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 2         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 2         | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 2         | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 2         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 2         | Text           | Text10                                                | Text            |                |                  |
	| 2         | Integer        | 10                                                    | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 3         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 3         | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 3         | Subjects       | DigitalElectronics                                    | Text            |                |                  |
	| 3         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 3         | Text           | Text12                                                | Text            |                |                  |
	| 3         | Integer        | 12                                                    | Text            |                |                  |
	| 3         | WT_Units       | LB                                                    | Text            |                |                  |
	| 3         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 4         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 4         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 4         | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 4         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 4         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 5         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 5         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 5         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 5         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 5         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 6         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 6         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 6         | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 6         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 6         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 6         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 6         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 6         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 6         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 7         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 7         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 7         | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 7         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 7         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 8         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 8         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 8         | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 8         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 8         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 9         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 9         | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 9         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 9         | Subjects       | C                                                     | Text            |                |                  |
	| 9         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 9         | Text           | Text8                                                 | Text            |                |                  |
	| 9         | Integer        | 8                                                     | Text            |                |                  |
	| 9         | WT_Units       | KG                                                    | Text            |                |                  |
	| 9         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 10        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 10        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 10        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 10        | Subjects       | Commerce                                              | Text            |                |                  |
	| 10        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 10        | Text           | Text7                                                 | Text            |                |                  |
	| 10        | Integer        | 7                                                     | Text            |                |                  |
	| 10        | WT_Units       | LB                                                    | Text            |                |                  |
	| 10        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 11        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 11        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 11        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 11        | Subjects       | C++                                                   | Text            |                |                  |
	| 11        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 11        | Text           | Text9                                                 | Text            |                |                  |
	| 11        | Integer        | 9                                                     | Text            |                |                  |
	| 11        | WT_Units       | LB                                                    | Text            |                |                  |
	| 11        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 12        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 12        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 12        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 12        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 12        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 12        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 12        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 12        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 12        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 13        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 13        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 13        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 13        | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 13        | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 13        | Text           | Text17                                                | Text            |                |                  |
	| 13        | Integer        | 17                                                    | Text            |                |                  |
	| 13        | WT_Units       | KG                                                    | Text            |                |                  |
	| 13        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 14        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 14        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 14        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 14        | Subjects       | C++                                                   | Text            |                |                  |
	| 14        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 14        | Text           | Text16                                                | Text            |                |                  |
	| 14        | Integer        | 16                                                    | Text            |                |                  |
	| 14        | WT_Units       | LB                                                    | Text            |                |                  |
	| 14        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 15        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 15        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 15        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 15        | Subjects       | DataStructures                                        | Text            |                |                  |
	| 15        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 15        | Text           | Text18                                                | Text            |                |                  |
	| 15        | Integer        | 18                                                    | Text            |                |                  |
	| 15        | WT_Units       | LB                                                    | Text            |                |                  |
	| 15        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 16        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 16        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 16        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 16        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 16        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 17        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 17        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 17        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 17        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 17        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 18        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 18        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 18        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 18        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 18        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 19        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 19        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 19        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 19        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 19        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 19        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 19        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 19        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 19        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 20        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 20        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 20        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 20        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 20        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 20        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 20        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 20        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 20        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 21        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 21        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 21        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 21        | Subjects       | Commerce                                              | Text            |                |                  |
	| 21        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 21        | Text           | Text14                                                | Text            |                |                  |
	| 21        | Integer        | 14                                                    | Text            |                |                  |
	| 21        | WT_Units       | LB                                                    | Text            |                |                  |
	| 21        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 22        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 22        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 22        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 22        | Subjects       | Economics                                             | Text            |                |                  |
	| 22        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 22        | Text           | Text13                                                | Text            |                |                  |
	| 22        | Integer        | 13                                                    | Text            |                |                  |
	| 22        | WT_Units       | LB                                                    | Text            |                |                  |
	| 22        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 23        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 23        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 23        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 23        | Subjects       | C                                                     | Text            |                |                  |
	| 23        | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 23        | Text           | Text15                                                | Text            |                |                  |
	| 23        | Integer        | 15                                                    | Text            |                |                  |
	| 23        | WT_Units       | KG                                                    | Text            |                |                  |
	| 23        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 24        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 24        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 24        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 24        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 24        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 24        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 24        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 24        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 24        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 25        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 25        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 25        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 25        | Subjects       | Civics                                                | Text            |                |                  |
	| 25        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 25        | Text           | Text5                                                 | Text            |                |                  |
	| 25        | Integer        | 5                                                     | Text            |                |                  |
	| 25        | WT_Units       | LB                                                    | Text            |                |                  |
	| 25        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 26        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 26        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 26        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 26        | Subjects       | Zoology                                               | Text            |                |                  |
	| 26        | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 26        | Text           | Text4                                                 | Text            |                |                  |
	| 26        | Integer        | 4                                                     | Text            |                |                  |
	| 26        | WT_Units       | KG                                                    | Text            |                |                  |
	| 26        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 27        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 27        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 27        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 27        | Subjects       | Economics                                             | Text            |                |                  |
	| 27        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 27        | Text           | Text6                                                 | Text            |                |                  |
	| 27        | Integer        | 6                                                     | Text            |                |                  |
	| 27        | WT_Units       | LB                                                    | Text            |                |                  |
	| 27        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 28        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 28        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 28        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 28        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 28        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 28        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 28        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 28        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 28        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 29        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 29        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 29        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 29        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 29        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 29        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 29        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 29        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 29        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 30        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 30        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 30        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 30        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 30        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 30        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 30        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 30        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 30        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 31        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 31        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 31        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 31        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 31        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 31        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 31        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 31        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 31        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 32        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 32        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 32        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 32        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 32        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 32        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 32        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 32        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 32        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 33        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 33        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 33        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 33        | Subjects       | Chemistry                                             | Text            |                |                  |
	| 33        | Measurement    | Meters\r\nKgs                                         | Text            |                |                  |
	| 33        | Text           | Text2                                                 | Text            |                |                  |
	| 33        | Integer        | 2                                                     | Text            |                |                  |
	| 33        | WT_Units       | KG                                                    | Text            |                |                  |
	| 33        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 34        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 34        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 34        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 34        | Subjects       | Physics                                               | Text            |                |                  |
	| 34        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 34        | Text           | Text1                                                 | Text            |                |                  |
	| 34        | Integer        | 1                                                     | Text            |                |                  |
	| 34        | WT_Units       | KG                                                    | Text            |                |                  |
	| 34        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 35        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 35        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 35        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 35        | Subjects       | Botony                                                | Text            |                |                  |
	| 35        | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 35        | Text           | Text3                                                 | Text            |                |                  |
	| 35        | Integer        | 3                                                     | Text            |                |                  |
	| 35        | WT_Units       | KG                                                    | Text            |                |                  |
	| 35        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 36        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 36        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 36        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 36        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 36        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 36        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 36        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 36        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 36        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 37        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 37        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 37        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 37        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 37        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 37        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 37        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 37        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 37        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 38        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 38        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 38        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 38        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 38        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 38        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 38        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 38        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 38        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 39        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 39        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 39        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 39        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 39        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 39        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 39        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 39        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 39        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 40        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 40        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 40        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 40        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 40        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 40        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 40        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 40        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 40        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 41        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 41        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 41        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 41        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 41        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 41        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 41        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 41        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 41        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 42        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 42        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 42        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 42        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 42        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 42        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 42        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 42        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 42        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 43        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 43        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 43        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 43        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 43        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 43        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 43        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 43        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 43        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 44        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 44        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 44        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 44        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 44        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 44        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 44        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 44        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 44        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 45        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 45        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 45        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 45        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 45        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 45        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 45        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 45        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 45        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 46        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 46        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 46        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 46        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 46        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 46        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 46        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 46        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 46        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 47        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 47        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 47        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 47        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 47        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 47        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 47        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 47        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 47        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 48        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 48        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 48        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 48        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 48        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 48        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 48        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 48        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 48        | Date           |                                                       | Textbox         | Unsaved        | OK               |

@ObjectiveEvidence @ReqID:US53883,US55962
Scenario: 026_ADD CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 002-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #48: Added            | Study design change |
    | System (System\System) | Row #47: Added            | Study design change |
    | System (System\System) | Row #46: Added            | Study design change |
    | System (System\System) | Row #45: Added            | Study design change |
    | System (System\System) | Row #44: Added            | Study design change |
    | System (System\System) | Row #43: Added            | Study design change |
    | System (System\System) | Row #42: Added            | Study design change |
    | System (System\System) | Row #41: Added            | Study design change |
    | System (System\System) | Row #40: Added            | Study design change |
    | System (System\System) | Row #39: Added            | Study design change |
    | System (System\System) | Row #38: Added            | Study design change |
    | System (System\System) | Row #37: Added            | Study design change |
    | System (System\System) | Row #36: Added            | Study design change |
    | System (System\System) | Row #32: Added            | Study design change |
    | System (System\System) | Row #31: Added            | Study design change |
    | System (System\System) | Row #30: Added            | Study design change |
    | System (System\System) | Row #29: Added            | Study design change |
    | System (System\System) | Row #28: Added            | Study design change |
    | System (System\System) | Row #24: Added            | Study design change |
    | System (System\System) | Row #20: Added            | Study design change |
    | System (System\System) | Row #19: Added            | Study design change |
    | System (System\System) | Row #18: Added            | Study design change |
    | System (System\System) | Row #17: Added            | Study design change |
    | System (System\System) | Row #16: Added            | Study design change |
    | System (System\System) | Row #12: Added            | Study design change |
    | System (System\System) | Row #8: Added             | Study design change |
    | System (System\System) | Row #7: Added             | Study design change |
    | System (System\System) | Row #6: Added             | Study design change |
    | System (System\System) | Row #5: Added             | Study design change |
    | System (System\System) | Row #4: Added             | Study design change |
    | System (System\System) | Row #18 renumbered to #35 | Study design change |
    | System (System\System) | Row #17 renumbered to #34 | Study design change |
    | System (System\System) | Row #16 renumbered to #33 | Study design change |
    | System (System\System) | Row #15 renumbered to #27 | Study design change |
    | System (System\System) | Row #14 renumbered to #26 | Study design change |
    | System (System\System) | Row #13 renumbered to #25 | Study design change |
    | System (System\System) | Row #12 renumbered to #23 | Study design change |
    | System (System\System) | Row #11 renumbered to #22 | Study design change |
    | System (System\System) | Row #10 renumbered to #21 | Study design change |
    | System (System\System) | Row #9 renumbered to #15  | Study design change |
    | System (System\System) | Row #8 renumbered to #14  | Study design change |
    | System (System\System) | Row #7 renumbered to #13  | Study design change |
    | System (System\System) | Row #6 renumbered to #11  | Study design change |
    | System (System\System) | Row #5 renumbered to #10  | Study design change |
    | System (System\System) | Row #4 renumbered to #9   | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqID:US48808
Scenario: 027_ADD CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action             |
	| SD-Verify [ Some ] |
	| M-Review [ Some ] |
	| D-Review [ Some ] |
	| Saved [Incomplete] |	
	| Migration to 20090330 (v3.0) |

@ObjectiveEvidence @ReqID:US52679,US52808,US52673
Scenario: 028_ADD CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithThreeKeySequenceColumns_4 | PartialSubmit | Some     | Some    | Some    | Ready  |


################### ADD CODE ITEM - 003-Patient ##################

@ObjectiveEvidence @ReqID:US48808
Scenario: 029_ADD CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 003-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "003-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 1         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 1         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 1         | Subjects       | DataStructures                                        | Text            |                |                  |
	| 1         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 1         | Text           | Text11                                                | Text            |                |                  |
	| 1         | Integer        | 11                                                    | Text            |                |                  |
	| 1         | WT_Units       | LB                                                    | Text            |                |                  |
	| 1         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 2         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 2         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 2         | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 2         | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 2         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 2         | Text           | Text10                                                | Text            |                |                  |
	| 2         | Integer        | 10                                                    | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 3         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 3         | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 3         | Subjects       | DigitalElectronics                                    | Text            |                |                  |
	| 3         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 3         | Text           | Text12                                                | Text            |                |                  |
	| 3         | Integer        | 12                                                    | Text            |                |                  |
	| 3         | WT_Units       | LB                                                    | Text            |                |                  |
	| 3         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 4         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 4         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 4         | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 4         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 4         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 5         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 5         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 5         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 5         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 5         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 6         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 6         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 6         | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 6         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 6         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 6         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 6         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 6         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 6         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 7         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 7         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 7         | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 7         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 7         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 8         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 8         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 8         | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 8         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 8         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 9         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 9         | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 9         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 9         | Subjects       | C                                                     | Text            |                |                  |
	| 9         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 9         | Text           | Text8                                                 | Text            |                |                  |
	| 9         | Integer        | 8                                                     | Text            |                |                  |
	| 9         | WT_Units       | KG                                                    | Text            |                |                  |
	| 9         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 10        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 10        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 10        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 10        | Subjects       | Commerce                                              | Text            |                |                  |
	| 10        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 10        | Text           | Text7                                                 | Text            |                |                  |
	| 10        | Integer        | 7                                                     | Text            |                |                  |
	| 10        | WT_Units       | LB                                                    | Text            |                |                  |
	| 10        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 11        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 11        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 11        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 11        | Subjects       | C++                                                   | Text            |                |                  |
	| 11        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 11        | Text           | Text9                                                 | Text            |                |                  |
	| 11        | Integer        | 9                                                     | Text            |                |                  |
	| 11        | WT_Units       | LB                                                    | Text            |                |                  |
	| 11        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 12        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 12        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 12        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 12        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 12        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 12        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 12        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 12        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 12        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 13        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 13        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 13        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 13        | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 13        | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 13        | Text           | Text17                                                | Text            |                |                  |
	| 13        | Integer        | 17                                                    | Text            |                |                  |
	| 13        | WT_Units       | KG                                                    | Text            |                |                  |
	| 13        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 14        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 14        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 14        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 14        | Subjects       | C++                                                   | Text            |                |                  |
	| 14        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 14        | Text           | Text16                                                | Text            |                |                  |
	| 14        | Integer        | 16                                                    | Text            |                |                  |
	| 14        | WT_Units       | LB                                                    | Text            |                |                  |
	| 14        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 15        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 15        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 15        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 15        | Subjects       | DataStructures                                        | Text            |                |                  |
	| 15        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 15        | Text           | Text18                                                | Text            |                |                  |
	| 15        | Integer        | 18                                                    | Text            |                |                  |
	| 15        | WT_Units       | LB                                                    | Text            |                |                  |
	| 15        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 16        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 16        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 16        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 16        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 16        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 17        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 17        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 17        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 17        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 17        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 18        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 18        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 18        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 18        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 18        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 19        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 19        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 19        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 19        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 19        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 19        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 19        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 19        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 19        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 20        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 20        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 20        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 20        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 20        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 20        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 20        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 20        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 20        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 21        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 21        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 21        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 21        | Subjects       | Commerce                                              | Text            |                |                  |
	| 21        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 21        | Text           | Text14                                                | Text            |                |                  |
	| 21        | Integer        | 14                                                    | Text            |                |                  |
	| 21        | WT_Units       | LB                                                    | Text            |                |                  |
	| 21        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 22        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 22        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 22        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 22        | Subjects       | Economics                                             | Text            |                |                  |
	| 22        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 22        | Text           | Text13                                                | Text            |                |                  |
	| 22        | Integer        | 13                                                    | Text            |                |                  |
	| 22        | WT_Units       | LB                                                    | Text            |                |                  |
	| 22        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 23        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 23        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 23        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 23        | Subjects       | C                                                     | Text            |                |                  |
	| 23        | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 23        | Text           | Text15                                                | Text            |                |                  |
	| 23        | Integer        | 15                                                    | Text            |                |                  |
	| 23        | WT_Units       | KG                                                    | Text            |                |                  |
	| 23        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 24        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 24        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 24        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 24        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 24        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 24        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 24        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 24        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 24        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 25        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 25        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 25        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 25        | Subjects       | Civics                                                | Text            |                |                  |
	| 25        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 25        | Text           | Text5                                                 | Text            |                |                  |
	| 25        | Integer        | 5                                                     | Text            |                |                  |
	| 25        | WT_Units       | LB                                                    | Text            |                |                  |
	| 25        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 26        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 26        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 26        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 26        | Subjects       | Zoology                                               | Text            |                |                  |
	| 26        | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 26        | Text           | Text4                                                 | Text            |                |                  |
	| 26        | Integer        | 4                                                     | Text            |                |                  |
	| 26        | WT_Units       | KG                                                    | Text            |                |                  |
	| 26        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 27        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 27        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 27        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 27        | Subjects       | Economics                                             | Text            |                |                  |
	| 27        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 27        | Text           | Text6                                                 | Text            |                |                  |
	| 27        | Integer        | 6                                                     | Text            |                |                  |
	| 27        | WT_Units       | LB                                                    | Text            |                |                  |
	| 27        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 28        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 28        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 28        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 28        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 28        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 28        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 28        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 28        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 28        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 29        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 29        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 29        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 29        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 29        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 29        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 29        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 29        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 29        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 30        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 30        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 30        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 30        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 30        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 30        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 30        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 30        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 30        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 31        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 31        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 31        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 31        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 31        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 31        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 31        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 31        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 31        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 32        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 32        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 32        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 32        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 32        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 32        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 32        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 32        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 32        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 33        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 33        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 33        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 33        | Subjects       | Chemistry                                             | Text            |                |                  |
	| 33        | Measurement    | Meters\r\nKgs                                         | Text            |                |                  |
	| 33        | Text           | Text2                                                 | Text            |                |                  |
	| 33        | Integer        | 2                                                     | Text            |                |                  |
	| 33        | WT_Units       | KG                                                    | Text            |                |                  |
	| 33        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 34        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 34        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 34        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 34        | Subjects       | Physics                                               | Text            |                |                  |
	| 34        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 34        | Text           | Text1                                                 | Text            |                |                  |
	| 34        | Integer        | 1                                                     | Text            |                |                  |
	| 34        | WT_Units       | KG                                                    | Text            |                |                  |
	| 34        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 35        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 35        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 35        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 35        | Subjects       | Botony                                                | Text            |                |                  |
	| 35        | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 35        | Text           | Text3                                                 | Text            |                |                  |
	| 35        | Integer        | 3                                                     | Text            |                |                  |
	| 35        | WT_Units       | KG                                                    | Text            |                |                  |
	| 35        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 36        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 36        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 36        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 36        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 36        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 36        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 36        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 36        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 36        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 37        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 37        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 37        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 37        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 37        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 37        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 37        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 37        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 37        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 38        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 38        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 38        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 38        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 38        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 38        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 38        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 38        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 38        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 39        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 39        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 39        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 39        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 39        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 39        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 39        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 39        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 39        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 40        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 40        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 40        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 40        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 40        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 40        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 40        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 40        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 40        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 41        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 41        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 41        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 41        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 41        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 41        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 41        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 41        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 41        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 42        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 42        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 42        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 42        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 42        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 42        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 42        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 42        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 42        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 43        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 43        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 43        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 43        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 43        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 43        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 43        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 43        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 43        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 44        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 44        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 44        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 44        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 44        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 44        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 44        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 44        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 44        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 45        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 45        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 45        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 45        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 45        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 45        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 45        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 45        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 45        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 46        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 46        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 46        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 46        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 46        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 46        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 46        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 46        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 46        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 47        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 47        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 47        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 47        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 47        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 47        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 47        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 47        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 47        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 48        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 48        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 48        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 48        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 48        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 48        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 48        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 48        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 48        | Date           |                                                       | Textbox         | Unsaved        | OK               |

@ObjectiveEvidence @ReqID:US53883,US55962
Scenario: 030_ADD CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 003-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #48: Added            | Study design change |
    | System (System\System) | Row #47: Added            | Study design change |
    | System (System\System) | Row #46: Added            | Study design change |
    | System (System\System) | Row #45: Added            | Study design change |
    | System (System\System) | Row #44: Added            | Study design change |
    | System (System\System) | Row #43: Added            | Study design change |
    | System (System\System) | Row #42: Added            | Study design change |
    | System (System\System) | Row #41: Added            | Study design change |
    | System (System\System) | Row #40: Added            | Study design change |
    | System (System\System) | Row #39: Added            | Study design change |
    | System (System\System) | Row #38: Added            | Study design change |
    | System (System\System) | Row #37: Added            | Study design change |
    | System (System\System) | Row #36: Added            | Study design change |
    | System (System\System) | Row #32: Added            | Study design change |
    | System (System\System) | Row #31: Added            | Study design change |
    | System (System\System) | Row #30: Added            | Study design change |
    | System (System\System) | Row #29: Added            | Study design change |
    | System (System\System) | Row #28: Added            | Study design change |
    | System (System\System) | Row #24: Added            | Study design change |
    | System (System\System) | Row #20: Added            | Study design change |
    | System (System\System) | Row #19: Added            | Study design change |
    | System (System\System) | Row #18: Added            | Study design change |
    | System (System\System) | Row #17: Added            | Study design change |
    | System (System\System) | Row #16: Added            | Study design change |
    | System (System\System) | Row #12: Added            | Study design change |
    | System (System\System) | Row #8: Added             | Study design change |
    | System (System\System) | Row #7: Added             | Study design change |
    | System (System\System) | Row #6: Added             | Study design change |
    | System (System\System) | Row #5: Added             | Study design change |
    | System (System\System) | Row #4: Added             | Study design change |
    | System (System\System) | Row #18 renumbered to #35 | Study design change |
    | System (System\System) | Row #17 renumbered to #34 | Study design change |
    | System (System\System) | Row #16 renumbered to #33 | Study design change |
    | System (System\System) | Row #15 renumbered to #27 | Study design change |
    | System (System\System) | Row #14 renumbered to #26 | Study design change |
    | System (System\System) | Row #13 renumbered to #25 | Study design change |
    | System (System\System) | Row #12 renumbered to #23 | Study design change |
    | System (System\System) | Row #11 renumbered to #22 | Study design change |
    | System (System\System) | Row #10 renumbered to #21 | Study design change |
    | System (System\System) | Row #9 renumbered to #15  | Study design change |
    | System (System\System) | Row #8 renumbered to #14  | Study design change |
    | System (System\System) | Row #7 renumbered to #13  | Study design change |
    | System (System\System) | Row #6 renumbered to #11  | Study design change |
    | System (System\System) | Row #5 renumbered to #10  | Study design change |
    | System (System\System) | Row #4 renumbered to #9   | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqID:US48808
Scenario: 031_ADD CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 003-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action             |
	| Saved [Incomplete] |
	| Migration to 20090330 (v3.0) |

@ObjectiveEvidence @ReqID:US52679,US52808,US52673
Scenario: 032_ADD CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 003-Patient
	When I click breadcrumb "003-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithThreeKeySequenceColumns_4 | PartialSubmit | Off      | Off     | Off     | Off    |

################## ADD CODE ITEM - 004-Patient ##################

@ObjectiveEvidence @ReqID:US48808
Scenario: 033_ADD CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 004-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "004-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 1         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 1         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 1         | Subjects       | DataStructures                                        | Text            |                |                  |
	| 1         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 1         | Text           | Text11                                                | Text            |                |                  |
	| 1         | Integer        | 11                                                    | Text            |                |                  |
	| 1         | WT_Units       | LB                                                    | Text            |                |                  |
	| 1         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 2         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 2         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 2         | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 2         | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 2         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 2         | Text           | Text10                                                | Text            |                |                  |
	| 2         | Integer        | 10                                                    | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 3         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 3         | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 3         | Subjects       | DigitalElectronics                                    | Text            |                |                  |
	| 3         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 3         | Text           | Text12                                                | Text            |                |                  |
	| 3         | Integer        | 12                                                    | Text            |                |                  |
	| 3         | WT_Units       | LB                                                    | Text            |                |                  |
	| 3         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 4         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 4         | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 4         | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 4         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 4         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 5         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 5         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 5         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 5         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 5         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 6         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 6         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 6         | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 6         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 6         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 6         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 6         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 6         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 6         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 7         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 7         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 7         | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 7         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 7         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 8         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 8         | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 8         | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 8         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 8         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 9         | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 9         | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 9         | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 9         | Subjects       | C                                                     | Text            |                |                  |
	| 9         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 9         | Text           | Text8                                                 | Text            |                |                  |
	| 9         | Integer        | 8                                                     | Text            |                |                  |
	| 9         | WT_Units       | KG                                                    | Text            |                |                  |
	| 9         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 10        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 10        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 10        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 10        | Subjects       | Commerce                                              | Text            |                |                  |
	| 10        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 10        | Text           | Text7                                                 | Text            |                |                  |
	| 10        | Integer        | 7                                                     | Text            |                |                  |
	| 10        | WT_Units       | LB                                                    | Text            |                |                  |
	| 10        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 11        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 11        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 11        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 11        | Subjects       | C++                                                   | Text            |                |                  |
	| 11        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 11        | Text           | Text9                                                 | Text            |                |                  |
	| 11        | Integer        | 9                                                     | Text            |                |                  |
	| 11        | WT_Units       | LB                                                    | Text            |                |                  |
	| 11        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 12        | DRUG           | Study Regimen                                         | Text            |                |                  |
	| 12        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 12        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 12        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 12        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 12        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 12        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 12        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 12        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 13        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 13        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 13        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 13        | Subjects       | ComputerArchitecture                                  | Text            |                |                  |
	| 13        | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                |                  |
	| 13        | Text           | Text17                                                | Text            |                |                  |
	| 13        | Integer        | 17                                                    | Text            |                |                  |
	| 13        | WT_Units       | KG                                                    | Text            |                |                  |
	| 13        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 14        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 14        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 14        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 14        | Subjects       | C++                                                   | Text            |                |                  |
	| 14        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 14        | Text           | Text16                                                | Text            |                |                  |
	| 14        | Integer        | 16                                                    | Text            |                |                  |
	| 14        | WT_Units       | LB                                                    | Text            |                |                  |
	| 14        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 15        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 15        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 15        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 15        | Subjects       | DataStructures                                        | Text            |                |                  |
	| 15        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 15        | Text           | Text18                                                | Text            |                |                  |
	| 15        | Integer        | 18                                                    | Text            |                |                  |
	| 15        | WT_Units       | LB                                                    | Text            |                |                  |
	| 15        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 16        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 16        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 16        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 16        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 16        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 17        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 17        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 17        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 17        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 17        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 18        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 18        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 18        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 18        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 18        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 19        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 19        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 19        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 19        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 19        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 19        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 19        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 19        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 19        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 20        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 20        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 20        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 20        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 20        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 20        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 20        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 20        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 20        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 21        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 21        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 21        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 21        | Subjects       | Commerce                                              | Text            |                |                  |
	| 21        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 21        | Text           | Text14                                                | Text            |                |                  |
	| 21        | Integer        | 14                                                    | Text            |                |                  |
	| 21        | WT_Units       | LB                                                    | Text            |                |                  |
	| 21        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 22        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 22        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 22        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 22        | Subjects       | Economics                                             | Text            |                |                  |
	| 22        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 22        | Text           | Text13                                                | Text            |                |                  |
	| 22        | Integer        | 13                                                    | Text            |                |                  |
	| 22        | WT_Units       | LB                                                    | Text            |                |                  |
	| 22        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 23        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 23        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 23        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 23        | Subjects       | C                                                     | Text            |                |                  |
	| 23        | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 23        | Text           | Text15                                                | Text            |                |                  |
	| 23        | Integer        | 15                                                    | Text            |                |                  |
	| 23        | WT_Units       | KG                                                    | Text            |                |                  |
	| 23        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 24        | DRUG           | Oxaliplatin                                           | Text            |                |                  |
	| 24        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 24        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 24        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 24        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 24        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 24        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 24        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 24        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 25        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 25        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 25        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 25        | Subjects       | Civics                                                | Text            |                |                  |
	| 25        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 25        | Text           | Text5                                                 | Text            |                |                  |
	| 25        | Integer        | 5                                                     | Text            |                |                  |
	| 25        | WT_Units       | LB                                                    | Text            |                |                  |
	| 25        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 26        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 26        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 26        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 26        | Subjects       | Zoology                                               | Text            |                |                  |
	| 26        | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 26        | Text           | Text4                                                 | Text            |                |                  |
	| 26        | Integer        | 4                                                     | Text            |                |                  |
	| 26        | WT_Units       | KG                                                    | Text            |                |                  |
	| 26        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 27        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 27        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 27        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 27        | Subjects       | Economics                                             | Text            |                |                  |
	| 27        | Measurement    | KMPH                                                  | Text            |                |                  |
	| 27        | Text           | Text6                                                 | Text            |                |                  |
	| 27        | Integer        | 6                                                     | Text            |                |                  |
	| 27        | WT_Units       | LB                                                    | Text            |                |                  |
	| 27        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 28        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 28        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 28        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 28        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 28        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 28        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 28        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 28        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 28        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 29        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 29        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 29        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 29        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 29        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 29        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 29        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 29        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 29        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 30        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 30        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 30        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 30        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 30        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 30        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 30        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 30        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 30        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 31        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 31        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 31        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 31        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 31        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 31        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 31        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 31        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 31        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 32        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 32        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 32        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 32        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 32        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 32        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 32        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 32        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 32        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 33        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 33        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 33        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 33        | Subjects       | Chemistry                                             | Text            |                |                  |
	| 33        | Measurement    | Meters\r\nKgs                                         | Text            |                |                  |
	| 33        | Text           | Text2                                                 | Text            |                |                  |
	| 33        | Integer        | 2                                                     | Text            |                |                  |
	| 33        | WT_Units       | KG                                                    | Text            |                |                  |
	| 33        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 34        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 34        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 34        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 34        | Subjects       | Physics                                               | Text            |                |                  |
	| 34        | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 34        | Text           | Text1                                                 | Text            |                |                  |
	| 34        | Integer        | 1                                                     | Text            |                |                  |
	| 34        | WT_Units       | KG                                                    | Text            |                |                  |
	| 34        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 35        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 35        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 35        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 35        | Subjects       | Botony                                                | Text            |                |                  |
	| 35        | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 35        | Text           | Text3                                                 | Text            |                |                  |
	| 35        | Integer        | 3                                                     | Text            |                |                  |
	| 35        | WT_Units       | KG                                                    | Text            |                |                  |
	| 35        | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 36        | DRUG           | [Blank]                                               | Text            |                |                  |
	| 36        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 36        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 36        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 36        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 36        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 36        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 36        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 36        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 37        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 37        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 37        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 37        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 37        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 37        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 37        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 37        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 37        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 38        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 38        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 38        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 38        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 38        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 38        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 38        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 38        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 38        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 39        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 39        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 39        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 39        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 39        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 39        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 39        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 39        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 39        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 40        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 40        | DRUG1          | Leucovorin                                            | Text            |                |                  |
	| 40        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 40        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 40        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 40        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 40        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 40        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 40        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 41        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 41        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 41        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 41        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 41        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 41        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 41        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 41        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 41        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 42        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 42        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 42        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 42        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 42        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 42        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 42        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 42        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 42        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 43        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 43        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 43        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 43        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 43        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 43        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 43        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 43        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 43        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 44        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 44        | DRUG1          | NEW DRUG1                                             | Text            |                |                  |
	| 44        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 44        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 44        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 44        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 44        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 44        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 44        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 45        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 45        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 45        | DRUG2          | nab-Paclitaxel                                        | Text            |                |                  |
	| 45        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 45        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 45        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 45        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 45        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 45        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 46        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 46        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 46        | DRUG2          | [Blank]                                               | Text            |                |                  |
	| 46        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 46        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 46        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 46        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 46        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 46        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 47        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 47        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 47        | DRUG2          | Gemcitabine                                           | Text            |                |                  |
	| 47        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 47        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 47        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 47        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 47        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 47        | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 48        | DRUG           | NEW DRUG                                              | Text            |                |                  |
	| 48        | DRUG1          | [Blank]                                               | Text            |                |                  |
	| 48        | DRUG2          | NEW DRUG2                                             | Text            |                |                  |
	| 48        | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 48        | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 48        | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 48        | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 48        | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 48        | Date           |                                                       | Textbox         | Unsaved        | OK               |

Scenario: 034_ADD CODE ITEM_Verify ItemHistory of a table question for 004-patient
	When I expand row "1" of table "AutobuildFixedWithKeySequence3_123:"
	And I click "changeHistory.gif" icon of a question "DRUG1" of table "AutobuildFixedWithKeySequence3_123:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response   | ReasonNotes                               |
	| System (System\System) | Leucovorin | Reason: Initial Entry\r\nNotes: Submitted |

@ObjectiveEvidence
Scenario: 035_ADD CODE ITEM_Verify ItemHistory of a table question for 004-patient
	When I click cancel button in ChangeHistoryModal
	And I click table row button "OK" of table "AutobuildFixedWithKeySequence3_123:"
	And I expand row "12" of table "AutobuildFixedWithKeySequence3_123:"
	And I click "changeHistory.gif" icon of a question "DRUG1" of table "AutobuildFixedWithKeySequence3_123:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response  | ReasonNotes                                         |
	| System (System\System) | NEW DRUG2 | Reason: Initial Entry\r\nNotes: Study Design Change |

@ObjectiveEvidence
Scenario: 036_ADD CODE ITEM_Verify ItemHistory of a table question for 004-patient
	When I click cancel button in ChangeHistoryModal
	And I click table row button "OK" of table "AutobuildFixedWithKeySequence3_123:"
	And I expand row "43" of table "AutobuildFixedWithKeySequence3_123:"
	And I click "changeHistory.gif" icon of a question "DRUG2" of table "AutobuildFixedWithKeySequence3_123:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response    | ReasonNotes                                         |
	| System (System\System) | Gemcitabine1 | Reason: Initial Entry\r\nNotes: Study Design Change |
	And I click cancel button in ChangeHistoryModal


@ObjectiveEvidence @ReqID:US53883,US55962
Scenario: 037_ADD CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 004-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #48: Added            | Study design change |
    | System (System\System) | Row #47: Added            | Study design change |
    | System (System\System) | Row #46: Added            | Study design change |
    | System (System\System) | Row #45: Added            | Study design change |
    | System (System\System) | Row #44: Added            | Study design change |
    | System (System\System) | Row #43: Added            | Study design change |
    | System (System\System) | Row #42: Added            | Study design change |
    | System (System\System) | Row #41: Added            | Study design change |
    | System (System\System) | Row #40: Added            | Study design change |
    | System (System\System) | Row #39: Added            | Study design change |
    | System (System\System) | Row #38: Added            | Study design change |
    | System (System\System) | Row #37: Added            | Study design change |
    | System (System\System) | Row #36: Added            | Study design change |
    | System (System\System) | Row #32: Added            | Study design change |
    | System (System\System) | Row #31: Added            | Study design change |
    | System (System\System) | Row #30: Added            | Study design change |
    | System (System\System) | Row #29: Added            | Study design change |
    | System (System\System) | Row #28: Added            | Study design change |
    | System (System\System) | Row #24: Added            | Study design change |
    | System (System\System) | Row #20: Added            | Study design change |
    | System (System\System) | Row #19: Added            | Study design change |
    | System (System\System) | Row #18: Added            | Study design change |
    | System (System\System) | Row #17: Added            | Study design change |
    | System (System\System) | Row #16: Added            | Study design change |
    | System (System\System) | Row #12: Added            | Study design change |
    | System (System\System) | Row #8: Added             | Study design change |
    | System (System\System) | Row #7: Added             | Study design change |
    | System (System\System) | Row #6: Added             | Study design change |
    | System (System\System) | Row #5: Added             | Study design change |
    | System (System\System) | Row #4: Added             | Study design change |
    | System (System\System) | Row #18 renumbered to #35 | Study design change |
    | System (System\System) | Row #17 renumbered to #34 | Study design change |
    | System (System\System) | Row #16 renumbered to #33 | Study design change |
    | System (System\System) | Row #15 renumbered to #27 | Study design change |
    | System (System\System) | Row #14 renumbered to #26 | Study design change |
    | System (System\System) | Row #13 renumbered to #25 | Study design change |
    | System (System\System) | Row #12 renumbered to #23 | Study design change |
    | System (System\System) | Row #11 renumbered to #22 | Study design change |
    | System (System\System) | Row #10 renumbered to #21 | Study design change |
    | System (System\System) | Row #9 renumbered to #15  | Study design change |
    | System (System\System) | Row #8 renumbered to #14  | Study design change |
    | System (System\System) | Row #7 renumbered to #13  | Study design change |
    | System (System\System) | Row #6 renumbered to #11  | Study design change |
    | System (System\System) | Row #5 renumbered to #10  | Study design change |
    | System (System\System) | Row #4 renumbered to #9   | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqID:US48808
Scenario: 038_ADD CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 004-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v3.0) |

@ObjectiveEvidence @ReqID:US52679,US52808,US52673
Scenario: 039_ADD CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 004-Patient
	When I click breadcrumb "004-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithThreeKeySequenceColumns_4 | PartialSubmit | Off      | Off     | Off     | Off    |


@ObjectiveEvidence @ReqID:US63130
Scenario: 040_Verify the ODM XML generated on Autobuild Changes for Patient - 001 on Study Update
	Given I save the Event XML data in "StudyUpdate1ADD001PatientActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and StatusKey=311 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='001-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdate1ADD001PatientExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdate1ADD001PatientActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US63130
Scenario: 041_Verify the ODM XML generated on Autobuild Changes for Patient - 002 on Study Update
	Given I save the Event XML data in "StudyUpdate1ADD002PatientActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and StatusKey=311 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='002-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdate1ADD002PatientExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdate1ADD002PatientActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US63130
Scenario: 042_Verify the ODM XML generated on Autobuild Changes for Patient - 003 on Study Update
	Given I save the Event XML data in "StudyUpdate1ADD003PatientActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and StatusKey=311 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='003-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdate1ADD003PatientExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdate1ADD003PatientActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US63130
Scenario: 043_Verify the ODM XML generated on Autobuild Changes for Patient - 004 on Study Update
	Given I save the Event XML data in "StudyUpdate1ADD004PatientActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and StatusKey=311 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='004-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdate1ADD004PatientExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdate1ADD004PatientActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: 044_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page