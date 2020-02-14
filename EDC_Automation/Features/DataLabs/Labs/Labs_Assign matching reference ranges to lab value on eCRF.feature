Feature: Labs_Assign matching reference ranges to lab value on eCRF	

Scenario: 01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

## Prepare a study that has all the mappings for all the lab parameters in D1 with Demographic Form Mappings
Scenario: 03_Prepare a study file that doesn't have Lab Parameter mapping for all the fields except for the mandatory fields and with valid Questions for the Lab parameter Mapping fields and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "QuestionAllMapped_D1.zip" with study label "Questions"
      Then I see study label "Questions" in header      

Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	Then I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site1    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site2    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |

Scenario: 05_Assign testadmin testadmin user to Site1
	When I open site with siteid "01" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I click breadcrumb "Site Management"

Scenario: 06_Assign testadmin testadmin user to Site2
	When I open site with siteid "02" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I click breadcrumb "Site Management"

Scenario: 07_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	| L04   | Lab04          | NOVARTIS | Research   | A1       | A2       | A3       | City4 | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
	| L05   | Lab05          | CIPLA    | Production | A1       | A2       | A3       | City5 | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	| L04   | Lab04          | NOVARTIS | Research   | A1       | A2       | A3       | City4 | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
	| L05   | Lab05          | CIPLA    | Production | A1       | A2       | A3       | City5 | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |

Scenario: 08_Associate Lab L01 and L02 for Site1
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L02   | Lab02          | PFIZER  | RD         | Active           |

Scenario: 09_Associate Lab L01 and L02 for Site2
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L04" and lab name "Lab04" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER   | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L03   | Lab03          | NOVARTIS | Research   | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L04   | Lab04          | NOVARTIS | Research   | Active           |

Scenario: 10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site1" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 11_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site1" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 12_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site1" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: 13_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 14_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".
#Add RR records in RR screen
Scenario: 15_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN1" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      | >                    | 10.21             | <                     | 15.11              | >                      | 20.41               | <                       | 25.71                | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Years        | <           | 32       | Years      | >                    | 30.22             | <                     | 35.12              | >                      | 40.42               | <                       | 45.72                | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Years        | <           | 34       | Years      | >                    | -55.22            | <                     | -50.12             | >                      | -65.42              | <                       | -60.75               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Years        | <           | 36       | Years      |                      |                   |                       |                    | >                      | -75.42              | <                       | -70.72               | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Years        | <           | 38       | Years      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Years        | <           | 40       | Years      |                      | -22345678.34      |                       | -12345678.34       |                        | -32345677.34        |                         | -22345679.34         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Years        |             | 40       | Years      | >                    | -23345678.34      | <                     | -13345678.34       | >                      | -33345677.34        | <                       | -23345679.34         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Years        |             | 41       | Years      | >                    | -43345678.34      | <                     | -14345678.34       | >                      | -34345677.34        | <                       | -23345679.34         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Years
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Years        |             | 30       | Years      | >                    | 85.21             | <                     | 90.11              | >                      | 95.41               | <                       | 100.71               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Years        | <           | 32       | Years      | >                    | 105.22            | <                     | 110.12             | >                      | 115.42              | <                       | 120.72               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Years        | <           | 34       | Years      | >                    | -135.22           | <                     | -130.12            | >                      | -145.42             | <                       | -140.72              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Years        | <           | 36       | Years      |                      |                   |                       |                    | >                      | -155.42             | <                       | -150.72              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Years        | <           | 38       | Years      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Years        | <           | 40       | Years      |                      | -22345671.34      |                       | -12345672.34       |                        | -32345673.34        |                         | -22345674.34         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Years        |             | 40       | Years      | >                    | -23345675.34      | <                     | -13345676.34       | >                      | -33345677.34        | <                       | -23345678.34         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Years        |             | 41       | Years      | >                    | -43345679.34      | <                     | -14345610.34       | >                      | -34345611.34        | <                       | -23345612.34         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Years        |             | 42       | Years      | >                    | -43345613.34      | <                     | -14345614.34       | >                      | -34345615.34        | <                       | -23345616.34         | g/L  | No  |
	# Data with Gender Not Specified and Age unit with Days
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Days         |             | 30       | Days       | >                    | 160.23            | <                     | 165.13             | >                      | 170.43              | <                       | 175.73               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Days         | <           | 32       | Days       | >                    | 180.24            | <                     | 185.14             | >                      | 190.44              | <                       | 195.74               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Days         | <           | 34       | Days       | >                    | -205.22           | <                     | -200.12            | >                      | -210.42             | <                       | -205.72              | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Days         | <           | 36       | Days       |                      |                   |                       |                    | >                      | -215.42             | <                       | -210.72              | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Days         | <           | 38       | Days       |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Days         | <           | 40       | Days       |                      | -22345617.34      |                       | -12345618.34       |                        | -32345619.34        |                         | -22345620.34         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Days         |             | 40       | Days       | >                    | -23345621.34      | <                     | -13345622.34       | >                      | -33345623.34        | <                       | -23345624.34         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Days         |             | 41       | Days       | >                    | -43345625.34      | <                     | -14345626.34       | >                      | -34345627.34        | <                       | -23345628.34         | g/L  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 380        | Days         |             | 730      | Days       | >                    | -43345629.34      | <                     | -14345630.34       | >                      | -34345631.34        | <                       | -23345632.34         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Days
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Days         |             | 30       | Days       | >                    | 220.23            | <                     | 225.13             | >                      | 230.43              | <                       | 235.73               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Days         | <           | 32       | Days       | >                    | 240.24            | <                     | 245.14             | >                      | 250.44              | <                       | 255.74               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Days         | <           | 34       | Days       | >                    | -265.22           | <                     | -260.12            | >                      | -275.42             | <                       | -270.72              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Days         | <           | 36       | Days       |                      |                   |                       |                    | >                      | -285.42             | <                       | -280.72              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Days         | <           | 38       | Days       |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Days         | <           | 40       | Days       |                      | -22345633.34      |                       | -12345634.34       |                        | -32345635.34        |                         | -22345636.34         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Days         |             | 40       | Days       | >                    | -23345637.34      | <                     | -13345638.34       | >                      | -33345639.34        | <                       | -23345640.34         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Days         |             | 41       | Days       | >                    | -43345641.34      | <                     | -14345642.34       | >                      | -34345643.34        | <                       | -23345644.34         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Days         |             | 100      | Days       | >                    | -43345645.34      | <                     | -14345646.34       | >                      | -34345647.34        | <                       | -23345648.34         | g/L  | No  |
	#Data with Gender Not Specified and Age unit with Hours
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      | >                    | 290.23            | <                     | 295.13             | >                      | 300.43              | <                       | 310.73               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Hours        | <           | 32       | Hours      | >                    | 315.24            | <                     | 320.14             | >                      | 325.44              | <                       | 330.74               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Hours        | <           | 34       | Hours      | >                    | -345.22           | <                     | -340.12            | >                      | -355.42             | <                       | -350.72              | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Hours        | <           | 36       | Hours      |                      |                   |                       |                    | >                      | -365.42             | <                       | -360.72              | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Hours        | <           | 38       | Hours      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Hours        | <           | 40       | Hours      |                      | -22345649.34      |                       | -12345650.34       |                        | -32345651.34        |                         | -22345652.34         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Hours        |             | 40       | Hours      | >                    | -23345653.34      | <                     | -13345654.34       | >                      | -33345655.34        | <                       | -23345656.34         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Hours        |             | 41       | Hours      | >                    | -43345657.34      | <                     | -14345658.34       | >                      | -34345659.34        | <                       | -23345660.34         | g/L  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 8760       | Hours        |             | 17520    | Hours      | >                    | -43345661.34      | <                     | -14345662.34       | >                      | -34345663.34        | <                       | -23345664.34         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Hours
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Hours        |             | 30       | Hours      | >                    | 370.23            | <                     | 375.13             | >                      | 380.43              | <                       | 385.73               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Hours        | <           | 32       | Hours      | >                    | 390.24            | <                     | 395.14             | >                      | 400.44              | <                       | 405.74               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Hours        | <           | 34       | Hours      | >                    | -415.22           | <                     | -410.12            | >                      | -425.42             | <                       | -420.72              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Hours        | <           | 36       | Hours      |                      |                   |                       |                    | >                      | -435.42             | <                       | -430.72              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Hours        | <           | 38       | Hours      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Hours        | <           | 40       | Hours      |                      | -22345665.34      |                       | -12345666.34       |                        | -32345667.34        |                         | -22345668.34         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Hours        |             | 40       | Hours      | >                    | -23345669.34      | <                     | -13345670.34       | >                      | -33345671.34        | <                       | -23345672.34         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Hours        |             | 41       | Hours      | >                    | -43345673.34      | <                     | -14345674.34       | >                      | -34345675.34        | <                       | -23345676.34         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Hours        |             | 42       | Hours      | >                    | -43345677.34      | <                     | -14345678.34       | >                      | -34345679.34        | <                       | -23345680.34         | g/L  | No  |
	#Data with Gender Not Specified and Age unit with Months
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     | >                    | 435.23            | <                     | 440.13             | >                      | 445.43              | <                       | 460.73               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Months       | <           | 32       | Months     | >                    | 465.24            | <                     | 470.14             | >                      | 475.44              | <                       | 480.74               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Months       | <           | 34       | Months     | >                    | -495.22           | <                     | -490.12            | >                      | -505.42             | <                       | -500.72              | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Months       | <           | 36       | Months     |                      |                   |                       |                    | >                      | -515.42             | <                       | -510.72              | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Months       | <           | 38       | Months     |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Months       | <           | 40       | Months     |                      | -22345681.34      |                       | -12345682.34       |                        | -32345683.34        |                         | -22345684.34         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Months       |             | 40       | Months     | >                    | -23345685.34      | <                     | -13345686.34       | >                      | -33345687.34        | <                       | -23345688.34         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Months       |             | 41       | Months     | >                    | -43345689.34      | <                     | -14345690.34       | >                      | -34345691.34        | <                       | -23345692.34         | g/L  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 12         | Months       |             | 24       | Months     | >                    | -43345693.34      | <                     | -14345694.34       | >                      | -34345695.34        | <                       | -23345696.34         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Months
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Months       |             | 30       | Months     | >                    | 520.23            | <                     | 525.13             | >                      | 530.43              | <                       | 535.73               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Months       | <           | 32       | Months     | >                    | 540.24            | <                     | 545.14             | >                      | 550.44              | <                       | 555.74               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Months       | <           | 34       | Months     | >                    | -565.22           | <                     | -560.12            | >                      | -575.42             | <                       | -570.72              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Months       | <           | 36       | Months     |                      |                   |                       |                    | >                      | -585.42             | <                       | -580.72              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Months       | <           | 38       | Months     |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Months       | <           | 40       | Months     |                      | -22345697.34      |                       | -12345698.34       |                        | -32345699.34        |                         | -22345100.34         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Months       |             | 40       | Months     | >                    | -23345101.34      | <                     | -13345102.34       | >                      | -33345103.34        | <                       | -23345104.34         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Months       |             | 41       | Months     | >                    | -43345105.34      | <                     | -14345106.34       | >                      | -34345107.34        | <                       | -23345108.34         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Months       |             | 42       | Months     | >                    | -43345109.34      | <                     | -14345110.34       | >                      | -34345111.34        | <                       | -23345112.34         | g/L  | No  |
	#Data with Gender Not Specified and Age unit with Weeks
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | 30       | Weeks      | >                    | 590.23            | <                     | 595.13             | >                      | 600.43              | <                       | 605.73               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Weeks        | <           | 32       | Weeks      | >                    | 610.24            | <                     | 615.14             | >                      | 620.44              | <                       | 625.74               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Weeks        | <           | 34       | Weeks      | >                    | -635.22           | <                     | -630.12            | >                      | -645.42             | <                       | -640.72              | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Weeks        | <           | 36       | Weeks      |                      |                   |                       |                    | >                      | -655.42             | <                       | -650.72              | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Weeks        | <           | 38       | Weeks      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Weeks        | <           | 40       | Weeks      |                      | -22345113.34      |                       | -12345114.34       |                        | -32345115.34        |                         | -22345116.34         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Weeks        |             | 40       | Weeks      | >                    | -23345117.34      | <                     | -13345118.34       | >                      | -33345119.34        | <                       | -23345120.34         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Weeks        |             | 41       | Weeks      | >                    | -43345121.34      | <                     | -14345122.34       | >                      | -34345123.34        | <                       | -23345124.34         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Weeks
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Weeks        |             | 30       | Weeks      | >                    | 700.23            | <                     | 705.13             | >                      | 710.43              | <                       | 715.73               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Weeks        | <           | 32       | Weeks      | >                    | 720.24            | <                     | 725.14             | >                      | 730.44              | <                       | 735.74               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Weeks        | <           | 34       | Weeks      | >                    | -665.22           | <                     | -660.12            | >                      | -675.42             | <                       | -670.72              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Weeks        | <           | 36       | Weeks      |                      |                   |                       |                    | >                      | -685.42             | <                       | -680.72              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Weeks        | <           | 38       | Weeks      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Weeks        | <           | 40       | Weeks      |                      | -22345125.34      |                       | -12345126.34       |                        | -32345127.34        |                         | -22345128.34         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Weeks        |             | 40       | Weeks      | >                    | -23345129.34      | <                     | -13345130.34       | >                      | -33345131.34        | <                       | -23345132.34         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Weeks        |             | 41       | Weeks      | >                    | -43345133.34      | <                     | -14345134.34       | >                      | -34345135.34        | <                       | -23345136.34         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Weeks        |             | 42       | Weeks      | >                    | -43345137.34      | <                     | -14345138.34       | >                      | -34345139.34        | <                       | -23345140.34         | g/L  | No  |

