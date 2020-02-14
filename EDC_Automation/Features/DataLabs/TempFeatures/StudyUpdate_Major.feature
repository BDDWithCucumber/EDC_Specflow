
Feature: StudyUpdate_Major

#Scenario: 01_Login to Datalabs
#	Given I logged in to DataLabs
#	Then I see Datalabs Home Page

#Scenario: 02_Delete a study
#	When I delete study
#	Then I see study label "No Study Loaded" in header
#
#Scenario: 03_Publish a study
#	When I click breadcrumb "Study Management"
#	And I upload a study "TestStudy5100_Original.zip" with study label "Original"
#	Then I see study label "Test5100_Original" in header
#
#Scenario: 04_Navigate to StudyManagement page
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Study Management" In StudyAdministrationPage
#	Then I see BreadCrumb "Study Management"
#
#Scenario: 05_Upload and Stage a Study which has major study changes
#	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
#	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
#	And I click browse button in upload study file page
#	And I upload study "TestStudy5100_MajorUpdate.zip" with Label "Major"
#	And I open study which has "Uploaded" status
#	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
#	And I open study which has "Staged" status
#	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
#Scenario: 06_Publish Study which is in Staged status
#	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
#	Then I see PublishStudyFlagsPage
#
#Scenario: 07_Enable or Disable of reevaluation of Falgs and Signatures
#	When I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
#	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
#	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
#	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
#	And I clicked Continue button in PublishStudyFlagsPage
#	Then I see PublishStudyPage
#
#Scenario: 08_Enable or Disable PatientMigration at StudyPublish
#	#Given I select "{MenuTab}" tab from the main menu of DataLabs.
#	When I select patient migration option "Do not migrate" in PublishStudyPage
#	And I click Publish button in PublishStudyPage
#	#And I select "Inbox" tab from the main menu of DataLabs.

#####################################################################################################################################
#####################################################################################################################################
#####################################################################################################################################


#Scenario: MigragePatients
#	When I click ActionPalette Item "Migrate Patients" in "SiteListActions" ActionPalette
#	And I select patients in MigratePatientsPage
#	| Patient  |
#	| Patient1 |
#	| Patient2 |
#	And I click save button in MigratePatientsPage
#	And I navigate to "Inbox" tab from main menu.
#	Then I check subjects in inbox folder "Jobs"
#	| Subject                                                         |
#	| patients migrated successfully. To review see migration report. |

#Scenario: Reset CRF
#	When I click ActionPalette Item "Reset CRF" in "CRFAction" ActionPalette
#	And I click Yes button in ResetCRFModalDialog
#	And I enter reason "CRF is reset" in ResetCRFModalDialog
#	And I click Continue button in ResetCRFModalDialog
#	And I navigate to "Inbox" tab from main menu.
#	Then I check subjects in inbox folder "Jobs"
#	| Subject                  |
#	| CRF Reset - Visit (Screening)/Form1 for patient test-Patient - COMPLETE. View Summary. |

#Scenario: Clear Flat question
#	When I click ClearItem for the flat question "daf"
#	And I enter notes "asdf" in ClearItemModalDialog
#	And I click ok button in ClearItemModalDialog

#Scenario: Click icon of table question
#	When I expnad row "1" of table "Sample Table:"
#	And I click "icon_mna_disabled.png" icon of a question "Drug Name:" of table "Sample Table:"
#    And I enter comments "Commetns for MarkItemNotAnswered" in MarkItemDialog
#	And I click ok button in MarkItemDialog
#	Then I see icon "icon_mna.png" of a question "Sample text question:" of table "Sample Table:"

#Scenario: Clear table question 
#	When I expand row "3" of table "Sample Table:"
#	And I clear question "Condition:" of table "Sample Table:"
#	And I enter notes "Condition question is cleared" in ClearItemModalDialog
#	And I click ok button in ClearItemModalDialog

