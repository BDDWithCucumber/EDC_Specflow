Feature: DL_Smoke
#$/SQA/XML Studies/5.7.0_VBNET_5.6x/Other Studies

#1
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	And I see Datalabs copyright text "2000-2018 All rights reserved."

#2, 3, 4
Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "TestStudy_Original.zip" with study label "L1"
	Then I see study label "Test3210" in header

#5 - Password reset is not automated

#7	
Scenario: 04_Delete group in Group Management
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click ActionPalette Item "Delete Group(s)" in "GroupListActions" ActionPalette
	And I remove group "Paper Data Entry" in DeleteGroupsPage
	Then I do not see group "Paper Data Entry" in GroupManagementPage

Scenario: 05_Add a group in Group Management
	When I click ActionPalette Item "Add Group(s)" in "GroupListActions" ActionPalette
	And I add GroupName "Paper Data Entry" with DefaultPortal "Data Manager Portal"
	Then I see group "Paper Data Entry" in GroupManagementPage

#8
Scenario: 06_Add a Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName |
	| 001    | Site     |
	Then I see site "001-Site" in SiteManagementPage

#9
Scenario: 07_Assign testadmin testadmin user to site and check for default value for New Patients
	When I open site with siteid "001" and site name "Site" from SiteManagement page
	And I edit site and Save in SiteDetailsPage
	| DCFWorkflow |
	| Electronic  |
	And I open site with siteid "001" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "Gali MalleswaraRao" to site users in SiteManageUsersPage
	And I click ActionPalette Item "Manage Versions" in "SiteActions" ActionPalette
	Then I see site manage version detials in ManageVersionsPage
	| Version | New Patients | Default | Patients | Published Date/Time | Status    |
	| 1.0     | Allow        | true    | 0        | 02/26/2018          | Published |

#10
Scenario: 09_Add a Site
	When I click breadcrumb "Site Management"
	And I enter sites details and Save
	| SiteId | SiteName |
	| 002    | Site     |
	Then I see site "002-Site" in SiteManagementPage

Scenario: 10_Assign testadmin testadmin user to site
	When I open site with siteid "002" and site name "Site" from SiteManagement page
	And I edit site and Save in SiteDetailsPage
	| DCFWorkflow |
	| Electronic  |
	And I open site with siteid "001" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "Gali MalleswaraRao" to site users in SiteManageUsersPage
	Then I see Site details page for "002-Site"

#Prerequisites
Scenario: 11_Check "Auto-Close Resolved DCFs"
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "DCFs" in StudyEditPreferencesPage
	And I check checkbox "Auto-close Resolved DCFs" in StudyEditPreferencesDCFsPage
	And I enter DCFDescriptionReplacement text "***Restricted***" in StudyEditPreferencesDCFsPage
	And I enter text "" in FieldLabelTextbox1 in StudyEditPreferencesDCFsPage
	And I click InactiveRadioButton1 in StudyEditPreferencesDCFsPage
	And I remove item "Item1" in EditPreferencesItemList1 in StudyEditPreferencesDCFsPage 
	And I remove item "Item2" in EditPreferencesItemList1 in StudyEditPreferencesDCFsPage 
	And I click SaveButton in StudyEditPreferencesDCFsPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Paper Entry" in StudyEditPreferencesPage
	And I uncheck checkbox AllowOneUserBothTheEntries in StudyEditPreferencesPaperEntryPage
	And I click save button in StudyEditPreferencesPaperEntryPage
	And I select DataManagerPortal item "User Preferences" from drop down
	And I select portal "Data Manager Portal" in UserPreferencesPage
	And I click save button in UserPreferencesPage
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I set permissions for loggedin user group in EditPermissionsPage
	| Category        | Permission                            | PermissionType |
	| CRF Permissions | View/Act upon Restricted Access Forms | Allow          |
	Then I see Datalabs Home Page

#11
Scenario: 12_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page

#12
Scenario: 13_Login into Datalabs
	Given I logged in to DataLabs as user "User1" with password "Password1"
	Then I see Datalabs Home Page

#13
Scenario: 14_Add patients to site 001-Site
	Given I navigate to "Patients" tab from main menu. 
	And I select the site "001-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID    | PatientInitials | ScreenDate |
	| UserA1_test | UserA1          | 12/06/2017 |
	| UserA2_test | UserA2          | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID          |
	| UserA1_test-UserA1 |
	| UserA2_test-UserA2 |

#14
Scenario: 15_Add patients to site 002-Site
	Given I navigate to "Patients" tab from main menu. 
	And I select the site "002-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| UserAA1  | UserAA1         | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID       |
	| UserAA1-UserAA1 |

#15
Scenario: 16_Invoke Advanced Search window
	When I select AdvancedSearch from main menu
	Then I see available sites in selected sites section in AdvancedSearchWindow
	| Site     |
	| 001-Site |
	| 002-Site |

#16
Scenario: 17_Seach patients who has Screened status in all sites
	When I select status "Screened" for status type "Patient Status" in AdvancedSearchWindow
	And I click search button in AdvancedSearchWindow
	Then I see patients in AdvancedSearchResultsPage
	| Patient ID         |
	| UserA1_test-UserA1 |
	| UserA2_test-UserA2 |
	| UserAA1-UserAA1    |

#17
Scenario: 18_Remove search and remove Gali Malleswararao user from site 001-Site
	Given I click Cancel Search button in AdvancedSearchResultsPage
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "001" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I remove and save user "Gali Malleswararao" from site users in SiteManageUsersPage
	Then I see Site details page for "001-Site"

#18, 19
Scenario: 19_Invoke Advanced Search window
	Given I navigate to "Patients" tab from main menu. 
	When I select AdvancedSearch from main menu
	#Then I see available sites in selected sites section in AdvancedSearchWindow
	#| Site     |
	#| 002-Site |

