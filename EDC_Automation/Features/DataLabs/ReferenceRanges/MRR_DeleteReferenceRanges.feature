Feature: MRR_DeleteReferenceRanges
@ObjectiveEvidence	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

#Scenario: 02_Delete a study
#	When I delete study
#	Then I see study label "No Study Loaded" in header
#
#Scenario: 03_Publish a study
#	When I click breadcrumb "Study Management"
#	And I upload a study "Test3210_Labs_Dict_givenbyedcdev.zip" with study label "Mrr"
#	Then I see study label "Test3210" in header
#
#Scenario: 04_Add Sites
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I enter sites details and Save
#	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
#	| S11    | Site1    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#	| S12    | Site2    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#	| S13    | Site3    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
#	| S14    | Site4    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
#	| S21    | Site21   | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
#
#Scenario: 05_Assign testadmin testadmin user to site S11
#	When I click breadcrumb "Site Management"
#	And I open site with siteid "S11" and site name "Site1" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#
#Scenario: 06_Assign testadmin1 user to site S12
#	When I click breadcrumb "Site Management" 
#	And I open site with siteid "S12" and site name "Site2" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#
#Scenario: 07_Assign testadmin1 user to site S13
#	When I click breadcrumb "Site Management"
#	And I open site with siteid "S13" and site name "Site3" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#
#Scenario: 08_Assign testadmin1 user to site S14
#	When I click breadcrumb "Site Management"
#	And I open site with siteid "S14" and site name "Site4" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#
#Scenario: 09_Add Labs
#	When I click breadcrumb "Study Administration"
#	And I click Link "Lab Management" In StudyAdministrationPage
#	And I enter labs details and Save
#	| LabId | LaboratoryName | Company    | Department | Address1 | Address2 | Address3 | City   | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L21   | Lab21          | PFIZER     | RD         | A1       | A2       | A3       | City1  | AP    | 500084 | INDIA(IND) |  INDIA	 | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L22   | Lab22          | PFIZER     | RD         | A1       | A2       | A3       | City2  | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L23   | Lab23          | NOVARTIS   | Research   | A1       | A2       | A3       | City3  | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	| L24   | Lab24          | NOVARTIS   | Research   | A1       | A2       | A3       | City4  | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.MNO        |
#	| L25   | Lab25          | CIPLA      | Production | A1       | A2       | A3       | City5  | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L111  | Lab11          | CIPLA      | Production | A1       | A2       | A3       | City6  | KL    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L112  | Lab112         | Dr.Reddy's | Trials     | A1       | A2       | A3       | City7  | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |
#	| L113  | Lab113         | Dr.Reddy's | Trials     | A1       | A2       | A3       | City8  | PA    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	| L114  | Lab114         | Dr.Reddy's | RD         | A1       | A2       | A3       | City9  | HP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
#	| L115  | Lab115         | Dr.Reddy's | RD         | A1       | A2       | A3       | City10 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	Then I see labs with details in lab grid
#	| LabId | LaboratoryName | Company    | Department | Address  | City   | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L21   | Lab21          | PFIZER     | RD         | A1 A2 A3 | City1  | AP    | 500084 | INDIA(IND) | INDIA   | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L22   | Lab22          | PFIZER     | RD         | A1 A2 A3 | City2  | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L23   | Lab23          | NOVARTIS   | Research   | A1 A2 A3 | City3  | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	| L24   | Lab24          | NOVARTIS   | Research   | A1 A2 A3 | City4  | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.MNO        |
#	| L25   | Lab25          | CIPLA      | Production | A1 A2 A3 | City5  | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L111  | Lab11          | CIPLA      | Production | A1 A2 A3 | City6  | KL    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L112  | Lab112         | Dr.Reddy's | Trials     | A1 A2 A3 | City7  | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |
#	| L113  | Lab113         | Dr.Reddy's | Trials     | A1 A2 A3 | City8  | PA    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	| L114  | Lab114         | Dr.Reddy's | RD         | A1 A2 A3 | City9  | HP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
#	| L115  | Lab115         | Dr.Reddy's | RD         | A1 A2 A3 | City10 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#
#Scenario: 10_Associate Site S11 for L21 Lab
#	When I click breadcrumb "Lab Management"
#	And I open lab with labid "L21" from LabManagement page
#	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
#	And I add and save site id "S11" and site name "Site1" to assocaited sites in LabManagementSitesPage
#	Then I see site data in sites tab of Lab in LabPage
#	| SiteId | SiteName | City      | State | Country | SiteStatus |
#	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |
#
#Scenario: 11_Associate Site S12 for L21 Lab
#	When I click breadcrumb "Lab Management"
#	And I open lab with labid "L21" from LabManagement page
#	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
#	And I add and save site id "S12" and site name "Site2" to assocaited sites in LabManagementSitesPage
#	Then I see site data in sites tab of Lab in LabPage
#	| SiteId | SiteName | City      | State | Country | SiteStatus |
#	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |
#	And I see site data in sites tab of Lab in LabPage
#	| SiteId | SiteName | City      | State | Country | SiteStatus |
#	| S12    | Site2    | Hyderabad | AP    | INDIA   | Active     |
#
#Scenario: 12_Verification of reference ranges only when the group I belong to is authorized to edit reference ranges.
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Group Management" In StudyAdministrationPage
#	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
#	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
#	And I expand PermissionsGroup "Lab Permissions"
#	And I set value in category "Lab Permissions" for permission " Manage Reference Ranges " for permission type "Edit" in EditPermissions page
#	And I click save button in edit permissions page
#	And I click continue in modal dialog having title "Edit Permissions" and partial message "group security you belong to"
#	And I click contineu in reset session modal having partial message "continue your session"	

