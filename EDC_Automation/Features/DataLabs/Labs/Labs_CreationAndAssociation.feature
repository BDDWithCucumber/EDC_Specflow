Feature: Labs_CreationAndAssociation

@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Add Sites
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	Then I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| S11    | Site1    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| S12    | Site2    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| S13    | Site3    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
	| S14    | Site4    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
	| S21    | Site21   | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |

@ObjectiveEvidence @ReqID:US37916.1
Scenario: 03_Remove user testadmin testadmin user to site S11
	When I open site with siteid "S11" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I remove and save user "testadmin testadmin" from site users in SiteManageUsersPage
	Then I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence @ReqID:US37916.1
Scenario: 04_Remove user testadmin testadmin user to site S12
	When I click breadcrumb "Site Management" 
	And I open site with siteid "S12" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I remove and save user "testadmin testadmin" from site users in SiteManageUsersPage
	Then  I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence @ReqID:US37916.1
Scenario: 05_Remove user testadmin testadmin user to site S13
	When I click breadcrumb "Site Management"
	And I open site with siteid "S13" and site name "Site3" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I remove and save user "testadmin testadmin" from site users in SiteManageUsersPage
	Then  I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence @ReqID:US37916.1
Scenario: 06_00_Remove user testadmin testadmin user to site S14
	When I click breadcrumb "Site Management"
	And I open site with siteid "S14" and site name "Site4" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I remove and save user "testadmin testadmin" from site users in SiteManageUsersPage
	Then  I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence @ReqID:US37916.2
Scenario: 06_01_Set default site permissions
	When I click breadcrumb "Study Administration"
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I set permissions for loggedin user group in EditPermissionsPage
	| Category         | Permission                | PermissionType |
	| Site Permissions | Associate Lab(s) to Site  | Edit           |
	| Lab Permissions  | Lab Management            | Edit           |
	| Lab Permissions  | Add Lab                   | Allow          |
	| Lab Permissions  | Associate Site(s) to Lab  | Edit           |
	| Lab Permissions  | Manage Reference Ranges   | Edit           |
	| Lab Permissions  | Manage Laboratories       | Edit           |
	| Lab Permissions  | Normalize Lab Data        | Edit           |
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "S11" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I remove and save user "testadmin testadmin" from site users in SiteManageUsersPage
	Then I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence @ReqID:US37916.2
Scenario: 06_02_Verify Associate Lab(s) availability after permissions but without site "S12-Site2" access
	When I click breadcrumb "Site Management" 
	And I open site with siteid "S12" and site name "Site2" from SiteManagement page
	Then  I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence @ReqID:US37916.2
Scenario: 06_03_Verify Associate Lab(s) availability after permissions but without site "S13-Site3" access
	When I click breadcrumb "Site Management"
	And I open site with siteid "S13" and site name "Site3" from SiteManagement page
	Then  I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence @ReqID:US37916.2
Scenario: 06_04_Verify Associate Lab(s) availability after permissions but without site "S14-Site4" access
	When I click breadcrumb "Site Management"
	And I open site with siteid "S14" and site name "Site4" from SiteManagement page
	Then  I do not see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