#Add RR records in RR screen for HEMOGLOBIN2
Scenario: 16_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN2" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      | >                    | 10.01             | <                     | 15.02              | >                      | 20.03               | <                       | 25.04                | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Years        | <           | 32       | Years      | >                    | 30.05             | <                     | 35.06              | >                      | 40.07               | <                       | 45.08                | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Years        | <           | 34       | Years      | >                    | -55.09            | <                     | -50.10             | >                      | -65.11              | <                       | -60.12               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Years        | <           | 36       | Years      |                      |                   |                       |                    | >                      | -75.13              | <                       | -70.14               | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Years        | <           | 38       | Years      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Years        | <           | 40       | Years      |                      | -22345678.15      |                       | -12345678.16       |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Years        |             | 40       | Years      | >                    | -23345678.19      | <                     | -13345678.20       | >                      | -33345677.21        | <                       | -23345679.22         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Years        |             | 41       | Years      | >                    | -43345678.23      | <                     | -14345678.24       | >                      | -34345677.25        | <                       | -23345679.26         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Years
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Years        |             | 30       | Years      | >                    | 85.27             | <                     | 90.28              | >                      | 95.29               | <                       | 100.30               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Years        | <           | 32       | Years      | >                    | 105.31            | <                     | 110.32             | >                      | 115.33              | <                       | 120.34               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Years        | <           | 34       | Years      | >                    | -135.35           | <                     | -130.36            | >                      | -145.37             | <                       | -140.38              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Years        | <           | 36       | Years      |                      |                   |                       |                    | >                      | -155.39             | <                       | -150.40              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Years        | <           | 38       | Years      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Years        | <           | 40       | Years      |                      | -22345671.41      |                       | -12345672.42       |                        | -32345673.43        |                         | -22345674.44         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Years        |             | 40       | Years      | >                    | -23345675.45      | <                     | -13345676.46       | >                      | -33345677.47        | <                       | -23345678.48         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Years        |             | 41       | Years      | >                    | -43345649.49      | <                     | -14345650.50       | >                      | -34345651.51        | <                       | -23345652.52         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Years        |             | 42       | Years      | >                    | -43345653.53      | <                     | -14345654.54       | >                      | -34345655.55        | <                       | -23345656.56         | g/L  | No  |
	# Data with Gender Not Specified and Age unit with Days
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Days         |             | 30       | Days       | >                    | 160.57            | <                     | 165.58             | >                      | 170.59              | <                       | 175.60               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Days         | <           | 32       | Days       | >                    | 180.61            | <                     | 185.62             | >                      | 190.63              | <                       | 195.64               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Days         | <           | 34       | Days       | >                    | -205.65           | <                     | -200.66            | >                      | -210.67             | <                       | -205.68              | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Days         | <           | 36       | Days       |                      |                   |                       |                    | >                      | -215.69             | <                       | -210.70              | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Days         | <           | 38       | Days       |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Days         | <           | 40       | Days       |                      | -22345617.71      |                       | -12345618.72       |                        | -32345619.73        |                         | -22345620.74         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Days         |             | 40       | Days       | >                    | -23345621.75      | <                     | -13345622.76       | >                      | -33345623.77        | <                       | -23345624.78         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Days         |             | 41       | Days       | >                    | -43345625.79      | <                     | -14345626.80       | >                      | -34345627.81        | <                       | -23345628.82         | g/L  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 380        | Days         |             | 730      | Days       | >                    | -43345629.83      | <                     | -14345630.84       | >                      | -34345631.85        | <                       | -23345632.86         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Days
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Days         |             | 30       | Days       | >                    | 220.87            | <                     | 225.88             | >                      | 230.89              | <                       | 235.90               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Days         | <           | 32       | Days       | >                    | 240.91            | <                     | 245.92             | >                      | 250.93              | <                       | 255.94               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Days         | <           | 34       | Days       | >                    | -265.95           | <                     | -260.96            | >                      | -275.97             | <                       | -270.98              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Days         | <           | 36       | Days       |                      |                   |                       |                    | >                      | -285.99             | <                       | -280.01              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Days         | <           | 38       | Days       |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Days         | <           | 40       | Days       |                      | -22345633.02      |                       | -12345634.03       |                        | -32345635.04        |                         | -22345636.05         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Days         |             | 40       | Days       | >                    | -23345637.06      | <                     | -13345638.07       | >                      | -33345639.08        | <                       | -23345640.09         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Days         |             | 41       | Days       | >                    | -43345641.10      | <                     | -14345642.11       | >                      | -34345643.12        | <                       | -23345644.13         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Days         |             | 100      | Days       | >                    | -43345645.14      | <                     | -14345646.15       | >                      | -34345647.16        | <                       | -23345648.17         | g/L  | No  |
	#Data with Gender Not Specified and Age unit with Hours
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      | >                    | 290.18            | <                     | 295.19             | >                      | 300.20              | <                       | 310.21               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Hours        | <           | 32       | Hours      | >                    | 315.22            | <                     | 320.23             | >                      | 325.24              | <                       | 330.25               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Hours        | <           | 34       | Hours      | >                    | -345.26           | <                     | -340.27            | >                      | -355.28             | <                       | -350.29              | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Hours        | <           | 36       | Hours      |                      |                   |                       |                    | >                      | -365.30             | <                       | -360.31              | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Hours        | <           | 38       | Hours      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Hours        | <           | 40       | Hours      |                      | -22345649.32      |                       | -12345650.33       |                        | -32345651.34        |                         | -22345652.35         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Hours        |             | 40       | Hours      | >                    | -23345653.36      | <                     | -13345654.37       | >                      | -33345655.38        | <                       | -23345656.39         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Hours        |             | 41       | Hours      | >                    | -43345657.40      | <                     | -14345658.41       | >                      | -34345659.42        | <                       | -23345660.43         | g/L  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 8760       | Hours        |             | 17520    | Hours      | >                    | -43345661.44      | <                     | -14345662.45       | >                      | -34345663.46        | <                       | -23345664.47         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Hours
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Hours        |             | 30       | Hours      | >                    | 370.48            | <                     | 375.49             | >                      | 380.50              | <                       | 385.51               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Hours        | <           | 32       | Hours      | >                    | 390.52            | <                     | 395.53             | >                      | 400.54              | <                       | 405.55               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Hours        | <           | 34       | Hours      | >                    | -415.56           | <                     | -410.57            | >                      | -425.58             | <                       | -420.59              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Hours        | <           | 36       | Hours      |                      |                   |                       |                    | >                      | -435.60             | <                       | -430.61              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Hours        | <           | 38       | Hours      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Hours        | <           | 40       | Hours      |                      | -22345665.62      |                       | -12345666.63       |                        | -32345667.64        |                         | -22345668.65         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Hours        |             | 40       | Hours      | >                    | -23345669.66      | <                     | -13345670.67       | >                      | -33345671.68        | <                       | -23345672.69         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Hours        |             | 41       | Hours      | >                    | -43345673.70      | <                     | -14345674.71       | >                      | -34345675.72        | <                       | -23345676.73         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Hours        |             | 42       | Hours      | >                    | -43345677.74      | <                     | -14345678.75       | >                      | -34345679.76        | <                       | -23345680.77         | g/L  | No  |
	#Data with Gender Not Specified and Age unit with Months
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     | >                    | 435.78            | <                     | 440.79             | >                      | 445.80              | <                       | 460.81               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Months       | <           | 32       | Months     | >                    | 465.82            | <                     | 470.83             | >                      | 475.84              | <                       | 480.85               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Months       | <           | 34       | Months     | >                    | -495.86           | <                     | -490.87            | >                      | -505.88             | <                       | -500.89              | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Months       | <           | 36       | Months     |                      |                   |                       |                    | >                      | -515.90             | <                       | -510.91              | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Months       | <           | 38       | Months     |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Months       | <           | 40       | Months     |                      | -22345681.92      |                       | -12345682.93       |                        | -32345683.94        |                         | -22345684.95         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Months       |             | 40       | Months     | >                    | -23345685.96      | <                     | -13345686.97       | >                      | -33345687.98        | <                       | -23345688.99         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Months       |             | 41       | Months     | >                    | -43345689.01      | <                     | -14345690.02       | >                      | -34345691.03        | <                       | -23345692.04         | g/L  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 12         | Months       |             | 24       | Months     | >                    | -43345693.05      | <                     | -14345694.06       | >                      | -34345695.07        | <                       | -23345696.08         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Months
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Months       |             | 30       | Months     | >                    | 520.09            | <                     | 525.10             | >                      | 530.11              | <                       | 535.12               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Months       | <           | 32       | Months     | >                    | 540.13            | <                     | 545.14             | >                      | 550.15              | <                       | 555.16               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Months       | <           | 34       | Months     | >                    | -565.17           | <                     | -560.18            | >                      | -575.19             | <                       | -570.20              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Months       | <           | 36       | Months     |                      |                   |                       |                    | >                      | -585.21             | <                       | -580.22              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Months       | <           | 38       | Months     |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Months       | <           | 40       | Months     |                      | -22345697.23      |                       | -12345698.24       |                        | -32345699.25        |                         | -22345100.26         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Months       |             | 40       | Months     | >                    | -23345101.27      | <                     | -13345102.28       | >                      | -33345103.29        | <                       | -23345104.30         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Months       |             | 41       | Months     | >                    | -43345105.31      | <                     | -14345106.32       | >                      | -34345107.33        | <                       | -23345108.34         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Months       |             | 42       | Months     | >                    | -43345109.35      | <                     | -14345110.36       | >                      | -34345111.37        | <                       | -23345112.38         | g/L  | No  |
	#Data with Gender Not Specified and Age unit with Weeks
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | 30       | Weeks      | >                    | 590.39            | <                     | 595.40             | >                      | 600.41              | <                       | 605.42               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 30         | Weeks        | <           | 32       | Weeks      | >                    | 610.43            | <                     | 615.44             | >                      | 620.45              | <                       | 625.46               | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 32         | Weeks        | <           | 34       | Weeks      | >                    | -635.47           | <                     | -630.48            | >                      | -645.49             | <                       | -640.50              | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 34         | Weeks        | <           | 36       | Weeks      |                      |                   |                       |                    | >                      | -655.51             | <                       | -650.52              | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 36         | Weeks        | <           | 38       | Weeks      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified | >             | 38         | Weeks        | <           | 40       | Weeks      |                      | -22345113.53      |                       | -12345114.54       |                        | -32345115.55        |                         | -22345116.56         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 40         | Weeks        |             | 40       | Weeks      | >                    | -23345117.57      | <                     | -13345118.58       | >                      | -33345119.59        | <                       | -23345120.60         | cmm  | No  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 41         | Weeks        |             | 41       | Weeks      | >                    | -43345121.61      | <                     | -14345122.62       | >                      | -34345123.63        | <                       | -23345124.64         | g/L  | No  |
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Weeks
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 30         | Weeks        |             | 30       | Weeks      | >                    | 700.65            | <                     | 705.66             | >                      | 710.67              | <                       | 715.68               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 30         | Weeks        | <           | 32       | Weeks      | >                    | 720.69            | <                     | 725.70             | >                      | 730.71              | <                       | 735.72               | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 32         | Weeks        | <           | 34       | Weeks      | >                    | -665.73           | <                     | -660.74            | >                      | -675.75             | <                       | -670.76              | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 34         | Weeks        | <           | 36       | Weeks      |                      |                   |                       |                    | >                      | -685.77             | <                       | -680.78              | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 36         | Weeks        | <           | 38       | Weeks      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified | >             | 38         | Weeks        | <           | 40       | Weeks      |                      | -22345125.79      |                       | -12345126.80       |                        | -32345127.81        |                         | -22345128.82         | cmm  | Yes |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 40         | Weeks        |             | 40       | Weeks      | >                    | -23345129.83      | <                     | -13345130.84       | >                      | -33345131.85        | <                       | -23345132.86         | cmm  | No  |
	| 12/01/2018 | 12/15/2019 | Not Specified |               | 41         | Weeks        |             | 41       | Weeks      | >                    | -43345133.87      | <                     | -14345134.88       | >                      | -34345135.89        | <                       | -23345136.90         | g/L  | No  |
	| 12/16/2019 |            | Not Specified |               | 42         | Weeks        |             | 42       | Weeks      | >                    | -43345137.91      | <                     | -14345138.92       | >                      | -34345139.93        | <                       | -23345140.94         | g/L  | No  |

# Add RR records in RR screen for HEMOGLOBIN3
Scenario: 17_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN3" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      | >                    | -43345678.23      | <                     | -14345678.24       | >                      | -34345677.25        | <                       | -23345679.26         | cmm  | No |	
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Days	
	| 12/16/2019 |            | Not Specified |               | 30         | Days         |             | 30       | Days       | >                    | -43345645.14      | <                     | -14345646.15       | >                      | -34345647.16        | <                       | -23345648.17         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Hours	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      | >                    | -43345661.44      | <                     | -14345662.45       | >                      | -34345663.46        | <                       | -23345664.47         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Months	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     | >                    | -43345693.05      | <                     | -14345694.06       | >                      | -34345695.07        | <                       | -23345696.08         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Weeks	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | 30       | Weeks      | >                    | -43345121.61      | <                     | -14345122.62       | >                      | -34345123.63        | <                       | -23345124.64         | cmm  | No |
# Add RR records in RR screen for HEMOGLOBIN4
Scenario: 18_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN4" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      |                      | -22345678.15      |                       | -12345678.16       |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Days         |             | 30       | Days       |                      | -22345678.15      |                       | -12345678.16       |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      |                      | -22345678.15      |                       | -12345678.16       |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     |                      | -22345678.15      |                       | -12345678.16       |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | Weeks    | Days       |                      | -22345678.15      |                       | -12345678.16       |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
# Add RR records in RR screen for HEMOGLOBIN5
Scenario: 19_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN5" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      |                      |                   |                       |                    |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Days         |             | 30       | Days       |                      |                   |                       |                    |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      |                      |                   |                       |                    |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     |                      |                   |                       |                    |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | Weeks    | Days       |                      |                   |                       |                    |                        | -32345677.17        |                         | -22345679.18         | cmm  | Yes |
# Add RR records in RR screen for HEMOGLOBIN6
Scenario: 20_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN6" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Days         |             | 30       | Days       |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | Weeks    | Days       |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
# Add RR records in RR screen for HEMOGLOBIN7
Scenario: 21_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN7" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Days         |             | 30       | Days       |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | Weeks    | Days       |                      |                   |                       |                    |                        |                     |                         |                      | cmm  | Yes |
# Add RR records in RR screen for HEMOGLOBIN8
Scenario: 22_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN8" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      | >                    | -43345678.23      | <                     | -14345678.24       | >                      | -34345677.25        | <                       | -23345679.26         | cmm  | No |	
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Days	
	| 12/16/2019 |            | Not Specified |               | 30         | Days         |             | 30       | Days       | >                    | -43345645.14      | <                     | -14345646.15       | >                      | -34345647.16        | <                       | -23345648.17         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Hours	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      | >                    | -43345661.44      | <                     | -14345662.45       | >                      | -34345663.46        | <                       | -23345664.47         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Months	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     | >                    | -43345693.05      | <                     | -14345694.06       | >                      | -34345695.07        | <                       | -23345696.08         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Weeks	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | 30       | Weeks      | >                    | -43345121.61      | <                     | -14345122.62       | >                      | -34345123.63        | <                       | -23345124.64         | cmm  | No |

