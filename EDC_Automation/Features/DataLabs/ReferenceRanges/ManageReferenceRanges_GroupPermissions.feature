Feature: (2018.Aug) DL: Manage Reference Ranges

Scenario: 00_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study.
	When I click breadcrumb "Study Management"
	And I upload a study "Test3210_Labs_Dict.zip" with study label ""
	Then I see study label "MRR_Permissions" in header.

@ObjectiveEvidence @ReqId: US39857.1
Scenario: 01_Verification of modifying  the reference ranges only when the group I belong to is authorized to modify reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from Mrr page
	And I open Lab Test named "Hemoglobin (HB)" from Mrr page	
	Then I should see Edit Icon, Copy Icon, Add button, Delete Icon, Delete button aganist each Reference Range record

@ObjectiveEvidence @ReqId: US39857.1
Scenario: 01_Verification of adding the reference range record when the group I belong to is authorized to add the reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from Mrr page
	And I open Lab Test named "Hemoglobin (HB)" from Mrr page
	And I click on Add button
	And I enter the below mentioned data
	| Start Date | EndDate   | Gender | FromAge | FromAgeDropdown | ToAge | ToAgeDropdown | NormalRangeLow | NormalRangeHigh | CriticalRangeLow | CriticalRangeHigh | Unit |
	| 10/08/2018 | 10/08/2018| Female | 39      | Years           | 47    | Years         | 36             | 57              | 90               | 110               | mg   |
	And I click on Save button

@ObjectiveEvidence @ReqId: US39857.1
Scenario: 01_Verification of Edit for the reference range record when the group I belong to is authorized to modify the reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from Mrr page
	And I open Lab Test named "Hemoglobin (HB)" from Mrr page
	And I click on the Edit Icon aganist the reference Range Record
	And I changed the values for start Date and End Date
	And I click on Save button

@ObjectiveEvidence @ReqId: US39857.1
Scenario: 01_Verification of copy for the reference range record when the group I belong to is authorized to modify the reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from Mrr page
	And I open Lab Test named "Hemoglobin (HB)" from Mrr page
	And I click on the copy Icon aganist the reference Range Record
	And I should see the ?????????????????? we will get the Duplicate record already exists immediately we click on copy Icon evertime
	And I click on Save button

@ObjectiveEvidence @ReqId: US39857.1
Scenario: 01_Verification of History for the reference range record when the group I belong to is authorized to modify the reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	And I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from Mrr page
	And I open Lab Test named "Hemoglobin (HB)" from Mrr page
	And I click on the History Icon aganist the reference Range Record
	Then  I should see the Change History window
	
@ObjectiveEvidence @ReqId: US39857.1
Scenario: 01_Verification of multiple Delete for the reference range records when the group I belong to is authorized to delete the reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	And I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from Mrr page
	And I open Lab Test named "Hemoglobin (HB)" from Mrr page
	And I select multiple records
	And I click on Delete button
	Then I should see a strikethrough on the deleted records

Scenario: 01_Verification of single Delete for the reference range record when the group I belong to is authorized to delete the reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	And I search for the LabID "LB101A"
	And I click on the Link "LB101A" in Manage Reference Ranges
	And I search for the Test "Hemoglobin (HB)"
	And I click on the Link "Hemoglobin (HB)"
	And I select a Manage Reference Record
	And I click on Delete button
	And I click on Yes in the confirmation popup
	Then I should see a strikethrough on the deleted record of row "1"

@ObjectiveEvidence @ReqId: US39857.5
Scenario: 05_Verification of reference ranges only when the group I belong to is authorized to view reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I search for the LabID "LB101A"
	And I click on the Link "LB101A" in Manage Reference Ranges
	And I search for the Test "Hemoglobin (HB)"
	And I click on the Link "Hemoglobin (HB)"
	And I should see only History Icon
	And I click on History Icon
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Reference Range | Reason
	And I click on "Cancel" button on "Demographics" .|


@ObjectiveEvidence @ReqId: US39857.5
Scenario: 06_Verification of reference ranges only when the group I belong to is authorized to view reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	And I search for the LabID "LB101A"
	And I click on the Link "LB101A" in Manage Reference Ranges
	And I search for the Test "Hemoglobin (HB)"
	And I click on the Link "Hemoglobin (HB)"
	Then I should not see Add, Edit, Delete, Copy button/Icons

@ObjectiveEvidence @ReqId: US39857.5
Scenario: 07_Verification of reference ranges only when the group I belong to is not authorized to view reference ranges.
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Hide" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I navigate to "Labs" tab from main menu.
	Then I should see blank Manage Reference Ranges screen with message "message"
