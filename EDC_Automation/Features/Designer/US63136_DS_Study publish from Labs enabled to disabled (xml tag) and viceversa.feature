#@F9857
Feature:DSandDLAllowstudieswithoutlabsin5.8Supportlabsforexistingstudies
      As a Product Owner
	I want Designer users to be able to enable/disable Labs for studies with TargetApp 5.8.0 or greater.
	So that users can choose Labs if they wanted to use for respective study.

#Feature No:F9857
#Feature Link: https://rally1.rallydev.com/#/244270786880ud/detail/portfolioitem/feature/288686580304
#Owner:Rama Chinthapalli
#Author:Vishnu Priya
#Copyright © 2018 PAREXEL International

Scenario: 01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

#Scenario: 02_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x then I should not see the LabMetaData.xml and Lab Dictionary Excel.xls files in the downloaded study file
#	When I click on the Link "Create New Study"	
#	And I enter study details 
#	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                     | SafetyMapping |
#	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |		
#	And I click on the Save button	
#	And I click breadcrumb item "Home"
#	Then I see Designer Home Page

Scenario: 03_When I Download the Study then User shouldnot see the Tag in the Study xml file
	#When I click on the Link "Import_Study1"
	#And I click on the Link "Publish Study"
	#And I see study publish dialog with title "Publish Study"
	#And Enter Label for study publish as "V5"
	#And I click on study publish continue button
	#And I should see the status of the study "Study Publish (Import_Study1: V5)" in "Complete" state	
	When I click on the study Link "Study Publish (Import_Study1: V5)" and download it
	#And I give file path to save "Import_Study1"" for StudyArchive
	#Then I see fully downloaded file "C:\Users\CHODISS\Downloads"
	Then I downloaded the file to "C:\Users\CHODISS\Downloads" and unzip the folder
	#And I unzip the folder 
	#And Study file should be downloaded
	#Then Study file should be downloaded 
	#And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
	#Then I see fully downloaded file "C:\Users\CHODISS\Downloads\Test4500_Labs_20190802_T18223165"
	#When I unzip folder "Study1"
	#Then I see unzipped folder "Study1"
	And I should not see "Lab_MetaData.xml" file in the folder
	And I should not see "DataLabsEDC_LabDictionary_LabDictionary_PS1_V12" file in the folder
	


Scenario: T27_Download Archive Export zip folder
	When I click main tab "Inbox"
	And I click inbox item "Export (Archive): #1 - complete. Download file." in folder "Jobs"
	And I download the file in the execution folder with name "ArchiveExportFile1".
	Then I see the file with name "ArchiveExportFile1.zip" in execution folder.

Scenario: T28_Unzip a zip folder
	When I unzip folder "ArchiveExportFile1.zip"
	Then I see unzipped folder "ArchiveExportFile1"

Scenario: T29_Save the patient xml file in the execution folder
	When I save the export file in the folder "ArchiveExportFile1\01" containing "01-PAT" in the execution path with name "ArchiveExportActual1.xml".
	Then I have the XML file "ArchiveExportActual1.xml" available in the Test XML Files folder.

	@ObjectiveEvidence @ReqID:QC1654,QC1697
Scenario: T30_Verify the archive export XML Data for 01-Site with generated archive export XML.
	Given I have the XML file "ArchiveExportExpected1.xml" available in the project folder.
	And I have the XML file "ArchiveExportActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName        | FieldName                 |
	| DateTimeStamp  | CreationDateTime          |
	| SignatureValue | SubjectKey                |
	| DigestValue    | FileOID                   |
	| SourceID       | PriorFileOID              |
	|                | Description               |
	|                | SourceSystemVersion       |
	|                | dl:PatientFormQuestionKey |