# Add RR records in RR screen for HEMOGLOBIN8
Scenario: 23_Add a new lab test reference range record
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "HEMOGLOBIN9" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA |
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Years        |             | 30       | Years      | >                    | -43345678.23      | <                     | -14345678.24       | >                      | -34345677.25        | <                       | -23345679.26         | cmm  | No |	
	# Data with different set of Start Date and End Date for the Gender Not Specified and Age unit with Days	
	| 12/16/2019 |            | Not Specified |               | 30         | Days         |             | 30       | Days       | >                    | -43345645.14      | <                     | -14345646.15       | >                      | -34345647.16        | <                       | -23345648.17         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Hours	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Hours        |             | 30       | Hours      | >                    | -43345661.44      | <                     | -14345662.45       | >                      | -34345663.46        | <                       | -23345664.47         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Months	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Months       |             | 30       | Months     | >                    | -43345693.05      | <                     | -14345694.06       | >                      | -34345695.07        | <                       | -23345696.08         | cmm  | No |
	#Data with Gender Not Specified and Age unit with Weeks	
	| 09/01/2016 | 07/29/2018 | Not Specified |               | 30         | Weeks        |             | 30       | Weeks      | >                    | -43345121.61      | <                     | -14345122.62       | >                      | -34345123.63        | <                       | -23345124.64         | cmm  | No |
	
Scenario: 22_Navigate to Patient and Enter the values in Demographics form 
      When I expand "Visit (week1)" to select and open "FrmDemographics" CRF.
      And I click "Checkout" button on "FrmDemographics" CRF. 
	  Then I enter below flat questions data in the CRF.
	 | QuestionPrompt      | AnswerValue   | AnswerFieldType |
	 | What is your age    | 30            | TextBox         |
	 | Age Unit            | Years         | ListBox         |
	 | What is your gender | Not Specified | ListBox         |
	 And I click on "Save & Close" button on "FrmDemographics" CRF.
	 Then The CRF with data is saved and checked-in successfully. 

Scenario: 23_Navigate to Patient and enter the values in FormD1
      When I expand "Visit (week2)" to select and open "FormD1" CRF.
      And I click "Checkout" button on "FormD1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID Q1 For D1              | Lab01 (L01) | LISTBOX         |
      | Lab Name Q1 For D1            |             | TextBox         |
      | Company Q1 For D1             |             | TextBox         |
      | Lab Address Q1 For D1         |             | TextBox         |
      | Country Q1 For D1             |             | TextBox         |
      | CRF Collection Date Q1 For D1 | 09/06/2016  | TextBox         |
	  And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue   | AnswerFieldType | RowButtonToClick |
	  | No        | 1         | CRF Lab Value For D1           | 0             | TextBox         |                  |
	  | No        | 1         | CRF Lab (Original) Unit for D1 | cmm           | LISTBOX         | Save & Close Row |
	  | No        | 2         | CRF Lab Value For D1           | -1.2          | TextBox         |                  |
	  | No        | 2         | CRF Lab (Original) Unit for D1 | cmm           | LISTBOX         | Save & Close Row |
	  | No        | 3         | CRF Lab Value For D1           | -1.3         | TextBox         |                  |
	  | No        | 3         | CRF Lab (Original) Unit for D1 | cmm           | LISTBOX         | Save & Close Row |
	  | No        | 4         | CRF Lab Value For D1           | -12345678.98 | TextBox         |                  |
	  | No        | 4         | CRF Lab (Original) Unit for D1 | cmm           | LISTBOX         | Save & Close Row |
	  | No        | 5         | CRF Lab Value For D1           | -12345676.98  | TextBox         |                  |
	  | No        | 5         | CRF Lab (Original) Unit for D1 | cmm           | LISTBOX         | Save & Close Row |
	  | No        | 6         | CRF Lab Value For D1           | 11            | TextBox         |                  |
	  | No        | 6         | CRF Lab (Original) Unit for D1 | cmm           | LISTBOX         | Save & Close Row |
	  | No        | 7         | CRF Lab Value For D1           |               | TextBox         |                  |
	  | No        | 7         | CRF Lab (Original) Unit for D1 | cmm           | LISTBOX         | Save & Close Row |
	  | No        | 8         | CRF Lab Value For D1           |               | TextBox         |                  |
	  | No        | 8         | CRF Lab (Original) Unit for D1 |               | LISTBOX         | Save & Close Row |
	  | No        | 9         | CRF Lab Value For D1           |               | TextBox         |                  |
	  | No        | 9         | CRF Lab (Original) Unit for D1 | g/L           | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully.  

#Verify the auto population of reference range records in view mode 
Scenario: 24_Navigate to Patient and verify the values of Auto build table
      When I expand "Visit (week2)" to select and open "FormD1" CRF.      
      Then I verify below "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 1         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 1         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 1         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 1         | LOINC Code For D1                               |               | TextBox         |                  |
	| 1         | Category For D1                                 |               | TextBox         |                  |
	| 1         | SAS Label For D1                                |               | TextBox         |                  |
	| 1         | Specimen For D1                                 |               | TextBox         |                  |
	| 1         | Method For D1                                   |               | TextBox         |                  |
	| 1         | Result Type For D1                              |               | TextBox         |                  |
	| 1         | Normal Reference Range Low For D1               | >10.21        | Text            |                  |
	| 1         | Normal Reference Range High For D1              | <15.11        | Text            |                  |
	| 1         | Subcategory For D1                              |               | TextBox         |                  |
	| 1         | Critical Reference Range High For D1            | <20.41        | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | >25.71        | Text            |                  |
	| 1         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 1         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 1         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 1         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 1         | Precision For D1                                |               | TextBox         |                  |
	| 1         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 1         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN2 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 2         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 2         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 2         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 2         | LOINC Code For D1                               |               | TextBox         |                  |
	| 2         | Category For D1                                 |               | TextBox         |                  |
	| 2         | SAS Label For D1                                |               | TextBox         |                  |
	| 2         | Specimen For D1                                 |               | TextBox         |                  |
	| 2         | Method For D1                                   |               | TextBox         |                  |
	| 2         | Result Type For D1                              |               | TextBox         |                  |
	| 2         | Normal Reference Range Low For D1               | >10.01        | Text            |                  |
	| 2         | Normal Reference Range High For D1              | <15.02        | Text            |                  |
	| 2         | Subcategory For D1                              |               | TextBox         |                  |
	| 2         | Critical Reference Range High For D1            | <25.04        | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | >20.03        | Text            |                  |
	| 2         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 2         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 2         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 2         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 2         | Precision For D1                                |               | TextBox         |                  |
	| 2         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 2         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN3 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 3         | CRF Lab Test Name For D1                        | HEMOGLOBIN3   | Text            |                  |
	| 3         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 3         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 3         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 3         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 3         | LOINC Code For D1                               |               | TextBox         |                  |
	| 3         | Category For D1                                 |               | TextBox         |                  |
	| 3         | SAS Label For D1                                |               | TextBox         |                  |
	| 3         | Specimen For D1                                 |               | TextBox         |                  |
	| 3         | Method For D1                                   |               | TextBox         |                  |
	| 3         | Result Type For D1                              |               | TextBox         |                  |
	| 3         | Normal Reference Range Low For D1               | >-43345678.23 | Text            |                  |
	| 3         | Normal Reference Range High For D1              | <-14345678.24 | Text            |                  |
	| 3         | Subcategory For D1                              |               | TextBox         |                  |
	| 3         | Critical Reference Range High For D1            | <-23345679.26 | Text            |                  |
	| 3         | Critical Reference Range Low For D1             | >-34345677.25 | Text            |                  |
	| 3         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 3         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 3         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 3         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 3         | Precision For D1                                |               | TextBox         |                  |
	| 3         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 3         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 3         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN4 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 4         | CRF Lab Test Name For D1                        | HEMOGLOBIN4   | Text            |                  |
	| 4         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 4         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 4         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 4         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 4         | LOINC Code For D1                               |               | TextBox         |                  |
	| 4         | Category For D1                                 |               | TextBox         |                  |
	| 4         | SAS Label For D1                                |               | TextBox         |                  |
	| 4         | Specimen For D1                                 |               | TextBox         |                  |
	| 4         | Method For D1                                   |               | TextBox         |                  |
	| 4         | Result Type For D1                              |               | TextBox         |                  |
	| 4         | Normal Reference Range Low For D1               | -22345678.15  | Text            |                  |
	| 4         | Normal Reference Range High For D1              | -12345678.16  | Text            |                  |
	| 4         | Subcategory For D1                              |               | TextBox         |                  |
	| 4         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 4         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 4         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 4         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 4         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 4         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 4         | Precision For D1                                |               | TextBox         |                  |
	| 4         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 4         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 4         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN5 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 5         | CRF Lab Test Name For D1                        | HEMOGLOBIN5   | Text            |                  |
	| 5         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 5         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 5         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 5         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 5         | LOINC Code For D1                               |               | TextBox         |                  |
	| 5         | Category For D1                                 |               | TextBox         |                  |
	| 5         | SAS Label For D1                                |               | TextBox         |                  |
	| 5         | Specimen For D1                                 |               | TextBox         |                  |
	| 5         | Method For D1                                   |               | TextBox         |                  |
	| 5         | Result Type For D1                              |               | TextBox         |                  |
	| 5         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 5         | Normal Reference Range High For D1              |               | Text            |                  |
	| 5         | Subcategory For D1                              |               | TextBox         |                  |
	| 5         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 5         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 5         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 5         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 5         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 5         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 5         | Precision For D1                                |               | TextBox         |                  |
	| 5         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 5         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 5         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN6 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 6         | CRF Lab Test Name For D1                        | HEMOGLOBIN6   | Text            |                  |
	| 6         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 6         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 6         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 6         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 6         | LOINC Code For D1                               |               | TextBox         |                  |
	| 6         | Category For D1                                 |               | TextBox         |                  |
	| 6         | SAS Label For D1                                |               | TextBox         |                  |
	| 6         | Specimen For D1                                 |               | TextBox         |                  |
	| 6         | Method For D1                                   |               | TextBox         |                  |
	| 6         | Result Type For D1                              |               | TextBox         |                  |
	| 6         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 6         | Normal Reference Range High For D1              |               | Text            |                  |
	| 6         | Subcategory For D1                              |               | TextBox         |                  |
	| 6         | Critical Reference Range High For D1            |               | Text            |                  |
	| 6         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 6         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 6         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 6         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 6         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 6         | Precision For D1                                |               | TextBox         |                  |
	| 6         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 6         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 6         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN7 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 7         | CRF Lab Test Name For D1                        | HEMOGLOBIN7   | Text            |                  |
	| 7         | CRF Lab Value For D1                            |               | Text            |                  |
	| 7         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 7         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 7         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 7         | LOINC Code For D1                               |               | TextBox         |                  |
	| 7         | Category For D1                                 |               | TextBox         |                  |
	| 7         | SAS Label For D1                                |               | TextBox         |                  |
	| 7         | Specimen For D1                                 |               | TextBox         |                  |
	| 7         | Method For D1                                   |               | TextBox         |                  |
	| 7         | Result Type For D1                              |               | TextBox         |                  |
	| 7         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 7         | Normal Reference Range High For D1              |               | Text            |                  |
	| 7         | Subcategory For D1                              |               | TextBox         |                  |
	| 7         | Critical Reference Range High For D1            |               | Text            |                  |
	| 7         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 7         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 7         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 7         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 7         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 7         | Precision For D1                                |               | TextBox         |                  |
	| 7         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 7         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 7         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               | 
	#HEMOGLOBIN8 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 8         | CRF Lab Test Name For D1                        | HEMOGLOBIN8   | Text            |                  |
	| 8         | CRF Lab Value For D1                            |               | Text            |                  |
	| 8         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 8         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 8         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 8         | LOINC Code For D1                               |               | TextBox         |                  |
	| 8         | Category For D1                                 |               | TextBox         |                  |
	| 8         | SAS Label For D1                                |               | TextBox         |                  |
	| 8         | Specimen For D1                                 |               | TextBox         |                  |
	| 8         | Method For D1                                   |               | TextBox         |                  |
	| 8         | Result Type For D1                              |               | TextBox         |                  |
	| 8         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 8         | Normal Reference Range High For D1              |               | Text            |                  |
	| 8         | Subcategory For D1                              |               | TextBox         |                  |
	| 8         | Critical Reference Range High For D1            |               | Text            |                  |
	| 8         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 8         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 8         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 8         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 8         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 8         | Precision For D1                                |               | TextBox         |                  |
	| 8         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 8         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 8         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN9 test data 
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 9         | CRF Lab Test Name For D1                        | HEMOGLOBIN9   | Text            |                  |
	| 9         | CRF Lab Value For D1                            |               | Text            |                  |
	| 9         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 9         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 9         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 9         | LOINC Code For D1                               |               | TextBox         |                  |
	| 9         | Category For D1                                 |               | TextBox         |                  |
	| 9         | SAS Label For D1                                |               | TextBox         |                  |
	| 9         | Specimen For D1                                 |               | TextBox         |                  |
	| 9         | Method For D1                                   |               | TextBox         |                  |
	| 9         | Result Type For D1                              |               | TextBox         |                  |
	| 9         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 9         | Normal Reference Range High For D1              |               | Text            |                  |
	| 9         | Subcategory For D1                              |               | TextBox         |                  |
	| 9         | Critical Reference Range High For D1            |               | Text            |                  |
	| 9         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 9         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 9         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 9         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 9         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 9         | Precision For D1                                |               | TextBox         |                  |
	| 9         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 9         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 9         | CRF Lab (Original) Unit for D1                  | g/L           | Text            | OK               | 


