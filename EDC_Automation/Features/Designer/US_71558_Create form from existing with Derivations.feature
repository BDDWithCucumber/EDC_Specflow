Feature: US_71558_Create form from existing with Derivations
	Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I create a study with the following details
	When I click on the Link "Create New Study"	
	And I enter study data details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor | TargetApp | SafetyMapping |
	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 |datalabs 5.6x or 5.7x or 5.8x | Not Enabled   |
	And I should see the notification "Study has been successfully added" 
	And I click on the Link "Study1"
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Study Verify (Study1)" in "Complete" state

Scenario: T0398897_create a Derivation in the scripting tab
	When I click on the "Scripting" tab
	And I click on the Link "Add Derivation"
	Then I give the following details and create the derivation by saving it
	| Derivation  | Description |
	| Derivation1 | Derivation1 |
	
	
Scenario: T0434432_Assign Parameters to the Derivation
	When I click on the "Scripting" tab
	And I click on the Link "Derivation1"
	And I click on the Link "Add Parameter"
	And I give parameter Name as "Parameter1"
	And  I give the reference of parameter as "Data.Unscheduled.Conditional2.Cond2Table1.C2_Question1.DataType"
	Then I click on the Save button

Scenario:  T057575_Create a test case for the derivation
	When I click on the "TestCases" tab
	And I click on "Add Test Case" and add the  following details
	| Name      | Description | Expected Result |
	| TestCase1 | TestCase1   | 04/30/1975      |
	And I click on the Save button

Scenario: T0300_create a Derivation in the scripting tab
	When I click on the "Scripting" tab
	And I click on the Link "Add Derivation"
	Then I give the following details and create the derivation by saving it
	| Derivation  | Description |
	| Derivation2 | Derivation2 |
	
	
Scenario: T0422311_Assign Parameters to the Derivation
	When I click on the "Scripting" tab
	And I click on the Link "Derivation2"
	And I click on the Link "Add Parameter"
	And I give parameter Name as "Parameter2"
	And  I give the reference of parameter as "Data.Unscheduled.Conditional2.Cond2Table1.C2_Question1.DataType"
	Then I click on the Save button

Scenario:  T05884_Create a test case for the derivation
	When I click on the "TestCases" tab
	And I click on "Add Test Case" and add the  following details
	| Name      | Description | Expected Result |
	| TestCase2 | TestCase2   | 04/30/1975      |
	And I click on the Save button

Scenario: T03099_create a Derivation in the scripting tab
	When I click on the "Scripting" tab
	And I click on the Link "Add Derivation"
	Then I give the following details and create the derivation by saving it
	| Derivation  | Description |
	| Derivation3 | Derivation3 |
	
	
Scenario: T0499_Assign Parameters to the Derivation
	When I click on the "Scripting" tab
	And I click on the Link "Derivation3"
	And I click on the Link "Add Parameter"
	And I give parameter Name as "Parameter3"
	And  I give the reference of parameter as "Data.Unscheduled.Conditional2.Cond2Table1.C2_Question1.DataType"
	Then I click on the Save button

Scenario:  T0588_Create a test case for the derivation
	When I click on the "TestCases" tab
	And I click on "Add Test Case" and add the  following details
	| Name      | Description | Expected Result |
	| TestCase3 | TestCase3   | 04/30/1975      |
	And I click on the Save button


Scenario: T06_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Study1"
	And I click on the Domains Button
	And I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain1" 
	And enter DomainDesc as "Domain1"
	And I click on the Domains Save button
	And I should see the notification "Domain1 has been successfully added"
	And Click on the Domain "Domain1"
	Then I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName | Source  | Datatype | Derivation  |
	| Item1    | Derived | Text     | Derivation1 |

Scenario: T06858_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Study1"
	And I click on the Domains Button
	And I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain2" 
	And enter DomainDesc as "Domain2"
	And I click on the Domains Save button
	And I should see the notification "Domain2 has been successfully added"
	And Click on the Domain "Domain2"
	Then I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName | Source  | Datatype | Derivation  |
	| Item2    | Derived | Text     | Derivation2 |

Scenario: T0612121_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Study1"
	And I click on the Domains Button
	And I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain3" 
	And enter DomainDesc as "Domain3"
	And I click on the Domains Save button
	And I should see the notification "Domain3 has been successfully added"
	And Click on the Domain "Domain3"
	Then I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName | Source  | Datatype | Derivation  |
	| Item3    | Derived | Text     | Derivation3 |

