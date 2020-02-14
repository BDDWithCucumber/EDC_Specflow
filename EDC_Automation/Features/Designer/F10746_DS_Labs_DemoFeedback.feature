Feature: F10746_DS_Labs Demo


Scenario: 01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

	@US68906.3
Scenario: 02_When I import a study then I should see Error Message for Client/Sponser field.
	When I click on the Link "Import Study"
	And I import a study "test01_20191120_T12233893.zip" 
    Then I should see the message "The selected sponsor is not available. Please navigate to Manage Sponsors and add a sponsor." beside Client/Sponsor.

Scenario: 03_When I add a new Sponser then the Sponser should get added
     When I click breadcrumb item "Home"
	 And I click on the Link "Manage Sponsors"
	 And  I click on the Link "Add Sponsor"
	 And I enter the unique Sponser name "Perceptive" and Sponsor Label "Perceptive"
	 Then I click on the Save button to Save the Sponsor
   

@US68899.1 @US68898.3
Scenario: 04_When I Create New Study with Target APP as DataLabs 5.9x or greater then Local Labs setting option drop down should show options as Not Enabled and Enabled
	When I click breadcrumb item "Home"
   And I click on the Link "Create New Study"	
	And I select value "DataLabs 5.9x or greater" from the "Target App:" drop down of Study page
	Then I should see the below drop down options once I click on "Local Labs" drop down
	| Dropdown    |
	| Not Enabled |
	| Enabled     | 

@US68899.1
Scenario: 05_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x or 5.8x then Local Labs setting option should be displayed by default as Not Enabled in Other section and it should be disabled
	When I select value "DataLabs 5.6x or 5.7x or 5.8x" from the "Target App:" drop down of Study page
	And I should see the Local Labs drop down state as "Disabled" in Other section 
	Then I should see the selected Local Labs value as "Not Enabled" in the drop down of Other section	

@US68900.1
Scenario: 06_When I Create a New Study and Click change the Local Labs option to Not Enabled in Other section then I should get the message below the drop down
	When I click breadcrumb item "Home"
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor    | TargetApp                | SafetyMapping | LocalLabs   |
	| Study1    | StudyLabel2 | Protocol2 | ProtocolTitle2 | PT2           | EXSTUID2        | Phase2     | Cal pol       | IND2            | Allergy         | Perceptive | DataLabs 5.9x or greater | Not Enabled   | Enabled      |	
	And I click on the Save button
	And I click on the Settings drop Icon
	And I Select "Not Enabled" from the "Local Labs" drop down	
   Then I should see the message "On changing the Local Labs setting to ‘Not Enabled’, all lab mappings will be removed from the study." below the Local Labs drop down
	

@US68900.1 @US68898.3	
Scenario: 07_When I Create a New Study from Existing and Click change the Local Labs option to Not Enabled in Other section then I should get the message below the drop down
	When I click breadcrumb item "Home"
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"	
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName |
	| Study1    |
	And I Select "Not Enabled" from the "Local Labs" drop down
	Then I should see the message "On changing the Local Labs setting to ‘Not Enabled’, all lab mappings will be removed from the study." below the Labs drop down 	

 @US68900.1	@US68898.3	
Scenario: 08_When I import a study and Click change the Local Labs option to Not Enabled in Other section then I should get the message below the drop down
	When I click breadcrumb item "Home"
	And I click on the Link "Import Study"
	And I import a study "test01_20191120_T12233893.zip" 
	And Enter the unique study name "BaseStudy"
	And I Select "Enabled" from the "Local Labs" drop down
	And  I Select "Not Enabled" from the "C:\SQA\SQA Auto\EDC Specflow Automation\BusinessProcesses\Designer\StudyFiles\test01_20191120_T12233893.zipLocal Labs" drop down
	And I should see the message "On changing the Local Labs setting to ‘Not Enabled’, all lab mappings will be removed from the study." below the Labs drop down
	And I Select "Enabled" from the "Local Labs" drop down
    Then I click on the Save button
	
@US68898.3 
Scenario: 09_When I select a study then I should see Local Labs option in the header
	When I click Continue on Target App pop up having  title "Confirmation" and partial message "Lab Dictionary mappings will be removed"
	And I click on the study link "BaseStudy" of target app latest version and Local Labs option as Enabed
	Then I should see the tabs mentioned below
	| TabName    |
	| Local Labs |

