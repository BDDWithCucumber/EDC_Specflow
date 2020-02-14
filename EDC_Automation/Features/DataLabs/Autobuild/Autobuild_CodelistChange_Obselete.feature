Feature: Autobuild_CodelistChange


@ObjectiveEvidence
Scenario: 001_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: 002_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 003_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "AutobuildEnhancementStudies\CodelistChange\Test4500_GREAT_Base.zip" with study label "TestBase"
	Then I see study label "Test4500_GREAT_FORMSTATUS" in header

Scenario: 004_Add Site 01-Site and assign it to testadmin user
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: 005_Add patient 001-Patient from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 001      | Patient         | 11/05/2019 |
	Then I see below patients added in the Patients table.
	| PatientID   |
	| 001-Patient |

Scenario: 006_Select the Patient 001-Patient, Open and save the form AB_WithOneKeySequenceColumn form under Visit(Screening)
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "001-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	And I select "Checkout" button on "AB_WithOneKeySequenceColumn" CRF.
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "AB_WithOneKeySequenceColumn" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 007_Select the Patient 001-Patient, Open and save the form AB_WithTwoKeySequenceColumns form under Visit(Screening)
	When I expand "Visit (Week 2)" to select and open "AB_WithTwoKeySequenceColumns" CRF.
	And I select "Checkout" button on "AB_WithTwoKeySequenceColumns" CRF.
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "AB_WithTwoKeySequenceColumns" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 007_Select the Patient 001-Patient, Open and save the form AB_WithThreeKeySequenceColumns_4 form under Visit(Screening)
	When I expand "Visit (Week 2)" to select and open "AB_WithThreeKeySequenceColumns_4" CRF.
	And I select "Checkout" button on "AB_WithThreeKeySequenceColumns_4" CRF.
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "AB_WithThreeKeySequenceColumns_4" CRF.
	Then The CRF with data is saved and checked-in successfully.

@ObjectiveEvidence
Scenario: 008_Perform major study update, in which key sequence question codelist is changed, renamed
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "AutobuildEnhancementStudies\CodelistChange\Test4500_GREAT_Update.zip" with Label "CodelistChange"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

@ObjectiveEvidence
Scenario: 009_Publish Study with patient migration
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
	| Subject                                                                                                                          |
	| Migration of Site 01 for Study file (Add) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: 010_Verify data in the form AB_WithOneKeySequenceColumn of patinet 001-Patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "001-Patient" patient.
	And I expand "Visit (Week 2)" to select and open "AB_WithOneKeySequenceColumn" CRF.
	Then I verify below "AutobuildFixed with key sequence 1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue    | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | BodyRegion     | Not Applicable | Text            |                |                  |
	| 1         | Subjects       |                | Radio           | Unsaved        |                  |
	| 1         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 1         | Text           |                | Textbox         | Unsaved        |                  |
	| 1         | Integer        |                | Textbox         | Unsaved        |                  |
	| 1         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 1         | Date           |                | Textbox         |                | OK               |
	| 2         | BodyRegion     | Red            | Text            |                |                  |
	| 2         | Subjects       |                | Radio           | Unsaved        |                  |
	| 2         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 2         | Text           |                | Textbox         | Unsaved        |                  |
	| 2         | Integer        |                | Textbox         | Unsaved        |                  |
	| 2         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 2         | Date           |                | Textbox         |                | OK               |
	| 3         | BodyRegion     | Blue           | Text            |                |                  |
	| 3         | Subjects       |                | Radio           | Unsaved        |                  |
	| 3         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 3         | Text           |                | Textbox         | Unsaved        |                  |
	| 3         | Integer        |                | Textbox         | Unsaved        |                  |
	| 3         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 3         | Date           |                | Textbox         |                | OK               |
	| 4         | BodyRegion     | Green          | Text            |                |                  |
	| 4         | Subjects       |                | Radio           | Unsaved        |                  |
	| 4         | Measurement    |                | Checkbox        | Unsaved        |                  |
	| 4         | Text           |                | Textbox         | Unsaved        |                  |
	| 4         | Integer        |                | Textbox         | Unsaved        |                  |
	| 4         | WT_Units       |                | Listbox         | Unsaved        |                  |
	| 4         | Date           |                | Textbox         |                | OK               |

@ObjectiveEvidence
Scenario: 011_Verify ItemHistory of a table question
	When I expand row "1" of table "AutobuildFixed with key sequence 1:"
	And I click "changeHistory.gif" icon of a question "BodyRegion" of table "AutobuildFixed with key sequence 1:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                                         |
	| System (System\System) | Hair     | Reason: Initial Entry\r\nNotes: Study Design Change |

@ObjectiveEvidence @ReqId:US53883, US55962
Scenario: 012_Verify table history for table AutobuildFixed with key sequence 1: of 001-Patient
    When I click cancel button in ChangeHistoryModal
	And I invoke table hisotry for table "AutobuildFixed with key sequence 1:"
    Then I see ordered table history for table "AutobuildFixed with key sequence 1:" in TableHistoryModalDialog
    | Name                                   | Action         | AdditionalNotes     |
    | System (System\System)                 | Row #4: Added  | Study design change |
    | System (System\System)                 | Row #3: Added  | Study design change |
    | System (System\System)                 | Row #2: Added  | Study design change |
    | System (System\System)                 | Row #1: Added  | Study design change |
    | System (System\System)                 | Row #7 Deleted | Study design change |
    | System (System\System)                 | Row #6 Deleted | Study design change |
    | System (System\System)                 | Row #5 Deleted | Study design change |
    | System (System\System)                 | Row #4 Deleted | Study design change |
    | System (System\System)                 | Row #3 Deleted | Study design change |
    | System (System\System)                 | Row #2 Deleted | Study design change |
    | System (System\System)                 | Row #1 Deleted | Study design change |
    | testadmin testadmin (EDCDEV\testadmin) | Row # 7: Added |                     |
    | testadmin testadmin (EDCDEV\testadmin) | Row # 6: Added |                     |
    | testadmin testadmin (EDCDEV\testadmin) | Row # 5: Added |                     |
    | testadmin testadmin (EDCDEV\testadmin) | Row # 4: Added |                     |
    | testadmin testadmin (EDCDEV\testadmin) | Row # 3: Added |                     |
    | testadmin testadmin (EDCDEV\testadmin) | Row # 2: Added |                     |
    | testadmin testadmin (EDCDEV\testadmin) | Row # 1: Added |                     |
	And I close TableHistoryModalDialog

Scenario: 013_Verify form status for the form AB_WithOneKeySequenceColumn of 001-Patient
	When I click breadcrumb "001-Patient"
	Then I see form details of event "Visit (Week 2)" in PatientCaseBookPage
	| CRF                         | FormStatus    |
	| AB_WithOneKeySequenceColumn | PartialSubmit |


Scenario: 014_Verify data in the form AB_WithTwoKeySequenceColumns of patinet 001-Patient
	When I expand "Visit (Week 2)" to select and open "AB_WithTwoKeySequenceColumns" CRF.
	Then I verify below "AutobuildFixed with key sequence 2_1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | QuestionStatus | RowButtonToClick |
	| 1         | Gender         | [Blank]     | Text            |                |                  |
	| 1         | DrugList       | Tylenol     | Text            |                |                  |




