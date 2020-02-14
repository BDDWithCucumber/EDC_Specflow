Feature: Labs_US67399_DL_Lab_Form_changesfromMRRScreen
	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Import_US61472_Base1.zip" with study label "V1"
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

#Scenario: 11_Select and enroll patient 01-PAT.
#      Given I navigate to "Patients" tab from main menu.
#      And I select the site "01-Site" from Sites dropdown.
#      And I select the patient "01-PAT" from patients table.
#      When I enroll the patient "01-PAT" with below data.
#      | EnrollID | EnrollDate | EntryComplete |
#      | 01       | 06/14/2019 | Yes           |
#      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 11_Add a new lab test reference range record under Lab01 and Test 01
	 Given I navigate to "Local Labs" tab from main menu.	
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	 | 02/03/2019 | 03/03/2022 | Male   | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 2.41                | <                       | 25.71                | 01   | Yes |	
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |
	

Scenario: 12_Navigate to site and select patient 
	Given I navigate to "Patients" tab from main menu.
     When I select the site "01-Site" from Sites dropdown.     
      And I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Enter data on Demographics form
Scenario: 13_Expand the Visit (Screening) and open the demographics form to update the data
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | AnswerValue | AnswerFieldType |
      | Gender:                   | Male        | ListBox         |
      | Age at Study Start:       | 31          | TextBox         |
      | Age Units at Study Start: | Years       | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

#Enter data on Lab form


#Scenario: 15_Verify the Lab report data
Scenario: 14_Expand the Visit (Week2) event and open the LabForm1 form and update the data
	  When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
      And I click "Checkout" button on "LabForm1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt      | AnswerValue | AnswerFieldType |
      | Lab ID              | Lab01 (L01) | ListBox         |
      | CRF Collection Date | 02/28/2019  | TextBox         |
	  And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	  | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	  | No        | 2         | CRF Lab value  | 16          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit   | 01          | ListBox         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm1" CRF.	  
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 15_Verify the Lab report data
		When I collapse event "Visit (Week 2)" in PatientPortal	 	 
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  And I expand row "2" of table "Autobuild Table:"
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	  	 
		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRFLabTestName                       | Test1       | Text            |                  |
		| 2         | LabTestDescription                   | 01          | Text            |                  |
		| 2         | CRF Lab Unit                         | 01          | Text            |                  |
		| 2         | CRF Lab value                        | 16          | Text            |                  |
		| 2         | LabTestName                          | 01          | Text            |                  |
		| 2         | LabTestCode                          | 01          | Text            |                  |
		| 2         | LOINCCode                            | 11          | Text            |                  |
		| 2         | Category                             | cup1        | Text            |                  |
		| 2         | Subcategory                          | subcup1     | Text            |                  |
		| 2         | Specimen                             | speccup1    | Text            |                  |
		| 2         | Method                               | Metcup1     | Text            |                  |
		| 2         | ResultType                           | Rescup1     | Text            |                  |
		| 2         | NormalReferenceRangeHigh             | < 15.00     | Text            |                  |
		| 2         | CriticalReferenceRangeLow            | > 2.41      | Text            |                  |
		| 2         | NormalReferenceRangeLow              | > 3.00      | Text            |                  |
		| 2         | CriticalReferenceRangeHigh           | < 25.71     | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | Yes         | Text            |                  |
		| 2         | NormalizedPatientLabValue            | 144.00      | Text            |                  |
		| 2         | NormalizedLabUnit                    | 01          | Text            |                  |
		| 2         | NormalizedReferenceRangeLow          | > 27.00     | Text            |                  |
		| 2         | NormalizedNormalReferenceRangeHigh   | < 135.00    | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeLow  | > 21.69     | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | Yes         | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeHigh | < 231.39    | Text            |                  |
		| 2         | Precision                            | 2           | Text            |                  |
		| 2         | ConversionFactor                     | 9           | Text            | OK               |
		#| 2         | ReferenceRangeID                     | {ReferenceRangeID1} | Text            |                  |