Scenario: T08_Create a form which should have flat questions,table question and auto build table
		When I click on the Home Button
		And I click on the Link "Study1"
		And I click on the "Forms" tab
		And I click on the Link "Add Form"
		Then I should  enter the below data for Creating form
		| FormName | FormLabel  |
		| Form1    | FormLabel1 |

Scenario: T09009_Create a question in "Form1"
	When I click on the "Forms" tab
	And I click on the Link "Form1"
	And I click on the Link "Add Question"
	And I enter "Question1" and save
	Then I should see the notification "Question1 has been successfully added"

Scenario: T109882_Add the details to question
	When I click on the Link "Question1"
	And I select Domain Name as "Domain1"
	And select the Item name "item1"
	And I click on the Save button
	Then I should see the notification "Question1 has been updated successfully"

Scenario: T11456_Create a table question in "Form1"
	When I click on the "Forms" tab
	And I click on the Link "Form1"
	And I click on the Link "Add Table"
	And I enter "TableName1" and save
	Then I should see the notification "Table has been successfully added"
	And I click on link "Add Question" in the "TableQuestion1"
	And I enter "TableQuestion1"

Scenario: T122_Allot the domain name, Table Name and table prompt and save it
	When I click on the Link "TableName1"
	And I enter the Domain "Domain2" 
	And I Enter the tablename as "Table1"
	And I enter the table prompt as "tableprompt1"
	Then I click on "save and Next" button

Scenario: T13_Add the details to the Table question
	When I click on the Dropdown Icon for the Domain
	And I click on "Domain2" in the dropdown
	And I click on the Dropdown Icon for the Item 
	And I click On "Item2" in the dropdown
	Then I click on "save" button

Scenario: T113434_Create a auto build table question in "Form1"
	When I click on the "Forms" tab
	And I click on the Link "Form1"
	And I click on the Link "Add Table"
	And I enter "AutobuildTable1" and save
	Then I should see the notification "Table has been successfully added"
	And I click on link "Add Question" in the "AutobuildTable1"
	And I enter "AutoBuildQuestion1"

Scenario: T123_Allot the domain name, Table Name and table prompt and save it
	When I click on the Link "TableName2"
	And I enter the Domain "Domain3" 
	And I Enter the tablename as "Table2"
	And I enter the table prompt as "tableprompt2"
	And I click the checkbox of autobuild
	Then I click on "save and Next" button

Scenario: T1323_Add the details to the Table question
	When I click on the Dropdown Icon for the Domain
	And I click on "Domain3" in the dropdown
	And I click on the Dropdown Icon for the Item 
	And I click On "Item3" in the dropdown
	And I give the HeaderName as 'Header1'
	And I click on keySequence dropdown
	Then I select '1' in the dropdown
	Then I click on "save" button

Scenario: T14_Pubilsh the study with the form created
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the Link "Publish Study"
	And I enter the publishLabel as "Study1"
	And I click Continue button on the warning dialog

Scenario: T1577_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T1653_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form2      |
	| Form2      |
	| Table2     |
	| Autobuild2 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"

Scenario: T1712_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form2 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form2"

Scenario: T18_When User clicks on form2 and verify the domain,domain item and derivations mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Derivation   |
	| Domain1 | Item1      | Derivattion1 |
	And I click on "Save & Next" button 
	And I should see following details for the table
	| Domain  | TableName | TablePrompt  | AutobuildStatus |
	| Domain2 | Table2    | tableprompt1 | NO              |
	And I click on "Save & Next" button 
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  |
	| Domain2 | Item2      | Derivation2 |
	And I click on "save & next" button
	And I should see following details for the auto build table
	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
	And I click on "save & next" button
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  | HeaderName | KeySequence |
	| Domain3 | Item3      | Derivation3 | Header1    | 1           |
	And I click on Form Save button

#Create a form from existing with new domain, domain item and derivations

Scenario: T19_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T20_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form3      |
	| Form3      |
	| Table3     |
	| Autobuild3 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"

