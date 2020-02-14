Feature: NormalizationValidations
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers
@US68875
#######################################1 No Study########################################
Scenario: 01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

#Normalization page
Scenario:02_Verify the display of job when lab attributes changed
	When I navigate to Study Administration page.
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Normalize Lab Data" In StudyAdministrationPage
	Then I should see"You cannot run normalization as there is no study published."

#creation of sites 01,02
Scenario: 03_Add sites to associate to labs.
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	Then I see site "01-Site" in SiteManagementPage
	And I see site "02-Site" in SiteManagementPage
     
#Assigning user to 01 and 02 site	 
Scenario: 04_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario:05_Assign testadmin testadmin user to 02-Site
	When I click breadcrumb "Site Management"
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "02-Site"

#Adding Labs
Scenario:06_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |

#Assosiating Labs  L01 to sites 01
Scenario: 07_Associate Labs L01 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |

#Association of 02 site to L01
Scenario: 08_Associate Labs L01 for 02-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
#lab to site
Scenario:09_Verify the display of job when lab to site disassociation
    When I click breadcrumb "Study Administration"
    And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
    And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette 
    And I remove and save sites from assocaited sites in LabManagementSitesPage
    | Site              |
    | 02 - Site         |
    Then a "Site(s) associated successfully" message should be displayed in ReferenceRangesPage

#site to lab
Scenario:10_Verify the display of job when site to lab disassociation
     When I click breadcrumb "Study Administration"
    And I click Link "Site Management" In StudyAdministrationPage 
    And I open site with siteid "01" and site name "Site" from SiteManagement page
    And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
    And I remove and save lab id "L01" and lab name "Lab01" from associated labs in AssociateLabs page
    Then a "Lab(s) associated successfully" message should be displayed in ReferenceRangesPage

#Lab Attribute changes
Scenario:11_Verify the display of job when lab attributes changed
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
	And I enter labs details and Save to Edit
	| LabId | LaboratoryName | Company      | Address1 | Address2 | Address3 | ISOCountry | Country    |
	| L01   | Lab01          | PFIZER123456 | A1       | A2       | A3       | 500084     | INDIA(IND) |
	Then I see success message "Lab data updated successfully"

Scenario: 12_Logout form DataLabs
    When I clik logout of Datalabs
    Then I see login page
@US68875
#################Study without Labs#######################################	
Scenario: 13_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

# Delete the study
Scenario: 14_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

#Upload the study
Scenario: 15_Upload and publish the study.
	When I click breadcrumb "Study Management"
	And I upload a study "BaseStudy_20190610_T14432829.zip" with study label "TestLabs_Data"
	Then I see study label "TestLabs_Data" in header 

#Normalization page
Scenario:16_Verify the display of job when lab attributes changed
	When I navigate to Study Administration page.
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Normalize Lab Data" In StudyAdministrationPage
	Then I should see"You cannot run normalization as the study does not have Local Labs module enabled."

#Assosiating Labs to sites
Scenario: 17_Associate Labs L01 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company       | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER123456  | RD         | Active           |

##site to lab and vice versa
#Association of 02 site to L01
Scenario: 18_Associate Labs L01 for 02-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
			| LabId | LaboratoryName | Company       | Department | LaboratoryStatus |
			| L01   | Lab01          | PFIZER123456  | RD         | Active           |
#lab to site
Scenario:19_Verify the display of job when lab to site disassociation
    When I click breadcrumb "Study Administration"
    And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
    And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette 
    And I remove and save sites from assocaited sites in LabManagementSitesPage
    | Site              |
    | 02 - Site         |
    Then a "Site(s) associated successfully" message should be displayed in ReferenceRangesPage

Scenario:20_Verify the display of job when site to lab disassociation
     When I click breadcrumb "Study Administration"
    And I click Link "Site Management" In StudyAdministrationPage 
    And I open site with siteid "01" and site name "Site" from SiteManagement page
    And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
    And I remove and save lab id "L01" and lab name "Lab01" from associated labs in AssociateLabs page
    Then a "Lab(s) associated successfully" message should be displayed in ReferenceRangesPage

