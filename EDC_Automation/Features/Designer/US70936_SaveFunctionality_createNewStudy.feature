Feature: US70396_SaveFuotionality of create form from existing
	

Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

#Scenario: T02_When I create a study with the following details
#    When I click on the Home Button
#	When I click on the Link "Create New Study"	
#	And I enter study data details 
#	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                     | SafetyMapping |
#	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |
#	Then I should see the notification "Study has been successfully added" 
#	
#	
#
#Scenario:  T03_When I create the list of below mentioned codelists
#	When I click on the "Home" tab
#	When I click on the "Codelists" tab
#	And I click on the Link "Add Codelist"
#	And I enter CodelistName as "Codelist1"
#	And I enter CodelistDesc as "CodelistDesc"
#	And I click on the Codelist Save button	
#	And I should see the notification "Codelist1 has been successfully added"
#	And I click on the Link "Add Codelist"
#	And I enter CodelistName as "Codelist2"
#	And I enter CodelistDesc as "CodelistDesc2"
#	And I click on the Codelist Save button	
#	And  I should see the notification "Codelist2 has been successfully added"
#	And I click on the Link "Add Codelist"
#	And I enter CodelistName as "Codelist3"
#	And I enter CodelistDesc as "CodelistDesc3"
#	And I click on the Codelist Save button	
#	Then I should see the notification "Codelist3 has been successfully added"
#
#
#Scenario: T04_Create CodeLists and CodeLists Items
#	When Click on the Codelist "Codelist1"
#	And I add the below codelist items and I should see the successful notification message
#	| CodeListname | CodePrefix | CodeItemDesc  | CodeItemValue      |
#	| Codelist1    | 1          | CodelistItem1 | CodelistItemvalue1 |
#	And I click on the "Codelists" tab
#	And Click on the Codelist "Codelist2"
#	And I add the below codelist items and I should see the successful notification message
#	| CodeListname | CodePrefix | CodeItemDesc  | CodeItemValue      |
#	| Codelist2    | 2          | CodelistItem2 | CodelistItemvalue2 |
#	And I click on the "Codelists" tab
#	And Click on the Codelist "Codelist3"
#	Then I add the below codelist items and I should see the successful notification message
#	| CodeListname | CodePrefix | CodeItemDesc  | CodeItemValue      |
#	| Codelist3    | 3          | CodelistItem3 | CodelistItemvalue3 |
#
#	 
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T05_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain1" 
#	And enter DomainDesc as "Domain1"
#	And I click on the Domains Save button
#	And I should see the notification "Domain1 has been successfully added"
#	And Click on the Domain "Domain1"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  | maxlen |
#	| Item1    | EDC    | Text     | Codelist1 | 4      |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T06_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain2" 
#	And enter DomainDesc as "Domain2"
#	And I click on the Domains Save button
#	And I should see the notification "Domain2 has been successfully added"
#	And Click on the Domain "Domain2"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  | maxlen |
#	| Item2    | EDC    | Text     | Codelist2 | 6      |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T07_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain3" 
#	And enter DomainDesc as "Domain3"
#	And I click on the Domains Save button
#	And I should see the notification "Domain3 has been successfully added"
#	And Click on the Domain "Domain3"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  | maxlen |
#	| Item3    | EDC    | Text     | Codelist3 | 7      |
#
#Scenario: T08_Create a form which should have flat questions,table question and auto build table
#		When I click on the Home Button
#		And I click on the Link "Study1"
#		And I click on the "Forms" tab
#		When I click on the Link "Add Form"
#		And I enter the FormName as "Form1"
#		And I enter the Formlabel as "FormLabel1"
#		And I click on Form Save button
#		Then I should see the notification "Form1 has been successfully added" 
#
#Scenario: T09_Create a question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Question"
#	And I enter the Question Data as "Question1"
#	And I click on QuestionData Save button
#	Then I should see the notification "Question has been successfully added"
#
#Scenario: T10_Add the details to question
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Question1"
#	And I select Domain Name as "Domain1" in question
#	And select the Item name "Item1"
#	And I click on the Save button in question
#	Then I should see the notification " Question # 1. has been successfully updated"
#
#Scenario: T11_Create a table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter the Question Data as "TableName1"
#	And I click on QuestionData Save button
#	And I should see the notification "Table has been successfully added"
#	And I click on link Add Question in the "TableName1"
#	And I enter "TableQuestion1" as table question
#	And I click on QuestionData Save button in table question
#	Then I should see the notification " Table Question has been successfully added"
#
#
#
#Scenario: T12_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "TableName1"
#	And I enter the Domain "Domain2" in table name
#	And I Enter the tablename as "Table1"
#	And I enter the table prompt as "tableprompt1"
#	Then I click on "save & Next" button
#
#Scenario: T13_Add the details to the Table question
#	When select the Item name "Item2"
#	And I declare Header name as "Header1"
#	Then I click on "save" button
#
#	Scenario: T14_Create a table question in "Form1"
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter the Question Data as "AutoTableName"
#	And I click on QuestionData Save button
#	And I should see the notification "Table has been successfully added"
#	And I click on link Add Question in the "AutoTableName"
#	And I enter "AutoTableQuestion1" as table question
#	And I click on QuestionData Save button in table question
#	Then I should see the notification " Table Question has been successfully added"
#
#	Scenario: T15_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "AutoTableName"
#	And I enter the Domain "Domain3" in table name
#	And I Enter the tablename as "AutoTable1"
#	And I click on autobuild checkBox
#	And I enter the table prompt as "tableprompt1"
#	Then I click on "save & Next" button
#
#	Scenario: T16_Add the details to the Table question
#	When select the Item name "Item3"
#	And I declare Header name as "Header2"
#	And I enter the keySequence as "1"
#	Then I click on "save" button
#
#Scenario: T17_Pubilsh the study with the form created
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the Link "Publish Study"
#	And I see study publish dialog with title "Publish Study"
#	And Enter Label for study publish as "SourceStudy"
#	And I click on study publish continue button
#	Then I should see the status of the study "Study Publish (Study1: SourceStudy)" in "Complete" state

#Scenario: T18_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create Form from Existing"
#	And I switch to the frame of "CreateFromExistingDialog"
#	And I click on the Link "Study1"
#	And I click on the Link "Form1"
#	Then I switch out of frame