Scenario: T21_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
	When I change first domain item to "Item4"
	And I change the derivation in the target as "derivation4"
	And I click on second Domain name 
	And I change domain item to "Item5"
	And I change the derivation in the target as "derivation5"
	And I click on domain item 3
	And I click on Third domain name
	And I change domain item to "Item6"
	Then I change the derivation in the target as "derivation6"
	
Scenario: T22_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form3 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form3"

Scenario: T23_When User clicks on form2 and verify the domain,domain item and codelist mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Derivation  |
	| Domain1 | Item4      | Derivation4 |
	And I click on "Save & Next" button 
	And I should see following details for the table
	| Domain  | TableName | TablePrompt  | AutobuildStatus |
	| Domain2 | Table3    | tableprompt1 | NO              |
	And I click on "Save & Next" button 
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  |
	| Domain2 | Item5      | Derivation5 |
	And I click on "save & next" button
	And I should see following details for the auto build table
	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
	| Domain3 | Autobuild3 | tableprompt2 | Yes             |
	And I click on "save & next" button
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  | HeaderName | KeySequence |
	| Domain3 | Item6      | Derivation6 | Header1    | 1           |
	And I click on Form Save button

Scenario: T24_I click on the domains tab and see the all the newly added domains and domain items
	When I click on the "Domains" tab
	And I click on the Link "Domain1"
	Then I should be able to see the "Derivation4" mapped to item4
	And I click on the "Domains" tab
	And I click on the Link "Domain2"
	Then I should be able to see the "Derivation5" mapped to "item5"
	And I click on the "Domains" tab
	And I click on the Link "Domain3"
	Then I should be able to see the "Derivation6" mapped to "item6"

Scenario: T25_When I click on codelist tab I should be able to see the newly added Derivation items
	When I click on the "Scripting" tab
	And I click on the "Derivation" tab
	And I click on the Link "Derivation4"
	And I should see the "Parameter1" in the parameter tab
	And I should see reference number as not null
	And I click on the "Scripting" tab
	And I should see the text "AB_Constant_Date = "04/30/1975"
	And I click on the "TestCases" tab
	Then I should see "TestCase1" 

	Scenario: T25985_When I click on codelist tab I should be able to see the newly added Derivation items
	When I click on the "Scripting" tab
	And I click on the "Derivation" tab
	And I click on the Link "Derivation5"
	And I should see the "Parameter1" in the parameter tab
	And I should see reference number as not null
	And I click on the "Scripting" tab
	And I should see the text "AB_Constant_Date = "04/30/1975"
	And I click on the "TestCases" tab
	Then I should see "TestCase1" 

Scenario: T25857_When I click on codelist tab I should be able to see the newly added Derivation items
	When I click on the "Scripting" tab
	And I click on the "Derivation" tab
	And I click on the Link "Derivation6"
	And I should see the "Parameter1" in the parameter tab
	And I should see reference number as not null
	And I click on the "Scripting" tab
	And I should see the text "AB_Constant_Date = "04/30/1975"
	And I click on the "TestCases" tab
	Then I should see "TestCase1" 

	Scenario: T26_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T27_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	And I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form4      |
	| Form4      |
	| Table4     |
	| Autobuild4 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
	
Scenario: T28_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
	When I change first domain item to "Item7"
	And I change the derivation in the target as "Derivation7"
	Then I uncheck the checkbox of Derivation
	
	Scenario: T29_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form4 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form4"

	Scenario: T30_When User clicks on form2 and verify the domain,domain item and codelist mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Derivation   |
	| Domain1 | Item7      | <unassigned> |

#verifing the scenarios for different study
Scenario: T31_when I click on create new study with target app as datalabs 5.6x or 5.7x then study should be added sucessfully
	When I click on the cancel button on the popup page
	When I click breadcrumb item "Home"
	And I click on the link "create new study"	
	And I enter study details 
	| studyname | studylabel  | protocol  | protocollabel  | protocoltitle | externalstudyid | studyphase | studydrugname | studyindication | therapeuticarea | sponsor  | targetapp                     | safetymapping |
	| study2    | studylabel1 | protocol1 | protocoltitle1 | pt1           | exstuid         | phase1     | cal pol       | ind1            | allergy         | sponsor1 | datalabs 5.6x or 5.7x or 5.8x | not enabled   |		
	When I click on the save button
	Then I should see the notification "study has been successfully added"

Scenario: T32_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study2"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T33_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form2      |
	| Form2      |
	| Table2     |
	| Autobuild2 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"

