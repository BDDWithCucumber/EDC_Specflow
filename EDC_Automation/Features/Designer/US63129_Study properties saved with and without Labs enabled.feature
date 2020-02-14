Feature:DS_Allowstudieswithoutlabsin5.8.0andSupportlabsforexistingstudies
@F9857_1
#      As a Product Owner
#	I want Designer users to be able to enable/disable Labs for studies with TargetApp 5.8.0 or greater.
#	So that users can choose Labs if they wanted to use for respective study.

#Feature No:F9857
#Feature Link: https://rally1.rallydev.com/#/244270786880ud/detail/portfolioitem/feature/288686580304
#Owner:Rama Chinthapalli
#Author:Vishnu Priya
#Copyright © 2018 PAREXEL International

Scenario: 01_Login to Designer
	Given I logged in to Designer
	Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US63129.1
Scenario: 02_Create New Study
	When I click on the Link "Create New Study"
	Then I should see study properties page		

@ObjectiveEvidence @ReqID:US63129.1 
Scenario: 03_Enter the study values for the study created in study properties page
	When I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                     | SafetyMapping |
	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |		
	And I click on the Save button	 
	Then I should see the notification "Study has been successfully added"

@ObjectiveEvidence @ReqID:US63129.1
Scenario: 04_When I click on the Home tab then user should be navigated to designer home page 
	When I click on the Link "Home"
	Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US63129.1
#Verify Lab Mappings Specification(LMS) in Documents section
Scenario: 05_When user clicks on Lab Mappings Specification(LMS) in Documents then user should not see Lab Mappings Specification(LMS) link in Documents section
	When I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study1    |
	Then I should see study properties page	
	And I should not see the Link "Lab Mappings Specification (LMS)"
	And I Should not see the tab mentioned below
	|TabName|
	|Labs|
	And I should see the tabs mentioned below
	| TabName        |
	| Events         |
	| Forms          |
	| Domains        |
	| Codelists      |
	| Dictionaries   |
	| Scripting      |
	| Configurations |

@ObjectiveEvidence @ReqID:US63129.1
Scenario: 06_When I click on the Home tab then user should be navigated to designer home page 
	When I click on the Link "Home"
	Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US63129.1
Scenario: 07_Create New Study
	When I click on the Link "Create New Study"
	Then I should see study properties page		

@ObjectiveEvidence @ReqID:US63129.1 
Scenario: 08_Enter the study values for the study created in study properties page
	When I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping |
	| Study2    | StudyLabel2 | Protocol2 | ProtocolTitle2 | PT2           | EXSTUID2        | Phase      | Cal pol       | IND2            | Allergy         | Sponsor1 | DataLabs 5.9x or greater | Not Enabled   |		
	And I click on the Save button	 
	Then I should see the notification "Study has been successfully added"

Scenario: 09_When I Click change the Labs option to No in Other section then I should get the message below the drop down
	When I click on the Settings drop Icon
	And  I Select "Enabled" from the "Labs" drop down
	Then I should see the notification "Study has been successfully updated"
	And I should see the tabs mentioned below
	| TabName        |
	| Labs           |
	| Events         |
	| Forms          |
	| Domains        |
	| Codelists      |
	| Dictionaries   |
	| Scripting      |
	| Configurations |

Scenario: 12_When I Click on Labs tab then I should see Lab Mapping Screen
	When I click on the "Labs" tab
	Then I should see the "Lab Mapping" page
	Then I should see the tabs mentioned below
	| TabName            |
	| Attribute Mapping  |
	| Lab Mapping        |
	And under the Actions panel I should see the tabs mentioned below 
	| TabName            |
	| Map Attributes     |
	| Map Lab Dictionary |

Scenario: 13_Add New Lab Dictionary	
	When I click breadcrumb item "Home"
	And I click on the Link "Manage Labs"
	And I Click "Add Lab Dictionary"
	And enter LabDictionaryName as "Dict1" 
	And enter LabDictionaryDesc as "Dict1Desc1"
	And I click on the Lab Dict Save button
	And I should see the Dict notification "Dict1 has been successfully added"
	And Click on the LabDict "Dict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict"
	And I upload a labDict file "DataLabsEDC_LabDictionary_LabDictionary_PS1_V3.xlsx"	
	Then I see the Lab test "01" in table of Lab Dictionary

Scenario: 14_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_Study59_US63112_SameStudy.zip" 
	And Enter the unique study name "Import_Source59"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Source59)" in "Complete" state

Scenario: 15_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete    
	When I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study2    |	

Scenario: 16_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

@ObjectiveEvidence @ReqID:3.1.2.6
Scenario: 17_Create the Demographics Form
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Source59"
	And I navigate to the page "4"
	And I click on the Link "LabForm1"	
	And I click on Verify button
	And I click on the Save Button
	Then I should see the notification "LabForm1 has been successfully created."

Scenario: 18_Verify the Attribute Mappings in Attribute section
	#When I click on the Home Button
	When I click on the "Local Labs" 
	And I click on the Link "Attribute Mappings"	
	Then I select "Common" for "GenderEvent"
	And I select "Screened" for "GenderForm"
	And I select "SCRNID (Screen ID:)" for "GenderItem"
	And I select "Date of Birth (Whole Date)" for "DOB"
	And I select "Common" for "DOBEvent"
	And I select "Screened" for "DOBForm"
	And I select "SCRNDATE (Screen Date:)" for "DOBItem"
	And I click on the save button in Attribute mapping page

Scenario: 19_Verify the Lab Mappigs in Lab Mappings section
	When I click on the Link "Lab Mappings"	
	And I select the Domain Name "LabAndCodeListGroups"	
	Then I select "LabID" for "Lab Id"
	And I select "CRFCollectionDate" for "CRF Collection Date"
	And I select "CRFLabTestName_New" for "CRF Lab Test Name"
	And I select "CRFLabValue" for "CRF Lab Value *"
	And I select "CRFLabUnit" for "CRF Lab (Original) Unit *"
	And I click on the Save button in Lab mappings page 

Scenario: 20_Verify the Map lab Dictionary Section
	When I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "Dict1 (Dict1Desc1)"
	And click on the tab Lab Test and select the below lab tests
	| LabTestName            | DisplayinRR |
	| LabTests-Test1 (Test1) | Yes         |
	And I click on map lab dict Save button

Scenario: 21_Verify the Map lab Dictionary Section	
	When I click on the link LabUnit	
	Then I see the lab unit mapping "LabUnits-01 (01)"

Scenario: 22_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies	
	When I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName       |
	| Study1          |
	| Study2          |
	| Import_Source59 |
	Then I should not see these studies in the Home page
	| StudyName |
	| Study1          |
	| Study2          |
	| Import_Source59 |
		



 


	
	
	