#Scenario: T19_Click on the Verify button and change form name, form label, table name
#    When I switch to the frame of "CreateFromExistingDialog"
#	And I click on Verify button in Create form from existing popup
#	And I switch out of frame
#	And I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	Then I switch out of frame
	

	
#Scenario: T20_When user click on save button and should see the form is saved successfully message
#	When I switch to the frame of "CreateFromExistingDialog"
#	#And I click on Verify button in Create form from existing popup
#	And I click on Save button in Create form from existing popup
#	And  I switch out of frame
#	Then I should see the notification " Form Form2 has been successfully created."
#
#Scenario: T21_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#	And I click on the Link "Question1"
#	And I should see the domain value as "Domain1"
#	And I should see the domain item as "Item1"
#	And I should see the codelist name as "Codelist1"
#	#And I should see the Header Name as ""
#	And I should see the KeySequence as "--"
#	Then I click on "save & Next" button
#
#Scenario: T22_when User clicks on form2 and verify the domain name,tableName,tablePrompt and also autobuild
#	When I should see the domain value as "Domain2" in table name
#	And I should see the table name as "Table2"
#	And I should see the table prompt as "TableName1"
#	And I should see the Autobuild checkbox is "unchecked"
#	Then I click on "save & Next" button
#
#
#Scenario: T23_when user is in the table question and verify the various fields
#	When I should see the domain value as "Domain2"
#	And I should see the domain item as "Item2"
#	And I should see the codelist name as "Codelist2"
#	And I should see the Header Name as "Header1"
#	And I should see the KeySequence as "--"
#	Then I click on "save & Next" button	
#
#Scenario: T24_when User clicks on form2 and verify the domain name,tableName,tablePrompt and also autobuild
#	When I should see the domain value as "Domain3" in table name
#	And I should see the table name as "Autobuild2"
#	And I should see the table prompt as "AutoTableName"
#	And I should see the Autobuild checkbox is "checked"
#	Then I click on "save & Next" button
#
#Scenario: T25_when user is in the table question and verify the various fields
#	When I should see the domain value as "Domain3"
#	And I should see the domain item as "Item3"
#	And I should see the codelist name as "Codelist3"
#	And I should see the Header Name as "Header2"
#	And I should see the KeySequence as "1"
#	Then I click on "save & Next" button

#Scenario: T26_When user is looking into the codelist tab and I should be seeing the following codelist
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Codelists" tab
#	And I see the link "Codelist1"
#	And I see the link "Codelist2"
#	And I see the link "Codelist3"
#	Then I switch out of frame


Scenario: T27_When user is looking into the Domains tab and I should be seeing the following Domains
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Domains" tab
	And I see the link "Domain1"
	And I see the link "Domain2"
	And I see the link "Domain3"
	Then I switch out of frame

Scenario: T28_When user is looking into the each Domain and I should be seeing the following Items
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Domains" tab
	And I click on the Link "Domain1"
	And I should see one of the item in the domain as 'Item1'
	And I click on the "Domains" tab
	And I click on the Link "Domain2"
	And I should see one of the item in the domain as 'Item2'
	And I click on the "Domains" tab
	And I click on the Link "Domain3"
	And I should see one of the item in the domain as 'Item3'
	Then I switch out of frame

Scenario: T29_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Forms" tab
	And I click on the Link "Create Form from Existing"
	And I switch to the frame of "CreateFromExistingDialog"
	And I click on the Link "Study1"
	And I click on the Link "Form1"
	Then I switch out of frame

Scenario: T30_Click on the Verify button and change form name, form label, table name
    When I switch to the frame of "CreateFromExistingDialog"
	And I click on Verify button in Create form from existing popup
	And I switch out of frame
	And I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form3      |
	| Form3      |
	| Table3     |
	| Autobuild3 |
	Then I switch out of frame

Scenario: T31_Click on the Verify button and change form name, form label, table name
    When I switch to the frame of "CreateFromExistingDialog"
	And I expand all the chevrons in the create form from existing
	



	
