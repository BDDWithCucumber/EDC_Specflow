Feature: DataLabs_V5.7.1_QC1697_1654_StudyUpdate_Patient History
 
Test Summary:
		1. Verification of table history icon for table after patient Migration without any changes on the table.
		2. Verification of Table history order in data labs application and archive export XML for table before patient migration and after patient migration. 

Scenario: T01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_AH Base study V1.zip" with study label "V1"
	Then I see study label "Test4500_Big_560" in header

Scenario: T04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	Then I see success message "Site Added Successfully"

Scenario: T05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see success message "Save Successful"

Scenario: T06_Assign testadmin testadmin user to 02-Site
	Given I click breadcrumb "Site Management"
	When I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see success message "Save Successful"
	
Scenario: T07_Add patient 01-PAT from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

Scenario: T08_Select and enroll patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 06/13/2018 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: T09_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T10_Navigate to Form1 in visit (Week2) event and Add row to the table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I click on "Add New Row" button in "Sample Table:" table.
	And I click table row button "Save & Close Row" of table "Sample Table:"
	And I click on "Add New Row" button in "Sample Table:" table.
	And I click table row button "Save & Close Row" of table "Sample Table:"
	And I click on "Add New Row" button in "Sample Table:" table.
	And I click table row button "Save & Close Row" of table "Sample Table:"
	And I click on "Add New Row" button in "Sample Table:" table.
	And I click table row button "Save & Close Row" of table "Sample Table:"
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T11_Delete a row and Save and close the form in form1 week2 ssample table.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I expand row "3" of table "Sample Table:"
	And I click table row button "Delete Row" of table "Sample Table:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "Invalid Data" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T12_Restore a row for sample table in Form1 for Visit week2.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I expand row "3" of table "Sample Table:"
	And I click table row button "Restore Row" of table "Sample Table:"
	And I select reason for change "DCF" in RestoreTableRowModalDialog
	And I enter additional notes "Data Backup" in RestoreTableRowModalDialog
	And I click continue button in RestoreTableRowModalDialog
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T13_Verify Item change history for "Sample Table:" table in Form1 visit (Week 2).
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I invoke table hisotry for table "Sample Table:"
    Then I see table history for table "Sample Table:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action            | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Restored | DCF    | Data Backup      |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Deleted  | DCF    | Invalid Data     |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added    |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "Form1" CRF.

Scenario: T14_Navigate to DT1 Dt2 Form in visit (Week 7) event and Add row to the table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T15_Navigate to DT1 Dt2 Form in visit (Week 7) event and delete a row.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I expand row "2" of table "LabId and Gorups:"
	And I click table row button "Delete Row" of table "LabId and Gorups:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "Wrong Data" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T16_Verify the history for added rows and deleted rows on DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "LabId and Gorups:"
    Then I see table history for table "LabId and Gorups:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action           | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

Scenario: T17_Navigate to DT1 Dt2 Form in visit (Week 7) event and Add row to the other table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T18_Verify the history for added rows and deleted rows on DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "Domain Test 2 Table:"
    Then I see table history for table "Domain Test 2 Table:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

Scenario: T19_Update the derivation (AB_Constant_Date) to Inactive.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "AB_Constant_Date" in DerivationManagementPage
	And I Select "Inactive" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T20_Navigate to AutoBuild Form01 in visit (Week 51) event Checkout and save the form.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T21_Verify the AutoBuild Form01 CRF tables history.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	When I invoke table hisotry for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
    Then I see table history for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 7: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:"
    Then I see table history for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.
	