Scenario: 13_Verify the Delete Icon confirmation pop up functionality in Mrr table When the user clicks on continue in Confirmation popup 
	When I navigate to "Labs" tab from main menu.		
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page	
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |	
	And I click on "Delete" icon for the that record
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 1 reference range record?"
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

Scenario: 14_Verify the functionality of View deleted Reference Ranges checkbox when selected
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page	
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |	
	And I click on "Delete" icon for the that record
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 1 reference range record?"
	And I Check the Checkbox View deleted Reference Ranges	
	Then I should see the records in strikethrough mode and no Checkbox displayed for the deleted record	
	And I shouldnot see the "Edit" icon for the deleted records
	And I shouldnot see the "Delete" icon for the deleted records
	And I should see the "Copy" icon in enabled state for the deleted records
	And I should see the "History" icon in enabled state for the deleted records

Scenario: 15_Verify the functionality of View deleted Reference Ranges checkbox when unselected
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page	
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |	
	And I click on "Delete" icon for the that record
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 1 reference range record?"
	And I Check the Checkbox View deleted Reference Ranges
	And I uncheck the Checkbox View deleted Reference ranges
	Then I shouldnot see the deleted records
	
Scenario: 16_Verify the Delete Icon functionality when the user clicks on cancel on the confirmation pop up
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page	
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |	
	And I click on "Delete" icon for the that record
	And I click cancel in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 1 reference range record?"	
	Then I should still see the record in MRR table

Scenario: 17_Verify the Delete button functionality in Mrr page for deleting multiple records
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page
	And I sort column "Ref ID" in MrrGrid of ManageReferenceRangesPage
	And I selected the below mentioned rows in the Mrr table
	|Row|
	| 1 |
	| 2 |
	| 3 |
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |
	| 2 |
	| 3 |	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 3 reference range records?"	
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage		

Scenario: 18_Verify the Delete button functionality in Mrr page when the user clicks on Continue in the confirmation popup
When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page
	And I sort column "Ref ID" in MrrGrid of ManageReferenceRangesPage
	And I selected the below mentioned rows in the Mrr table
	|Row|
	| 1 |
	| 2 |
	| 3 |
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |
	| 2 |
	| 3 |	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 3 reference range records?"		
	And I Check the Checkbox View deleted Reference Ranges
	Then I should see the records in strikethrough mode and no Checkbox displayed for the deleted record
	And I shouldnot see the "Edit" icon for the deleted records
	And I shouldnot see the "Delete" icon for the deleted records
	And I should see the "Copy" icon in enabled state for the deleted records
	And I should see the "History" icon in enabled state for the deleted records

Scenario: 19_Verify the Delete button functionality in Mrr page when the user clicks on cancel on the confirmation pop up
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page	
	And I selected the below mentioned rows in the Mrr table
	|Row|
	| 1 |
	| 2 |
	| 3 |
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |
	| 2 |
	| 3 |	
	And I click on Delete button
	And I click cancel in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 3 reference range records?"			
	Then I should still see the record in MRR table

Scenario: 20_Verify the functionality of View deleted Reference Ranges checkbox when unselected
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page	
	And I selected the below mentioned rows in the Mrr table
	|Row|
	| 1 |
	| 2 |
	| 3 |
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |
	| 2 |
	| 3 |	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 3 reference range records?"		
	And I Check the Checkbox View deleted Reference Ranges
	And I uncheck the Checkbox View deleted Reference ranges
	Then I shouldnot see the deleted records

Scenario: 21_Verify the functionality of Delete button without selecting the records
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page		
	And I click on Delete button	
	Then I should see a modal dialog having title "Delete Reference Ranges" and partial message "Please select record(s) to delete."
	

	
	
	