#Lab Attribute changes
Scenario:21_Verify the display of job when lab attributes changed
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
	And I enter labs details and Save to Edit
	| LabId | LaboratoryName | Company      | Address1 | Address2 | Address3 | ISOCountry | Country    |
	| L01   | Lab01          | PFIZER123456 | A11       | A2       | A3       | 500084     | INDIA(IND) |
	Then I see success message "Lab data updated successfully"

Scenario: 22_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
@US68875
#################without patient
Scenario: 23_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

# Delete the study
Scenario: 24_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

#Upload the study
Scenario: 25_Upload and publish the study.
	When I click breadcrumb "Study Management"
	And I upload a study "TestLabs_Dictionary.zip" with study label "TestLabs_Data"
	Then I see study label "TestLabs_Data" in header 

#Normalization page
Scenario:26_Verify the display of job when lab attributes changed
	When I navigate to Study Administration page.
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Normalize Lab Data" In StudyAdministrationPage
	Then I should see"You cannot run normalization as the study doesn't have any lab forms."

#Assosiating Labs to sites
Scenario: 27_Associate Labs L01 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company       | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER123456  | RD         | Active           |

##site to lab and vice versa
#Association of 02 site to L01
Scenario: 28_Associate Labs L01 for 02-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company       | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER123456  | RD         | Active           |
	
Scenario:29_Verify the display of job when MRR create operation.
	Given I navigate to "Local Labs" tab from main menu.
	When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "RBC" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "Lab test reference range added successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	| 10/12/2019 | 11/29/2019 | Male   | >             | 20         | <           | 30       | >                    | 5                 | <                     | 15                 | >                      | 4                   | <                       | 16                   | fL   | False |
	Then a "Lab test reference range added successfully" message should be displayed in ReferenceRangesPage

Scenario:30_Verify the display of job when MRR update operation
   Given I navigate to "Local Labs" tab from main menu.
   When I open lab with labid "L01" from ManageReferenceRanges page
   And I open labtest with labname "RBC" from labtests page
   And I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
   And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| FromAgeSet | ToAgeSet | ClinicalRangeLowSet |
	| 26         | 36       | 2                   |
   And I Click the save button in ReferenceRangesPage
   Then a "Lab test reference range updated successfully" message should be displayed in ReferenceRangesPage

Scenario:31_Verify the display of job when MRR delete operation
    Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
    And I open labtest with labname "RBC" from labtests page
    And I select the checkbox to delete the all records
    And I click on Delete button  
    And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 1 reference range record(s)?"
	Then a "Lab test reference range(s) deleted successfully" message should be displayed in ReferenceRangesPage

#lab to site
Scenario:32_Verify the display of job when lab to site disassociation
    When I navigate to Study Administration page.
    And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
    And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette 
    And I remove and save sites from assocaited sites in LabManagementSitesPage
    | Site              |
    | 02 - Site         |
    Then a "Site(s) associated successfully" message should be displayed in ReferenceRangesPage

Scenario:33_Verify the display of job when site to lab disassociation
    When I click breadcrumb "Study Administration"
    And I click Link "Site Management" In StudyAdministrationPage 
    And I open site with siteid "01" and site name "Site" from SiteManagement page
    And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
    And I remove and save lab id "L01" and lab name "Lab01" from associated labs in AssociateLabs page
    Then a "Lab(s) associated successfully" message should be displayed in ReferenceRangesPage

#Lab Attribute changes
Scenario:34_Verify the display of job when lab attributes changed
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
	And I enter labs details and Save to Edit
	| LabId | LaboratoryName | Company      | Address1 | Address2 | Address3 | ISOCountry | Country    |
	| L01   | Lab011          | PFIZER123456 | A11       | A2       | A3       | 500084     | INDIA(IND) |
	Then I see success message "Lab data updated successfully"

Scenario: 35_Logout form DataLabs
    When I clik logout of Datalabs
    Then I see login page