Scenario: T34_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form2 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form2"

Scenario: T1812_When User clicks on form2 and verify the domain,domain item and derivations mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Derivation   |
	| Domain1 | Item1      | Derivattion1 |
	And I click on "Save & Next" button 
	And I should see following details for the table
	| Domain  | TableName | TablePrompt  | AutobuildStatus |
	| Domain2 | Table2    | tableprompt1 | NO              |
	And I click on "Save & Next" button 
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  |
	| Domain2 | Item2      | Derivation2 |
	And I click on "save & next" button
	And I should see following details for the auto build table
	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
	And I click on "save & next" button
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  | HeaderName | KeySequence |
	| Domain3 | Item3      | Derivation3 | Header1    | 1           |
	And I click on Form Save button

Scenario: T36_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study2"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T37_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form4      |
	| Form4      |
	| Table4     |
	| Autobuild4 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
	
Scenario: T38_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
	When I change first domain item to "Item7"
	And I change the codelist in the target as "Codelist7"
	Then I uncheck the checkbox of  codelist
	
	Scenario: T39_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form4 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form4"

	Scenario: T40_When User clicks on form2 and verify the domain,domain item and codelist mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Codelist     |
	| Domain1 | Item7      | <unassigned> |

	#Now delete the two studies
	Scenario: T41_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
	When I click on the Cancel button on the popup page		
	And I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName |
	| Study1    |
	| Study2    |
	Then I should not see these studies in the Home page
	| StudyName |
	| Study1    |
	| Study2    |

Scenario: T42_When I create a study with the following details
    #When I click on the Home Button
	When I click on the Link "Create New Study"	
	And I enter study data details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor | TargetApp | SafetyMapping |
	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 |  DataLabs 5.8x or greater | Not Enabled   |
	And I should see the notification "Study has been successfully added" 
	And I click on the Link "Study1"
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Study Verify (Study1)" in "Complete" state

Scenario: T0399_create a Derivation in the scripting tab
	When I click on the "Scripting" tab
	And I click on the Link "Add Derivation"
	Then I give the following details and create the derivation by saving it
	| Derivation  | Description |
	| Derivation1 | Derivation1 |
	
	
Scenario: T04112_Assign Parameters to the Derivation
	When I click on the "Scripting" tab
	And I click on the Link "Derivation1"
	And I click on the Link "Add Parameter"
	And I give parameter Name as "Parameter1"
	And  I give the reference of parameter as "Data.Unscheduled.Conditional2.Cond2Table1.C2_Question1.DataType"
	Then I click on the Save button

Scenario:  T05231_Create a test case for the derivation
	When I click on the "TestCases" tab
	And I click on "Add Test Case" and add the  following details
	| Name      | Description | Expected Result |
	| TestCase1 | TestCase1   | 04/30/1975      |
	And I click on the Save button

Scenario: T03544_create a Derivation in the scripting tab
	When I click on the "Scripting" tab
	And I click on the Link "Add Derivation"
	Then I give the following details and create the derivation by saving it
	| Derivation  | Description |
	| Derivation2 | Derivation2 |
	
	
Scenario: T0412121_Assign Parameters to the Derivation
	When I click on the "Scripting" tab
	And I click on the Link "Derivation2"
	And I click on the Link "Add Parameter"
	And I give parameter Name as "Parameter2"
	And  I give the reference of parameter as "Data.Unscheduled.Conditional2.Cond2Table1.C2_Question1.DataType"
	Then I click on the Save button

Scenario:  T052323_Create a test case for the derivation
	When I click on the "TestCases" tab
	And I click on "Add Test Case" and add the  following details
	| Name      | Description | Expected Result |
	| TestCase2 | TestCase2   | 04/30/1975      |
	And I click on the Save button

Scenario: T03122_create a Derivation in the scripting tab
	When I click on the "Scripting" tab
	And I click on the Link "Add Derivation"
	Then I give the following details and create the derivation by saving it
	| Derivation  | Description |
	| Derivation3 | Derivation3 |
	
	
Scenario: T0411_Assign Parameters to the Derivation
	When I click on the "Scripting" tab
	And I click on the Link "Derivation3"
	And I click on the Link "Add Parameter"
	And I give parameter Name as "Parameter3"
	And  I give the reference of parameter as "Data.Unscheduled.Conditional2.Cond2Table1.C2_Question1.DataType"
	Then I click on the Save button

