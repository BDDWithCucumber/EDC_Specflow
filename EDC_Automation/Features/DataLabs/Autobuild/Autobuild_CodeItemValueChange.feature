Feature: Autobuild_CodeItemValueChange

	1. Verification of Autobuild structure after study update which includes VALUE change of key sequence questions codelistitmes and also verifies table history, item history.
	2. Verification of Flag status, Form status and Signature staus after each study update.


Notes
	1. This scirpt is written by targetting DL 5.8.0. However, this can be executed on higher versions when new DL versions are released by doing the instance upgrade.
	2. DB backup "AB_BaseStudyForCodeItemValue.bak" should be used to create DL instance. 
	3. The backup contains test data which is used as part of testing.
	4. Backup file is placed in "AutobuildEnhancementStudies/DB Backups", which is under "Study Files" folder of "BusinessProcesses" project.


@ObjectiveEvidence
Scenario: 001_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

#@ObjectiveEvidence
#Scenario: 002_VALUE CHANGE OF CODE ITEM_Perform major study update, in which key sequence question codelist items are reordered
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Study Management" In StudyAdministrationPage
#	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
#	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
#	And I click browse button in upload study file page
#	And I upload study "AutobuildEnhancementStudies\Test4500_GREAT_FormStatus_5_CodeItemValue.zip" with Label "Value"
#	And I open study which has "Uploaded" status
#	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
#	And I open study which has "Staged" status
#	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
#@ObjectiveEvidence
#Scenario: 003_VALUE CHANGE OF CODE ITEM_Publish Study with patient migration
#	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
#	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
#	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
#	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
#	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
#	And I clicked Continue button in PublishStudyFlagsPage
#	And I select patient migration option "Migrate all patients" in PublishStudyPage
#	And I click Publish button in PublishStudyPage
#	And I navigate to "Inbox" tab from main menu.
#	Then I check subjects in inbox folder "Jobs"
#	| Subject                                                                                                                              |
#	| Migration of Site 01 for Study file (Value) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |

@ObjectiveEvidence
Scenario: 004_VALUE CHANGE OF CODE ITEM_Verify data in the form AB_WithOneKeySequenceColumn of patinet 001-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "001-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	Then I verify below "AutobuildFixed with key sequence 1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | BodyRegion     | Eyes1                                                 | Text            |                |                  |
	| 1         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 1         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 2         | BodyRegion     | Ears                                                  | Text            |                |                  |
	| 2         | Subjects       | Botony                                                | Text            |                |                  |
	| 2         | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 2         | Text           | Text3                                                 | Text            |                |                  |
	| 2         | Integer        | 3                                                     | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | BodyRegion     | Nose                                                  | Text            |                |                  |
	| 3         | Subjects       | Zoology                                               | Text            |                |                  |
	| 3         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 3         | Text           | Text4                                                 | Text            |                |                  |
	| 3         | Integer        | 4                                                     | Text            |                |                  |
	| 3         | WT_Units       | KG                                                    | Text            |                |                  |
	| 3         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 4         | BodyRegion     | Chest                                                 | Text            |                |                  |
	| 4         | Subjects       | Civics                                                | Text            |                |                  |
	| 4         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 4         | Text           | Text5                                                 | Text            |                |                  |
	| 4         | Integer        | 5                                                     | Text            |                |                  |
	| 4         | WT_Units       | LB                                                    | Text            |                |                  |
	| 4         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 5         | BodyRegion     | Arm1                                                  | Text            |                |                  |
	| 5         | Subjects       | Economics                                             | Text            |                |                  |
	| 5         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 5         | Text           | Text6                                                 | Text            |                |                  |
	| 5         | Integer        | 6                                                     | Text            |                |                  |
	| 5         | WT_Units       | LB                                                    | Text            |                |                  |
	| 5         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 6         | BodyRegion     | Leg                                                   | Text            |                |                  |
	| 6         | Subjects       | Commerce                                              | Text            |                |                  |
	| 6         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 6         | Text           | Text7                                                 | Text            |                |                  |
	| 6         | Integer        | 7                                                     | Text            |                |                  |
	| 6         | WT_Units       | LB                                                    | Text            |                |                  |
	| 6         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 7         | BodyRegion     | Head                                                  | Text            |                |                  |
	| 7         | Subjects       | Physics                                               | Text            |                |                  |
	| 7         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 7         | Text           | Text1                                                 | Text            |                |                  |
	| 7         | Integer        | 1                                                     | Text            |                |                  |
	| 7         | WT_Units       | KG                                                    | Text            |                |                  |
	| 7         | Date           | 02/12/2019                                            | Text            |                | OK               |

@ObjectiveEvidence @ReqID:US55962
Scenario: 005_VALUE CHANGE OF CODE ITEM_Verify table history for table AutobuildFixed with key sequence 1: of 001-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 1:"
    Then I see ordered table history for table "Table Name" in TableHistoryModalDialog
    | Name                   | Action         | AdditionalNotes     |
    | System (System\System) | Row #1: Added  | Study design change |
    | System (System\System) | Row #1 Deleted | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence
Scenario: 006_VALUE CHANGE OF CODE ITEM_Verify Workflow for form AB_WithOneKeySequenceColumn of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v6.0) |
	
@ObjectiveEvidence @ReqID:US56220,US52809,US52671
Scenario: 007_VALUE CHANGE OF CODE ITEM_Verify Flags and Signature status for form AB_WithOneKeySequenceColumn of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                         | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithOneKeySequenceColumn | PartialSubmit | Some     | Some    | Some    | Ready  |
	
