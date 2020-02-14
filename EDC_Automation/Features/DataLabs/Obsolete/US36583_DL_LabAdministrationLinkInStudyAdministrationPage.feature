Feature: DL: Lab Administration Link in Study Administration page

As a Lab Administrator,
I want to be able to see a link to administrate Labs data in DL,
So that I can use this data to compare against Lab results.

Acceptance Criteria:
	1.  I shall be able to see ‘Lab Management’ following Site Management in Study Administration.
	2.  I shall be able to see ‘Add Labs’ action upon clicking ‘Lab Management’

@mytag
Scenario: US36583_1 Navigate to Study Administration Page to see lab management link
	Given I have logged into DataLabs application as an Administrator user.
	When I navigate to Study Administration page.
	Then User Navigates to Study Administration Page
	And User shall see Lab Management link below Site Management
	And Help Text below Lab Management is displayed as "Manage labs".
	And A logo on left of Lab Management link is displayed.

Scenario: US36583_2 Add Lab action on lab management page
	Given user is navigated to Study Administration Page
	When user selects Lab Management link
	Then user navigates to Lab Management Page
	And user shall see "Add Lab" link under actions palette

Scenario: US36583_3 Display of breadcrumb on lab management page
	Given user is navigated to Lab Mangement Page
	Then breadcrumb shall display as Study Administration > Lab Management
	And User can navigate back to Study Administration Page from breadcrumb

Scenario: US36583_4 Lab management link displays when Lab Management permission is Edit
	Given user is navigated to Study Administration Page
	And the user select Group Management link on Study Administration page.
	And I select "EDC Engineering Admins Group" from Group Management page.
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	When I set "Lab Management" permission under "Lab Permissions" category to "Edit" and Save.
	And User select "Study Administration" from the breadcrumb.
	Then user shall see Lab Management link below Site Management
	And user selects Lab Management link
	And user navigates to Lab Management Page
	And user can see Add Lab link enabled

Scenario: US36583_5 Lab management link displays when Lab Management permission is View
	Given user is navigated to Study Administration Page
	And the user select Group Management link on Study Administration page.
	And I select "EDC Engineering Admins Group" from Group Management page.
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	When I set "Lab Management" permission under "Lab Permissions" category to "View" and Save.
	And User select "Study Administration" from the breadcrumb.
	Then user shall see Lab Management link below Site Management
	And user selects Lab Management link
	And user navigates to Lab Management Page
	And user can see Add Lab link enabled

Scenario: US36583_6 Lab management link doen't display when Lab Management permission is Hide
	Given user is navigated to Study Administration Page
	And the user select Group Management link on Study Administration page.
	And I select "EDC Engineering Admins Group" from Group Management page.
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I expand PermissionsGroup "Lab Permissions"
	When I set "Lab Management" permission under "Lab Permissions" category to "Hide" and Save.
	And User select "Study Administration" from the breadcrumb.
	Then user shall not see Lab Management link below Site Management

Scenario: US36583_7 Navigate to Study Administration Page on upgrade instance
	Given I have logged into DataLabs application as an Administrator user.
	When I navigate to Study Administration page.
	Then user shall not see Lab Management link below Site Management		