#20
Scenario: 20_Seach patients who has Screened status in all sites
	When I select status "Screened" for status type "Patient Status" in AdvancedSearchWindow
	And I click search button in AdvancedSearchWindow
	Then I see patients in AdvancedSearchResultsPage
	| Patient ID         |
	| UserAA1-UserAA1    |

#21
Scenario: 21_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page

#22
Scenario: 22_Login into Datalabs as testadmin
	Given I logged in to DataLabs In ExistingPage
	Then I see Datalabs Home Page

#23
Scenario: 23_Add patients to site 001-Site
	Given I navigate to "Patients" tab from main menu. 
	And I select the site "001-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| Test     | Patient         | 12/06/2017 |
	| 02       | pt              | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID    |
	| Test-Patient |
	| 02-pt        |

#24
Scenario: 24_Enroll "Test-Patient" patient.
	Given I select the patient "Test-Patient" from patients table.
	When I enroll the patient "Test-Patient" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| test     | 01/25/2018 | Yes           |
	Then I see patient "Test-Patient" status as "Enrolled" on Patient details page.

#25
Scenario: 25_Checkout Form1 under event Visit (Screening)
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	Then I see top orange bar with checked out message "CRF Checked Out -  testadmin testadmin" on CRF

#26
Scenario: 26_Add comments to Q1
	When I add commnet to a flat question
	| QuestionPrompt        | CommentsToAdd               |
	| Sample text question: | testing provisional comment |
	Then I see icon "Comment_Provisional.gif" against question "Sample text question:"
	And I open main tab "Comments" of Form
	And I do not see comments in comments tab

#27
Scenario: 27_Add comments to form
	When I click ActionPalette Item "Add Comment" in "CRFAction" ActionPalette
	And I enter form level comment "testing form comment" in CommentsDialog 
	And I click save button in FormCommentModalaDialog
	And I open main tab "Comments" of Form
	Then I see comments in comments tab
	| QuestionNumberOrForm | Question | Value   | Comment              | DateTime |
	| Form                 |          | [Blank] | testing form comment |          |

#28, 29
Scenario: 28_Save form1 with EntryComplete check
	When I open main tab "CRF" of Form
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	#Then I see patient casebook for patient "Test-Patient"

#30
Scenario: 29_Add comment to Q3
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I add commnet to a flat question
	| QuestionPrompt        | CommentsToAdd               |
	| Sample radio question: | testing item-level comment |
	Then I see icon "comment.gif" against question "Sample text question:"
	And I see icon "comment.gif" against question "Sample radio question:"
	And I open main tab "Comments" of Form
	Then I see comments in comments tab
	| QuestionNumberOrForm | Question               | Value   | Comment                     | DateTime |
	| 1                    | Sample text question:  | [Blank] | testing provisional comment |          |
	| 3                    | Sample radio question: | [Blank] | testing item-level comment  |          |

#31
Scenario: 30_Create DCF through actions and check in DCF tab for manual DCF
	When I click ActionPalette Item "Create DCF" in "CRFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription | ActionRequest  |
	| Draft     | manual query     | Please correct |
	And I click save button in CreateDCFDialog
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
	| DCFID | Status | QueryDescription | DateTime |
	|       | Draft  | manual query     |          |

#32
Scenario: 31_Enter value for Q1 and clear by clicking MarkNotAnswered
	When I open main tab "CRF" of Form
	And I enter below flat questions data in the CRF.
	| QuestionPrompt        | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample text question: | [Blank]            | TextBox         | text           | DCF             |                 |
	And I click icon "icon_mna_disabled.png" for the flat question "Sample text question:" in CRF
    And I enter comments "Commetns for MarkItemNotAnswered" in MarkItemDialog
	And I click ok button in MarkItemDialog
	Then I see icon "icon_mna.png" against question "Sample text question:"
	And I verify below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Sample text question: | [Blank]     | Text            |
	And I click "Cancel" button on "Form1" CRF.

#33
Scenario: 32_On or Off flags from actions and verify workflow tab
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I click link "Mark All" for the flag type "D-Review" in FlagPalette of CRF
	And I click link "Mark All" for the flag type "M-Review" in FlagPalette of CRF
	And I click link "Unmark All" for the flag type "M-Review" in FlagPalette of CRF
	And I click link "Mark All" for the flag type "SD-Verify" in FlagPalette of CRF
	Then I open main tab "Workflow" of Form
	And I see workflow items in CRF
	| Action           | DateTime |
	| SD-Verify [ On ] |          |
	| M-Review [ On ]  |          |
	| M-Review [ Off ] |          |
	| D-Review [ On ]  |          |

#34
Scenario: 33_Send DCF "Q5: Value does not meet the minimum precision of 2."
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	And I select the DCF row 
	| DCFID | Status | QueryDescription                                    | DateTime |
	|       | Draft  | Q5: Value does not meet the minimum precision of 2. |          |
	And I click ActionPalette Item "Send" in "DCFAction" ActionPalette
	And I open main tab "DCFs" of Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                    | DateTime |
    |       | Sent   | Q5: Value does not meet the minimum precision of 2. |          |

#35
Scenario: 34_Check DCF "Q5: Value does not meet the minimum precision of 2." for Viewed status
	When I select the DCF row 
	| DCFID | Status | QueryDescription                                    | DateTime |
	|       | Sent   | Q5: Value does not meet the minimum precision of 2. |          |
	Then I see header details in EditDCFPage
	| DCFStatus |
	| Viewed    |

#36
Scenario: 35_Answer the DCF "Q5: Value does not meet the minimum precision of 2." with some response
	When I click ActionPalette Item "Answer" in "DCFAction" ActionPalette
	And I enter response "DCF answered" in AnswerDCFDialog
	And I click SaveButton in AnswerDCFDialog
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status   | QueryDescription                                    | DateTime |
    |       | Answered | Q5: Value does not meet the minimum precision of 2. |          |