@ObjectiveEvidence
Scenario: 008_VALUE CHANGE OF CODE ITEM_Verify data in the form AB_WithTwoKeySequenceColumns of patinet 001-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithTwoKeySequenceColumns" CRF.
	Then I verify below "AutobuildFixed with key sequence 2_12:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue         | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | TATYPE         | NonLymphatic Lesion | Text            |                |                  |
	| 1         | STATUS         | Blank               | Text            |                |                  |
	| 1         | Subjects       |                     | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                     | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                     | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                     | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                     | Listbox         | Unsaved        |                  |
	| 1         | Date           |                     | Textbox         | Unsaved        | OK               |
	| 2         | TATYPE         | NonLymphatic Lesion | Text            |                |                  |
	| 2         | STATUS         | Dead                | Text            |                |                  |
	| 2         | Subjects       |                     | Radio           | Unsaved        |                  |
	| 2         | Measurement    |                     | Checkbox        | Unsaved        |                  |
	| 2         | Text           |                     | Textbox         | Unsaved        |                  |
	| 2         | Integer        |                     | Textbox         | Unsaved        |                  |
	| 2         | WT_Units       |                     | Listbox         | Unsaved        |                  |
	| 2         | Date           |                     | Textbox         | Unsaved        | OK               |
	| 3         | TATYPE         | NonLymphatic Lesion | Text            |                |                  |
	| 3         | STATUS         | Lost to followUp    | Text            |                |                  |
	| 3         | Subjects       |                     | Radio           | Unsaved        |                  |
	| 3         | Measurement    |                     | Checkbox        | Unsaved        |                  |
	| 3         | Text           |                     | Textbox         | Unsaved        |                  |
	| 3         | Integer        |                     | Textbox         | Unsaved        |                  |
	| 3         | WT_Units       |                     | Listbox         | Unsaved        |                  |
	| 3         | Date           |                     | Textbox         | Unsaved        | OK               |
	| 4         | TATYPE         | NonLymphatic Lesion | Text            |                |                  |
	| 4         | STATUS         | Alive               | Text            |                |                  |
	| 4         | Subjects       |                     | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                     | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                     | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                     | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                     | Listbox         | Unsaved        |                  |
	| 4         | Date           |                     | Textbox         | Unsaved        | OK               |
	| 5         | TATYPE         | [Blank]             | Text            |                |                  |
	| 5         | STATUS         | Blank               | Text            |                |                  |
	| 5         | Subjects       |                     | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                     | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                     | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                     | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                     | Listbox         | Unsaved        |                  |
	| 5         | Date           |                     | Textbox         | Unsaved        | OK               |
	| 6         | TATYPE         | [Blank]             | Text            |                |                  |
	| 6         | STATUS         | Dead                | Text            |                |                  |
	| 6         | Subjects       | Zoology             | Text            |                |                  |
	| 6         | Measurement    | Grams\r\nMilliGrams | Text            |                |                  |
	| 6         | Text           | Text4               | Text            |                |                  |
	| 6         | Integer        | 4                   | Text            |                |                  |
	| 6         | WT_Units       | KG                  | Text            |                |                  |
	| 6         | Date           | 02/12/2019          | Text            |                | OK               |
	| 7         | TATYPE         | [Blank]             | Text            |                |                  |
	| 7         | STATUS         | Lost to followUp    | Text            |                |                  |
	| 7         | Subjects       |                     | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                     | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                     | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                     | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                     | Listbox         | Unsaved        |                  |
	| 7         | Date           |                     | Textbox         | Unsaved        | OK               |
	| 8         | TATYPE         | [Blank]             | Text            |                |                  |
	| 8         | STATUS         | Alive               | Text            |                |                  |
	| 8         | Subjects       | Botony              | Text            |                |                  |
	| 8         | Measurement    | Kgs\r\nGrams        | Text            |                |                  |
	| 8         | Text           | Text3               | Text            |                |                  |
	| 8         | Integer        | 3                   | Text            |                |                  |
	| 8         | WT_Units       | KG                  | Text            |                |                  |
	| 8         | Date           | 02/12/2019          | Text            |                | OK               |
	| 9         | TATYPE         | Lymphatic Lesion    | Text            |                |                  |
	| 9         | STATUS         | Blank               | Text            |                |                  |
	| 9         | Subjects       |                     | Radio           | Unsaved        |                  |
	| 9         | Measurement    |                     | Checkbox        | Unsaved        |                  |
	| 9         | Text           |                     | Textbox         | Unsaved        |                  |
	| 9         | Integer        |                     | Textbox         | Unsaved        |                  |
	| 9         | WT_Units       |                     | Listbox         | Unsaved        |                  |
	| 9         | Date           |                     | Textbox         | Unsaved        | OK               |
	| 10        | TATYPE         | Lymphatic Lesion    | Text            |                |                  |
	| 10        | STATUS         | Dead                | Text            |                |                  |
	| 10        | Subjects       | DigitalElectronics  | Text            |                |                  |
	| 10        | Measurement    | Feets\r\nMeters     | Text            |                |                  |
	| 10        | Text           | Text12              | Text            |                |                  |
	| 10        | Integer        | 12                  | Text            |                |                  |
	| 10        | WT_Units       | LB                  | Text            |                |                  |
	| 10        | Date           | 02/12/2019          | Text            |                | OK               |
	| 11        | TATYPE         | Lymphatic Lesion    | Text            |                |                  |
	| 11        | STATUS         | Lost to followUp    | Text            |                |                  |
	| 11        | Subjects       |                     | Radio           | Unsaved        |                  |
	| 11        | Measurement    |                     | Checkbox        | Unsaved        |                  |
	| 11        | Text           |                     | Textbox         | Unsaved        |                  |
	| 11        | Integer        |                     | Textbox         | Unsaved        |                  |
	| 11        | WT_Units       |                     | Listbox         | Unsaved        |                  |
	| 11        | Date           |                     | Textbox         | Unsaved        | OK               |
	| 12        | TATYPE         | Lymphatic Lesion    | Text            |                |                  |
	| 12        | STATUS         | Alive               | Text            |                |                  |
	| 12        | Subjects       | DataStructures      | Text            |                |                  |
	| 12        | Measurement    | KMPH                | Text            |                |                  |
	| 12        | Text           | Text11              | Text            |                |                  |
	| 12        | Integer        | 11                  | Text            |                |                  |
	| 12        | WT_Units       | LB                  | Text            |                |                  |
	| 12        | Date           | 02/12/2019          | Text            |                | OK               |

@ObjectiveEvidence @ReqID:US55962
Scenario: 009_VALUE CHANGE OF CODE ITEM_Verify table history for table AutobuildFixed with key sequence 2_12 of form AB_WithTwoKeySequenceColumns of 001-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 2_12:"
    Then I see ordered table history for table "AutobuildFixed with key sequence 2_12:" in TableHistoryModalDialog
    | Name                   | Action          | AdditionalNotes     |
    | System (System\System) | Row #11: Added  | Study design change |
    | System (System\System) | Row #9: Added   | Study design change |
    | System (System\System) | Row #7: Added   | Study design change |
    | System (System\System) | Row #5: Added   | Study design change |
    | System (System\System) | Row #4: Added   | Study design change |
    | System (System\System) | Row #3: Added   | Study design change |
    | System (System\System) | Row #2: Added   | Study design change |
    | System (System\System) | Row #1: Added   | Study design change |
    | System (System\System) | Row #11 Deleted | Study design change |
    | System (System\System) | Row #9 Deleted  | Study design change |
    | System (System\System) | Row #7 Deleted  | Study design change |
    | System (System\System) | Row #5 Deleted  | Study design change |
    | System (System\System) | Row #4 Deleted  | Study design change |
    | System (System\System) | Row #3 Deleted  | Study design change |
    | System (System\System) | Row #2 Deleted  | Study design change |
    | System (System\System) | Row #1 Deleted  | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence
Scenario: 010_VALUE CHANGE OF CODE ITEM_Verify Workflow for form AB_WithTwoKeySequenceColumns of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Migration to 20090330 (v6.0) |

@ObjectiveEvidence @ReqID:US56220,US52809,US52671
Scenario: 011_VALUE CHANGE OF CODE ITEM_Verify Flags and Signature status for form AB_WithTwoKeySequenceColumn of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                          | FormStatus    | SDVerify | MReview | DReview | Signed   |
	| AB_WithTwoKeySequenceColumns | PartialSubmit | Some     | Some    | Some    | Rejected |

