Feature: Autobuild_CodeItemDelete

	1. Verification of Autobuild structure after study update which includes DELETION of codelistitems of key sequece questions and also verifies table history, item history.
	2. Verification of Flag status, Form status and Signature staus after each study update.
	3. Verification of ODM Eventing for Delete Row for a Autobuild Table on Study Update.
Notes
	1. This scirpt is written by targetting DL 5.8.0. However, this can be executed on higher versions when new DL versions are released by doing the instance upgrade.
	2. DB backup "Autobuild_BaseForDelete.bak" should be used to create DL instance. 
	3. The backup contains test data which is used as part of testing.
	4. Backup file is placed in "AutobuildEnhancementStudies/DB Backups", which is under "Study Files" folder of "BusinessProcesses" project.


@ObjectiveEvidence
Scenario: 001_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@ObjectiveEvidence @ReqId:US53505
Scenario: 002_DELETE CODE ITEM_Perform major study update, in which key sequence question codelist items are reordered
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
	And I upload study "AutobuildEnhancementStudies\Test4500_GREAT_FormStatus_3_DelReorder.zip" with Label "Delete" on Browse field.
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

@ObjectiveEvidence
Scenario: 003_DELETE CODE ITEM_Publish Study with patient migration
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
	| Migration of Site 01 for Study file (Delete) - complete. 4 out of 4 patients migrated successfully. To review see migration report. |

@ObjectiveEvidence @ReqId:US53505
Scenario: 004_DELETE CODE ITEM_Verify data in the form AB_WithOneKeySequenceColumn of patinet 001-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "001-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	Then I verify below "AutobuildFixed with key sequence 1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | RowButtonToClick |
	| 1         | BodyRegion     | Eyes                                                  | Text            |                  |
	| 1         | Subjects       | Chemistry                                             | Text            |                  |
	| 1         | Measurement    | Meters\r\nKgs                                         | Text            |                  |
	| 1         | Text           | Text2                                                 | Text            |                  |
	| 1         | Integer        | 2                                                     | Text            |                  |
	| 1         | WT_Units       | KG                                                    | Text            |                  |
	| 1         | Date           | 02/12/2019                                            | Text            | OK               |
	| 2         | BodyRegion     | Ears                                                  | Text            |                  |
	| 2         | Subjects       | Botony                                                | Text            |                  |
	| 2         | Measurement    | Kgs\r\nGrams                                          | Text            |                  |
	| 2         | Text           | Text3                                                 | Text            |                  |
	| 2         | Integer        | 3                                                     | Text            |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                  |
	| 2         | Date           | 02/12/2019                                            | Text            | OK               |
	| 3         | BodyRegion     | Nose                                                  | Text            |                  |
	| 3         | Subjects       | Zoology                                               | Text            |                  |
	| 3         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                  |
	| 3         | Text           | Text4                                                 | Text            |                  |
	| 3         | Integer        | 4                                                     | Text            |                  |
	| 3         | WT_Units       | KG                                                    | Text            |                  |
	| 3         | Date           | 02/12/2019                                            | Text            | OK               |
	| 4         | BodyRegion     | Chest                                                 | Text            |                  |
	| 4         | Subjects       | Civics                                                | Text            |                  |
	| 4         | Measurement    | KMPH                                                  | Text            |                  |
	| 4         | Text           | Text5                                                 | Text            |                  |
	| 4         | Integer        | 5                                                     | Text            |                  |
	| 4         | WT_Units       | LB                                                    | Text            |                  |
	| 4         | Date           | 02/12/2019                                            | Text            | OK               |
	| 5         | BodyRegion     | Arm                                                   | Text            |                  |
	| 5         | Subjects       | Economics                                             | Text            |                  |
	| 5         | Measurement    | KMPH                                                  | Text            |                  |
	| 5         | Text           | Text6                                                 | Text            |                  |
	| 5         | Integer        | 6                                                     | Text            |                  |
	| 5         | WT_Units       | LB                                                    | Text            |                  |
	| 5         | Date           | 02/12/2019                                            | Text            | OK               |
	| 6         | BodyRegion     | Leg                                                   | Text            |                  |
	| 6         | Subjects       | Commerce                                              | Text            |                  |
	| 6         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                  |
	| 6         | Text           | Text7                                                 | Text            |                  |
	| 6         | Integer        | 7                                                     | Text            |                  |
	| 6         | WT_Units       | LB                                                    | Text            |                  |
	| 6         | Date           | 02/12/2019                                            | Text            | OK               |
	| 7         | BodyRegion     | Head                                                  | Text            |                  |
	| 7         | Subjects       | Physics                                               | Text            |                  |
	| 7         | Measurement    | Feets\r\nMeters                                       | Text            |                  |
	| 7         | Text           | Text1                                                 | Text            |                  |
	| 7         | Integer        | 1                                                     | Text            |                  |
	| 7         | WT_Units       | KG                                                    | Text            |                  |
	| 7         | Date           | 02/12/2019                                            | Text            | OK               |

@ObjectiveEvidence @ReqId:US55962
Scenario: 005_DELETE CODE ITEM_Verify table history for table AutobuildFixed with key sequence 1: of 001-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 1:"
    Then I see ordered table history for table "Table Name" in TableHistoryModalDialog
    | Name                   | Action                  | AdditionalNotes     |
    | System (System\System) | Row #8 renumbered to #7 | Study design change |
    | System (System\System) | Row #7 renumbered to #6 | Study design change |
    | System (System\System) | Row #6 renumbered to #5 | Study design change |
    | System (System\System) | Row #5 renumbered to #4 | Study design change |
    | System (System\System) | Row #4 renumbered to #3 | Study design change |
    | System (System\System) | Row #3 renumbered to #2 | Study design change |
    | System (System\System) | Row #2 renumbered to #1 | Study design change |
    | System (System\System) | Row #1 Deleted          | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqId:US53505
Scenario: 006_DELETE CODE ITEM_Verify Workflow for form AB_WithOneKeySequenceColumn of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Submitted                    |
	| SD-Verify [ On ]             |
	| M-Review [ On ]              |
	| D-Review [ On ]              |
	| Migration to 20090330 (v4.0) |
	
@ObjectiveEvidence @ReqId:US56220,US52810,US52673,US56283
Scenario: 007_DELETE CODE ITEM_Verify Flags and Signature status for form AB_WithOneKeySequenceColumn of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                         | FormStatus | SDVerify | MReview | DReview | Signed |
	| AB_WithOneKeySequenceColumn | Submit     | On       | On      | On      | Ready  |
	
@ObjectiveEvidence @ReqId:US53505
Scenario: 008_DELETE CODE ITEM_Verify data in the form AB_WithTwoKeySequenceColumns of patinet 001-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithTwoKeySequenceColumns" CRF.
	Then I verify below "AutobuildFixed with key sequence 2_12:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | RowButtonToClick |
	| 1         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                  |
	| 1         | STATUS         | [Blank]                                               | Text            |                  |
	| 1         | Subjects       | Civics                                                | Text            |                  |
	| 1         | Measurement    | KMPH                                                  | Text            |                  |
	| 1         | Text           | Text5                                                 | Text            |                  |
	| 1         | Integer        | 5                                                     | Text            |                  |
	| 1         | WT_Units       | LB                                                    | Text            |                  |
	| 1         | Date           | 02/12/2019                                            | Text            | OK               |
	| 2         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                  |
	| 2         | STATUS         | Dead                                                  | Text            |                  |
	| 2         | Subjects       | C                                                     | Text            |                  |
	| 2         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                  |
	| 2         | Text           | Text8                                                 | Text            |                  |
	| 2         | Integer        | 8                                                     | Text            |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                  |
	| 2         | Date           | 02/12/2019                                            | Text            | OK               |
	| 3         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                  |
	| 3         | STATUS         | Lost to follow-up                                     | Text            |                  |
	| 3         | Subjects       | Economics                                             | Text            |                  |
	| 3         | Measurement    | KMPH                                                  | Text            |                  |
	| 3         | Text           | Text6                                                 | Text            |                  |
	| 3         | Integer        | 6                                                     | Text            |                  |
	| 3         | WT_Units       | LB                                                    | Text            |                  |
	| 3         | Date           | 02/12/2019                                            | Text            | OK               |
	| 4         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                  |
	| 4         | STATUS         | Alive                                                 | Text            |                  |
	| 4         | Subjects       | Commerce                                              | Text            |                  |
	| 4         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                  |
	| 4         | Text           | Text7                                                 | Text            |                  |
	| 4         | Integer        | 7                                                     | Text            |                  |
	| 4         | WT_Units       | LB                                                    | Text            |                  |
	| 4         | Date           | 02/12/2019                                            | Text            | OK               |
	| 5         | TATYPE         | [Blank]                                               | Text            |                  |
	| 5         | STATUS         | [Blank]                                               | Text            |                  |
	| 5         | Subjects       | Physics                                               | Text            |                  |
	| 5         | Measurement    | Feets\r\nMeters                                       | Text            |                  |
	| 5         | Text           | Text1                                                 | Text            |                  |
	| 5         | Integer        | 1                                                     | Text            |                  |
	| 5         | WT_Units       | KG                                                    | Text            |                  |
	| 5         | Date           | 02/12/2019                                            | Text            | OK               |
	| 6         | TATYPE         | [Blank]                                               | Text            |                  |
	| 6         | STATUS         | Dead                                                  | Text            |                  |
	| 6         | Subjects       | Zoology                                               | Text            |                  |
	| 6         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                  |
	| 6         | Text           | Text4                                                 | Text            |                  |
	| 6         | Integer        | 4                                                     | Text            |                  |
	| 6         | WT_Units       | KG                                                    | Text            |                  |
	| 6         | Date           | 02/12/2019                                            | Text            | OK               |
	| 7         | TATYPE         | [Blank]                                               | Text            |                  |
	| 7         | STATUS         | Lost to follow-up                                     | Text            |                  |
	| 7         | Subjects       | Chemistry                                             | Text            |                  |
	| 7         | Measurement    | Meters\r\nKgs                                         | Text            |                  |
	| 7         | Text           | Text2                                                 | Text            |                  |
	| 7         | Integer        | 2                                                     | Text            |                  |
	| 7         | WT_Units       | KG                                                    | Text            |                  |
	| 7         | Date           | 02/12/2019                                            | Text            | OK               |
	| 8         | TATYPE         | [Blank]                                               | Text            |                  |
	| 8         | STATUS         | Alive                                                 | Text            |                  |
	| 8         | Subjects       | Botony                                                | Text            |                  |
	| 8         | Measurement    | Kgs\r\nGrams                                          | Text            |                  |
	| 8         | Text           | Text3                                                 | Text            |                  |
	| 8         | Integer        | 3                                                     | Text            |                  |
	| 8         | WT_Units       | KG                                                    | Text            |                  |
	| 8         | Date           | 02/12/2019                                            | Text            | OK               |
	| 9         | TATYPE         | Lymphatic Lesion                                      | Text            |                  |
	| 9         | STATUS         | [Blank]                                               | Text            |                  |
	| 9         | Subjects       | C++                                                   | Text            |                  |
	| 9         | Measurement    | Feets\r\nMeters                                       | Text            |                  |
	| 9         | Text           | Text9                                                 | Text            |                  |
	| 9         | Integer        | 9                                                     | Text            |                  |
	| 9         | WT_Units       | LB                                                    | Text            |                  |
	| 9         | Date           | 02/12/2019                                            | Text            | OK               |
	| 10        | TATYPE         | Lymphatic Lesion                                      | Text            |                  |
	| 10        | STATUS         | Dead                                                  | Text            |                  |
	| 10        | Subjects       | DigitalElectronics                                    | Text            |                  |
	| 10        | Measurement    | Feets\r\nMeters                                       | Text            |                  |
	| 10        | Text           | Text12                                                | Text            |                  |
	| 10        | Integer        | 12                                                    | Text            |                  |
	| 10        | WT_Units       | LB                                                    | Text            |                  |
	| 10        | Date           | 02/12/2019                                            | Text            | OK               |
	| 11        | TATYPE         | Lymphatic Lesion                                      | Text            |                  |
	| 11        | STATUS         | Lost to follow-up                                     | Text            |                  |
	| 11        | Subjects       | ComputerArchitecture                                  | Text            |                  |
	| 11        | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                  |
	| 11        | Text           | Text10                                                | Text            |                  |
	| 11        | Integer        | 10                                                    | Text            |                  |
	| 11        | WT_Units       | KG                                                    | Text            |                  |
	| 11        | Date           | 02/12/2019                                            | Text            | OK               |
	| 12        | TATYPE         | Lymphatic Lesion                                      | Text            |                  |
	| 12        | STATUS         | Alive                                                 | Text            |                  |
	| 12        | Subjects       | DataStructures                                        | Text            |                  |
	| 12        | Measurement    | KMPH                                                  | Text            |                  |
	| 12        | Text           | Text11                                                | Text            |                  |
	| 12        | Integer        | 11                                                    | Text            |                  |
	| 12        | WT_Units       | LB                                                    | Text            |                  |
	| 12        | Date           | 02/12/2019                                            | Text            | OK               |