Scenario: 16_Update the reference Range on Labs
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click on "Edit" icon for the reference range "{ReferenceRangeID1}" in ReferenceRangesPage.
    And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate         | EndDate            | Gender              | FromAgeSelect        | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 02/03/2019        | 03/03/2022         | Male                | >                    | 20         | <           | 35       | >                    | 3.15              | <                     | 15.15              | >                      | 2.42                | <                       | 25.72                | 01   | Yes |	
	And I Click the save button in ReferenceRangesPage
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |
	And a "Lab test reference range updated successfully" message should be displayed in ReferenceRangesPage

Scenario: 17_Navigate to the Patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
	  When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT". 

Scenario: 18_Verify the Lab report data
	When I collapse event "Visit (Week 2)" in PatientPortal	 	 
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.	  	  
	  And I expand row "2" of table "Autobuild Table:"	     
	   Then I verify below "Autobuild Table:" table questions data in the CRF.	  	  	 
		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRFLabTestName                       | Test1       | Text            |                  |
		| 2         | LabTestDescription                   | 01          | Text            |                  |
		| 2         | CRF Lab Unit                         | 01          | Text            |                  |
		| 2         | CRF Lab value                        | 16          | Text            |                  |
		| 2         | LabTestName                          | 01          | Text            |                  |
		| 2         | LabTestCode                          | 01          | Text            |                  |
		| 2         | LOINCCode                            | 11          | Text            |                  |
		| 2         | Category                             | cup1        | Text            |                  |
		| 2         | Subcategory                          | subcup1     | Text            |                  |
		| 2         | Specimen                             | speccup1    | Text            |                  |
		| 2         | Method                               | Metcup1     | Text            |                  |
		| 2         | ResultType                           | Rescup1     | Text            |                  |
		| 2         | NormalReferenceRangeHigh             | < 15.15     | Text            |                  |
		| 2         | CriticalReferenceRangeLow            | > 2.42      | Text            |                  |
		| 2         | NormalReferenceRangeLow              | > 3.15      | Text            |                  |
		| 2         | CriticalReferenceRangeHigh           | < 25.72     | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | Yes         | Text            |                  |
		| 2         | NormalizedPatientLabValue            | 144.00      | Text            |                  |
		| 2         | NormalizedLabUnit                    | 01          | Text            |                  |
		| 2         | NormalizedReferenceRangeLow          | > 28.35     | Text            |                  |
		| 2         | NormalizedNormalReferenceRangeHigh   | < 136.35    | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeLow  | > 21.78     | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | Yes         | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeHigh | < 231.48    | Text            |                  |
		| 2         | Precision                            | 2           | Text            |                  |
		| 2         | ConversionFactor                     | 9           | Text            | OK               |
		#| 2         | ReferenceRangeID                     | {ReferenceRangeID1} | Text            |                  |

Scenario: 19_Update the reference Range on Labs
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page	
	And I click on "Edit" icon for the reference range "{ReferenceRangeID1}" in ReferenceRangesPage.
    And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 02/03/2019 | 03/03/2022 | Male   | >             | 0          | <           | 1        | >                    | 3.15              | <                     | 15.15              | >                      | 2.42                | <                       | 25.72                | 01   | Yes |
	And I Click the save button in ReferenceRangesPage
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |	
	And a "Lab test reference range updated successfully" message should be displayed in ReferenceRangesPage

Scenario: 20_Navigate to the Patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
	  When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT". 