@ObjectiveEvidence
Scenario: 012_VALUE CHANGE OF CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 001-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue    | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 1         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 1         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 1         | Subjects       |                | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 1         | Date           |                | Textbox         | Unsaved        | OK               |
	| 2         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 2         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 2         | DRUG2          | Blank          | Text            |                |                  |
	| 2         | Subjects       |                | Radio           | Unsaved        |                  |
	| 2         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 2         | Text           |                | Textbox         | Unsaved        |                  |
	| 2         | Integer        |                | Textbox         | Unsaved        |                  |
	| 2         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 2         | Date           |                | Textbox         | Unsaved        | OK               |
	| 3         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 3         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 3         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 3         | Subjects       |                | Radio           | Unsaved        |                  |
	| 3         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 3         | Text           |                | Textbox         | Unsaved        |                  |
	| 3         | Integer        |                | Textbox         | Unsaved        |                  |
	| 3         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 3         | Date           |                | Textbox         | Unsaved        | OK               |
	| 4         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 4         | DRUG1          | Blank          | Text            |                |                  |
	| 4         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 4         | Subjects       |                | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 4         | Date           |                | Textbox         | Unsaved        | OK               |
	| 5         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 5         | DRUG1          | Blank          | Text            |                |                  |
	| 5         | DRUG2          | Blank          | Text            |                |                  |
	| 5         | Subjects       |                | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 5         | Date           |                | Textbox         | Unsaved        | OK               |
	| 6         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 6         | DRUG1          | Blank          | Text            |                |                  |
	| 6         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 6         | Subjects       |                | Radio           | Unsaved        |                  |
	| 6         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 6         | Text           |                | Textbox         | Unsaved        |                  |
	| 6         | Integer        |                | Textbox         | Unsaved        |                  |
	| 6         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 6         | Date           |                | Textbox         | Unsaved        | OK               |
	| 7         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 7         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 7         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 7         | Subjects       |                | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 7         | Date           |                | Textbox         | Unsaved        | OK               |
	| 8         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 8         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 8         | DRUG2          | Blank          | Text            |                |                  |
	| 8         | Subjects       |                | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 8         | Date           |                | Textbox         | Unsaved        | OK               |
	| 9         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 9         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 9         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 9         | Subjects       |                | Radio           | Unsaved        |                  |
	| 9         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 9         | Text           |                | Textbox         | Unsaved        |                  |
	| 9         | Integer        |                | Textbox         | Unsaved        |                  |
	| 9         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 9         | Date           |                | Textbox         | Unsaved        | OK               |
	| 10        | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 10        | DRUG1          | Blank          | Text            |                |                  |
	| 10        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 10        | Subjects       |                | Radio           |                |                  |
	| 10        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 10        | Text           |                | Textbox         | Unsaved        |                  |
	| 10        | Integer        |                | Textbox         | Unsaved        |                  |
	| 10        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 10        | Date           |                | Textbox         | Unsaved        | OK               |
	| 11        | DRUG           | Oxaliplatin1   | Text            | Unsaved        |                  |
	| 11        | DRUG1          | Blank          | Text            |                |                  |
	| 11        | DRUG2          | Blank          | Text            |                |                  |
	| 11        | Subjects       |                | Radio           | Unsaved        |                  |
	| 11        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 11        | Text           |                | Textbox         | Unsaved        |                  |
	| 11        | Integer        |                | Textbox         | Unsaved        |                  |
	| 11        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 11        | Date           |                | Textbox         | Unsaved        | OK               |
	| 12        | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 12        | DRUG1          | Blank          | Text            |                |                  |
	| 12        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 12        | Subjects       |                | Radio           | Unsaved        |                  |
	| 12        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 12        | Text           |                | Textbox         | Unsaved        |                  |
	| 12        | Integer        |                | Textbox         | Unsaved        |                  |
	| 12        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 12        | Date           |                | Textbox         | Unsaved        | OK               |
	| 13        | DRUG           | [Blank]        | Text            |                |                  |
	| 13        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 13        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 13        | Subjects       |                | Radio           | Unsaved        |                  |
	| 13        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 13        | Text           |                | Textbox         | Unsaved        |                  |
	| 13        | Integer        |                | Textbox         | Unsaved        |                  |
	| 13        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 13        | Date           |                | Textbox         | Unsaved        | OK               |
	| 14        | DRUG           | [Blank]        | Text            |                |                  |
	| 14        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 14        | DRUG2          | Blank          | Text            |                |                  |
	| 14        | Subjects       |                | Radio           | Unsaved        |                  |
	| 14        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 14        | Text           |                | Textbox         | Unsaved        |                  |
	| 14        | Integer        |                | Textbox         | Unsaved        |                  |
	| 14        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 14        | Date           |                | Textbox         | Unsaved        | OK               |
	| 15        | DRUG           | [Blank]        | Text            |                |                  |
	| 15        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 15        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 15        | Subjects       |                | Radio           | Unsaved        |                  |
	| 15        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 15        | Text           |                | Textbox         | Unsaved        |                  |
	| 15        | Integer        |                | Textbox         | Unsaved        |                  |
	| 15        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 15        | Date           |                | Textbox         | Unsaved        | OK               |
	| 16        | DRUG           | [Blank]        | Text            |                |                  |
	| 16        | DRUG1          | Blank          | Text            |                |                  |
	| 16        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 16        | Subjects       |                | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 16        | Date           |                | Textbox         | Unsaved        | OK               |
	| 17        | DRUG           | [Blank]        | Text            |                |                  |
	| 17        | DRUG1          | Blank          | Text            |                |                  |
	| 17        | DRUG2          | Blank          | Text            |                |                  |
	| 17        | Subjects       |                | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 17        | Date           |                | Textbox         | Unsaved        | OK               |
	| 18        | DRUG           | [Blank]        | Text            |                |                  |
	| 18        | DRUG1          | Blank          | Text            |                |                  |
	| 18        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 18        | Subjects       |                | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 18        | Date           |                | Textbox         | Unsaved        | OK               |

@ObjectiveEvidence
Scenario: 013_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question
	When I expand row "1" of table "AutobuildFixedWithKeySequence3_123:"
	And I click "changeHistory.gif" icon of a question "DRUG" of table "AutobuildFixedWithKeySequence3_123:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response       | ReasonNotes                                         |
	| System (System\System) | Study Regimen1 | Reason: Initial Entry\r\nNotes: Study Design Change |

@ObjectiveEvidence
Scenario: 014_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question
	When I click cancel button in ChangeHistoryModal
	And I click table row button "OK" of table "AutobuildFixedWithKeySequence3_123:"
	And I expand row "2" of table "AutobuildFixedWithKeySequence3_123:"
	And I click "changeHistory.gif" icon of a question "DRUG1" of table "AutobuildFixedWithKeySequence3_123:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response    | ReasonNotes                                         |
	| System (System\System) | Leucovorin1 | Reason: Initial Entry\r\nNotes: Study Design Change |

@ObjectiveEvidence
Scenario: 015_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question
	When I click cancel button in ChangeHistoryModal
	And I click table row button "OK" of table "AutobuildFixedWithKeySequence3_123:"
	And I expand row "3" of table "AutobuildFixedWithKeySequence3_123:"
	And I click "changeHistory.gif" icon of a question "DRUG2" of table "AutobuildFixedWithKeySequence3_123:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response    | ReasonNotes                                         |
	| System (System\System) | Gemcitabine1 | Reason: Initial Entry\r\nNotes: Study Design Change |
	And I click cancel button in ChangeHistoryModal

@ObjectiveEvidence @ReqID:US55962
Scenario: 016_VALUE CHANGE OF CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 001-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action          | AdditionalNotes     |
    | System (System\System) | Row #18: Added  | Study design change |
    | System (System\System) | Row #17: Added  | Study design change |
    | System (System\System) | Row #16: Added  | Study design change |
    | System (System\System) | Row #15: Added  | Study design change |
    | System (System\System) | Row #14: Added  | Study design change |
    | System (System\System) | Row #13: Added  | Study design change |
    | System (System\System) | Row #12: Added  | Study design change |
    | System (System\System) | Row #11: Added  | Study design change |
    | System (System\System) | Row #10: Added  | Study design change |
    | System (System\System) | Row #9: Added   | Study design change |
    | System (System\System) | Row #8: Added   | Study design change |
    | System (System\System) | Row #7: Added   | Study design change |
    | System (System\System) | Row #6: Added   | Study design change |
    | System (System\System) | Row #5: Added   | Study design change |
    | System (System\System) | Row #4: Added   | Study design change |
    | System (System\System) | Row #3: Added   | Study design change |
    | System (System\System) | Row #2: Added   | Study design change |
    | System (System\System) | Row #1: Added   | Study design change |
    | System (System\System) | Row #18 Deleted | Study design change |
    | System (System\System) | Row #17 Deleted | Study design change |
    | System (System\System) | Row #16 Deleted | Study design change |
    | System (System\System) | Row #15 Deleted | Study design change |
    | System (System\System) | Row #14 Deleted | Study design change |
    | System (System\System) | Row #13 Deleted | Study design change |
    | System (System\System) | Row #12 Deleted | Study design change |
    | System (System\System) | Row #11 Deleted | Study design change |
    | System (System\System) | Row #10 Deleted | Study design change |
    | System (System\System) | Row #9 Deleted  | Study design change |
    | System (System\System) | Row #8 Deleted  | Study design change |
    | System (System\System) | Row #7 Deleted  | Study design change |
    | System (System\System) | Row #6 Deleted  | Study design change |
    | System (System\System) | Row #5 Deleted  | Study design change |
    | System (System\System) | Row #4 Deleted  | Study design change |
    | System (System\System) | Row #3 Deleted  | Study design change |
    | System (System\System) | Row #2 Deleted  | Study design change |
    | System (System\System) | Row #1 Deleted  | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence
Scenario: 017_VALUE CHANGE OF CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Off ]            |
	| M-Review [ Off ]             |
	| D-Review [ Off ]             |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v6.0) |

@ObjectiveEvidence @ReqID:US56220,US52809,US52671
Scenario: 018_VALUE CHANGE OF CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | SDVerify | MReview | DReview | Signed  |
	| AB_WithThreeKeySequenceColumns_4 | PartialSubmit | Off      | Off     | Off     | Changed |


