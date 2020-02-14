Feature: Labs_ViewSaveUpdateAndEditChecksOnCRF

	This feature file covers scenarios to test Lab ID implementation in eCRF.
	Scenarios # 1- 9 are pre-requisites to test Lab ID test cases.
	Scenarios # 10 -20 covers Lab ID display, save and update in eCRF.
	Scenarios # 21 - 44 covers item history and edit checks for Lab ID in eCRF.

	User Stories:
	US36592: DL: Populate Labs on CRF based on Site
	US41661: DL: Reflect LAB ID changes from lab management on eCRF change history
	US42629: DL: Dissociate LAB ID from site & changes on form view and item change history


Scenario: 01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_GM_LABID.zip" with study label "Test4500"
	Then I see study label "Test4500_GM" in header

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

Scenario: 10_Navigate to Patients tab and select a Site1 and add patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

Scenario: 11_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

	#US36592-1.I can view the list of Lab IDs associated to the site for the Lab ID form question per the Lab ID mapping in the study design.
Scenario: 12_Select Lab testing CRF and verify LAB ID without checking out the form.
	Given I expand "Visit (Screening)" to select and open "Lab Testing" CRF.
	Then I Verify below "ListBox" items are displayed in "Lab ID:" on the CRF.
	| ItemToVerify |
	| L01          |
	| L02          |
	And I verify below "ListBox" items are not displayed in "Lab ID:" on the CRF.
	| ItemToVerify |
	| L03          |
	| L04          |
	| L05          |

	#US36592-2.I can select Lab ID and save form successfully.
Scenario: 13_Save Lab Testing CRF with Lab ID and save.
	When I click "Checkout" button on "Lab Testing" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Date sample taken: | 12/06/2017  | TextBox         |
	| Lab ID:            | L01         | ListBox         |
	| Test Result:       | 10          | TextBox         |
	| Unit:              | ml          | TextBox         |
	| Range Min:         | 5           | TextBox         |
	| Range Max:         | 15          | TextBox         |
	| Range Unit:        | ml          | TextBox         |
	And I click on "Save & Close" button on "Lab Testing" CRF.
	Then The CRF with data is saved and checked-in successfully.

	#US36592-3.I can edit Lab ID and save changes successfully.
Scenario: 14_Update Lab ID in Lab Testing CRF and save.
	Given I expand "Visit (Screening)" to select and open "Lab Testing" CRF.
	When I click "Checkout" button on "Lab Testing" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Lab ID:        | L01                | ListBox         | L02            | SOR             | Test            |
	And I click on "Save & Close" button on "Lab Testing" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 15_Navigate to Patients tab and select a Site2 and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site2" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 02       | PAT             | 12/06/2017 |
	| 03       | PAT             | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 02-PAT    |
	| 03-PAT    |

Scenario: 16_Select Site2 and patient 02-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site2" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

	#US36592-1.I can view the list of Lab IDs associated to the site for the Lab ID form question per the Lab ID mapping in the study design.
Scenario: 17_Select Lab testing CRF and verify LAB ID without checking out the form.
	Given I expand "Visit (Screening)" to select and open "Lab Testing" CRF.
	Then I Verify below "ListBox" items are displayed in "Lab ID:" on the CRF.
	| ItemToVerify |
	| L01          |
	| L03          |
	| L04          |
	And I verify below "ListBox" items are not displayed in "Lab ID:" on the CRF.
	| ItemToVerify |
	| L02          |
	| L05          |


Scenario: 18_Unassociate Site1 for L01 Lab
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L01" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I remove and save site id "01" and site name "Site1" from assocaited sites in LabManagementSitesPage
	Then I see Lab(s) associated successfully message.
	#Then I see site data in sites tab of Lab in LabPage
	#| SiteId | SiteName | City      | State | Country | SiteStatus |
	#| 02     | Site2    | Hyderabad | AP    | INDIA   | Active     |