@ObjectiveEvidence @ReqID:US36583.1,US36583.2,US37114.1,US37116.1,US37116.2,US44334.1
Scenario: 06_05_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I enter labs details and Save
	| LabId | LaboratoryName | Company    | Department | Address1 | Address2 | Address3 | City   | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L21   | Lab21          | PFIZER     | RD         | A1       | A2       | A3       | City1  | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L22   | Lab22          | PFIZER     | RD         | A1       | A2       | A3       | City2  | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L23   | Lab23          | NOVARTIS   | Research   | A1       | A2       | A3       | City3  | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	| L24   | Lab24          | NOVARTIS   | Research   | A1       | A2       | A3       | City4  | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.MNO        |
	| L25   | Lab25          | CIPLA      | Production | A1       | A2       | A3       | City5  | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L111  | Lab11          | CIPLA      | Production | A1       | A2       | A3       | City6  | KL    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L112  | Lab112         | Dr.Reddy's | Trials     | A1       | A2       | A3       | City7  | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |
	| L113  | Lab113         | Dr.Reddy's | Trials     | A1       | A2       | A3       | City8  | PA    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	| L114  | Lab114         | Dr.Reddy's | RD         | A1       | A2       | A3       | City9  | HP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
	| L115  | Lab115         | Dr.Reddy's | RD         | A1       | A2       | A3       | City10 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company    | Department | Address  | City   | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L21   | Lab21          | PFIZER     | RD         | A1 A2 A3 | City1  | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L22   | Lab22          | PFIZER     | RD         | A1 A2 A3 | City2  | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L23   | Lab23          | NOVARTIS   | Research   | A1 A2 A3 | City3  | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	| L24   | Lab24          | NOVARTIS   | Research   | A1 A2 A3 | City4  | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.MNO        |
	| L25   | Lab25          | CIPLA      | Production | A1 A2 A3 | City5  | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L111  | Lab11          | CIPLA      | Production | A1 A2 A3 | City6  | KL    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L112  | Lab112         | Dr.Reddy's | Trials     | A1 A2 A3 | City7  | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |
	| L113  | Lab113         | Dr.Reddy's | Trials     | A1 A2 A3 | City8  | PA    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	| L114  | Lab114         | Dr.Reddy's | RD         | A1 A2 A3 | City9  | HP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
	| L115  | Lab115         | Dr.Reddy's | RD         | A1 A2 A3 | City10 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |


Scenario: 07_00_Assign testadmin testadmin user to site S11
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "S11" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 07_01_Dissociate all labs from site "S11 - Site1"
	When I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I dissociate all labs in AssociateLabsPage

Scenario: 08_00_Assign testadmin1 user to site S12
	When I click breadcrumb "Site Management" 
	And I open site with siteid "S12" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 08_01_Dissociate all labs from site "S12 - Site2"
	When I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I dissociate all labs in AssociateLabsPage

Scenario: 09_00_Assign testadmin1 user to site S13
	When I click breadcrumb "Site Management"
	And I open site with siteid "S13" and site name "Site3" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 09_01_Dissociate all labs from site "S11 - Site1"
	When I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I dissociate all labs in AssociateLabsPage

Scenario: 10_00_Assign testadmin1 user to site S14
	When I click breadcrumb "Site Management"
	And I open site with siteid "S14" and site name "Site4" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 10_01_Dissociate all labs from site "S14 - Site1"
	When I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I dissociate all labs in AssociateLabsPage


@ObjectiveEvidence @ReqID:US37114.2,US37114.4,US37116.3
Scenario: 12_Edit lab with valid data
	When I edit Lab "L112" And Save Lab with details
	| LabId | LaboratoryName | Company    | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L1121  | Lab1121         | Dr.Reddy's | RD     | A1       | A2       | A3       | City7 | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company    | Department | Address1 | Address2 | Address3 | City   | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L1121 | Lab1121        | Dr.Reddy's | RD         | A1       | A2       | A3       | City7  | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |

@ObjectiveEvidence @ReqID:US37114,US37116.3
Scenario: 13_Edit lab with valid data (reverting edited lab data)
	When I edit Lab "L1121" And Save Lab with details
	| LabId | LaboratoryName | Company    | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L112  | Lab112         | Dr.Reddy's | RD         | A1       | A2       | A3       | City7 | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company    | Department | Address1 | Address2 | Address3 | City   | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L112  | Lab112         | Dr.Reddy's | RD         | A1       | A2       | A3       | City7  | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |

@ObjectiveEvidence @ReqID:US37114.3,US37116.4
Scenario: 14_Check require error for required fields
	When I click ActionPalette Item "Add Lab" in "LabMgmt_Actions" ActionPalette
	And I clik LabCreation save button
	Then I see LabCreation error message "Required" for column "Lab ID: *"
	And I see LabCreation error message "Required" for column "Laboratory Name: *"
	And I see LabCreation error message "Required" for column "Company: *"
	And I see LabCreation error message "Required" for column "ISO Country: *"
	And I press LabCreation cancel button

@ObjectiveEvidence @ReqID:US37114.5
Scenario: 15_Check duplicate lab id error
	When I edit Lab "L111" And Save Lab with duplicate details
	| LabId |
	| L21   |
	Then I see LabCreation error message "Duplicate Lab ID" for column "Lab ID: *"
	And I press LabCreation cancel button
	And I see data in sort order "Ascending" in column "Lab Id" in LabGrid