#37
Scenario: 36_Close the DCF "Q5: Value does not meet the minimum precision of 2."
	When I select the DCF row
	| DCFID | Status | QueryDescription                                    | DateTime |
	|       | Answered  | Q5: Value does not meet the minimum precision of 2. |          |
	And I click ActionPalette Item "Close" in "DCFAction" ActionPalette
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                    | DateTime |
    |       | Closed | Q5: Value does not meet the minimum precision of 2. |          |

#38
Scenario: 37_Create DCF through actions and check in DCF tab for manual DCF
	When I click ActionPalette Item "Create DCF" in "CRFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription | ActionRequest |
	| Draft     | Test1            | Test1         |
	And I click save button in CreateDCFDialog
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
	| DCFID | Status | QueryDescription | DateTime |
	|       | Draft  | Test1            |          |

#39
Scenario: 38_Send manual DCF "Test1"
	When I select the DCF row 
	| DCFID | Status | QueryDescription | DateTime |
	|       | Draft  | Test1            |          |
	And I click ActionPalette Item "Send" in "DCFAction" ActionPalette
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription | DateTime |
    |       | Sent   | Test1            |          |

#40
Scenario: 39_Answer the DCF "Test1" with some response
	When I select the DCF row
	| DCFID | Status | QueryDescription | DateTime |
	|       | Sent   | Test1            |          |	
	And I click ActionPalette Item "Answer" in "DCFAction" ActionPalette
	And I enter response "DCF answered" in AnswerDCFDialog
	And I click SaveButton in AnswerDCFDialog
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status   | QueryDescription | DateTime |
    |       | Answered | Test1            |          |

#41
Scenario: 40_Requery answered DCF "Test1"
	When I select the DCF row
	| DCFID | Status   | QueryDescription | DateTime |
	|       | Answered | Test1            |          |
	And I click ActionPalette Item "Re-query" in "DCFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription  | ActionRequest     |
	| Draft     | Re-query as DRAFT | Re-query as DRAFT |
	And I click save button in CreateDCFDialog
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
         | DCFID | Status              | QueryDescription  | DateTime |
         |       | Closed (Re-queried) | Test1             |          |
         |       | Draft (Re-query: 1) | Re-query as DRAFT |          |

#42
Scenario: 41_Send the DCF "Re-query as DRAFT"
	When I select the DCF row
	| DCFID | Status              | QueryDescription  | DateTime |
	|       | Draft (Re-query: 1) | Re-query as DRAFT |          |
	And I click ActionPalette Item "Send" in "DCFAction" ActionPalette
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
         | DCFID | Status             | QueryDescription  | DateTime |
         |       | Sent (Re-query: 1) | Re-query as DRAFT |          |

#43
Scenario: 42_Answer the DCF "Sent (Re-query: 1)"
	When I select the DCF row
	| DCFID | Status             | QueryDescription  | DateTime |
	|       | Sent (Re-query: 1) | Re-query as DRAFT |          |	
	And I click ActionPalette Item "Answer" in "DCFAction" ActionPalette
	And I enter response "DCF answered" in AnswerDCFDialog
	And I click SaveButton in AnswerDCFDialog
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status   | QueryDescription  | DateTime |
    |       | Answered | Re-query as DRAFT |          |

#44
Scenario: 43_Requery the DCF "Re-query as DRAFT"
	When I select the DCF row
	| DCFID | Status   | QueryDescription  | DateTime |
	|       | Answered | Re-query as DRAFT |          |
	And I click ActionPalette Item "Re-query" in "DCFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription | ActionRequest    |
	| Draft     | Re-query as SENT | Re-query as SENT |
	And I click save button in CreateDCFDialog
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
         | DCFID | Status              | QueryDescription | DateTime |
         |       | Draft (Re-query: 2) | Re-query as SENT |          |

#45
Scenario: 44_Checkout Form1 from Visit (Week2)
	Given I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I select the patient "test-Patient" from patients table.
	When I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	Then I see top orange bar with checked out message "CRF Checked Out -  testadmin testadmin" on CRF

#46
Scenario: 45_Enter data for Q4
	When I enter below flat questions data in the CRF.
	| QuestionPrompt           | AnswerValue | AnswerFieldType |
	| Sample integer question: | 8           | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                                 |
    | Q4: Value is not within the expected range (10 to 1000) |
	And I click Continue button of Modal "Queries Result"

#47
Scenario: 46_Check DCF "Q4: Value is not within the expected range (10 to 1000)" with sent status
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                        | DateTime |
    |       | Sent   | Q4: Value is not within the expected range (10 to 1000) |          |

#48, 49
#Popups are not shown for resolved queries
Scenario: 47_Answer Q4 with valid value "12"
	When I open main tab "CRF" of Form
	And I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample integer question: | 8                  | TextBox         | 12             | DCF             |                 |
	And I click "Save" button on "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                        | DateTime |
    |       | Closed | Q4: Value is not within the expected range (10 to 1000) |          |

#50
Scenario: 48_Change DCF Workflow to "Paper" for site "001-Site"
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "001" and site name "Site" from SiteManagement page
	And I edit site and Save in SiteDetailsPage
	| DCFWorkflow |
	| Paper       |	
	Then I see site "001-Site" in SiteManagementPage

#51
Scenario: 49_CheckedOut "From1" of "Visit (Week 2)" for "test-Patient" of "001-Site"
	Given I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I select the patient "test-Patient" from patients table.
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I select "Checkout" button on "Form1" CRF.
	Then I see top orange bar with checked out message "CRF Checked Out -  testadmin testadmin" on CRF

#52
Scenario: 50_Create manual DCF "Created as NEW"
	When I click ActionPalette Item "Create DCF" in "CRFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
    | DCFStatus | QueryDescription | ActionRequest |
    | New       | Created as NEW   | NEW           |
	And I click SaveButton in AnswerDCFDialog
	And I click "Save" button on "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription | DateTime |
    |       | New    | Created as NEW   |          |

#53
Scenario: 51_Send the manual DCF "Created as NEW"
	When I select the DCF row
    | DCFID | Status | QueryDescription | DateTime |
    |       | New    | Created as NEW   |          |
	And I click ActionPalette Item "Send" in "DCFAction" ActionPalette
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription | DateTime |
    |       | Sent   | Created as NEW   |          |

