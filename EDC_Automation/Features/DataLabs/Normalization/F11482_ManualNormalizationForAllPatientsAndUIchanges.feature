Feature: F11482 Manual Normalization for all patients & UI changes


Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

 @US52149.3:
  Scenario: 02_When no patients are available, then proper message should be displayed on Run Normalization Page.
  When I delete study
  And I click breadcrumb "Study Administration"
  And I click Link "Study Management" In StudyAdministrationPage
  And I upload a study "StudyPublish.zip" with study label "Study2"
  And I select DataManagerPortal item "Study Administration" from drop down
  And I click Link "Lab Management" In StudyAdministrationPage
  And I click Link "Normalize Lab Data" In StudyAdministrationPage
  Then I should see message "You cannot run normalization as the study doesn't have any lab forms." on Run Normalization Page.

Scenario: 03_Site setup
    When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	Then I add and save user "testadmin testadmin" to site users in SiteManageUsersPage

Scenario:  04_Lab Setup
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In Lab Management Page
	Then I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	

Scenario: 05:Patient setup and filling lab forms
	When I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 117      |        Pat      | 01/01/2020 |
	And I select the patient "117-Pat" from patients table.
	And I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | What is your age    | 28          | TextBox         |
	  | Age Unit            | Year		  | ListBox         |
	  | What is your gender | Male        | ListBox         |
     And I click on "Save & Close" button on "Demographics" CRF.
	 And I expand "Visit (week2)" to select and open "FormD1" CRF.
     And I click "Checkout" button on "FormD1" CRF. 
     And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | CRF Collection Date Q1 For D1 | 06/10/2019  | TextBox         |      
    Then I click on "Save & Close" button on "FormD1" CRF.
	 
@US70485.1 @US52149.3
Scenario: 06_When we navigate to Edit Permissions page Then we can see Manage Laboratories and Normalize Lab Data under Lab Permissions, also the permissions are in proper order under Lab Permissions.
    When I select DataManagerPortal item "Study Administration" from drop down
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	 Then I validate GroupPermissionsData for the premissons group "Lab Permissions" are in below order
	| PermissionName           |
	| Lab Management           |
	| Manage Laboratories      |
	| Add Lab                  |
	| Associate Site(s) to Lab |
	| Normalize Lab Data       |
	| Manage Reference Ranges  |

@US52149.3
Scenario: 07_When I check Hide in Lab Management in Lab Permissions, Allow button for Add Lab, and View and Edit buttons for Manage Laboratories, Associate Site(s) to Lab, Normalize Lab Data, in Lab Permissions except Manage Reference Ranges and Lab Management shall be disabled.
	When I set value in category "Lab Permissions" for permission "Lab Management" for permission type "Hide" in EditPermissions page
	Then I validate GroupPermissionsData for the premissons group "Lab Permissions" for Enabled and Disabled.
	| PermissionName            | Allow    | Deny     | Hide     | View     | Edit     |
	| Lab Management            | NA       | NA       | Enabled  | Enabled  | Enabled  |
	| Manage Laboratories       | NA       | NA       | Enabled  | Disabled | Disabled |
	| Add Lab                   | Disabled | Enabled  | NA       | NA       | NA       |
	| Associate Site(s) to Lab	| NA       | NA       | Enabled  | Disabled | Disabled |
	| Normalize Lab Data        | NA       | NA       | Enabled  | Disabled | Disabled |
	| Manage Reference Ranges	| NA       | NA       | Enabled  | Enabled  | Enabled  |

@US52149.3
Scenario: 08_When I check Hide in Lab Management in Lab Permissions, Add Lab should be selected as Deny and Manage Laboratories, Associate Site(s) to Lab, Normalize Lab Data should be selected as Hide by default.
     Given Value in category "Lab Permissions" for permission Lab Management is selected as Hide in EditPermissions page
		| PermissionName            | Allow | Deny  | Hide | View  | Edit  |
		| Lab Management            | NA    | NA    | True | False | False |
     Then I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName			| Allow | Deny  | Hide | View  | Edit  |
		| Manage Laboratories       | NA    | NA    | True | False | False |
		| Add Lab                   | False | True  | NA   | NA	   | NA    |
		| Associate Site(s) to Lab  | NA    | NA    | True | False | False |
		| Normalize Lab Data        | NA    | NA    | True | False | False |
		 