Scenario: T22_Update study with patient migration on domain, table name and table order change.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Updated domain, table name and order of the questions V2.zip" with Label "V2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 01 for Study file (V2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Publishing of Study file (V2) - complete.                                                                                       |

	@ObjectiveEvidence @ReqID:QC1697
Scenario: T23_Verify the history for form1 in visit week2 on table name update.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I click "Checkout" button on "Form1" CRF.
	Then I dont see table history icon for table "Sample Table name updated:"
	Then I click on "Save & Close" button on "Form1" CRF.

Scenario: T24_Verify the history for DT1 DT2 Form in visit week7 after updating the domain name and reorder of the table.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "LabId and Gorups:"
    Then I see table history for table "LabId and Gorups:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action           | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Domain Test 2 Table:"
    Then I see table history for table "Domain Test 2 Table:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

	@ObjectiveEvidence @ReqID:QC1654
Scenario: T25_verify the table history for AutoBBuild Form01 in Visit weekk 51 for major study update.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	When I invoke table hisotry for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
    Then I see table history for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 7: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:"
    Then I see table history for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.

Scenario: T26_Initiate study archive for sites
       When I select DataManagerPortal item "Export" from drop down
       And I click link "Archive Export" in ExportPage
       And I select sites in ArchiveExportPage
       | Site    |
       | 01-SIte |
       And I click Export button in ArchiveExportPage
       Then I click Continue button of Modal "Archive Export"

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

Scenario: T31_Navigate to Form1 in visit (Week2) event and Add row to the table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T32_Delete a row and Save and close the form in form1 week2 sample table.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I expand row "3" of table "Sample Table name updated:"
	And I click table row button "Delete Row" of table "Sample Table name updated:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "Invalid Data" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T33_Restore a row for sample table in Form1 for Visit week2.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I expand row "3" of table "Sample Table name updated:"
	And I click table row button "Restore Row" of table "Sample Table name updated:"
	And I select reason for change "DCF" in RestoreTableRowModalDialog
	And I enter additional notes "Data Backup" in RestoreTableRowModalDialog
	And I click continue button in RestoreTableRowModalDialog
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T34_Verify Item change history for "Sample Table name updated:" table in Form1 visit (Week 2).
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I invoke table hisotry for table "Sample Table name updated:"
    Then I see table history for table "Sample Table name updated:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action            | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Restored | DCF    | Data Backup      |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Deleted  | DCF    | Invalid Data     |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added    |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "Form1" CRF.

Scenario: T35_Add patient 02-PAT from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 02       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 02-PAT    |

Scenario: T36_Select and enroll patient 02-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	And I select the patient "02-PAT" from patients table.
	When I enroll the patient "02-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 02       | 06/13/2018 | Yes           |
	Then I see patient "02-PAT" status as "Enrolled" on Patient details page.

Scenario: T37_Add patient 03-PAT from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 03       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 03-PAT    |

Scenario: T38_Select and enroll patient 03-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	And I select the patient "03-PAT" from patients table.
	When I enroll the patient "03-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 03       | 06/13/2018 | Yes           |
	Then I see patient "03-PAT" status as "Enrolled" on Patient details page.

Scenario: T39_Navigate to Form1 in visit (Week2) event and Add row to the table in 02-Pat.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T40_Delete a row and Save and close the form in form1 week2 sample table.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I expand row "3" of table "Sample Table name updated:"
	And I click table row button "Delete Row" of table "Sample Table name updated:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "Invalid Data" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T41_Restore a row for sample table in Form1 for Visit week2.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I expand row "3" of table "Sample Table name updated:"
	And I click table row button "Restore Row" of table "Sample Table name updated:"
	And I select reason for change "DCF" in RestoreTableRowModalDialog
	And I enter additional notes "Data Backup" in RestoreTableRowModalDialog
	And I click continue button in RestoreTableRowModalDialog
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T42_Verify Item change history for "Sample Table:" table in Form1 visit (Week 2).
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I invoke table hisotry for table "Sample Table name updated:"
    Then I see table history for table "Sample Table name updated:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action            | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Restored | DCF    | Data Backup      |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Deleted  | DCF    | Invalid Data     |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added    |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "Form1" CRF.

Scenario: T43_Navigate to DT1 Dt2 Form in visit (Week 7) event and Add row to the table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T44_Navigate to DT1 Dt2 Form in visit (Week 7) event and delete a row.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I expand row "2" of table "LabId and Gorups:"
	And I click table row button "Delete Row" of table "LabId and Gorups:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "Wrong Data" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.
			
Scenario: T45_Verify the history for added rows and deleted rows on DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "LabId and Gorups:"
    Then I see table history for table "LabId and Gorups:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action           | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

Scenario: T46_Navigate to DT1 Dt2 Form in visit (Week 7) event and Add row to the other table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T47_Verify the history for added rows and deleted rows on DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "Domain Test 2 Table:"
    Then I see table history for table "Domain Test 2 Table:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

Scenario: T48_Navigate to AutoBuild Form01 in visit (Week 51) event Checkout and save the form.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	And I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T49_Verify the AutoBuild Form01 CRF tables history.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	When I invoke table hisotry for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
    Then I see table history for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 7: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:"
    Then I see table history for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.

Scenario: T50_Navigate to Form1 in visit (Week2) event and Add row to the table 03-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	And I click on "Add New Row" button in "Sample Table name updated:" table.
	And I click table row button "Save & Close Row" of table "Sample Table name updated:"
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T51_Delete a row and Save and close the form in form1 week2 ssample table.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I expand row "3" of table "Sample Table name updated:"
	And I click table row button "Delete Row" of table "Sample Table name updated:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "Invalid Data" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T52_Restore a row for sample table in Form1 for Visit week2.
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I expand row "3" of table "Sample Table name updated:"
	And I click table row button "Restore Row" of table "Sample Table name updated:"
	And I select reason for change "DCF" in RestoreTableRowModalDialog
	And I enter additional notes "Data Backup" in RestoreTableRowModalDialog
	And I click continue button in RestoreTableRowModalDialog
	Then I click on "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T53_Verify Item change history for "Sample Table:" table in Form1 visit (Week 2).
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I invoke table hisotry for table "Sample Table name updated:"
    Then I see table history for table "Sample Table name updated:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action            | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Restored | DCF    | Data Backup      |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Deleted  | DCF    | Invalid Data     |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added    |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "Form1" CRF.

Scenario: T54_Navigate to DT1 Dt2 Form in visit (Week 7) event and Add row to the table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T55_Navigate to DT1 Dt2 Form in visit (Week 7) event and delete a row.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I expand row "2" of table "LabId and Gorups:"
	And I click table row button "Delete Row" of table "LabId and Gorups:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "Wrong Data" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T56_Verify the history for added rows and deleted rows on DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "LabId and Gorups:"
    Then I see table history for table "LabId and Gorups:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action           | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

Scenario: T57_Navigate to DT1 Dt2 Form in visit (Week 7) event and Add row to the other table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	And I click on "Add New Row" button in "Domain Test 2 Table:" table.
	And I click table row button "Save & Close Row" of table "Domain Test 2 Table:"
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T58_Verify the history for added rows and deleted rows on DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "Domain Test 2 Table:"
    Then I see table history for table "Domain Test 2 Table:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

Scenario: T59_Navigate to AutoBuild Form01 in visit (Week 51) event Checkout and save the form.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	And I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T60_Verify the AutoBuild Form01 CRF tables history.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	When I invoke table hisotry for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
    Then I see table history for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 7: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:"
    Then I see table history for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.

Scenario: T61_Update study with patient migration on add a question, delete a question, reorder a question and rename a question on a table.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_Added question, deleted ques and updated table order and reorder question V3.zip" with Label "V3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Publishing of Study file (V3) - complete.                                                                                       |

Scenario: T62_Navigate to site and migrate the patient from site(02-Site).
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 02-PAT    |
	| 03-PAT    |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 02 for Study file (V3) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |

Scenario: T63_Select 02-Site and  patient 02-PAT and verify the item history for Add question, delete question, update question and Reorder a questions in table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

Scenario: T64_Verify the history for form1 in visit week2 on reorder the table questions.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I invoke table hisotry for table "Sample Table name updated:"
    Then I see table history for table "Sample Table name updated:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action            | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Restored | DCF    | Data backup      |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Deleted  | DCF    | Invalid Data     |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added    |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "Form1" CRF.

Scenario: T65_Verify the history for Added and deleted questions of a table in DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "LabId and Gorups:"
    Then I see table history for table "LabId and Gorups:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action           | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Domain Test 2 Table:"
    Then I see table history for table "Domain Test 2 Table:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

Scenario: T66_Verify the AutoBuild Form01 CRF tables history after patient migration.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	When I invoke table hisotry for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
    Then I see table history for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 7: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:"
    Then I see table history for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.

Scenario: T67_Select 02-Site and  patient 03-PAT and verify the item history for Add question, delete question, update question and Reorder a questions in table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	Then I see Patient details page for "03-PAT".

Scenario: T68_Verify the history for form1 in visit week2 on reorder the table questions.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I invoke table hisotry for table "Sample Table name updated:"
    Then I see table history for table "Sample Table name updated:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action            | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Restored | DCF    | Data backup      |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Deleted  | DCF    | Invalid Data     |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added    |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "Form1" CRF.

Scenario: T69_Verify the history for Added and deleted questions of a table in DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "LabId and Gorups:"
    Then I see table history for table "LabId and Gorups:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action           | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Domain Test 2 Table:"
    Then I see table history for table "Domain Test 2 Table:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
		
Scenario: T70_Verify the AutoBuild Form01 CRF tables history after patient migration.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	When I invoke table hisotry for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
    Then I see table history for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 7: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:"
    Then I see table history for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.

Scenario: T71_Initiate study archive for sites
       When I select DataManagerPortal item "Export" from drop down
       And I click link "Archive Export" in ExportPage
       And I select sites in ArchiveExportPage
       | Site    |
       | 02-SIte |
       And I click Export button in ArchiveExportPage
       Then I click Continue button of Modal "Archive Export"

Scenario: T72_Download Archive Export zip folder
	When I click main tab "Inbox"
	And I click inbox item "Export (Archive): #2 - complete. Download file." in folder "Jobs"
	And I download the file in the execution folder with name "ArchiveExportFile2".
	Then I see the file with name "ArchiveExportFile2.zip" in execution folder.

Scenario: T73_Unzip a zip folder
	When I unzip folder "ArchiveExportFile2.zip"
	Then I see unzipped folder "ArchiveExportFile2"

Scenario: T74_Save the patient xml file in the execution folder
	When I save the export file in the folder "ArchiveExportFile2\02" containing "02-PAT" in the execution path with name "ArchiveExportActual2.xml".
	Then I have the XML file "ArchiveExportActual2.xml" available in the Test XML Files folder.

	@ObjectiveEvidence @ReqID:Qc1654,QC1697
Scenario: T75_Verify the archive export XML Data for 01-Site with generated archive export XML.
	Given I have the XML file "ArchiveExportExpected2.xml" available in the project folder.
	And I have the XML file "ArchiveExportActual2.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName        | FieldName                 |
	| DateTimeStamp  | CreationDateTime          |
	| SignatureValue | SubjectKey                |
	| DigestValue    | FileOID                   |
	| SourceID       | PriorFileOID              |
	|                | Description               |
	|                | SourceSystemVersion       |
	|                | dl:PatientFormQuestionKey |

Scenario: T76_Initiate study archive for sites
     When I select DataManagerPortal item "Export" from drop down
     And I click link "Archive Export" in ExportPage
     And I select sites in ArchiveExportPage
     | Site    |
     | 02-SIte |
     And I click Export button in ArchiveExportPage
     Then I click Continue button of Modal "Archive Export"

Scenario: T77_Download Archive Export zip folder
	When I click main tab "Inbox"
	And I click inbox item "Export (Archive): #3 - complete. Download file." in folder "Jobs"
	And I download the file in the execution folder with name "ArchiveExportFile3".
	Then I see the file with name "ArchiveExportFile3.zip" in execution folder.

Scenario: T78_Unzip a zip folder
	When I unzip folder "ArchiveExportFile3.zip"
	Then I see unzipped folder "ArchiveExportFile3"

Scenario: T79_Save the patient xml file in the execution folder
	When I save the export file in the folder "ArchiveExportFile3\02" containing "03-PAT" in the execution path with name "ArchiveExportActual3.xml".
	Then I have the XML file "ArchiveExportActual3.xml" available in the Test XML Files folder.

	@ObjectiveEvidence @ReqID:Qc1654,QC1697
Scenario: T80_Verify the archive export XML Data for 01-Site with generated archive export XML.
	Given I have the XML file "ArchiveExportExpected3.xml" available in the project folder.
	And I have the XML file "ArchiveExportActual3.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName        | FieldName                 |
	| DateTimeStamp  | CreationDateTime          |
	| SignatureValue | SubjectKey                |
	| DigestValue    | FileOID                   |
	| SourceID       | PriorFileOID              |
	|                | Description               |
	|                | SourceSystemVersion       |
	|                | dl:PatientFormQuestionKey |

Scenario: T81_Navigate to DT1 Dt2 Form in visit (Week 7) event and Add row to the table.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	And I click on "Add New Row" button in "LabId and Gorups:" table.
	And I click table row button "Save & Close Row" of table "LabId and Gorups:"
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T82_Navigate to DT1 Dt2 Form in visit (Week 7) event and delete a row.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	And I expand row "2" of table "LabId and Gorups:"
	And I click table row button "Delete Row" of table "LabId and Gorups:"
	And I select reason for change "DCF" in DeleteTableRowModalDialog
	And I enter additional notes "Wrong Data" in DeleteTableRowModalDialog
	And I click continue button in DeleteTableRowModalDialog
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T83_Verify the history for added rows and deleted rows on DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "LabId and Gorups:"
    Then I see table history for table "LabId and Gorups:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action           | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.
	
Scenario: T84_Navigate to site and migrate the patient from site(01-Site).
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 01 for Study file (V3) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

Scenario: T85_Update study with patient migration With
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_structure fixed to open and normal to table and vice versa V4.zip" with Label "V4"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                         |
	| Migration of Site 02 for Study file (V4) - complete. 2 out of 2 patients migrated successfully. To review see migration report. |
	| Migration of Site 01 for Study file (V4) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
	| Publishing of Study file (V4) - complete.                                                                                       |
	
Scenario: T86_Select 01-Site and  patient 01-PAT and verify the item history for autobuild table structure fixed to open and update a table question to normal question and normal question to table question.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T87_Verify the history for form1 in visit week2 on reorder the table questions.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	When I invoke table hisotry for table "Sample Table name updated:"
    Then I see table history for table "Sample Table name updated:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action            | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Restored | DCF    | Data backup      |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Deleted  | DCF    | Invalid Data     |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added    |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added    |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "Form1" CRF.

Scenario: T88_Verify the history for updating normal question to table and table question to normal question in DT1 DT2 Form.
	Given I expand "Visit (Week 7)" to select and open "DT1 DT2 Form" CRF.
	When I click "Checkout" button on "DT1 DT2 Form" CRF.
	When I invoke table hisotry for table "LabId and Gorups:"
    Then I see table history for table "LabId and Gorups:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action           | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Deleted | DCF    | Wrong Data       |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added   |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added   |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Domain Test 2 Table:"
    Then I see table history for table "Domain Test 2 Table:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "DT1 DT2 Form" CRF.

Scenario: T89_Verify the AutoBuild Form01 CRF tables history.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	When I invoke table hisotry for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
    Then I see table history for table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 7: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	When I invoke table hisotry for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:"
    Then I see table history for table "Key Sequence on question #1 & #3. Table Structure is fixed. Maximum Rows is exact. Questions (4-7) have queries.:" in TableHistoryModalDialog
	| Name                                   | Server Time | Action         | reason | Additional Notes |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 6: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 5: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 4: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 3: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 2: Added |        |                  |
	| testadmin testadmin (EDCDEV\testadmin) |             | Row # 1: Added |        |                  |
	And I click cancel button in ChangeHistoryModal
	Then I click on "Save & Close" button on "AutoBuild Form01" CRF.
	
Scenario: T90_Initiate study archive for sites
     When I select DataManagerPortal item "Export" from drop down
     And I click link "Archive Export" in ExportPage
     And I select sites in ArchiveExportPage
     | Site    |
     | 01-SIte |
	 And I click Export button in ArchiveExportPage
     Then I click Continue button of Modal "Archive Export"

Scenario: T91_Download Archive Export zip folder
	When I click main tab "Inbox"
	And I click inbox item "Export (Archive): #4 - complete. Download file." in folder "Jobs"
	And I download the file in the execution folder with name "ArchiveExportFile4".
	Then I see the file with name "ArchiveExportFile4.zip" in execution folder.

Scenario: T92_Unzip a zip folder
	When I unzip folder "ArchiveExportFile4.zip"
	Then I see unzipped folder "ArchiveExportFile4"

Scenario: T93_Save the patient xml file in the execution folder
	When I save the export file in the folder "ArchiveExportFile4\01" containing "01-PAT" in the execution path with name "ArchiveExportActual4.xml".
	Then I have the XML file "ArchiveExportActual4.xml" available in the Test XML Files folder.

	@ObjectiveEvidence @ReqID:Qc1654,QC1697
Scenario: T94_Verify the archive export XML Data for 01-Site with generated archive export XML.
	Given I have the XML file "ArchiveExportExpected4.xml" available in the project folder.
	And I have the XML file "ArchiveExportActual4.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName        | FieldName                 |
	| DateTimeStamp  | CreationDateTime          |
	| SignatureValue | SubjectKey                |
	| DigestValue    | FileOID                   |
	| SourceID       | PriorFileOID              |
	|                | Description               |
	|                | SourceSystemVersion       |
	|                | dl:PatientFormQuestionKey |

Scenario: T95_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 

























































































































































































































































































































































