#54
Scenario: 52_Answer the manual DCF "Created as NEW"
	When I select the DCF row
    | DCFID | Status | QueryDescription | DateTime |
    |       | Sent   | Created as NEW   |          |
	And I click ActionPalette Item "Answer" in "DCFAction" ActionPalette
	And I enter response "DCF answered" in AnswerDCFDialog
	And I click SaveButton in AnswerDCFDialog
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status   | QueryDescription | DateTime |
    |       | Answered | Created as NEW   |          |

#55
Scenario: 53_Close the manual DCF "Created as NEW"
	When I select the DCF row
    | DCFID | Status   | QueryDescription | DateTime |
    |       | Answered | Created as NEW   |          |
	And I click ActionPalette Item "Close" in "DCFAction" ActionPalette
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription | DateTime |
    |       | Closed | Created as NEW   |          |

#56
Scenario: 54_CheckedOut "From1" of "Visit (Week 2)" for "test-Patient" of "001-Site"
	Given I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I select the patient "test-Patient" from patients table.
	When I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	Then I see top orange bar with checked out message "CRF Checked Out -  testadmin testadmin" on CRF

#57, 58
Scenario: 55_Enter value "6" for Q4 to see "Queries Resutl"
	When I enter below flat questions data in the CRF.
	| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample integer question: | 12                 | TextBox         | 6              | DCF             |                 |
	And I click on "Save & Close" button on "Form1" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                                 |
    | Q4: Value is not within the expected range (10 to 1000) |
	And I click Continue button of Modal "Queries Result"

#59, 60
#Popups are not shown for resolved queries
Scenario:56_Enter value "35" for Q4 to see satisfy edit checks
	When I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample integer question: | 6                  | TextBox         | 35             | DCF             |                 |
	And I click "Save" button on "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                        | DateTime |
    |       | Closed | Q4: Value is not within the expected range (10 to 1000) |          |
	
#61
Scenario: 57_Change DCF Workflow to "Electronic" for site "001-Site"
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "001" and site name "Site" from SiteManagement page
	And I edit site and Save in SiteDetailsPage
	| DCFWorkflow |
	| Electronic  |
	Then I see site "001-Site" in SiteManagementPage

#62
Scenario: 58_Uncheck "Auto-Close Resolved DCFs"
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "DCFs" in StudyEditPreferencesPage
	And I uncheck checkbox "Auto-close Resolved DCFs" in StudyEditPreferencesDCFsPage
	And I click SaveButton in StudyEditPreferencesDCFsPage
	
#63, 64
Scenario: 59_Edit "Form1" of "Visit (Screening)" and enter "1234" for Q5 to resolve DCF
	Given I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I select the patient "test-Patient" from patients table.
	When I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I select "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt         | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample float question: | [Blank]            | TextBox         | 1234           | DCF             |                 |
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	And I expand "Visit (Screening)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status   | QueryDescription                                             | DateTime |
    |       | Resolved | Q5: Value does not meet the minimum length requirement of 4. |          |

#65
Scenario: 60_Search manual DCF from searhc palette in main DCF tab
	Given I navigate to "DCFs" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	When I expand search palette in MainDCFspage
	And I select value "Draft" from "DCF Status" dropdown of search palette in MainDCFspage
	And I click Go butotn in search palette in MainDCFspage 
	Then I see searched DCFs in MainDCFspage
	| PatientID    | DCFID | Status | QueryDescription |
	| test-Patient |       | Draft  | manual query     |

#66
Scenario: 61_Search DCF which has "Resolved" statusfrom searhc palette in main DCF tab
	When I expand search palette in MainDCFspage
	And I select value "Resolved" from "DCF Status" dropdown of search palette in MainDCFspage
	And I click Go butotn in search palette in MainDCFspage 
	Then I see searched DCFs in MainDCFspage
	| PatientID    | DCFID | Status   | QueryDescription |
	| test-Patient | 2     | Resolved |                  |

#67
Scenario: 62_"Ready to Print" On for the Resolved DCF
	When I open DCF with DCF ID "2" in MainDCFsPage
	And I expand flags palette in EditDCFPage
	And I click flags palette item "Ready to Print" in EditDCFPage
	And I click Ready to Print flag "On" in EditDCFPage
	Then I see Ready to Print Status "On"

#68
Scenario: 63_Initiating DCF print
	When I click breadcrumb "Search Results"
	And I click ActionPalette Item "DCF Print Wizard" in "DCF_PrintWizAction" ActionPalette
	Then I see DCF details in DCFWizardStep1Page
	| PatientID    | DCFID | Status   | QueryDescription                                             | IsPrintEnabled |
	| test-Patient | 2     | Resolved | Q5: Value does not meet the minimum length requirement of 4. | true           |

#69, 70, 71
Scenario: 64_DCF is queued for print
	When I click NextButton in DCFWizardStep1Page
	And I click NextButton in DCFWizardStep2Page
	And I click FinishButton in DCFWizardStep3Page
	And I click main tab "Inbox"
	Then I check subjects in inbox folder "Jobs"
    | Subject                                 |
    | DCF Print Request COMPLETE.,Batch ID: 2 |

#72, 73, 74, 75, 76
Scenario: 65_Give field label for custom DCF fields
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "DCFs" in StudyEditPreferencesPage
	And I enter text "Custom1" in FieldLabelTextbox1 in StudyEditPreferencesDCFsPage
	And I click InactiveRadioButton1 in StudyEditPreferencesDCFsPage
	And I click ActiveRadioButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Item1" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage
	And I click AddButton1 in StudyEditPreferencesDCFsPage
	And I enter text "Item2" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage
	And I click AddButton1 in StudyEditPreferencesDCFsPage
	And I click SaveButton in StudyEditPreferencesDCFsPage
	And I navigate to "DCFs" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I click draft dcfs "3" for patient "test-Patient" in MainDCFsPage
	And I click dcfid "4" in DraftDCFsPage
	And I selected dropdown item "Item2" for customdropdown1 in EditDCFPage
	And I click save button in EditDCFPage
	And I click dcfid "4" in DraftDCFsPage
	Then I see selected dropdown item "Item2" for customdropdown1 in EditDCFPage