#Verify the auto population of reference range records after form checkout
Scenario: 25_Navigate to Patient and verify the values of Auto build table
      When I expand "Visit (week2)" to select and open "FormD1" CRF.      
      Then I verify below "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 1         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 1         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 1         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 1         | LOINC Code For D1                               |               | TextBox         |                  |
	| 1         | Category For D1                                 |               | TextBox         |                  |
	| 1         | SAS Label For D1                                |               | TextBox         |                  |
	| 1         | Specimen For D1                                 |               | TextBox         |                  |
	| 1         | Method For D1                                   |               | TextBox         |                  |
	| 1         | Result Type For D1                              |               | TextBox         |                  |
	| 1         | Normal Reference Range Low For D1               | >10.21        | Text            |                  |
	| 1         | Normal Reference Range High For D1              | <15.11        | Text            |                  |
	| 1         | Subcategory For D1                              |               | TextBox         |                  |
	| 1         | Critical Reference Range High For D1            | <20.41        | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | >25.71        | Text            |                  |
	| 1         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 1         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 1         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 1         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 1         | Precision For D1                                |               | TextBox         |                  |
	| 1         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 1         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN2 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 2         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 2         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 2         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 2         | LOINC Code For D1                               |               | TextBox         |                  |
	| 2         | Category For D1                                 |               | TextBox         |                  |
	| 2         | SAS Label For D1                                |               | TextBox         |                  |
	| 2         | Specimen For D1                                 |               | TextBox         |                  |
	| 2         | Method For D1                                   |               | TextBox         |                  |
	| 2         | Result Type For D1                              |               | TextBox         |                  |
	| 2         | Normal Reference Range Low For D1               | >10.01        | Text            |                  |
	| 2         | Normal Reference Range High For D1              | <15.02        | Text            |                  |
	| 2         | Subcategory For D1                              |               | TextBox         |                  |
	| 2         | Critical Reference Range High For D1            | <25.04        | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | >20.03        | Text            |                  |
	| 2         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 2         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 2         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 2         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 2         | Precision For D1                                |               | TextBox         |                  |
	| 2         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 2         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN3 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 3         | CRF Lab Test Name For D1                        | HEMOGLOBIN3   | Text            |                  |
	| 3         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 3         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 3         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 3         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 3         | LOINC Code For D1                               |               | TextBox         |                  |
	| 3         | Category For D1                                 |               | TextBox         |                  |
	| 3         | SAS Label For D1                                |               | TextBox         |                  |
	| 3         | Specimen For D1                                 |               | TextBox         |                  |
	| 3         | Method For D1                                   |               | TextBox         |                  |
	| 3         | Result Type For D1                              |               | TextBox         |                  |
	| 3         | Normal Reference Range Low For D1               | >-43345678.23 | Text            |                  |
	| 3         | Normal Reference Range High For D1              | <-14345678.24 | Text            |                  |
	| 3         | Subcategory For D1                              |               | TextBox         |                  |
	| 3         | Critical Reference Range High For D1            | <-23345679.26 | Text            |                  |
	| 3         | Critical Reference Range Low For D1             | >-34345677.25 | Text            |                  |
	| 3         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 3         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 3         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 3         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 3         | Precision For D1                                |               | TextBox         |                  |
	| 3         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 3         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 3         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN4 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 4         | CRF Lab Test Name For D1                        | HEMOGLOBIN4   | Text            |                  |
	| 4         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 4         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 4         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 4         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 4         | LOINC Code For D1                               |               | TextBox         |                  |
	| 4         | Category For D1                                 |               | TextBox         |                  |
	| 4         | SAS Label For D1                                |               | TextBox         |                  |
	| 4         | Specimen For D1                                 |               | TextBox         |                  |
	| 4         | Method For D1                                   |               | TextBox         |                  |
	| 4         | Result Type For D1                              |               | TextBox         |                  |
	| 4         | Normal Reference Range Low For D1               | -22345678.15  | Text            |                  |
	| 4         | Normal Reference Range High For D1              | -12345678.16  | Text            |                  |
	| 4         | Subcategory For D1                              |               | TextBox         |                  |
	| 4         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 4         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 4         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 4         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 4         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 4         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 4         | Precision For D1                                |               | TextBox         |                  |
	| 4         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 4         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 4         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN5 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 5         | CRF Lab Test Name For D1                        | HEMOGLOBIN5   | Text            |                  |
	| 5         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 5         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 5         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 5         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 5         | LOINC Code For D1                               |               | TextBox         |                  |
	| 5         | Category For D1                                 |               | TextBox         |                  |
	| 5         | SAS Label For D1                                |               | TextBox         |                  |
	| 5         | Specimen For D1                                 |               | TextBox         |                  |
	| 5         | Method For D1                                   |               | TextBox         |                  |
	| 5         | Result Type For D1                              |               | TextBox         |                  |
	| 5         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 5         | Normal Reference Range High For D1              |               | Text            |                  |
	| 5         | Subcategory For D1                              |               | TextBox         |                  |
	| 5         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 5         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 5         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 5         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 5         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 5         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 5         | Precision For D1                                |               | TextBox         |                  |
	| 5         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 5         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 5         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN6 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 6         | CRF Lab Test Name For D1                        | HEMOGLOBIN6   | Text            |                  |
	| 6         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 6         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 6         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 6         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 6         | LOINC Code For D1                               |               | TextBox         |                  |
	| 6         | Category For D1                                 |               | TextBox         |                  |
	| 6         | SAS Label For D1                                |               | TextBox         |                  |
	| 6         | Specimen For D1                                 |               | TextBox         |                  |
	| 6         | Method For D1                                   |               | TextBox         |                  |
	| 6         | Result Type For D1                              |               | TextBox         |                  |
	| 6         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 6         | Normal Reference Range High For D1              |               | Text            |                  |
	| 6         | Subcategory For D1                              |               | TextBox         |                  |
	| 6         | Critical Reference Range High For D1            |               | Text            |                  |
	| 6         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 6         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 6         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 6         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 6         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 6         | Precision For D1                                |               | TextBox         |                  |
	| 6         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 6         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 6         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN7 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 7         | CRF Lab Test Name For D1                        | HEMOGLOBIN7   | Text            |                  |
	| 7         | CRF Lab Value For D1                            |               | Text            |                  |
	| 7         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 7         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 7         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 7         | LOINC Code For D1                               |               | TextBox         |                  |
	| 7         | Category For D1                                 |               | TextBox         |                  |
	| 7         | SAS Label For D1                                |               | TextBox         |                  |
	| 7         | Specimen For D1                                 |               | TextBox         |                  |
	| 7         | Method For D1                                   |               | TextBox         |                  |
	| 7         | Result Type For D1                              |               | TextBox         |                  |
	| 7         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 7         | Normal Reference Range High For D1              |               | Text            |                  |
	| 7         | Subcategory For D1                              |               | TextBox         |                  |
	| 7         | Critical Reference Range High For D1            |               | Text            |                  |
	| 7         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 7         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 7         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 7         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 7         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 7         | Precision For D1                                |               | TextBox         |                  |
	| 7         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 7         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 7         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN8 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 8         | CRF Lab Test Name For D1                        | HEMOGLOBIN8   | Text            |                  |
	| 8         | CRF Lab Value For D1                            |               | Text            |                  |
	| 8         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 8         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 8         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 8         | LOINC Code For D1                               |               | TextBox         |                  |
	| 8         | Category For D1                                 |               | TextBox         |                  |
	| 8         | SAS Label For D1                                |               | TextBox         |                  |
	| 8         | Specimen For D1                                 |               | TextBox         |                  |
	| 8         | Method For D1                                   |               | TextBox         |                  |
	| 8         | Result Type For D1                              |               | TextBox         |                  |
	| 8         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 8         | Normal Reference Range High For D1              |               | Text            |                  |
	| 8         | Subcategory For D1                              |               | TextBox         |                  |
	| 8         | Critical Reference Range High For D1            |               | Text            |                  |
	| 8         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 8         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 8         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 8         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 8         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 8         | Precision For D1                                |               | TextBox         |                  |
	| 8         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 8         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 8         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN9 test data 
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 9         | CRF Lab Test Name For D1                        | HEMOGLOBIN9   | Text            |                  |
	| 9         | CRF Lab Value For D1                            |               | Text            |                  |
	| 9         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 9         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 9         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 9         | LOINC Code For D1                               |               | TextBox         |                  |
	| 9         | Category For D1                                 |               | TextBox         |                  |
	| 9         | SAS Label For D1                                |               | TextBox         |                  |
	| 9         | Specimen For D1                                 |               | TextBox         |                  |
	| 9         | Method For D1                                   |               | TextBox         |                  |
	| 9         | Result Type For D1                              |               | TextBox         |                  |
	| 9         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 9         | Normal Reference Range High For D1              |               | Text            |                  |
	| 9         | Subcategory For D1                              |               | TextBox         |                  |
	| 9         | Critical Reference Range High For D1            |               | Text            |                  |
	| 9         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 9         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 9         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 9         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 9         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 9         | Precision For D1                                |               | TextBox         |                  |
	| 9         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 9         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 9         | CRF Lab (Original) Unit for D1                  | g/L           | Text            | Cancel Row       |            
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 26_Navigate to Patient and Enter the values in Demographics form 
      When I expand "Visit (week1)" to select and open "FrmDemographics" CRF.
      And I click "Checkout" button on "FrmDemographics" CRF. 
	  And I enter below flat questions data in the CRF.
	  And I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes                      |
	| Age Unit       | Years              | ListBox         | Days           | SOR             | Changing Age unit to Days From Years |
	 #| QuestionPrompt      | AnswerValue   | AnswerFieldType |
	 #| What is your age    | 30            | TextBox         |	 
	 #| What is your gender | Not Specified | ListBox         |
	 And I click on "Save & Close" button on "FrmDemographics" CRF.
	 Then The CRF with data is saved and checked-in successfully. 

