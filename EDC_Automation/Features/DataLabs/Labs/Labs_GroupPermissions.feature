Feature: Labs_GroupPermissions
@updated as per US52149
Scenario: 00_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
@ObjectiveEvidence @ReqId:US36590.1
Scenario: 01_Navigate to StudyAdministrationPage And GroupManagementPage
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Site Permissions"
	Then I see expanded PermissionsGroup "Site Permissions"
	And I validate GroupPermissionsData for the premissons group "Site Permissions"
	| PermissionName           | Allow | Deny  | Hide  | View  | Edit |
	| Associate Lab(s) to Site | NA    | NA    | False | False | True |

@ObjectiveEvidence	@ReqId:US36590.1,US36590.2,US36590.3,US36590.4,US36590.5,US36590.6
Scenario: 02_Check Default values for Lab Permissions
	When I expand PermissionsGroup "Lab Permissions"
	Then I see expanded PermissionsGroup "Lab Permissions"
	And I validate GroupPermissionsData for the premissons group "Lab Permissions"
	| PermissionName            | Allow | Deny  | Hide  | View  | Edit |
	| Lab Management            | NA    | NA    | False | False | True |
	| Manage Laboratories       | NA    | NA    | False | False | True |
	| Add Lab                   | True  | False | NA    | NA    | NA   |
	| Associate Site(s) to Lab  | NA    | NA    | False | False | True |
	| Normalize Lab Data        | NA    | NA    | False | False | True |	
	| Manage Reference Ranges   | NA    | NA    | False | False | True |
	
	
Scenario: 03_Add DataManagers group
	When I click breadcrumb "Group Management"
	And I click ActionPalette Item "Add Group(s)" in "GroupListActions" ActionPalette
	Then I add GroupName "Data Managers" with DefaultPortal "Data Manager Portal"
	
Scenario: 04_Navigate to Edit Permisssions page of Data Managers Group
	When I click GroupName "Data Managers" in GroupManagement Page
	And I select status "Active" for the permission group and Save
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Site Permissions"
	Then I see expanded PermissionsGroup "Site Permissions"
	And I validate GroupPermissionsData for the premissons group "Site Permissions"
	| PermissionName           | Allow | Deny | Hide | View  | Edit  |
	| Associate Lab(s) to Site | NA    | NA   | True | False | False |

Scenario: 05_Check Default values for Lab Permissions for DataManagers Group
	When I expand PermissionsGroup "Lab Permissions"
	Then I see expanded PermissionsGroup "Lab Permissions"
	And I validate GroupPermissionsData for the premissons group "Lab Permissions"
	| PermissionName            | Allow | Deny  | Hide  | View  | Edit |
	| Lab Management            | NA    | NA    | True  | False | False|
	| Manage Laboratories       | NA    | NA    | True  | False | False|
	| Add Lab                   | False | True  | NA    | NA    | NA   |
	| Associate Site(s) to Lab  | NA    | NA    | True  | False | False|
	| Normalize Lab Data        | NA    | NA    | True  | False | False|	
	| Manage Reference Ranges   | NA    | NA    | True  | False | False|
	
Scenario: 06_SyncUsers and wait till job finished
	When I click breadcrumb "Group Management"
	And I click ActionPalette Item "Synchronize Users" in "GroupListActions" ActionPalette
	And I click continue in modal dialog having title "Synchronize Users" and partial message "Synchronizing users"
	And I click main tab "Inbox"
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                    |
	| Synchronize Users with Reporting - complete. View Summary  |

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 07_Set View permission to Associate Lab(s) to Site in SitePermissions
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Site Permissions"
	And I set value in category "Site Permissions" for permission "Associate Lab(s) to Site" for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	Then I see Associate Labs Page in View mode
	
@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 08_Set Hide permission to Associate Lab(s) to Site in SitePermissions
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Site Permissions"
	And I set value in category "Site Permissions" for permission "Associate Lab(s) to Site" for permission type "Hide" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	Then I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 09_Set Deny permission to AddLab in LabPermissions
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Add Lab" for permission type "Deny" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	Then I do not see ActionPalette Item "Add Lab" in "LabMgmt_Actions" ActionPalette
	
@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 10_Set View permission to Associate Site(s) to Lab in LabPermissions
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Associate Site(s) to Lab" for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L01" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	Then I see Associate Sites Page in View mode

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 11_Set Hide permission to Associate Site(s) to Lab in LabPermissions
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Associate Site(s) to Lab" for permission type "Hide" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L01" from LabManagement page
	Then I do not see ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette

@ObjectiveEvidence	@ReqId:US36590.2 
Scenario: 12_Set View permission to Lab Management in LabPermissions
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Lab Management" for permission type "View" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L01" from LabManagement page
	Then I see Lab page in view mode