#77
Scenario: 66_1_Add a manual DCF with sent status
	Given I navigate to "Patients" tab from main menu.
	And I select site "001-Site" from Sites dropdown.
	And I select the patient "test-Patient" from patients table.
	And I expand "Visit (Week 8)" to select and open "Form 4" CRF.
	When I select "Checkout" button on "Form 4" CRF.
	And I click ActionPalette Item "Create DCF" in "CRFAction" ActionPalette
	And I enter manual DCF details in CreateDCFDialog
	| DCFStatus | QueryDescription                                 | ActionRequest       |
	| Sent      | Query to verify DCF Description Replacement text | Action request here |
	And I click save button in CreateDCFDialog
	And I click "Save" button on "Form 4" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                 | DateTime |
    |       | Sent   | Query to verify DCF Description Replacement text |          |

# 80, 81
Scenario: 66_Set permission "View/Act upon Restricted Access Forms" of "CRF Permissions" to Deny
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Group Management" In StudyAdministrationPage
	And I click GroupName "EDC Engineering Admins Group" in GroupManagement Page	
	And I click ActionPalette Item "Edit Permissions" in "GroupDetailsActions" ActionPalette
	And I set permissions for loggedin user group in EditPermissionsPage
	| Category        | Permission                            | PermissionType |
	| CRF Permissions | View/Act upon Restricted Access Forms | Deny           |
	Then I see Datalabs Home Page

#78, 79, 82
Scenario: 67_Enable PaperDataEntry in Study EditPreferences
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Paper Entry" in StudyEditPreferencesPage
	And I check checkbox EnablePaperDataEntry in StudyEditPreferencesPaperEntryPage
	And I check checkbox AllowOneUserBothTheEntries in StudyEditPreferencesPaperEntryPage
	And I click save button in StudyEditPreferencesPaperEntryPage
	And I select DataManagerPortal item "User Preferences" from drop down
	And I select portal "Paper Data Entry Portal" in UserPreferencesPage 
	And I click save button in UserPreferencesPage
	Then I see main tab "CRFs"
	And I see main tab "Inbox"
	But I dont see main tab "Patients"
	And I dont see main tab "DCFs"

#83
Scenario: 68_Open Form1 of Visit (Week 5) from CRFs main tab
	When I navigate to "CRFs" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I select patient "test-Patient" in CRFsPage
	And I expand "Visit (Week 5)" to select and open "Form1" CRF in CRF_PDEP_EventsPage 
	And I click "Checkout" button on "Form1" CRF.
	Then I see top orange bar with checked out message "1st Pass (Entry)" on CRF

#84
Scenario: 69_Save Form1 and checkout once again
	When I click on "Save & Close" button on "Form1" CRF.
	And I expand "Visit (Week 5)" to select and open "Form1" CRF in CRF_PDEP_EventsPage
	And I click "Checkout" button on "Form1" CRF.
	Then I see top orange bar with checked out message "2nd Pass (Entry)" on CRF

#85
Scenario: 70_Enter value for Q1 of Form1
	When I enter below flat questions data in the CRF.
	| QuestionPrompt        | AnswerValue | AnswerFieldType |
	| Sample text question: | hello       | TextBox         |
	And I click on "Save & Close" button on "Form1" CRF.
	Then I see icon "Mismatch" for form "Form1" of event "Visit (Week 5)"
	And I dont see ActionPaletteItem "Submit CRFs" in ActionPalette "DataEntryPatientEventsActions"

#86
Scenario: 71_Select Radio [Blank]
	When I expand "Visit (Week 5)" to select and open "Form1" CRF in CRF_PDEP_EventsPage
	And I click "Checkout" button on "Form1" CRF.
	And I enter below flat mismatched questions data in the PDEP CRF
	| QuestionPrompt        | RadioButton | Text |
	| Sample text question: | [Blank]     |      |
	And I click on "Save & Close" button on "Form1" CRF.
	Then I expand "Visit (Week 5)" to check "Form1" CRF icons in CRF_PDEP_EventsPage
	| Received | FirstPass | SecondPass |
	|          | Yes       | Yes        |

#87
Scenario: 72_Submit  CRF
	When I click ActionPalette Item "Submit CRFs" in "DataEntryPatientEventsActions" ActionPalette
	And I select form "Form1" in SubmitCRFsPage 
	And I click save button in SubmitCRFsPage
	Then I see icon "Submitted" for form "Form1" of event "Visit (Week 5)"

#88
Scenario: 73_Verifying restriction access for "Form 4" of "Visit (Week 8)"
	When I expand "Visit (Week 8)" in CRF_PDEP_EventsPage
	Then I see form restriction message in CRF_PDEP_EventsPage
	| Event          | Form   | RestrictionMessage                                                                                 |
	| Visit (Week 8) | Form 4 | Restricted Access: You do not have security rights to view or act upon form Visit (Week 8)/Form 4. |
#89
Scenario: 74_Verifying DCFs sub tab visibility for "Form1" of "Visit (Week 8)"
	When I expand "Visit (Week 8)" to select and open "Form1" CRF in CRF_PDEP_EventsPage
	Then I dont see sub tab "DCFs" in CRF

#90
Scenario: 75_Shift to "Data Manager Portal"
	When I select DataManagerPortal item "User Preferences" from drop down
	And I select portal "Data Manager Portal" in UserPreferencesPage
	And I click save button in UserPreferencesPage
	Then I see main tab "Patients" 
	And I see main tab "CRFs"
	And I see main tab "DCRs"
	And I see main tab "Inbox"

