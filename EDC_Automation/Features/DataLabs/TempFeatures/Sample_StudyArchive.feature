Feature: Sample_StudyArchive
	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Initiate study archive for sites
	When I select DataManagerPortal item "Export" from drop down
	And I click link "Archive Export" in ExportPage
	And I select sites in ArchiveExportPage
	| Site     |
	| S1-Site1 |
	| S2-Site2 |
	| S3-Site3 |
	And I click Export button in ArchiveExportPage
	Then I click Continue button of Modal "Archive Export"

Scenario: 03_Download Archive Export zip folder
	When I click main tab "Inbox"
	And I click inbox item "Export (Archive): #11 - complete. Download file." in folder "Jobs"
	And I give file path to save "C:\StudyArchive\ABC2.zip" for StudyArchive
	Then I see fully downloaded file "C:\StudyArchive\ABC2.zip"

Scenario: 04_Unzip a zip folder
	When I unzip folder "ABC2"
	Then I see unzipped folder "ABC2"

Scenario: 05_Save the zip file runtime in execution folder during execution
	When I download the file in the execution folder with name "ArchiveExportFile".
	Then I see the file with name "ArchiveExportFile.zip" in execution folder.

Scenario: 06_Save the patient xml file in the execution folder
	When I save the export file in the folder "ArchiveExportActual1\01" containing "01-PAT" in the execution path with name "ActualXML.xml".