@US52149.3: 
Scenario: :09_When Lab Management is Selected as View, then all the radio buttons in Lab Permissions shall be enabled (Including Edit).
	When I set value in category "Lab Permissions" for permission "Lab Management" for permission type "View" in EditPermissions page
	Then I validate GroupPermissionsData for the premissons group "Lab Permissions" for Enabled and Disabled.
	| PermissionName            | Allow    | Deny     | Hide     | View     | Edit     |
	| Lab Management            | NA       | NA       | Enabled  | Enabled  | Enabled  |
	| Manage Laboratories       | NA       | NA       | Enabled  | Enabled  | Enabled  |
	| Add Lab                   | Disabled | Enabled  | NA       | NA       | NA       |
	| Associate Site(s) to Lab	| NA       | NA       | Enabled  | Disabled | Disabled |
	| Normalize Lab Data        | NA       | NA       | Enabled  | Enabled  | Enabled  |
	| Manage Reference Ranges	| NA       | NA       | Enabled  | Enabled  | Enabled  |

@US52149.3: 
Scenario: 10_When Lab Management is Selected as Edit, then all the radio buttons in Lab Permissions shall be enabled.
    When I set value in category "Lab Permissions" for permission "Lab Management" for permission type "Edit" in EditPermissions page
	Then I validate GroupPermissionsData for the premissons group "Lab Permissions" for Enabled and Disabled.
	| PermissionName            | Allow    | Deny     | Hide     | View     | Edit     |
	| Lab Management            | NA       | NA       | Enabled  | Enabled  | Enabled  |
	| Manage Laboratories       | NA       | NA       | Enabled  | Enabled  | Enabled  |
	| Add Lab                   | Disabled | Enabled  | NA       | NA       | NA       |
	| Associate Site(s) to Lab	| NA       | NA       | Enabled  | Disabled | Disabled |
	| Normalize Lab Data        | NA       | NA       | Enabled  | Enabled  | Enabled  |
	| Manage Reference Ranges	| NA       | NA       | Enabled  | Enabled  | Enabled  |

@US52149.3: 
Scenario: 11_When Manage Laboratories is Selected as Hide, then all the radio buttons in Add Lab and Associate Site(s) to Lab Except Hide/Deny shall be disabled.
    Given Value in category "Lab Permissions" for permission Lab Management is selected as Hide in EditPermissions page
		| PermissionName            | Allow | Deny  | Hide | View  | Edit  |
		| Manage Laboratories       | NA    | NA    | True | False | False |
	Then I validate GroupPermissionsData for the premissons group "Lab Permissions" for Enabled and Disabled.
	| PermissionName            | Allow    | Deny     | Hide     | View     | Edit     |
	| Add Lab                   | Disabled | Enabled  | NA       | NA       | NA       |
	| Associate Site(s) to Lab	| NA       | NA       | Enabled  | Disabled | Disabled |

@US52149.3: 	
Scenario: 12_When I check Hide for Manage Laboratories in Lab Permissions, then Add Lab should be selected as Deny and Associate Site(s) to Lab should be selected as Hide by default.
     Given Value in category "Lab Permissions" for permission Lab Management is selected as Hide in EditPermissions page
		| PermissionName            | Allow | Deny  | Hide | View  | Edit  |
		| Manage Laboratories       | NA    | NA    | True | False | False |
     Then I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName			| Allow | Deny  | Hide | View  | Edit  |
		| Add Lab                   | False | True  | NA   | NA	   | NA    |
		| Associate Site(s) to Lab  | NA    | NA    | True | False | False |

@US52149.3: 
Scenario: 13_When I check View in Manage Laboratories, then all the radio buttons in Add Lab and Associate Site(s) to Lab shall be enabled in Lab Permissions.
    When I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "View" in EditPermissions page
    Then I validate GroupPermissionsData for the premissons group "Lab Permissions" for Enabled and Disabled.
	| PermissionName            | Allow    | Deny     | Hide     | View     | Edit     |
	| Add Lab                   | Enabled  | Enabled  | NA       | NA       | NA       |
	| Associate Site(s) to Lab	| NA       | NA       | Enabled  | Enabled  | Enabled  |