#
#
##Create a form from existing with new domain, domain item and codelist
#
#Scenario: T19_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T20_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form3      |
#	| Form3      |
#	| Table3     |
#	| Autobuild3 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T21_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item4"
#	And I change the codelist in the target as "Codelist4"
#	And I click on second Domain name 
#	And I change domain item to "Item5"
#	And I change the codelist in the target as "Codelist5"
#	And I click on domain item 3
#	And I click on Third domain name
#	And I change domain item to "Item6"
#	Then I change the codelist in the target as "Codelist6"
#	
#Scenario: T22_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form3 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form3"
#
#Scenario: T23_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item4      | Codelist4 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table3    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item5      | Codelist5 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild3 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item6      | Codelist6 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T24_I click on the domains tab and see the all the newly added domains and domain items
#	When I click on the "Domains" tab
#	And I click on the Link "Domain1"
#	Then I should be able to see the "Codelist4" mapped to item4
#	And I click on the "Domains" tab
#	And I click on the Link "Domain2"
#	Then I should be able to see the "Codelist5" mapped to "item5"
#	And I click on the "Domains" tab
#	And I click on the Link "Domain3"
#	Then I should be able to see the "Codelist6" mapped to "item6"
#
#Scenario: T25_When I click on codelist tab I should be able to see the newly added codelist items
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist4"
#	Then I should see the "Codelist1" in the codelist description
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist5"
#	Then I should see the "Codelist2" in the codelist description
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist6"
#	Then I should see the "Codelist3" in the codelist description
#
#	Scenario: T26_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T27_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	And I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T28_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T29_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T30_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
##verifing the scenarios for different study
#
#Scenario: T318787_when i click on create new study with target app as datalabs 5.6x or 5.7x then study should be added sucessfully
#	#When I click on the cancel button on the popup page
#	When I click breadcrumb item "Home"
#	And I click on the link "create new study"	
#	And I enter study details 
#	| studyname | studylabel  | protocol  | protocollabel  | protocoltitle | externalstudyid | studyphase | studydrugname | studyindication | therapeuticarea | sponsor  | targetapp                     | safetymapping |
#	| study2    | studylabel1 | protocol1 | protocoltitle1 | pt1           | exstuid         | phase1     | cal pol       | ind1            | allergy         | sponsor1 | datalabs 5.6x or 5.7x or 5.8x | not enabled   |		
#	When I click on the save button
#	Then I should see the notification "study has been successfully added"
#
#Scenario: T32_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T33_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T34_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T35_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T36_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T37_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T38_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T39_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T40_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
##Now delete the two studies
#Scenario: T41_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
#	When I click on the Cancel button on the popup page		
#	And I click breadcrumb item "Home"	
#	And I Search for the study in the studies list of Home page and delete the study
#	| StudyName |
#	| Study1    |
#	| Study2    |
#Then I should not see these studies in the Home page
#	| StudyName |
#	| Study1    |
#	| Study2    |
#
##upgraded study
#
#Scenario: T42_When I create a study with the following details
#    #When I click on the Home Button
#	When I click on the Link "Create New Study"	
#	And I enter study data details 
#	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor | TargetApp | SafetyMapping |
#	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 |  DataLabs 5.8x or greater | Not Enabled   |
#	And I should see the notification "Study has been successfully added" 
#	And I click on the Link "Study1"
#	And I click on the Link "View Study Jobs"
#	And I should see the status of the study "Study Verify (Study1)" in "Complete" state
#
#Scenario:  T43_When I create the list of below mentioned codelists
#	When I click on the "Home" tab
#	And I click on the "codelist" tab
#	And I click on link "Add Codelist"
#	Then I add the below codelist and save and I should see the successful notification message
#	| CodelistName | Codelist Description | SAS Format Name |
#	| Codelist1    | Codelist1            | Codelist1       |
#	| Codelist2    | Codelist2            | Codelist2       |
#	| Codelist3    | Codelist3            | Codelist3       |
#
#@ObjectiveEvidence @ReqID:US63653.64
#Scenario: T44_Create CodeLists and CodeLists Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Codelists Button
#	Then I add the below codelist items and I should see the successful notification message
#	| CodeListname | CodePrefix | CodeItemDesc | CodeItemValue |
#	| Codelist1    | 1          | Codelist1    | Codelist1     |
#	| Codelist2    | 2          | Codelist2    | Codelist2     |
#	| Codelist3    | 3          | Codelist3    | Codelist3     |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T45_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain1" 
#	And enter DomainDesc as "Domain1"
#	And I click on the Domains Save button
#	And I should see the notification "Domain1 has been successfully added"
#	And Click on the Domain "Domain1"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item1    | EDC    | Text     | Codelist1 |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T46_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain2" 
#	And enter DomainDesc as "Domain2"
#	And I click on the Domains Save button
#	And I should see the notification "Domain2 has been successfully added"
#	And Click on the Domain "Domain2"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item2    | EDC    | Text     | Codelist2 |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T47_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain3" 
#	And enter DomainDesc as "Domain3"
#	And I click on the Domains Save button
#	And I should see the notification "Domain3 has been successfully added"
#	And Click on the Domain "Domain3"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item3    | EDC    | Text     | Codelist3 |
#
#Scenario: T48_Create a form which has flat questions,table question and auto build table
#		When I click on the Home Button
#		And I click on the Link "Study1"
#		And I click on the "Forms" tab
#		And I click on the Link "Add Form"
#		Then I should  enter the below data for Creating form
#		| FormName | FormLabel  |
#		| Form1    | FormLabel1 |
#
#Scenario: T49_Create a question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Question"
#	And I enter "Question1" and save
#	Then I should see the notification "Question1 has been successfully added"
#
#Scenario: T50_Add the details to question
#	When I click on the Link "Question1"
#	And I select Domain Name as "Domain1"
#	And select the Item name "item1"
#	And I click on the Save button
#	Then I should see the notification "Question1 has been updated successfully"
#
#Scenario: T51_Create a table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter "TableName1" and save
#	Then I should see the notification "Table has been successfully added"
#	And I click on link "Add Question" in the "TableQuestion1"
#	And I enter "TableQuestion1"
#
#Scenario: T52_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Link "TableName1"
#	And I enter the Domain "Domain2" 
#	And I Enter the tablename as "Table1"
#	And I enter the table prompt as "tableprompt1"
#	Then I click on "save and Next" button
#
#Scenario: T53_Add the details to the Table question
#	When I click on the Dropdown Icon for the Domain
#	And I click on "Domain2" in the dropdown
#	And I click on the Dropdown Icon for the Item 
#	And I click On "Item2" in the dropdown
#	Then I click on "save" button
#
#Scenario: T54_Create a table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter "AutobuildTable1" and save
#	Then I should see the notification "Table has been successfully added"
#	And I click on link "Add Question" in the "AutobuildTable1"
#	And I enter "AutoBuildQuestion1"
#
#Scenario: T55_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Link "TableName2"
#	And I enter the Domain "Domain3" 
#	And I Enter the tablename as "Table2"
#	And I enter the table prompt as "tableprompt2"
#	And I click the checkbox of autobuild
#	Then I click on "save and Next" button
#
#Scenario: T56_Add the details to the Table question
#	When I click on the Dropdown Icon for the Domain
#	And I click on "Domain3" in the dropdown
#	And I click on the Dropdown Icon for the Item 
#	And I click On "Item3" in the dropdown
#	And I give the HeaderName as 'Header1'
#	And I click on keySequence dropdown
#	Then I select '1' in the dropdown
#	Then I click on "save" button
#
#Scenario: T57_Pubilsh the study with the form created
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the Link "Publish Study"
#	And I enter the publishLabel as "Study1"
#	And I click Continue button on the warning dialog
#
#Scenario: T58_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T59_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T60_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T61_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#
##Create a form from existing with new domain, domain item and codelist
#
#Scenario: T62_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T63_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form3      |
#	| Form3      |
#	| Table3     |
#	| Autobuild3 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T64_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item4"
#	And I change the codelist in the target as "Codelist4"
#	And I click on second Domain name 
#	And I change domain item to "Item5"
#	And I change the codelist in the target as "Codelist5"
#	And I click on domain item 3
#	And I click on Third domain name
#	And I change domain item to "Item6"
#	Then I change the codelist in the target as "Codelist6"
#	
#Scenario: T65_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form3 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form3"
#
#Scenario: T66_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item4      | Codelist4 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table3    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item5      | Codelist5 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild3 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item6      | Codelist6 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T67_I click on the domains tab and see the all the newly added domains and domain items
#	When I click on the "Domains" tab
#	And I click on the Link "Domain1"
#	Then I should be able to see the "Codelist4" mapped to item4
#	And I click on the "Domains" tab
#	And I click on the Link "Domain2"
#	Then I should be able to see the "Codelist5" mapped to "item5"
#	And I click on the "Domains" tab
#	And I click on the Link "Domain3"
#	Then I should be able to see the "Codelist6" mapped to "item6"
#
#Scenario: T68_When I click on codelist tab I should be able to see the newly added codelist items
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist4"
#	Then I should see the "Codelist1" in the codelist description
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist5"
#	Then I should see the "Codelist2" in the codelist description
#	And I click on the "Codelists" tab
#	And I click on the Link "Codelist6"
#	Then I should see the "Codelist3" in the codelist description
#
#	Scenario: T69_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T70_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T71_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T72_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T73_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
##verifing the scenarios for different study
#
#Scenario: T74_when i click on create new study with target app as datalabs 5.6x or 5.7x then study should be added sucessfully
#	When I click on the cancel button on the popup page
#	When I click breadcrumb item "Home"
#	And I click on the link "create new study"	
#	And I enter study details 
#	| studyname | studylabel  | protocol  | protocollabel  | protocoltitle | externalstudyid | studyphase | studydrugname | studyindication | therapeuticarea | sponsor  | targetapp                     | safetymapping |
#	| study2    | studylabel1 | protocol1 | protocoltitle1 | pt1           | exstuid         | phase1     | cal pol       | ind1            | allergy         | sponsor1 | datalabs 5.6x or 5.7x or 5.8x | not enabled   |		
#	When I click on the save button
#	Then I should see the notification "study has been successfully added"
#
#Scenario: T75_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T76_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T77_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T78_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T79_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T80_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T81_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T82_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T83_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
##Now delete the two studies
#Scenario: T84_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
#	When I click on the Cancel button on the popup page		
#	And I click breadcrumb item "Home"	
#	And I Search for the study in the studies list of Home page and delete the study
#	| StudyName |
#	| Study1    |
#	| Study2    |
#Then I should not see these studies in the Home page
#	| StudyName |
#	| Study1    |
#	| Study2    |
#
#
##import a lower version of study and do the verfication
#
#Scenario: T85_When I Import Study of 5.7 to Designer then I see message "Study has been successfully added" and status as complete
#    When I click on the Home Button
#	And I click on the Link "Import Study"
#	And I import a study "Import_1_US68936.zip" 
#	And Enter the unique study name "Import_Study1"
#	And Select the sponsor name "Sponsor1"
#	And I click on the Save button 	
#	And I should see the notification "Study has been successfully added"
#	And I click on the Link "View Study Jobs" 
#	Then I should see the status of the study "Study Import (Import_Study1)" in "Complete" state
#
#Scenario: T86_When I click on home tab I should be able to click on the study
#	When I click on the "Home" tab
#	And I click on the "Forms" tab
#	And I delete all the existing forms
#	And I click on the "Domains" tab
#	And I delete all the  domains
#	And I click on the "Codelists" tab
#	Then I delete all the codelists
#
#Scenario:  T09877_When I create the list of below mentioned codelists
#	When I click on the "Home" tab
#	And I click on the "codelist" tab
#	And I click on link "Add Codelist"
#	Then I add the below codelist and save and I should see the successful notification message
#	| CodelistName | Codelist Description | SAS Format Name |
#	| Codelist1    | Codelist1            | Codelist1       |
#	| Codelist2    | Codelist2            | Codelist2       |
#	| Codelist3    | Codelist3            | Codelist3       |
#
#@ObjectiveEvidence @ReqID:US63653.64
#Scenario: T46767_Create CodeLists and CodeLists Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Codelists Button
#	Then I add the below codelist items and I should see the successful notification message
#	| CodeListname | CodePrefix | CodeItemDesc | CodeItemValue |
#	| Codelist1    | 1          | Codelist1    | Codelist1     |
#	| Codelist2    | 2          | Codelist2    | Codelist2     |
#	| Codelist3    | 3          | Codelist3    | Codelist3     |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T057643_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain1" 
#	And enter DomainDesc as "Domain1"
#	And I click on the Domains Save button
#	And I should see the notification "Domain1 has been successfully added"
#	And Click on the Domain "Domain1"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item1    | EDC    | Text     | Codelist1 |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T06957_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain2" 
#	And enter DomainDesc as "Domain2"
#	And I click on the Domains Save button
#	And I should see the notification "Domain2 has been successfully added"
#	And Click on the Domain "Domain2"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item2    | EDC    | Text     | Codelist2 |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T078785_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain3" 
#	And enter DomainDesc as "Domain3"
#	And I click on the Domains Save button
#	And I should see the notification "Domain3 has been successfully added"
#	And Click on the Domain "Domain3"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item3    | EDC    | Text     | Codelist3 |
#
#Scenario: T088735_Create a form which should have flat questions,table question and auto build table
#		When I click on the Home Button
#		And I click on the Link "Study1"
#		And I click on the "Forms" tab
#		And I click on the Link "Add Form"
#		Then I should  enter the below data for Creating form
#		| FormName | FormLabel  |
#		| Form1    | FormLabel1 |
#
#Scenario: T090098354_Create a question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Question"
#	And I enter "Question1" and save
#	Then I should see the notification "Question1 has been successfully added"
#
#Scenario: T100035_Add the details to question
#	When I click on the Link "Question1"
#	And I select Domain Name as "Domain1"
#	And select the Item name "item1"
#	And I click on the Save button
#	Then I should see the notification "Question1 has been updated successfully"
#
#Scenario: T19351_Create a table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter "TableName1" and save
#	Then I should see the notification "Table has been successfully added"
#	And I click on link "Add Question" in the "TableQuestion1"
#	And I enter "TableQuestion1"
#
#Scenario: T128735_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Link "TableName1"
#	And I enter the Domain "Domain2" 
#	And I Enter the tablename as "Table1"
#	And I enter the table prompt as "tableprompt1"
#	Then I click on "save and Next" button
#
#Scenario: T13983_Add the details to the Table question
#	When I click on the Dropdown Icon for the Domain
#	And I click on "Domain2" in the dropdown
#	And I click on the Dropdown Icon for the Item 
#	And I click On "Item2" in the dropdown
#	Then I click on "save" button
#
#Scenario: T1177_Create a auto build table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter "AutobuildTable1" and save
#	Then I should see the notification "Table has been successfully added"
#	And I click on link "Add Question" in the "AutobuildTable1"
#	And I enter "AutoBuildQuestion1"
#
#Scenario: T126767_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Link "TableName2"
#	And I enter the Domain "Domain3" 
#	And I Enter the tablename as "Table2"
#	And I enter the table prompt as "tableprompt2"
#	And I click the checkbox of autobuild
#	Then I click on "save and Next" button
#
#Scenario: T136776_Add the details to the Table question
#	When I click on the Dropdown Icon for the Domain
#	And I click on "Domain3" in the dropdown
#	And I click on the Dropdown Icon for the Item 
#	And I click On "Item3" in the dropdown
#	And I give the HeaderName as 'Header1'
#	And I click on keySequence dropdown
#	Then I select '1' in the dropdown
#	Then I click on "save" button
#
#Scenario: T147878_Pubilsh the study with the form created
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the Link "Publish Study"
#	And I enter the publishLabel as "Study1"
#	And I click Continue button on the warning dialog
#
#Scenario: T15876_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T16775_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T17775_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T18668_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#
##Create a form from existing with new domain, domain item and codelist
#
#Scenario: T1868689_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T20934_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form3      |
#	| Form3      |
#	| Table3     |
#	| Autobuild3 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T21332423_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item4"
#	And I change the codelist in the target as "Codelist4"
#	And I click on second Domain name 
#	And I change domain item to "Item5"
#	And I change the codelist in the target as "Codelist5"
#	And I click on domain item 3
#	And I click on Third domain name
#	And I change domain item to "Item6"
#	Then I change the codelist in the target as "Codelist6"
#	
#Scenario: T22423_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form3 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form3"
#
#Scenario: T234322_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item4      | Codelist4 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table3    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item5      | Codelist5 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild3 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item6      | Codelist6 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T24342_I click on the domains tab and see the all the newly added domains and domain items
#	When I click on the "Domains" tab
#	And I click on the Link "Domain1"
#	Then I should be able to see the "Codelist4" mapped to item4
#	And I click on the "Domains" tab
#	And I click on the Link "Domain2"
#	Then I should be able to see the "Codelist5" mapped to "item5"
#	And I click on the "Domains" tab
#	And I click on the Link "Domain3"
#	Then I should be able to see the "Codelist6" mapped to "item6"
#
#Scenario: T25423_When I click on codelist tab I should be able to see the newly added codelist items
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist4"
#	Then I should see the "Codelist1" in the codelist description
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist5"
#	Then I should see the "Codelist2" in the codelist description
#	And I click on the "Codelists" tab
#	And I click on the Link "Codelist6"
#	Then I should see the "Codelist3" in the codelist description
#
#Scenario: T223426_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T272342_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	And I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T289843_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T299394_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T30iuiur_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
#Scenario: T31ee34_when i click on create new study with target app as datalabs 5.6x or 5.7x then study should be added sucessfully
#	When I click on the cancel button on the popup page
#	When I click breadcrumb item "Home"
#	And I click on the link "create new study"	
#	And I enter study details 
#	| studyname | studylabel  | protocol  | protocollabel  | protocoltitle | externalstudyid | studyphase | studydrugname | studyindication | therapeuticarea | sponsor  | targetapp                     | safetymapping |
#	| study2    | studylabel1 | protocol1 | protocoltitle1 | pt1           | exstuid         | phase1     | cal pol       | ind1            | allergy         | sponsor1 | datalabs 5.6x or 5.7x or 5.8x | not enabled   |		
#	When I click on the save button
#	Then I should see the notification "study has been successfully added"
#
#Scenario: T3222423_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T33432432_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T3443_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T35983_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T36uu34_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T37034_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T343348_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T32329_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T4320_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
#	Scenario: T80_When user tries to upgrade the study and open the study then upgraded study should be successfully opened
#      When I click on the Home Button
#	  And I select the Study "Import_Study1" from Home page
#	  And I click on the Settings drop Icon
#	  And I click on Target App and change the study to latest
#	  And I click on the Save button in Study Properties page
#	  And I click on the "Home" tab
#	  And I click on the Link "Import_Study1"
#	  Then I should see the "Study" page
#Scenario: T417784_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
#	When I click on the Cancel button on the popup page		
#	And I click breadcrumb item "Home"	
#	And I Search for the study in the studies list of Home page and delete the study
#	| StudyName |
#	| Study2    |
#	Then I should not see these studies in the Home page
#	| StudyName |
#	| Study2    |
#Scenario: T86886_When I click on home tab I should be able to click on the study
#	When I click on the "Home" tab
#	And I click on the "Forms" tab
#	And I delete all the existing forms
#	And I click on the "Domains" tab
#	And I delete all the  domains
#	And I click on the "Codelists" tab
#	Then I delete all the codelists
#
#Scenario:  T67575_When I create the list of below mentioned codelists
#	When I click on the "Home" tab
#	And I click on the "codelist" tab
#	And I click on link "Add Codelist"
#	Then I add the below codelist and save and I should see the successful notification message
#	| CodelistName | Codelist Description | SAS Format Name |
#	| Codelist1    | Codelist1            | Codelist1       |
#	| Codelist2    | Codelist2            | Codelist2       |
#	| Codelist3    | Codelist3            | Codelist3       |
#
#@ObjectiveEvidence @ReqID:US63653.64
#Scenario: T75576_Create CodeLists and CodeLists Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Codelists Button
#	Then I add the below codelist items and I should see the successful notification message
#	| CodeListname | CodePrefix | CodeItemDesc | CodeItemValue |
#	| Codelist1    | 1          | Codelist1    | Codelist1     |
#	| Codelist2    | 2          | Codelist2    | Codelist2     |
#	| Codelist3    | 3          | Codelist3    | Codelist3     |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T057558_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain1" 
#	And enter DomainDesc as "Domain1"
#	And I click on the Domains Save button
#	And I should see the notification "Domain1 has been successfully added"
#	And Click on the Domain "Domain1"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item1    | EDC    | Text     | Codelist1 |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T0699868_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain2" 
#	And enter DomainDesc as "Domain2"
#	And I click on the Domains Save button
#	And I should see the notification "Domain2 has been successfully added"
#	And Click on the Domain "Domain2"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item2    | EDC    | Text     | Codelist2 |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T0743546_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "Study1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain3" 
#	And enter DomainDesc as "Domain3"
#	And I click on the Domains Save button
#	And I should see the notification "Domain3 has been successfully added"
#	And Click on the Domain "Domain3"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item3    | EDC    | Text     | Codelist3 |
#
#Scenario: T088774_Create a form which should have flat questions,table question and auto build table
#		When I click on the Home Button
#		And I click on the Link "Study1"
#		And I click on the "Forms" tab
#		And I click on the Link "Add Form"
#		Then I should  enter the below data for Creating form
#		| FormName | FormLabel  |
#		| Form1    | FormLabel1 |
#
#Scenario: T09748934_Create a question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Question"
#	And I enter "Question1" and save
#	Then I should see the notification "Question1 has been successfully added"
#
#Scenario: T107975_Add the details to question
#	When I click on the Link "Question1"
#	And I select Domain Name as "Domain1"
#	And select the Item name "item1"
#	And I click on the Save button
#	Then I should see the notification "Question1 has been updated successfully"
#
#Scenario: T11799_Create a table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter "TableName1" and save
#	Then I should see the notification "Table has been successfully added"
#	And I click on link "Add Question" in the "TableQuestion1"
#	And I enter "TableQuestion1"
#
#Scenario: T1277944_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Link "TableName1"
#	And I enter the Domain "Domain2" 
#	And I Enter the tablename as "Table1"
#	And I enter the table prompt as "tableprompt1"
#	Then I click on "save and Next" button
#
#Scenario: T13779834_Add the details to the Table question
#	When I click on the Dropdown Icon for the Domain
#	And I click on "Domain2" in the dropdown
#	And I click on the Dropdown Icon for the Item 
#	And I click On "Item2" in the dropdown
#	Then I click on "save" button
#
#Scenario: T1141234_Create a auto build table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter "AutobuildTable1" and save
#	Then I should see the notification "Table has been successfully added"
#	And I click on link "Add Question" in the "AutobuildTable1"
#	And I enter "AutoBuildQuestion1"
#
#Scenario: T12434_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Link "TableName2"
#	And I enter the Domain "Domain3" 
#	And I Enter the tablename as "Table2"
#	And I enter the table prompt as "tableprompt2"
#	And I click the checkbox of autobuild
#	Then I click on "save and Next" button
#
#Scenario: T1332423_Add the details to the Table question
#	When I click on the Dropdown Icon for the Domain
#	And I click on "Domain3" in the dropdown
#	And I click on the Dropdown Icon for the Item 
#	And I click On "Item3" in the dropdown
#	And I give the HeaderName as 'Header1'
#	And I click on keySequence dropdown
#	Then I select '1' in the dropdown
#	Then I click on "save" button
#
#Scenario: T1432423_Pubilsh the study with the form created
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the Link "Publish Study"
#	And I enter the publishLabel as "Study1"
#	And I click Continue button on the warning dialog
#
#Scenario: T153423_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T163423_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T17_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T18_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#
##Create a form from existing with new domain, domain item and codelist
#
#Scenario: T1985_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T20777943_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form3      |
#	| Form3      |
#	| Table3     |
#	| Autobuild3 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T218443_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item4"
#	And I change the codelist in the target as "Codelist4"
#	And I click on second Domain name 
#	And I change domain item to "Item5"
#	And I change the codelist in the target as "Codelist5"
#	And I click on domain item 3
#	And I click on Third domain name
#	And I change domain item to "Item6"
#	Then I change the codelist in the target as "Codelist6"
#	
#Scenario: T22877_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form3 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form3"
#
#Scenario: T2355_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item4      | Codelist4 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table3    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item5      | Codelist5 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild3 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item6      | Codelist6 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T243546_I click on the domains tab and see the all the newly added domains and domain items
#	When I click on the "Domains" tab
#	And I click on the Link "Domain1"
#	Then I should be able to see the "Codelist4" mapped to item4
#	And I click on the "Domains" tab
#	And I click on the Link "Domain2"
#	Then I should be able to see the "Codelist5" mapped to "item5"
#	And I click on the "Domains" tab
#	And I click on the Link "Domain3"
#	Then I should be able to see the "Codelist6" mapped to "item6"
#
#Scenario: T25778_When I click on codelist tab I should be able to see the newly added codelist items
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist4"
#	Then I should see the "Codelist1" in the codelist description
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist5"
#	Then I should see the "Codelist2" in the codelist description
#	And I click on the "Codelists" tab
#	And I click on the Link "Codelist6"
#	Then I should see the "Codelist3" in the codelist description
#
#	Scenario: T26878_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T277667_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	And I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T287935_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T2234239_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T304233_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
#Scenario: T3144223_when i click on create new study with target app as datalabs 5.6x or 5.7x then study should be added sucessfully
#	When I click on the cancel button on the popup page
#	When I click breadcrumb item "Home"
#	And I click on the link "create new study"	
#	And I enter study details 
#	| studyname | studylabel  | protocol  | protocollabel  | protocoltitle | externalstudyid | studyphase | studydrugname | studyindication | therapeuticarea | sponsor  | targetapp                     | safetymapping |
#	| study2    | studylabel1 | protocol1 | protocoltitle1 | pt1           | exstuid         | phase1     | cal pol       | ind1            | allergy         | sponsor1 | datalabs 5.6x or 5.7x or 5.8x | not enabled   |		
#	When I click on the save button
#	Then I should see the notification "study has been successfully added"
#
#Scenario: T323423_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T33242_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T3423423_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T354234_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T363423_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "study1"
#	And I click on the Link "Form1"
#
#Scenario: T373423_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T38987945_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T3877439_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T487350_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
#	Scenario: T41778_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
#	When I click on the Cancel button on the popup page		
#	And I click breadcrumb item "Home"	
#	And I Search for the study in the studies list of Home page and delete the study
#	| StudyName     |
#	| Import_Study1 |
#	| Study2        |
#Then I should not see these studies in the Home page
#	| StudyName     |
#	| Import_Study1 |
#	| Study2        |
#
#Scenario: T09_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x then study should be added sucessfully
#	When I click on the Cancel button on the popup page
#	When I click breadcrumb item "Home"
#	And I click on the Link "Create New Study"	
#	And I enter study details 
#	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                     | SafetyMapping |
#	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |		
#	When I click on the Save button
#	Then I should see the notification "Study has been successfully added"
#
##Create a study from existing ie.,from above created study and do validation as once updated  then we cannot degrade
#Scenario: T32_When I click on Create Study from Existing and Study should be created with given name
#	When I click on the Cancel button on the popup page	
#	And I click breadcrumb item "Home"
#	And I see Designer Home Page
#	And I click on the Link "Create Study from Existing"	
#	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"
#	And I Search for the study in the studies list of Create Study from Existing  and click on the study
#	| StudyName |
#	| Study1    |
#	And Enter the unique study name "CreatedStudy1"
#	And I click on the Save button
#	Then I should see the notification "Study has been successfully added"
#
#Scenario: T4188_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
#	When I click on the Cancel button on the popup page		
#	And I click breadcrumb item "Home"	
#	And I Search for the study in the studies list of Home page and delete the study
#	| StudyName |
#	| Study1    |	
#Then I should not see these studies in the Home page
#	| StudyName |
#	| Study1    |
#
#Scenario:  T8786_When I create the list of below mentioned codelists
#	When I click on the "Home" tab
#	And I click on the "codelist" tab
#	And I click on link "Add Codelist"
#	Then I add the below codelist and save and I should see the successful notification message
#	| CodelistName | Codelist Description | SAS Format Name |
#	| Codelist1    | Codelist1            | Codelist1       |
#	| Codelist2    | Codelist2            | Codelist2       |
#	| Codelist3    | Codelist3            | Codelist3       |
#
#@ObjectiveEvidence @ReqID:US63653.64
#Scenario: T43234_Create CodeLists and CodeLists Items
#	When I click on the Home Button
#	And I click on the Link "CreatedStudy1"
#	And I click on the Codelists Button
#	Then I add the below codelist items and I should see the successful notification message
#	| CodeListname | CodePrefix | CodeItemDesc | CodeItemValue |
#	| Codelist1    | 1          | Codelist1    | Codelist1     |
#	| Codelist2    | 2          | Codelist2    | Codelist2     |
#	| Codelist3    | 3          | Codelist3    | Codelist3     |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T053424_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "CreatedStudy1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain1" 
#	And enter DomainDesc as "Domain1"
#	And I click on the Domains Save button
#	And I should see the notification "Domain1 has been successfully added"
#	And Click on the Domain "Domain1"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item1    | EDC    | Text     | Codelist1 |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T06935_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "CreatedStudy1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain2" 
#	And enter DomainDesc as "Domain2"
#	And I click on the Domains Save button
#	And I should see the notification "Domain2 has been successfully added"
#	And Click on the Domain "Domain2"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item2    | EDC    | Text     | Codelist2 |
#
#@ObjectiveEvidence @ReqID:US63653.49
#Scenario: T07ur0943_Create Domain and Domain Items
#	When I click on the Home Button
#	And I click on the Link "CreatedStudy1"
#	And I click on the Domains Button
#	And I Click on "Add Domain" to add new Domain
#	And enter DomainName as "Domain3" 
#	And enter DomainDesc as "Domain3"
#	And I click on the Domains Save button
#	And I should see the notification "Domain3 has been successfully added"
#	And Click on the Domain "Domain3"
#	Then I enter domain item details and each time when i add a new record success message should be displayed 
#	| ItemName | Source | Datatype | Codelist  |
#	| Item3    | EDC    | Text     | Codelist3 |
#
#Scenario: T088743_Create a form which should have flat questions,table question and auto build table
#		When I click on the Home Button
#		And I click on the Link "CreatedStudy1"
#		And I click on the "Forms" tab
#		And I click on the Link "Add Form"
#		Then I should  enter the below data for Creating form
#		| FormName | FormLabel  |
#		| Form1    | FormLabel1 |
#
#Scenario: T09808_Create a question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Question"
#	And I enter "Question1" and save
#	Then I should see the notification "Question1 has been successfully added"
#
#Scenario: T108953_Add the details to question
#	When I click on the Link "Question1"
#	And I select Domain Name as "Domain1"
#	And select the Item name "item1"
#	And I click on the Save button
#	Then I should see the notification "Question1 has been updated successfully"
#
#Scenario: T119895_Create a table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter "TableName1" and save
#	Then I should see the notification "Table has been successfully added"
#	And I click on link "Add Question" in the "TableQuestion1"
#	And I enter "TableQuestion1"
#
#Scenario: T12774_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Link "TableName1"
#	And I enter the Domain "Domain2" 
#	And I Enter the tablename as "Table1"
#	And I enter the table prompt as "tableprompt1"
#	Then I click on "save and Next" button
#
#Scenario: T1342_Add the details to the Table question
#	When I click on the Dropdown Icon for the Domain
#	And I click on "Domain2" in the dropdown
#	And I click on the Dropdown Icon for the Item 
#	And I click On "Item2" in the dropdown
#	Then I click on "save" button
#
#Scenario: T11434_Create a auto build table question in "Form1"
#	When I click on the "Forms" tab
#	And I click on the Link "Form1"
#	And I click on the Link "Add Table"
#	And I enter "AutobuildTable1" and save
#	Then I should see the notification "Table has been successfully added"
#	And I click on link "Add Question" in the "AutobuildTable1"
#	And I enter "AutoBuildQuestion1"
#
#Scenario: T1294_Allot the domain name, Table Name and table prompt and save it
#	When I click on the Link "TableName2"
#	And I enter the Domain "Domain3" 
#	And I Enter the tablename as "Table2"
#	And I enter the table prompt as "tableprompt2"
#	And I click the checkbox of autobuild
#	Then I click on "save and Next" button
#
#Scenario: T1398894_Add the details to the Table question
#	When I click on the Dropdown Icon for the Domain
#	And I click on "Domain3" in the dropdown
#	And I click on the Dropdown Icon for the Item 
#	And I click On "Item3" in the dropdown
#	And I give the HeaderName as 'Header1'
#	And I click on keySequence dropdown
#	Then I select '1' in the dropdown
#	Then I click on "save" button
#
#Scenario: T14422_Pubilsh the study with the form created
#	When I click on the "Home" tab
#	And I click on the Link "CreatedStudy1"
#	And I click on the Link "Publish Study"
#	And I enter the publishLabel as "CreatedStudy1"
#	And I click Continue button on the warning dialog
#
#Scenario: T152243_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "CreatedStudy1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "CreatedStudy1"
#	And I click on the Link "Form1"
#
#Scenario: T164535_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T174435_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T1842323_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#
##Create a form from existing with new domain, domain item and codelist
#
#Scenario: T198734_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "CreatedStudy1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "CreatedStudy1"
#	And I click on the Link "Form1"
#
#Scenario: T2098943_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form3      |
#	| Form3      |
#	| Table3     |
#	| Autobuild3 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T21853_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item4"
#	And I change the codelist in the target as "Codelist4"
#	And I click on second Domain name 
#	And I change domain item to "Item5"
#	And I change the codelist in the target as "Codelist5"
#	And I click on domain item 3
#	And I click on Third domain name
#	And I change domain item to "Item6"
#	Then I change the codelist in the target as "Codelist6"
#	
#Scenario: T228787_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form3 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form3"
#
#Scenario: T239985_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item4      | Codelist4 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table3    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item5      | Codelist5 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild3 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item6      | Codelist6 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T248787_I click on the domains tab and see the all the newly added domains and domain items
#	When I click on the "Domains" tab
#	And I click on the Link "Domain1"
#	Then I should be able to see the "Codelist4" mapped to item4
#	And I click on the "Domains" tab
#	And I click on the Link "Domain2"
#	Then I should be able to see the "Codelist5" mapped to "item5"
#	And I click on the "Domains" tab
#	And I click on the Link "Domain3"
#	Then I should be able to see the "Codelist6" mapped to "item6"
#
#Scenario: T2588_When I click on codelist tab I should be able to see the newly added codelist items
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist4"
#	Then I should see the "Codelist1" in the codelist description
#	When I click on the "Codelists" tab
#	And I click on the Link "Codelist5"
#	Then I should see the "Codelist2" in the codelist description
#	And I click on the "Codelists" tab
#	And I click on the Link "Codelist6"
#	Then I should see the "Codelist3" in the codelist description
#
#	Scenario: T287686_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "CreatedStudy1"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "CreatedStudy1"
#	And I click on the Link "Form1"
#
#Scenario: T277989_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	And I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T28668_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T29668_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T306688_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
##verifing the scenarios for different study
#
#Scenario: T31_when i click on create new study with target app as datalabs 5.6x or 5.7x then study should be added sucessfully
#	When I click on the cancel button on the popup page
#	When I click breadcrumb item "Home"
#	And I click on the link "create new study"	
#	And I enter study details 
#	| studyname | studylabel  | protocol  | protocollabel  | protocoltitle | externalstudyid | studyphase | studydrugname | studyindication | therapeuticarea | sponsor  | targetapp                     | safetymapping |
#	| study2    | studylabel1 | protocol1 | protocoltitle1 | pt1           | exstuid         | phase1     | cal pol       | ind1            | allergy         | sponsor1 | datalabs 5.6x or 5.7x or 5.8x | not enabled   |		
#	When I click on the save button
#	Then I should see the notification "study has been successfully added"
#
#Scenario: T327943_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "CreatedStudy1"
#	And I click on the Link "Form1"
#
#Scenario: T337984_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form2      |
#	| Form2      |
#	| Table2     |
#	| Autobuild2 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#
#Scenario: T347667_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form2 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form2"
#
#Scenario: T35894_When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist  |
#	| Domain1 | Item1      | Codelist1 |
#	And I click on "Save & Next" button 
#	And I should see following details for the table
#	| Domain  | TableName | TablePrompt  | AutobuildStatus |
#	| Domain2 | Table2    | tableprompt1 | NO              |
#	And I click on "Save & Next" button 
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  |
#	| Domain2 | Item2      | Codelist2 |
#	And I click on "save & next" button
#	And I should see following details for the auto build table
#	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
#	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
#	And I click on "save & next" button
#	And I should be able to see the following details for the table question
#	| Domain  | DomainItem | Codelist  | HeaderName | KeySequence |
#	| Domain3 | Item3      | Codelist3 | Header1    | 1           |
#	And I click on Form Save button
#
#Scenario: T368894_Click on create form from existing with same study
#	When I click on the "Home" tab
#	And I click on the Link "Study2"
#	And I click on the "Forms" tab
#	And I click on the Link "Create form from existing"
#	And I click on the Link "CreatedStudy1"
#	And I click on the Link "Form1"
#
#Scenario: T377784_Click on the Verify button and change form name, form label, table name
#	When I click on verify button
#	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
#	| Target1    |
#	| Form4      |
#	| Form4      |
#	| Table4     |
#	| Autobuild4 |
#	And I click on Verify button		
#	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
#	And User should not see the error message "Form label must be unique" for the field "Form Label:"
#	And User should not see the error message "Form name must be unique" for the field "Table Name:"
#	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
#	
#Scenario: T39848_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
#	When I change first domain item to "Item7"
#	And I change the codelist in the target as "Codelist7"
#	Then I uncheck the checkbox of  codelist
#	
#	Scenario: T39898944_When user click on save button and should see the form is saved successfully message
#	When I click on Form Save button
#	And I should see the notification "Form4 has been successfully added" 
#	And I click on the "Forms" tab
#	And I click on the Link "Form4"
#
#	Scenario: T40_868When User clicks on form2 and verify the domain,domain item and codelist mappings
#	When I click on the Link "Question1"
#	And I should  be able to see the following details
#	| Domain  | DomainItem | Codelist     |
#	| Domain1 | Item7      | <unassigned> |
#
#Scenario: T93_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
#	When I click on the Cancel button on the popup page		
#	And I click breadcrumb item "Home"	
#	And I Search for the study in the studies list of Home page and delete the study
#	| StudyName      |
#	| CreatedStudy_1 |
#	| Study1         |
#Then I should not see these studies in the Home page
#	| StudyName      |
#	| CreatedStudy_1 |
#	| Study1         |