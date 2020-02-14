Feature: US70936_Create_form_from_existing_Save_with_include_checked_and_unchecked
	As a Study Designer,
    I want to save the form with "Include" option for domain items and codelist
    So that the included domain items and codelist will be a part of the new form created.
	#Import a study "Import_Study1"  with lower version
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I Import Study of 5.7 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Test4500_Base1.zip" 
	And Enter the unique study name "Import_Study1"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs" 
	Then I should see the status of the study "Study Import (Import_Study1)" in "Complete" state

Scenario: T03_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

#Create a form from the  same study
Scenario: T04_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "AutoBuild_Form01"

Scenario: T05_When create_form_from_existing_popup_savebutton_should_be_disabled and enabled after clicking verify button
  When I create form from existing pop up
  Then I should see the Save button in disabled state at top of the pop up window
  Then I should see the Save button in disabled state at bottom of the pop up window
  And I click on verify button
  Then I should see the Save button in Enabled state at top of the pop up window
  Then I should see the Save button in Enabled state at bottom of the pop up window

Scenario: T06_When clicked on save after changing Domain, Domain Item and codelist names to save respectively
	When I change the form names and label names with the following details
	| Form Name		  | Form Label   | Table Name   | Table Name   |
	| FormName100     | FormLabel100 | TableName100 | TableName101 |
	And  I change the names of domain, domain Items and codelist with the following details
	| Domain    | Domain Item       | Codelist    |
	| Domain100 | Domain Item 100  | Codelist100 |  
	And I click on the Save button
	Then I should see the notification of the new form created

Scenario: T07_When I search for the new form I should be able to see the new  form
	When user should see the Form "{Form}" in Forms page
	And I search for the Form and open Form "FormName100"
	And I should be able to click on the question
	Then I should see the quest