@US52149.3: 
Scenario: 14_When I check Edit in Manage Laboratories, then all the radio buttons in Add Lab and Associate Site(s) to Lab shall be enabled in Lab Permissions.
	When I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "Edit" in EditPermissions page
	Then I validate GroupPermissionsData for the premissons group "Lab Permissions" for Enabled and Disabled.
	| PermissionName            | Allow    | Deny     | Hide     | View     | Edit     |
	| Add Lab                   | Enabled  | Enabled  | NA       | NA       | NA       |
	| Associate Site(s) to Lab	| NA       | NA       | Enabled  | Enabled  | Enabled  |	

@US52149.3: 
Scenario: 15_When Hide for Manage Laboratories is selected in Lab Permissions, then Manage Laboratories link shall be hidden in Lab Management page
	When I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "Hide" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	Then I do not see link "Manage Laboratories" In Lab Management Page

@US52149.3: 
Scenario: 16_When Hide for Normalize Lab Data  is selected in Lab Permissions, then Normalize Lab Data link shall be hidden in Lab Management page
	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName			| Allow | Deny  | Hide | View  | Edit  |
		| Normalize Lab Data	    | NA    | NA    | True | False | False |
	And I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	Then I do not see link "Normalize Lab Data" In Lab Management Page

@US52149.3: 
Scenario: 17_When Hide for Manage Laboratories and Normalize Lab Data  is selected in Lab Permissions, then we should get message on Lab Management page
	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName      | Allow | Deny | Hide | View  | Edit  |
		| Normalize Lab Data  | NA    | NA   | True | False | False |
		| Manage Laboratories | NA    | NA   | True | False | False |
	And I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	Then I should see message "You are not authorized to access the page based on security rights." on Lab Management Page in Red color with text aligned in center.

@US52149.3:
Scenario: 18_When Hide for Run Normalization is selected in Lab Permissions, then Run Normalization link should be hidden in Lab Management page.
	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "Edit" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Normalize Lab Data" for permission type "Hide" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	Then I do not see link "Normalize Lab Data" In Lab Management Page

@US52149.3
Scenario: 19_When Manage Laboratories is selected as view, then Manage Laboratories Link should be clickalbe in Lab Management page.
    When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	Then I click Link "Manage Laboratories" In StudyAdministrationPage
	
Scenario:  20_When Manage Laboratories is selected as view, then Laboratories in Labs Grid in Manage Laboratories Page should be in view mode.
    When I open lab with labid "L01" from LabManagement page
	Then I should see Lab page in view mode
	Then I press LabCreation cancel button

Scenario: 21_When Manage Laboratories is selected as view and Add Lab is selected as Deny, then Add Lab(s) Link should not be visible on Manage Laboratories Page
  	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName      | Allow | Deny | Hide  | View | Edit  |
		| Manage Laboratories | NA    | NA   | False | True | False |
		| Add Lab             | False | True | NA    | NA   | NA    |
	And I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In StudyAdministrationPage
	Then I do not see link "Add Lab" In Manage Laboratories Page

@US52149.3
Scenario: 22_When Manage Laboratories is selected as view and  Associate Site(s) to Lab is selected as Hide, then  Associate Site(s) to Lab Link should not be visible on Labs Page
 	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName           | Allow | Deny | Hide  | View | Edit  |
		| Manage Laboratories      | NA    | NA   | False | True | False |
		| Associate Site(s) to Lab | NA    | NA   | True  | False| False |
	And I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
	Then I do not see link "Associate Site(s) to Lab" In Lab Page

@US52149.3
Scenario: 23_When When Manage Laboratories is selected as view and Add Lab is selected as Allow, then Add Lab(s) Link should be in view mode on Manage Laboratories Page
    When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName      | Allow | Deny | Hide  | View | Edit  |
		| Manage Laboratories | NA    | NA   | False | True | False |
	And I set value in category "Lab Permissions" for permission "Add Lab" for permission type "Allow" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In Lab Management Page
	And I click Link "Add Lab" In Manage Laboratories Page
	Then I see Add Lab page in view mode
	Then I press LabCreation cancel button

Scenario: 24_When Manage Laboratories is selected as view, Add Lab is selected as Allow and  Associate Site(s) to Lab is selected as Hide, then  Associate Site(s) to Lab Link should not be visible on Add Labs Page
    When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName           | Allow | Deny  | Hide  | View | Edit  |
		| Manage Laboratories      | NA    | NA    | False | True | False |
		| Add Lab                  | True  | False | NA    | NA   | NA    |
		| Associate Site(s) to Lab | NA    | NA    | True  | False| False |
	And I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In Lab Management Page
	And I click Link "Add Lab" In Manage Laboratories Page
	Then I do not see link "Associate Site(s) to Lab" In Add Lab Page

