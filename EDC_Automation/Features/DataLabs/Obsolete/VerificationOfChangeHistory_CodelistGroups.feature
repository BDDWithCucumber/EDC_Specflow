Feature: VerificationOfChangeHistory_CodelistGroups
	
Scenario: 00_Log in to DataLabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page


Scenario: 01_Delete Study
	When I delete study
	Then I see study label "No Study Loaded" in header


Scenario: 02_Publish Study

   When I select DataManagerPortal item "Study Administration" from drop down
   And I click Link "Study Management" In StudyAdministrationPage
   And I upload study "Test4500_CLG.zip" with Label "Test4500"
   Then I see study label "Test4500_CLG" in header

Scenario: 03_Add Site

	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I click ActionPalette Item "Add Site" in "SiteListActions" ActionPalette
	And I enter sites details and Save
         | SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City | State | Zip | ISOCountry | Country | Phone | Fax | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
         | 01     | Site     |          |          |          |          |      |       |     | IND        | INDIA   |       |     | Active     | Electronic  | No             |            |
	
	Then I see Site "01-Site" in SiteManagementPage
        | SiteId | Sitename | City/Town | State/Province | ISOCountry | Status |
        | 01     | Site     |           |                | IND        | Active |

Scenario: 04_Associate user to 01-Site 
	
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "Narendra, Konduparthy" to site users in SiteManageUsersPage
	Then I see SiteManagementPage


Scenario: 05_Add patient 01-Site 

	Given I select "Patients" tab from the main menu of DataLabs.
	And I select site "01-Site" from Sites dropdown.
	When I add patient with below details.
         | ScreenID | PatientInitials | ScreenDate |
         | 01       | Patient         | 01/25/2018 |

	Then I see patient "01-PAT" status as "Screened" on Patient details page