#Scenario: 03_When I open the study file of TargetApp DataLabs 5.6x or 5.7x then I should not see XCStudy_Labs tag in the study file
#	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
#	Then I should not see the tag "XCStudy_Labs"		
#
#Scenario: 04_When I open the existing study of Target App DataLabs 5.6x or 5.7x and change the Target App value to DataLabs 5.8x or greater and saved the study then the user should see LabMetaData and Lab Dictionary file in the published study file
#	When I click on the Link "Create Study from Existing"
#	And I Select the study "Study1" 
#	And I select value "DataLabs 5.8x or greater" from the "Target App:" drop down of Study page
#	And I click on the Save button
#	And I click on the Link "View Study Jobs"
#	And I should see the status of the study "Study1" in "Complete" state
#	And I click breadcrumb item "Home"
#	And I see Designer Home Page
#	And I click on the Link "Study1"
#	And Study file should be downloaded
#	Then Study file should be downloaded 
#	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
#	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
#	When I unzip folder "Study1"
#	Then I see unzipped folder "Study1"
#	Then I should not see "LabMetaData.xml" file in the folder "Study1"
#	And I should not see " Lab Dictionary Excel.xls" file in the folder "Study1"
#
#Scenario: 05_When I open the study file of TargetApp DataLabs 5.6x or 5.7x then I should not see XCStudy_Labs tag in the study file
#	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
#	Then I should  see the tag "XCStudy_Labs" and set to value "No"
#
#Scenario: 06_When I open the existing study of Target App DataLabs 5.6x or 5.7x and change the Target App value to DataLabs 5.8x or greater set the Labs setting option to Yes and saved the study and don't do any lab mappings and attribute mappings then user should not see Lab Meta Data file  and Lab Dictonary File in the published xml
#	When I click on the Link "Create Study from Existing"
#	And I Select the study "Study1" 
#	And I select value "DataLabs 5.8x or greater" from the "Target App:" drop down of Study page
#	And  I Select "Yes" from the "Labs" drop down
#	And I click on the Save button
#	And I click on the Link "View Study Jobs"
#	And I should see the status of the study "Study1" in "Complete" state
#	And I click breadcrumb item "Home"
#	And I see Designer Home Page
#	And I click on the Link "Study1"
#	And Study file should be downloaded
#	Then Study file should be downloaded 
#	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
#	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
#	When I unzip folder "Study1"
#	Then I see unzipped folder "Study1"
#	Then I should not see "LabMetaData.xml" file in the folder "Study1"
#	And I should not see " Lab Dictionary Excel.xls" file in the folder "Study1"
#
#Scenario: 07_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
#	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
#	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"
#
#Scenario: 08_When I open the existing study of Target App DataLabs 5.6x or 5.7x and change the Target App value to DataLabs 5.8x or greater set the Labs setting option to Yes and do the Attribute mappings and save then user should see the LabMetaData.xml
#	When I click on the Link "Create Study from Existing"
#	And I Select the study "Study1" 
#	And I select value "DataLabs 5.8x or greater" from the "Target App:" drop down of Study page
#	And  I Select "Yes" from the "Labs" drop down
#	And I click on the Save button
#	And I click on the Link "View Study Jobs"
#	And I should see the status of the study "Study1" in "Complete" state
#	And I click breadcrumb item "Home"
#	And I see Designer Home Page
#	And I click on the Link "Study1"
#	And Study file should be downloaded
#	Then Study file should be downloaded 
#	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
#	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
#	When I unzip folder "Study1"
#	Then I see unzipped folder "Study1"
#	Then I should  see "LabMetaData.xml" file in the folder "Study1"
#	And I should not see " Lab Dictionary Excel.xls" file in the folder "Study1"
#
#Scenario: 09_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
#	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
#	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"
#
#Scenario: 10_When I open the existing study of Target App DataLabs 5.6x or 5.7x and change the Target App value to DataLabs 5.8x or greater set the Labs setting option to Yes and do only the lab mappings and save then user should see the LabMetaData.xml
#	When I click on the Link "Create Study from Existing"
#	And I Select the study "Study1" 
#	And I select value "DataLabs 5.8x or greater" from the "Target App:" drop down of Study page
#	And  I Select "Yes" from the "Labs" drop down
#	And I click on the Save button
#	And I click on the Link "View Study Jobs"
#	And I should see the status of the study "Study1" in "Complete" state
#	And I click breadcrumb item "Home"
#	And I see Designer Home Page
#	And I click on the Link "Study1"
#	And Study file should be downloaded
#	Then Study file should be downloaded 
#	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
#	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
#	When I unzip folder "Study1"
#	Then I see unzipped folder "Study1"
#	Then I should  see "LabMetaData.xml" file in the folder "Study1"
#	And I should not see " Lab Dictionary Excel.xls" file in the folder "Study1"
#
#Scenario: 11_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
#	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
#	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"
#
#Scenario: 12_When I open the existing study of Target App DataLabs 5.6x or 5.7x and change the Target App value to DataLabs 5.8x or greater set the Labs setting option to Yes and do both the attribute and lab mappings and save the study then user should see the LabMetaData.xml
#	When I click on the Link "Create Study from Existing"
#	And I Select the study "Study1" 
#	And I select value "DataLabs 5.8x or greater" from the "Target App:" drop down of Study page
#	And  I Select "Yes" from the "Labs" drop down
#	And I click on the Save button
#	And I click on the Link "View Study Jobs"
#	And I should see the status of the study "Study1" in "Complete" state
#	And I click breadcrumb item "Home"
#	And I see Designer Home Page
#	And I click on the Link "Study1"
#	And Study file should be downloaded
#	Then Study file should be downloaded 
#	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
#	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
#	When I unzip folder "Study1"
#	Then I see unzipped folder "Study1"
#	Then I should  see "LabMetaData.xml" file in the folder "Study1"
#	And I should not see " Lab Dictionary Excel.xls" file in the folder "Study1"
#
#Scenario: 13_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
#	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
#	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"
#
#Scenario: 14_When I open the existing study of Target App DataLabs 5.6x or 5.7x and change the Target App value to DataLabs 5.8x or greater set the Labs setting option to Yes and do both the attribute and lab mappings and set the lab dictionary and save the study then user should see the LabMetaData.xml and Lab Dictionary File
#	When I click on the Link "Create Study from Existing"
#	And I Select the study "Study1" 
#	And I select value "DataLabs 5.8x or greater" from the "Target App:" drop down of Study page
#	And  I Select "Yes" from the "Labs" drop down
#	And I click on the Save button
#	And I click on the Link "View Study Jobs"
#	And I should see the status of the study "Study1" in "Complete" state
#	And I click breadcrumb item "Home"
#	And I see Designer Home Page
#	And I click on the Link "Study1"
#	And Study file should be downloaded
#	Then Study file should be downloaded 
#	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
#	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
#	When I unzip folder "Study1"
#	Then I see unzipped folder "Study1"
#	Then I should  see "LabMetaData.xml" file in the folder "Study1"
#	And I should  see " Lab Dictionary Excel.xls" file in the folder "Study1"
#
#Scenario: 15_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
#	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
#	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"

	#####################create study scenarios start from here for TargetApp 5.8 or greater############################

