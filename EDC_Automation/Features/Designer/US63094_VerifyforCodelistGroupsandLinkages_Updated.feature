Feature: US63094_VerifyforCodelistGroupsandLinkages_Updated
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

Feature: US63112	

@ObjectiveEvidence @ReqID:US68936.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_59.zip" 
	And Enter the unique study name "Import_Study1"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Study1)" in "Complete" state

Scenario: T03_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_57.zip" 
	And Enter the unique study name "Import_Study1"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Study1)" in "Complete" state

Scenario: T04_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

@ObjectiveEvidence @ReqID:3.1.2.6
Scenario: T05_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "LinkagesForm_AutobuildTable"			
	Then user should see Verify button before the save button at the top of the pop up window
	And user should see Verify button before the save button at the bottom of the pop up window	
	And I should see the all the checkboxes in enabled state and checked by default for the Domain Items
	  | Target1         | Include1 |
	  | CodeList1_Yes04 | checked  |
	  | CodeList2_Yes04 | checked  |
	  | CodeList3_Yes04 | checked  |
	  | AB_Integer04    | checked  |
	  | AB_Float04      | checked  |
	  | AB_Text04       | checked  |
	  | AB_Date04       | checked  |
	  | CodeList1_Yes05 | checked  |
	  | CodeList2_No05  | checked  |
	  | CodeList3_Yes05 | checked  |
	  | AB_Integer05    | checked  |
	  | AB_Float05      | checked  |
	  | AB_Text05       | checked  |
	  | AB_Date05       | checked  |
	  And I should see all the checkboxes in enabled state and checked by default for the codelist
	  | Target2                | Include2 |
	  | AB_Color               | checked  |
	  | AB_DrugsList           | checked  |
	  | AB_Times               | checked  |
	  | AB_Gender              | checked  |
	  | RACE_CD                | checked  |
	  | AB_BodyRegion          | checked  |
	  | AB_Form03_CountInteger | checked  |
	  | AB_Form07_CreatedDate  | checked  | 
	  And I should see the Save button in disabled state at top of the pop up window
	  And I should see the Save button in disabled state at bottom of the pop up window

	  When I click on the Dropdown Icon for the Domain