Scenario: 27_Navigate to Patient and enter the values in FormD1
      When I expand "Visit (week2)" to select and open "FormD1" CRF.
      And I click "Checkout" button on "FormD1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      #| Lab ID Q1 For D1              | Lab01 (L01) | LISTBOX         |
      #| Lab Name Q1 For D1            |             | TextBox         |
      #| Company Q1 For D1             |             | TextBox         |
      #| Lab Address Q1 For D1         |             | TextBox         |
      #| Country Q1 For D1             |             | TextBox         |
      #| CRF Collection Date Q1 For D1 | 09/06/2016  | TextBox         |
	  And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 1         | CRF Lab Value For D1 | 0                 | TextBox         | 0.1              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 2         | CRF Lab Value For D1 | -1.2                 | TextBox         | -1.3              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 3         | CRF Lab Value For D1 | -1.3                 | TextBox         | -1.5              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 4         | CRF Lab Value For D1 | -12345678.98                 | TextBox         | 20              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 5         | CRF Lab Value For D1 | -12345676.98                 | TextBox         | 21              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 6         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 7         | CRF Lab Value For D1 |                  | TextBox         |               | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 8         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 9         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	  
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 28_Navigate to Patient and verify the values of Auto build table
      When I expand "Visit (week2)" to select and open "FormD1" CRF.      
      Then I verify below "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 1         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 1         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 1         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 1         | LOINC Code For D1                               |               | TextBox         |                  |
	| 1         | Category For D1                                 |               | TextBox         |                  |
	| 1         | SAS Label For D1                                |               | TextBox         |                  |
	| 1         | Specimen For D1                                 |               | TextBox         |                  |
	| 1         | Method For D1                                   |               | TextBox         |                  |
	| 1         | Result Type For D1                              |               | TextBox         |                  |
	| 1         | Normal Reference Range Low For D1               | >10.21        | Text            |                  |
	| 1         | Normal Reference Range High For D1              | <15.11        | Text            |                  |
	| 1         | Subcategory For D1                              |               | TextBox         |                  |
	| 1         | Critical Reference Range High For D1            | <20.41        | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | >25.71        | Text            |                  |
	| 1         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 1         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 1         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 1         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 1         | Precision For D1                                |               | TextBox         |                  |
	| 1         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 1         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN2 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 2         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 2         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 2         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 2         | LOINC Code For D1                               |               | TextBox         |                  |
	| 2         | Category For D1                                 |               | TextBox         |                  |
	| 2         | SAS Label For D1                                |               | TextBox         |                  |
	| 2         | Specimen For D1                                 |               | TextBox         |                  |
	| 2         | Method For D1                                   |               | TextBox         |                  |
	| 2         | Result Type For D1                              |               | TextBox         |                  |
	| 2         | Normal Reference Range Low For D1               | >10.01        | Text            |                  |
	| 2         | Normal Reference Range High For D1              | <15.02        | Text            |                  |
	| 2         | Subcategory For D1                              |               | TextBox         |                  |
	| 2         | Critical Reference Range High For D1            | <25.04        | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | >20.03        | Text            |                  |
	| 2         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 2         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 2         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 2         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 2         | Precision For D1                                |               | TextBox         |                  |
	| 2         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 2         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN3 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 3         | CRF Lab Test Name For D1                        | HEMOGLOBIN3   | Text            |                  |
	| 3         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 3         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 3         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 3         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 3         | LOINC Code For D1                               |               | TextBox         |                  |
	| 3         | Category For D1                                 |               | TextBox         |                  |
	| 3         | SAS Label For D1                                |               | TextBox         |                  |
	| 3         | Specimen For D1                                 |               | TextBox         |                  |
	| 3         | Method For D1                                   |               | TextBox         |                  |
	| 3         | Result Type For D1                              |               | TextBox         |                  |
	| 3         | Normal Reference Range Low For D1               | >-43345678.23 | Text            |                  |
	| 3         | Normal Reference Range High For D1              | <-14345678.24 | Text            |                  |
	| 3         | Subcategory For D1                              |               | TextBox         |                  |
	| 3         | Critical Reference Range High For D1            | <-23345679.26 | Text            |                  |
	| 3         | Critical Reference Range Low For D1             | >-34345677.25 | Text            |                  |
	| 3         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 3         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 3         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 3         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 3         | Precision For D1                                |               | TextBox         |                  |
	| 3         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 3         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 3         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN4 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 4         | CRF Lab Test Name For D1                        | HEMOGLOBIN4   | Text            |                  |
	| 4         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 4         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 4         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 4         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 4         | LOINC Code For D1                               |               | TextBox         |                  |
	| 4         | Category For D1                                 |               | TextBox         |                  |
	| 4         | SAS Label For D1                                |               | TextBox         |                  |
	| 4         | Specimen For D1                                 |               | TextBox         |                  |
	| 4         | Method For D1                                   |               | TextBox         |                  |
	| 4         | Result Type For D1                              |               | TextBox         |                  |
	| 4         | Normal Reference Range Low For D1               | -22345678.15  | Text            |                  |
	| 4         | Normal Reference Range High For D1              | -12345678.16  | Text            |                  |
	| 4         | Subcategory For D1                              |               | TextBox         |                  |
	| 4         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 4         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 4         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 4         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 4         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 4         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 4         | Precision For D1                                |               | TextBox         |                  |
	| 4         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 4         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 4         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN5 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 5         | CRF Lab Test Name For D1                        | HEMOGLOBIN5   | Text            |                  |
	| 5         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 5         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 5         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 5         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 5         | LOINC Code For D1                               |               | TextBox         |                  |
	| 5         | Category For D1                                 |               | TextBox         |                  |
	| 5         | SAS Label For D1                                |               | TextBox         |                  |
	| 5         | Specimen For D1                                 |               | TextBox         |                  |
	| 5         | Method For D1                                   |               | TextBox         |                  |
	| 5         | Result Type For D1                              |               | TextBox         |                  |
	| 5         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 5         | Normal Reference Range High For D1              |               | Text            |                  |
	| 5         | Subcategory For D1                              |               | TextBox         |                  |
	| 5         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 5         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 5         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 5         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 5         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 5         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 5         | Precision For D1                                |               | TextBox         |                  |
	| 5         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 5         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 5         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN6 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 6         | CRF Lab Test Name For D1                        | HEMOGLOBIN6   | Text            |                  |
	| 6         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 6         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 6         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 6         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 6         | LOINC Code For D1                               |               | TextBox         |                  |
	| 6         | Category For D1                                 |               | TextBox         |                  |
	| 6         | SAS Label For D1                                |               | TextBox         |                  |
	| 6         | Specimen For D1                                 |               | TextBox         |                  |
	| 6         | Method For D1                                   |               | TextBox         |                  |
	| 6         | Result Type For D1                              |               | TextBox         |                  |
	| 6         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 6         | Normal Reference Range High For D1              |               | Text            |                  |
	| 6         | Subcategory For D1                              |               | TextBox         |                  |
	| 6         | Critical Reference Range High For D1            |               | Text            |                  |
	| 6         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 6         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 6         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 6         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 6         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 6         | Precision For D1                                |               | TextBox         |                  |
	| 6         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 6         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 6         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN7 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 7         | CRF Lab Test Name For D1                        | HEMOGLOBIN7   | Text            |                  |
	| 7         | CRF Lab Value For D1                            |               | Text            |                  |
	| 7         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 7         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 7         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 7         | LOINC Code For D1                               |               | TextBox         |                  |
	| 7         | Category For D1                                 |               | TextBox         |                  |
	| 7         | SAS Label For D1                                |               | TextBox         |                  |
	| 7         | Specimen For D1                                 |               | TextBox         |                  |
	| 7         | Method For D1                                   |               | TextBox         |                  |
	| 7         | Result Type For D1                              |               | TextBox         |                  |
	| 7         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 7         | Normal Reference Range High For D1              |               | Text            |                  |
	| 7         | Subcategory For D1                              |               | TextBox         |                  |
	| 7         | Critical Reference Range High For D1            |               | Text            |                  |
	| 7         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 7         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 7         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 7         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 7         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 7         | Precision For D1                                |               | TextBox         |                  |
	| 7         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 7         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 7         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               | 
	#HEMOGLOBIN8 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 8         | CRF Lab Test Name For D1                        | HEMOGLOBIN8   | Text            |                  |
	| 8         | CRF Lab Value For D1                            |               | Text            |                  |
	| 8         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 8         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 8         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 8         | LOINC Code For D1                               |               | TextBox         |                  |
	| 8         | Category For D1                                 |               | TextBox         |                  |
	| 8         | SAS Label For D1                                |               | TextBox         |                  |
	| 8         | Specimen For D1                                 |               | TextBox         |                  |
	| 8         | Method For D1                                   |               | TextBox         |                  |
	| 8         | Result Type For D1                              |               | TextBox         |                  |
	| 8         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 8         | Normal Reference Range High For D1              |               | Text            |                  |
	| 8         | Subcategory For D1                              |               | TextBox         |                  |
	| 8         | Critical Reference Range High For D1            |               | Text            |                  |
	| 8         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 8         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 8         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 8         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 8         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 8         | Precision For D1                                |               | TextBox         |                  |
	| 8         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 8         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 8         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN9 test data 
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 9         | CRF Lab Test Name For D1                        | HEMOGLOBIN9   | Text            |                  |
	| 9         | CRF Lab Value For D1                            |               | Text            |                  |
	| 9         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 9         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 9         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 9         | LOINC Code For D1                               |               | TextBox         |                  |
	| 9         | Category For D1                                 |               | TextBox         |                  |
	| 9         | SAS Label For D1                                |               | TextBox         |                  |
	| 9         | Specimen For D1                                 |               | TextBox         |                  |
	| 9         | Method For D1                                   |               | TextBox         |                  |
	| 9         | Result Type For D1                              |               | TextBox         |                  |
	| 9         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 9         | Normal Reference Range High For D1              |               | Text            |                  |
	| 9         | Subcategory For D1                              |               | TextBox         |                  |
	| 9         | Critical Reference Range High For D1            |               | Text            |                  |
	| 9         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 9         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 9         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 9         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 9         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 9         | Precision For D1                                |               | TextBox         |                  |
	| 9         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 9         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 9         | CRF Lab (Original) Unit for D1                  | g/L           | Text            | OK               | 


#Verify the auto population of reference range records after form checkout
Scenario: 29_Navigate to Patient and verify the values of Auto build table
      When I expand "Visit (week2)" to select and open "FormD1" CRF.      
      Then I verify below "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 1         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 1         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 1         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 1         | LOINC Code For D1                               |               | TextBox         |                  |
	| 1         | Category For D1                                 |               | TextBox         |                  |
	| 1         | SAS Label For D1                                |               | TextBox         |                  |
	| 1         | Specimen For D1                                 |               | TextBox         |                  |
	| 1         | Method For D1                                   |               | TextBox         |                  |
	| 1         | Result Type For D1                              |               | TextBox         |                  |
	| 1         | Normal Reference Range Low For D1               | >10.21        | Text            |                  |
	| 1         | Normal Reference Range High For D1              | <15.11        | Text            |                  |
	| 1         | Subcategory For D1                              |               | TextBox         |                  |
	| 1         | Critical Reference Range High For D1            | <20.41        | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | >25.71        | Text            |                  |
	| 1         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 1         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 1         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 1         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 1         | Precision For D1                                |               | TextBox         |                  |
	| 1         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 1         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN2 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 2         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 2         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 2         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 2         | LOINC Code For D1                               |               | TextBox         |                  |
	| 2         | Category For D1                                 |               | TextBox         |                  |
	| 2         | SAS Label For D1                                |               | TextBox         |                  |
	| 2         | Specimen For D1                                 |               | TextBox         |                  |
	| 2         | Method For D1                                   |               | TextBox         |                  |
	| 2         | Result Type For D1                              |               | TextBox         |                  |
	| 2         | Normal Reference Range Low For D1               | >10.01        | Text            |                  |
	| 2         | Normal Reference Range High For D1              | <15.02        | Text            |                  |
	| 2         | Subcategory For D1                              |               | TextBox         |                  |
	| 2         | Critical Reference Range High For D1            | <25.04        | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | >20.03        | Text            |                  |
	| 2         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 2         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 2         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 2         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 2         | Precision For D1                                |               | TextBox         |                  |
	| 2         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 2         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN3 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 3         | CRF Lab Test Name For D1                        | HEMOGLOBIN3   | Text            |                  |
	| 3         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 3         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 3         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 3         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 3         | LOINC Code For D1                               |               | TextBox         |                  |
	| 3         | Category For D1                                 |               | TextBox         |                  |
	| 3         | SAS Label For D1                                |               | TextBox         |                  |
	| 3         | Specimen For D1                                 |               | TextBox         |                  |
	| 3         | Method For D1                                   |               | TextBox         |                  |
	| 3         | Result Type For D1                              |               | TextBox         |                  |
	| 3         | Normal Reference Range Low For D1               | >-43345678.23 | Text            |                  |
	| 3         | Normal Reference Range High For D1              | <-14345678.24 | Text            |                  |
	| 3         | Subcategory For D1                              |               | TextBox         |                  |
	| 3         | Critical Reference Range High For D1            | <-23345679.26 | Text            |                  |
	| 3         | Critical Reference Range Low For D1             | >-34345677.25 | Text            |                  |
	| 3         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 3         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 3         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 3         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 3         | Precision For D1                                |               | TextBox         |                  |
	| 3         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 3         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 3         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN4 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 4         | CRF Lab Test Name For D1                        | HEMOGLOBIN4   | Text            |                  |
	| 4         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 4         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 4         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 4         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 4         | LOINC Code For D1                               |               | TextBox         |                  |
	| 4         | Category For D1                                 |               | TextBox         |                  |
	| 4         | SAS Label For D1                                |               | TextBox         |                  |
	| 4         | Specimen For D1                                 |               | TextBox         |                  |
	| 4         | Method For D1                                   |               | TextBox         |                  |
	| 4         | Result Type For D1                              |               | TextBox         |                  |
	| 4         | Normal Reference Range Low For D1               | -22345678.15  | Text            |                  |
	| 4         | Normal Reference Range High For D1              | -12345678.16  | Text            |                  |
	| 4         | Subcategory For D1                              |               | TextBox         |                  |
	| 4         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 4         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 4         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 4         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 4         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 4         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 4         | Precision For D1                                |               | TextBox         |                  |
	| 4         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 4         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 4         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN5 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 5         | CRF Lab Test Name For D1                        | HEMOGLOBIN5   | Text            |                  |
	| 5         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 5         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 5         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 5         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 5         | LOINC Code For D1                               |               | TextBox         |                  |
	| 5         | Category For D1                                 |               | TextBox         |                  |
	| 5         | SAS Label For D1                                |               | TextBox         |                  |
	| 5         | Specimen For D1                                 |               | TextBox         |                  |
	| 5         | Method For D1                                   |               | TextBox         |                  |
	| 5         | Result Type For D1                              |               | TextBox         |                  |
	| 5         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 5         | Normal Reference Range High For D1              |               | Text            |                  |
	| 5         | Subcategory For D1                              |               | TextBox         |                  |
	| 5         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 5         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 5         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 5         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 5         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 5         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 5         | Precision For D1                                |               | TextBox         |                  |
	| 5         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 5         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 5         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN6 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 6         | CRF Lab Test Name For D1                        | HEMOGLOBIN6   | Text            |                  |
	| 6         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 6         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 6         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 6         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 6         | LOINC Code For D1                               |               | TextBox         |                  |
	| 6         | Category For D1                                 |               | TextBox         |                  |
	| 6         | SAS Label For D1                                |               | TextBox         |                  |
	| 6         | Specimen For D1                                 |               | TextBox         |                  |
	| 6         | Method For D1                                   |               | TextBox         |                  |
	| 6         | Result Type For D1                              |               | TextBox         |                  |
	| 6         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 6         | Normal Reference Range High For D1              |               | Text            |                  |
	| 6         | Subcategory For D1                              |               | TextBox         |                  |
	| 6         | Critical Reference Range High For D1            |               | Text            |                  |
	| 6         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 6         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 6         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 6         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 6         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 6         | Precision For D1                                |               | TextBox         |                  |
	| 6         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 6         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 6         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN7 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 7         | CRF Lab Test Name For D1                        | HEMOGLOBIN7   | Text            |                  |
	| 7         | CRF Lab Value For D1                            |               | Text            |                  |
	| 7         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 7         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 7         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 7         | LOINC Code For D1                               |               | TextBox         |                  |
	| 7         | Category For D1                                 |               | TextBox         |                  |
	| 7         | SAS Label For D1                                |               | TextBox         |                  |
	| 7         | Specimen For D1                                 |               | TextBox         |                  |
	| 7         | Method For D1                                   |               | TextBox         |                  |
	| 7         | Result Type For D1                              |               | TextBox         |                  |
	| 7         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 7         | Normal Reference Range High For D1              |               | Text            |                  |
	| 7         | Subcategory For D1                              |               | TextBox         |                  |
	| 7         | Critical Reference Range High For D1            |               | Text            |                  |
	| 7         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 7         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 7         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 7         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 7         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 7         | Precision For D1                                |               | TextBox         |                  |
	| 7         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 7         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 7         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN8 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 8         | CRF Lab Test Name For D1                        | HEMOGLOBIN8   | Text            |                  |
	| 8         | CRF Lab Value For D1                            |               | Text            |                  |
	| 8         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 8         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 8         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 8         | LOINC Code For D1                               |               | TextBox         |                  |
	| 8         | Category For D1                                 |               | TextBox         |                  |
	| 8         | SAS Label For D1                                |               | TextBox         |                  |
	| 8         | Specimen For D1                                 |               | TextBox         |                  |
	| 8         | Method For D1                                   |               | TextBox         |                  |
	| 8         | Result Type For D1                              |               | TextBox         |                  |
	| 8         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 8         | Normal Reference Range High For D1              |               | Text            |                  |
	| 8         | Subcategory For D1                              |               | TextBox         |                  |
	| 8         | Critical Reference Range High For D1            |               | Text            |                  |
	| 8         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 8         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 8         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 8         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 8         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 8         | Precision For D1                                |               | TextBox         |                  |
	| 8         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 8         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 8         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN9 test data 
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 9         | CRF Lab Test Name For D1                        | HEMOGLOBIN9   | Text            |                  |
	| 9         | CRF Lab Value For D1                            |               | Text            |                  |
	| 9         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 9         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 9         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 9         | LOINC Code For D1                               |               | TextBox         |                  |
	| 9         | Category For D1                                 |               | TextBox         |                  |
	| 9         | SAS Label For D1                                |               | TextBox         |                  |
	| 9         | Specimen For D1                                 |               | TextBox         |                  |
	| 9         | Method For D1                                   |               | TextBox         |                  |
	| 9         | Result Type For D1                              |               | TextBox         |                  |
	| 9         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 9         | Normal Reference Range High For D1              |               | Text            |                  |
	| 9         | Subcategory For D1                              |               | TextBox         |                  |
	| 9         | Critical Reference Range High For D1            |               | Text            |                  |
	| 9         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 9         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 9         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 9         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 9         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 9         | Precision For D1                                |               | TextBox         |                  |
	| 9         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 9         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 9         | CRF Lab (Original) Unit for D1                  | g/L           | Text            | Cancel Row       |            
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 30_Navigate to Patient and Enter the values in Demographics form 
      And I expand "Visit (week1)" to select and open "FrmDemographics" CRF.
      When I click "Checkout" button on "FrmDemographics" CRF. 
	  And I enter below flat questions data in the CRF.
	  When I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes                      |
	| Age Unit       | Days              | ListBox         | Hours           | SOR             | Changing Age unit to Hours From Days |
	 #| QuestionPrompt      | AnswerValue   | AnswerFieldType |
	 #| What is your age    | 30            | TextBox         |	 
	 #| What is your gender | Not Specified | ListBox         |
	 And I click on "Save & Close" button on "FrmDemographics" CRF.
	 Then The CRF with data is saved and checked-in successfully. 

