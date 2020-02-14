Feature: US57733_DL: PopulateLabInformationbasedonLabMappingsLabIDselectionaftereCRFsave

Acceptance Criteria:
	1.I can view Lab Name, Company, Lab Address and Country are populated on Lab eCRF based on the Lab ID selected.
	2.I can view Lab Name, Company, Lab Address and Country are changed based on respective change to Lab ID.
	3.I can view item history created for Lab Information fields.
	4.Lab Information fields shall NOT be populated on eCRF if they are not mapped on Lab Mappings.They shall be editable questions.

Scenario: 1_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "QuestionAllMapped_D1.zip" with study label "Questions"
    Then I see study label "Questions" in header 

Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |

Scenario: 05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"
	
Scenario: 06_Assign testadmin testadmin user to 02-Site
	When I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: 07_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
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

Scenario: 08_Associate Lab L01,L02 and L03 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L02   | Lab02          | PFIZER  | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L03   | Lab03          | Novartis | Research   | Active           |

Scenario: 09_Associate Lab L01, L03, L04 and L05 for 02-Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L04" and lab name "Lab04" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L05" and lab name "Lab05" to associated labs in AssociateLabs page
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
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L05   | Lab05          | CIPLA    | Production | Active           |

Scenario: 10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/13/2018 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 11_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 12_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".


###### With Initial Entry.
Scenario: 13_Expand the Visit (week2) event and open the FormD1 form and insert the LAB ID.
	  And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID Q1 For D1              | LAB01(L01)  | ListBox         |
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 14_Verify the lab data on selecting LABID without checkout the form.
	 When I expand "Visit (week2)" to select and open "FormD1" CRF.
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1      | LAB01 (L01) | Text            |
	| Lab Name Q1 For D1    | LAB01       | Text            |
	| Company Q1 For D1     | PFIZER      | Text            |
	| Lab Address Q1 For D1 | A1 A2 A3    | Text            |
	| Country Q1 For D1     | INDIA       | Text            |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 15_Verify the lab data on selecting LABID with checkout the form.
	 When I expand "Visit (week2)" to select and open "FormD1" CRF.
	 When I click "Checkout" button on "FormD1" CRF.    
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1      | LAB01 (L01) | Link            |
	| Lab Name Q1 For D1    | LAB01       | Text            |
	| Company Q1 For D1     | PFIZER      | Text            |
	| Lab Address Q1 For D1 | A1 A2 A3    | Text            |
	| Country Q1 For D1     | INDIA       | Text            |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 16_Verify the item change history for Lab ID item in FormD1 CRF.
	Given I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF.
	And I click icon "changeHistory.gif" for the flat question "Lab Name Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | LAB01    | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Company Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | PFIZER   | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Lab Address Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | A1 A2 A3 | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Country Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | INDIA    | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "FormD1" CRF.

##### With updated LabID to L01 to L03
Scenario: 17_Expand the Visit (week2) event and open the FormD1 form and update the LAB ID data.
	  And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
	  And I enter below flat questions data in the CRF.
	  | QuestionPrompt   | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	  | Lab ID Q1 For D1 | LAB01 (L01)        | ListBox         | LAB03 (L03)    | DCF             | Updated LabId   |
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 18_Verify the lab data on selecting LABID without checkout the form.
	 When I expand "Visit (week2)" to select and open "FormD1" CRF.
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1      | LAB03 (L03) | Text            |
	| Lab Name Q1 For D1    | Lab03       | Text            |
	| Company Q1 For D1     | NOVARTIS    | Text            |
	| Lab Address Q1 For D1 | A1 A2 A3    | Text            |
	| Country Q1 For D1     | INDIA       | Text            |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 19_Verify the lab data on selecting LABID with checkout the form.
	 When I expand "Visit (week2)" to select and open "FormD1" CRF.
	 When I click "Checkout" button on "FormD1" CRF.    
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1      | LAB03 (L03) | Link            |
	| Lab Name Q1 For D1    | LAB03       | Text            |
	| Company Q1 For D1     | NOVARTIS    | Text            |
	| Lab Address Q1 For D1 | A1 A2 A3    | Text            |
	| Country Q1 For D1     | INDIA       | Text            |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 20_Verify the item change history for Lab ID item in FormD1 CRF.
	Given I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF.
	And I click icon "changeHistory.gif" for the flat question "Lab ID Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                |
	|          | L03      | Reason: DCF\r\nNotes: Updated LabID        |
	|          | L01      | Reason:  Initial Entry\r\nNotes: Submitted |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Lab Name Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | LAB03    | Reason:  Derived From Lab ID |
	|          | LAB01    | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Company Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | NOVARTIS | Reason:  Derived From Lab ID |
	|          | PFIZER   | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Lab Address Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | A1 A2 A3 | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Country Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | INDIA    | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "FormD1" CRF.

##### With updated LabID to L03 to Blank
Scenario: 21_Expand the Visit (week2) event and open the FormD1 form and update the LAB ID data to blank.
	  And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
	  And I enter below flat questions data in the CRF.
	  | QuestionPrompt   | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	  | Lab ID Q1 For D1 | LAB01 (L01)        | ListBox         | LAB03 (L03)    | DCF             | Updated LabId   |
	  And I click on "Save & Close" button on "FormD1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 22_Verify the lab data on selecting LABID without checkout the form.
	 When I expand "Visit (week2)" to select and open "FormD1" CRF.
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1      | LAB03 (L03) | Text            |
	| Lab Name Q1 For D1    | Lab03       | Text            |
	| Company Q1 For D1     | NOVARTIS    | Text            |
	| Lab Address Q1 For D1 | A1 A2 A3    | Text            |
	| Country Q1 For D1     | INDIA       | Text            |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 23_Verify the lab data on selecting LABID with checkout the form.
	 When I expand "Visit (week2)" to select and open "FormD1" CRF.
	 When I click "Checkout" button on "FormD1" CRF.    
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1      | LAB03 (L03) | Link            |
	| Lab Name Q1 For D1    | LAB03       | Text            |
	| Company Q1 For D1     | NOVARTIS    | Text            |
	| Lab Address Q1 For D1 | A1 A2 A3    | Text            |
	| Country Q1 For D1     | INDIA       | Text            |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 24_Verify the item change history for Lab ID item in FormD1 CRF.
	Given I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF.
	And I click icon "changeHistory.gif" for the flat question "Lab ID Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                |
	|          | L03      | Reason: DCF\r\nNotes: Updated LabID        |
	|          | L01      | Reason:  Initial Entry\r\nNotes: Submitted |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Lab Name Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | LAB03    | Reason:  Derived From Lab ID |
	|          | LAB01    | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Company Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | NOVARTIS | Reason:  Derived From Lab ID |
	|          | PFIZER   | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Lab Address Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | A1 A2 A3 | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Country Q1 For D1" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                  |
	|          | INDIA    | Reason:  Derived From Lab ID |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "FormD1" CRF.

































































































































































































































































































































































