Scenario: 25_When Manage Laboratories is selected as view and  Associate Site(s) to Lab is selected as View, then  Associate Site(s) to Lab page should be in view mode on Labs Page
   	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName      | Allow | Deny | Hide  | View | Edit  |
		| Manage Laboratories | NA    | NA   | False | True | False |
		| Add Lab             | True  | False| NA    | NA   | NA    |
	And I set value in category "Lab Permissions" for permission "Associate Site(s) to Lab" for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In Lab Management Page
	And I click Link "L01" In Lab Management Page
	And I click Link "Associate Site(s)" In Manage Laboratories Page
	Then I see Associate Sites Page in View mode


Scenario: 26_When Manage Laboratories is selected as view and  Associate Site(s) to Lab is selected as Edit, then  Associate Site(s) to Lab page should be in Edit mode on Labs Page
 	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
    And I validate GroupPermissionsData for the premissons group "Lab Permissions"
		| PermissionName      | Allow | Deny | Hide  | View | Edit  |
		| Manage Laboratories | NA    | NA   | False | True | False |
	And I set value in category "Lab Permissions" for permission "Associate Site(s) to Lab" for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L01" from LabManagement page
	And I click Link "Associate Site(s)" In Manage Laboratories Page
	Then I see Associate Sites Page in Edit mode

Scenario: 27_When When Manage Laboratories is selected as Edit and Add Lab is selected as Allow, then Add Lab(s) Link should be in Edit mode on Manage Laboratories Page
	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Manage Laboratories" for permission type "Edit" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Add Lab" for permission type "Allow" in EditPermissions page
	And I set value in category "Lab Permissions" for permission "Associate Site(s) to Lab" for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Manage Laboratories" In Lab Management Page
	And I click Link "Add Lab" In Manage Laboratories Page
	Then I see Add Lab page in Edit mode


Scenario:  28_When Manage Laboratories is selected as Edit, then Laboratories in Labs Grid in Manage Laboratories Page should be in edit mode.
    When  I click breadcrumb "Manage Laboratories"
	And  I click Link "L01" In Lab Management Page
	Then I should see Lab page in edit mode
	
Scenario: 29_When Normalize Lab Data is Selected as Edit, then Normalize Lab Data Page should be in Edit Mode
  	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Normalize Lab Data" for permission type "Edit" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Normalize Lab Data" In Lab Management Page
	Then I see Normalize Lab Data Page in Edit mode

Scenario: 30_When Normalize Lab Data is Selected as View, then Normalize Lab Data Page should be in View Mode
  	When I click breadcrumb "Study Administration"
	And the user select Group Management link on Study Administration page.
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	And I set value in category "Lab Permissions" for permission "Normalize Lab Data" for permission type "View" in EditPermissions page
	And I click save button in edit permissions page
	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
	And I click continue in reset session modal having partial message "continue your session"
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And  I click Link "Normalize Lab Data" In Lab Management Page
	Then I see Normalize Lab Data Page in View mode

@US52149.3:
Scenario: 31_When there no Study is published, then proper message should be displayed on Run Normalization Page.
  When I click breadcrumb "Study Administration"
  And I delete study
  And I click breadcrumb "Study Administration"
  And I click Link "Lab Management" In StudyAdministrationPage
  And I click Link "Normalize Lab Data" In StudyAdministrationPage
  Then I should see message "You cannot run normalization as there is no study published." on Run Normalization Page.

@US52149.3: 
Scenario: 32_When Study is published with Local Labs as Not Enabled, then proper message should be displayed on Run Normalization Page.
  When I click breadcrumb "Study Administration"
  And I click Link "Study Management" In StudyAdministrationPage
  And I upload a study "Not_Enbled.zip" with study label "Stud4"
  And I select DataManagerPortal item "Study Administration" from drop down
  And I click Link "Lab Management" In StudyAdministrationPage
  And I click Link "Normalize Lab Data" In StudyAdministrationPage
  Then I should see message "You cannot run normalization as the study does not have Local Labs module enabled." on Run Normalization Page.

 