Scenario: 31_Navigate to Patient and enter the values in FormD1
      When I expand "Visit (week2)" to select and open "FormD1" CRF.
      And I click "Checkout" button on "FormD1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      #| Lab ID Q1 For D1              | Lab01 (L01) | LISTBOX         |
      #| Lab Name Q1 For D1            |             | TextBox         |
      #| Company Q1 For D1             |             | TextBox         |
      #| Lab Address Q1 For D1         |             | TextBox         |
      #| Country Q1 For D1             |             | TextBox         |
      #| CRF Collection Date Q1 For D1 | 09/06/2016  | TextBox         |
	  And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 1         | CRF Lab Value For D1 | 0                 | TextBox         | 0.1              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 2         | CRF Lab Value For D1 | -1.2                 | TextBox         | -1.3              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 3         | CRF Lab Value For D1 | -1.3                 | TextBox         | -1.5              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 4         | CRF Lab Value For D1 | -12345678.98                 | TextBox         | 20              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 5         | CRF Lab Value For D1 | -12345676.98                 | TextBox         | 21              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  | AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  | No        | 6         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 7         | CRF Lab Value For D1 |                  | TextBox         |               | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 8         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 9         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	  
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 32_Navigate to Patient and verify the values of Auto build table
      When I expand "Visit (week2)" to select and open "FormD1" CRF.      
      Then I verify below "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 1         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 1         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 1         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 1         | LOINC Code For D1                               |               | TextBox         |                  |
	| 1         | Category For D1                                 |               | TextBox         |                  |
	| 1         | SAS Label For D1                                |               | TextBox         |                  |
	| 1         | Specimen For D1                                 |               | TextBox         |                  |
	| 1         | Method For D1                                   |               | TextBox         |                  |
	| 1         | Result Type For D1                              |               | TextBox         |                  |
	| 1         | Normal Reference Range Low For D1               | >10.21        | Text            |                  |
	| 1         | Normal Reference Range High For D1              | <15.11        | Text            |                  |
	| 1         | Subcategory For D1                              |               | TextBox         |                  |
	| 1         | Critical Reference Range High For D1            | <20.41        | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | >25.71        | Text            |                  |
	| 1         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 1         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 1         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 1         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 1         | Precision For D1                                |               | TextBox         |                  |
	| 1         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 1         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN2 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 2         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 2         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 2         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 2         | LOINC Code For D1                               |               | TextBox         |                  |
	| 2         | Category For D1                                 |               | TextBox         |                  |
	| 2         | SAS Label For D1                                |               | TextBox         |                  |
	| 2         | Specimen For D1                                 |               | TextBox         |                  |
	| 2         | Method For D1                                   |               | TextBox         |                  |
	| 2         | Result Type For D1                              |               | TextBox         |                  |
	| 2         | Normal Reference Range Low For D1               | >10.01        | Text            |                  |
	| 2         | Normal Reference Range High For D1              | <15.02        | Text            |                  |
	| 2         | Subcategory For D1                              |               | TextBox         |                  |
	| 2         | Critical Reference Range High For D1            | <25.04        | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | >20.03        | Text            |                  |
	| 2         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 2         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 2         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 2         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 2         | Precision For D1                                |               | TextBox         |                  |
	| 2         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 2         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN3 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 3         | CRF Lab Test Name For D1                        | HEMOGLOBIN3   | Text            |                  |
	| 3         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 3         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 3         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 3         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 3         | LOINC Code For D1                               |               | TextBox         |                  |
	| 3         | Category For D1                                 |               | TextBox         |                  |
	| 3         | SAS Label For D1                                |               | TextBox         |                  |
	| 3         | Specimen For D1                                 |               | TextBox         |                  |
	| 3         | Method For D1                                   |               | TextBox         |                  |
	| 3         | Result Type For D1                              |               | TextBox         |                  |
	| 3         | Normal Reference Range Low For D1               | >-43345678.23 | Text            |                  |
	| 3         | Normal Reference Range High For D1              | <-14345678.24 | Text            |                  |
	| 3         | Subcategory For D1                              |               | TextBox         |                  |
	| 3         | Critical Reference Range High For D1            | <-23345679.26 | Text            |                  |
	| 3         | Critical Reference Range Low For D1             | >-34345677.25 | Text            |                  |
	| 3         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 3         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 3         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 3         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 3         | Precision For D1                                |               | TextBox         |                  |
	| 3         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 3         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 3         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN4 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 4         | CRF Lab Test Name For D1                        | HEMOGLOBIN4   | Text            |                  |
	| 4         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 4         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 4         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 4         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 4         | LOINC Code For D1                               |               | TextBox         |                  |
	| 4         | Category For D1                                 |               | TextBox         |                  |
	| 4         | SAS Label For D1                                |               | TextBox         |                  |
	| 4         | Specimen For D1                                 |               | TextBox         |                  |
	| 4         | Method For D1                                   |               | TextBox         |                  |
	| 4         | Result Type For D1                              |               | TextBox         |                  |
	| 4         | Normal Reference Range Low For D1               | -22345678.15  | Text            |                  |
	| 4         | Normal Reference Range High For D1              | -12345678.16  | Text            |                  |
	| 4         | Subcategory For D1                              |               | TextBox         |                  |
	| 4         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 4         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 4         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 4         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 4         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 4         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 4         | Precision For D1                                |               | TextBox         |                  |
	| 4         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 4         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 4         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN5 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 5         | CRF Lab Test Name For D1                        | HEMOGLOBIN5   | Text            |                  |
	| 5         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 5         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 5         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 5         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 5         | LOINC Code For D1                               |               | TextBox         |                  |
	| 5         | Category For D1                                 |               | TextBox         |                  |
	| 5         | SAS Label For D1                                |               | TextBox         |                  |
	| 5         | Specimen For D1                                 |               | TextBox         |                  |
	| 5         | Method For D1                                   |               | TextBox         |                  |
	| 5         | Result Type For D1                              |               | TextBox         |                  |
	| 5         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 5         | Normal Reference Range High For D1              |               | Text            |                  |
	| 5         | Subcategory For D1                              |               | TextBox         |                  |
	| 5         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 5         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 5         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 5         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 5         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 5         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 5         | Precision For D1                                |               | TextBox         |                  |
	| 5         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 5         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 5         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN6 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 6         | CRF Lab Test Name For D1                        | HEMOGLOBIN6   | Text            |                  |
	| 6         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 6         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 6         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 6         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 6         | LOINC Code For D1                               |               | TextBox         |                  |
	| 6         | Category For D1                                 |               | TextBox         |                  |
	| 6         | SAS Label For D1                                |               | TextBox         |                  |
	| 6         | Specimen For D1                                 |               | TextBox         |                  |
	| 6         | Method For D1                                   |               | TextBox         |                  |
	| 6         | Result Type For D1                              |               | TextBox         |                  |
	| 6         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 6         | Normal Reference Range High For D1              |               | Text            |                  |
	| 6         | Subcategory For D1                              |               | TextBox         |                  |
	| 6         | Critical Reference Range High For D1            |               | Text            |                  |
	| 6         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 6         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 6         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 6         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 6         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 6         | Precision For D1                                |               | TextBox         |                  |
	| 6         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 6         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 6         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN7 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 7         | CRF Lab Test Name For D1                        | HEMOGLOBIN7   | Text            |                  |
	| 7         | CRF Lab Value For D1                            |               | Text            |                  |
	| 7         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 7         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 7         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 7         | LOINC Code For D1                               |               | TextBox         |                  |
	| 7         | Category For D1                                 |               | TextBox         |                  |
	| 7         | SAS Label For D1                                |               | TextBox         |                  |
	| 7         | Specimen For D1                                 |               | TextBox         |                  |
	| 7         | Method For D1                                   |               | TextBox         |                  |
	| 7         | Result Type For D1                              |               | TextBox         |                  |
	| 7         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 7         | Normal Reference Range High For D1              |               | Text            |                  |
	| 7         | Subcategory For D1                              |               | TextBox         |                  |
	| 7         | Critical Reference Range High For D1            |               | Text            |                  |
	| 7         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 7         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 7         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 7         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 7         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 7         | Precision For D1                                |               | TextBox         |                  |
	| 7         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 7         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 7         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               | 
	#HEMOGLOBIN8 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 8         | CRF Lab Test Name For D1                        | HEMOGLOBIN8   | Text            |                  |
	| 8         | CRF Lab Value For D1                            |               | Text            |                  |
	| 8         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 8         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 8         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 8         | LOINC Code For D1                               |               | TextBox         |                  |
	| 8         | Category For D1                                 |               | TextBox         |                  |
	| 8         | SAS Label For D1                                |               | TextBox         |                  |
	| 8         | Specimen For D1                                 |               | TextBox         |                  |
	| 8         | Method For D1                                   |               | TextBox         |                  |
	| 8         | Result Type For D1                              |               | TextBox         |                  |
	| 8         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 8         | Normal Reference Range High For D1              |               | Text            |                  |
	| 8         | Subcategory For D1                              |               | TextBox         |                  |
	| 8         | Critical Reference Range High For D1            |               | Text            |                  |
	| 8         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 8         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 8         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 8         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 8         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 8         | Precision For D1                                |               | TextBox         |                  |
	| 8         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 8         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 8         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN9 test data 
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 9         | CRF Lab Test Name For D1                        | HEMOGLOBIN9   | Text            |                  |
	| 9         | CRF Lab Value For D1                            |               | Text            |                  |
	| 9         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 9         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 9         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 9         | LOINC Code For D1                               |               | TextBox         |                  |
	| 9         | Category For D1                                 |               | TextBox         |                  |
	| 9         | SAS Label For D1                                |               | TextBox         |                  |
	| 9         | Specimen For D1                                 |               | TextBox         |                  |
	| 9         | Method For D1                                   |               | TextBox         |                  |
	| 9         | Result Type For D1                              |               | TextBox         |                  |
	| 9         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 9         | Normal Reference Range High For D1              |               | Text            |                  |
	| 9         | Subcategory For D1                              |               | TextBox         |                  |
	| 9         | Critical Reference Range High For D1            |               | Text            |                  |
	| 9         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 9         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 9         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 9         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 9         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 9         | Precision For D1                                |               | TextBox         |                  |
	| 9         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 9         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 9         | CRF Lab (Original) Unit for D1                  | g/L           | Text            | OK               | 