#91
Scenario: 76_Set DCF workflow to "Paper" for "001-Site"
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "001" and site name "Site" from SiteManagement page
	And I edit site and Save in SiteDetailsPage
	| DCFWorkflow |
	| Paper       |	
	Then I see site "001-Site" in SiteManagementPage

#92
Scenario: 77_Save "Form1" of "Visit (Week 8)" without entering any data and with EntryComplete check
	Given I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I select the patient "test-Patient" from patients table.
	And I expand "Visit (Week 8)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I select entry complete checkbox.
	And I click on "Save & Close" button on "Form1" CRF.
	And I click Continue button of Modal "Queries Result"
	And I expand "Visit (Week 8)" to select and open "Form1" CRF.
	And I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
    | DCFID | Status | QueryDescription                                             | DateTime |
    |       | Draft  | Q5: Value does not meet the minimum precision of 2.          |          |
    |       | Draft  | Q5: Value does not meet the minimum length requirement of 4. |          |
    |       | New    | Q1: Field is Required                                        |          |

#93, 94, 95, 96
Scenario: 78_Change DCF Description Replacement text and check in Main DCFs tab
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "001" and site name "Site" from SiteManagement page
	And I edit site and Save in SiteDetailsPage
	| DCFWorkflow |
	| Electronic  |
	And I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "DCFs" in StudyEditPreferencesPage
	And I enter DCFDescriptionReplacement text "New restricted text" in StudyEditPreferencesDCFsPage
	And I click SaveButton in StudyEditPreferencesDCFsPage
	And I navigate to "Patients" tab from main menu.
	#And I open "sent" DCFs of site "001-Site" in MainDCFsPage
	#Then I see sent DCFs in MainDCFsSentPage
	#| PatientID    | DCFID | Status | QueryDescription    | OpenAging |
	#| test-Patient |       | Sent   | New restricted text |           |

#97, 98, 99
Scenario: 79_Check scripting to derive data from "Demographics" to "Scripting" of "Visit (Week 3)"
	Given I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I select the patient "test-Patient" from patients table.
	And I expand "Visit (Week 3)" to select and open "Scripting" CRF.
	When I click "Checkout" button on "Scripting" CRF.
	And I click on "Save & Close" button on "Scripting" CRF.
	And I expand "Visit (Week 3)" to select and open "Demographics" CRF.
	And I click "Checkout" button on "Demographics" CRF.
	And I enter below flat questions data in the CRF.
    | QuestionPrompt | AnswerValue | AnswerFieldType |
    | Date of Birth: | 1/1/1970    | Textbox         |
    | Gender:        | Female      | Dropdown        |
	And I click on "Save & Close" button on "Demographics" CRF.
	And I expand "Visit (Week 3)" to select and open "Scripting" CRF.
	And I refresh the page
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt                                                                                                   | AnswerValue | AnswerFieldType |
	| This question derives its value from Visit (Week3), Demographics, Date of Birth (Q1) Q1 Notes: (DataType {Sent}) | 1/1/1970    | Text            |
	| This question derives its value from Visit (Week 3), Demographics, Gender (Q2)                                   | Female      | Text            |
	| Derive based on Question 6.                                                                                      | D4=Thawed   | Text_Contains   |
	| Derive based on Question 5(Form1, Week 2), the Screening Actual Date and Question 7.                             | D4=Thawed   | Text_Contains   |
	| Derive based on Question 4 (Form 1, Week 2), the Screening Actual Date and Question 8                            | D4=Thawed   | Text_Contains   |
	| Derive based on the Data Status of Demographics, Week 3 and Question 9.                                          | D4=Thawed   | Text_Contains   |
	And I click on "Cancel" button on "Scripting" CRF.

#100, 101, 102
Scenario: 80_Verify queries for One question for Q1, One question for Q4, and Two questions for Q5
	Given I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	When I add patient with below details.
    | ScreenID     | PatientInitials | ScreenDate |
    | test_queries | patient         | 06/04/2018 |
	And I enroll the patient "test_queries-patient" with below data.
    | EnrollID     | EnrollDate | EntryComplete |
    | test_queries | 06/04/2018 | Yes           |
	When I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I click "Checkout" button on "Form1" CRF.
	And I enter below data for Flat questions in CRF.
    | QuestionPrompt           | AnswerValue | AnswerFieldType |
    | Sample integer question: | 1234567     | Textbox         |
	And I select entry complete checkbox.
	And I click on "Save & Close" button on "Form1" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                                      |
    | Q1: Field is Required                                        |
    | Q5: Value does not meet the minimum length requirement of 4. |
    | Q5: Value does not meet the minimum precision of 2.          |
    | Q4: Value is not within the expected range (10 to 1000)      |
	And I click Continue button of Modal "Queries Result"

#103, 104 
Scenario: 81_Edit the Q4 and verify change history for Q4
	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
	When I click "Checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt           | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Sample integer question: | 1234567            | TextBox         | 888            | DCF             |                 |
	And I click on "Save & Close" button on "Form1" CRF.
	#Manual script says to click continue but "Queries Result" is not coming
	#And I click Continue button of Modal "Queries Result"
	And I expand "Visit (Week 2)" to select and open "Form1" CRF.
	And I click icon "changeHistory.gif" for the flat question "Sample integer question:" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | 1234567  | Reason: Initial Entry\r\nNotes: Submitted |
	|          | 888      | Reason: DCF                               |
	And I click cancel button in ChangeHistoryModal
	And I click on "Cancel" button on "Form1" CRF.

#105
Scenario: 82_Verify AutoBuildTable forms in events Visit (Week 20,51,52,53)
	When I click ExpandAll events in PatientPage
	Then I see form "Autobuild Fixed 1" under event "Visit (Week 20)"
	And I see form "Autobuild Form01" under event "Visit (Week 51)"
	And I see form "Autobuild Form02" under event "Visit (Week 51)"
	And I see form "Autobuild Form03" under event "Visit (Week 51)"
	And I see form "Autobuild Form05" under event "Visit (Week 52)"
	And I see form "Autobuild Form04" under event "Visit (Week 52)"
	And I see form "Autobuild Form03" under event "Visit (Week 52)"
	And I see form "Autobuild Form05" under event "Visit (Week 53)"
	And I see form "Autobuild Form07" under event "Visit (Week 53)"
	And I see form "Autobuild Form06" under event "Visit (Week 53)"