@US68898.3 
Scenario: 10_When I select Local Labs option in the header then I should see Local Labs in the Breadcrumb 
	When I click breadcrumb item "Home"
	And I click on the Link "BaseStudy" 
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Study Import (BaseStudy)" in "Complete" state
	And I click on the "Local Labs" tab
	And I click on the Link "Map Lab Dictionary"
	Then I see Map Lab Dictionary page and breadcrumb items in order
	| BreadCrumb         |
	| Home               |
	| Local Labs         |
	| Map Lab Dictionary |


@US68903.1
Scenario: 11_When I go to local labs tab then I should see header as 'Lab Mappings' and Tabs as 'Attribute Mappings', 'Lab Mappings'
	When I click breadcrumb item "Local Labs"
    And I should see the "Lab Mappings" page 
	Then I should see the tabs mentioned below
	| TabName            |
	| Attribute Mappings |
	| Lab Mappings       |

@US68907
Scenario: 12_When I click on Codelist Mappings button for a field on Attribute Mappings page, Then I should see cancel button on the right side of Ok button
   When I click on Edit icon For "Gender" Field.
   And I click Codelist Mapping Button for "Gender" Field.
   Then I see Cancel Button in Grey color

@US68907
Scenario:  13_When I click on Cancel button on Codelist Mappings Popup, then the pop up window should get closed.
   When I click on Cancel button on Codelist Mappings popup.
   Then I should see the "Lab Mappings" page 


@US68904.3
Scenario: 14_When I Create a new Domain and Domain Item with Maximum lenth of the field then I should see full name of the same on Lab  Mappings tab.
	When I click breadcrumb item "Home"
	And  I click on the Link "BaseStudy" 
	And I click on the "Domains" tab
	And I click on the Link "Add Domain"
	And enter DomainName as "DomainForTestingLenghtOfFieldIs35Ch"
	And enter DomainDesc as "Domain Name is 35 Characters"
	And I click on the Domains Save button
	And I click on the Link "DomainForTestingLenghtOfFieldIs35Ch"
	And I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName                            | Source | Datatype | CodeList |
	| TestingItemforMaximumLenghtOfCharac | EDC    | Text     | LabTests |
	And I click on the "Local Labs" tab
	And I click on the "Lab Mapping" tab
	And I click on the Link "+"
	And I select Domain Name as "DomainForTestingLenghtOfFieldIs35Ch"
	And I select Domain Item for Lab ID as "TestingItemforMaximumLenghtOfCharac" for Domain "DomainForTestingLenghtOfFieldIs35Ch"
    Then I see that all the characters for Domain Name "DomainForTestingLenghtOfFieldIs35Ch"and in Domain Item "TestingItemforMaximumLenghtOfCharac" are visible.

@US69317.5
Scenario: 15_When we navigate to Lab Mappings tab on Lab Mappings Page, then Expand/Collape option for all Lab Mappings should be Expanded by default.
	Given I  am on Lab Mappings page, Lab mappings tab
	Then I should see Expand/Collapse Option for all Lab Mappings is Selected.

@US69317.5
Scenario: 16_When we click on Expand/Collape button for all Lab Mappings to collapse, then all the Lab Mappings should get collapsed
    When I click on Expand/Collapse Option for all Sections
	Then I see that all the sections get collapsed

@US69317.5
Scenario: 17_When we click on Expand/Collape button for all Lab Mappings to Expand, then all the Lab Mappings should get Expanded.
     When I click on Expand/Collapse Option for all Sections
	 Then I see that all the sections get expanded

 @US69317.5
Scenario: 18_When we navigate to Lab Mappings tab on Lab Mappings Page, each section should have expand/collapse button.
       Given I  am on Lab Mappings page, Lab mappings tab
	   Then Each Section should have Expand/Collapse Button

	   @US69317.5
Scenario: 19_When we click on Expand/Collape button for any section to Collapse, that section should get collapsed.
        When I click Expand/Collape button for Section "Laboratory"
		Then The Laboratory Section should get Collapsed

		@US69317.5
Scenario: 20_When we click on Expand/Collape button for any section to Expand, that section should get Expanded.
		When I click Expand/Collape button for Section "Laboratory"
		Then The Laboratory Section should get Expanded

 