#Scenario: 18_Unassociate L01 Lab and associate L03 lab for Site1.
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "01" and site name "Site1" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I remove and save lab id "L01" and lab name "Lab01" from associated labs in AssociateLabs page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
#	| L02   | Lab02          | PFIZER   | RD         | Active           |
#	And I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
#	| L03   | Lab03          | NOVARTIS | Research   | Active           |

Scenario: 19_Select Site1 and patient 01-PAT
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

	#US36592-1.I can view the list of Lab IDs associated to the site for the Lab ID form question per the Lab ID mapping in the study design.
Scenario: 20_Select Lab testing CRF and verify LAB ID by checking out the form.
	Given I expand "Visit (Screening)" to select and open "Lab Testing" CRF.
	When I click "Checkout" button on "Lab Testing" CRF.
	And I click on "L02" answer value link for flat question "Lab ID:".
	Then I Verify below "ListBox" items are displayed in "Lab ID:" on the CRF.
	| ItemToVerify |
	| L02          |
	And I verify below "ListBox" items are not displayed in "Lab ID:" on the CRF.
	| ItemToVerify |
	| L01          |
	| L03          |
	| L04          |
	| L05          |
	And I click on "Cancel" button on "Lab Testing" CRF.

Scenario: 21_Set the CRF change history to complete from user preferences.
	When I select DataManagerPortal item "User Preferences" from drop down
	And I select Complete Change History radio button on User Preferences page.
	And I click Save button on User Preferences page.
	Then I see Save Success message on User Preferences page.

Scenario: 22_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

	#US36592-4.I can view audit history for the Lab ID changes on eCRF.
Scenario: 23_Verify the item change history for Lab ID item in Lab Testing CRF.
	Given I expand "Visit (Screening)" to select and open "Lab Testing" CRF.
	When I click "Checkout" button on "Lab Testing" CRF.
	And I click icon "changeHistory.gif" for the flat question "Lab ID:" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | L01      | Reason: Initial Entry\r\nNotes: Submitted |
	|          | L02      | Reason: SOR                               |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "Lab Testing" CRF.

Scenario: 24_Unassociate Site1 for L02 Lab
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L02" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I remove and save site id "01" and site name "Site1" from assocaited sites in LabManagementSitesPage
	Then I see Lab(s) associated successfully message.

#Scenario: 24_Unassociate L02 Lab for Site1.
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "01" and site name "Site1" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I remove and save lab id "L02" and lab name "Lab02" from associated labs in AssociateLabs page
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
#	| L03   | Lab03          | NOVARTIS | Research   | Active           |

Scenario: 25_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

	#US42629-2
Scenario: 26_Verify the Lab ID value after removing all labs from site.
	Given I expand "Visit (Screening)" to select and open "Lab Testing" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Lab ID:        | [Blank]     | Text            |

	#US36592-4.I can view audit history for the Lab ID changes on eCRF, US42629-2, US42629-3, US41661-1
Scenario: 27_Verify the item change history for Lab ID item in Lab Testing CRF after the saved lab is dissociated.
	When I click "Checkout" button on "Lab Testing" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Lab ID:        | [Blank]     | Link            |
	When I click icon "changeHistory.gif" for the flat question "Lab ID:" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                      |
	|          | L01      | Reason: Initial Entry\r\nNotes: Submitted        |
	|          | L02      | Reason: SOR                                      |
	|          | [Blank]  | Reason: Lab Management\r\nNotes: Lab ID modified |
	#| System (System\System) | [Blank]  | Reason: Lab Management\r\nNotes: Lab ID modified |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "Lab Testing" CRF.

Scenario: 28_Select Site2 and patient 02-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site2" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

	#US36592-2.I can select Lab ID and save form successfully.
