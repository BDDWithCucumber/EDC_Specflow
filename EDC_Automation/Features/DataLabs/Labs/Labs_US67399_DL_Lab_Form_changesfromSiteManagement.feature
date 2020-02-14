Feature: Labs_DL_Lab_Form_changesfromSiteManagement

#US67399	
Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Import_Study1_SiteChangesnew1.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 

Scenario: T04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |

Scenario: T05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"
	
Scenario: T06_Assign testadmin testadmin user to 02-Site
	When I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: T07_Add Labs
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

Scenario: T08_Associate Lab L01 and L02 for 01-SIte
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

Scenario: T09_Associate Lab L01, L03 for 02-Site
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
	
Scenario: T10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T11_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T12_Verify the Lab report data before Site Changes
		#When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.		
	  When I open form "LabForm1" of event "Visit (Week 2)"
	  #When I collapse event "Visit (Week 2)" in PatientPortal
	  And I click "Checkout" button on "LabForm1" CRF.
	  Then I see "Save" button on the CRF page.

Scenario: T13_Verify the Lab report data before Site Changes
	  When I click on "Save" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.
	  And I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 2           | Text            | OK               |
		| 3         | CRF Lab Test Name    | Test2       | Text            |                  |
		| 3         | Lab Test Description | 02          | Text            |                  |
		| 3         | Lab Test Name        | 02          | Text            |                  |
		| 3         | Lab Test Code        | 02          | Text            |                  |
		| 3         | LOINC Code           | 12          | Text            |                  |
		| 3         | Category             | cup2        | Text            |                  |
		| 3         | Subcategory          | subcup2     | Text            |                  |
		| 3         | Specimen             | speccup2    | Text            |                  |
		| 3         | ResultType           | Rescup2     | Text            |                  |
		| 3         | NormalizedLabUnit    | 02          | Text            |                  |
		| 3         | Precision            | 4           | Text            | OK               |
		| 4         | CRF Lab Test Name    | Test3       | Text            |                  |
		| 4         | Lab Test Description | 03          | Text            |                  |
		| 4         | Lab Test Name        | 03          | Text            |                  |
		| 4         | Lab Test Code        | 03          | Text            |                  |
		| 4         | LOINC Code           | 13          | Text            |                  |
		| 4         | Category             | cup3        | Text            |                  |
		| 4         | Subcategory          | subcup3     | Text            |                  |
		| 4         | Specimen             | speccup3    | Text            |                  |
		| 4         | Method               | Metcup3     | Text            |                  |
		| 4         | NormalizedLabUnit    | 03          | Text            |                  |
		| 4         | Precision            | 3           | Text            | OK               |
		| 5         | CRF Lab Test Name    | Test4       | Text            |                  |
		| 5         | Lab Test Description | 04          | Text            |                  |
		| 5         | Lab Test Name        | 04          | Text            |                  |
		| 5         | Lab Test Code        | 04          | Text            |                  |
		| 5         | LOINC Code           | 14          | Text            |                  |
		| 5         | Category             | cup4        | Text            |                  |
		| 5         | Subcategory          | subcup4     | Text            |                  |
		| 5         | Specimen             | speccup4    | Text            |                  |
		| 5         | Method               | Metcup4     | Text            |                  |
		| 5         | ResultType           | Rescup4     | Text            |                  |
		| 5         | Precision            | 4           | Text            | OK               |
		| 6         | CRF Lab Test Name    | Test5       | Text            |                  |
		| 6         | Lab Test Description | 05          | Text            |                  |
		| 6         | Lab Test Name        | 05          | Text            |                  |
		| 6         | Lab Test Code        | 05          | Text            |                  |
		| 6         | LOINC Code           | 15          | Text            |                  |
		| 6         | Category             | cup5        | Text            |                  |
		| 6         | Subcategory          | subcup5     | Text            |                  |
		| 6         | Specimen             | speccup5    | Text            |                  |
		| 6         | Method               | Metcup5     | Text            |                  |
		| 6         | ResultType           | Rescup5     | Text            |                  |
		| 6         | NormalizedLabUnit    | 04          | Text            | OK               |
		| 7         | CRF Lab Test Name    | Test6       | Text            |                  |
		| 7         | Lab Test Description | 06          | Text            |                  |
		| 7         | Lab Test Name        | 06          | Text            |                  |
		| 7         | Lab Test Code        | 06          | Text            | OK               |	
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt    | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | Specimen          |             | DISABLEDTEXT1   | Disabled | OK               |
      | 3         | Method            |             | DISABLEDTEXT1   | Disabled |                  |
      | 3         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 4         | ResultType        |             | DISABLEDTEXT1   | Disabled |                  |
      | 4         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 5         | NormalizedLabUnit |             | DISABLEDTEXT1   | Disabled |                  |
      | 5         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 6         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled |                  |
      | 6         | Precision         |             | DISABLEDTEXT1   | Disabled | OK               |
      | 7         | LOINC Code        |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Category          |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Subcategory       |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Specimen          |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Method            |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | ResultType        |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | NormalizedLabUnit |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Precision         |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |       
		And I click "Cancel" button on "LabForm1" CRF.
		