@ObjectiveEvidence @ReqId:US55962
Scenario: 009_DELETE CODE ITEM_Verify table history for table AutobuildFixed with key sequence 2_12 of form AB_WithTwoKeySequenceColumns of 001-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 2_12:"
    Then I see ordered table history for table "AutobuildFixed with key sequence 2_12:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #20 Deleted           | Study design change |
    | System (System\System) | Row #19 Deleted           | Study design change |
    | System (System\System) | Row #18 Deleted           | Study design change |
    | System (System\System) | Row #17 Deleted           | Study design change |
    | System (System\System) | Row #16 Deleted           | Study design change |
    | System (System\System) | Row #15 renumbered to #12 | Study design change |
    | System (System\System) | Row #14 renumbered to #11 | Study design change |
    | System (System\System) | Row #13 Deleted           | Study design change |
    | System (System\System) | Row #12 renumbered to #10 | Study design change |
    | System (System\System) | Row #11 renumbered to #9  | Study design change |
    | System (System\System) | Row #10 renumbered to #8  | Study design change |
    | System (System\System) | Row #9 renumbered to #7   | Study design change |
    | System (System\System) | Row #8 Deleted            | Study design change |
    | System (System\System) | Row #7 renumbered to #6   | Study design change |
    | System (System\System) | Row #6 renumbered to #5   | Study design change |
    | System (System\System) | Row #5 renumbered to #4   | Study design change |
    | System (System\System) | Row #4 renumbered to #3   | Study design change |
    | System (System\System) | Row #3 Deleted            | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqId:US53505
Scenario: 010_DELETE CODE ITEM_Verify Workflow for form AB_WithTwoKeySequenceColumns of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action           |
	| SD-Verify [ On ] |
	| M-Review [ On ] |
	| D-Review [ On ] |
	| Migration to 20090330 (v4.0) |

@ObjectiveEvidence @ReqId:US56220,US52810,US52673,US56283
Scenario: 011_DELETE CODE ITEM_Verify Flags and Signature status for form AB_WithTwoKeySequenceColumn of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                          | FormStatus    | SDVerify | MReview | DReview | Signed   |
	| AB_WithTwoKeySequenceColumns | PartialSubmit | On       | On      | On      | Rejected |

@ObjectiveEvidence @ReqId:US53505
Scenario: 012_DELETE CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 001-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                            | AnswerFieldType | RowButtonToClick |
	| 1         | DRUG           | Study Regimen                                          | Text            |                  |
	| 1         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 1         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 1         | Subjects       | DataStructures                                         | Text            |                  |
	| 1         | Measurement    | KMPH                                                   | Text            |                  |
	| 1         | Text           | Text11                                                 | Text            |                  |
	| 1         | Integer        | 11                                                     | Text            |                  |
	| 1         | WT_Units       | LB                                                     | Text            |                  |
	| 1         | Date           | 02/12/2019                                             | Text            | OK               |
	| 2         | DRUG           | Study Regimen                                          | Text            |                  |
	| 2         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 2         | DRUG2          | [Blank]                                                | Text            |                  |
	| 2         | Subjects       | ComputerArchitecture                                   | Text            |                  |
	| 2         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                             | Text            |                  |
	| 2         | Text           | Text10                                                 | Text            |                  |
	| 2         | Integer        | 10                                                     | Text            |                  |
	| 2         | WT_Units       | KG                                                     | Text            |                  |
	| 2         | Date           | 02/12/2019                                             | Text            | OK               |
	| 3         | DRUG           | Study Regimen                                          | Text            |                  |
	| 3         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 3         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 3         | Subjects       | DigitalElectronics                                     | Text            |                  |
	| 3         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 3         | Text           | Text12                                                 | Text            |                  |
	| 3         | Integer        | 12                                                     | Text            |                  |
	| 3         | WT_Units       | LB                                                     | Text            |                  |
	| 3         | Date           | 02/12/2019                                             | Text            | OK               |
	| 4         | DRUG           | Study Regimen                                          | Text            |                  |
	| 4         | DRUG1          | [Blank]                                                | Text            |                  |
	| 4         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 4         | Subjects       | C                                                      | Text            |                  |
	| 4         | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 4         | Text           | Text8                                                  | Text            |                  |
	| 4         | Integer        | 8                                                      | Text            |                  |
	| 4         | WT_Units       | KG                                                     | Text            |                  |
	| 4         | Date           | 02/12/2019                                             | Text            | OK               |
	| 5         | DRUG           | Study Regimen                                          | Text            |                  |
	| 5         | DRUG1          | [Blank]                                                | Text            |                  |
	| 5         | DRUG2          | [Blank]                                                | Text            |                  |
	| 5         | Subjects       | Commerce                                               | Text            |                  |
	| 5         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                  |
	| 5         | Text           | Text7                                                  | Text            |                  |
	| 5         | Integer        | 7                                                      | Text            |                  |
	| 5         | WT_Units       | LB                                                     | Text            |                  |
	| 5         | Date           | 02/12/2019                                             | Text            | OK               |
	| 6         | DRUG           | Study Regimen                                          | Text            |                  |
	| 6         | DRUG1          | [Blank]                                                | Text            |                  |
	| 6         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 6         | Subjects       | C++                                                    | Text            |                  |
	| 6         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 6         | Text           | Text9                                                  | Text            |                  |
	| 6         | Integer        | 9                                                      | Text            |                  |
	| 6         | WT_Units       | LB                                                     | Text            |                  |
	| 6         | Date           | 02/12/2019                                             | Text            | OK               |
	| 7         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 7         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 7         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 7         | Subjects       | ComputerArchitecture                                   | Text            |                  |
	| 7         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                             | Text            |                  |
	| 7         | Text           | Text17                                                 | Text            |                  |
	| 7         | Integer        | 17                                                     | Text            |                  |
	| 7         | WT_Units       | KG                                                     | Text            |                  |
	| 7         | Date           | 02/12/2019                                             | Text            | OK               |
	| 8         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 8         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 8         | DRUG2          | [Blank]                                                | Text            |                  |
	| 8         | Subjects       | C++                                                    | Text            |                  |
	| 8         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 8         | Text           | Text16                                                 | Text            |                  |
	| 8         | Integer        | 16                                                     | Text            |                  |
	| 8         | WT_Units       | LB                                                     | Text            |                  |
	| 8         | Date           | 02/12/2019                                             | Text            | OK               |
	| 9         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 9         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 9         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 9         | Subjects       | DataStructures                                         | Text            |                  |
	| 9         | Measurement    | KMPH                                                   | Text            |                  |
	| 9         | Text           | Text18                                                 | Text            |                  |
	| 9         | Integer        | 18                                                     | Text            |                  |
	| 9         | WT_Units       | LB                                                     | Text            |                  |
	| 9         | Date           | 02/12/2019                                             | Text            | OK               |
	| 10        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 10        | DRUG1          | [Blank]                                                | Text            |                  |
	| 10        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 10        | Subjects       | Commerce                                               | Text            |                  |
	| 10        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH  | Text            |                  |
	| 10        | Text           | Text14                                                 | Text            |                  |
	| 10        | Integer        | 14                                                     | Text            |                  |
	| 10        | WT_Units       | LB                                                     | Text            |                  |
	| 10        | Date           | 02/12/2019                                             | Text            | OK               |
	| 11        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 11        | DRUG1          | [Blank]                                                | Text            |                  |
	| 11        | DRUG2          | [Blank]                                                | Text            |                  |
	| 11        | Subjects       | Economics                                              | Text            |                  |
	| 11        | Measurement    | KMPH                                                   | Text            |                  |
	| 11        | Text           | Text13                                                 | Text            |                  |
	| 11        | Integer        | 13                                                     | Text            |                  |
	| 11        | WT_Units       | LB                                                     | Text            |                  |
	| 11        | Date           | 02/12/2019                                             | Text            | OK               |
	| 12        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 12        | DRUG1          | [Blank]                                                | Text            |                  |
	| 12        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 12        | Subjects       | C                                                      | Text            |                  |
	| 12        | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 12        | Text           | Text15                                                 | Text            |                  |
	| 12        | Integer        | 15                                                     | Text            |                  |
	| 12        | WT_Units       | KG                                                     | Text            |                  |
	| 12        | Date           | 02/12/2019                                             | Text            | OK               |
	| 13        | DRUG           | [Blank]                                                | Text            |                  |
	| 13        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 13        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 13        | Subjects       | Civics                                                 | Text            |                  |
	| 13        | Measurement    | KMPH                                                   | Text            |                  |
	| 13        | Text           | Text5                                                  | Text            |                  |
	| 13        | Integer        | 5                                                      | Text            |                  |
	| 13        | WT_Units       | LB                                                     | Text            |                  |
	| 13        | Date           | 02/12/2019                                             | Text            | OK               |
	| 14        | DRUG           | [Blank]                                                | Text            |                  |
	| 14        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 14        | DRUG2          | [Blank]                                                | Text            |                  |
	| 14        | Subjects       | Zoology                                                | Text            |                  |
	| 14        | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 14        | Text           | Text4                                                  | Text            |                  |
	| 14        | Integer        | 4                                                      | Text            |                  |
	| 14        | WT_Units       | KG                                                     | Text            |                  |
	| 14        | Date           | 02/12/2019                                             | Text            | OK               |
	| 15        | DRUG           | [Blank]                                                | Text            |                  |
	| 15        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 15        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 15        | Subjects       | Economics                                              | Text            |                  |
	| 15        | Measurement    | KMPH                                                   | Text            |                  |
	| 15        | Text           | Text6                                                  | Text            |                  |
	| 15        | Integer        | 6                                                      | Text            |                  |
	| 15        | WT_Units       | LB                                                     | Text            |                  |
	| 15        | Date           | 02/12/2019                                             | Text            | OK               |
	| 16        | DRUG           | [Blank]                                                | Text            |                  |
	| 16        | DRUG1          | [Blank]                                                | Text            |                  |
	| 16        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 16        | Subjects       | Chemistry                                              | Text            |                  |
	| 16        | Measurement    | Meters\r\nKgs                                          | Text            |                  |
	| 16        | Text           | Text2                                                  | Text            |                  |
	| 16        | Integer        | 2                                                      | Text            |                  |
	| 16        | WT_Units       | KG                                                     | Text            |                  |
	| 16        | Date           | 02/12/2019                                             | Text            | OK               |
	| 17        | DRUG           | [Blank]                                                | Text            |                  |
	| 17        | DRUG1          | [Blank]                                                | Text            |                  |
	| 17        | DRUG2          | [Blank]                                                | Text            |                  |
	| 17        | Subjects       | Physics                                                | Text            |                  |
	| 17        | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 17        | Text           | Text1                                                  | Text            |                  |
	| 17        | Integer        | 1                                                      | Text            |                  |
	| 17        | WT_Units       | KG                                                     | Text            |                  |
	| 17        | Date           | 02/12/2019                                             | Text            | OK               |
	| 18        | DRUG           | [Blank]                                                | Text            |                  |
	| 18        | DRUG1          | [Blank]                                                | Text            |                  |
	| 18        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 18        | Subjects       | Botony                                                 | Text            |                  |
	| 18        | Measurement    | Kgs\r\nGrams                                           | Text            |                  |
	| 18        | Text           | Text3                                                  | Text            |                  |
	| 18        | Integer        | 3                                                      | Text            |                  |
	| 18        | WT_Units       | KG                                                     | Text            |                  |
	| 18        | Date           | 02/12/2019                                             | Text            | OK               |