Scenario:  T0513232_Create a test case for the derivation
	When I click on the "TestCases" tab
	And I click on "Add Test Case" and add the  following details
	| Name      | Description | Expected Result |
	| TestCase3 | TestCase3   | 04/30/1975      |
	And I click on the Save button


Scenario: T06998_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Study1"
	And I click on the Domains Button
	And I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain1" 
	And enter DomainDesc as "Domain1"
	And I click on the Domains Save button
	And I should see the notification "Domain1 has been successfully added"
	And Click on the Domain "Domain1"
	Then I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName | Source  | Datatype | Derivation  |
	| Item1    | Derived | Text     | Derivation1 |

Scenario: T069849_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Study1"
	And I click on the Domains Button
	And I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain2" 
	And enter DomainDesc as "Domain2"
	And I click on the Domains Save button
	And I should see the notification "Domain2 has been successfully added"
	And Click on the Domain "Domain2"
	Then I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName | Source  | Datatype | Derivation  |
	| Item2    | Derived | Text     | Derivation2 |

Scenario: T06q23_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Study1"
	And I click on the Domains Button
	And I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain3" 
	And enter DomainDesc as "Domain3"
	And I click on the Domains Save button
	And I should see the notification "Domain3 has been successfully added"
	And Click on the Domain "Domain3"
	Then I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName | Source  | Datatype | Derivation  |
	| Item3    | Derived | Text     | Derivation3 |

Scenario: T08875_Create a form which should have flat questions,table question and auto build table
		When I click on the Home Button
		And I click on the Link "Study1"
		And I click on the "Forms" tab
		And I click on the Link "Add Form"
		Then I should  enter the below data for Creating form
		| FormName | FormLabel  |
		| Form1    | FormLabel1 |

Scenario: T09232_Create a question in "Form1"
	When I click on the "Forms" tab
	And I click on the Link "Form1"
	And I click on the Link "Add Question"
	And I enter "Question1" and save
	Then I should see the notification "Question1 has been successfully added"

Scenario: T1000_Add the details to question
	When I click on the Link "Question1"
	And I select Domain Name as "Domain1"
	And select the Item name "item1"
	And I click on the Save button
	Then I should see the notification "Question1 has been updated successfully"

Scenario: T112_Create a table question in "Form1"
	When I click on the "Forms" tab
	And I click on the Link "Form1"
	And I click on the Link "Add Table"
	And I enter "TableName1" and save
	Then I should see the notification "Table has been successfully added"
	And I click on link "Add Question" in the "TableQuestion1"
	And I enter "TableQuestion1"

Scenario: T120_Allot the domain name, Table Name and table prompt and save it
	When I click on the Link "TableName1"
	And I enter the Domain "Domain2" 
	And I Enter the tablename as "Table1"
	And I enter the table prompt as "tableprompt1"
	Then I click on "save and Next" button

Scenario: T132_Add the details to the Table question
	When I click on the Dropdown Icon for the Domain
	And I click on "Domain2" in the dropdown
	And I click on the Dropdown Icon for the Item 
	And I click On "Item2" in the dropdown
	Then I click on "save" button

Scenario: T11213_Create a auto build table question in "Form1"
	When I click on the "Forms" tab
	And I click on the Link "Form1"
	And I click on the Link "Add Table"
	And I enter "AutobuildTable1" and save
	Then I should see the notification "Table has been successfully added"
	And I click on link "Add Question" in the "AutobuildTable1"
	And I enter "AutoBuildQuestion1"

Scenario: T121_Allot the domain name, Table Name and table prompt and save it
	When I click on the Link "TableName2"
	And I enter the Domain "Domain3" 
	And I Enter the tablename as "Table2"
	And I enter the table prompt as "tableprompt2"
	And I click the checkbox of autobuild
	Then I click on "save and Next" button

Scenario: T1313_Add the details to the Table question
	When I click on the Dropdown Icon for the Domain
	And I click on "Domain3" in the dropdown
	And I click on the Dropdown Icon for the Item 
	And I click On "Item3" in the dropdown
	And I give the HeaderName as 'Header1'
	And I click on keySequence dropdown
	Then I select '1' in the dropdown
	Then I click on "save" button

