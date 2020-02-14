Feature: Labs_DictionaryStaticFieldsChangeMinorStudyUpdate

Scenario: 01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

# Prepare a study that has all the mappings for all the lab parameters in D1 with Demographic Form Mappings
Scenario: 03_Prepare a study file that doesn't have Lab Parameter mapping for all the fields except for the mandatory fields and with valid Questions for the Lab parameter Mapping fields and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "Test4500_Labs_20190604_T15432019.zip" with study label "V1"
      Then I see study label "Test4500_CodleistLinkages_Base" in header      

Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site1    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site2    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |

Scenario: 05_Assign testadmin testadmin user to Site1
	When I open site with siteid "01" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: 06_Assign testadmin testadmin user to Site2
	When I open site with siteid "02" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: 07_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	#| L02   | Lab02          | PFIZER2  | RD2        | A12      | A22      | A32      | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	#| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	#| L04   | Lab04          | NOVARTIS | Research   | A1       | A2       | A3       | City4 | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
	#| L05   | Lab05          | CIPLA    | Production | A1       | A2       | A3       | City5 | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	#| L02   | Lab02          | PFIZER2  | RD2        | A12      | A22      | A32      | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	#| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	#| L04   | Lab04          | NOVARTIS | Research   | A1       | A2       | A3       | City4 | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
	#| L05   | Lab05          | CIPLA    | Production | A1       | A2       | A3       | City5 | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |

Scenario: 08_Associate Lab L01 and L02 for Site1
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	#And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	#And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
	#And I see lab data in labs tab of Site in SitePage
	#| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	#| L02   | Lab02          | PFIZER2 | RD2        | Active           |

Scenario: 09_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site1" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       | PAT             | 06/06/2019 |
      | 02       | PAT             | 06/06/2019 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |
      | 02-PAT    |
      | 03-PAT    |
      | 04-PAT    |
      | 05-PAT    |
      | 06-PAT    |
      | 07-PAT    |
      | 08-PAT    |
      | 09-PAT    |
      | 10-PAT    |
      | 11-PAT    |
      | 12-PAT    |

Scenario: 10_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 01/01/2019 |         | Male   |               | 0          |             | 100      |                      | 10.19             |                       | 20.19              |                        | 30.19               | <                       | 40.19                | 01   | False |
	 Then a Reference ID is auto generated for a newly added lab test in ReferenceRangesPage