Scenario: 21_Verify the Lab report data
      When I collapse event "Visit (Week 2)" in PatientPortal	 	 
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.	 
	  And I expand row "2" of table "Autobuild Table:"	     
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	  	 
		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRFLabTestName                       | Test1       | Text            |                  |
		| 2         | LabTestDescription                   | 01          | Text            |                  |
		| 2         | CRF Lab Unit                         | 01          | Text            |                  |
		| 2         | CRF Lab value                        | 16          | Text            |                  |
		| 2         | LabTestName                          | 01          | Text            |                  |
		| 2         | LabTestCode                          | 01          | Text            |                  |
		| 2         | LOINCCode                            | 11          | Text            |                  |
		| 2         | Category                             | cup1        | Text            |                  |
		| 2         | Subcategory                          | subcup1     | Text            |                  |
		| 2         | Specimen                             | speccup1    | Text            |                  |
		| 2         | Method                               | Metcup1     | Text            |                  |
		| 2         | ResultType                           | Rescup1     | Text            |                  |
		| 2         | NormalReferenceRangeHigh             | [Blank]     | Text            |                  |
		| 2         | CriticalReferenceRangeLow            | [Blank]     | Text            |                  |
		| 2         | NormalReferenceRangeLow              | [Blank]     | Text            |                  |
		| 2         | CriticalReferenceRangeHigh           | [Blank]     | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | [Blank]     | Text            |                  |
		| 2         | NormalizedPatientLabValue            | [Blank]     | Text            |                  |
		| 2         | NormalizedLabUnit                    | 01          | Text            |                  |
		| 2         | NormalizedReferenceRangeLow          | [Blank]     | Text            |                  |
		| 2         | NormalizedNormalReferenceRangeHigh   | [Blank]     | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeLow  | [Blank]     | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | [Blank]     | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeHigh | [Blank]     | Text            |                  |
		| 2         | Precision                            | 2           | Text            |                  |
		| 2         | ConversionFactor                     | [Blank]     | Text            | OK               |
		#| 2         | ReferenceRangeID                     | {ReferenceRangeID1} | Text            |                  |

Scenario: 22_Update the reference Range on Labs
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click on "Edit" icon for the reference range "{ReferenceRangeID1}" in ReferenceRangesPage.
    And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA  |
	| 02/03/2017 | 03/03/2018 | Female   | >             | 0          | <           | 1        | >                    | 3.15              | <                     | 15.15              | >                      | 2.42                | <                       | 25.72                | 01   | Yes |
	And I Click the save button in ReferenceRangesPage
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |	
	And a "Lab test reference range updated successfully" message should be displayed in ReferenceRangesPage

Scenario: 23_Navigate to the Patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
	  When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT". 

Scenario: 24_Verify the Lab report data
      When I collapse event "Visit (Week 2)" in PatientPortal	 	 
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.	 
	  And I expand row "2" of table "Autobuild Table:"	     
	  Then I verify below "Autobuild Table:" table questions data in the CRF.	  	  	 
		| RowNumber | QuestionPrompt                       | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRFLabTestName                       | Test1       | Text            |                  |
		| 2         | LabTestDescription                   | 01          | Text            |                  |
		| 2         | CRF Lab Unit                         | 01          | Text            |                  |
		| 2         | CRF Lab value                        | 16          | Text            |                  |
		| 2         | LabTestName                          | 01          | Text            |                  |
		| 2         | LabTestCode                          | 01          | Text            |                  |
		| 2         | LOINCCode                            | 11          | Text            |                  |
		| 2         | Category                             | cup1        | Text            |                  |
		| 2         | Subcategory                          | subcup1     | Text            |                  |
		| 2         | Specimen                             | speccup1    | Text            |                  |
		| 2         | Method                               | Metcup1     | Text            |                  |
		| 2         | ResultType                           | Rescup1     | Text            |                  |
		| 2         | NormalReferenceRangeHigh             | [Blank]     | Text            |                  |
		| 2         | CriticalReferenceRangeLow            | [Blank]     | Text            |                  |
		| 2         | NormalReferenceRangeLow              | [Blank]     | Text            |                  |
		| 2         | CriticalReferenceRangeHigh           | [Blank]     | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | [Blank]     | Text            |                  |
		| 2         | NormalizedPatientLabValue            | [Blank]     | Text            |                  |
		| 2         | NormalizedLabUnit                    | 01          | Text            |                  |
		| 2         | NormalizedReferenceRangeLow          | [Blank]     | Text            |                  |
		| 2         | NormalizedNormalReferenceRangeHigh   | [Blank]     | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeLow  | [Blank]     | Text            |                  |
		| 2         | ReferenceRangeNotApplicable          | [Blank]     | Text            |                  |
		| 2         | NormalizedCriticalReferenceRangeHigh | [Blank]     | Text            |                  |
		| 2         | Precision                            | 2           | Text            |                  |
		| 2         | ConversionFactor                     | [Blank]     | Text            | OK               |
			#| 2         | ReferenceRangeID                     | {ReferenceRangeID1} | Text            |                  |