############## 002-PATIENT ##############
@ObjectiveEvidence
Scenario: 019_VALUE CHANGE OF CODE ITEM_Verify data in the form AB_WithOneKeySequenceColumn of patinet 002-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "002-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	Then I verify below "AutobuildFixed with key sequence 1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | BodyRegion     | Eyes1                                                 | Text            |                |                  |
	| 1         | Subjects       |                                                       | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                                                       | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                                                       | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                                                       | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                                                       | Listbox         | Unsaved        |                  |
	| 1         | Date           |                                                       | Textbox         | Unsaved        | OK               |
	| 2         | BodyRegion     | Ears                                                  | Text            |                |                  |
	| 2         | Subjects       | Botony                                                | Text            |                |                  |
	| 2         | Measurement    | Kgs\r\nGrams                                          | Text            |                |                  |
	| 2         | Text           | Text3                                                 | Text            |                |                  |
	| 2         | Integer        | 3                                                     | Text            |                |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                |                  |
	| 2         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 3         | BodyRegion     | Nose                                                  | Text            |                |                  |
	| 3         | Subjects       | Zoology                                               | Text            |                |                  |
	| 3         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                |                  |
	| 3         | Text           | Text4                                                 | Text            |                |                  |
	| 3         | Integer        | 4                                                     | Text            |                |                  |
	| 3         | WT_Units       | KG                                                    | Text            |                |                  |
	| 3         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 4         | BodyRegion     | Chest                                                 | Text            |                |                  |
	| 4         | Subjects       | Civics                                                | Text            |                |                  |
	| 4         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 4         | Text           | Text5                                                 | Text            |                |                  |
	| 4         | Integer        | 5                                                     | Text            |                |                  |
	| 4         | WT_Units       | LB                                                    | Text            |                |                  |
	| 4         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 5         | BodyRegion     | Arm1                                                  | Text            |                |                  |
	| 5         | Subjects       | Economics                                             | Text            |                |                  |
	| 5         | Measurement    | KMPH                                                  | Text            |                |                  |
	| 5         | Text           | Text6                                                 | Text            |                |                  |
	| 5         | Integer        | 6                                                     | Text            |                |                  |
	| 5         | WT_Units       | LB                                                    | Text            |                |                  |
	| 5         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 6         | BodyRegion     | Leg                                                   | Text            |                |                  |
	| 6         | Subjects       | Commerce                                              | Text            |                |                  |
	| 6         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                |                  |
	| 6         | Text           | Text7                                                 | Text            |                |                  |
	| 6         | Integer        | 7                                                     | Text            |                |                  |
	| 6         | WT_Units       | LB                                                    | Text            |                |                  |
	| 6         | Date           | 02/12/2019                                            | Text            |                | OK               |
	| 7         | BodyRegion     | Head                                                  | Text            |                |                  |
	| 7         | Subjects       | Physics                                               | Text            |                |                  |
	| 7         | Measurement    | Feets\r\nMeters                                       | Text            |                |                  |
	| 7         | Text           | Text1                                                 | Text            |                |                  |
	| 7         | Integer        | 1                                                     | Text            |                |                  |
	| 7         | WT_Units       | KG                                                    | Text            |                |                  |
	| 7         | Date           | 02/12/2019                                            | Text            |                | OK               |

@ObjectiveEvidence @ReqID:US55962
Scenario: 020_VALUE CHANGE OF CODE ITEM_Verify table history for table AutobuildFixed with key sequence 1: of 002-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 1:"
    Then I see ordered table history for table "Table Name" in TableHistoryModalDialog
    | Name                   | Action                  | AdditionalNotes     |
    | System (System\System) | Row #1: Added  | Study design change |
    | System (System\System) | Row #1 Deleted | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence
Scenario: 021_VALUE CHANGE OF CODE ITEM_Verify Workflow for form AB_WithOneKeySequenceColumn of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v6.0) |
	
@ObjectiveEvidence @ReqID:US56220,US52809,US52671
Scenario: 022_VALUE CHANGE OF CODE ITEM_Verify Flags and Signature status for form AB_WithOneKeySequenceColumn of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                         | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithOneKeySequenceColumn | PartialSubmit | Some     | Some    | Some    | Ready  |
	
@ObjectiveEvidence
Scenario: 023_VALUE CHANGE OF CODE ITEM_Verify data in the form AB_WithTwoKeySequenceColumns of patinet 002-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithTwoKeySequenceColumns" CRF.
	Then I verify below "AutobuildFixed with key sequence 2_12:" table questions data in the CRF.
		| RowNumber | QuestionPrompt | AnswerValue         | AnswerFieldType | QuestionStatus | RowButtonToClick |
		| 1         | TATYPE         | NonLymphatic Lesion | Text            |                |                  |
		| 1         | STATUS         | Blank               | Text            |                |                  |
		| 1         | Subjects       |                     | Radio           | Unsaved        |                  |
		| 1         | Measurement    |                     | Checkbox        | Unsaved        |                  |
		| 1         | Text           |                     | Textbox         | Unsaved        |                  |
		| 1         | Integer        |                     | Textbox         | Unsaved        |                  |
		| 1         | WT_Units       |                     | Listbox         | Unsaved        |                  |
		| 1         | Date           |                     | Textbox         | Unsaved        | OK               |
		| 2         | TATYPE         | NonLymphatic Lesion | Text            |                |                  |
		| 2         | STATUS         | Dead                | Text            |                |                  |
		| 2         | Subjects       |                     | Radio           | Unsaved        |                  |
		| 2         | Measurement    |                     | Checkbox        | Unsaved        |                  |
		| 2         | Text           |                     | Textbox         | Unsaved        |                  |
		| 2         | Integer        |                     | Textbox         | Unsaved        |                  |
		| 2         | WT_Units       |                     | Listbox         | Unsaved        |                  |
		| 2         | Date           |                     | Textbox         | Unsaved        | OK               |
		| 3         | TATYPE         | NonLymphatic Lesion | Text            |                |                  |
		| 3         | STATUS         | Lost to followUp    | Text            |                |                  |
		| 3         | Subjects       |                     | Radio           | Unsaved        |                  |
		| 3         | Measurement    |                     | Checkbox        | Unsaved        |                  |
		| 3         | Text           |                     | Textbox         | Unsaved        |                  |
		| 3         | Integer        |                     | Textbox         | Unsaved        |                  |
		| 3         | WT_Units       |                     | Listbox         | Unsaved        |                  |
		| 3         | Date           |                     | Textbox         | Unsaved        | OK               |
		| 4         | TATYPE         | NonLymphatic Lesion | Text            |                |                  |
		| 4         | STATUS         | Alive               | Text            |                |                  |
		| 4         | Subjects       |                     | Radio           | Unsaved        |                  |
		| 4         | Measurement    |                     | Checkbox        | Unsaved        |                  |
		| 4         | Text           |                     | Textbox         | Unsaved        |                  |
		| 4         | Integer        |                     | Textbox         | Unsaved        |                  |
		| 4         | WT_Units       |                     | Listbox         | Unsaved        |                  |
		| 4         | Date           |                     | Textbox         | Unsaved        | OK               |
		| 5         | TATYPE         | [Blank]             | Text            |                |                  |
		| 5         | STATUS         | Blank               | Text            |                |                  |
		| 5         | Subjects       |                     | Radio           | Unsaved        |                  |
		| 5         | Measurement    |                     | Checkbox        | Unsaved        |                  |
		| 5         | Text           |                     | Textbox         | Unsaved        |                  |
		| 5         | Integer        |                     | Textbox         | Unsaved        |                  |
		| 5         | WT_Units       |                     | Listbox         | Unsaved        |                  |
		| 5         | Date           |                     | Textbox         | Unsaved        | OK               |
		| 6         | TATYPE         | [Blank]             | Text            |                |                  |
		| 6         | STATUS         | Dead                | Text            |                |                  |
		| 6         | Subjects       | Zoology             | Text            |                |                  |
		| 6         | Measurement    | Grams\r\nMilliGrams | Text            |                |                  |
		| 6         | Text           | Text4               | Text            |                |                  |
		| 6         | Integer        | 4                   | Text            |                |                  |
		| 6         | WT_Units       | KG                  | Text            |                |                  |
		| 6         | Date           | 02/12/2019          | Text            |                | OK               |
		| 7         | TATYPE         | [Blank]             | Text            |                |                  |
		| 7         | STATUS         | Lost to followUp    | Text            |                |                  |
		| 7         | Subjects       |                     | Radio           | Unsaved        |                  |
		| 7         | Measurement    |                     | Checkbox        | Unsaved        |                  |
		| 7         | Text           |                     | Textbox         | Unsaved        |                  |
		| 7         | Integer        |                     | Textbox         | Unsaved        |                  |
		| 7         | WT_Units       |                     | Listbox         | Unsaved        |                  |
		| 7         | Date           |                     | Textbox         | Unsaved        | OK               |
		| 8         | TATYPE         | [Blank]             | Text            |                |                  |
		| 8         | STATUS         | Alive               | Text            |                |                  |
		| 8         | Subjects       | Botony              | Text            |                |                  |
		| 8         | Measurement    | Kgs\r\nGrams        | Text            |                |                  |
		| 8         | Text           | Text3               | Text            |                |                  |
		| 8         | Integer        | 3                   | Text            |                |                  |
		| 8         | WT_Units       | KG                  | Text            |                |                  |
		| 8         | Date           | 02/12/2019          | Text            |                | OK               |
		| 9         | TATYPE         | Lymphatic Lesion    | Text            |                |                  |
		| 9         | STATUS         | Blank               | Text            |                |                  |
		| 9         | Subjects       |                     | Radio           | Unsaved        |                  |
		| 9         | Measurement    |                     | Checkbox        | Unsaved        |                  |
		| 9         | Text           |                     | Textbox         | Unsaved        |                  |
		| 9         | Integer        |                     | Textbox         | Unsaved        |                  |
		| 9         | WT_Units       |                     | Listbox         | Unsaved        |                  |
		| 9         | Date           |                     | Textbox         | Unsaved        | OK               |
		| 10        | TATYPE         | Lymphatic Lesion    | Text            |                |                  |
		| 10        | STATUS         | Dead                | Text            |                |                  |
		| 10        | Subjects       | DigitalElectronics  | Text            |                |                  |
		| 10        | Measurement    | Feets\r\nMeters     | Text            |                |                  |
		| 10        | Text           | Text12              | Text            |                |                  |
		| 10        | Integer        | 12                  | Text            |                |                  |
		| 10        | WT_Units       | LB                  | Text            |                |                  |
		| 10        | Date           | 02/12/2019          | Text            |                | OK               |
		| 11        | TATYPE         | Lymphatic Lesion    | Text            |                |                  |
		| 11        | STATUS         | Lost to followUp    | Text            |                |                  |
		| 11        | Subjects       |                     | Radio           | Unsaved        |                  |
		| 11        | Measurement    |                     | Checkbox        | Unsaved        |                  |
		| 11        | Text           |                     | Textbox         | Unsaved        |                  |
		| 11        | Integer        |                     | Textbox         | Unsaved        |                  |
		| 11        | WT_Units       |                     | Listbox         | Unsaved        |                  |
		| 11        | Date           |                     | Textbox         | Unsaved        | OK               |
		| 12        | TATYPE         | Lymphatic Lesion    | Text            |                |                  |
		| 12        | STATUS         | Alive               | Text            |                |                  |
		| 12        | Subjects       | DataStructures      | Text            |                |                  |
		| 12        | Measurement    | KMPH                | Text            |                |                  |
		| 12        | Text           | Text11              | Text            |                |                  |
		| 12        | Integer        | 11                  | Text            |                |                  |
		| 12        | WT_Units       | LB                  | Text            |                |                  |
		| 12        | Date           | 02/12/2019          | Text            |                | OK               |