#Verify the auto population of reference range records after form checkout
Scenario: 33_Navigate to Patient and verify the values of Auto build table
      When I expand "Visit (week2)" to select and open "FormD1" CRF.      
      Then I verify below "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 1         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 1         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 1         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 1         | LOINC Code For D1                               |               | TextBox         |                  |
	| 1         | Category For D1                                 |               | TextBox         |                  |
	| 1         | SAS Label For D1                                |               | TextBox         |                  |
	| 1         | Specimen For D1                                 |               | TextBox         |                  |
	| 1         | Method For D1                                   |               | TextBox         |                  |
	| 1         | Result Type For D1                              |               | TextBox         |                  |
	| 1         | Normal Reference Range Low For D1               | >10.21        | Text            |                  |
	| 1         | Normal Reference Range High For D1              | <15.11        | Text            |                  |
	| 1         | Subcategory For D1                              |               | TextBox         |                  |
	| 1         | Critical Reference Range High For D1            | <20.41        | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | >25.71        | Text            |                  |
	| 1         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 1         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 1         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 1         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 1         | Precision For D1                                |               | TextBox         |                  |
	| 1         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 1         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN2 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 2         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 2         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 2         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 2         | LOINC Code For D1                               |               | TextBox         |                  |
	| 2         | Category For D1                                 |               | TextBox         |                  |
	| 2         | SAS Label For D1                                |               | TextBox         |                  |
	| 2         | Specimen For D1                                 |               | TextBox         |                  |
	| 2         | Method For D1                                   |               | TextBox         |                  |
	| 2         | Result Type For D1                              |               | TextBox         |                  |
	| 2         | Normal Reference Range Low For D1               | >10.01        | Text            |                  |
	| 2         | Normal Reference Range High For D1              | <15.02        | Text            |                  |
	| 2         | Subcategory For D1                              |               | TextBox         |                  |
	| 2         | Critical Reference Range High For D1            | <25.04        | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | >20.03        | Text            |                  |
	| 2         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 2         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 2         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 2         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 2         | Precision For D1                                |               | TextBox         |                  |
	| 2         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 2         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN3 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 3         | CRF Lab Test Name For D1                        | HEMOGLOBIN3   | Text            |                  |
	| 3         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 3         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 3         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 3         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 3         | LOINC Code For D1                               |               | TextBox         |                  |
	| 3         | Category For D1                                 |               | TextBox         |                  |
	| 3         | SAS Label For D1                                |               | TextBox         |                  |
	| 3         | Specimen For D1                                 |               | TextBox         |                  |
	| 3         | Method For D1                                   |               | TextBox         |                  |
	| 3         | Result Type For D1                              |               | TextBox         |                  |
	| 3         | Normal Reference Range Low For D1               | >-43345678.23 | Text            |                  |
	| 3         | Normal Reference Range High For D1              | <-14345678.24 | Text            |                  |
	| 3         | Subcategory For D1                              |               | TextBox         |                  |
	| 3         | Critical Reference Range High For D1            | <-23345679.26 | Text            |                  |
	| 3         | Critical Reference Range Low For D1             | >-34345677.25 | Text            |                  |
	| 3         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 3         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 3         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 3         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 3         | Precision For D1                                |               | TextBox         |                  |
	| 3         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 3         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 3         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN4 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 4         | CRF Lab Test Name For D1                        | HEMOGLOBIN4   | Text            |                  |
	| 4         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 4         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 4         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 4         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 4         | LOINC Code For D1                               |               | TextBox         |                  |
	| 4         | Category For D1                                 |               | TextBox         |                  |
	| 4         | SAS Label For D1                                |               | TextBox         |                  |
	| 4         | Specimen For D1                                 |               | TextBox         |                  |
	| 4         | Method For D1                                   |               | TextBox         |                  |
	| 4         | Result Type For D1                              |               | TextBox         |                  |
	| 4         | Normal Reference Range Low For D1               | -22345678.15  | Text            |                  |
	| 4         | Normal Reference Range High For D1              | -12345678.16  | Text            |                  |
	| 4         | Subcategory For D1                              |               | TextBox         |                  |
	| 4         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 4         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 4         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 4         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 4         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 4         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 4         | Precision For D1                                |               | TextBox         |                  |
	| 4         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 4         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 4         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN5 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 5         | CRF Lab Test Name For D1                        | HEMOGLOBIN5   | Text            |                  |
	| 5         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 5         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 5         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 5         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 5         | LOINC Code For D1                               |               | TextBox         |                  |
	| 5         | Category For D1                                 |               | TextBox         |                  |
	| 5         | SAS Label For D1                                |               | TextBox         |                  |
	| 5         | Specimen For D1                                 |               | TextBox         |                  |
	| 5         | Method For D1                                   |               | TextBox         |                  |
	| 5         | Result Type For D1                              |               | TextBox         |                  |
	| 5         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 5         | Normal Reference Range High For D1              |               | Text            |                  |
	| 5         | Subcategory For D1                              |               | TextBox         |                  |
	| 5         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 5         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 5         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 5         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 5         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 5         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 5         | Precision For D1                                |               | TextBox         |                  |
	| 5         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 5         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 5         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN6 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 6         | CRF Lab Test Name For D1                        | HEMOGLOBIN6   | Text            |                  |
	| 6         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 6         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 6         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 6         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 6         | LOINC Code For D1                               |               | TextBox         |                  |
	| 6         | Category For D1                                 |               | TextBox         |                  |
	| 6         | SAS Label For D1                                |               | TextBox         |                  |
	| 6         | Specimen For D1                                 |               | TextBox         |                  |
	| 6         | Method For D1                                   |               | TextBox         |                  |
	| 6         | Result Type For D1                              |               | TextBox         |                  |
	| 6         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 6         | Normal Reference Range High For D1              |               | Text            |                  |
	| 6         | Subcategory For D1                              |               | TextBox         |                  |
	| 6         | Critical Reference Range High For D1            |               | Text            |                  |
	| 6         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 6         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 6         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 6         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 6         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 6         | Precision For D1                                |               | TextBox         |                  |
	| 6         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 6         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 6         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN7 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 7         | CRF Lab Test Name For D1                        | HEMOGLOBIN7   | Text            |                  |
	| 7         | CRF Lab Value For D1                            |               | Text            |                  |
	| 7         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 7         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 7         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 7         | LOINC Code For D1                               |               | TextBox         |                  |
	| 7         | Category For D1                                 |               | TextBox         |                  |
	| 7         | SAS Label For D1                                |               | TextBox         |                  |
	| 7         | Specimen For D1                                 |               | TextBox         |                  |
	| 7         | Method For D1                                   |               | TextBox         |                  |
	| 7         | Result Type For D1                              |               | TextBox         |                  |
	| 7         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 7         | Normal Reference Range High For D1              |               | Text            |                  |
	| 7         | Subcategory For D1                              |               | TextBox         |                  |
	| 7         | Critical Reference Range High For D1            |               | Text            |                  |
	| 7         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 7         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 7         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 7         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 7         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 7         | Precision For D1                                |               | TextBox         |                  |
	| 7         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 7         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 7         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN8 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 8         | CRF Lab Test Name For D1                        | HEMOGLOBIN8   | Text            |                  |
	| 8         | CRF Lab Value For D1                            |               | Text            |                  |
	| 8         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 8         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 8         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 8         | LOINC Code For D1                               |               | TextBox         |                  |
	| 8         | Category For D1                                 |               | TextBox         |                  |
	| 8         | SAS Label For D1                                |               | TextBox         |                  |
	| 8         | Specimen For D1                                 |               | TextBox         |                  |
	| 8         | Method For D1                                   |               | TextBox         |                  |
	| 8         | Result Type For D1                              |               | TextBox         |                  |
	| 8         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 8         | Normal Reference Range High For D1              |               | Text            |                  |
	| 8         | Subcategory For D1                              |               | TextBox         |                  |
	| 8         | Critical Reference Range High For D1            |               | Text            |                  |
	| 8         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 8         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 8         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 8         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 8         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 8         | Precision For D1                                |               | TextBox         |                  |
	| 8         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 8         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 8         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN9 test data 
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 9         | CRF Lab Test Name For D1                        | HEMOGLOBIN9   | Text            |                  |
	| 9         | CRF Lab Value For D1                            |               | Text            |                  |
	| 9         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 9         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 9         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 9         | LOINC Code For D1                               |               | TextBox         |                  |
	| 9         | Category For D1                                 |               | TextBox         |                  |
	| 9         | SAS Label For D1                                |               | TextBox         |                  |
	| 9         | Specimen For D1                                 |               | TextBox         |                  |
	| 9         | Method For D1                                   |               | TextBox         |                  |
	| 9         | Result Type For D1                              |               | TextBox         |                  |
	| 9         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 9         | Normal Reference Range High For D1              |               | Text            |                  |
	| 9         | Subcategory For D1                              |               | TextBox         |                  |
	| 9         | Critical Reference Range High For D1            |               | Text            |                  |
	| 9         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 9         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 9         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 9         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 9         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 9         | Precision For D1                                |               | TextBox         |                  |
	| 9         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 9         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 9         | CRF Lab (Original) Unit for D1                  | g/L           | Text            | Cancel Row       |            
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 34_Navigate to Patient and Enter the values in Demographics form 
      When I expand "Visit (week1)" to select and open "FrmDemographics" CRF.
      And I click "Checkout" button on "FrmDemographics" CRF. 
	  And I enter below flat questions data in the CRF.
	  And I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes                        |
	| Age Unit       | Hours              | ListBox         | Months         | SOR             | Changing Age unit to Months From Hours |
	 #| QuestionPrompt      | AnswerValue   | AnswerFieldType |
	 #| What is your age    | 30            | TextBox         |	 
	 #| What is your gender | Not Specified | ListBox         |
	 And I click on "Save & Close" button on "FrmDemographics" CRF.
	 Then The CRF with data is saved and checked-in successfully. 

Scenario: 35_Navigate to Patient and enter the values in FormD1
      When I expand "Visit (week2)" to select and open "FormD1" CRF.
      And I click "Checkout" button on "FormD1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      #| Lab ID Q1 For D1              | Lab01 (L01) | LISTBOX         |
      #| Lab Name Q1 For D1            |             | TextBox         |
      #| Company Q1 For D1             |             | TextBox         |
      #| Lab Address Q1 For D1         |             | TextBox         |
      #| Country Q1 For D1             |             | TextBox         |
      #| CRF Collection Date Q1 For D1 | 09/06/2016  | TextBox         |
	  #And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 1         | CRF Lab Value For D1 | 0                 | TextBox         | 0.1              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 2         | CRF Lab Value For D1 | -1.2                 | TextBox         | -1.3              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 3         | CRF Lab Value For D1 | -1.3                 | TextBox         | -1.5              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 4         | CRF Lab Value For D1 | -12345678.98                 | TextBox         | 20              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 5         | CRF Lab Value For D1 | -12345676.98                 | TextBox         | 21              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 6         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 7         | CRF Lab Value For D1 |                  | TextBox         |               | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 8         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	
	  #| AddNewRow | RowNumber | QuestionPrompt       | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	  #| No        | 9         | CRF Lab Value For D1 | 11                 | TextBox         | 9              | SOR             |                 | OK               |
	  #And I click table row button "Save & Close Row" of table "AutoBuildQuestionsForD1:"	  
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 36_Navigate to Patient and verify the values of Auto build table
      When I expand "Visit (week2)" to select and open "FormD1" CRF.      
      Then I verify below "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 1         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 1         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 1         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 1         | LOINC Code For D1                               |               | TextBox         |                  |
	| 1         | Category For D1                                 |               | TextBox         |                  |
	| 1         | SAS Label For D1                                |               | TextBox         |                  |
	| 1         | Specimen For D1                                 |               | TextBox         |                  |
	| 1         | Method For D1                                   |               | TextBox         |                  |
	| 1         | Result Type For D1                              |               | TextBox         |                  |
	| 1         | Normal Reference Range Low For D1               | >10.21        | Text            |                  |
	| 1         | Normal Reference Range High For D1              | <15.11        | Text            |                  |
	| 1         | Subcategory For D1                              |               | TextBox         |                  |
	| 1         | Critical Reference Range High For D1            | <20.41        | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | >25.71        | Text            |                  |
	| 1         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 1         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 1         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 1         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 1         | Precision For D1                                |               | TextBox         |                  |
	| 1         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 1         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN2 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 2         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 2         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 2         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 2         | LOINC Code For D1                               |               | TextBox         |                  |
	| 2         | Category For D1                                 |               | TextBox         |                  |
	| 2         | SAS Label For D1                                |               | TextBox         |                  |
	| 2         | Specimen For D1                                 |               | TextBox         |                  |
	| 2         | Method For D1                                   |               | TextBox         |                  |
	| 2         | Result Type For D1                              |               | TextBox         |                  |
	| 2         | Normal Reference Range Low For D1               | >10.01        | Text            |                  |
	| 2         | Normal Reference Range High For D1              | <15.02        | Text            |                  |
	| 2         | Subcategory For D1                              |               | TextBox         |                  |
	| 2         | Critical Reference Range High For D1            | <25.04        | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | >20.03        | Text            |                  |
	| 2         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 2         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 2         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 2         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 2         | Precision For D1                                |               | TextBox         |                  |
	| 2         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 2         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN3 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 3         | CRF Lab Test Name For D1                        | HEMOGLOBIN3   | Text            |                  |
	| 3         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 3         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 3         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 3         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 3         | LOINC Code For D1                               |               | TextBox         |                  |
	| 3         | Category For D1                                 |               | TextBox         |                  |
	| 3         | SAS Label For D1                                |               | TextBox         |                  |
	| 3         | Specimen For D1                                 |               | TextBox         |                  |
	| 3         | Method For D1                                   |               | TextBox         |                  |
	| 3         | Result Type For D1                              |               | TextBox         |                  |
	| 3         | Normal Reference Range Low For D1               | >-43345678.23 | Text            |                  |
	| 3         | Normal Reference Range High For D1              | <-14345678.24 | Text            |                  |
	| 3         | Subcategory For D1                              |               | TextBox         |                  |
	| 3         | Critical Reference Range High For D1            | <-23345679.26 | Text            |                  |
	| 3         | Critical Reference Range Low For D1             | >-34345677.25 | Text            |                  |
	| 3         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 3         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 3         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 3         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 3         | Precision For D1                                |               | TextBox         |                  |
	| 3         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 3         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 3         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN4 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 4         | CRF Lab Test Name For D1                        | HEMOGLOBIN4   | Text            |                  |
	| 4         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 4         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 4         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 4         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 4         | LOINC Code For D1                               |               | TextBox         |                  |
	| 4         | Category For D1                                 |               | TextBox         |                  |
	| 4         | SAS Label For D1                                |               | TextBox         |                  |
	| 4         | Specimen For D1                                 |               | TextBox         |                  |
	| 4         | Method For D1                                   |               | TextBox         |                  |
	| 4         | Result Type For D1                              |               | TextBox         |                  |
	| 4         | Normal Reference Range Low For D1               | -22345678.15  | Text            |                  |
	| 4         | Normal Reference Range High For D1              | -12345678.16  | Text            |                  |
	| 4         | Subcategory For D1                              |               | TextBox         |                  |
	| 4         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 4         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 4         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 4         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 4         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 4         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 4         | Precision For D1                                |               | TextBox         |                  |
	| 4         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 4         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 4         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN5 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 5         | CRF Lab Test Name For D1                        | HEMOGLOBIN5   | Text            |                  |
	| 5         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 5         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 5         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 5         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 5         | LOINC Code For D1                               |               | TextBox         |                  |
	| 5         | Category For D1                                 |               | TextBox         |                  |
	| 5         | SAS Label For D1                                |               | TextBox         |                  |
	| 5         | Specimen For D1                                 |               | TextBox         |                  |
	| 5         | Method For D1                                   |               | TextBox         |                  |
	| 5         | Result Type For D1                              |               | TextBox         |                  |
	| 5         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 5         | Normal Reference Range High For D1              |               | Text            |                  |
	| 5         | Subcategory For D1                              |               | TextBox         |                  |
	| 5         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 5         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 5         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 5         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 5         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 5         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 5         | Precision For D1                                |               | TextBox         |                  |
	| 5         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 5         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 5         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN6 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 6         | CRF Lab Test Name For D1                        | HEMOGLOBIN6   | Text            |                  |
	| 6         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 6         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 6         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 6         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 6         | LOINC Code For D1                               |               | TextBox         |                  |
	| 6         | Category For D1                                 |               | TextBox         |                  |
	| 6         | SAS Label For D1                                |               | TextBox         |                  |
	| 6         | Specimen For D1                                 |               | TextBox         |                  |
	| 6         | Method For D1                                   |               | TextBox         |                  |
	| 6         | Result Type For D1                              |               | TextBox         |                  |
	| 6         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 6         | Normal Reference Range High For D1              |               | Text            |                  |
	| 6         | Subcategory For D1                              |               | TextBox         |                  |
	| 6         | Critical Reference Range High For D1            |               | Text            |                  |
	| 6         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 6         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 6         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 6         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 6         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 6         | Precision For D1                                |               | TextBox         |                  |
	| 6         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 6         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 6         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN7 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 7         | CRF Lab Test Name For D1                        | HEMOGLOBIN7   | Text            |                  |
	| 7         | CRF Lab Value For D1                            |               | Text            |                  |
	| 7         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 7         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 7         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 7         | LOINC Code For D1                               |               | TextBox         |                  |
	| 7         | Category For D1                                 |               | TextBox         |                  |
	| 7         | SAS Label For D1                                |               | TextBox         |                  |
	| 7         | Specimen For D1                                 |               | TextBox         |                  |
	| 7         | Method For D1                                   |               | TextBox         |                  |
	| 7         | Result Type For D1                              |               | TextBox         |                  |
	| 7         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 7         | Normal Reference Range High For D1              |               | Text            |                  |
	| 7         | Subcategory For D1                              |               | TextBox         |                  |
	| 7         | Critical Reference Range High For D1            |               | Text            |                  |
	| 7         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 7         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 7         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 7         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 7         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 7         | Precision For D1                                |               | TextBox         |                  |
	| 7         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 7         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 7         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               | 
	#HEMOGLOBIN8 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 8         | CRF Lab Test Name For D1                        | HEMOGLOBIN8   | Text            |                  |
	| 8         | CRF Lab Value For D1                            |               | Text            |                  |
	| 8         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 8         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 8         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 8         | LOINC Code For D1                               |               | TextBox         |                  |
	| 8         | Category For D1                                 |               | TextBox         |                  |
	| 8         | SAS Label For D1                                |               | TextBox         |                  |
	| 8         | Specimen For D1                                 |               | TextBox         |                  |
	| 8         | Method For D1                                   |               | TextBox         |                  |
	| 8         | Result Type For D1                              |               | TextBox         |                  |
	| 8         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 8         | Normal Reference Range High For D1              |               | Text            |                  |
	| 8         | Subcategory For D1                              |               | TextBox         |                  |
	| 8         | Critical Reference Range High For D1            |               | Text            |                  |
	| 8         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 8         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 8         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 8         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 8         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 8         | Precision For D1                                |               | TextBox         |                  |
	| 8         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 8         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 8         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | OK               |
	#HEMOGLOBIN9 test data 
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 9         | CRF Lab Test Name For D1                        | HEMOGLOBIN9   | Text            |                  |
	| 9         | CRF Lab Value For D1                            |               | Text            |                  |
	| 9         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 9         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 9         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 9         | LOINC Code For D1                               |               | TextBox         |                  |
	| 9         | Category For D1                                 |               | TextBox         |                  |
	| 9         | SAS Label For D1                                |               | TextBox         |                  |
	| 9         | Specimen For D1                                 |               | TextBox         |                  |
	| 9         | Method For D1                                   |               | TextBox         |                  |
	| 9         | Result Type For D1                              |               | TextBox         |                  |
	| 9         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 9         | Normal Reference Range High For D1              |               | Text            |                  |
	| 9         | Subcategory For D1                              |               | TextBox         |                  |
	| 9         | Critical Reference Range High For D1            |               | Text            |                  |
	| 9         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 9         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 9         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 9         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 9         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 9         | Precision For D1                                |               | TextBox         |                  |
	| 9         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 9         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 9         | CRF Lab (Original) Unit for D1                  | g/L           | Text            | OK               | 

