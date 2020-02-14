Feature: US36586_CreateAndUpdateLab
		Create and Update/Edit a lab through link in a StudyAdministration page.

Scenario: Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: Navigate to Study Administration Page
	When I select Study Administration item from drop down
	Then I see Study Administration page

Scenario: Navigate to Lab Management page
	When I click LabManagement link
	Then I see breadcrumb <Links>
	| Links                               |
	| StudyAdministration, Lab Management |
	And I see LabManagement page

Scenario: Create a Lab by giving data in all fields
	Given I click ActionPalette <LinkName>
	| LinkName |
	| Add Lab  |
	And I see Active satus for LaboratoryStatus
	And I see breadcrumb <Links>
	| Links                                        |
	| StudyAdministration, Lab Management, Add Lab |
	When I Enter all details for Lab
	| Lab ID | Laboratory Name | Company | Department | Address 1 | Address 2 | Address 3 | City/Town | State/Province | Zip/Postal Code | ISO Country | Country | Phone | Fax | Contact Person |
	|        |                 |         |            |           |           |           |           |                |                 |             |         |       |     |                 | 
	And I select Save lab button
	Then I see created lab in LabManagement page

Scenario: Try creating a Lab by giving duplicate LabId
	Given I click AddLab link from action palette
	And I see Active satus for LaboratoryStatus
	When I Enter all details for Lab
	| Lab ID | Laboratory Name | Company | Department | Address 1 | Address 2 | Address 3 | City/Town | State/Province | Zip/Postal Code | ISO Country | Country | Phone | Fax | Contact Person |
	|        |                 |         |            |           |           |           |           |                |                 |             |         |       |     |                 | 
	And I select Save lab button
	Then I see validation message <Message>
	| Message      |
	| Duplicate Id |
	And I select cancel button in AddLabPage

Scenario: Create a Lab by giving data only in required fields
	Given I click AddLab link from action palet
	And I see Active status for LaboratoryStatus
	When I Enter all details for Lab
	| Lab ID | Laboratory Name | Company | Department | Address 1 | Address 2 | Address 3 | City/Town | State/Province | Zip/Postal Code | ISO Country | Country | Phone | Fax | Contact Person |
	|        |                 |         |            |           |           |           |           |                |                 |             |         |       |     |                 | 
	And I select SaveAndAnother lab button
	Then I see success message for lab creation
	And I see add LabPage

Scenario: Try creating a Lab by not giving data in required fields
	When I Enter all details for Lab
	And I see Active status for LaboratoryStatus
	| Lab ID | Laboratory Name | Company | Department | Address 1 | Address 2 | Address 3 | City/Town | State/Province | Zip/Postal Code | ISO Country | Country | Phone | Fax | Laboratory Status | Contact Person |
	|        |                 |         |            |           |           |           |           |                |                 |             |         |       |     |                   |                | 
	And I select Laboratory status as Blank
	And I select Save lab button
	Then I see validation message againt each required field
	And I select cancel button in AddLabPage
	But I do not see Lab in LabManagement page

Scenario: Edit a Lab by updating data
	Given I select a Lab <Lab>
	| Lab   |
	| Lab01 |
	And I see ActionPalette link <LinkName>
	| LinkName          |
	| Associate Site(s) |
	When I Enter all details for Lab
	| Lab ID | Laboratory Name | Company | Department | Address 1 | Address 2 | Address 3 | City/Town | State/Province | Zip/Postal Code | ISO Country | Country | Phone | Fax | Contact Person |
	|        |                 |         |            |           |           |           |           |                |                 |             |         |       |     |                 | 
	And I select Save button on Manage Labs page
	Then I see updated data in LabManagement page against the Lab

Scenario: Edit a Lab by removing required data
	Given I select a Lab <Lab>
	| Lab   |
	| Lab01 |
	When I Enter all details for Lab
	| Lab ID | Laboratory Name | Company | Department | Address 1 | Address 2 | Address 3 | City/Town | State/Province | Zip/Postal Code | ISO Country | Country | Phone | Fax | Contact Person |
	|        |                 |         |            |           |           |           |           |                |                 |             |         |       |     |                 | 
	And I select Save button on Manage Labs page
	Then I see validation message againt each required field
	And I select cancel button in AddLabPage

Scenario: Edit a Lab by updating Laboratory status
	Given I select a Lab <Lab>
	| Lab   |
	| Lab01 |
	When I Enter all details for Lab
	| Laboratory Stauts |
	| Inactive          |
	And I select Save button on Manage Labs page
	Then I see Inactive status for the Lab in LabManagementPage