Scenario: 29_Save Lab CRF with edit check CRF with Lab ID and save.
	Given I expand "Visit (Screening)" to select and open "Lab CRF with edit check" CRF.
	When I click "Checkout" button on "Lab CRF with edit check" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Date sample taken: | 12/06/2017  | TextBox         |
	| Lab ID:            | L01         | ListBox         |
	| Test Result:       | 10          | TextBox         |
	| Unit:              | ml          | TextBox         |
	| Range Min:         | 5           | TextBox         |
	| Range Max:         | 15          | TextBox         |
	| Range Unit:        | ml          | TextBox         |
	And I click on "Save & Close" button on "Lab CRF with edit check" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 30_Mark not answer Lab ID question and verify DCF.
	Given I expand "Visit (Screening)" to select and open "Lab CRF with edit check" CRF.
	When I click "Checkout" button on "Lab CRF with edit check" CRF.
	And I click icon "icon_mna_disabled.png" for the flat question "Lab ID:" in CRF
	And I enter comments "Lab ID question is marked not answered" in MarkItemDialog
	And I click ok button in MarkItemDialog
	And I select entry complete checkbox.
	And I select "Save" button on "Lab CRF with edit check" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                 |
    | Lab ID cannot be marked "Not Answered". |
	And I click Continue button of Modal "Queries Result"
	Then The CRF is saved and checked-in successfully.

Scenario: 31_Verify the DCF details in the sub tab of CRF.
	When I open main tab "DCFs" of Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                        | DateTime |
    |       | Sent   | Lab ID cannot be marked "Not Answered". |          |

Scenario: 32_Unmark not answer Lab ID question and verify that DCF is closed.
	When I open main tab "CRF" of Form
	When I click "Checkout" button on "Lab CRF with edit check" CRF.
	And I click icon "icon_mna.png" for the flat question "Lab ID:" in CRF
	#And I enter comments "Lab ID question is unmarked not answered" in MarkItemDialog
	And I enter notes "Lab ID question is unmarked not answered" in ClearItemModalDialog
	#And I click ok button in MarkItemDialog
	And I click ok button in ClearItemModalDialog
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Lab ID:        | [Blank]            | ListBox         | L01            | DCF             | Test            |
	And I select entry complete checkbox.
	And I select "Save" button on "Lab CRF with edit check" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "Closed" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                        | DateTime |
    |       | Closed | Lab ID cannot be marked "Not Answered". |          |

Scenario: 33_Verify the item history of Lab ID question for MNA changes.
	When I open main tab "CRF" of Form
	And I click icon "changeHistory.gif" for the flat question "Lab ID:" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                                                                                         |
	|          | L01      | Reason: Initial Entry\r\nNotes: Submitted                                                                           |
	|          | [Blank]  | Reason: Marked Not Answered                                                                                         |
	|          | --       | Query Action: 1 Sent\r\nDescription: Lab ID cannot be marked "Not Answered".\r\nAction Request: Please provide.     |
	|          | L01      | Reason: SOR\r\nNotes: Test                                                                                          |
	|          | --       | Query Action: 1 Resolved\r\nDescription: Lab ID cannot be marked "Not Answered".\r\nAction Request: Please provide. |
	|          | --       | Query Action: 1 Closed\r\nDescription: Lab ID cannot be marked "Not Answered".\r\nAction Request: Please provide.   |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "Lab CRF with edit check" CRF.

Scenario: 34_Make Lab ID blank by marking and unmarking the questionas not answered and verify DCF.
	Given I expand "Visit (Screening)" to select and open "Lab CRF with edit check" CRF.
	When I click "Checkout" button on "Lab CRF with edit check" CRF.
	And I click icon "icon_mna_disabled.png" for the flat question "Lab ID:" in CRF
	And I enter comments "Lab ID question is marked not answered" in MarkItemDialog
	And I click ok button in MarkItemDialog
	And I click icon "icon_mna.png" for the flat question "Lab ID:" in CRF
	And I select entry complete checkbox.
	And I select "Save" button on "Lab CRF with edit check" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries            |
    | Lab ID is missing. |
	And I click Continue button of Modal "Queries Result"
	Then The CRF is saved and checked-in successfully.