@ObjectiveEvidence @ReqID:US55962
Scenario: 024_VALUE CHANGE OF CODE ITEM_Verify table history for table AutobuildFixed with key sequence 2_12 of form AB_WithTwoKeySequenceColumns of 002-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 2_12:"
    Then I see ordered table history for table "AutobuildFixed with key sequence 2_12:" in TableHistoryModalDialog
    | Name                   | Action          | AdditionalNotes     |
    | System (System\System) | Row #11: Added  | Study design change |
    | System (System\System) | Row #9: Added   | Study design change |
    | System (System\System) | Row #7: Added   | Study design change |
    | System (System\System) | Row #5: Added   | Study design change |
    | System (System\System) | Row #4: Added   | Study design change |
    | System (System\System) | Row #3: Added   | Study design change |
    | System (System\System) | Row #2: Added   | Study design change |
    | System (System\System) | Row #1: Added   | Study design change |
    | System (System\System) | Row #11 Deleted | Study design change |
    | System (System\System) | Row #9 Deleted  | Study design change |
    | System (System\System) | Row #7 Deleted  | Study design change |
    | System (System\System) | Row #5 Deleted  | Study design change |
    | System (System\System) | Row #4 Deleted  | Study design change |
    | System (System\System) | Row #3 Deleted  | Study design change |
    | System (System\System) | Row #2 Deleted  | Study design change |
    | System (System\System) | Row #1 Deleted  | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence
Scenario: 025_VALUE CHANGE OF CODE ITEM_Verify Workflow for form AB_WithTwoKeySequenceColumns of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Some ]           |
	| M-Review [ Some ]            |
	| D-Review [ Some ]            |
	| Migration to 20090330 (v6.0) |

@ObjectiveEvidence @ReqID:US56220,US52809,US52671
Scenario: 026_VALUE CHANGE OF CODE ITEM_Verify Flags and Signature status for form AB_WithTwoKeySequenceColumn of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                          | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithTwoKeySequenceColumns | PartialSubmit | Some     | Some    | Some    | Ready  |

@ObjectiveEvidence
Scenario: 027_VALUE CHANGE OF CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 002-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue    | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 1         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 1         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 1         | Subjects       |                | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 1         | Date           |                | Textbox         | Unsaved        | OK               |
	| 2         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 2         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 2         | DRUG2          | Blank          | Text            |                |                  |
	| 2         | Subjects       |                | Radio           | Unsaved        |                  |
	| 2         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 2         | Text           |                | Textbox         | Unsaved        |                  |
	| 2         | Integer        |                | Textbox         | Unsaved        |                  |
	| 2         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 2         | Date           |                | Textbox         | Unsaved        | OK               |
	| 3         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 3         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 3         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 3         | Subjects       |                | Radio           | Unsaved        |                  |
	| 3         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 3         | Text           |                | Textbox         | Unsaved        |                  |
	| 3         | Integer        |                | Textbox         | Unsaved        |                  |
	| 3         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 3         | Date           |                | Textbox         | Unsaved        | OK               |
	| 4         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 4         | DRUG1          | Blank          | Text            |                |                  |
	| 4         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 4         | Subjects       |                | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 4         | Date           |                | Textbox         | Unsaved        | OK               |
	| 5         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 5         | DRUG1          | Blank          | Text            |                |                  |
	| 5         | DRUG2          | Blank          | Text            |                |                  |
	| 5         | Subjects       |                | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 5         | Date           |                | Textbox         | Unsaved        | OK               |
	| 6         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 6         | DRUG1          | Blank          | Text            |                |                  |
	| 6         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 6         | Subjects       |                | Radio           | Unsaved        |                  |
	| 6         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 6         | Text           |                | Textbox         | Unsaved        |                  |
	| 6         | Integer        |                | Textbox         | Unsaved        |                  |
	| 6         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 6         | Date           |                | Textbox         | Unsaved        | OK               |
	| 7         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 7         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 7         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 7         | Subjects       |                | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 7         | Date           |                | Textbox         | Unsaved        | OK               |
	| 8         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 8         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 8         | DRUG2          | Blank          | Text            |                |                  |
	| 8         | Subjects       |                | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 8         | Date           |                | Textbox         | Unsaved        | OK               |
	| 9         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 9         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 9         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 9         | Subjects       |                | Radio           | Unsaved        |                  |
	| 9         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 9         | Text           |                | Textbox         | Unsaved        |                  |
	| 9         | Integer        |                | Textbox         | Unsaved        |                  |
	| 9         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 9         | Date           |                | Textbox         | Unsaved        | OK               |
	| 10        | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 10        | DRUG1          | Blank          | Text            |                |                  |
	| 10        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 10        | Subjects       |                | Radio           |                |                  |
	| 10        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 10        | Text           |                | Textbox         | Unsaved        |                  |
	| 10        | Integer        |                | Textbox         | Unsaved        |                  |
	| 10        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 10        | Date           |                | Textbox         | Unsaved        | OK               |
	| 11        | DRUG           | Oxaliplatin1   | Text            | Unsaved        |                  |
	| 11        | DRUG1          | Blank          | Text            |                |                  |
	| 11        | DRUG2          | Blank          | Text            |                |                  |
	| 11        | Subjects       |                | Radio           | Unsaved        |                  |
	| 11        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 11        | Text           |                | Textbox         | Unsaved        |                  |
	| 11        | Integer        |                | Textbox         | Unsaved        |                  |
	| 11        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 11        | Date           |                | Textbox         | Unsaved        | OK               |
	| 12        | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 12        | DRUG1          | Blank          | Text            |                |                  |
	| 12        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 12        | Subjects       |                | Radio           | Unsaved        |                  |
	| 12        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 12        | Text           |                | Textbox         | Unsaved        |                  |
	| 12        | Integer        |                | Textbox         | Unsaved        |                  |
	| 12        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 12        | Date           |                | Textbox         | Unsaved        | OK               |
	| 13        | DRUG           | [Blank]        | Text            |                |                  |
	| 13        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 13        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 13        | Subjects       |                | Radio           | Unsaved        |                  |
	| 13        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 13        | Text           |                | Textbox         | Unsaved        |                  |
	| 13        | Integer        |                | Textbox         | Unsaved        |                  |
	| 13        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 13        | Date           |                | Textbox         | Unsaved        | OK               |
	| 14        | DRUG           | [Blank]        | Text            |                |                  |
	| 14        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 14        | DRUG2          | Blank          | Text            |                |                  |
	| 14        | Subjects       |                | Radio           | Unsaved        |                  |
	| 14        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 14        | Text           |                | Textbox         | Unsaved        |                  |
	| 14        | Integer        |                | Textbox         | Unsaved        |                  |
	| 14        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 14        | Date           |                | Textbox         | Unsaved        | OK               |
	| 15        | DRUG           | [Blank]        | Text            |                |                  |
	| 15        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 15        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 15        | Subjects       |                | Radio           | Unsaved        |                  |
	| 15        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 15        | Text           |                | Textbox         | Unsaved        |                  |
	| 15        | Integer        |                | Textbox         | Unsaved        |                  |
	| 15        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 15        | Date           |                | Textbox         | Unsaved        | OK               |
	| 16        | DRUG           | [Blank]        | Text            |                |                  |
	| 16        | DRUG1          | Blank          | Text            |                |                  |
	| 16        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 16        | Subjects       |                | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 16        | Date           |                | Textbox         | Unsaved        | OK               |
	| 17        | DRUG           | [Blank]        | Text            |                |                  |
	| 17        | DRUG1          | Blank          | Text            |                |                  |
	| 17        | DRUG2          | Blank          | Text            |                |                  |
	| 17        | Subjects       |                | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 17        | Date           |                | Textbox         | Unsaved        | OK               |
	| 18        | DRUG           | [Blank]        | Text            |                |                  |
	| 18        | DRUG1          | Blank          | Text            |                |                  |
	| 18        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 18        | Subjects       |                | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 18        | Date           |                | Textbox         | Unsaved        | OK               |

