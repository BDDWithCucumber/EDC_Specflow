Feature: US36587-DL_SiteToLabAssociationIncludingLinkOnSiteManagementPage

As a Lab Administrator,
I want to be able to associate Labs to a Site,
So that I can use associated Labs for collecting test results and reference ranges for that Site.

Acceptance Criteria:

	1. I shall be able to associate one or more labs to a Site through Site Management> <Site ID> >Associate Lab(s) screen.
	2. I shall have ability to filter or search for particular lab using a combination of the lab properties Lab ID and Lab Name.

@mytag
Scenario: US36587_1 User can't see Associate Lab(s) link on Site page when the permission is set to Deny.
	Given I have logged into DataLabs application as an Administrator user.
	And I navigate to Study Administration page.
	And I select Group Management link on Study Administration page.
	And I select "EDC Engineering Admins Group" from Group Management page.
	And I select Edit Group Permissions.
	When I set Associate Lab(s) permission under Site Permissions section to Deny and Save.
	And I select Study Administration from the breadcrumb.
	And I select "Site Management" link on Study Administration page.
	And I select the site "01-Site"
	Then I should see Associate Lab(s) link in the actions palette.

Scenario: US36587_2 User can see Associate Lab(s) link on Site page when the permission is set to Allow.
	Given I have logged into DataLab(s) application as an Administrator user.
	And I navigate to Study Administration page.
	And I select "Group Management" link on Study Administration page.
	And I select "EDC Engineering Admins Group" from Group Management page.
	And I select Edit Group Permissions.
	When I set Associate Lab(s) permission under Site Permissions section to Allow and Save.
	And I select Study Administration from the breadcrumb.
	And I select "Site Management" link on Study Administration page.
	And I select the site "01-Site"
	Then I should see Associate Lab(s) link in the actions palette.

Scenario: US36587_3 User can access Assocaite Lab(s) page on selecting Associate Lab(s) link on Site page.
	Given I have selected the site "01-Site"
	When I select Associate Lab(s) link on the Site page.
	Then I should see Associate Lab(s) page for the site "01-Site".

Scenario: US36587_4 Verification of bread crumb on the Associate Lab(s) page.
	Given I am on Associate Lab(s) page for the site "01-Site".
	Then I should see bread crumb as Study Administration > Site Management > 01-Site > Associate Lab(s)

Scenario:  US36587_5 Verification of page title and labels on Associate Lab(s) page.
	Given I am on Associate Lab(s) page for the site "01-Site".
	Then I see page title as Associate Lab(s)
	And I see Available Lab(s) label.
	And I see Associated Lab(s) label.
	And I see title for Available and Associated Lab(s) as Lab ID - Labaratory Name

Scenario: US36587_6 Associate Lab(s) page has Available and Associated Lab(s) lists with Add >> and << Remove buttons.
	Given I am on Associate Lab(s) page for the site "01-Site".
	Then I should see Available Lab(s) list box.
	And I should see Associate Lab(s) list box.
	And I should see Filter field for Available Lab(s) list box.
	And I should see Filter field for Associated Lab(s) list box.
	And I should see Add >> button.
	And I should see << Remove button.
	And I should see Save button.
	And I should see Cancel button.

Scenario Outline: US36587_7 Available Lab(s) list display the Labs in the format of LabID - LabName.
	Given I am on Associate Lab(s) page for the site "01-Site".
	Then I should see lab <LabName> in Available Lab(s) listbox.
	Examples: 
	| LabName           |
	| US3658701 - Lab01 |
	| US3658702 - Lab02 |
	| US3658703 - Lab03 |
	| US3658704 - Lab03 |

Scenario: US36587_8 Associate Lab(s) will be empty when no labs are associated.
	Given I am on Associate Lab(s) page for the site "01-Site".
	Then I should see Asscoaite Lab(s) listbox with no Labs information in it.

Scenario: US36587_9 Labs information in Available Lab(s) listbox are sorted in ascending alphanumerically.
	Given I am on Associate Lab(s) page for the site "01-Site".
	Then All the Labs in Available Lab(s) list are ordered alphanumerically in ascending order.

Scenario Outline: US36587_10 Labs can be filtered in Available Lab(s) list with a text and on filtering all Labs will be returned that contains the search text either in ID or Name.
	Given I am on Associate Lab(s) page for the site "01-Site".
	When I enter search criteria as <data> in Available Lab(s) list box.
	Then I see all the Labs in Available Lab(s) list have <data> in the Lab ID or Name.
	Examples: 
	| Data |
	| 03   |
	| US   |
	| Lab  |

Scenario: US36587_11 No Labs are displayed in Available Lab(s) list when filtered with text that doesn't match either ID or Name.
	Given I am on Associate Lab(s) page for the site "01-Site".
	When I enter search criteria as "xx101" in Available Lab(s) list box.
	Then There are no Labs displayed in Available list.
	And I clear the search criteria from the Available Lab(s) list box.