@ObjectiveEvidence @ReqId:US55962
Scenario: 013_DELETE CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 001-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #48 Deleted           | Study design change |
    | System (System\System) | Row #47 Deleted           | Study design change |
    | System (System\System) | Row #46 Deleted           | Study design change |
    | System (System\System) | Row #45 Deleted           | Study design change |
    | System (System\System) | Row #44 Deleted           | Study design change |
    | System (System\System) | Row #43 Deleted           | Study design change |
    | System (System\System) | Row #42 Deleted           | Study design change |
    | System (System\System) | Row #41 Deleted           | Study design change |
    | System (System\System) | Row #40 Deleted           | Study design change |
    | System (System\System) | Row #39 Deleted           | Study design change |
    | System (System\System) | Row #38 Deleted           | Study design change |
    | System (System\System) | Row #37 Deleted           | Study design change |
    | System (System\System) | Row #36 Deleted           | Study design change |
    | System (System\System) | Row #35 renumbered to #18 | Study design change |
    | System (System\System) | Row #34 renumbered to #17 | Study design change |
    | System (System\System) | Row #33 renumbered to #16 | Study design change |
    | System (System\System) | Row #32 Deleted           | Study design change |
    | System (System\System) | Row #31 Deleted           | Study design change |
    | System (System\System) | Row #30 Deleted           | Study design change |
    | System (System\System) | Row #29 Deleted           | Study design change |
    | System (System\System) | Row #28 Deleted           | Study design change |
    | System (System\System) | Row #27 renumbered to #15 | Study design change |
    | System (System\System) | Row #26 renumbered to #14 | Study design change |
    | System (System\System) | Row #25 renumbered to #13 | Study design change |
    | System (System\System) | Row #24 Deleted           | Study design change |
    | System (System\System) | Row #23 renumbered to #12 | Study design change |
    | System (System\System) | Row #22 renumbered to #11 | Study design change |
    | System (System\System) | Row #21 renumbered to #10 | Study design change |
    | System (System\System) | Row #20 Deleted           | Study design change |
    | System (System\System) | Row #19 Deleted           | Study design change |
    | System (System\System) | Row #18 Deleted           | Study design change |
    | System (System\System) | Row #17 Deleted           | Study design change |
    | System (System\System) | Row #16 Deleted           | Study design change |
    | System (System\System) | Row #15 renumbered to #9  | Study design change |
    | System (System\System) | Row #14 renumbered to #8  | Study design change |
    | System (System\System) | Row #13 renumbered to #7  | Study design change |
    | System (System\System) | Row #12 Deleted           | Study design change |
    | System (System\System) | Row #11 renumbered to #6  | Study design change |
    | System (System\System) | Row #10 renumbered to #5  | Study design change |
    | System (System\System) | Row #9 renumbered to #4   | Study design change |
    | System (System\System) | Row #8 Deleted            | Study design change |
    | System (System\System) | Row #7 Deleted            | Study design change |
    | System (System\System) | Row #6 Deleted            | Study design change |
    | System (System\System) | Row #5 Deleted            | Study design change |
    | System (System\System) | Row #4 Deleted            | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqId:US53505
Scenario: 014_DELETE CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 001-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Submitted                    |
	| SD-Verify [ On ]             |
	| M-Review [ On ]              |
	| D-Review [ On ]              |
	| Migration to 20090330 (v4.0) |

@ObjectiveEvidence @ReqId:US56220,US52810,US52673,US56283
Scenario: 015_DELETE CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus | SDVerify | MReview | DReview | Signed  |
	| AB_WithThreeKeySequenceColumns_4 | Submit     | On       | On      | On      | Changed |


############# 002-PATIENT ##############

@ObjectiveEvidence @ReqId:US53505
Scenario: 016_DELETE CODE ITEM_Verify data in the form AB_WithOneKeySequenceColumn of patinet 002-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "002-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	Then I verify below "AutobuildFixed with key sequence 1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | RowButtonToClick |
	| 1         | BodyRegion     | Eyes                                                  | Text            |                  |
	| 1         | Subjects       | Chemistry                                             | Text            |                  |
	| 1         | Measurement    | Meters\r\nKgs                                         | Text            |                  |
	| 1         | Text           | Text2                                                 | Text            |                  |
	| 1         | Integer        | 2                                                     | Text            |                  |
	| 1         | WT_Units       | KG                                                    | Text            |                  |
	| 1         | Date           | 02/12/2019                                            | Text            | OK               |
	| 2         | BodyRegion     | Ears                                                  | Text            |                  |
	| 2         | Subjects       | Botony                                                | Text            |                  |
	| 2         | Measurement    | Kgs\r\nGrams                                          | Text            |                  |
	| 2         | Text           | Text3                                                 | Text            |                  |
	| 2         | Integer        | 3                                                     | Text            |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                  |
	| 2         | Date           | 02/12/2019                                            | Text            | OK               |
	| 3         | BodyRegion     | Nose                                                  | Text            |                  |
	| 3         | Subjects       | Zoology                                               | Text            |                  |
	| 3         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                  |
	| 3         | Text           | Text4                                                 | Text            |                  |
	| 3         | Integer        | 4                                                     | Text            |                  |
	| 3         | WT_Units       | KG                                                    | Text            |                  |
	| 3         | Date           | 02/12/2019                                            | Text            | OK               |
	| 4         | BodyRegion     | Chest                                                 | Text            |                  |
	| 4         | Subjects       | Civics                                                | Text            |                  |
	| 4         | Measurement    | KMPH                                                  | Text            |                  |
	| 4         | Text           | Text5                                                 | Text            |                  |
	| 4         | Integer        | 5                                                     | Text            |                  |
	| 4         | WT_Units       | LB                                                    | Text            |                  |
	| 4         | Date           | 02/12/2019                                            | Text            | OK               |
	| 5         | BodyRegion     | Arm                                                   | Text            |                  |
	| 5         | Subjects       | Economics                                             | Text            |                  |
	| 5         | Measurement    | KMPH                                                  | Text            |                  |
	| 5         | Text           | Text6                                                 | Text            |                  |
	| 5         | Integer        | 6                                                     | Text            |                  |
	| 5         | WT_Units       | LB                                                    | Text            |                  |
	| 5         | Date           | 02/12/2019                                            | Text            | OK               |
	| 6         | BodyRegion     | Leg                                                   | Text            |                  |
	| 6         | Subjects       | Commerce                                              | Text            |                  |
	| 6         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                  |
	| 6         | Text           | Text7                                                 | Text            |                  |
	| 6         | Integer        | 7                                                     | Text            |                  |
	| 6         | WT_Units       | LB                                                    | Text            |                  |
	| 6         | Date           | 02/12/2019                                            | Text            | OK               |
	| 7         | BodyRegion     | Head                                                  | Text            |                  |
	| 7         | Subjects       | Physics                                               | Text            |                  |
	| 7         | Measurement    | Feets\r\nMeters                                       | Text            |                  |
	| 7         | Text           | Text1                                                 | Text            |                  |
	| 7         | Integer        | 1                                                     | Text            |                  |
	| 7         | WT_Units       | KG                                                    | Text            |                  |
	| 7         | Date           | 02/12/2019                                            | Text            | OK               |