@ObjectiveEvidence @ReqID:US55962
Scenario: 028_VALUE CHANGE OF CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 002-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action          | AdditionalNotes     |
    | System (System\System) | Row #18: Added  | Study design change |
    | System (System\System) | Row #17: Added  | Study design change |
    | System (System\System) | Row #16: Added  | Study design change |
    | System (System\System) | Row #15: Added  | Study design change |
    | System (System\System) | Row #14: Added  | Study design change |
    | System (System\System) | Row #13: Added  | Study design change |
    | System (System\System) | Row #12: Added  | Study design change |
    | System (System\System) | Row #11: Added  | Study design change |
    | System (System\System) | Row #10: Added  | Study design change |
    | System (System\System) | Row #9: Added   | Study design change |
    | System (System\System) | Row #8: Added   | Study design change |
    | System (System\System) | Row #7: Added   | Study design change |
    | System (System\System) | Row #6: Added   | Study design change |
    | System (System\System) | Row #5: Added   | Study design change |
    | System (System\System) | Row #4: Added   | Study design change |
    | System (System\System) | Row #3: Added   | Study design change |
    | System (System\System) | Row #2: Added   | Study design change |
    | System (System\System) | Row #1: Added   | Study design change |
    | System (System\System) | Row #18 Deleted | Study design change |
    | System (System\System) | Row #17 Deleted | Study design change |
    | System (System\System) | Row #16 Deleted | Study design change |
    | System (System\System) | Row #15 Deleted | Study design change |
    | System (System\System) | Row #14 Deleted | Study design change |
    | System (System\System) | Row #13 Deleted | Study design change |
    | System (System\System) | Row #12 Deleted | Study design change |
    | System (System\System) | Row #11 Deleted | Study design change |
    | System (System\System) | Row #10 Deleted | Study design change |
    | System (System\System) | Row #9 Deleted  | Study design change |
    | System (System\System) | Row #8 Deleted  | Study design change |
    | System (System\System) | Row #7 Deleted  | Study design change |
    | System (System\System) | Row #6 Deleted  | Study design change |
    | System (System\System) | Row #5 Deleted  | Study design change |
    | System (System\System) | Row #4 Deleted  | Study design change |
    | System (System\System) | Row #3 Deleted  | Study design change |
    | System (System\System) | Row #2 Deleted  | Study design change |
    | System (System\System) | Row #1 Deleted  | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence
Scenario: 029_VALUE CHANGE OF CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| SD-Verify [ Off ]            |
	| M-Review [ Off ]             |
	| D-Review [ Off ]             |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v6.0) |

@ObjectiveEvidence @ReqID:US56220,US52809,US52671
Scenario: 030_VALUE CHANGE OF CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithThreeKeySequenceColumns_4 | PartialSubmit | Off      | Off     | Off     | Ready  |

################### 003-Patient ##################

