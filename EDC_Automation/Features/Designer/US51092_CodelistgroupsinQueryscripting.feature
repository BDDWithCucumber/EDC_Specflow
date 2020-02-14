Feature: Designer Scripting
#Feature No:F10416
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/217392853280
#Owner:Rama Chinthapalli
#Author:Vishnu Priya
#Copyright © 2018 PAREXEL International

@ObjectiveEvidence
	

@ObjectiveEvidence @ReqID:US63653.01
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I Import Study  
	When I click on the Link "Import Study"
	And I import a study "Scripting_1.zip" 
	And Enter the unique study name "Import1"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 		
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import1)" in "Complete" state

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T03_Create CodeLists and CodeLists Items	
	When I click on the "Home" tab
	And I click on the Link "Import1"
	Then User sees the "Study" page

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T04_Create CodeLists and CodeLists Items	
	When I click on the "Scripting" tab
	Then User sees the "Scripting" page

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T05_Add Parameter
	When I click on the Link "Query1"	
	When I click on the Link "Add Parameter" 
	And I enter the Parameter Name "PAR1"
	And I select the Reference 
	And I enter the Reference value "Data.Visit02.ScriptingForm_DEF.DomainItem.DomainItem.Value"	
	And I click on the Parameter Save button
	Then User sees the "Query1" page 

Scenario: T06_Add Test Case
	When I click on the Test case Sub tab
	And I click on the Link "Add Test Case"
	#And I click  on the dropdown Testvalue 
	Then user should see the below values in Testvalue dropdown
	 | Dropdown      |
	 | Codelist_DEF1 |
	 | Codelist_DEF2 |
	 | Codelist_DEF3 |

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T07_Create CodeLists and CodeLists Items
	When I click on the Codelists Button
	And click on link "Groups" tab
	And I click on the Link "Group1"	
	And I select the Codelist "DEF" that we want to assign to group
	And I remove country name "Codelist_DEF1" and country description "Codelist_DEF1_desc" to group clodelist items	
	And Click on the CodelistGroup "Group1"
	And I select the Codelist "DEF" that we want to assign to group	
	And I add country name "Codelist_DEF4" and country description "Codelist_DEF4_desc" to group clodelist items
	Then I see the link "Group1"
	#And Click on the CodelistGroup "CodelistGroup1"

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T08_Create CodeLists and CodeLists Items	
	When I click on the "Scripting" tab
	Then User sees the "Scripting" page

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T09_Create CodeLists and CodeLists Items	
	When I click on the Link "Query1"	
	Then User sees the "Query1" page

Scenario: T10_Add Test Case
	When I click on the Test case Sub tab
	And I click on the Link "Add Test Case"
	#And I click  on the dropdown Testvalue 
	Then user should see the below values in Testvalue dropdown
	 | Dropdown      |
	 | Codelist_DEF2 |
	 | Codelist_DEF3 |
	 | Codelist_DEF4 |

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T11_Create CodeLists and CodeLists Items
	When I click on the Codelists Button
	And click on link "Groups" tab	
	And I Check on the CodelistGroup "Group1"
	And I click on the "Delete Group" link
	And I click Continue on Target App pop up having  title "Delete" and partial message "Deleting a Group will dissociate all associated Codelist code items and Questions."
	And I click on the "Scripting" tab
	Then User sees the "Scripting" page

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T12_Create CodeLists and CodeLists Items	
	When I click on the Link "Query1"	
	Then User sees the "Query1" page

Scenario: T13_Add Test Case
	When I click on the Test case Sub tab
	And I click on the Link "Add Test Case"	 
	Then user should see the below values in Testvalue dropdown
	 | Dropdown      |
	 | Codelist_DEF1 |
	 | Codelist_DEF2 |
	 | Codelist_DEF3 |
	 | Codelist_DEF4 |
	 | Codelist_DEF5 |

Scenario: T14_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies	
When I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName |
	| Import1   |	
	Then I should not see these studies in the Home page
	| StudyName |
	| Import1   |

	#When I click on the Filter button
#	#And I enter "Query1" in the filter option
#	#And I click on Filter ICon
	

#@ObjectiveEvidence @ReqID:US63653.65
#Scenario: T05_Create CodeLists and CodeLists Items	
#	When I click on the Link "Add Query"
#	And I enter "Query1" for the field Query	
#	And I click on Save button in Query page
#	Then User sees the "Scripting" page