@ObjectiveEvidence @ReqId:US55962
Scenario: 017_DELETE CODE ITEM_Verify table history for table AutobuildFixed with key sequence 1: of 002-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 1:"
    Then I see ordered table history for table "Table Name" in TableHistoryModalDialog
    | Name                   | Action                  | AdditionalNotes     |
    | System (System\System) | Row #8 renumbered to #7 | Study design change |
    | System (System\System) | Row #7 renumbered to #6 | Study design change |
    | System (System\System) | Row #6 renumbered to #5 | Study design change |
    | System (System\System) | Row #5 renumbered to #4 | Study design change |
    | System (System\System) | Row #4 renumbered to #3 | Study design change |
    | System (System\System) | Row #3 renumbered to #2 | Study design change |
    | System (System\System) | Row #2 renumbered to #1 | Study design change |
    | System (System\System) | Row #1 Deleted          | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqId:US53505
Scenario: 018_DELETE CODE ITEM_Verify Workflow for form AB_WithOneKeySequenceColumn of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Submitted                    |
	| SD-Verify [ On ]             |
	| M-Review [ On ]              |
	| D-Review [ On ]              |
	| Migration to 20090330 (v4.0) |
	
@ObjectiveEvidence @ReqId:US56220,US52810,US52673,US56283
Scenario: 019_DELETE CODE ITEM_Verify Flags and Signature status for form AB_WithOneKeySequenceColumn of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                         | FormStatus | SDVerify | MReview | DReview | Signed |
	| AB_WithOneKeySequenceColumn | Submit     | On       | On      | On      | Ready  |
	
@ObjectiveEvidence @ReqId:US53505
Scenario: 020_DELETE CODE ITEM_Verify data in the form AB_WithTwoKeySequenceColumns of patinet 002-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithTwoKeySequenceColumns" CRF.
	Then I verify below "AutobuildFixed with key sequence 2_12:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                           | AnswerFieldType | RowButtonToClick |
	| 1         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                  |
	| 1         | STATUS         | [Blank]                                               | Text            |                  |
	| 1         | Subjects       | Civics                                                | Text            |                  |
	| 1         | Measurement    | KMPH                                                  | Text            |                  |
	| 1         | Text           | Text5                                                 | Text            |                  |
	| 1         | Integer        | 5                                                     | Text            |                  |
	| 1         | WT_Units       | LB                                                    | Text            |                  |
	| 1         | Date           | 02/12/2019                                            | Text            | OK               |
	| 2         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                  |
	| 2         | STATUS         | Dead                                                  | Text            |                  |
	| 2         | Subjects       | C                                                     | Text            |                  |
	| 2         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                  |
	| 2         | Text           | Text8                                                 | Text            |                  |
	| 2         | Integer        | 8                                                     | Text            |                  |
	| 2         | WT_Units       | KG                                                    | Text            |                  |
	| 2         | Date           | 02/12/2019                                            | Text            | OK               |
	| 3         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                  |
	| 3         | STATUS         | Lost to follow-up                                     | Text            |                  |
	| 3         | Subjects       | Economics                                             | Text            |                  |
	| 3         | Measurement    | KMPH                                                  | Text            |                  |
	| 3         | Text           | Text6                                                 | Text            |                  |
	| 3         | Integer        | 6                                                     | Text            |                  |
	| 3         | WT_Units       | LB                                                    | Text            |                  |
	| 3         | Date           | 02/12/2019                                            | Text            | OK               |
	| 4         | TATYPE         | Non-Lymphatic Lesion                                  | Text            |                  |
	| 4         | STATUS         | Alive                                                 | Text            |                  |
	| 4         | Subjects       | Commerce                                              | Text            |                  |
	| 4         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                  |
	| 4         | Text           | Text7                                                 | Text            |                  |
	| 4         | Integer        | 7                                                     | Text            |                  |
	| 4         | WT_Units       | LB                                                    | Text            |                  |
	| 4         | Date           | 02/12/2019                                            | Text            | OK               |
	| 5         | TATYPE         | [Blank]                                               | Text            |                  |
	| 5         | STATUS         | [Blank]                                               | Text            |                  |
	| 5         | Subjects       | Physics                                               | Text            |                  |
	| 5         | Measurement    | Feets\r\nMeters                                       | Text            |                  |
	| 5         | Text           | Text1                                                 | Text            |                  |
	| 5         | Integer        | 1                                                     | Text            |                  |
	| 5         | WT_Units       | KG                                                    | Text            |                  |
	| 5         | Date           | 02/12/2019                                            | Text            | OK               |
	| 6         | TATYPE         | [Blank]                                               | Text            |                  |
	| 6         | STATUS         | Dead                                                  | Text            |                  |
	| 6         | Subjects       | Zoology                                               | Text            |                  |
	| 6         | Measurement    | Grams\r\nMilliGrams                                   | Text            |                  |
	| 6         | Text           | Text4                                                 | Text            |                  |
	| 6         | Integer        | 4                                                     | Text            |                  |
	| 6         | WT_Units       | KG                                                    | Text            |                  |
	| 6         | Date           | 02/12/2019                                            | Text            | OK               |
	| 7         | TATYPE         | [Blank]                                               | Text            |                  |
	| 7         | STATUS         | Lost to follow-up                                     | Text            |                  |
	| 7         | Subjects       | Chemistry                                             | Text            |                  |
	| 7         | Measurement    | Meters\r\nKgs                                         | Text            |                  |
	| 7         | Text           | Text2                                                 | Text            |                  |
	| 7         | Integer        | 2                                                     | Text            |                  |
	| 7         | WT_Units       | KG                                                    | Text            |                  |
	| 7         | Date           | 02/12/2019                                            | Text            | OK               |
	| 8         | TATYPE         | [Blank]                                               | Text            |                  |
	| 8         | STATUS         | Alive                                                 | Text            |                  |
	| 8         | Subjects       | Botony                                                | Text            |                  |
	| 8         | Measurement    | Kgs\r\nGrams                                          | Text            |                  |
	| 8         | Text           | Text3                                                 | Text            |                  |
	| 8         | Integer        | 3                                                     | Text            |                  |
	| 8         | WT_Units       | KG                                                    | Text            |                  |
	| 8         | Date           | 02/12/2019                                            | Text            | OK               |
	| 9         | TATYPE         | Lymphatic Lesion                                      | Text            |                  |
	| 9         | STATUS         | [Blank]                                               | Text            |                  |
	| 9         | Subjects       | C++                                                   | Text            |                  |
	| 9         | Measurement    | Feets\r\nMeters                                       | Text            |                  |
	| 9         | Text           | Text9                                                 | Text            |                  |
	| 9         | Integer        | 9                                                     | Text            |                  |
	| 9         | WT_Units       | LB                                                    | Text            |                  |
	| 9         | Date           | 02/12/2019                                            | Text            | OK               |
	| 10        | TATYPE         | Lymphatic Lesion                                      | Text            |                  |
	| 10        | STATUS         | Dead                                                  | Text            |                  |
	| 10        | Subjects       | DigitalElectronics                                    | Text            |                  |
	| 10        | Measurement    | Feets\r\nMeters                                       | Text            |                  |
	| 10        | Text           | Text12                                                | Text            |                  |
	| 10        | Integer        | 12                                                    | Text            |                  |
	| 10        | WT_Units       | LB                                                    | Text            |                  |
	| 10        | Date           | 02/12/2019                                            | Text            | OK               |
	| 11        | TATYPE         | Lymphatic Lesion                                      | Text            |                  |
	| 11        | STATUS         | Lost to follow-up                                     | Text            |                  |
	| 11        | Subjects       | ComputerArchitecture                                  | Text            |                  |
	| 11        | Measurement    | Kgs\r\nGrams\r\nMilliGrams                            | Text            |                  |
	| 11        | Text           | Text10                                                | Text            |                  |
	| 11        | Integer        | 10                                                    | Text            |                  |
	| 11        | WT_Units       | KG                                                    | Text            |                  |
	| 11        | Date           | 02/12/2019                                            | Text            | OK               |
	| 12        | TATYPE         | Lymphatic Lesion                                      | Text            |                  |
	| 12        | STATUS         | Alive                                                 | Text            |                  |
	| 12        | Subjects       | DataStructures                                        | Text            |                  |
	| 12        | Measurement    | KMPH                                                  | Text            |                  |
	| 12        | Text           | Text11                                                | Text            |                  |
	| 12        | Integer        | 11                                                    | Text            |                  |
	| 12        | WT_Units       | LB                                                    | Text            |                  |
	| 12        | Date           | 02/12/2019                                            | Text            | OK               |

@ObjectiveEvidence @ReqId:US55962
Scenario: 021_DELETE CODE ITEM_Verify table history for table AutobuildFixed with key sequence 2_12 of form AB_WithTwoKeySequenceColumns of 002-Patient
    When I invoke table hisotry for table "AutobuildFixed with key sequence 2_12:"
    Then I see ordered table history for table "AutobuildFixed with key sequence 2_12:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #20 Deleted           | Study design change |
    | System (System\System) | Row #19 Deleted           | Study design change |
    | System (System\System) | Row #18 Deleted           | Study design change |
    | System (System\System) | Row #17 Deleted           | Study design change |
    | System (System\System) | Row #16 Deleted           | Study design change |
    | System (System\System) | Row #15 renumbered to #12 | Study design change |
    | System (System\System) | Row #14 renumbered to #11 | Study design change |
    | System (System\System) | Row #13 Deleted           | Study design change |
    | System (System\System) | Row #12 renumbered to #10 | Study design change |
    | System (System\System) | Row #11 renumbered to #9  | Study design change |
    | System (System\System) | Row #10 renumbered to #8  | Study design change |
    | System (System\System) | Row #9 renumbered to #7   | Study design change |
    | System (System\System) | Row #8 Deleted            | Study design change |
    | System (System\System) | Row #7 renumbered to #6   | Study design change |
    | System (System\System) | Row #6 renumbered to #5   | Study design change |
    | System (System\System) | Row #5 renumbered to #4   | Study design change |
    | System (System\System) | Row #4 renumbered to #3   | Study design change |
    | System (System\System) | Row #3 Deleted            | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqId:US53505
Scenario: 022_DELETE CODE ITEM_Verify Workflow for form AB_WithTwoKeySequenceColumns of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action           |
	| SD-Verify [ On ] |
	| M-Review [ On ] |
	| D-Review [ On ] |
	| Migration to 20090330 (v4.0) |

