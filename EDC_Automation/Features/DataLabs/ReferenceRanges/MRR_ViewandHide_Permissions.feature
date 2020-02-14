Feature: MRR_ViewandHide_Permissions

Test Summary:
	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Study2_DICT_20181016_T16550627.zip" with study label "MRR"
    Then I see study label "Study1" in header 		

Scenario: 04_Verification of reference ranges only when the group I belong to is not authorized to view reference ranges.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Hide" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Local Labs" tab from main menu.	
	Then I should see blank Manage Reference Ranges screen with message "You do not have required permissions to access this page."

#Scenario: 05_Verification of reference ranges only when the group I belong to is authorized to edit reference ranges.
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Group Management" In StudyAdministrationPage
#	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
#	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
#	And I expand PermissionsGroup "Lab Permissions"
#	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
#	And I click save button in edit permissions page
#	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
#	And I click contineu in reset session modal having partial message "continue your session"
#	And I navigate to "Labs" tab from main menu.
#	And I open lab with labid "L21" from ManageReferenceRanges page
#	And I open labtest with labname "MRRTEST1" from labtests page	

Scenario: 06_Verification of reference ranges only when the group I belong to is authorized to view reference ranges.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Local Labs" tab from main menu.
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	#And enter the below default lab data in ReferenceRangesPage
	#| StartDate  | EndDate | Gender   | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	#| 09/18/2016 |         | -Select- | =             |            | -Select-     | =           |          | -Select-   | =                    | 50                | =                     | 100                | =                      | 44                  | =                       | 200                  | 01   |
#   | 09/18/2020 | 09/18/2021 | Female        | >          | 20           | =           | <        | 30         | =                    | >                 | 20                    | <                  | 100                    | >                   | 50                      | <                    | 100   | 01 |
	And I click add and enter reference ranges of a lab test and Save and can see "Lab test reference range added successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#And I click on "Save" icon of the first record in ReferenceRangesPage	
	Then I shouldnot see the buttons Add and Delete in Mrr table of ManageReferenceRanges page
	Then I shouldnot see the "Edit" icon for Reference Range records in Mrr table of ManageReferenceRanges page
	And I shouldnot see the "Copy" icon for Reference Range records in Mrr table of ManageReferenceRanges page
	And I shouldnot see the "Delete" icon for Reference Range records in Mrr table of ManageReferenceRanges page
	And I should see the "History" icon in enabled state for Reference Range record in Mrr table of ManageReferenceRanges page

Scenario: 07_Verification of reference ranges only when the group I belong to is authorized to edit reference ranges.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Local Labs" tab from main menu.
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page			
	Then I should see the buttons Add new record and Delete in enabled state
	And I should see the "Edit" icon in enabled state for Reference Range record in Mrr table of ManageReferenceRanges page
	And I should see the "Copy" icon in enabled state for Reference Range record in Mrr table of ManageReferenceRanges page
	And I should see the "Delete" icon in enabled state for Reference Range record in Mrr table of ManageReferenceRanges page
	And I should see the "History" icon in enabled state for Reference Range record in Mrr table of ManageReferenceRanges page