@ObjectiveEvidence
Scenario: 031_VALUE CHANGE OF CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 003-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "003-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue    | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 1         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 1         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 1         | Subjects       |                | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 1         | Date           |                | Textbox         | Unsaved        | OK               |
	| 2         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 2         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 2         | DRUG2          | Blank          | Text            |                |                  |
	| 2         | Subjects       |                | Radio           | Unsaved        |                  |
	| 2         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 2         | Text           |                | Textbox         | Unsaved        |                  |
	| 2         | Integer        |                | Textbox         | Unsaved        |                  |
	| 2         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 2         | Date           |                | Textbox         | Unsaved        | OK               |
	| 3         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 3         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 3         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 3         | Subjects       |                | Radio           | Unsaved        |                  |
	| 3         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 3         | Text           |                | Textbox         | Unsaved        |                  |
	| 3         | Integer        |                | Textbox         | Unsaved        |                  |
	| 3         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 3         | Date           |                | Textbox         | Unsaved        | OK               |
	| 4         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 4         | DRUG1          | Blank          | Text            |                |                  |
	| 4         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 4         | Subjects       |                | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 4         | Date           |                | Textbox         | Unsaved        | OK               |
	| 5         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 5         | DRUG1          | Blank          | Text            |                |                  |
	| 5         | DRUG2          | Blank          | Text            |                |                  |
	| 5         | Subjects       |                | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 5         | Date           |                | Textbox         | Unsaved        | OK               |
	| 6         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 6         | DRUG1          | Blank          | Text            |                |                  |
	| 6         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 6         | Subjects       |                | Radio           | Unsaved        |                  |
	| 6         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 6         | Text           |                | Textbox         | Unsaved        |                  |
	| 6         | Integer        |                | Textbox         | Unsaved        |                  |
	| 6         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 6         | Date           |                | Textbox         | Unsaved        | OK               |
	| 7         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 7         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 7         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 7         | Subjects       |                | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 7         | Date           |                | Textbox         | Unsaved        | OK               |
	| 8         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 8         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 8         | DRUG2          | Blank          | Text            |                |                  |
	| 8         | Subjects       |                | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 8         | Date           |                | Textbox         | Unsaved        | OK               |
	| 9         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 9         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 9         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 9         | Subjects       |                | Radio           | Unsaved        |                  |
	| 9         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 9         | Text           |                | Textbox         | Unsaved        |                  |
	| 9         | Integer        |                | Textbox         | Unsaved        |                  |
	| 9         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 9         | Date           |                | Textbox         | Unsaved        | OK               |
	| 10        | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 10        | DRUG1          | Blank          | Text            |                |                  |
	| 10        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 10        | Subjects       |                | Radio           |                |                  |
	| 10        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 10        | Text           |                | Textbox         | Unsaved        |                  |
	| 10        | Integer        |                | Textbox         | Unsaved        |                  |
	| 10        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 10        | Date           |                | Textbox         | Unsaved        | OK               |
	| 11        | DRUG           | Oxaliplatin1   | Text            | Unsaved        |                  |
	| 11        | DRUG1          | Blank          | Text            |                |                  |
	| 11        | DRUG2          | Blank          | Text            |                |                  |
	| 11        | Subjects       |                | Radio           | Unsaved        |                  |
	| 11        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 11        | Text           |                | Textbox         | Unsaved        |                  |
	| 11        | Integer        |                | Textbox         | Unsaved        |                  |
	| 11        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 11        | Date           |                | Textbox         | Unsaved        | OK               |
	| 12        | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 12        | DRUG1          | Blank          | Text            |                |                  |
	| 12        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 12        | Subjects       |                | Radio           | Unsaved        |                  |
	| 12        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 12        | Text           |                | Textbox         | Unsaved        |                  |
	| 12        | Integer        |                | Textbox         | Unsaved        |                  |
	| 12        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 12        | Date           |                | Textbox         | Unsaved        | OK               |
	| 13        | DRUG           | [Blank]        | Text            |                |                  |
	| 13        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 13        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 13        | Subjects       |                | Radio           | Unsaved        |                  |
	| 13        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 13        | Text           |                | Textbox         | Unsaved        |                  |
	| 13        | Integer        |                | Textbox         | Unsaved        |                  |
	| 13        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 13        | Date           |                | Textbox         | Unsaved        | OK               |
	| 14        | DRUG           | [Blank]        | Text            |                |                  |
	| 14        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 14        | DRUG2          | Blank          | Text            |                |                  |
	| 14        | Subjects       |                | Radio           | Unsaved        |                  |
	| 14        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 14        | Text           |                | Textbox         | Unsaved        |                  |
	| 14        | Integer        |                | Textbox         | Unsaved        |                  |
	| 14        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 14        | Date           |                | Textbox         | Unsaved        | OK               |
	| 15        | DRUG           | [Blank]        | Text            |                |                  |
	| 15        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 15        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 15        | Subjects       |                | Radio           | Unsaved        |                  |
	| 15        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 15        | Text           |                | Textbox         | Unsaved        |                  |
	| 15        | Integer        |                | Textbox         | Unsaved        |                  |
	| 15        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 15        | Date           |                | Textbox         | Unsaved        | OK               |
	| 16        | DRUG           | [Blank]        | Text            |                |                  |
	| 16        | DRUG1          | Blank          | Text            |                |                  |
	| 16        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 16        | Subjects       |                | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 16        | Date           |                | Textbox         | Unsaved        | OK               |
	| 17        | DRUG           | [Blank]        | Text            |                |                  |
	| 17        | DRUG1          | Blank          | Text            |                |                  |
	| 17        | DRUG2          | Blank          | Text            |                |                  |
	| 17        | Subjects       |                | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 17        | Date           |                | Textbox         | Unsaved        | OK               |
	| 18        | DRUG           | [Blank]        | Text            |                |                  |
	| 18        | DRUG1          | Blank          | Text            |                |                  |
	| 18        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 18        | Subjects       |                | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 18        | Date           |                | Textbox         | Unsaved        | OK               |

@ObjectiveEvidence @ReqID:US55962
Scenario: 032_VALUE CHANGE OF CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 003-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #18: Added  | Study design change |
    | System (System\System) | Row #17: Added  | Study design change |
    | System (System\System) | Row #16: Added  | Study design change |
    | System (System\System) | Row #15: Added  | Study design change |
    | System (System\System) | Row #14: Added  | Study design change |
    | System (System\System) | Row #13: Added  | Study design change |
    | System (System\System) | Row #12: Added  | Study design change |
    | System (System\System) | Row #11: Added  | Study design change |
    | System (System\System) | Row #10: Added  | Study design change |
    | System (System\System) | Row #9: Added   | Study design change |
    | System (System\System) | Row #8: Added   | Study design change |
    | System (System\System) | Row #7: Added   | Study design change |
    | System (System\System) | Row #6: Added   | Study design change |
    | System (System\System) | Row #5: Added   | Study design change |
    | System (System\System) | Row #4: Added   | Study design change |
    | System (System\System) | Row #3: Added   | Study design change |
    | System (System\System) | Row #2: Added   | Study design change |
    | System (System\System) | Row #1: Added   | Study design change |
    | System (System\System) | Row #18 Deleted | Study design change |
    | System (System\System) | Row #17 Deleted | Study design change |
    | System (System\System) | Row #16 Deleted | Study design change |
    | System (System\System) | Row #15 Deleted | Study design change |
    | System (System\System) | Row #14 Deleted | Study design change |
    | System (System\System) | Row #13 Deleted | Study design change |
    | System (System\System) | Row #12 Deleted | Study design change |
    | System (System\System) | Row #11 Deleted | Study design change |
    | System (System\System) | Row #10 Deleted | Study design change |
    | System (System\System) | Row #9 Deleted  | Study design change |
    | System (System\System) | Row #8 Deleted  | Study design change |
    | System (System\System) | Row #7 Deleted  | Study design change |
    | System (System\System) | Row #6 Deleted  | Study design change |
    | System (System\System) | Row #5 Deleted  | Study design change |
    | System (System\System) | Row #4 Deleted  | Study design change |
    | System (System\System) | Row #3 Deleted  | Study design change |
    | System (System\System) | Row #2 Deleted  | Study design change |
    | System (System\System) | Row #1 Deleted  | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence
Scenario: 033_VALUE CHANGE OF CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 003-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v6.0) |

@ObjectiveEvidence @ReqID:US56220,US52809,US52671
Scenario: 034_VALUE CHANGE OF CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 003-Patient
	When I click breadcrumb "003-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | DCF | SDVerify | MReview | DReview | Signed   | Frozen | Locked |
	| AB_WithThreeKeySequenceColumns_4 | PartialSubmit        |     | Off       | Off      | Off      | Off   |        |        |