Scenario: 16_When I create a new study of TargetApp ver DataLabs 5.8x or greater and save it then I should not see the Lab MetaData and Lab Dictionary file 
	When I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping | 
	| Study2    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.8x or greater | Not Enabled   |				
	And I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click on the Link "Publish Study"	
	And I enter the text "V1" aganist the Publish label in "Publish Study"
	And I click continue in confirmation having title "Publish Study" and partial message "The Publish Study action has been requested." 
	And I click on the Link "Study Publish (Study2: v1)"
	And I click on the Link "View Study Jobs"
	Then I Study file should be downloaded and the status of the study "Study Publish (Study2: v1)" in "Complete" state		
	And I click on the Link "Study Publish (Study2: v1)"	
	Then Study file should be downloaded 	
	When I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
	When I unzip folder "Study1"
	Then I see unzipped folder "Study1"
	Then I should not  see "LabMetaData.xml" file in the folder "Study1"
	And I should not  see " Lab Dictionary Excel.xls" file in the folder "Study1"

Scenario: 17_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
	Then I should  see the tag vale of "XCStudy_Labs" is set to "No"

Scenario: 18_When I create a new study of TargetApp ver DataLabs 5.8x or greater and save it then I should not see the Lab MetaData and Lab Dictionary file 
	When I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping | 
	| Study2    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.8x or greater | Not Enabled   |			
	And  I Select "Yes" from the "Labs" drop down
	And I click on the Save button
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Study1" in "Complete" state
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Study2"
	And Study file should be downloaded
	Then Study file should be downloaded 
	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
	When I unzip folder "Study1"
	Then I see unzipped folder "Study1"
	Then I should not  see "LabMetaData.xml" file in the folder "Study1"
	And I should not  see " Lab Dictionary Excel.xls" file in the folder "Study1"

