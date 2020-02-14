Feature:VerifyRRfortransferredpatients
		As a Site User,
		I want system to manage LAB ID and RR changes when Patient is transferred to different Site,
		So that correct Lab ID and Reference Range is reflected post transfer.
#Feature No:F8161
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/199148897908
#Owner:Rama Chinthapalli
#Author:Vishnu Priya
#Copyright © 2018 PAREXEL International@ObjectiveEvidence

Scenario: 1_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@ObjectiveEvidence @ReqID:US64421.1
Scenario: 2_Associate Lab L01 and L02 for Site1
	When I select DataManagerPortal item "Study Administration" from drop down
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
	And I see lab data in labs tab of Site in SitePage@ObjectiveEvidence
#Scenario: 1_Login to Datalabs
#	Given I logged in to DataLabs
#	Then I see Datalabs Home Page

@ObjectiveEvidence @ReqID:US64421.1
#Scenario: 2_Associate Lab L01 and L02 for Site1
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "01" and site name "Site1" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
#	| L01   | Lab01          | PFIZER  | RD         | Active           |
#	And I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
#	| L02   | Lab02          | PFIZER  | RD         | Active           |

@ObjectiveEvidence @ReqID:US64421.1
Scenario: 3_Associate Lab L01 and L03 for Site2
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L03" and lab name "Lab03" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER   | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L03   | Lab03          | NOVARTIS | Research   | Active           |

@ObjectiveEvidence @ReqID:US64421.1
Scenario: 4_Navigate to Patients tab and select a Site1 and add patient 01-PAT
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | ScreenDate |
	| 1A       | 2/06/2018  |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 1A       |

#Lab1 associated to Site1 and Site2
#Transfer Patient from Site1 to Site2
@ObjectiveEvidence @ReqID:US64421.1,US56181.1
Scenario: 5_Transfer patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	And I select the patient "1A" from patients table.
	When I expand "Event1" to select and open "Form1" CRF.
	And I Verify below "ListBox" items are displayed in "LabId" on the CRF.
	| ItemToVerify |
	| Lab01 (L01)  |
	| Lab02 (L02)  |
	And I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| LabId          | Lab01 (L01) | ListBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click ActionPalette Item "Transfer Patient" in "PatientPortalActions" ActionPalette
	And I set transfer patient data in TransferPatientPage
	| ToSite   | Reason | AdditionalNotes |
	| 02-Site2 | Other  | Test            |
	And I click Transfer button in TransferPatientPage
	And I click continue in modal dialog having title "Transfer Patient Confirmation" and partial message "1A will be moved to site 02-Site2."
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                    |
	| Transfer Patient - complete. View Summary. |

@ObjectiveEvidence @ReqID:US64421.1
Scenario: 6_Verify transferred patient site
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site2" from Sites dropdown.
	And I select the patient "1A" from patients table.
	When I expand "Event1" to select and open "Form1" CRF.
	And I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| LabId          | Lab01 (L01) | Text            |
	And I select "Checkout" button on "Form1" CRF.
	And I click on "Lab01" answer value link for flat question "LabId".
	Then I Verify below "ListBox" items are displayed in "LabId" on the CRF.
	| ItemToVerify |
	| Lab01 (L01)  |
	| Lab03 (L03)  |
	And I click on "Cancel" button on "Form1" CRF.

@ObjectiveEvidence @ReqID:US64421.2
#Lab2 associated to Site1, not Site2
#Transfer Patient from Site1 to Site2
Scenario: 7_Navigate to Patients tab and select a Site1 and add patient 01-PAT
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | ScreenDate |
	| Pat2       | 12/06/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| Pat2        |

@ObjectiveEvidence @ReqID:US64421.2
Scenario: 8_Unassociate L01 Lab for Site2
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I remove and save lab id "L01" and lab name "Lab01" from associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L03   | Lab03          | NOVARTIS | Research   | Active           |

@ObjectiveEvidence @ReqID:US64421.2
Scenario: 9_Transfer patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site1" from Sites dropdown.
	And I select the patient "Pat2" from patients table.
	When I expand "Event1" to select and open "Form1" CRF.
	And I Verify below "ListBox" items are displayed in "LabId" on the CRF.
	| ItemToVerify |
	| Lab01 (L01)  |
	| Lab02 (L02)  |
	And I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| LabId          | Lab01 (L01) | ListBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click ActionPalette Item "Transfer Patient" in "PatientPortalActions" ActionPalette
	And I set transfer patient data in TransferPatientPage
	| ToSite   | Reason | AdditionalNotes |
	| 02-Site2 | Other  | Test            |
	And I click Transfer button in TransferPatientPage
	And I click continue in modal dialog having title "Transfer Patient Confirmation" and partial message "Pat2 will be moved to site 02-Site2."
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                    |
	| Transfer Patient - complete. View Summary. |

@ObjectiveEvidence @ReqID:US64421.2
Scenario: 10_Verify transferred patient site
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site2" from Sites dropdown.
	And I select the patient "Pat2" from patients table.
	When I expand "Event1" to select and open "Form1" CRF.
	And I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| LabId          | L01         | Text            |
	And I select "Checkout" button on "Form1" CRF.
	And I click on "L01" answer value link for flat question "LabId".
	Then I Verify below "ListBox" items are displayed in "LabId" on the CRF.
	| ItemToVerify |
	| Lab03 (L03)  |
	And I click on "Cancel" button on "Form1" CRF.

#Lab2 Re-associated to Site2
#Transfer Patient from Site1 to Site2
@ObjectiveEvidence @ReqID:US64421.3
Scenario: 11_Associate Lab L01 for Site2
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site2" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER   | RD         | Active           |
	And I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company  | Department | LaboratoryStatus |
	| L03   | Lab03          | NOVARTIS | Research   | Active           |

@ObjectiveEvidence @ReqID:US64421.3
Scenario: 12_Verify transferred patient site
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site2" from Sites dropdown.
	And I select the patient "Pat2" from patients table.
	When I expand "Event1" to select and open "Form1" CRF.
	And I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| LabId          | Lab01 (L01) | Text            |
	And I select "Checkout" button on "Form1" CRF.
	And I click on "Lab01" answer value link for flat question "LabId".
	Then I Verify below "ListBox" items are displayed in "LabId" on the CRF.
	| ItemToVerify |
	| Lab01 (L01)  |
	| Lab03 (L03)  |
	And I click on "Cancel" button on "Form1" CRF.

Scenario: 13_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L02   | Lab02          | PFIZER  | RD         | Active           |