Scenario: T142323_Pubilsh the study with the form created
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the Link "Publish Study"
	And I enter the publishLabel as "Study1"
	And I click Continue button on the warning dialog

Scenario: T15_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T16_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form2      |
	| Form2      |
	| Table2     |
	| Autobuild2 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"

Scenario: T17675_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form2 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form2"

Scenario: T1823_When User clicks on form2 and verify the domain,domain item and derivations mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Derivation   |
	| Domain1 | Item1      | Derivattion1 |
	And I click on "Save & Next" button 
	And I should see following details for the table
	| Domain  | TableName | TablePrompt  | AutobuildStatus |
	| Domain2 | Table2    | tableprompt1 | NO              |
	And I click on "Save & Next" button 
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  |
	| Domain2 | Item2      | Derivation2 |
	And I click on "save & next" button
	And I should see following details for the auto build table
	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
	And I click on "save & next" button
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  | HeaderName | KeySequence |
	| Domain3 | Item3      | Derivation3 | Header1    | 1           |
	And I click on Form Save button

#Create a form from existing with new domain, domain item and derivations

Scenario: T1932_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T202_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form3      |
	| Form3      |
	| Table3     |
	| Autobuild3 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"

Scenario: T2122_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
	When I change first domain item to "Item4"
	And I change the derivation in the target as "derivation4"
	And I click on second Domain name 
	And I change domain item to "Item5"
	And I change the derivation in the target as "derivation5"
	And I click on domain item 3
	And I click on Third domain name
	And I change domain item to "Item6"
	Then I change the derivation in the target as "derivation6"
	
Scenario: T2212_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form3 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form3"

Scenario: T231234_When User clicks on form2 and verify the domain,domain item and codelist mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Derivation  |
	| Domain1 | Item4      | Derivation4 |
	And I click on "Save & Next" button 
	And I should see following details for the table
	| Domain  | TableName | TablePrompt  | AutobuildStatus |
	| Domain2 | Table3    | tableprompt1 | NO              |
	And I click on "Save & Next" button 
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  |
	| Domain2 | Item5      | Derivation5 |
	And I click on "save & next" button
	And I should see following details for the auto build table
	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
	| Domain3 | Autobuild3 | tableprompt2 | Yes             |
	And I click on "save & next" button
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  | HeaderName | KeySequence |
	| Domain3 | Item6      | Derivation6 | Header1    | 1           |
	And I click on Form Save button

Scenario: T2423_I click on the domains tab and see the all the newly added domains and domain items
	When I click on the "Domains" tab
	And I click on the Link "Domain1"
	Then I should be able to see the "Derivation4" mapped to item4
	And I click on the "Domains" tab
	And I click on the Link "Domain2"
	Then I should be able to see the "Derivation5" mapped to "item5"
	And I click on the "Domains" tab
	And I click on the Link "Domain3"
	Then I should be able to see the "Derivation6" mapped to "item6"

Scenario: T25232_When I click on codelist tab I should be able to see the newly added Derivation items
	When I click on the "Scripting" tab
	And I click on the "Derivation" tab
	And I click on the Link "Derivation4"
	And I should see the "Parameter1" in the parameter tab
	And I should see reference number as not null
	And I click on the "Scripting" tab
	And I should see the text "AB_Constant_Date = "04/30/1975"
	And I click on the "TestCases" tab
	Then I should see "TestCase1" 

	Scenario: T2533_When I click on codelist tab I should be able to see the newly added Derivation items
	When I click on the "Scripting" tab
	And I click on the "Derivation" tab
	And I click on the Link "Derivation5"
	And I should see the "Parameter1" in the parameter tab
	And I should see reference number as not null
	And I click on the "Scripting" tab
	And I should see the text "AB_Constant_Date = "04/30/1975"
	And I click on the "TestCases" tab
	Then I should see "TestCase1" 

Scenario: T2523849_When I click on codelist tab I should be able to see the newly added Derivation items
	When I click on the "Scripting" tab
	And I click on the "Derivation" tab
	And I click on the Link "Derivation6"
	And I should see the "Parameter1" in the parameter tab
	And I should see reference number as not null
	And I click on the "Scripting" tab
	And I should see the text "AB_Constant_Date = "04/30/1975"
	And I click on the "TestCases" tab
	Then I should see "TestCase1" 

	Scenario: T26122_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study1"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T27243_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	And I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form4      |
	| Form4      |
	| Table4     |
	| Autobuild4 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
	