Scenario: T14_Select Complete Change History in User preferences
	When I select DataManagerPortal item "User Preferences" from drop down
	And I enable CompleteChangeHistory in UserPreferencesPage
	And I click save button in UserPreferencesPage
	Then I see Save Success message on User Preferences page.

Scenario: T15_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
     When I select the patient "01-PAT" from patients table.
     Then I see Patient details page for "01-PAT".

Scenario: T16_Verify the Lab report data before Site Changes
	  When I collapse event "Visit (Week 2)" in PatientPortal
	  And I open form "LabForm1" of event "Visit (Week 2)"
	  Then I see CRF "LabForm1" of event "Visit (Week 2)"
	 # And I expand row "2" of table "Autobuild Table:" 

Scenario: T17_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes	
	When I click "changeHistory.gif" icon of a question "Lab Test Description" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |  

Scenario: T18_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Lab Test Name" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T19_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Lab Test Code" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T20_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "LOINC Code" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 11       | Reason: Initial Entry[Derived] |
	
Scenario: T21_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Category" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | cup1     | Reason: Initial Entry[Derived] |
	
Scenario: T22_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Subcategory" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | subcup1  | Reason: Initial Entry[Derived] |
	
Scenario: T23_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Method" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | Metcup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T24_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "ResultType" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | Rescup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T25_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "NormalizedLabUnit" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T26_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Precision" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 2        | Reason: Initial Entry[Derived] |	
	
Scenario: T27_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Specimen" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | speccup1 | Reason: Initial Entry[Derived] |														

Scenario: T28_Change the Site address
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	#When(@"I open site with siteid ""(.*)"" and site name ""(.*)"" from SiteManagement page")]
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I enter sites details and Save
	| SiteId | SiteName    | Address1        | Address2        | Address3        | Address4        | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site_Change | ADDRESS_Change1 | ADDRESS_Change2 | ADDRESS_Change3 | ADDRESS_Change4 | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |	
	

Scenario: T29_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site_Change" from Sites dropdown.
     When I select the patient "01-PAT" from patients table.
     Then I see Patient details page for "01-PAT".

Scenario: T30_Verify the Lab report data before Site Changes
	  When I collapse event "Visit (Week 2)" in PatientPortal
	  And I open form "LabForm1" of event "Visit (Week 2)"
	  Then I see CRF "LabForm1" of event "Visit (Week 2)"

Scenario: T31_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
    When I expand row "2" of table "Autobuild Table:"	
	And I click "changeHistory.gif" icon of a question "Lab Test Description" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |  

Scenario: T32_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Lab Test Name" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T33_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Lab Test Code" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T34_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "LOINC Code" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 11       | Reason: Initial Entry[Derived] |
	
Scenario: T35_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Category" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | cup1     | Reason: Initial Entry[Derived] |
	
Scenario: T36_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Subcategory" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | subcup1  | Reason: Initial Entry[Derived] |
	
Scenario: T37_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Method" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | Metcup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T38_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "ResultType" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | Rescup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T39_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "NormalizedLabUnit" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T40_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Precision" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 2        | Reason: Initial Entry[Derived] |

Scenario: T42_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Specimen" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | speccup1 | Reason: Initial Entry[Derived] |	

Scenario: T43_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site_Change" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T44_Verify the Lab report data after Site Changes
	  When I collapse event "Visit (Week 2)" in PatientPortal
	  And I open form "LabForm1" of event "Visit (Week 2)"		 
	  Then I see CRF "LabForm1" of event "Visit (Week 2)"