Scenario: 19_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"

Scenario: 20_When I create a new study of TargetApp ver DataLabs 5.8x or greater and save and do the Attribute mapping then I should see the Lab MetaData file but not the Lab Dictionary file 
	When I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping | 
	| Study3    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.8x or greater | Not Enabled   |			
	And  I Select "Yes" from the "Labs" drop down
	And I click on the Save button
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Study1" in "Complete" state
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Study3"
	And Study file should be downloaded
	Then Study file should be downloaded 
	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
	When I unzip folder "Study1"
	Then I see unzipped folder "Study1"
	Then I should see "LabMetaData.xml" file in the folder "Study1"
	And I should not  see " Lab Dictionary Excel.xls" file in the folder "Study1"

Scenario: 21_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"

Scenario: 22_When I create a new study of TargetApp ver DataLabs 5.8x or greater and save and do the Lab Mapping then I should see the Lab MetaData file but not the Lab Dictionary file 
	When I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping | 
	| Study3    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.8x or greater | Not Enabled   |			
	And  I Select "Yes" from the "Labs" drop down
	And I click on the Save button
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Study1" in "Complete" state
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Study3"
	And Study file should be downloaded
	Then Study file should be downloaded 
	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
	When I unzip folder "Study1"
	Then I see unzipped folder "Study1"
	Then I should see "LabMetaData.xml" file in the folder "Study1"
	And I should not  see " Lab Dictionary Excel.xls" file in the folder "Study1"

Scenario: 23_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"

Scenario: 24_When I create a new study of TargetApp ver DataLabs 5.8x or greater and save and do the Lab Mapping and Attribute Mapping then I should see the Lab MetaData file but not the Lab Dictionary file 
	When I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping | 
	| Study3    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.8x or greater | Not Enabled   |			
	And  I Select "Yes" from the "Labs" drop down
	And I click on the Save button
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Study1" in "Complete" state
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Study3"
	And Study file should be downloaded
	Then Study file should be downloaded 
	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
	When I unzip folder "Study1"
	Then I see unzipped folder "Study1"
	Then I should see "LabMetaData.xml" file in the folder "Study1"
	And I should not  see " Lab Dictionary Excel.xls" file in the folder "Study1"

Scenario: 25_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"

Scenario: 26_When I create a new study of TargetApp ver DataLabs 5.8x or greater and save and do the Lab and Attribute Mapping and Dictionary mapping then I should see the Lab MetaData file and Lab Dictionary file 
	When I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping | 
	| Study3    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.8x or greater | Not Enabled   |			
	And  I Select "Yes" from the "Labs" drop down
	And I click on the Save button
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Study1" in "Complete" state
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Study3"
	And Study file should be downloaded
	Then Study file should be downloaded 
	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"
	When I unzip folder "Study1"
	Then I see unzipped folder "Study1"
	Then I should see "LabMetaData.xml" file in the folder "Study1"
	And I should  see " Lab Dictionary Excel.xls" file in the folder "Study1"

Scenario: 27_When I open the study file in the published study then I should see the XCStudy_Labs tag value is set to Yes
	When I open the study file "Test4500_Labs_20190503_T22341953.xml"
	Then I should  see the tag vale of "XCStudy_Labs" is set to "Yes"






	
	