#106
#Scenario: 83_Check "Autobuild Fixed 1" of "Visit (Week 20)"
#	Given I expand "Visit (Week 20)" to select and open "Autobuild Fixed 1" CRF.
#	When I click "Checkout" button on "Autobuild Fixed 1" CRF.
#	Then I verify below "Key Sequence is on question #1.  Question (4 & 7) are derives.  Table structure is open.  Maximum Table Rows are 5.:" table questions data in the CRF.
#	| RowNumber | QuestionPrompt                            | AnswerValue | AnswerFieldType | RowButtonToClick |
#	| 1         | Key sequence code list: (Yes, No, Blank): | X           | Textbox         |                  |
#	| 1         | Patient Status:                           | Enrolled    | Textbox         | Cancel Row       |
#	| 2         | Key sequence code list: (Yes, No, Blank): | 1           | Textbox         |                  |
#	| 2         | Patient Status:                           | Enrolled    | Textbox         | Cancel Row       |
#	| 3         | Key sequence code list: (Yes, No, Blank): | 2           | Textbox         |                  |
#	| 3         | Patient Status:                           | Enrolled    | Textbox         | Cancel Row       |
#	And I click on "Cancel" button on "Autobuild Fixed 1" CRF.

#107
Scenario: 84_Set "Site Portal" and verify main tabs
	When I select DataManagerPortal item "User Preferences" from drop down
	And I select portal "Site Portal" in UserPreferencesPage 
	And I click save button in UserPreferencesPage
	Then I see main tab "Inbox"
	And  I see main tab "Patients"
	And I see main tab "DCFs"
	But I dont see main tab "CRFs"

#108
Scenario: 85_Set "Field Monitor Portal" and verify main tabs
	When I select portal "Field Monitor Portal" in UserPreferencesPage 
	And I click save button in UserPreferencesPage
	Then I see main tab "Inbox"
	And  I see main tab "Patients"
	And I see main tab "DCFs"
	And I see main tab "CRFs"

#109
Scenario: 86_Set "Medical Monitor Portal" and verify main tabs
	When I select portal "Medical Monitor Portal" in UserPreferencesPage 
	And I click save button in UserPreferencesPage
	Then I see main tab "Inbox"
	And  I see main tab "Patients"
	And I see main tab "DCFs"
	And I see main tab "CRFs"

#110
Scenario: 87_Change Data&Time format and Check ServerTime available at the footer
	When I select DateTime format "European (dd-mmm-yyyy hh:mm:ss AP TZD)" in UserPreferencesPage
	And I select DateTime zone "(UTC-08:00) Pacific Time (US & Canada)" in UserPreferencesPage
	And I click save button in UserPreferencesPage
	Then I see ServerTime "PDT"

#111
Scenario: 88_Check for available Study Administration page links
	When I select DataManagerPortal item "Study Administration" from drop down
	Then I see link "Site Management" In StudyAdministrationPage
	And I see link "Group Management" In StudyAdministrationPage
	And I see link "User Management" In StudyAdministrationPage
	And I see link "Flag Management" In StudyAdministrationPage
	And I see link "Integration Management" In StudyAdministrationPage
	And I see link "Lab Management" In StudyAdministrationPage
	And I see link "pScript Management" In StudyAdministrationPage
	And I see link "Signature Management" In StudyAdministrationPage
	And I see link "Query Management" In StudyAdministrationPage
	And I see link "Derivation Management" In StudyAdministrationPage
	And I see link "Casebook Management" In StudyAdministrationPage
	And I see link "Transfer Patient Management" In StudyAdministrationPage
	And I see link "IT Administration" In StudyAdministrationPage

#112
Scenario: 88_Change Data&Time format and Check ServerTime available at the footer
	When I select DateTime format "Use Default System Settings" in UserPreferencesPage
	And I select DateTime zone "Use Default System Settings" in UserPreferencesPage
	And I click save button in UserPreferencesPage
	Then I see ServerTime "GST"

#113, 114, 115, 116 - Not valid (Update script based on new UI)

#117
Scenario: 89_Check for editable attestation text in PISignature page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Signature Management" In StudyAdministrationPage
	And I click PISignature in SignatureManagementPage 
	Then I see editable attestatin text in PISignaturePage

#118, 119, 120
Scenario: 90_Run Derivation and Query wizard and check for jobs
	When I click breadcrumb "Study Administration"
	And I click Link "Query Management" In StudyAdministrationPage
	And I click ActionPalette Item "Run Wizard" in "QueryListActions" ActionPalette
	And I click RunAll button in QueryRunWizardPage
	And I click Next button in QueryRunWizardCriteriaPage
	And I select site "001-Site" in QueryRunWizardSitesPage
	And I click Next button in QueryRunWizardSitesPage
	And I click Finish button in QueryRunWizardPage
	And I click breadcrumb "Study Administration"
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click ActionPalette Item "Run Wizard" in "DerivationMgmtListActions" ActionPalette
	And I click Next button in DerivationRunWizardCriteriaPage
	And I select site "001-Site" in DerivationRunWizardSitesPage
	And I click Next button in DerivationRunWizardSitesPage
	And I click Finish button in DerivationRunWizardPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject  |
	| complete |
	| complete | 
	#Derivations: #1 - complete (with exceptions). View summary.
	#Queries: #1 - complete (with exceptions). View summary.


#121 - Reporting service should be installed

#122
Scenario: 92_Check for available links in Export
	When I select DataManagerPortal item "Export" from drop down
	Then I see link "Quick Export" in ExportPage
	And I see link "Archive Export" in ExportPage
	And I see link "Advanced Export" in ExportPage