Scenario: T45_Verify the Lab report data after Site Changes
	  When I click on "Save" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.
	  And I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 2           | Text            | OK               |
		| 3         | CRF Lab Test Name    | Test2       | Text            |                  |
		| 3         | Lab Test Description | 02          | Text            |                  |
		| 3         | Lab Test Name        | 02          | Text            |                  |
		| 3         | Lab Test Code        | 02          | Text            |                  |
		| 3         | LOINC Code           | 12          | Text            |                  |
		| 3         | Category             | cup2        | Text            |                  |
		| 3         | Subcategory          | subcup2     | Text            |                  |
		| 3         | Specimen             | speccup2    | Text            |                  |
		| 3         | ResultType           | Rescup2     | Text            |                  |
		| 3         | NormalizedLabUnit    | 02          | Text            |                  |
		| 3         | Precision            | 4           | Text            | OK               |
		| 4         | CRF Lab Test Name    | Test3       | Text            |                  |
		| 4         | Lab Test Description | 03          | Text            |                  |
		| 4         | Lab Test Name        | 03          | Text            |                  |
		| 4         | Lab Test Code        | 03          | Text            |                  |
		| 4         | LOINC Code           | 13          | Text            |                  |
		| 4         | Category             | cup3        | Text            |                  |
		| 4         | Subcategory          | subcup3     | Text            |                  |
		| 4         | Specimen             | speccup3    | Text            |                  |
		| 4         | Method               | Metcup3     | Text            |                  |
		| 4         | NormalizedLabUnit    | 03          | Text            |                  |
		| 4         | Precision            | 3           | Text            | OK               |
		| 5         | CRF Lab Test Name    | Test4       | Text            |                  |
		| 5         | Lab Test Description | 04          | Text            |                  |
		| 5         | Lab Test Name        | 04          | Text            |                  |
		| 5         | Lab Test Code        | 04          | Text            |                  |
		| 5         | LOINC Code           | 14          | Text            |                  |
		| 5         | Category             | cup4        | Text            |                  |
		| 5         | Subcategory          | subcup4     | Text            |                  |
		| 5         | Specimen             | speccup4    | Text            |                  |
		| 5         | Method               | Metcup4     | Text            |                  |
		| 5         | ResultType           | Rescup4     | Text            |                  |
		| 5         | Precision            | 4           | Text            | OK               |
		| 6         | CRF Lab Test Name    | Test5       | Text            |                  |
		| 6         | Lab Test Description | 05          | Text            |                  |
		| 6         | Lab Test Name        | 05          | Text            |                  |
		| 6         | Lab Test Code        | 05          | Text            |                  |
		| 6         | LOINC Code           | 15          | Text            |                  |
		| 6         | Category             | cup5        | Text            |                  |
		| 6         | Subcategory          | subcup5     | Text            |                  |
		| 6         | Specimen             | speccup5    | Text            |                  |
		| 6         | Method               | Metcup5     | Text            |                  |
		| 6         | ResultType           | Rescup5     | Text            |                  |
		| 6         | NormalizedLabUnit    | 04          | Text            | OK               |
		| 7         | CRF Lab Test Name    | Test6       | Text            |                  |
		| 7         | Lab Test Description | 06          | Text            |                  |
		| 7         | Lab Test Name        | 06          | Text            |                  |
		| 7         | Lab Test Code        | 06          | Text            | OK               |	
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt    | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | Specimen          |             | DISABLEDTEXT1   | Disabled | OK               |
      | 3         | Method            |             | DISABLEDTEXT1   | Disabled |                  |
      | 3         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 4         | ResultType        |             | DISABLEDTEXT1   | Disabled |                  |
      | 4         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 5         | NormalizedLabUnit |             | DISABLEDTEXT1   | Disabled |                  |
      | 5         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 6         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled |                  |
      | 6         | Precision         |             | DISABLEDTEXT1   | Disabled | OK               |
      | 7         | LOINC Code        |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Category          |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Subcategory       |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Specimen          |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Method            |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | ResultType        |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | NormalizedLabUnit |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Precision         |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |       
		And I click "Cancel" button on "LabForm1" CRF.