Scenario: 16_Check sort for Laboratory Name column for ascending
	When I sort column "Lab Id" in LabsGrid of LabManagementPage
	Then I see data in sort order "Descending" in column "Laboratory Name" in LabGrid

Scenario: 17_Check sort for Lab Id column for descending
	When I sort column "Lab Id" in LabsGrid of LabManagementPage
	Then I see data in sort order "Ascending" in column "Lab Id" in LabGrid

Scenario: 18_Check sort for Laboratory Name column for descending
	When I sort column "Laboratory Name" in LabsGrid of LabManagementPage
	Then I see data in sort order "Ascending" in column "Laboratory Name" in LabGrid

Scenario: 19_Check sort for Laboratory Name column for descending
	When I sort column "Laboratory Name" in LabsGrid of LabManagementPage
	Then I see data in sort order "Descending" in column "Laboratory Name" in LabGrid

Scenario: 20_Check sort for Company column for ascending
	When I sort column "Company" in LabsGrid of LabManagementPage
	Then I see data in sort order "Ascending" in column "Company" in LabGrid

Scenario: 21_Check sort for Company column for descending
	When I sort column "Company" in LabsGrid of LabManagementPage
	Then I see data in sort order "Descending" in column "Company" in LabGrid

Scenario: 22_Check sort for Department column for ascending
	When I sort column "Department" in LabsGrid of LabManagementPage
	Then I see data in sort order "Ascending" in column "Department" in LabGrid

Scenario: 23_Check sort for Department column for descending
	When I sort column "Department" in LabsGrid of LabManagementPage
	Then I see data in sort order "Descending" in column "Department" in LabGrid

Scenario: 24_Check sort for City/Town column for ascending
	When I sort column "City/Town" in LabsGrid of LabManagementPage
	Then I see data in sort order "Ascending" in column "City/Town" in LabGrid

Scenario: 25_Check sort for City/Town column for descending
	When I sort column "City/Town" in LabsGrid of LabManagementPage
	Then I see data in sort order "Descending" in column "City/Town" in LabGrid

Scenario: 26_Check sort for State/Province column for ascending
	When I sort column "State/Province" in LabsGrid of LabManagementPage
	Then I see data in sort order "Ascending" in column "State/Province" in LabGrid

Scenario: 27_Check sort for State/Province column for descending
	When I sort column "State/Province" in LabsGrid of LabManagementPage
	Then I see data in sort order "Descending" in column "State/Province" in LabGrid

Scenario: 28_Check sort for Country column for ascending
	When I sort column "Country" in LabsGrid of LabManagementPage
	Then I see data in sort order "Ascending" in column "Country" in LabGrid

Scenario: 29_Check sort for Country column for descending
	When I sort column "Country" in LabsGrid of LabManagementPage
	Then I see data in sort order "Descending" in column "Country" in LabGrid

Scenario: 30_Check sort for Lab Status column for ascending
	When I sort column "Lab Status" in LabsGrid of LabManagementPage
	Then I see data in sort order "Ascending" in column "Lab Status" in LabGrid

Scenario: 31_Check sort for Lab Status column for descending
	When I sort column "Lab Status" in LabsGrid of LabManagementPage
	Then I see data in sort order "Descending" in column "Lab Status" in LabGrid

Scenario: 32_Filter Lab Id column with IsEqualTo filter criteria
	When I apply filter on column "Lab ID" with filter text "L111" by filter criteria "Is equal to" in ManageReferenceRangesPage
	#When I apply filter on column "Lab Id" with filter text "L111" by filter criteria "Is equal to" in LabsGrid
	Then I see filtered data in column "Lab Id" with filter text "L111" and filter criteria "Is equal to" in LabsGrid
	And I clear filter on column "Lab Id" in LabsGrid

Scenario: 33_Filter Laboratory Name column with IsNotEqualTo filter criteria
	When I apply filter on column "Laboratory Name" with filter text "ABCD" by filter criteria "Is not equal to" in ManageReferenceRangesPage
	#When I apply filter on column "Laboratory Name" with filter text "ABCD" by filter criteria "Is not equal to" in LabsGrid
	Then I see filtered data in column "Laboratory Name" with filter text "ABCD" and filter criteria "Is not equal to" in LabsGrid
	And I clear filter on column "Laboratory Name" in LabsGrid

