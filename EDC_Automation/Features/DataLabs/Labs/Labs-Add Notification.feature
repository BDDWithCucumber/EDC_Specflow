Feature: DL: Add notification message when a study update is published without labs or 
			 with labs enabled and vice-versa

#Userstory: US63135
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/305428696512
#Author:Sirisha Gorrumuchu
#Copyright © 2018 PAREXEL International

#1. Upload study with DL580 with Labs
#2. Upload study with DL580 without Labs
#3. UPload study with DL570- No message shall be displayed
#4. Upload Study with DL580 Without labs- No message shall be displayed
#5. Upload study with DL 580 with Labs


Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header



#Publishing Study with Target app 5.8.0 with Labs enabled.
Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base1.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 


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
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City2 | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
	| L03   | Lab03          | NOVARTIS | Research   | A1       | A2       | A3       | City3 | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |

Scenario: 08_Associate Lab L01 and L02 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
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

Scenario: 09_Associate Lab L01, L03 for 02-Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
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
	
Scenario: 10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 11_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/06/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 12_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: 13_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

#Publishing Study with Target app 5.8.0 without Labs enabled.
Scenario: 14_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_2-Targetapp5.8-without Labs.Zip" with Label "Major"
	Then I see popup with title "Confirm" and partial message ""Uploaded study version has Labs as No which is different from earlier study version"
	
	
Scenario: 15_Click on Cancel button in Popup window
	When I click cancel button in PopupWindow
	And I see upload study file page
	And I click browse button in upload study file page
	And I upload study "Test4500_2-Targetapp5.8-without Labs.Zip" with Label "Major"
	Then I see popup with title "Confirm" and partial message ""Uploaded study version has Labs as No which is different
	

Scenario: 16_Click on Continue button in Popup window
	When I click continue button in PopupWindow
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.                                                                                       |

#Publishing Study with Target app 5.7.0

Scenario: 17_Publishing Study with Target app 5.7.0
		When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
		And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
		And I click browse button in upload study file page
		And I click browse button in upload study file page
		And I upload study "Test4500_3-Targetapp5.7.0.Zip" with Label "Major"
		Then I should not see popup with title "Confirm" and partial message ""Uploaded study version has Labs as No which is different from earlier study version"

Scenario: 18_Publishing Study with Target app 5.7.0
		When  I open study which has "Uploaded" status
		And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
		And I open study which has "Staged" status
		And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
		And I clicked Continue button in PublishStudyFlagsPage
		And I select patient migration option "Migrate all patients" in PublishStudyPage
		And I click Publish button in PublishStudyPage
		And I navigate to "Inbox" tab from main menu.
		Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.                                                                                       |


#Publishing Study with Target app 5.8.0 without Labs

Scenario: 17_Publishing Study with Target app 5.8.0 without labs
		When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
		And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
		And I click browse button in upload study file page
		And I click browse button in upload study file page
		And I upload study "Test4500_4-Targetapp5.8.0 withoutlabs.Zip" with Label "Major"
		Then I should not see popup with title "Confirm" and partial message ""Uploaded study version has Labs as No which is different from earlier study version"

Scenario: 18_Publishing Study with Target app 5.8.0 without labs
		When  I open study which has "Uploaded" status
		And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
		And I open study which has "Staged" status
		And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
		And I clicked Continue button in PublishStudyFlagsPage
		And I select patient migration option "Migrate all patients" in PublishStudyPage
		And I click Publish button in PublishStudyPage
		And I navigate to "Inbox" tab from main menu.
		Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.                                                                                       |

#Publishing Study with Target app 5.8.0 with Labs

Scenario: 17_Publishing Study with Target app 5.8.0 with labs
		When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
		And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
		And I click browse button in upload study file page
		And I click browse button in upload study file page
		And I upload study "Test4500_4-Targetapp 5.8.0 with Labs.Zip" with Label "Major"
		Then I see popup with title "Confirm" and partial message ""Uploaded study version has Labs as No which is different
		And I select continue button in popup window
		When  I open study which has "Uploaded" status
		And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
		And I open study which has "Staged" status
		And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
		And I clicked Continue button in PublishStudyFlagsPage
		And I select patient migration option "Migrate all patients" in PublishStudyPage
		And I click Publish button in PublishStudyPage
		And I navigate to "Inbox" tab from main menu.
		Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete. complete. 1 out of 1 patients migrated successfully. To review see migration report.  |
         | Publishing of Study file (Major) - complete.                                                                                       |

#Publishing Study with Target app 5.7.0

Scenario: 1801_Publishing Study with Target app 5.7.0
		When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
		And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
		And I click browse button in upload study file page
		And I click browse button in upload study file page
		And I upload study "Test4500_5-Targetapp5.7.0.Zip" with Label "Major"
		Then I should see popup with title "Confirm" and partial message "Uploaded study version has Labs as Yes which is different from earlier study version"

Scenario: 19_Publishing Study with Target app 5.7.0
		When  I open study which has "Uploaded" status
		And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
		And I open study which has "Staged" status
		And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
		And I clicked Continue button in PublishStudyFlagsPage
		And I select patient migration option "Migrate all patients" in PublishStudyPage
		And I click Publish button in PublishStudyPage
		And I navigate to "Inbox" tab from main menu.
		Then I check subjects in inbox folder "Jobs"
         | Subject                                                                                                                            |
         | Migration of Site 01 for Study file (Major) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
         | Publishing of Study file (Major) - complete.                                                                                       |

Scenario: 20_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