Scenario: T46_Deassociate Lab L01 and L02 for 01-SIte
	When I select DataManagerPortal item "Study Administration" from drop down	
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	#And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	#And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette#And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I dissociate all labs in AssociateLabsPage
	And I select sub tab "Labs" in site page
	#Then I see lab data in labs tab of Site in SitePage
	Then I shouldnot see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |

Scenario: T47_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site_Change" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T48_Verify the Lab report data after Site Changes
	  When I collapse event "Visit (Week 2)" in PatientPortal
	  And I open form "LabForm1" of event "Visit (Week 2)"	  	  
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 2           | Text            | OK               |
		| 3         | CRF Lab Test Name    | Test2       | Text            |                  |
		| 3         | Lab Test Description | 02          | Text            |                  |
		| 3         | Lab Test Name        | 02          | Text            |                  |
		| 3         | Lab Test Code        | 02          | Text            |                  |
		| 3         | LOINC Code           | 12          | Text            |                  |
		| 3         | Category             | cup2        | Text            |                  |
		| 3         | Subcategory          | subcup2     | Text            |                  |
		| 3         | Specimen             | speccup2    | Text            |                  |
		| 3         | ResultType           | Rescup2     | Text            |                  |
		| 3         | NormalizedLabUnit    | 02          | Text            |                  |
		| 3         | Precision            | 4           | Text            | OK               |
		| 4         | CRF Lab Test Name    | Test3       | Text            |                  |
		| 4         | Lab Test Description | 03          | Text            |                  |
		| 4         | Lab Test Name        | 03          | Text            |                  |
		| 4         | Lab Test Code        | 03          | Text            |                  |
		| 4         | LOINC Code           | 13          | Text            |                  |
		| 4         | Category             | cup3        | Text            |                  |
		| 4         | Subcategory          | subcup3     | Text            |                  |
		| 4         | Specimen             | speccup3    | Text            |                  |
		| 4         | Method               | Metcup3     | Text            |                  |
		| 4         | NormalizedLabUnit    | 03          | Text            |                  |
		| 4         | Precision            | 3           | Text            | OK               |
		| 5         | CRF Lab Test Name    | Test4       | Text            |                  |
		| 5         | Lab Test Description | 04          | Text            |                  |
		| 5         | Lab Test Name        | 04          | Text            |                  |
		| 5         | Lab Test Code        | 04          | Text            |                  |
		| 5         | LOINC Code           | 14          | Text            |                  |
		| 5         | Category             | cup4        | Text            |                  |
		| 5         | Subcategory          | subcup4     | Text            |                  |
		| 5         | Specimen             | speccup4    | Text            |                  |
		| 5         | Method               | Metcup4     | Text            |                  |
		| 5         | ResultType           | Rescup4     | Text            |                  |
		| 5         | Precision            | 4           | Text            | OK               |
		| 6         | CRF Lab Test Name    | Test5       | Text            |                  |
		| 6         | Lab Test Description | 05          | Text            |                  |
		| 6         | Lab Test Name        | 05          | Text            |                  |
		| 6         | Lab Test Code        | 05          | Text            |                  |
		| 6         | LOINC Code           | 15          | Text            |                  |
		| 6         | Category             | cup5        | Text            |                  |
		| 6         | Subcategory          | subcup5     | Text            |                  |
		| 6         | Specimen             | speccup5    | Text            |                  |
		| 6         | Method               | Metcup5     | Text            |                  |
		| 6         | ResultType           | Rescup5     | Text            |                  |
		| 6         | NormalizedLabUnit    | 04          | Text            | OK               |
		| 7         | CRF Lab Test Name    | Test6       | Text            |                  |
		| 7         | Lab Test Description | 06          | Text            |                  |
		| 7         | Lab Test Name        | 06          | Text            |                  |
		| 7         | Lab Test Code        | 06          | Text            | OK               |	
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt    | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | Specimen          |             | DISABLEDTEXT1   | Disabled | OK               |
      | 3         | Method            |             | DISABLEDTEXT1   | Disabled |                  |
      | 3         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 4         | ResultType        |             | DISABLEDTEXT1   | Disabled |                  |
      | 4         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 5         | NormalizedLabUnit |             | DISABLEDTEXT1   | Disabled |                  |
      | 5         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 6         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled |                  |
      | 6         | Precision         |             | DISABLEDTEXT1   | Disabled | OK               |
      | 7         | LOINC Code        |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Category          |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Subcategory       |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Specimen          |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Method            |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | ResultType        |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | NormalizedLabUnit |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Precision         |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |       
		And I click "Cancel" button on "LabForm1" CRF.