################# 004-PATIENT #################
@ObjectiveEvidence
Scenario: 035_VALUE CHANGE OF CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 004-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "004-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue    | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 1         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 1         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 1         | Subjects       |                | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 1         | Date           |                | Textbox         | Unsaved        | OK               |
	| 2         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 2         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 2         | DRUG2          | Blank          | Text            |                |                  |
	| 2         | Subjects       |                | Radio           | Unsaved        |                  |
	| 2         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 2         | Text           |                | Textbox         | Unsaved        |                  |
	| 2         | Integer        |                | Textbox         | Unsaved        |                  |
	| 2         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 2         | Date           |                | Textbox         | Unsaved        | OK               |
	| 3         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 3         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 3         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 3         | Subjects       |                | Radio           | Unsaved        |                  |
	| 3         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 3         | Text           |                | Textbox         | Unsaved        |                  |
	| 3         | Integer        |                | Textbox         | Unsaved        |                  |
	| 3         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 3         | Date           |                | Textbox         | Unsaved        | OK               |
	| 4         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 4         | DRUG1          | Blank          | Text            |                |                  |
	| 4         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 4         | Subjects       |                | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 4         | Date           |                | Textbox         | Unsaved        | OK               |
	| 5         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 5         | DRUG1          | Blank          | Text            |                |                  |
	| 5         | DRUG2          | Blank          | Text            |                |                  |
	| 5         | Subjects       |                | Radio           | Unsaved        |                  |
	| 5         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 5         | Text           |                | Textbox         | Unsaved        |                  |
	| 5         | Integer        |                | Textbox         | Unsaved        |                  |
	| 5         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 5         | Date           |                | Textbox         | Unsaved        | OK               |
	| 6         | DRUG           | Study Regimen1 | Text            |                |                  |
	| 6         | DRUG1          | Blank          | Text            |                |                  |
	| 6         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 6         | Subjects       |                | Radio           | Unsaved        |                  |
	| 6         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 6         | Text           |                | Textbox         | Unsaved        |                  |
	| 6         | Integer        |                | Textbox         | Unsaved        |                  |
	| 6         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 6         | Date           |                | Textbox         | Unsaved        | OK               |
	| 7         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 7         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 7         | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 7         | Subjects       |                | Radio           | Unsaved        |                  |
	| 7         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 7         | Text           |                | Textbox         | Unsaved        |                  |
	| 7         | Integer        |                | Textbox         | Unsaved        |                  |
	| 7         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 7         | Date           |                | Textbox         | Unsaved        | OK               |
	| 8         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 8         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 8         | DRUG2          | Blank          | Text            |                |                  |
	| 8         | Subjects       |                | Radio           | Unsaved        |                  |
	| 8         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 8         | Text           |                | Textbox         | Unsaved        |                  |
	| 8         | Integer        |                | Textbox         | Unsaved        |                  |
	| 8         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 8         | Date           |                | Textbox         | Unsaved        | OK               |
	| 9         | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 9         | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 9         | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 9         | Subjects       |                | Radio           | Unsaved        |                  |
	| 9         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 9         | Text           |                | Textbox         | Unsaved        |                  |
	| 9         | Integer        |                | Textbox         | Unsaved        |                  |
	| 9         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 9         | Date           |                | Textbox         | Unsaved        | OK               |
	| 10        | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 10        | DRUG1          | Blank          | Text            |                |                  |
	| 10        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 10        | Subjects       |                | Radio           |                |                  |
	| 10        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 10        | Text           |                | Textbox         | Unsaved        |                  |
	| 10        | Integer        |                | Textbox         | Unsaved        |                  |
	| 10        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 10        | Date           |                | Textbox         | Unsaved        | OK               |
	| 11        | DRUG           | Oxaliplatin1   | Text            | Unsaved        |                  |
	| 11        | DRUG1          | Blank          | Text            |                |                  |
	| 11        | DRUG2          | Blank          | Text            |                |                  |
	| 11        | Subjects       |                | Radio           | Unsaved        |                  |
	| 11        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 11        | Text           |                | Textbox         | Unsaved        |                  |
	| 11        | Integer        |                | Textbox         | Unsaved        |                  |
	| 11        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 11        | Date           |                | Textbox         | Unsaved        | OK               |
	| 12        | DRUG           | Oxaliplatin1   | Text            |                |                  |
	| 12        | DRUG1          | Blank          | Text            |                |                  |
	| 12        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 12        | Subjects       |                | Radio           | Unsaved        |                  |
	| 12        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 12        | Text           |                | Textbox         | Unsaved        |                  |
	| 12        | Integer        |                | Textbox         | Unsaved        |                  |
	| 12        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 12        | Date           |                | Textbox         | Unsaved        | OK               |
	| 13        | DRUG           | [Blank]        | Text            |                |                  |
	| 13        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 13        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 13        | Subjects       |                | Radio           | Unsaved        |                  |
	| 13        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 13        | Text           |                | Textbox         | Unsaved        |                  |
	| 13        | Integer        |                | Textbox         | Unsaved        |                  |
	| 13        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 13        | Date           |                | Textbox         | Unsaved        | OK               |
	| 14        | DRUG           | [Blank]        | Text            |                |                  |
	| 14        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 14        | DRUG2          | Blank          | Text            |                |                  |
	| 14        | Subjects       |                | Radio           | Unsaved        |                  |
	| 14        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 14        | Text           |                | Textbox         | Unsaved        |                  |
	| 14        | Integer        |                | Textbox         | Unsaved        |                  |
	| 14        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 14        | Date           |                | Textbox         | Unsaved        | OK               |
	| 15        | DRUG           | [Blank]        | Text            |                |                  |
	| 15        | DRUG1          | Leucovorin1    | Text            |                |                  |
	| 15        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 15        | Subjects       |                | Radio           | Unsaved        |                  |
	| 15        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 15        | Text           |                | Textbox         | Unsaved        |                  |
	| 15        | Integer        |                | Textbox         | Unsaved        |                  |
	| 15        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 15        | Date           |                | Textbox         | Unsaved        | OK               |
	| 16        | DRUG           | [Blank]        | Text            |                |                  |
	| 16        | DRUG1          | Blank          | Text            |                |                  |
	| 16        | DRUG2          | nab-Paclitaxel | Text            |                |                  |
	| 16        | Subjects       |                | Radio           | Unsaved        |                  |
	| 16        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 16        | Text           |                | Textbox         | Unsaved        |                  |
	| 16        | Integer        |                | Textbox         | Unsaved        |                  |
	| 16        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 16        | Date           |                | Textbox         | Unsaved        | OK               |
	| 17        | DRUG           | [Blank]        | Text            |                |                  |
	| 17        | DRUG1          | Blank          | Text            |                |                  |
	| 17        | DRUG2          | Blank          | Text            |                |                  |
	| 17        | Subjects       |                | Radio           | Unsaved        |                  |
	| 17        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 17        | Text           |                | Textbox         | Unsaved        |                  |
	| 17        | Integer        |                | Textbox         | Unsaved        |                  |
	| 17        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 17        | Date           |                | Textbox         | Unsaved        | OK               |
	| 18        | DRUG           | [Blank]        | Text            |                |                  |
	| 18        | DRUG1          | Blank          | Text            |                |                  |
	| 18        | DRUG2          | Gemcitabine1   | Text            |                |                  |
	| 18        | Subjects       |                | Radio           | Unsaved        |                  |
	| 18        | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 18        | Text           |                | Textbox         | Unsaved        |                  |
	| 18        | Integer        |                | Textbox         | Unsaved        |                  |
	| 18        | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 18        | Date           |                | Textbox         | Unsaved        | OK               |

@ObjectiveEvidence @ReqID:US55962
Scenario: 036_VALUE CHANGE OF CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 004-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #18: Added  | Study design change |
    | System (System\System) | Row #17: Added  | Study design change |
    | System (System\System) | Row #16: Added  | Study design change |
    | System (System\System) | Row #15: Added  | Study design change |
    | System (System\System) | Row #14: Added  | Study design change |
    | System (System\System) | Row #13: Added  | Study design change |
    | System (System\System) | Row #12: Added  | Study design change |
    | System (System\System) | Row #11: Added  | Study design change |
    | System (System\System) | Row #10: Added  | Study design change |
    | System (System\System) | Row #9: Added   | Study design change |
    | System (System\System) | Row #8: Added   | Study design change |
    | System (System\System) | Row #7: Added   | Study design change |
    | System (System\System) | Row #6: Added   | Study design change |
    | System (System\System) | Row #5: Added   | Study design change |
    | System (System\System) | Row #4: Added   | Study design change |
    | System (System\System) | Row #3: Added   | Study design change |
    | System (System\System) | Row #2: Added   | Study design change |
    | System (System\System) | Row #1: Added   | Study design change |
    | System (System\System) | Row #18 Deleted | Study design change |
    | System (System\System) | Row #17 Deleted | Study design change |
    | System (System\System) | Row #16 Deleted | Study design change |
    | System (System\System) | Row #15 Deleted | Study design change |
    | System (System\System) | Row #14 Deleted | Study design change |
    | System (System\System) | Row #13 Deleted | Study design change |
    | System (System\System) | Row #12 Deleted | Study design change |
    | System (System\System) | Row #11 Deleted | Study design change |
    | System (System\System) | Row #10 Deleted | Study design change |
    | System (System\System) | Row #9 Deleted  | Study design change |
    | System (System\System) | Row #8 Deleted  | Study design change |
    | System (System\System) | Row #7 Deleted  | Study design change |
    | System (System\System) | Row #6 Deleted  | Study design change |
    | System (System\System) | Row #5 Deleted  | Study design change |
    | System (System\System) | Row #4 Deleted  | Study design change |
    | System (System\System) | Row #3 Deleted  | Study design change |
    | System (System\System) | Row #2 Deleted  | Study design change |
    | System (System\System) | Row #1 Deleted  | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence
Scenario: 037_VALUE CHANGE OF CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 004-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Saved [Incomplete]           |
	| Migration to 20090330 (v6.0) |

@ObjectiveEvidence @ReqID:US56220,US52809,US52671
Scenario: 038_VALUE CHANGE OF CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 004-Patient
	When I click breadcrumb "004-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | SDVerify | MReview | DReview | Signed |
	| AB_WithThreeKeySequenceColumns_4 | PartialSubmit | Off      | Off     | Off     | Off    |

Scenario: 039_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page