#Scenario: Verify ItemHistory of a table question
#	When I expnad row "2" of table "Sample Table:"
#	And I click "changeHistory.gif" icon of a question "Condition:" of table "Sample Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime | Response | ReasonNotes                               |
#	|          | asdf     | Reason: DCF                               |
#	|          | ddd      | Reason: Initial Entry\r\nNotes: Submitted |
#	And I click cancel button in ChangeHistoryModal

#Scenario: Add comment to table question 
#	When I expnad row "3" of table "Sample Table:"
#	And I click AddComment for question "Condition:" of table "Sample Table:"
#	And I enter comment "Comment added" in AddCommentModalDialog
#	And I click save button in AddCommentModalDialog
#	And I open main tab "Comments" of Form
#	Then I see comments in comments tab
#	| QuestionNumberOrForm | Question   | Value   | Comment                          | DateTime |
#	| 7.2.1                | Condition: | dddd    | testing provisional comment      |          |
#	| 7.1.1                | Drug Name: | [Blank] | Comments for MarkItemNotAsnwered |          |

#Scenario: Enable complete or basic change history in UserPreferences
#	When I select DataManagerPortal item "User Preferences" from drop down
#	And I enable CompleteChangeHistory in UserPreferencesPage
#	And I enable BasicChangeHisotry in UserPreferencesPage 
#	And I click save button in UserPreferencesPage

#Scenario: Delete table row
#	When I expand row "3" of table "Sample Table:"
#	And I click table row button "Delete Row" of table "Sample Table:"
#	And I select reason for change "DCF" in DeleteTableRowModalDialog
#	And I enter additional notes "asdfasdf" in DeleteTableRowModalDialog
#	And I click continue button in DeleteTableRowModalDialog 
#	Then I see deleted row "3" of table "Sample Table:"

#Scenario: Restore table row
#	When I expand row "3" of table "Sample Table:"
#	And I click table row button "Restore Row" of table "Sample Table:"
#	And I select reason for change "DCF" in RestoreTableRowModalDialog
#	And I enter additional notes "asdfasdf" in RestoreTableRowModalDialog
#	And I click continue button in RestoreTableRowModalDialog 
#	Then I see restored row "3" of table "Sample Table:"

#Scenario: Verify lab data in dialog
#	When I select sub tab "Labs" in site page
#	And I click labid "L1" in Labs subtab of SitePage
#	Then I see lab data in LabInformationModalDialog
#	| LabId | LaboratoryName | Company | Department | Address1 | Address2 | Address3 | City | State     | Zip    | ISOCountry | Country | Phone      | Fax        | LaboratoryStatus | ContactPerson |
#	| L1    | Lab1           | ABCD    | R&D        | A1       | A2       | A3       |      | Telangana | 500084 | INDIA(IND) | INDIA   | 9700994500 | 9700994500 | Active           | HHHHH         |
#	And I click close button in LabInformationModalDialog 


Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page


Scenario: 02_ScrolUP and scrollDown
	When I scroll up the active page
	And I scroll donw the active page

#Scenario: Verify lab data in dialog
#	When I select sub tab "Labs" in site page
#	And I click labid "L1" in Labs subtab of SitePage
#	Then I see lab data in LabInformationModalDialog
#	| LabId | LaboratoryName | Company | Department | Address1 | Address2 | Address3 | City | State     | Zip    | ISOCountry | Country | Phone      | Fax        | LaboratoryStatus | ContactPerson |
#	| L1    | Lab1           | ABCD    | R&D        | A1       | A2       | A3       |      | Telangana | 500084 | INDIA(IND) | INDIA   | 9700994500 | 9700994500 | Active           | HHHHH         |
#	And I click close button in LabInformationModalDialog 
#
#
#
################################## Table History #####################################
#
#Scenario: Verify table history
#	When I invoke table hisotry for table "Table name"
#	Then I see table history for table "Table Name" in TableHistoryModalDialog
#	| Name                   | ServerTime       | Action          | Reason | AdditionalNotes |
#	| System (System\System) | 04/16/2019 05:27 | Row # 12: Added |        |                 |
#	And I close TableHistoryModalDialog
#
#
#Scenario: Table history unavailabitly check
#	Then I dont see table history icon for table "TableName"