@ObjectiveEvidence @ReqId:US56220,US52810,US52673,US56283
Scenario: 023_DELETE CODE ITEM_Verify Flags and Signature status for form AB_WithTwoKeySequenceColumn of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                          | FormStatus    | SDVerify | MReview | DReview | Signed   |
	| AB_WithTwoKeySequenceColumns | PartialSubmit | On       | On      | On      | Ready |

@ObjectiveEvidence @ReqId:US53505
Scenario: 024_DELETE CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 002-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                            | AnswerFieldType | RowButtonToClick |
	| 1         | DRUG           | Study Regimen                                          | Text            |                  |
	| 1         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 1         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 1         | Subjects       | DataStructures                                         | Text            |                  |
	| 1         | Measurement    | KMPH                                                   | Text            |                  |
	| 1         | Text           | Text11                                                 | Text            |                  |
	| 1         | Integer        | 11                                                     | Text            |                  |
	| 1         | WT_Units       | LB                                                     | Text            |                  |
	| 1         | Date           | 02/12/2019                                             | Text            | OK               |
	| 2         | DRUG           | Study Regimen                                          | Text            |                  |
	| 2         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 2         | DRUG2          | [Blank]                                                | Text            |                  |
	| 2         | Subjects       | ComputerArchitecture                                   | Text            |                  |
	| 2         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                             | Text            |                  |
	| 2         | Text           | Text10                                                 | Text            |                  |
	| 2         | Integer        | 10                                                     | Text            |                  |
	| 2         | WT_Units       | KG                                                     | Text            |                  |
	| 2         | Date           | 02/12/2019                                             | Text            | OK               |
	| 3         | DRUG           | Study Regimen                                          | Text            |                  |
	| 3         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 3         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 3         | Subjects       | DigitalElectronics                                     | Text            |                  |
	| 3         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 3         | Text           | Text12                                                 | Text            |                  |
	| 3         | Integer        | 12                                                     | Text            |                  |
	| 3         | WT_Units       | LB                                                     | Text            |                  |
	| 3         | Date           | 02/12/2019                                             | Text            | OK               |
	| 4         | DRUG           | Study Regimen                                          | Text            |                  |
	| 4         | DRUG1          | [Blank]                                                | Text            |                  |
	| 4         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 4         | Subjects       | C                                                      | Text            |                  |
	| 4         | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 4         | Text           | Text8                                                  | Text            |                  |
	| 4         | Integer        | 8                                                      | Text            |                  |
	| 4         | WT_Units       | KG                                                     | Text            |                  |
	| 4         | Date           | 02/12/2019                                             | Text            | OK               |
	| 5         | DRUG           | Study Regimen                                          | Text            |                  |
	| 5         | DRUG1          | [Blank]                                                | Text            |                  |
	| 5         | DRUG2          | [Blank]                                                | Text            |                  |
	| 5         | Subjects       | Commerce                                               | Text            |                  |
	| 5         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                  |
	| 5         | Text           | Text7                                                  | Text            |                  |
	| 5         | Integer        | 7                                                      | Text            |                  |
	| 5         | WT_Units       | LB                                                     | Text            |                  |
	| 5         | Date           | 02/12/2019                                             | Text            | OK               |
	| 6         | DRUG           | Study Regimen                                          | Text            |                  |
	| 6         | DRUG1          | [Blank]                                                | Text            |                  |
	| 6         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 6         | Subjects       | C++                                                    | Text            |                  |
	| 6         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 6         | Text           | Text9                                                  | Text            |                  |
	| 6         | Integer        | 9                                                      | Text            |                  |
	| 6         | WT_Units       | LB                                                     | Text            |                  |
	| 6         | Date           | 02/12/2019                                             | Text            | OK               |
	| 7         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 7         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 7         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 7         | Subjects       | ComputerArchitecture                                   | Text            |                  |
	| 7         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                             | Text            |                  |
	| 7         | Text           | Text17                                                 | Text            |                  |
	| 7         | Integer        | 17                                                     | Text            |                  |
	| 7         | WT_Units       | KG                                                     | Text            |                  |
	| 7         | Date           | 02/12/2019                                             | Text            | OK               |
	| 8         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 8         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 8         | DRUG2          | [Blank]                                                | Text            |                  |
	| 8         | Subjects       | C++                                                    | Text            |                  |
	| 8         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 8         | Text           | Text16                                                 | Text            |                  |
	| 8         | Integer        | 16                                                     | Text            |                  |
	| 8         | WT_Units       | LB                                                     | Text            |                  |
	| 8         | Date           | 02/12/2019                                             | Text            | OK               |
	| 9         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 9         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 9         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 9         | Subjects       | DataStructures                                         | Text            |                  |
	| 9         | Measurement    | KMPH                                                   | Text            |                  |
	| 9         | Text           | Text18                                                 | Text            |                  |
	| 9         | Integer        | 18                                                     | Text            |                  |
	| 9         | WT_Units       | LB                                                     | Text            |                  |
	| 9         | Date           | 02/12/2019                                             | Text            | OK               |
	| 10        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 10        | DRUG1          | [Blank]                                                | Text            |                  |
	| 10        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 10        | Subjects       | Commerce                                               | Text            |                  |
	| 10        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH  | Text            |                  |
	| 10        | Text           | Text14                                                 | Text            |                  |
	| 10        | Integer        | 14                                                     | Text            |                  |
	| 10        | WT_Units       | LB                                                     | Text            |                  |
	| 10        | Date           | 02/12/2019                                             | Text            | OK               |
	| 11        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 11        | DRUG1          | [Blank]                                                | Text            |                  |
	| 11        | DRUG2          | [Blank]                                                | Text            |                  |
	| 11        | Subjects       | Economics                                              | Text            |                  |
	| 11        | Measurement    | KMPH                                                   | Text            |                  |
	| 11        | Text           | Text13                                                 | Text            |                  |
	| 11        | Integer        | 13                                                     | Text            |                  |
	| 11        | WT_Units       | LB                                                     | Text            |                  |
	| 11        | Date           | 02/12/2019                                             | Text            | OK               |
	| 12        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 12        | DRUG1          | [Blank]                                                | Text            |                  |
	| 12        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 12        | Subjects       | C                                                      | Text            |                  |
	| 12        | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 12        | Text           | Text15                                                 | Text            |                  |
	| 12        | Integer        | 15                                                     | Text            |                  |
	| 12        | WT_Units       | KG                                                     | Text            |                  |
	| 12        | Date           | 02/12/2019                                             | Text            | OK               |
	| 13        | DRUG           | [Blank]                                                | Text            |                  |
	| 13        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 13        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 13        | Subjects       | Civics                                                 | Text            |                  |
	| 13        | Measurement    | KMPH                                                   | Text            |                  |
	| 13        | Text           | Text5                                                  | Text            |                  |
	| 13        | Integer        | 5                                                      | Text            |                  |
	| 13        | WT_Units       | LB                                                     | Text            |                  |
	| 13        | Date           | 02/12/2019                                             | Text            | OK               |
	| 14        | DRUG           | [Blank]                                                | Text            |                  |
	| 14        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 14        | DRUG2          | [Blank]                                                | Text            |                  |
	| 14        | Subjects       | Zoology                                                | Text            |                  |
	| 14        | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 14        | Text           | Text4                                                  | Text            |                  |
	| 14        | Integer        | 4                                                      | Text            |                  |
	| 14        | WT_Units       | KG                                                     | Text            |                  |
	| 14        | Date           | 02/12/2019                                             | Text            | OK               |
	| 15        | DRUG           | [Blank]                                                | Text            |                  |
	| 15        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 15        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 15        | Subjects       | Economics                                              | Text            |                  |
	| 15        | Measurement    | KMPH                                                   | Text            |                  |
	| 15        | Text           | Text6                                                  | Text            |                  |
	| 15        | Integer        | 6                                                      | Text            |                  |
	| 15        | WT_Units       | LB                                                     | Text            |                  |
	| 15        | Date           | 02/12/2019                                             | Text            | OK               |
	| 16        | DRUG           | [Blank]                                                | Text            |                  |
	| 16        | DRUG1          | [Blank]                                                | Text            |                  |
	| 16        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 16        | Subjects       | Chemistry                                              | Text            |                  |
	| 16        | Measurement    | Meters\r\nKgs                                          | Text            |                  |
	| 16        | Text           | Text2                                                  | Text            |                  |
	| 16        | Integer        | 2                                                      | Text            |                  |
	| 16        | WT_Units       | KG                                                     | Text            |                  |
	| 16        | Date           | 02/12/2019                                             | Text            | OK               |
	| 17        | DRUG           | [Blank]                                                | Text            |                  |
	| 17        | DRUG1          | [Blank]                                                | Text            |                  |
	| 17        | DRUG2          | [Blank]                                                | Text            |                  |
	| 17        | Subjects       | Physics                                                | Text            |                  |
	| 17        | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 17        | Text           | Text1                                                  | Text            |                  |
	| 17        | Integer        | 1                                                      | Text            |                  |
	| 17        | WT_Units       | KG                                                     | Text            |                  |
	| 17        | Date           | 02/12/2019                                             | Text            | OK               |
	| 18        | DRUG           | [Blank]                                                | Text            |                  |
	| 18        | DRUG1          | [Blank]                                                | Text            |                  |
	| 18        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 18        | Subjects       | Botony                                                 | Text            |                  |
	| 18        | Measurement    | Kgs\r\nGrams                                           | Text            |                  |
	| 18        | Text           | Text3                                                  | Text            |                  |
	| 18        | Integer        | 3                                                      | Text            |                  |
	| 18        | WT_Units       | KG                                                     | Text            |                  |
	| 18        | Date           | 02/12/2019                                             | Text            | OK               |

