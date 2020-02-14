Feature: DictionaryNotifications
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers
@US68963,@US68965,@US68966
######dictionary notification###############
Scenario: 111_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

##Creation of Study
Scenario: 112_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "test01_20190827_T12150151.zip" 
	And Enter the unique study name "test01"
	And Select the sponsor name "Perceptive"
	And I click on the Save button 	
	And I click on study publish continue button
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (test01)" in "Complete" state

Scenario: 113_Verify the study after associating the lab dictionary
	 When I click on the Home Button
	 And I click on the Link "Manage Labs"
	And Click on the LabDict "LabDict311"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict311"
	And I upload a labDict file "DataLabsEDC_LabDictionary_GS1.xlsx"
	Then I should see below lab tests in the table
	| LabTestName |
	| MRRTEST1    |
@ObjectiveEvidence @ReqID:US63129.26
Scenario: 114_Verify the study after associating the lab dictionary
	When I click on the Home Button
	And I click on the Link "test01"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict311 (LabDictDesc3)"
    And I click on the tab "Lab Test"
	And Select the Code Value for LabTest "LabTests-B.P Test (B.P Test)"
	And I click on the tab "Lab Unit"
	And Select the Code Value for LabUnit "LabUnits-01 (01)"
	And I click lab dict Save button
	Then I should see the notification "Saved successfully"
	
## Changes Manage Labs
Scenario: 115_Add New Lab Dictionary
	When I click on the Home Button
	And I click on the Link "Manage Labs"
	And Click on the LabDict "LabDict311"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict1"
	And I upload a labDict file "Copy of DataLabsEDC_LabDictionary_GS1_CHANGED.xlsx"
	Then I should see below lab tests in the table
	| LabTestName |
	| MRRTEST1    |
@US68963
Scenario: 116_Verify the study after associating the lab dictionary
    When I click on the Home Button
	And I click on the Link "test01"
	Then verify the display of "Associated lab dictionary has been modified."
	And verify the display of message with Hyperlink
	And I should navigate to "Map Lab Dictionary" page.


	##Scenario Pending of verifying user with designer -lead admin can do this
	#*****************************************8ss