Scenario: T2845353_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
	When I change first domain item to "Item7"
	And I change the derivation in the target as "Derivation7"
	Then I uncheck the checkbox of Derivation
	
	Scenario: T292321_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form4 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form4"

	Scenario: T30121_When User clicks on form2 and verify the domain,domain item and codelist mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Derivation   |
	| Domain1 | Item7      | <unassigned> |

#verifing the scenarios for different study
Scenario: T3199328_when I click on create new study with target app as datalabs 5.6x or 5.7x then study should be added sucessfully
	When I click on the cancel button on the popup page
	When I click breadcrumb item "Home"
	And I click on the link "create new study"	
	And I enter study details 
	| studyname | studylabel  | protocol  | protocollabel  | protocoltitle | externalstudyid | studyphase | studydrugname | studyindication | therapeuticarea | sponsor  | targetapp                     | safetymapping |
	| study2    | studylabel1 | protocol1 | protocoltitle1 | pt1           | exstuid         | phase1     | cal pol       | ind1            | allergy         | sponsor1 | datalabs 5.6x or 5.7x or 5.8x | not enabled   |		
	When I click on the save button
	Then I should see the notification "study has been successfully added"

Scenario: T320903_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study2"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T33054_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form2      |
	| Form2      |
	| Table2     |
	| Autobuild2 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"

Scenario: T3498953_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form2 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form2"

Scenario: T1809_When User clicks on form2 and verify the domain,domain item and derivations mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Derivation   |
	| Domain1 | Item1      | Derivattion1 |
	And I click on "Save & Next" button 
	And I should see following details for the table
	| Domain  | TableName | TablePrompt  | AutobuildStatus |
	| Domain2 | Table2    | tableprompt1 | NO              |
	And I click on "Save & Next" button 
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  |
	| Domain2 | Item2      | Derivation2 |
	And I click on "save & next" button
	And I should see following details for the auto build table
	| Domain  | TableName  | TablePrompt  | AutobuildStatus |
	| Domain3 | Autobuild2 | tableprompt2 | Yes             |
	And I click on "save & next" button
	And I should be able to see the following details for the table question
	| Domain  | DomainItem | Derivation  | HeaderName | KeySequence |
	| Domain3 | Item3      | Derivation3 | Header1    | 1           |
	And I click on Form Save button

Scenario: T36053_Click on create form from existing with same study
	When I click on the "Home" tab
	And I click on the Link "Study2"
	And I click on the "Forms" tab
	And I click on the Link "Create form from existing"
	And I click on the Link "study1"
	And I click on the Link "Form1"

Scenario: T37434_Click on the Verify button and change form name, form label, table name
	When I click on verify button
	When I change the field Name for Form name, Form Label, Table Name and AutoBuild as below
	| Target1    |
	| Form4      |
	| Form4      |
	| Table4     |
	| Autobuild4 |
	And I click on Verify button		
	Then User should not see the error message "Form name must be unique" for the field "Form Name:"	
	And User should not see the error message "Form label must be unique" for the field "Form Label:"
	And User should not see the error message "Form name must be unique" for the field "Table Name:"
	And User should not see the error message "Form name must be unique" for the field "AutoBuildTable"
	
Scenario: T384_Expand the domains dropdown and and change the domain item,codelist to unique and click save button
	When I change first domain item to "Item7"
	And I change the codelist in the target as "Codelist7"
	Then I uncheck the checkbox of  codelist
	
	Scenario: T3932_When user click on save button and should see the form is saved successfully message
	When I click on Form Save button
	And I should see the notification "Form4 has been successfully added" 
	And I click on the "Forms" tab
	And I click on the Link "Form4"

	Scenario: T402323_When User clicks on form2 and verify the domain,domain item and codelist mappings
	When I click on the Link "Question1"
	And I should  be able to see the following details
	| Domain  | DomainItem | Codelist     |
	| Domain1 | Item7      | <unassigned> |

	#Now delete the two studies
	Scenario: T4109_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
	When I click on the Cancel button on the popup page		
	And I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName |
	| Study1    |
	| Study2    |
	Then I should not see these studies in the Home page
	| StudyName |
	| Study1    |
	| Study2    |