@ObjectiveEvidence @ReqId:US55962
Scenario: 025_DELETE CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 002-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #48 Deleted           | Study design change |
    | System (System\System) | Row #47 Deleted           | Study design change |
    | System (System\System) | Row #46 Deleted           | Study design change |
    | System (System\System) | Row #45 Deleted           | Study design change |
    | System (System\System) | Row #44 Deleted           | Study design change |
    | System (System\System) | Row #43 Deleted           | Study design change |
    | System (System\System) | Row #42 Deleted           | Study design change |
    | System (System\System) | Row #41 Deleted           | Study design change |
    | System (System\System) | Row #40 Deleted           | Study design change |
    | System (System\System) | Row #39 Deleted           | Study design change |
    | System (System\System) | Row #38 Deleted           | Study design change |
    | System (System\System) | Row #37 Deleted           | Study design change |
    | System (System\System) | Row #36 Deleted           | Study design change |
    | System (System\System) | Row #35 renumbered to #18 | Study design change |
    | System (System\System) | Row #34 renumbered to #17 | Study design change |
    | System (System\System) | Row #33 renumbered to #16 | Study design change |
    | System (System\System) | Row #32 Deleted           | Study design change |
    | System (System\System) | Row #31 Deleted           | Study design change |
    | System (System\System) | Row #30 Deleted           | Study design change |
    | System (System\System) | Row #29 Deleted           | Study design change |
    | System (System\System) | Row #28 Deleted           | Study design change |
    | System (System\System) | Row #27 renumbered to #15 | Study design change |
    | System (System\System) | Row #26 renumbered to #14 | Study design change |
    | System (System\System) | Row #25 renumbered to #13 | Study design change |
    | System (System\System) | Row #24 Deleted           | Study design change |
    | System (System\System) | Row #23 renumbered to #12 | Study design change |
    | System (System\System) | Row #22 renumbered to #11 | Study design change |
    | System (System\System) | Row #21 renumbered to #10 | Study design change |
    | System (System\System) | Row #20 Deleted           | Study design change |
    | System (System\System) | Row #19 Deleted           | Study design change |
    | System (System\System) | Row #18 Deleted           | Study design change |
    | System (System\System) | Row #17 Deleted           | Study design change |
    | System (System\System) | Row #16 Deleted           | Study design change |
    | System (System\System) | Row #15 renumbered to #9  | Study design change |
    | System (System\System) | Row #14 renumbered to #8  | Study design change |
    | System (System\System) | Row #13 renumbered to #7  | Study design change |
    | System (System\System) | Row #12 Deleted           | Study design change |
    | System (System\System) | Row #11 renumbered to #6  | Study design change |
    | System (System\System) | Row #10 renumbered to #5  | Study design change |
    | System (System\System) | Row #9 renumbered to #4   | Study design change |
    | System (System\System) | Row #8 Deleted            | Study design change |
    | System (System\System) | Row #7 Deleted            | Study design change |
    | System (System\System) | Row #6 Deleted            | Study design change |
    | System (System\System) | Row #5 Deleted            | Study design change |
    | System (System\System) | Row #4 Deleted            | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqId:US53505
Scenario: 026_DELETE CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 002-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Submitted                    |
	| SD-Verify [ On ]             |
	| M-Review [ On ]              |
	| D-Review [ On ]              |
	| Migration to 20090330 (v4.0) |

@ObjectiveEvidence @ReqId:US56220,US52810,US52673,US56283
Scenario: 027_DELETE CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 002-Patient
	When I click breadcrumb "002-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus | SDVerify | MReview | DReview | Signed |
	| AB_WithThreeKeySequenceColumns_4 | Submit     | On       | On      | On      | Ready  |

################### 003-Patient ##################

@ObjectiveEvidence @ReqId:US53505
Scenario: 028_DELETE CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 003-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "003-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                            | AnswerFieldType | RowButtonToClick |
	| 1         | DRUG           | Study Regimen                                          | Text            |                  |
	| 1         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 1         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 1         | Subjects       | DataStructures                                         | Text            |                  |
	| 1         | Measurement    | KMPH                                                   | Text            |                  |
	| 1         | Text           | Text11                                                 | Text            |                  |
	| 1         | Integer        | 11                                                     | Text            |                  |
	| 1         | WT_Units       | LB                                                     | Text            |                  |
	| 1         | Date           | 02/12/2019                                             | Text            | OK               |
	| 2         | DRUG           | Study Regimen                                          | Text            |                  |
	| 2         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 2         | DRUG2          | [Blank]                                                | Text            |                  |
	| 2         | Subjects       | ComputerArchitecture                                   | Text            |                  |
	| 2         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                             | Text            |                  |
	| 2         | Text           | Text10                                                 | Text            |                  |
	| 2         | Integer        | 10                                                     | Text            |                  |
	| 2         | WT_Units       | KG                                                     | Text            |                  |
	| 2         | Date           | 02/12/2019                                             | Text            | OK               |
	| 3         | DRUG           | Study Regimen                                          | Text            |                  |
	| 3         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 3         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 3         | Subjects       | DigitalElectronics                                     | Text            |                  |
	| 3         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 3         | Text           | Text12                                                 | Text            |                  |
	| 3         | Integer        | 12                                                     | Text            |                  |
	| 3         | WT_Units       | LB                                                     | Text            |                  |
	| 3         | Date           | 02/12/2019                                             | Text            | OK               |
	| 4         | DRUG           | Study Regimen                                          | Text            |                  |
	| 4         | DRUG1          | [Blank]                                                | Text            |                  |
	| 4         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 4         | Subjects       | C                                                      | Text            |                  |
	| 4         | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 4         | Text           | Text8                                                  | Text            |                  |
	| 4         | Integer        | 8                                                      | Text            |                  |
	| 4         | WT_Units       | KG                                                     | Text            |                  |
	| 4         | Date           | 02/12/2019                                             | Text            | OK               |
	| 5         | DRUG           | Study Regimen                                          | Text            |                  |
	| 5         | DRUG1          | [Blank]                                                | Text            |                  |
	| 5         | DRUG2          | [Blank]                                                | Text            |                  |
	| 5         | Subjects       | Commerce                                               | Text            |                  |
	| 5         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                  |
	| 5         | Text           | Text7                                                  | Text            |                  |
	| 5         | Integer        | 7                                                      | Text            |                  |
	| 5         | WT_Units       | LB                                                     | Text            |                  |
	| 5         | Date           | 02/12/2019                                             | Text            | OK               |
	| 6         | DRUG           | Study Regimen                                          | Text            |                  |
	| 6         | DRUG1          | [Blank]                                                | Text            |                  |
	| 6         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 6         | Subjects       | C++                                                    | Text            |                  |
	| 6         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 6         | Text           | Text9                                                  | Text            |                  |
	| 6         | Integer        | 9                                                      | Text            |                  |
	| 6         | WT_Units       | LB                                                     | Text            |                  |
	| 6         | Date           | 02/12/2019                                             | Text            | OK               |
	| 7         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 7         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 7         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 7         | Subjects       | ComputerArchitecture                                   | Text            |                  |
	| 7         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                             | Text            |                  |
	| 7         | Text           | Text17                                                 | Text            |                  |
	| 7         | Integer        | 17                                                     | Text            |                  |
	| 7         | WT_Units       | KG                                                     | Text            |                  |
	| 7         | Date           | 02/12/2019                                             | Text            | OK               |
	| 8         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 8         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 8         | DRUG2          | [Blank]                                                | Text            |                  |
	| 8         | Subjects       | C++                                                    | Text            |                  |
	| 8         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 8         | Text           | Text16                                                 | Text            |                  |
	| 8         | Integer        | 16                                                     | Text            |                  |
	| 8         | WT_Units       | LB                                                     | Text            |                  |
	| 8         | Date           | 02/12/2019                                             | Text            | OK               |
	| 9         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 9         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 9         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 9         | Subjects       | DataStructures                                         | Text            |                  |
	| 9         | Measurement    | KMPH                                                   | Text            |                  |
	| 9         | Text           | Text18                                                 | Text            |                  |
	| 9         | Integer        | 18                                                     | Text            |                  |
	| 9         | WT_Units       | LB                                                     | Text            |                  |
	| 9         | Date           | 02/12/2019                                             | Text            | OK               |
	| 10        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 10        | DRUG1          | [Blank]                                                | Text            |                  |
	| 10        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 10        | Subjects       | Commerce                                               | Text            |                  |
	| 10        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH  | Text            |                  |
	| 10        | Text           | Text14                                                 | Text            |                  |
	| 10        | Integer        | 14                                                     | Text            |                  |
	| 10        | WT_Units       | LB                                                     | Text            |                  |
	| 10        | Date           | 02/12/2019                                             | Text            | OK               |
	| 11        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 11        | DRUG1          | [Blank]                                                | Text            |                  |
	| 11        | DRUG2          | [Blank]                                                | Text            |                  |
	| 11        | Subjects       | Economics                                              | Text            |                  |
	| 11        | Measurement    | KMPH                                                   | Text            |                  |
	| 11        | Text           | Text13                                                 | Text            |                  |
	| 11        | Integer        | 13                                                     | Text            |                  |
	| 11        | WT_Units       | LB                                                     | Text            |                  |
	| 11        | Date           | 02/12/2019                                             | Text            | OK               |
	| 12        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 12        | DRUG1          | [Blank]                                                | Text            |                  |
	| 12        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 12        | Subjects       | C                                                      | Text            |                  |
	| 12        | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 12        | Text           | Text15                                                 | Text            |                  |
	| 12        | Integer        | 15                                                     | Text            |                  |
	| 12        | WT_Units       | KG                                                     | Text            |                  |
	| 12        | Date           | 02/12/2019                                             | Text            | OK               |
	| 13        | DRUG           | [Blank]                                                | Text            |                  |
	| 13        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 13        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 13        | Subjects       | Civics                                                 | Text            |                  |
	| 13        | Measurement    | KMPH                                                   | Text            |                  |
	| 13        | Text           | Text5                                                  | Text            |                  |
	| 13        | Integer        | 5                                                      | Text            |                  |
	| 13        | WT_Units       | LB                                                     | Text            |                  |
	| 13        | Date           | 02/12/2019                                             | Text            | OK               |
	| 14        | DRUG           | [Blank]                                                | Text            |                  |
	| 14        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 14        | DRUG2          | [Blank]                                                | Text            |                  |
	| 14        | Subjects       | Zoology                                                | Text            |                  |
	| 14        | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 14        | Text           | Text4                                                  | Text            |                  |
	| 14        | Integer        | 4                                                      | Text            |                  |
	| 14        | WT_Units       | KG                                                     | Text            |                  |
	| 14        | Date           | 02/12/2019                                             | Text            | OK               |
	| 15        | DRUG           | [Blank]                                                | Text            |                  |
	| 15        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 15        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 15        | Subjects       | Economics                                              | Text            |                  |
	| 15        | Measurement    | KMPH                                                   | Text            |                  |
	| 15        | Text           | Text6                                                  | Text            |                  |
	| 15        | Integer        | 6                                                      | Text            |                  |
	| 15        | WT_Units       | LB                                                     | Text            |                  |
	| 15        | Date           | 02/12/2019                                             | Text            | OK               |
	| 16        | DRUG           | [Blank]                                                | Text            |                  |
	| 16        | DRUG1          | [Blank]                                                | Text            |                  |
	| 16        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 16        | Subjects       | Chemistry                                              | Text            |                  |
	| 16        | Measurement    | Meters\r\nKgs                                          | Text            |                  |
	| 16        | Text           | Text2                                                  | Text            |                  |
	| 16        | Integer        | 2                                                      | Text            |                  |
	| 16        | WT_Units       | KG                                                     | Text            |                  |
	| 16        | Date           | 02/12/2019                                             | Text            | OK               |
	| 17        | DRUG           | [Blank]                                                | Text            |                  |
	| 17        | DRUG1          | [Blank]                                                | Text            |                  |
	| 17        | DRUG2          | [Blank]                                                | Text            |                  |
	| 17        | Subjects       | Physics                                                | Text            |                  |
	| 17        | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 17        | Text           | Text1                                                  | Text            |                  |
	| 17        | Integer        | 1                                                      | Text            |                  |
	| 17        | WT_Units       | KG                                                     | Text            |                  |
	| 17        | Date           | 02/12/2019                                             | Text            | OK               |
	| 18        | DRUG           | [Blank]                                                | Text            |                  |
	| 18        | DRUG1          | [Blank]                                                | Text            |                  |
	| 18        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 18        | Subjects       | Botony                                                 | Text            |                  |
	| 18        | Measurement    | Kgs\r\nGrams                                           | Text            |                  |
	| 18        | Text           | Text3                                                  | Text            |                  |
	| 18        | Integer        | 3                                                      | Text            |                  |
	| 18        | WT_Units       | KG                                                     | Text            |                  |
	| 18        | Date           | 02/12/2019                                             | Text            | OK               |