Scenario: T49_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site_Change" from Sites dropdown.
     When I select the patient "01-PAT" from patients table.
     Then I see Patient details page for "01-PAT".

Scenario: T50_Verify the Lab report data before Site Changes
     When I collapse event "Visit (Week 2)" in PatientPortal
	  And I open form "LabForm1" of event "Visit (Week 2)"	 
	  Then I see CRF "LabForm1" of event "Visit (Week 2)"	  
	  

Scenario: T51_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I expand row "2" of table "Autobuild Table:"	
	And I click "changeHistory.gif" icon of a question "Lab Test Description" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |  

Scenario: T52_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Lab Test Name" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T53_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Lab Test Code" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T54_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "LOINC Code" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 11       | Reason: Initial Entry[Derived] |
	
Scenario: T55_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Category" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | cup1     | Reason: Initial Entry[Derived] |
	
Scenario: T56_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Subcategory" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | subcup1  | Reason: Initial Entry[Derived] |
	
Scenario: T57_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Method" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | Metcup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T58_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "ResultType" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | Rescup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T59_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "NormalizedLabUnit" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T60_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Precision" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 2        | Reason: Initial Entry[Derived] |

Scenario: T61_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Specimen" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | speccup1 | Reason: Initial Entry[Derived] |	

Scenario: T62_De-associate lab "Lab01" from site
	When I click cancel button in ChangeHistoryModal
	And I click on "cancel" button on "LabForm1" CRF.
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I remove and save site id "01" and site name "Site" from assocaited sites in LabManagementSitesPage
	Then I see No records message in sites tab of Lab in LabPage

Scenario: T63_Navigate to site and select patient after Site Changes
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site_Change" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

