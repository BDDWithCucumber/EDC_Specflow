Feature: MRR_Display_Standarad_Values
	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Study2_DICT_20181016_T16550627.zip" with study label "Mrr"
	Then I see study label "Study1" in header

Scenario: 04_Add Sites
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| S11    | Site1    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| S12    | Site2    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| S13    | Site3    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
	| S14    | Site4    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
	| S21    | Site21   | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |

Scenario: 05_Assign testadmin testadmin user to site S11
	When I click breadcrumb "Site Management"
	And I open site with siteid "S11" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 06_Assign testadmin1 user to site S12
	When I click breadcrumb "Site Management" 
	And I open site with siteid "S12" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 07_Assign testadmin1 user to site S13
	When I click breadcrumb "Site Management"
	And I open site with siteid "S13" and site name "Site3" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 08_Assign testadmin1 user to site S14
	When I click breadcrumb "Site Management"
	And I open site with siteid "S14" and site name "Site4" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette

Scenario: 09_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
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

Scenario: 10_Associate Site S11 for L21 Lab
	When I click breadcrumb "Lab Management"
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S11" and site name "Site1" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |

Scenario: 11_Associate Site S12 for L21 Lab
	When I click breadcrumb "Lab Management"
	And I open lab with labid "L21" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I add and save site id "S12" and site name "Site2" to assocaited sites in LabManagementSitesPage
	Then I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |
	And I see site data in sites tab of Lab in LabPage
	| SiteId | SiteName | City      | State | Country | SiteStatus |
	| S12    | Site2    | Hyderabad | AP    | INDIA   | Active     |

Scenario: 12_Verify the MRR table Column names when user clicks on  Mrr Lab Test Page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from Mrr page
	And I open Lab Test named "Hemoglobin (HB)" from Mrr page
	Then I see the message "No records to display" before adding the records

Scenario: 13_Verify the MRR table Column names when user clicks on  Mrr Lab Test Page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from Mrr page
	And I open Lab Test named "Hemoglobin (HB)" from Mrr page
	And And I click on Add button

Scenario: 14_Verify the dropdown values for Column Gender when user clicks on Gender drop down box while editing the Mrr record in Mrr Lab Test page	
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Gender" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown      |
	| -Select-      |
	| Female        |
	| Male          |
	| Not Specified |	
	

Scenario: 15_Verify the dropdown values for the column From Age when user clicks on 1st drop down box of From Age while editing the Mrr record in Mrr Lab Test page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page	
	Then I should see the below mentioned values in the "From Age1" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| >        |

Scenario: 16_verify the dropdown values for the column from age when user clicks on last drop down box of from age while editing the mrr record in mrr lab test page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page 
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "From Age2" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown   |
	| -Select- |	
	| Days     |
	| Hours    |
	| Months   |
	| Weeks    |	
	| Years    |
	

Scenario: 17_verify the dropdown values for the column to age when user clicks on first drop down box of to age while editing the mrr record in mrr lab test page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page	
	Then I should see the below mentioned values in the "To Age1" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| <        |

Scenario: 18_verify the drop down values for the column to age when user clicks on last drop down box of to age while editing the mrr record in mrr lab test page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page	
	Then I should see the below mentioned values in the "To Age2" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown   |
	| -Select- |	
	| Days     |
	| Hours    |
	| Months   |
	| Weeks    |	
	| Years    |

Scenario: 19_verify the dropdown values for the column normal range(low) when user clicks on drop down box of normal range(low) while editing the mrr record in mrr lab test page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Normal Range Low" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| >        |

Scenario: 20_verify the dropdown values for the column normal range(high) when user clicks on drop down box of normal range(high) while editing the mrr record in mrr lab test page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Normal Range High" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| <        |

Scenario: 21_verify the dropdown values for the column critical range(low) when user clicks on drop down box of critical range(low) while editing the mrr record in mrr lab test page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Critical Range Low" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| >        |

Scenario: 22_verify the dropdown values for the column critical range(high) when user clicks on drop down box of critical range(high) while editing the mrr record in mrr lab test page	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Critical Range High" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| <        |

Scenario: 23_verify the dropdown values for the column unit when user clicks on drop down box of unit while editing the mrr record in mrr lab test page 
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	
	
Scenario: 24_verify the dropdown values for column gender when user clicks on gender drop down box in mrr lab test page	while adding the record
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "Not Specified" in the "Gender" drop down
	And I should see the below mentioned values in the "Gender" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown      |
	| -Select-      |
	| Female        |
	| Male          |
	| Not Specified |	

Scenario: 25_verify the dropdown values for the column from age when user clicks on 1st drop down box of from age in mrr lab test page while adding the record
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "=" in the "From Age1" drop down	
	And I should see the below mentioned values in the "From Age1" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| >        |

Scenario: 26_verify the dropdown values for the column from age when user clicks on last drop down box of from age in mrr lab test page while adding the record	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "Years" in the "From Age2" drop down
	And I should see the below mentioned values in the "From Age2" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |	
	| Days     |
	| Hours    |
	| Months   |
	| Weeks    |	
	| Years    |	

Scenario: 27_verify the dropdown values for the column to age when user clicks on first drop down box of to age in mrr lab test page while adding the record	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "=" in the "To Age1" drop down
	And I should see the below mentioned values in the "To Age1" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| <        |

Scenario: 28_verify the drop down values for the column to age when user clicks on last drop down box of to age in mrr lab test page while adding the record	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "Years" in the "To Age2" drop down
	And I should see the below mentioned values in the "To Age2" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |	
	| Days     |
	| Hours    |
	| Months   |
	| Weeks    |	
	| Years    |

Scenario: 29_verify the dropdown values for the column normal range(low) when user clicks on drop down box of normal range(low) in mrr lab test page while adding the record	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "=" in the "Normal Range Low" drop down
	And I should see the below mentioned values in the "Normal Range Low" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| >        |

Scenario: 30_verify the dropdown values for the column normal range(high) when user clicks on drop down box of normal range(high) in mrr lab test page while adding the record	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "=" in the "Normal Range High" drop down
	And I should see the below mentioned values in the "Normal Range High" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| <        |

Scenario: 31_verify the dropdown values for the column critical range(low) when user clicks on drop down box of critical range(low) in mrr lab test page while adding the record	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "=" in the "Critical Range Low" drop down
	And I should see the below mentioned values in the "Critical Range Low" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| >        |

Scenario: 32_verify the dropdown values for the column critical range(high) when user clicks on drop down box of critical range(high) in mrr lab test page while adding the record	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "=" in the "Critical Range High" drop down
	And I should see the below mentioned values in the "Critical Range High" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| =        |
	| <        |

Scenario: 33_verify the dropdown values for the column unit when user clicks on drop down box of unit in mrr lab test page while adding the record	
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on Add button in the MRR table grid of Manage Reference Ranges page
	Then I should see the default value as "-Select-" in the "Unit" drop down
	And I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	