#Verify the auto population of reference range records after form checkout
Scenario: 37_Navigate to Patient and verify the values of Auto build table
      When I expand "Visit (week2)" to select and open "FormD1" CRF.      
      And I verify below "AutoBuildQuestionsForD1:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name For D1                        | HEMOGLOBIN1   | Text            |                  |
	| 1         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 1         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 1         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 1         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 1         | LOINC Code For D1                               |               | TextBox         |                  |
	| 1         | Category For D1                                 |               | TextBox         |                  |
	| 1         | SAS Label For D1                                |               | TextBox         |                  |
	| 1         | Specimen For D1                                 |               | TextBox         |                  |
	| 1         | Method For D1                                   |               | TextBox         |                  |
	| 1         | Result Type For D1                              |               | TextBox         |                  |
	| 1         | Normal Reference Range Low For D1               | >10.21        | Text            |                  |
	| 1         | Normal Reference Range High For D1              | <15.11        | Text            |                  |
	| 1         | Subcategory For D1                              |               | TextBox         |                  |
	| 1         | Critical Reference Range High For D1            | <20.41        | Text            |                  |
	| 1         | Critical Reference Range Low For D1             | >25.71        | Text            |                  |
	| 1         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 1         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 1         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 1         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 1         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 1         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 1         | Precision For D1                                |               | TextBox         |                  |
	| 1         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 1         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 1         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN2 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | CRF Lab Test Name For D1                        | HEMOGLOBIN2   | Text            |                  |
	| 2         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 2         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 2         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 2         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 2         | LOINC Code For D1                               |               | TextBox         |                  |
	| 2         | Category For D1                                 |               | TextBox         |                  |
	| 2         | SAS Label For D1                                |               | TextBox         |                  |
	| 2         | Specimen For D1                                 |               | TextBox         |                  |
	| 2         | Method For D1                                   |               | TextBox         |                  |
	| 2         | Result Type For D1                              |               | TextBox         |                  |
	| 2         | Normal Reference Range Low For D1               | >10.01        | Text            |                  |
	| 2         | Normal Reference Range High For D1              | <15.02        | Text            |                  |
	| 2         | Subcategory For D1                              |               | TextBox         |                  |
	| 2         | Critical Reference Range High For D1            | <25.04        | Text            |                  |
	| 2         | Critical Reference Range Low For D1             | >20.03        | Text            |                  |
	| 2         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 2         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 2         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 2         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 2         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 2         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 2         | Precision For D1                                |               | TextBox         |                  |
	| 2         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 2         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 2         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN3 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 3         | CRF Lab Test Name For D1                        | HEMOGLOBIN3   | Text            |                  |
	| 3         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 3         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 3         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 3         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 3         | LOINC Code For D1                               |               | TextBox         |                  |
	| 3         | Category For D1                                 |               | TextBox         |                  |
	| 3         | SAS Label For D1                                |               | TextBox         |                  |
	| 3         | Specimen For D1                                 |               | TextBox         |                  |
	| 3         | Method For D1                                   |               | TextBox         |                  |
	| 3         | Result Type For D1                              |               | TextBox         |                  |
	| 3         | Normal Reference Range Low For D1               | >-43345678.23 | Text            |                  |
	| 3         | Normal Reference Range High For D1              | <-14345678.24 | Text            |                  |
	| 3         | Subcategory For D1                              |               | TextBox         |                  |
	| 3         | Critical Reference Range High For D1            | <-23345679.26 | Text            |                  |
	| 3         | Critical Reference Range Low For D1             | >-34345677.25 | Text            |                  |
	| 3         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 3         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 3         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 3         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 3         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 3         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 3         | Precision For D1                                |               | TextBox         |                  |
	| 3         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 3         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 3         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN4 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 4         | CRF Lab Test Name For D1                        | HEMOGLOBIN4   | Text            |                  |
	| 4         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 4         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 4         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 4         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 4         | LOINC Code For D1                               |               | TextBox         |                  |
	| 4         | Category For D1                                 |               | TextBox         |                  |
	| 4         | SAS Label For D1                                |               | TextBox         |                  |
	| 4         | Specimen For D1                                 |               | TextBox         |                  |
	| 4         | Method For D1                                   |               | TextBox         |                  |
	| 4         | Result Type For D1                              |               | TextBox         |                  |
	| 4         | Normal Reference Range Low For D1               | -22345678.15  | Text            |                  |
	| 4         | Normal Reference Range High For D1              | -12345678.16  | Text            |                  |
	| 4         | Subcategory For D1                              |               | TextBox         |                  |
	| 4         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 4         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 4         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 4         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 4         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 4         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 4         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 4         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 4         | Precision For D1                                |               | TextBox         |                  |
	| 4         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 4         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 4         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN5 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 5         | CRF Lab Test Name For D1                        | HEMOGLOBIN5   | Text            |                  |
	| 5         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 5         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 5         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 5         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 5         | LOINC Code For D1                               |               | TextBox         |                  |
	| 5         | Category For D1                                 |               | TextBox         |                  |
	| 5         | SAS Label For D1                                |               | TextBox         |                  |
	| 5         | Specimen For D1                                 |               | TextBox         |                  |
	| 5         | Method For D1                                   |               | TextBox         |                  |
	| 5         | Result Type For D1                              |               | TextBox         |                  |
	| 5         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 5         | Normal Reference Range High For D1              |               | Text            |                  |
	| 5         | Subcategory For D1                              |               | TextBox         |                  |
	| 5         | Critical Reference Range High For D1            | -22345679.18  | Text            |                  |
	| 5         | Critical Reference Range Low For D1             | -32345677.17  | Text            |                  |
	| 5         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 5         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 5         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 5         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 5         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 5         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 5         | Precision For D1                                |               | TextBox         |                  |
	| 5         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 5         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 5         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN6 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 6         | CRF Lab Test Name For D1                        | HEMOGLOBIN6   | Text            |                  |
	| 6         | CRF Lab Value For D1                            | 11            | Text            |                  |
	| 6         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 6         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 6         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 6         | LOINC Code For D1                               |               | TextBox         |                  |
	| 6         | Category For D1                                 |               | TextBox         |                  |
	| 6         | SAS Label For D1                                |               | TextBox         |                  |
	| 6         | Specimen For D1                                 |               | TextBox         |                  |
	| 6         | Method For D1                                   |               | TextBox         |                  |
	| 6         | Result Type For D1                              |               | TextBox         |                  |
	| 6         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 6         | Normal Reference Range High For D1              |               | Text            |                  |
	| 6         | Subcategory For D1                              |               | TextBox         |                  |
	| 6         | Critical Reference Range High For D1            |               | Text            |                  |
	| 6         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 6         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 6         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 6         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 6         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 6         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 6         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 6         | Precision For D1                                |               | TextBox         |                  |
	| 6         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 6         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 6         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN7 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 7         | CRF Lab Test Name For D1                        | HEMOGLOBIN7   | Text            |                  |
	| 7         | CRF Lab Value For D1                            |               | Text            |                  |
	| 7         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 7         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 7         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 7         | LOINC Code For D1                               |               | TextBox         |                  |
	| 7         | Category For D1                                 |               | TextBox         |                  |
	| 7         | SAS Label For D1                                |               | TextBox         |                  |
	| 7         | Specimen For D1                                 |               | TextBox         |                  |
	| 7         | Method For D1                                   |               | TextBox         |                  |
	| 7         | Result Type For D1                              |               | TextBox         |                  |
	| 7         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 7         | Normal Reference Range High For D1              |               | Text            |                  |
	| 7         | Subcategory For D1                              |               | TextBox         |                  |
	| 7         | Critical Reference Range High For D1            |               | Text            |                  |
	| 7         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 7         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 7         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 7         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 7         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 7         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 7         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 7         | Precision For D1                                |               | TextBox         |                  |
	| 7         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 7         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 7         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN8 test data
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 8         | CRF Lab Test Name For D1                        | HEMOGLOBIN8   | Text            |                  |
	| 8         | CRF Lab Value For D1                            |               | Text            |                  |
	| 8         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 8         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 8         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 8         | LOINC Code For D1                               |               | TextBox         |                  |
	| 8         | Category For D1                                 |               | TextBox         |                  |
	| 8         | SAS Label For D1                                |               | TextBox         |                  |
	| 8         | Specimen For D1                                 |               | TextBox         |                  |
	| 8         | Method For D1                                   |               | TextBox         |                  |
	| 8         | Result Type For D1                              |               | TextBox         |                  |
	| 8         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 8         | Normal Reference Range High For D1              |               | Text            |                  |
	| 8         | Subcategory For D1                              |               | TextBox         |                  |
	| 8         | Critical Reference Range High For D1            |               | Text            |                  |
	| 8         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 8         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 8         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 8         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 8         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 8         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 8         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 8         | Precision For D1                                |               | TextBox         |                  |
	| 8         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 8         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 8         | CRF Lab (Original) Unit for D1                  | cmm           | Text            | Cancel Row       |
	#HEMOGLOBIN9 test data 
	| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 9         | CRF Lab Test Name For D1                        | HEMOGLOBIN9   | Text            |                  |
	| 9         | CRF Lab Value For D1                            |               | Text            |                  |
	| 9         | Lab Test Description For D1                     |               | TextBox         |                  |
	| 9         | Lab Test Code For D1                            |               | TextBox         |                  |
	| 9         | Lab Test Name For D1                            |               | TextBox         |                  |
	| 9         | LOINC Code For D1                               |               | TextBox         |                  |
	| 9         | Category For D1                                 |               | TextBox         |                  |
	| 9         | SAS Label For D1                                |               | TextBox         |                  |
	| 9         | Specimen For D1                                 |               | TextBox         |                  |
	| 9         | Method For D1                                   |               | TextBox         |                  |
	| 9         | Result Type For D1                              |               | TextBox         |                  |
	| 9         | Normal Reference Range Low For D1               |               | Text            |                  |
	| 9         | Normal Reference Range High For D1              |               | Text            |                  |
	| 9         | Subcategory For D1                              |               | TextBox         |                  |
	| 9         | Critical Reference Range High For D1            |               | Text            |                  |
	| 9         | Critical Reference Range Low For D1             |               | Text            |                  |
	| 9         | Reference Range ID For D1                       |               | TextBox         |                  |
	| 9         | Out of Normal Range Indicator For D1            |               | TextBox         |                  |
	| 9         | Normalized Patient Lab Value For D1             |               | TextBox         |                  |
	| 9         | Normalized Lab Unit For D1                      |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range Low For D1    |               | TextBox         |                  |
	| 9         | Normalized Normal Reference Range High For D1   |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range Low for D1  |               | TextBox         |                  |
	| 9         | Normalized Critical Reference Range High For D1 |               | TextBox         |                  |
	| 9         | Precision For D1                                |               | TextBox         |                  |
	| 9         | Reference Range Not Applicable For D1           |               | TextBox         |                  |
	| 9         | Conversion Factor for D1                        |               | TextBox         |                  |
	| 9         | CRF Lab (Original) Unit for D1                  | g/L           | Text            | Cancel Row       |            
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully. 
	  

