Feature: CreateFormFromExisting_UI_Changes	
	Test Summary:
	User shall be able to see Verify button before Save button.
User shall be able to see message as "Use existing will be performed if there are same components" with orange background above grid. Refer mock up.
User shall be able to see Components Label with the message "Exists in Target" with orange background above grid.

@ObjectiveEvidence @ReqID:US68936.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_1_US68936.zip" 
	And Enter the unique study name "Import_Study1"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Study1)" in "Complete" state

Scenario: T03_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	


Scenario: T04_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "Form1"		
	#Then user should see Verify button before the save button
	Then user should see Verify button before the save button at the bottom of the pop up window
	And user should see Verify button before the save button at the top of the pop up window
	And user should see the message "Component(s)"  
	And user should see the message "Exist(s) in active study" with orange background above grid
	And User shall be able to see the message "Active study components will be used if they are not renamed." with Orange color text above the table

Scenario: T05_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x or 5.8x then study should be added sucessfully
	When I click on the Cancel button on the popup page
	When I click breadcrumb item "Home"
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                     | SafetyMapping |
	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |		
	When I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T06_When user adds the study and open then the study page should be displayed
	When I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study1    |
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
	| Codelist1    | 2          | CodelistItem2 | CodelistItemvalue2 |

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

Scenario: T16_When I click on Create Form from Existing and select the different study 
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study1"
	And I click on the Link "Form1"	
	Then user should see Verify button before the save button
	Then user should see Verify button before the save button at the bottom of the pop up window
	And user should see Verify button before the save button at the top of the pop up window
	And user should see the message "Component(s)"  
	And user should see the message "Exist(s) in active study" with orange background above grid
	And User shall be able to see the message "Active study components will be used if they are not renamed." with Orange color text above the table

Scenario: T17_When I click on Create Form from Existing and select the different study
	When I click on the Cancel button on the popup page	
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName |
	| Study1    |
	And Enter the unique study name "Study3"
	And I click on the Save button
	Then I should see the notification "Study has been successfully added"
	
Scenario: T18_When I click on Create Form from Existing and select the different study 
	When I click on the Link "View Study Jobs"
	Then I should see the status of the study "Create Study (Study3)" in "Complete" state

Scenario: T19_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page

Scenario: T20_When I click on Create Form from Existing and select the different study 	
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study3"
	And I click on the Link "Form1"	
	Then user should see Verify button before the save button
	Then user should see Verify button before the save button at the bottom of the pop up window
	And user should see Verify button before the save button at the top of the pop up window
	And user should see the message "Component(s)"  
	And user should see the message "Exist(s) in active study" with orange background above grid
	And User shall be able to see the message "Active study components will be used if they are not renamed." with Orange color text above the table

Scenario: T21_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
	When I click on the Cancel button on the popup page		
	And I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName     |
	| Import_Study1 |
	| Study1        |
	| Study3        |
Then I should not see these studies in the Home page
	| StudyName     |
	| Import_Study1 |
	| Study1        |
	| Study3        |
	