@ObjectiveEvidence @ReqId:US55962
Scenario: 029_DELETE CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 003-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #48 Deleted           | Study design change |
    | System (System\System) | Row #47 Deleted           | Study design change |
    | System (System\System) | Row #46 Deleted           | Study design change |
    | System (System\System) | Row #45 Deleted           | Study design change |
    | System (System\System) | Row #44 Deleted           | Study design change |
    | System (System\System) | Row #43 Deleted           | Study design change |
    | System (System\System) | Row #42 Deleted           | Study design change |
    | System (System\System) | Row #41 Deleted           | Study design change |
    | System (System\System) | Row #40 Deleted           | Study design change |
    | System (System\System) | Row #39 Deleted           | Study design change |
    | System (System\System) | Row #38 Deleted           | Study design change |
    | System (System\System) | Row #37 Deleted           | Study design change |
    | System (System\System) | Row #36 Deleted           | Study design change |
    | System (System\System) | Row #35 renumbered to #18 | Study design change |
    | System (System\System) | Row #34 renumbered to #17 | Study design change |
    | System (System\System) | Row #33 renumbered to #16 | Study design change |
    | System (System\System) | Row #32 Deleted           | Study design change |
    | System (System\System) | Row #31 Deleted           | Study design change |
    | System (System\System) | Row #30 Deleted           | Study design change |
    | System (System\System) | Row #29 Deleted           | Study design change |
    | System (System\System) | Row #28 Deleted           | Study design change |
    | System (System\System) | Row #27 renumbered to #15 | Study design change |
    | System (System\System) | Row #26 renumbered to #14 | Study design change |
    | System (System\System) | Row #25 renumbered to #13 | Study design change |
    | System (System\System) | Row #24 Deleted           | Study design change |
    | System (System\System) | Row #23 renumbered to #12 | Study design change |
    | System (System\System) | Row #22 renumbered to #11 | Study design change |
    | System (System\System) | Row #21 renumbered to #10 | Study design change |
    | System (System\System) | Row #20 Deleted           | Study design change |
    | System (System\System) | Row #19 Deleted           | Study design change |
    | System (System\System) | Row #18 Deleted           | Study design change |
    | System (System\System) | Row #17 Deleted           | Study design change |
    | System (System\System) | Row #16 Deleted           | Study design change |
    | System (System\System) | Row #15 renumbered to #9  | Study design change |
    | System (System\System) | Row #14 renumbered to #8  | Study design change |
    | System (System\System) | Row #13 renumbered to #7  | Study design change |
    | System (System\System) | Row #12 Deleted           | Study design change |
    | System (System\System) | Row #11 renumbered to #6  | Study design change |
    | System (System\System) | Row #10 renumbered to #5  | Study design change |
    | System (System\System) | Row #9 renumbered to #4   | Study design change |
    | System (System\System) | Row #8 Deleted            | Study design change |
    | System (System\System) | Row #7 Deleted            | Study design change |
    | System (System\System) | Row #6 Deleted            | Study design change |
    | System (System\System) | Row #5 Deleted            | Study design change |
    | System (System\System) | Row #4 Deleted            | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqId:US53505
Scenario: 030_DELETE CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 003-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Submitted                    |
	| Migration to 20090330 (v4.0) |

@ObjectiveEvidence @ReqId:US56220,US52810,US52673,US56283
Scenario: 031_DELTE CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 003-Patient
	When I click breadcrumb "003-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus    | DCF | SDVerify | MReview | DReview | Signed   | Frozen | Locked |
	| AB_WithThreeKeySequenceColumns_4 | Submit        |     | Off       | Off      | Off      | Off   |        |        |


################# 004-PATIENT #################

@ObjectiveEvidence @ReqId:US53505
Scenario: 032_DELETE CODE ITEM_Verify data in the form  AB_WithThreeKeySequenceColumns_4 of patinet 004-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "004-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	Then I verify below "AutobuildFixedWithKeySequence3_123:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue                                            | AnswerFieldType | RowButtonToClick |
	| 1         | DRUG           | Study Regimen                                          | Text            |                  |
	| 1         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 1         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 1         | Subjects       | DataStructures                                         | Text            |                  |
	| 1         | Measurement    | KMPH                                                   | Text            |                  |
	| 1         | Text           | Text11                                                 | Text            |                  |
	| 1         | Integer        | 11                                                     | Text            |                  |
	| 1         | WT_Units       | LB                                                     | Text            |                  |
	| 1         | Date           | 02/12/2019                                             | Text            | OK               |
	| 2         | DRUG           | Study Regimen                                          | Text            |                  |
	| 2         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 2         | DRUG2          | [Blank]                                                | Text            |                  |
	| 2         | Subjects       | ComputerArchitecture                                   | Text            |                  |
	| 2         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                             | Text            |                  |
	| 2         | Text           | Text10                                                 | Text            |                  |
	| 2         | Integer        | 10                                                     | Text            |                  |
	| 2         | WT_Units       | KG                                                     | Text            |                  |
	| 2         | Date           | 02/12/2019                                             | Text            | OK               |
	| 3         | DRUG           | Study Regimen                                          | Text            |                  |
	| 3         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 3         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 3         | Subjects       | DigitalElectronics                                     | Text            |                  |
	| 3         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 3         | Text           | Text12                                                 | Text            |                  |
	| 3         | Integer        | 12                                                     | Text            |                  |
	| 3         | WT_Units       | LB                                                     | Text            |                  |
	| 3         | Date           | 02/12/2019                                             | Text            | OK               |
	| 4         | DRUG           | Study Regimen                                          | Text            |                  |
	| 4         | DRUG1          | [Blank]                                                | Text            |                  |
	| 4         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 4         | Subjects       | C                                                      | Text            |                  |
	| 4         | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 4         | Text           | Text8                                                  | Text            |                  |
	| 4         | Integer        | 8                                                      | Text            |                  |
	| 4         | WT_Units       | KG                                                     | Text            |                  |
	| 4         | Date           | 02/12/2019                                             | Text            | OK               |
	| 5         | DRUG           | Study Regimen                                          | Text            |                  |
	| 5         | DRUG1          | [Blank]                                                | Text            |                  |
	| 5         | DRUG2          | [Blank]                                                | Text            |                  |
	| 5         | Subjects       | Commerce                                               | Text            |                  |
	| 5         | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH | Text            |                  |
	| 5         | Text           | Text7                                                  | Text            |                  |
	| 5         | Integer        | 7                                                      | Text            |                  |
	| 5         | WT_Units       | LB                                                     | Text            |                  |
	| 5         | Date           | 02/12/2019                                             | Text            | OK               |
	| 6         | DRUG           | Study Regimen                                          | Text            |                  |
	| 6         | DRUG1          | [Blank]                                                | Text            |                  |
	| 6         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 6         | Subjects       | C++                                                    | Text            |                  |
	| 6         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 6         | Text           | Text9                                                  | Text            |                  |
	| 6         | Integer        | 9                                                      | Text            |                  |
	| 6         | WT_Units       | LB                                                     | Text            |                  |
	| 6         | Date           | 02/12/2019                                             | Text            | OK               |
	| 7         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 7         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 7         | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 7         | Subjects       | ComputerArchitecture                                   | Text            |                  |
	| 7         | Measurement    | Kgs\r\nGrams\r\nMilliGrams                             | Text            |                  |
	| 7         | Text           | Text17                                                 | Text            |                  |
	| 7         | Integer        | 17                                                     | Text            |                  |
	| 7         | WT_Units       | KG                                                     | Text            |                  |
	| 7         | Date           | 02/12/2019                                             | Text            | OK               |
	| 8         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 8         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 8         | DRUG2          | [Blank]                                                | Text            |                  |
	| 8         | Subjects       | C++                                                    | Text            |                  |
	| 8         | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 8         | Text           | Text16                                                 | Text            |                  |
	| 8         | Integer        | 16                                                     | Text            |                  |
	| 8         | WT_Units       | LB                                                     | Text            |                  |
	| 8         | Date           | 02/12/2019                                             | Text            | OK               |
	| 9         | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 9         | DRUG1          | Leucovorin                                             | Text            |                  |
	| 9         | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 9         | Subjects       | DataStructures                                         | Text            |                  |
	| 9         | Measurement    | KMPH                                                   | Text            |                  |
	| 9         | Text           | Text18                                                 | Text            |                  |
	| 9         | Integer        | 18                                                     | Text            |                  |
	| 9         | WT_Units       | LB                                                     | Text            |                  |
	| 9         | Date           | 02/12/2019                                             | Text            | OK               |
	| 10        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 10        | DRUG1          | [Blank]                                                | Text            |                  |
	| 10        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 10        | Subjects       | Commerce                                               | Text            |                  |
	| 10        | Measurement    | Feets\r\nMeters\r\nKgs\r\nGrams\r\nMilliGrams\r\nKMPH  | Text            |                  |
	| 10        | Text           | Text14                                                 | Text            |                  |
	| 10        | Integer        | 14                                                     | Text            |                  |
	| 10        | WT_Units       | LB                                                     | Text            |                  |
	| 10        | Date           | 02/12/2019                                             | Text            | OK               |
	| 11        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 11        | DRUG1          | [Blank]                                                | Text            |                  |
	| 11        | DRUG2          | [Blank]                                                | Text            |                  |
	| 11        | Subjects       | Economics                                              | Text            |                  |
	| 11        | Measurement    | KMPH                                                   | Text            |                  |
	| 11        | Text           | Text13                                                 | Text            |                  |
	| 11        | Integer        | 13                                                     | Text            |                  |
	| 11        | WT_Units       | LB                                                     | Text            |                  |
	| 11        | Date           | 02/12/2019                                             | Text            | OK               |
	| 12        | DRUG           | Oxaliplatin                                            | Text            |                  |
	| 12        | DRUG1          | [Blank]                                                | Text            |                  |
	| 12        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 12        | Subjects       | C                                                      | Text            |                  |
	| 12        | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 12        | Text           | Text15                                                 | Text            |                  |
	| 12        | Integer        | 15                                                     | Text            |                  |
	| 12        | WT_Units       | KG                                                     | Text            |                  |
	| 12        | Date           | 02/12/2019                                             | Text            | OK               |
	| 13        | DRUG           | [Blank]                                                | Text            |                  |
	| 13        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 13        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 13        | Subjects       | Civics                                                 | Text            |                  |
	| 13        | Measurement    | KMPH                                                   | Text            |                  |
	| 13        | Text           | Text5                                                  | Text            |                  |
	| 13        | Integer        | 5                                                      | Text            |                  |
	| 13        | WT_Units       | LB                                                     | Text            |                  |
	| 13        | Date           | 02/12/2019                                             | Text            | OK               |
	| 14        | DRUG           | [Blank]                                                | Text            |                  |
	| 14        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 14        | DRUG2          | [Blank]                                                | Text            |                  |
	| 14        | Subjects       | Zoology                                                | Text            |                  |
	| 14        | Measurement    | Grams\r\nMilliGrams                                    | Text            |                  |
	| 14        | Text           | Text4                                                  | Text            |                  |
	| 14        | Integer        | 4                                                      | Text            |                  |
	| 14        | WT_Units       | KG                                                     | Text            |                  |
	| 14        | Date           | 02/12/2019                                             | Text            | OK               |
	| 15        | DRUG           | [Blank]                                                | Text            |                  |
	| 15        | DRUG1          | Leucovorin                                             | Text            |                  |
	| 15        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 15        | Subjects       | Economics                                              | Text            |                  |
	| 15        | Measurement    | KMPH                                                   | Text            |                  |
	| 15        | Text           | Text6                                                  | Text            |                  |
	| 15        | Integer        | 6                                                      | Text            |                  |
	| 15        | WT_Units       | LB                                                     | Text            |                  |
	| 15        | Date           | 02/12/2019                                             | Text            | OK               |
	| 16        | DRUG           | [Blank]                                                | Text            |                  |
	| 16        | DRUG1          | [Blank]                                                | Text            |                  |
	| 16        | DRUG2          | nab-Paclitaxel                                         | Text            |                  |
	| 16        | Subjects       | Chemistry                                              | Text            |                  |
	| 16        | Measurement    | Meters\r\nKgs                                          | Text            |                  |
	| 16        | Text           | Text2                                                  | Text            |                  |
	| 16        | Integer        | 2                                                      | Text            |                  |
	| 16        | WT_Units       | KG                                                     | Text            |                  |
	| 16        | Date           | 02/12/2019                                             | Text            | OK               |
	| 17        | DRUG           | [Blank]                                                | Text            |                  |
	| 17        | DRUG1          | [Blank]                                                | Text            |                  |
	| 17        | DRUG2          | [Blank]                                                | Text            |                  |
	| 17        | Subjects       | Physics                                                | Text            |                  |
	| 17        | Measurement    | Feets\r\nMeters                                        | Text            |                  |
	| 17        | Text           | Text1                                                  | Text            |                  |
	| 17        | Integer        | 1                                                      | Text            |                  |
	| 17        | WT_Units       | KG                                                     | Text            |                  |
	| 17        | Date           | 02/12/2019                                             | Text            | OK               |
	| 18        | DRUG           | [Blank]                                                | Text            |                  |
	| 18        | DRUG1          | [Blank]                                                | Text            |                  |
	| 18        | DRUG2          | Gemcitabine                                            | Text            |                  |
	| 18        | Subjects       | Botony                                                 | Text            |                  |
	| 18        | Measurement    | Kgs\r\nGrams                                           | Text            |                  |
	| 18        | Text           | Text3                                                  | Text            |                  |
	| 18        | Integer        | 3                                                      | Text            |                  |
	| 18        | WT_Units       | KG                                                     | Text            |                  |
	| 18        | Date           | 02/12/2019                                             | Text            | OK               |