Scenario Outline: US36587_12 Labs can be moved to Associated list by selecting and clicking on Add button.
	Given I am on Associate Lab(s) page for the site "01-Site".
	When I select <Lab> from Available Lab(s) list.
	And I select Add >> button.
	Then I see <Lab> in Associated Lab(s) list.
	Examples: 
	| Lab               |
	| US3658701 - Lab01 |
	| US3658704 - Lab03 |
	| US3658703 - Lab03 |
	| US3658702 - Lab02 |

Scenario: US36587_13 Labs can be associated by clicking on Save button on Associate Lab(s) page.
	Given I am on Associate Lab(s) page for the site "01-Site".
	When I click Save button on Associate Lab(s) page.
	Then I will be returned to Edit Site information page for "01-Site".
	And I select Associate Lab(s) link on the Site page.
	Then I see below list of Labs in Associated Lab(s) list box.
	| Lab               |
	| US3658701 - Lab01 |
	| US3658704 - Lab03 |
	| US3658703 - Lab03 |
	| US3658702 - Lab02 |
	
Scenario: US36587_14 Labs information in Associated Lab(s) listbox are sorted in ascending alphanumerically.
	Given I am on Associate Lab(s) page for the site "01-Site".
	Then All the Labs in Associated Lab(s) list are ordered alphanumerically in ascending order.

Scenario Outline: US36587_15 Labs can be filtered in Associated Lab(s) list with a text and on filtering all Labs will be returned that contains the search text either in ID or Name.
	Given I am on Associate Lab(s) page for the site "01-Site".
	When I enter search criteria as <data> in Associated Lab(s) list box.
	Then I see all the Labs in Associated Lab(s) list have <data> in the Lab ID or Name.
	Examples: 
	| Data |
	| 03   |
	| US   |
	| Lab  |

Scenario: US36587_16 No Labs are displayed in Associated Lab(s) list when filtered with text that doesn't match either ID or Name.
	Given I am on Associate Lab(s) page for the site "01-Site".
	When I enter search criteria as "xx101" in Associated Lab(s) list box.
	Then There are no Labs displayed in Associated list.
	And I clear the search criteria from the Associated Lab(s) list box.

Scenario Outline: US36587_17 Labs can be moved back to Available Lab(s) by selecting from Associated list and clicking on Remove button.
	Given I am on Associate Lab(s) page for the site "01-Site".
	When I select <Lab> from Associated Lab(s) list.
	And I select << Remove button.
	Then I see <Lab> in Available Lab(s) list.
	Examples: 
	| Lab               |
	| US3658701 - Lab01 |
	| US3658704 - Lab03 |

Scenario: US36587_18 Labs can be de-associated by selecting Save button on Associate Lab(s) page.
	Given I am on Associate Lab(s) page for the site "01-Site".
	When I click Save button on Associate Lab(s) page.
	Then I will be returned to Edit Site information page for "01-Site".
	And I select Associate Lab(s) link on the Site page.
	Then I see below list of Labs in Available Lab(s) list box.
	| Lab               |
	| US3658701 - Lab01 |
	| US3658704 - Lab03 |

Scenario Outline: US36587_19 Lab that is associated a site can be associated again to another Site.
	Given I select "Site Management" link from breadcrumb.
	And I have selected the site "02-Site"
	When I select Assocaite Lab(s) link on the Site page.
	And I select Lab <Lab> from Available Lab(s) list.
	And I select Add >> button on Associate Lab(s) page.
	And I click Save button on Associate Lab(s) page.
	And I select Associate Lab(s) link on the Site page.
	Then The Lab <Lab> is assigned to site "02-Site".
	Examples: 
	| Lab               |
	| US3658701 - Lab01 |

Scenario Outline: US36587_20 Selecting Cancel button will discard all the selections made from Available and Associated Lab(s) list
	Given I am on Associate Lab(s) page for the site "02-Site".
	And I select <AssociatedLab> from Associated Lab(s) list box.
	And I select << Remove button.
	And I select <AvailableLab> from Available Lab(s) list box.
	And I select Add >> button.
	When I select Cancel button on Associated Lab(s) page.
	Then I will be returned to Edit Site information page for "01-Site".
	And I select Associate Lab(s) link on the Site page.
	And I see <AssociatedLab> in Associated Lab(s) list box.
	And I see <AvailableLab> in Available Lab(s) list box.
	Examples: 
	| AssociatedLab     | AvailableLab      |
	| US3658701 - Lab01 | US3658702 - Lab02 |


Scenario: 09_Navigate to Study Administration Page
	When I select DataManagerPortal item "Study Administration" from drop down
	Then I see BreadCrumb "Study Administration"