@ObjectiveEvidence @ReqId:US36590.2
Scenario: 13_Set Hide permission to Lab Management in LabPermissions
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Lab Management" for permission type "Hide" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click contineu in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	Then I do not see link "Lab Management" In StudyAdministrationPage

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 14_SetDefault values for Site And Lab Permissions for Admin Group permissions
	When I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Site Permissions"
	And I set value in category "Site Permissions" for permission "Associate Lab(s) to Site" for permission type "Edit" in EditPermissions page
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Lab Management" for permission type "Edit" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "Edit" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Add Lab" for permission type "Allow" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Associate Site(s) to Lab" for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	Then I click continue in reset session modal having partial message "continue your session"

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 15_Set Data Manager permission to Allow for Data Managers group
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "Data Managers" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Site Permissions"
	And I set value in category "Site Permissions" for permission "Site Management" for permission type "Edit" in EditPermissions page
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Lab Management" for permission type "View" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "View" in EditPermissions page
	And I expand PermissionsGroup "Portal Permissions"
	And I set value in category "Portal Permissions" for permission "Data Manager" for permission type "Allow" in EditPermissions page
	Then I click save button in edit permissions page

Scenario: 16_Set Study Status to Production in Study Management page
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I change study status "Production" in Study Management page And Save
	And I clik logout of Datalabs
	Then I see login page

Scenario: 17_Login to Datalabs as DataManager user
	Given I logged in to DataLabs as DataManager user In ExistingPage
	Then I see Datalabs Home Page

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 18_Check for Add Lab link availability
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	Then I do not see ActionPalette Item "Add Lab" in "LabMgmt_Actions" ActionPalette

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 19_Check for Associate Site(s) link availability
	When I open lab with labid "L01" from LabManagement page
	Then I do not see ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I see Lab page in view mode

Scenario: 20_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page

Scenario: 21_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 22_Set LabManagement to Edit, Add Lab to Allow and Associate Site(s) to Lab to View in GroupPermissions for Data Manager 
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "Data Managers" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Lab Management" for permission type "Edit" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "Edit" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Add Lab" for permission type "Allow" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Associate Site(s) to Lab" for permission type "View" in EditPermissions page
	Then I click save button in edit permissions page
	
Scenario: 23_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page

Scenario: 24_Login to Datalabs as DataManager user
	Given I logged in to DataLabs as DataManager user In ExistingPage
	Then I see Datalabs Home Page

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 25_Check for Add Lab link availability
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	Then I see ActionPalette Item "Add Lab" in "LabMgmt_Actions" ActionPalette

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 26_Check for Associate Site(s) link availability and editable Lab Page
	When I open lab with labid "L01" from LabManagement page
	Then I see ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I see Lab page in Edit mode

@ObjectiveEvidence	@ReqId:US36590.2
Scenario: 27_Check for View mode for Associates Labs page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	Then I see Associate Sites Page in View mode

Scenario: 28_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page

Scenario: 29_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

@ObjectiveEvidence @ReqId:US36590.2
Scenario: 30_Set LabManagement to Edit, Add Lab to Allow and Associate Site(s) to Lab to View in GroupPermissions for Data Manager 
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "Data Managers" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Lab Management" for permission type "Edit" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "Edit" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Add Lab" for permission type "Allow" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Associate Site(s) to Lab" for permission type "Edit" in EditPermissions page
	Then I click save button in edit permissions page

Scenario: 31_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page

Scenario: 32_Login to Datalabs as DataManager user
	Given I logged in to DataLabs as DataManager user In ExistingPage
	Then I see Datalabs Home Page

@ObjectiveEvidence @ReqId:US36590.2
Scenario: 33_Check for edit mode of page Associate Site(s) to Lab
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L01" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	Then I see Associate Sites Page in Edit mode

Scenario: 34_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page

Scenario: 35_Login to Datalabs
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

@ObjectiveEvidence @ReqId:US36590.2
Scenario: 36_Set LabManagement in LabPermissions and Associate Lab(s) in Site Permission to Hide for DataManagers group 
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "Data Managers" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Lab Management" for permission type "Hide" in EditPermissions page
	And I expand PermissionsGroup "Site Permissions"
	And I set value in category "Site Permissions" for permission "Associate Lab(s) to Site" for permission type "Hide" in EditPermissions page
	Then I click save button in edit permissions page

Scenario: 37_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page

Scenario: 38_Login to Datalabs as DataManager user
	Given I logged in to DataLabs as DataManager user In ExistingPage
	Then I see Datalabs Home Page
	
@ObjectiveEvidence @ReqId:US36590.2
Scenario: 39_Check for LabManagement module availability in StudayAdministration Page
	When I select DataManagerPortal item "Study Administration" from drop down
	Then I do not see link "Lab Management" In StudyAdministrationPage

@ObjectiveEvidence @ReqId:US36590.2
Scenario: 40_Check for availability of Assocaite Lab(s) to Site link in SitePage
	#When I click breadcrumb "Study Administration"
	When I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	Then I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 41_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page



########### DONE #############
# 3US36590 - DL: Permissions for Labs - Pragathi, Malli