Scenario: T64_Verify the Lab report data after Site Changes
	When I open form "LabForm1" of event "Visit (Week 2)"   	  
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	 
		| RowNumber | QuestionPrompt       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name    | Test1       | Text            |                  |
		| 2         | Lab Test Description | 01          | Text            |                  |
		| 2         | Lab Test Name        | 01          | Text            |                  |
		| 2         | Lab Test Code        | 01          | Text            |                  |
		| 2         | LOINC Code           | 11          | Text            |                  |
		| 2         | Category             | cup1        | Text            |                  |
		| 2         | Subcategory          | subcup1     | Text            |                  |
		| 2         | Method               | Metcup1     | Text            |                  |
		| 2         | ResultType           | Rescup1     | Text            |                  |
		| 2         | NormalizedLabUnit    | 01          | Text            |                  |
		| 2         | Precision            | 2           | Text            | OK               |
		| 3         | CRF Lab Test Name    | Test2       | Text            |                  |
		| 3         | Lab Test Description | 02          | Text            |                  |
		| 3         | Lab Test Name        | 02          | Text            |                  |
		| 3         | Lab Test Code        | 02          | Text            |                  |
		| 3         | LOINC Code           | 12          | Text            |                  |
		| 3         | Category             | cup2        | Text            |                  |
		| 3         | Subcategory          | subcup2     | Text            |                  |
		| 3         | Specimen             | speccup2    | Text            |                  |
		| 3         | ResultType           | Rescup2     | Text            |                  |
		| 3         | NormalizedLabUnit    | 02          | Text            |                  |
		| 3         | Precision            | 4           | Text            | OK               |
		| 4         | CRF Lab Test Name    | Test3       | Text            |                  |
		| 4         | Lab Test Description | 03          | Text            |                  |
		| 4         | Lab Test Name        | 03          | Text            |                  |
		| 4         | Lab Test Code        | 03          | Text            |                  |
		| 4         | LOINC Code           | 13          | Text            |                  |
		| 4         | Category             | cup3        | Text            |                  |
		| 4         | Subcategory          | subcup3     | Text            |                  |
		| 4         | Specimen             | speccup3    | Text            |                  |
		| 4         | Method               | Metcup3     | Text            |                  |
		| 4         | NormalizedLabUnit    | 03          | Text            |                  |
		| 4         | Precision            | 3           | Text            | OK               |
		| 5         | CRF Lab Test Name    | Test4       | Text            |                  |
		| 5         | Lab Test Description | 04          | Text            |                  |
		| 5         | Lab Test Name        | 04          | Text            |                  |
		| 5         | Lab Test Code        | 04          | Text            |                  |
		| 5         | LOINC Code           | 14          | Text            |                  |
		| 5         | Category             | cup4        | Text            |                  |
		| 5         | Subcategory          | subcup4     | Text            |                  |
		| 5         | Specimen             | speccup4    | Text            |                  |
		| 5         | Method               | Metcup4     | Text            |                  |
		| 5         | ResultType           | Rescup4     | Text            |                  |
		| 5         | Precision            | 4           | Text            | OK               |
		| 6         | CRF Lab Test Name    | Test5       | Text            |                  |
		| 6         | Lab Test Description | 05          | Text            |                  |
		| 6         | Lab Test Name        | 05          | Text            |                  |
		| 6         | Lab Test Code        | 05          | Text            |                  |
		| 6         | LOINC Code           | 15          | Text            |                  |
		| 6         | Category             | cup5        | Text            |                  |
		| 6         | Subcategory          | subcup5     | Text            |                  |
		| 6         | Specimen             | speccup5    | Text            |                  |
		| 6         | Method               | Metcup5     | Text            |                  |
		| 6         | ResultType           | Rescup5     | Text            |                  |
		| 6         | NormalizedLabUnit    | 04          | Text            | OK               |
		| 7         | CRF Lab Test Name    | Test6       | Text            |                  |
		| 7         | Lab Test Description | 06          | Text            |                  |
		| 7         | Lab Test Name        | 06          | Text            |                  |
		| 7         | Lab Test Code        | 06          | Text            | OK               |	
	Then I verify below "Autobuild Table:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt    | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | Specimen          |             | DISABLEDTEXT1   | Disabled | OK               |
      | 3         | Method            |             | DISABLEDTEXT1   | Disabled |                  |
      | 3         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 4         | ResultType        |             | DISABLEDTEXT1   | Disabled |                  |
      | 4         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 5         | NormalizedLabUnit |             | DISABLEDTEXT1   | Disabled |                  |
      | 5         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |
      | 6         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled |                  |
      | 6         | Precision         |             | DISABLEDTEXT1   | Disabled | OK               |
      | 7         | LOINC Code        |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Category          |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Subcategory       |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Specimen          |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Method            |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | ResultType        |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | NormalizedLabUnit |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | Precision         |             | DISABLEDTEXT1   | Disabled |                  |
      | 7         | ConversionFactor  |             | DISABLEDTEXT1   | Disabled | OK               |      
		And I click "Cancel" button on "LabForm1" CRF.

Scenario: T65_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site_Change" from Sites dropdown.
     When I select the patient "01-PAT" from patients table.
     Then I see Patient details page for "01-PAT".

Scenario: T66_Verify the Lab report data before Site Changes
	  When I open form "LabForm1" of event "Visit (Week 2)"	  
	  And I expand row "2" of table "Autobuild Table:"

Scenario: T67_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes	
	When I click "changeHistory.gif" icon of a question "Lab Test Description" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |  

Scenario: T68_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Lab Test Name" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T69_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Lab Test Code" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T70_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "LOINC Code" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 11       | Reason: Initial Entry[Derived] |
	
Scenario: T71_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Category" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | cup1     | Reason: Initial Entry[Derived] |
	
Scenario: T72_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Subcategory" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | subcup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T73_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Method" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | Metcup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T74_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "ResultType" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | Rescup1  | Reason: Initial Entry[Derived] |	
	
Scenario: T75_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "NormalizedLabUnit" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 01       | Reason: Initial Entry[Derived] |
	
Scenario: T76_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question after Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Precision" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | 2        | Reason: Initial Entry[Derived] |	

Scenario: T77_VALUE CHANGE OF CODE ITEM_Verify ItemHistory of a table question before Site Changes
	When I click cancel button in ChangeHistoryModal	
	And I click "changeHistory.gif" icon of a question "Specimen" of table "Autobuild Table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime               | Response | ReasonNotes                    |
	| System (System\System) | speccup1 | Reason: Initial Entry[Derived] |	

Scenario: T78_Change the Site address
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	#When(@"I open site with siteid ""(.*)"" and site name ""(.*)"" from SiteManagement page")]
	And I open site with siteid "01" and site name "Site_Change" from SiteManagement page
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
		
     