Scenario: 34_Filter Company column with Contains filter criteria
	When I apply filter on column "Company" with filter text "ZER" by filter criteria "Contains" in ManageReferenceRangesPage
	#When I apply filter on column "Company" with filter text "ZER" by filter criteria "Contains" in LabsGrid
	Then I see filtered data in column "Company" with filter text "ZER" and filter criteria "Contains" in LabsGrid
	And I clear filter on column "Company" in LabsGrid

Scenario: 35_00_Filter Department column with DoesNotContain filter criteria
	When I apply filter on column "Department" with filter text "RD" by filter criteria "Does not contain" in ManageReferenceRangesPage
	#When I apply filter on column "Department" with filter text "RD" by filter criteria "Does not contain" in LabsGrid
	Then I see filtered data in column "Department" with filter text "RD" and filter criteria "Does not contain" in LabsGrid
	And I clear filter on column "Department" in LabsGrid

Scenario: 35_01_Filter Address column with EndsWith filter criteria
	When I apply filter on column "Address" with filter text "A3" by filter criteria "Ends with" in ManageReferenceRangesPage
	#When I apply filter on column "Address" with filter text "A3" by filter criteria "Ends with" in LabsGrid
	Then I see filtered data in column "Address" with filter text "A3" and filter criteria "Ends with" in LabsGrid
	And I clear filter on column "Address" in LabsGrid

Scenario: 36_Filter City/Town column with EndsWith filter criteria
	When I apply filter on column "City/Town" with filter text "1" by filter criteria "Ends with" in ManageReferenceRangesPage
	#When I apply filter on column "City/Town" with filter text "1" by filter criteria "Ends with" in LabsGrid
	Then I see filtered data in column "City/Town" with filter text "1" and filter criteria "Ends with" in LabsGrid
	And I clear filter on column "City/Town" in LabsGrid

Scenario: 37_Filter State/Province column with EndsWith filter criteria
	When I apply filter on column "State/Province" with filter text "A" by filter criteria "Starts with" in ManageReferenceRangesPage
	#When I apply filter on column "State/Province" with filter text "A" by filter criteria "Starts with" in LabsGrid
	Then I see filtered data in column "State/Province" with filter text "A" and filter criteria "Starts with" in LabsGrid
	And I clear filter on column "State/Province" in LabsGrid

Scenario: 38_Filter Country column with IsEqualTo filter criteria
	When I apply filter on column "Country" with filter text "india" by filter criteria "Is equal to" in ManageReferenceRangesPage
	#When I apply filter on column "Country" with filter text "india" by filter criteria "Is equal to" in LabsGrid
	Then I see filtered data in column "Country" with filter text "INDIA" and filter criteria "Is equal to" in LabsGrid
	And I clear filter on column "Country" in LabsGrid

Scenario: 39_Filter Lab Status column with IsNotEqualTo filter criteria
	When I apply filter on column "Lab Status" with filter text "inactive" by filter criteria "Is not equal to" in ManageReferenceRangesPage
	#When I apply filter on column "Lab Status" with filter text "inactive" by filter criteria "Is not equal to" in LabsGrid
	Then I see filtered data in column "Lab Status" with filter text "inactive" and filter criteria "Is not equal to" in LabsGrid
	And I clear filter on column "Lab Status" in LabsGrid

@ObjectiveEvidence @ReqID:US36740.4
Scenario: 41_Verify available sites
    When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	Then I see sites in available sites in AssociateSitesPage
	| Site      |
	| S11 - Site1 |
	| S12 - Site2 |
	| S13 - Site3 |
	| S14 - Site4 |

@ObjectiveEvidence @ReqID:US36740.3,US36903.3,US36903.4
Scenario: 42_Associate multiple sites to a Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I enter filter text "S1" in associated sites filter textbox in AssociateSitesPage
	And I add and save sites to assocaited sites in LabManagementSitesPage
	| Site      |
	| S11 - Site1 |
	| S12 - Site2 |
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |
	And I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S12    | Site2    | Hyderabad | AP    | INDIA   | Active     |