#123 - AdvancedExport should be installed

#124
Scenario: 94_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "TestStudy_UpdateA.zip" with Label "UpdateA"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                    |
	| Migration of Site 002 for Study file (UpdateA) - complete. |
	| Migration of Site 001 for Study file (UpdateA) - complete. |
	| Study file (UpdateA) - complete.                           |

#125
Scenario: 95_Update study with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "TestStudy_UpdateB.zip" with Label "UpdateB"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                    |
	| Migration of Site 002 for Study file (UpdateB) - complete. |
	| Migration of Site 001 for Study file (UpdateB) - complete. |
	| Study file (UpdateB) - complete.                           |

#125
Scenario: 96_Check of Obsolete status for first study
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	Then I see study label "L1" with status "Obsolete (v1.0)"

#126
#This is coming as Major update
Scenario: 97_Update study (minor update)
	When I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "TestStudy_UpdateC.zip" with Label "UpdateB"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                          |
	| Study file (UpdateC) - complete. |

#126
Scenario: 98_Check of Obsolete status for first study
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	Then I see study label "UpdateC" with status "Obsolete (v3.1)"
	And I see study label "UpdateB" with status "Obsolete (v3.0)"
	And I see study label "UpdateA" with status "Obsolete (v2.0)"
	And I see study label "L1" with status "Obsolete (v1.0)"

#127
Scenario: 99_Verify details in ManageVersions of Sites
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "SiteActions" ActionPalette
	Then I see site manage version detials in ManageVersionsPage
	| Version | New Patients | Default | Patients | Published Date/Time | Status |
	| 3.1     | Allow        |         |          |                     |        |
	| 2.0     | Deny         |         |          |                     |        |

#128
Scenario: A100_Export data
	When I select DataManagerPortal item "Export" from drop down
	And I click link "Quick Export" in ExportPage
	And I select export details in QuickExportPage
	| Site     | Patient      | Event          | Forms | Format |
	| 001-Site | test-Patient | Visit (Week 3) |       |        |
	And I click Export button in QuickExportPage
	And I click ok button of Modal "Quick Export" 
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                  |
	| complete. Download file. |

#129
Scenario: A101_Transfer patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	And I select the patient "02-pt" from patients table.
	When I click ActionPalette Item "Transfer Patient" in "PatientPortalActions" ActionPalette
	And I set transfer patient data in TransferPatientPage
	| ToSite   | Reason | AdditionalNotes |
	| 002-Site | Other  | Test            |
	And I click Transfer button in TransferPatientPage
	And I click continue in modal dialog having title "Transfer Patient Confirmation" and partial message "02-pt will be moved to site 002-Site."
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                    |
	| Transfer Patient - complete. View Summary. |

#129
Scenario: A102_Verify transferred patient site
	Given I navigate to "Patients" tab from main menu.
	And I select the site "002-Site" from Sites dropdown.
	And I select the patient "02-pt" from patients table.
	Then I see Patient details page for "02-pt".

#130
Scenario: A103_Search patient
	When I select AdvancedSearch from main menu
	And I set patient id "02" in AdvancedSearchWindow
	And I click search button in AdvancedSearchWindow
	Then I see patients in AdvancedSearchResultsPage
	| Site     | Patient ID         |
	| 002-Site | UserA1_test-UserA1 |

#131
Scenario: A104_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

#132
Scenario: A105_Publish a study check for Dynamic event (should not be shown)
	When I click breadcrumb "Study Management"
	And I upload a study "BaseStudy_vbnet_Minor.xml" with study label "NewStudy"
	And I navigate to "Patients" tab from main menu.
	And I select the site "001-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| Pat_A    | PA              | 4/10/2018  |
	And I select the patient "Test-Patient" from patients table.
	And I enroll the patient "Pat_A-PA" with below data.
    | EnrollID | EnrollDate | EntryComplete |
    | Pat_A    | Today      | Yes           |
	Then I see patient "Pat_A-PA" status as "Enrolled" on Patient details page.
	But I dont see event "Event Schedule A" in PatientPortalPage

#133
Scenario: A106_Check for Dynamic event "Event Schedule A" after saving "Test Form 1" of "Test Event 1"
	Given I expand "Test Event 1" to select and open "Test Form 1" CRF.
	When I select "Checkout" button on "Test Form 1" CRF.
	And I enter below data for Flat questions in CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Text Question  | SchA        | Textbox         |
	And I click on "Save & Close" button on "Test Form 1" CRF.
	And I refresh the page
	Then I see  event "Event Schedule A" in PatientPortalPage

#133
Scenario: A107_Check for forms under "Event Schedule A"
	When I expand event "Event Schedule A" in PatientPortal
	Then I see forms under event "Event Schedule A"
	| Form           |
	| Dynamic Form 1 |
	| Test Form 1    |

#134, 135
Scenario: A108_Check for adding "Dynamic Form2" after entering data in "Test Form 1" of "Event Cycle 1"
	When I click ActionPalette Item "Add Event(s)" in "PatientPortalActions" ActionPalette
	And I click Publish button in AddEventsPage
	And I click Yes button in ModalDialog "Add Event(s) message"
	And I expand "Event Cycle1" to select and open "Test Form 1" CRF.
	And I click "Checkout" button on "Test Form 1" CRF.
	And I enter below data for Flat questions in CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Date Question  | 01/01/1940  | Textbox         |
	And I select entry complete checkbox.
	And I click on "Save & Close" button on "Test Form 1" CRF.
	#Need to verify below step
	And I click back to CRF button of Modal "Queries Result"
	And I enter below data for Flat questions in CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Text Question  | Test        | Textbox         |
	And I click on "Save & Close" button on "Test Form 1" CRF.
	And I expand event "Status Event" in PatientPortal
	Then I see forms under event "Event Schedule A"
	| Form          |
	| Test Form 2   |
	| Dynamic Form2 |







#Check for resolved DCFs in DCF subtab after answering the question
#Flags
#Reporting, AdvanedExport



