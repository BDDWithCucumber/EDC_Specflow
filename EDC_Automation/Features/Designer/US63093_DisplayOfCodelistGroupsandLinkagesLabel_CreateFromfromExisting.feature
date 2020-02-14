Feature: DisplayOfCodelistGroupsandLinkagesLabel_Create	

Scenario: T01_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x or 5.8x then study should be added sucessfully
	When I click on the Cancel button on the popup page
	When I click breadcrumb item "Home"
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping |
	| Study_59    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.9x or greater | Not Enabled   |		
	When I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T06_When user adds the study and open then the study page should be displayed
	When I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study_59    |
	Then I should see the "Study" page

#Scenario: T06_When the user clicks on Forms tab then Forms page should be displayed
#	When I click on the "Forms" tab
#	Then I should see the "Forms" page	

Scenario: T07_When the user create a Codelist
	When I click on the "Codelists" tab
	And I Click on "Add Codelist"
	And I enter CodelistName as "Codelist1"
	And I enter CodelistDesc as "CodelistDesc"
	And I click on the Codelist Save button	
	Then I should see the notification "Codelist1 has been successfully added"

Scenario: T08_When the user create a Form
	When Click on the Codelist "Codelist1"
	Then I add the below codelist items and I should see the successful notification message
	| CodeListname | CodePrefix | CodeItemDesc  | CodeItemValue      |
	| Codelist1    | 1          | CodelistItem1 | CodelistItemvalue1 |
	| Codelist2    | 2          | CodelistItem2 | CodelistItemvalue2 |
	| Codelist3    | 3          | CodelistItem1 | CodelistItemvalue1 |
	| Codelist4    | 4          | CodelistItem2 | CodelistItemvalue2 |
	| Codelist5    | 5          | CodelistItem1 | CodelistItemvalue1 |
	| Codelist6    | 6          | CodelistItem2 | CodelistItemvalue2 |
	

Scenario: T09_When the user create Domain
	When I click on the "Domains" tab
	Then I should see the "Domains" page

Scenario: T10_When the user create Domain
	When I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain1"
	And enter DomainDesc as "Domain1Desc"
	And I click on the Domains Save button
	Then I should see the notification "Domain1 has been successfully added"

Scenario: T11_When the user create Domain Items
    When I click on the Link "Domain1"
	And I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName    | Source | Datatype | Codelist  | maxlen |
	| DomainItem1 | EDC    | Text     | Codelist1 | 30     |
	Then I should see the notification "DomainItem1 has been successfully added"

Scenario: T12_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

Scenario: T13_When the user clicks on Forms tab then Forms page should be displayed	
	When I click on the Link "Add Form"
	And I enter the FormName as "Form1"
	And I enter the Formlabel as "FormLabel"
	And I click on Form Save button
	Then I should see the notification "Form1 has been successfully added"

Scenario: T14_When the user clicks on Add Question
	When I click on the Link "Form1"
	And I click on the Link "Add Question"
	And I enter the Question Data as "Question1"
	And I click on QuestionData Save button
	Then I should see the notification "Question1 has been successfully added"	

Scenario: T15_When the user clicks on Add Question 
	When I add the below form question items and I should see the successful notification message
	| Qestionname | Domain  | QuestionDisplayOption | QuestionItemName | ConditionalItemName | ConditionalComparator | ConditionalValue | DataGroup | CodelistGroup | CodelistLiknage | linkageItem | HeaderName | Keysequence |
	| Question1   | Domain1 | Drop-Down             | DomainItem1      | --                  | --                    |                  | --        |               |                 |             |            |             |
	And I click on the "Forms" tab
	Then I should see the "Forms" page