Scenario: 43_Dissociate multiple sites to a Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I remove and save sites from assocaited sites in LabManagementSitesPage
	| Site      |
	| S11 - Site1 |
	| S12 - Site2 |
	Then I see No records message in sites tab of Lab in LabPage

@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2
Scenario: 44_Associate Site S11 for L21 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S11" and site name "Site1" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |

@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2
Scenario: 45_Associate Site S12 for L21 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S12" and site name "Site2" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |
	And I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S12    | Site2    | Hyderabad | AP    | INDIA   | Active     |

@ObjectiveEvidence @ReqID:US36740.5
Scenario: 46_Filter Available sites in Associate sites page
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	When I enter filter text "S13" in available sites filter textbox in AssociateSitesPage
	Then I see filtered sites in available sites listbox based on searchtext "S13" in AssociateSitesPage

@ObjectiveEvidence @ReqID:US36740.5
Scenario: 47_Filter Available sites in Associate sites page
	When I enter filter text "S1" in associated sites filter textbox in AssociateSitesPage
	Then I see filtered sites in associated sites listbox based on searchtext "S1" in AssociateSitesPage
	
@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2
Scenario: 48_Associate Site S12 for L22 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L22" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S12" and site name "Site2" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S12    | Site2    | Hyderabad | AP    | INDIA   | Active     |

@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2
Scenario: 49_Associate Site S13 for L22 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L22" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S13" and site name "Site3" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S12    | Site2    | Hyderabad | AP    | INDIA   | Active     |
	And I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S13    | Site3    | Hyderabad | AP    | INDIA   | Inactive   |

@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2
Scenario: 50_Associate Site S13 for L23 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L23" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S13" and site name "Site3" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S13    | Site3    | Hyderabad | AP    | INDIA   | Inactive   |

@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2
Scenario: 51_Associate Site S14 for L23 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L23" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S14" and site name "Site4" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S13    | Site3    | Hyderabad | AP    | INDIA   | Inactive   |
	And I see site data in sites tab of Lab in LabPage 
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S14    | Site4    | Hyderabad | AP    | INDIA   | Inactive   |

@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2
Scenario: 52_Associate Site S14 for L24 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L24" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S14" and site name "Site4" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S14    | Site4    | Hyderabad | AP    | INDIA   | Inactive   |

@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2
Scenario: 53_Associate Site S11 for L24 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L24" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S11" and site name "Site1" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S14    | Site4    | Hyderabad | AP    | INDIA   | Inactive   |
	And I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |

@ObjectiveEvidence @ReqID:US36740.2,US36740.3,US36901.1,US36901.2,US37110.2
Scenario: 54_Unassociate Site S11 for L21 Lab
	When I click breadcrumb "Lab Management"
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I remove and save sites from assocaited sites in LabManagementSitesPage
	| Site      |
	| S11 - Site1 |
	| S12 - Site2 |
	Then I see No records message in sites tab of Lab in LabPage

@ObjectiveEvidence @ReqID:US37110.1,US37126.1,US37126.2,US45202.1,US44334.2
Scenario: 56_Associate Lab L22 for Site S11
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "S11" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L22" and lab name "Lab22" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | Address  | LaboratoryStatus |
	| L22   | Lab22          | PFIZER  | RD         | A1 A2 A3 | Active           |
	
@ObjectiveEvidence @ReqID:US37110.1,US37126.1,US37126.2,US37851.1,US37851.2,US45202.1,US44334.2
Scenario: 57_Associate Lab L23 for Site S12
	When I click breadcrumb "Site Management"
	And I open site with siteid "S12" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L23" and lab name "Lab23" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | Address  | LaboratoryStatus |
	| L23   | Lab23          | NOVARTIS | Research   | A1 A2 A3 | Active           |
	And I click labid "L23" in Labs subtab of SitePage
	And I see lab data in LabInformationModalDialog
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L23   | Lab23          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) | INDIA   | 11111111 | 22222222 | Active           | Mr.IJK        |
	And I click close button in LabInformationModalDialog 

