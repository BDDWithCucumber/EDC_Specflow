Feature: Create Form from existing: Include  for codelist on save
  Test Summary:
  user shall be able to able to save codelist with include.
  user shall be able to see the codelist(s) that are included newly in target study.

  @ObjectiveEvidence @ReqID:US68945.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I Import Study of 5.7 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_1_US68936.zip" 
	And Enter the unique study name "Import_Study2"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Study2)" in "Complete" state

Scenario: T03_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

Scenario: T04_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study2"
	And I click on the Link "Form1"		
	And I click  on verify button
	Then I verify the Save button is enabled


Scenario: T05_When I enter the form details the save button should be enabled and functional 
	When I Enter the form details
	| FormName | FormLabel | TableName |
	|   Form100  |   Label100  |  Table100   |
	And I change the  name of the Domain, Item and codelist details in the target to the following
	| Domain   | Item | CodeList Target |
	| Domain100 |Item100|   Target100       |
	And I verify the Save button is clicked
	Then I should see the notification "Form100 has been successfully added" 	

Scenario: T06_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page
Scenario: T07_When the user click on "addForm" then form should be created with given details
    When I click on the Link "Add Form" button
	And I enter the FormName as "FormName99"
	And I enter the Formlabel as "FormLabel99"
	And I click on Form Save button
	Then I should see the notification "Form99 has been successfully added"

Scenario: T07_When the user select the form then able to add the questions
	when I add the below form question items
         | FormName | QuestionName | QuestionItemName | DomainName|
         |  Form99   |Question1     |Item100            |Domainn100  | 
	Then I should see the Codelist "Target100"

Scenario: T_When the user clicks on the codelist tab then codelist page should be displayed
	When I click on the "codelist" tab
	Then I should see the "codelist" page

Scenario: T_When user search for created codelist then it should be displayed in the codelist page
	When I enter the Codelist "Target100" in CodelistName and Search
	Then I should see the Codelist "Target100"

Scenario: T_When the user clicks on the domains tab then domains page should be displayed
	When I click on the "Domains" tab
	Then I should see the "Domains" page

Scenario: T_When user search for created domain then it should be displayed in the domains page
	When I enter the Domain "Domain100" In domainName and search
	Then I should see the Codelist "Domain100"


Scenario: T_When user clicks on the domain and go to items list and edit the created item to view the codelist  associated to it.
	When User clicks on "Domain100" in the domains page
	And I should be navigated to domain items associated to the domain
	And I should edit the Domain item "Item100"  in the item  list
	Then I should see the codelist attached to the domain item as  "Target1"

#Create A new Study and Do verify

Scenario: T09_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x then study should be added sucessfully
	When I click on the Cancel button on the popup page
	When I click breadcrumb item "Home"
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel   | Protocol   | ProtocolLabel   | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor | TargetApp | SafetyMapping |
	| Study10   | StudyLabel10 | Protocol10 | ProtocolTitle10 | PT10          | EXSTUID       | Phase10    | Cal pol10       |  IND10            | Allergy         | Sponsor10 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |		
	When I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T10_When user adds the study and open then the study page should be displayed
	When I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study10    |
	Then I should see the "Study" page

Scenario: T11_When the user create a Codelist
	When I click on the "Codelists" tab
	And I Click on "Add Codelist"
	And I enter CodelistName as "Codelist10"
	And I enter CodelistDesc as "CodelistDesc10"
	And I click on the Codelist Save button	
	Then I should see the notification "Codelist10 has been successfully added"

Scenario: T12_When the user create a codelist items
	When Click on the Codelist "Codelist10"
	Then I add the below codelist items and I should see the successful notification message
	| CodeListname | CodePrefix | CodeItemDesc  | CodeItemValue      |
	| Codelist11    | 1          | CodelistItem11 | CodelistItemvalue11 |
	| Codelist12    | 2          | CodelistItem12 | CodelistItemvalue12 |

Scenario: T13_When the user clicks on Domain tab then domain page should be displayed
	When I click on the "Domains" tab
	Then I should see the "Domains" page

Scenario: T14_When the user create Domain
	When I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain10"
	And enter DomainDesc as "Domain1Desc10"
	And I click on the Domains Save button
	Then I should see the notification "Domain10 has been successfully added"

Scenario: T15_When the user create Domain Items
    When I click on the Link "Domain1"
	And I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName    | Source | Datatype | Codelist  | maxlen |
	| DomainItem10 | EDC    | Text     | Codelist10 | 30     |
	Then I should see the notification "DomainItem1 has been successfully added"

Scenario: T16_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

Scenario: T17_When the user clicks on Forms tab then Forms page should be displayed	
	When I click on the Link "Add Form"
	And I enter the FormName as "FormName80"
	And I enter the Formlabel as "FormLabel80"
	And I click on Form Save button
	Then I should see the notification "Form1 has been successfully added"

Scenario: T18_When the user clicks on Add Question
	When I click on the Link "FormName8"
	And I click on the Link "Add Question"
	And I enter the Question Data as "Question10"
	And I click on QuestionData Save button
	Then I should see the notification "Question1 has been successfully added"	

Scenario: T19_When the user clicks on Add Question 
	When I add the below form question items and I should see the successful notification message
	| Qestionname | Domain  | QuestionDisplayOption | QuestionItemName | ConditionalItemName | ConditionalComparator | ConditionalValue | DataGroup | CodelistGroup | CodelistLiknage | linkageItem | HeaderName | Keysequence |
	| Question10   | Domain10 | Drop-Down             | DomainItem10      | --                  | --                    |                  | --        |               |                 |             |            |             |
	And I click on the "Forms" tab
	Then I should see the "Forms" page
#Create a form from existing with same study
Scenario: T20_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study1"
	And I click on the Link "FormName8"
	
Scenario: T25_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

#Create a  form from existing using different study
Scenario: T26_When I click on Create Form from Existing and select a different study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "Form1"
	

Scenario: T27_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName6 | FormLabel6 | TableName6 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T28_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T29_When I have same domain items but codelists are different then include button for codelist should be disabled
	When I change the domain items in source and target as unique
	Then I can edit the codelist
	And I edit the codelist to unique in source and target
	And I click on verify button 
	When I edit again the domain item to be same in source and target
	And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T30_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

Scenario:  T31_When User clicks on Home tab in the header then home tab should be displayed
 When I click on the "Home" tab
	Then I should see the "Home" page	