@ObjectiveEvidence @ReqId:US55962
Scenario: 033_DELETE CODE ITEM_Verify table history for table AutobuildFixedWithKeySequence3_123: of form AB_WithThreeKeySequenceColumns_4 of 004-Patient
    When I invoke table hisotry for table "AutobuildFixedWithKeySequence3_123:"
    Then I see ordered table history for table "AutobuildFixedWithKeySequence3_123:" in TableHistoryModalDialog
    | Name                   | Action                    | AdditionalNotes     |
    | System (System\System) | Row #48 Deleted           | Study design change |
    | System (System\System) | Row #47 Deleted           | Study design change |
    | System (System\System) | Row #46 Deleted           | Study design change |
    | System (System\System) | Row #45 Deleted           | Study design change |
    | System (System\System) | Row #44 Deleted           | Study design change |
    | System (System\System) | Row #43 Deleted           | Study design change |
    | System (System\System) | Row #42 Deleted           | Study design change |
    | System (System\System) | Row #41 Deleted           | Study design change |
    | System (System\System) | Row #40 Deleted           | Study design change |
    | System (System\System) | Row #39 Deleted           | Study design change |
    | System (System\System) | Row #38 Deleted           | Study design change |
    | System (System\System) | Row #37 Deleted           | Study design change |
    | System (System\System) | Row #36 Deleted           | Study design change |
    | System (System\System) | Row #35 renumbered to #18 | Study design change |
    | System (System\System) | Row #34 renumbered to #17 | Study design change |
    | System (System\System) | Row #33 renumbered to #16 | Study design change |
    | System (System\System) | Row #32 Deleted           | Study design change |
    | System (System\System) | Row #31 Deleted           | Study design change |
    | System (System\System) | Row #30 Deleted           | Study design change |
    | System (System\System) | Row #29 Deleted           | Study design change |
    | System (System\System) | Row #28 Deleted           | Study design change |
    | System (System\System) | Row #27 renumbered to #15 | Study design change |
    | System (System\System) | Row #26 renumbered to #14 | Study design change |
    | System (System\System) | Row #25 renumbered to #13 | Study design change |
    | System (System\System) | Row #24 Deleted           | Study design change |
    | System (System\System) | Row #23 renumbered to #12 | Study design change |
    | System (System\System) | Row #22 renumbered to #11 | Study design change |
    | System (System\System) | Row #21 renumbered to #10 | Study design change |
    | System (System\System) | Row #20 Deleted           | Study design change |
    | System (System\System) | Row #19 Deleted           | Study design change |
    | System (System\System) | Row #18 Deleted           | Study design change |
    | System (System\System) | Row #17 Deleted           | Study design change |
    | System (System\System) | Row #16 Deleted           | Study design change |
    | System (System\System) | Row #15 renumbered to #9  | Study design change |
    | System (System\System) | Row #14 renumbered to #8  | Study design change |
    | System (System\System) | Row #13 renumbered to #7  | Study design change |
    | System (System\System) | Row #12 Deleted           | Study design change |
    | System (System\System) | Row #11 renumbered to #6  | Study design change |
    | System (System\System) | Row #10 renumbered to #5  | Study design change |
    | System (System\System) | Row #9 renumbered to #4   | Study design change |
    | System (System\System) | Row #8 Deleted            | Study design change |
    | System (System\System) | Row #7 Deleted            | Study design change |
    | System (System\System) | Row #6 Deleted            | Study design change |
    | System (System\System) | Row #5 Deleted            | Study design change |
    | System (System\System) | Row #4 Deleted            | Study design change |
	And I close TableHistoryModalDialog

@ObjectiveEvidence @ReqId:US53505
Scenario: 034_DELTE CODE ITEM_Verify Workflow for form AB_WithThreeKeySequenceColumns_4 of 004-Patient
	When I open main tab "Workflow" of Form
	Then I see workflow items in CRF
	| Action                       |
	| Submitted                    |
	| Migration to 20090330 (v4.0) |

@ObjectiveEvidence @ReqId:US56220,US52810,US52673,US56283
Scenario: 035_DELETE CODE ITEM_Verify Flags and Signature status for form AB_WithThreeKeySequenceColumns_4 of 004-Patient
	When I click breadcrumb "004-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                              | FormStatus | SDVerify | MReview | DReview | Signed |
	| AB_WithThreeKeySequenceColumns_4 | Submit     | Off      | Off     | Off     | Off    |

@ObjectiveEvidence @ReqID:US63130
Scenario: 036_Verify the ODM XML generated on Autobuild Changes for Patient - 001 on Study Update
	Given I save the Event XML data in "StudyUpdateAutobuild001PatientDELRowActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and StatusKey=311 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='001-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateAutobuild001PatientDELRowExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateAutobuild001PatientDELRowActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US63130
Scenario: 037_Verify the ODM XML generated on Autobuild Changes for Patient - 002 on Study Update
	Given I save the Event XML data in "StudyUpdateAutobuild002PatientDELRowActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and StatusKey=311 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='002-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateAutobuild002PatientDELRowExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateAutobuild002PatientDELRowActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US63130
Scenario: 037_Verify the ODM XML generated on Autobuild Changes for Patient - 003 on Study Update
	Given I save the Event XML data in "StudyUpdateAutobuild003PatientDELRowActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and StatusKey=311 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='003-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateAutobuild003PatientDELRowExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateAutobuild003PatientDELRowActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US63130 @ReqId:US63131
Scenario: 038_Verify the ODM XML generated on Autobuild Changes for Patient - 004 on Study Update
	Given I save the Event XML data in "StudyUpdateAutobuild004PatientDELRowActual.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where StudyEventKey=16 and StatusKey=311 and XmlMessage like '%' + (Select SubjectKey from Patient where PatientIdentity='004-Patient') + '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyUpdateAutobuild004PatientDELRowExpected.xml" available in the project folder.
	And I have the XML file "StudyUpdateAutobuild004PatientDELRowActual.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: 039_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page