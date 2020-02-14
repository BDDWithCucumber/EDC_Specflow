Feature: US63112_Different_Study_Scenarios	

@ObjectiveEvidence @ReqID:US68936.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page
##created study
Scenario: T02_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_Study59_D_US63112_Target2.zip" 
	And Enter the unique study name "Import_Target59"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Target59)" in "Complete" state

#Scenario: T03_Add New Lab Dictionary	
#	When I click breadcrumb item "Home"
#	And I click on the Link "Manage Labs"
#	And I Click "Add Lab Dictionary"
#	And enter LabDictionaryName as "Dict42" 
#	And enter LabDictionaryDesc as "Dict42"
#	And I click on the Lab Dict Save button
#	And I should see the Dict notification "Dict42 has been successfully added"
#	And Click on the LabDict "Dict42"
#	And Click on the image "Import Lab Dictionary" link
#	And Enter Label as "LabDict"
#	And I upload a labDict file "DataLabsEDC_LabDictionary_LabDictionary_PS1_V14.xlsx"
#Test study
Scenario: T04_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_Source59_US63112_Source3.zip" 
	And Enter the unique study name "Import_Source59"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Source59)" in "Complete" state

Scenario: T05_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import_Target59"

Scenario: T06_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

###############Verification for duplicate Domain duplicate Domain Item and non duplicate Codelist ##########################
@ObjectiveEvidence @ReqID:3.1.2.6
Scenario: T07_When the user clicks on verify then the duplicate Domains should be highlited in orange color
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Source59"
	And I click on the Link "AutoBuild_Form03"
	And I click on Verify button	
	Then I should see the Orange background color for the Domain
	| Row | TargetForDomain |
	| 10  | AB_Table04      |	
	And the Domain textbox should be enabled for Domain
	| Row | TargetForDomain |
	| 10  | AB_Table04      |

Scenario: T08_When the user clicks on verify then the duplicate Domains should be highlited in orange color
	When I expand the domain of row
	| Row |
	| 19  |	
	Then I should see the Orange background color for the Domain
	| Row | TargetForDomain |
	| 19  | AB_Table05      |
	And the Domain textbox should be enabled for Domain
	| Row | TargetForDomain |
	| 19  | AB_Table05      |

Scenario: T09_When the user clicks on verify then the duplicate Domains should be highlited in orange color
	When I expand the domain of row
	| Row |
	| 29  |	
	Then I should see the Orange background color for the Domain
	| Row | TargetForDomain |
	| 29  | DEMO            |
	And the Domain textbox should be enabled for Domain
	| Row | TargetForDomain |
	| 29  | DEMO            |
##############Verification for duplicate Domain Item and non duplicate Codelist######
Scenario: T10_When the Domain Item is duplicate then the Domain Item should be displayed in orange color 
	Then I should see the Orange background color for the DomainItems
	| Row | TargetForDomainItem |
	| 11  | CodeList1_Yes04     |
	| 20  | CodeList1_Yes05     |
	| 30  | JAPANSTY            |

Scenario: T11_When the Domain Item is duplicate then the Domain Item Include checkbox should be disabled and unchecked
	Then the Domain Include Checkbox should be unchecked and disabled for the below DomainItems
	| Row | IncludeForDomainItem | TargetForDomainItem |
	| 11  | disabled             | CodeList1_Yes04     |
	| 20  | disabled             | CodeList1_Yes05     |
	| 30  | disabled             | JAPANSTY            |
Scenario: T12_When the Domain Item is duplicate then the Codelist Include checkbox should be disabled and unchecked	
	Then the CodeList Include Checkbox should be unchecked and disabled for the below Codelists
	| Row | IncludeForCodelist | TargetForCodelist |
	| 11  | disabled           | AB_Gender         |
	| 20  | disabled           | AB_Gender         |
	| 30  | disabled           | NoOfPlayers       |
Scenario: T13_When the Domain Item is duplicate then the Codelist textbox should be disabled
	Then the CodeList textbox is disabled for CodeList
	| Row | TargetForCodelist |
	| 11  | AB_Gender         |
	| 20  | AB_Gender         |
	| 30  | NoOfPlayers       |
########### Verification for non duplicate Domain Item and Duplicate Codelist###############
Scenario: T14_When only the codelist is duplicate then the codelist should be highlighted in orange color	
	Then I should see the Orange background color for the codelists	
	| Row | TargetForCodelist |
	| 12  | AB_Color          |
	| 22  | XYN               |
	| 32  | JPPAR             |	
Scenario: T15_When only the codelist is duplicate then the CodelistInclude Check box should be uncheked and disabled and the text box should be enabled	
	Then the CodeList Include Checkbox should be unchecked and disabled for the below Codelists
	| Row | IncludeForCodelist | TargetForCodelist |
	| 12  | disabled           | AB_Color          |
	| 22  | disabled           | XYN               |
	| 32  | disabled           | JPPAR             |
	And I should see the Target Codelist textbox in enabled state as below
	| Row | TargetForCodelist |
	| 12  | AB_Color          |
	| 22  | XYN               |
	| 32  | JPPAR             |

###########Domain Item is duplicate and mapped to a different codelist list############
Scenario: T16_When the Domain Item is duplicate and mapped to a different Codelist then the textbox should be displayed in blue and unchecked
	Then the CodeList Include Checkbox should be unchecked and disabled for the below Codelists
	| Row | IncludeForCodelist | TargetForCodelist |
	| 18  | disabled           | AB_BodyRegion     |
	| 27  | disabled           | AB_BodyRegion     |
	| 33  | disabled           | AB_BodyRegion     |
	And the CodeList textbox is disabled for CodeList
	| Row | TargetForCodelist |
	| 18  | AB_BodyRegion       |
	| 27  | AB_BodyRegion       |
	| 33  | AB_BodyRegion       |

Scenario: T17_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies	
	When I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName |
	| Import_Study59_US63112_SameStudy   |
Then I should not see these studies in the Home page
	| StudyName |
	| Import_Study59_US63112_SameStudy   |

	