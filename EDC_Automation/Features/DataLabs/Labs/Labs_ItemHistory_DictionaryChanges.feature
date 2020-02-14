Feature: Labs_ItemHistory

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
	| L02   | Lab02          | PFIZER2  | RD2        | A12      | A22      | A32      | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
	| L04   | Lab04          | NOVARTIS | Research   | A1       | A2       | A3       | City4 | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
	| L05   | Lab05          | CIPLA    | Production | A1       | A2       | A3       | City5 | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER2  | RD2        | A12      | A22      | A32      | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
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
	| L02   | Lab02          | PFIZER2 | RD2        | Active           |

Scenario: 09_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site1" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 10_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site1" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 11_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site1" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: 12_Navigate to Patient and enter the values in FormD1
      And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID Q1 For D1              | Lab01 (L01) | LISTBOX         |  
      | CRF Collection Date Q1 For D1 | 09/06/2016  | TextBox         |
	  And I click on "Save" button on "FormD1" CRF.

Scenario: 13_Select Change History icon for LabName
	When I click icon "changeHistory.gif" for the flat question "Lab Name Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                 |
	| System (System\System) | Lab01    | Reason: Derived from Lab ID |
	And I click close button in LabInformationModalDialog

Scenario: 14_Select Change History icon for CompanyName
	When I click icon "changeHistory.gif" for the flat question "Company Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                 |
	| System (System\System) | PFIZER   | Reason: Derived from Lab ID |
	And I click close button in LabInformationModalDialog

Scenario: 15_Select Change History icon for LabAddress
	When I click icon "changeHistory.gif" for the flat question "Lab Address Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                 |
	| System (System\System) | A1 A2 A3 | Reason: Derived from Lab ID |
	And I click close button in LabInformationModalDialog

Scenario: 16_Select Change History icon for LabAddress
	When I click icon "changeHistory.gif" for the flat question "Country Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                 |
	| System (System\System) | INDIA    | Reason: Derived from Lab ID |	
	And I click close button in LabInformationModalDialog

Scenario: 17_Update Lab ID in Lab Testing CRF and save.
	When I click "Checkout" button on "FormD1" CRF.	
	And I enter below flat questions data in the CRF.	
	| QuestionPrompt                | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes           |
	| Lab ID Q1 For D1              | (L01)              | ListBOX         | Lab02 (L02)    | SOR             | To verify History Changes |
	| CRF Collection Date Q1 For D1 | 09/06/2016         | TEXTBOX         | 09/15/2016     | SOR             | To verify History Changes |
	And I click on "Save" button on "FormD1" CRF.

Scenario: 18_Select Change History icon for LabID
	When I click icon "changeHistory.gif" for the flat question "Lab ID" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime                               | Response | ReasonNotes                                     |
	| testadmin testadmin (EDCDEV\testadmin) | L02      | Reason: SOR\r\nNotes: To verify History Changes |
	| testadmin testadmin (EDCDEV\testadmin) | L01      | Reason: Initial Entry\r\nNotes: Submitted |
	And I click close button in LabInformationModalDialog	

Scenario: 19_Select Change History icon for LabName
	When I click icon "changeHistory.gif" for the flat question "Lab Name" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                 |
	| System (System\System) | Lab02    | Reason: Derived from Lab ID |
	| System (System\System) | Lab01    | Reason: Derived from Lab ID |
	And I click close button in LabInformationModalDialog	

Scenario: 20_Select Change History icon for CompanyName
	When I click icon "changeHistory.gif" for the flat question "Company Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                 |
	| System (System\System) | PFIZER2  | Reason: Derived from Lab ID |
	| System (System\System) | PFIZER   | Reason: Derived from Lab ID |
	And I click close button in LabInformationModalDialog

Scenario: 21_Select Change History icon for LabAddress
	When I click icon "changeHistory.gif" for the flat question "Lab Address Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response    | ReasonNotes                 |
	| System (System\System) | A12 A22 A32 | Reason: Derived from Lab ID |
	| System (System\System) | A1 A2 A3    | Reason: Derived from Lab ID |
	And I click close button in LabInformationModalDialog	

Scenario: 22_Select Change History icon for LabAddress
	When I click icon "changeHistory.gif" for the flat question "Country Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                 |
	| System (System\System) | INDIA    | Reason: Derived from Lab ID |
	| System (System\System) | INDIA    | Reason: Derived from Lab ID |
	And I click close button in LabInformationModalDialog

Scenario: 23_Select Change History icon for CRFCollectionDate
	When I click icon "changeHistory.gif" for the flat question "CRF Collection Date Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime                               | Response   | ReasonNotes                                     |
	| testadmin testadmin (EDCDEV\testadmin) | 09/15/2016 | Reason: SOR\r\nNotes: To verify History Changes |
	| testadmin testadmin (EDCDEV\testadmin) | 09/06/2016 | Reason: Initial Entry\r\nNotes: Submitted       |
	And I click close button in LabInformationModalDialog