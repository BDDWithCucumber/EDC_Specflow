Feature:DS_EnableandDisableLabs1_08212019
     # As a Designer user
	    #I want to be able to maintain Lab Dictionaries for Lab Tests and Units
     #   So that I can maintain standard terminology and conversion factors for each Lab Test. 

##Feature No:F8734
##Feature Link: https://rally1.rallydev.com/#/244270786880ud/detail/portfolioitem/feature/242624791436
##Owner:Rama Chinthapalli
##Author:Vishnu Priya
##Copyright © 2018 PAREXEL International

Scenario: T01_Login to Designer
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When we create a study from existing study and change the Lab Setting option to No then I should see the Message below the drop down			
	When I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"
	#And I click on the Link "Create Study from Existing"	
	#And I click on the Link "Create Study from Existing"	
	#And I select the create study from existing dialog having title "Create Study from Existing"
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName     |
	| Test4500_Labs |
	And I change the Study Name to "Test4500_Labs_1"
	And I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T03_When we create a study from existing study where the previous Labs option is Set to Yes then the study should be created with Labs Option Set to Yes	
	When I click on the Link "View Study Jobs"
	And I should see the status of the study "Create Study (TesTest4500_Labs)" in "Complete" state
	And I click breadcrumb item "Home"
	

#Scenario: T04_Import Study to Designer
#	When I click on the Link "Import Study"
#	And I upload a study "Study2_DICT_20181016_T16550627.zip" 
#	And I click on Continue button
#	And I select the sponsor "sponsor1"
#	And I click on the button "Save" 	
#	Then I should see the notification "Study has been successfully added"
#
#Scenario: 3_Verify the Study Status
#	When I click on the Link "View Study Jobs"
#	Then I should see the page "Study Management Jobs"
#	And  I should see the status of the study "Study2_DICT" in Complete state
#
#Scenario: 4_Naviage to the Home page 
#	When I click on the Link "Home"
#	Then I see Designer Home Page
#	
#Scenario: 5_Navigate to popup window Create Study from Existing
#	When I click on the Link "Create Study from Existing"
#	Then I Should see a pop up window "Create Study from Existing"		
#
#Scenario: 6_Click on the study Link
#	When I click on the Link "Study2_DICT"
#	And I Change the study name to "Study2_DICT1"
#	And I click on "Save" button in the study page
#	Then I should see the notification "Study has been successfully added"	
#
#Scenario: 7_Verify the Study Status
#	When I click on the Link "View Study Jobs"
#	Then I should see the page "Study Management Jobs"
#	And  I should see the status of the study "Study2_DICT1" in Complete state
#
#Scenario: 8_When I click on the View Study Jobs then I should wait until the study is in Completed state
#	When I click on the Link "View Study Jobs"
#	Then I should see the page "Study Management Jobs"
#	And  I should see the status of the study "Study2_DICT1" in Complete state
#
#Scenario: 9_Naviage to the Home page 
#	When I click on the Link "Home"
#	Then I see Designer Home Page
#
#Scenario: 10_Click on the Study link 
#	When I click on the study Link "Study2_DICT1"
#	Then I should see the study page
#
#Scenario: 11_When I click on Labs then user should be able to see Attribute Mappings which are present in previous study
#	When I click on the tab "Labs"
#	Then I should see the "Lab Mapping"  page
#	And I should see all the AttributeMapping which are present in the previous study 
#
#Scenario: 12_When I navigate to the lab Mapping page then the lab mapping which are present in previous study should present in this study as well
#	When I click on the tab "Lab Mapping"
#	Then I should see all the lab mapping which are present in the previous study
#
#Scenario: 13_Navigate to Map Lab Dictionary Page
#	When I click on the link  "Map Lab Dictionary"
#	Then I should see page "Map Lab Dictionary"
#
#Scenario: 14_Verify the Lab Dictionary Name in  Map Lab Dictionary page
#	When I click on the link  "Map Lab Dictionary"
#	Then I should see page "Map Lab Dictionary"
#	And I should see the "Lab Dictionary Name" which is present in previous study as well
#
#Scenario: 15_Verify the Lab Test table  in Map Lab Dictionary page	
#	And I should see the same "Lab Test" table which is present in previous study as well
#
#Scenario: 16_Verify the Lab unit table  in Map Lab Dictionary page
#	When I click on the tab "Lab Unit"
#	Then I should see same "Lab Unit" table which is present in previous study as well	
#
#Scenario: 17_Verify the Forms in Forms tab section
#	When I click on the tab "Forms"
#	Then I should see all the forms which are present in previous study as well	
#
#Scenario: 18_Verify the Linkages in the Form
#	When I click on the Link "LInkages_Forms"
#	Then I should see all the linkages which are present in previous study as well
#
#Scenario: 19_Verify the CodeLists
#	When I click on the tab "Codelists"
#	Then I should see all the Codelists which are present in previous study as well
#
#Scenario: 21_Verify the Groups
#	When I click on the tab "Groups"
#	Then I should see all the Groups which are present in previous study as well
#
#Scenario: 22_Verify the Codelist Groups 
#	When I click on the tab "Codelist Groups "
#	Then I should see all the Codelist Groups  which are present in previous study as well
#
#Scenario: 23_Verify the Linkages
#	When I click on the tab "Linkages"
#	Then I should see all the Linkages which are present in previous study as well
#
#Scenario: 24_Verify the Dictionaries
#	When I click on the tab "Dictionaries"
#	Then I should see all the Dictionaries which are present in previous study as well
#
#Scenario: 25_Logout form Designer
#	When I click logout of Designer
#	Then I see login page

	# We are not checking Scripting section and Events section in this user story

## Continuation of DL scenarios for the same user story

#Scenario: 01_Login to Datalabs
#	Given I logged in to DataLabs
#	Then I see Datalabs Home Page
#
#Scenario: 02_Publish a study
#	When I click breadcrumb "Study Management"
#	And I upload a study "Study2_DICT_20181016_T16550627.zip" with study label "Copy Study from Existing"
#	Then I see study label "Study2_DICT" in header
#
#Scenario: 03_Upload and Stage a Study which has major study changes
#	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
#	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
#	And I click browse button in upload study file page
#	And I upload study "TestStudy5100_MajorUpdate.zip" with Label "Major"
#	And I open study which has "Uploaded" status
#	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
#	And I open study which has "Staged" status
#	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
#
#Scenario: 04_MigragePatients
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