@ObjectiveEvidence @ReqID:US37110.1,US37126.1,US37126.2,US37851.1,US37851.2,US45202.1
Scenario: 58_Associate Lab L24 for Site S13
	When I click breadcrumb "Site Management"
	And I open site with siteid "S13" and site name "Site3" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L24" and lab name "Lab24" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L24   | Lab24          | NOVARTIS | Research   | Inactive         |
	And I click labid "L24" in Labs subtab of SitePage
	And I see lab data in LabInformationModalDialog
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L24   | Lab24          | NOVARTIS | Research   | A1       | A2       | A3       | City4 | GOA   | 500084 | INDIA(IND) | INDIA   | 11111111 | 22222222 | Inactive         | Mr.MNO        |
	And I click close button in LabInformationModalDialog 

@ObjectiveEvidence @ReqID:US37110.1,US37126.1,US37126.2,US37851.1,US37851.2,US45202.1
Scenario: 59_Associate Lab L21 for Site S14
	When I click breadcrumb "Site Management"
	And I open site with siteid "S14" and site name "Site4" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L21" and lab name "Lab21" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L21   | Lab21          | PFIZER  | RD         | Active           |
	And I click labid "L21" in Labs subtab of SitePage
	And I see lab data in LabInformationModalDialog
	| LabId | LaboratoryName | Company | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L21   | Lab21          | PFIZER  | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) | INDIA   | 11111111 | 22222222 | Active           | Mr.XYZ        |
	And I click close button in LabInformationModalDialog 
	
@ObjectiveEvidence @ReqID:US36903.1,US36903.2
Scenario: 60_Filter Available Labs in Associate Labs page
	When I click breadcrumb "Site Management"
	And I open site with siteid "S13" and site name "Site3" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I enter filter text "L2" in available labs filter textbox in AssociateLabsPage
	Then I see filtered labs in available labs listbox based on searchtext "L2" in AssociateLabsPage

@ObjectiveEvidence @ReqID:US36903.2
Scenario: 61_Filter Associated Labs in Associate Labs page
	When I enter filter text "L11" in associated labs filter textbox in AssociateLabsPage
	Then I see filtered labs in associated labs listbox based on searchtext "L11" in AssociateLabsPage

Scenario: 99_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page



############ DONE ############
# US36583 - DL: Lab Administration Link in Study Administration page - Swathi
# US37114 - DL: Lab Creation/Update including link
# US37114 - US37115 - [Unfinished] DL: Lab Creation/Update including link - Sirisha
# US37114 - US36586	- [Continued] DL: Lab Creation/Update including link - Sirisha 
# US37110 - DL: Site To Lab Association including Associate Lab(s) link on Site Management page
# US37110 - US37111 - [Unfinished] DL: Site To Lab Association including Associate Lab(s) link on Site Management page - Surya
# US37110 - US36587 - [Continued] DL: Site To Lab Association including Associate Lab(s) link on Site Management page - Surya
# US37126 - DL: Add Labs grid on Site details screen - Malli
# US37851 - DL: Labs grid on Site details screen - Lab ID is link that displays lab properties - Harish
# US45202 - DL: Lab Information - Include Zip/Postal Code, Contact Person - Harish
# US36901 - DL: Sites grid on Edit Lab - Malli
# US37116 - DL: Lab Management - Labs grid
# US37116-US37117 - DL: Lab Management - Labs grid - Not task added for testing
# US37116-US36891 - [Continued] DL: Lab Management - Labs grid - Sirisha
# US36740 - DL: Associate Site(s) to a Lab - Swathi
# US36903 - DL: Associate Lab(s) to a Site - Filters - Surya
# US44334 - DL: Include address as a column on Labs grid - Swathi
# US37916 - DL: Hide Associate Lab(s) link for users with no access to selected site - Harish

############ NOTE ############
# I can view lab details only when I have view or edit access to Site Management. (US37851.3)
# All the fields listed in notes shall be Unicode supportive.(US37114.6)


############ NOT REQUIRED - Implementation reverted (19-Apr-2018) ############
# US37368 - DL: Site Management>Add Site - Add Save & Associate Lab(s) button - Surya (Since this button is removed in later user story, automation steps related to this are deleted)
# US38327 - DL: Site Management>Add Site - Remove Save & Associate Lab(s) button - Sirisha (Since it is deleting of a button, no automation is added)