Scenario: 35_Verify the DCF details in the sub tab of CRF.
	When I open main tab "DCFs" of Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription   | DateTime |
    |       | Sent   | Lab ID is missing. |          |

Scenario: 36_Resolve Lab ID missing DCF.
	When I open main tab "CRF" of Form
	And I click "Checkout" button on "Lab CRF with edit check" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Lab ID:        | [Blank]            | ListBox         | L01            | DCF             | Test            |
	And I select entry complete checkbox.
	And I select "Save" button on "Lab CRF with edit check" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "Closed" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription   | DateTime |
    |       | Closed | Lab ID is missing. |          |

Scenario: 37_Select Site2 and patient 03-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site2" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	Then I see Patient details page for "03-PAT".

Scenario: 38_Save Lab CRF with edit check CRF with Lab ID and save.
	Given I expand "Visit (Screening)" to select and open "Lab CRF with edit check" CRF.
	When I click "Checkout" button on "Lab CRF with edit check" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Date sample taken: | 12/06/2017  | TextBox         |
	| Lab ID:            | L03         | ListBox         |
	| Test Result:       | 10          | TextBox         |
	| Unit:              | ml          | TextBox         |
	| Range Min:         | 5           | TextBox         |
	| Range Max:         | 15          | TextBox         |
	| Range Unit:        | ml          | TextBox         |
	And I select entry complete checkbox.
	And I click on "Save & Close" button on "Lab CRF with edit check" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 39_Unassociate L03 Lab for Site2.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I remove and save lab id "L03" and lab name "Lab03" from associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER   | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L04   | Lab04          | NOVARTIS | Research   | Active           |

Scenario: 40_Select Site2 and patient 03-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site2" from Sites dropdown.
	When I select the patient "03-PAT" from patients table.
	Then I see Patient details page for "03-PAT".

Scenario: 41_Verify the Lab ID has become blank in th CRF.
	Given I expand "Visit (Screening)" to select and open "Lab CRF with edit check" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Lab ID:        | [Blank]     | Text            |

Scenario: 42_Verify the DCF trigggered for Lab ID.
	When I open main tab "DCFs" of Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription   | DateTime |
    |       | Sent   | Lab ID is missing. |          |

Scenario: 43_Update the Lab ID and verify that DCF is closed.
	When I open main tab "CRF" of Form
	And I click "Checkout" button on "Lab CRF with edit check" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Lab ID:        | [Blank]            | ListBox         | L04            | DCF             | Test            |
	And I select entry complete checkbox.
	And I click on "Save" button on "Lab CRF with edit check" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "Closed" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription   | DateTime |
    |       | Closed | Lab ID is missing. |          |

Scenario: 44_Verify the item history of Lab ID
	When I open main tab "CRF" of Form
	And I click icon "changeHistory.gif" for the flat question "Lab ID:" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                                                                                    |
	|                        | L03      | Reason: Initial Entry\r\nNotes: Submitted                                                      |
	|                        | [Blank]  | Reason: Lab Management\r\nNotes: Lab ID modified                                               |
	#| System (System\System) | [Blank]  | Reason: Lab Management\r\nNotes: Lab ID modified                                               |
	|                        | --       | Query Action: 3 Sent\r\nDescription: Lab ID is missing.\r\nAction Request: Please provide.     |
	|                        | L04      | Reason: SOR\r\nNotes: Test                                                                     |
	|                        | --       | Query Action: 3 Resolved\r\nDescription: Lab ID is missing.\r\nAction Request: Please provide. |
	|                        | --       | Query Action: 3 Closed\r\nDescription: Lab ID is missing.\r\nAction Request: Please provide.   |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "Lab CRF with edit check" CRF.

Scenario: 45_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page