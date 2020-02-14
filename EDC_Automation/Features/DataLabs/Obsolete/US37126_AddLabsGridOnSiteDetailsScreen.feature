Feature: As a Study Administrator/Lab Administrator,

I want to be able to see list of Labs on site details screen,

So that I am aware of Labs associated to that site.

Acceptance Criteria:

1. I shall be able to see list of Labs on site details screens along with Study Versions and Users screen.

2. I shall be able to see Lab ID, Lab Name, Company, Department and Status columns on the grid.

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Navigate to StudyAdministrationPage And GroupManagementPage
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage

Scenario Outline: 03_CreateSites
	When I click ActionPalette Item "Add Site" in "SiteListActions" ActionPalette
	And I Enter SiteId<SiteId> And SiteName<SiteName>  
	And Site Save Clicked
Examples: 
	| SiteId | SiteName |
	| S1     | Site1    |
	| S2     | Site2    |
	| S3     | Site3    |

Scenario: 04_Navigate to LabManagement Page
	When I click breadcrumb "Study Administration"
	And I click Link "Labs Management" In StudyAdministrationPage

Scenario Outline: 05_Create Labs
	When I click ActionPalette Item "Add Lab" in "LabMgmt_Actions" ActionPalette
	And I Enter LabId<LabId> And <LaboratoryName> And Company <Company> And ISOCountry <ISOCountry> And LaboratoryStatus <LaboratoryStatus>
	And Lab Save Clicked	
Examples: 
	| Lab Id | Laboratory Name | Company | ISO Country | Laboratory Status |
	| L1     | Lab1            | ABC Ltd | India       | Active            |
	| L2     | Lab2            | ABC Ltd | India       | Active            |
	| L3     | Lab3            | ABC Ltd | India       | Active            |
	| L4     | Lab4            | ABC Ltd | India       | Active            |
	| L5     | Lab5            | ABC Ltd | India       | Active            |

Scenario: Navigate to Associate Labs for a Site
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I Select Site "Site1" from sites page
	When I click ActionPalette Item "Assocate Lab(s)" in "SiteListActions" ActionPalette

Scenario Outline: Associate Labs to Site
	When I select lab <LabName> from availabe labs
	And I click Add Button in AssociateLabsPage
	And I Labs Save button clicked
Examples:
	| LabName |
	| Lab1    |
	| Lab2    |
	| Lab3    |

Scenario: Check for available Labs for a site
	When I click breadcrumb "Site Management"
	And I Click SiteLink "Site1" in SitesPage
	And I Select Labs Tab in site page
	And I see Labs and data in other three columns
	| Lab Id | Laboratory Name | Company | Department | Laboratory Status |
	| L1     | Lab1            | ABC Ltd |            | Active            |
	| L2     | Lab2            | ABC Ltd |            | Active            |
	| L3     | Lab3            | ABC Ltd |            | Active            |
	
Scenario: Check for available Sites for a Lab
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I select a Lab "Lab1"
	Then I See Site 
	| SiteId | Sitename | City/Town | State/Province | ISOCountry | Status |
	| S1     | Site1    |           |                |            |        |
	
Scenario Outline: Unassociate Labs to Site
	When I select lab <LabName> from associated labs
	And I click Remove Button in AssociateLabsPage
	And I Labs Save button clicked
Examples:
	| LabName |
	| Lab1    |

Scenario: Check for available Labs for a site after modification
	When I click breadcrumb "Site Management"
	And I Click SiteLink "Site1" in SitesPage
	And I Select Labs Tab in site page
	And I see Labs and data in other three columns
	| Lab Id | Laboratory Name | Company | Department | Laboratory Status |
	| L2     | Lab2            | ABC Ltd |            | Active            |
	| L3     | Lab3            | ABC Ltd |            | Active            |

Scenario: Check for available Sites for a Lab after modification
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I select a Lab "Lab2"
	Then I See Site 
	| SiteId | Sitename | City/Town | State/Province | ISOCountry | Status |
	| S1     | Site1    |           |                |            |        |
