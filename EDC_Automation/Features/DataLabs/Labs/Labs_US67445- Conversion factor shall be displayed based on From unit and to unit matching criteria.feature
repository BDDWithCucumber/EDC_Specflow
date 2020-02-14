Feature: Labs_Lab Value and Reference Ranges shall not be normalized  when standard unit not matching with the collection unit.

#Userstory: US64973
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/314617476576
#Author:Sirisha Gorrumuchu
#Copyright © 2018 PAREXEL International

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base1.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header.

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
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 12_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 13_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 14_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details pag/e for "01-PAT".

#Publish Study which has Collection unit and Standard Unit defined.
#Conversion Factor is  defined in Dictionary"	
#Test Tab- Standard Unit-2 Unit	
#COnversion Factor- From Unit-3 Unit	
#To Unit-2 Unit	
#Conversion Facrtor- 0.01.

Scenario: 15_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 16_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 17_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12      | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20      | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26      | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.01        | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 18_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12      | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20      | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26      | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.01        | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

#Publish Study which has Collection unit and Standard Unit defined.
#Conversion Factor is  defined in Dictionary"	
#Test Tab- Standard Unit-3 Unit	
#COnversion Factor- From Unit-3 Unit	
#To Unit-3 Unit	
#Conversion Facrtor- Blank.

Scenario: 19_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base2.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header.

Scenario: 20_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 21_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 22_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 23_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 24_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details pag/e for "01-PAT".

Scenario: 25_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 26_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 27_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 15.67       | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 11.99     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 19.99     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 1.02      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71     | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 1           | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 28_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 15.67       | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 11.99     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 19.99     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 1.02      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71     | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 1           | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.


#Publish Study which has Collection unit and Standard Unit defined.
#Conversion Factor is  defined in Dictionary"	
#Test Tab- Standard Unit-3 Unit	
#COnversion Factor- From Unit-3 Unit	
#To Unit-3 Unit	
#Conversion Facrtor- 0.02.
Scenario: 29_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base3.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header.

Scenario: 30_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 31_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 32_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 33_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 34_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details pag/e for "01-PAT".

Scenario: 35_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 36_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 37_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.31        | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.24      | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.39      | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.02      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.51      | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.02        | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 38 I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit       | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.24      | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.39      | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > .02       | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.51      | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.02        | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.


#Publish Study which has Collection unit and Standard Unit defined.
#Conversion Factor is  defined in Dictionary"	
#Test Tab- Standard Unit-3 Unit	
#COnversion Factor- From Unit-3 Unit	
#To Unit-3 Unit	
#Conversion Factor- 1.

Scenario: 39_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base4.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header.

Scenario: 40_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 41_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 42_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 43_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 44_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details pag/e for "01-PAT".

Scenario: 45_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 46_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 47_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 15.67        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 11.99     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 19.99     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 1.02      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71     | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 1           | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 48_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 15.67      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 11.99     | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 19.99     | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 1.02      | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71     | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 1           | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.


#Publish Study which has Collection unit and Standard Unit defined.
#Conversion Factor is  defined in Dictionary"	
#Test Tab- Standard Unit-2 Unit	
#Conversion Factor- From Unit-3 Unit	
#To Unit-3 Unit	
#Conversion Factor- 1.

Scenario: 49_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base5.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header.

Scenario: 50_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 51_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 52_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 53_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 54_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details pag/e for "01-PAT".

Scenario: 55_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 56_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/25/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 57_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             |             | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    |             | Text            |                  |
		| 2         | Normalized Normal Reference Range High   |             | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  |             | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High |             | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 1           | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 58_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             |             | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    |             | Text            |                  |
		| 2         | Normalized Normal Reference Range High   |             | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  |             | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High |             | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 1           | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

#Publish Study which has Collection unit and Standard Unit defined.
#Conversion Factor is  defined in Dictionary"	
#Test Tab- Standard Unit-2 Unit	
#Conversion Factor- From Unit-3 Unit	
#To Unit-2 Unit	
#Conversion Factor- Blank.

Scenario: 59_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base6.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header.

Scenario: 60_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 61_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 62_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 63_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 64_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details pag/e for "01-PAT".

Scenario: 65_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 66_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 67_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             |             | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    |             | Text            |                  |
		| 2         | Normalized Normal Reference Range High   |             | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  |             | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High |             | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        |             | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 68_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             |             | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    |             | Text            |                  |
		| 2         | Normalized Normal Reference Range High   |             | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  |             | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High |             | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        |             | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.


#Publish Study which has Collection unit and Standard Unit defined.
#Conversion Factor is  defined in Dictionary"	
#Test Tab- Standard Unit-2 Unit	
#Conversion Factor- From Unit-3 Unit	
#To Unit-4 Unit	
#Conversion Facrtor- 0.05.

Scenario: 69_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base7.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header.

Scenario: 70_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 71_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 72_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 73_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 74_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details pag/e for "01-PAT".

Scenario: 75_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 76_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 77_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             |             | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    |             | Text            |                  |
		| 2         | Normalized Normal Reference Range High   |             | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  |             | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High |             | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.05        | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 78_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      | 2Unit       | Text            |                  |
		| 2         | Normalized Patient Lab Value             |             | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    |             | Text            |                  |
		| 2         | Normalized Normal Reference Range High   |             | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  |             | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High |             | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.05        | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.




#Publish Study which has Collection unit and Standard Unit defined.
#Conversion Factor is  defined in Dictionary"	
#Test Tab- Standard Unit-Blank	
#Conversion Factor- From Unit-3 Unit	
#To Unit-3Unit
#Conversion Factor- 0.04.

Scenario: 89_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base9.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header.

Scenario: 90_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 91_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/14/2019 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 92_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

##Add RR records in RR screen
Scenario: 93_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "HEMOGLOBIN1" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  | NA    |
	 | 04/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 05/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 94_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details pag/e for "01-PAT".

Scenario: 95_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 28          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 96_Expand the Visit (week2) event and open the LabForm2 form and update the data.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
      And I click "Checkout" button on "LabForm2" CRF. 
      And I enter below flat questions data in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType |
      | Lab ID                        | Lab01 (L01) | ListBox         |
      | CRF Collection Date           | 06/10/2019  | TextBox         |
	  And I expand row "2" of table "Autobuild Table:"    
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value				   | 15.6678     | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 97_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Text            |                  |
		| 2         | CRF Lab value                            | 15.6678     | Text            |                  |
		| 2         | Normalized Lab Unit                      |             | Text            |                  |
		| 2         | Normalized Patient Lab Value             |             | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    |             | Text            |                  |
		| 2         | Normalized Normal Reference Range High   |             | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  |             | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High |             | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.04        | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
	
Scenario: 98_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1       | Text            |                  |
		| 2         | Lab Test Description                     | HEM1        | Text            |                  |
		| 2         | CRF Lab Unit                             | 03          | Link            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15        | Text            |                  |
		| 2         | Normalized Lab Unit                      |             | Text            |                  |
		| 2         | Normalized Patient Lab Value             |             | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    |             | Text            |                  |
		| 2         | Normalized Normal Reference Range High   |             | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  |             | Text            |                  |
		| 2         | Reference Range Not Applicable           | No          | Text            |                  |
		| 2         | Normalized Critical Reference Range High |             | Text            |                  |
		| 2         | Precision                                | 2           | Text            |                  |
		| 2         | Conversion Factor                        | 0.04        | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 100_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page