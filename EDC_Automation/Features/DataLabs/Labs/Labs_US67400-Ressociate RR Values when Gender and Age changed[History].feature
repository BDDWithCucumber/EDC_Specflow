Feature:Labs_Reassociate RR Values and retain DIct static question data.

US67400_DL: Re-associate Reference Range to a Patient Lab Value (Age & Gender change)_Item History
System shall recalculate Reference ranges for all lab questions on LabForm and History shall be displayed as expected.

Lab Test Questions on LabForm CRF:

1.	Lab Test Name
2.	Test Description
3.	Lab Value- No history -Input fields
4.	Lab (Original) Unit- No History-Input fields
5.	Lab Test Name
6.	Lab Test Code
7.	LOINC Code
8.	Category
9.	Sub Category
10.	Specimen
11.	Method
12.	Result Type
13.	Normal Reference range low 
14.	Normal Reference range high 
15.	Critical Reference range low 
16.	Critical Reference range high
17.	Reference Range Not Applicable
18.	Reference range Id
19.	Out of Normal Range Indicator
20.	Normalized Patient Lab Value
21.	Normalized Lab unit
22.	Normalized Normal Reference range low 
23.	Normalized Normal Reference range high 
24.	Normalized Critical Reference range low 
25.	Normalized Critical Reference range high
26.	Precision
27.	Conversion Factor


@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base1.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header 

Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	Then I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |

Scenario: 05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I click breadcrumb "Site Management"
	
Scenario: 06_Assign testadmin testadmin user to 02-Site
	When I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I click breadcrumb "Site Management"

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
      | 01       |   PAT           | 09/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 11_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 09/14/2019 | Yes           |
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
	 | 09/15/2019 | 03/03/2020 | Male   | >             | 0          | <           | 50       | >                    | 11.99             | <                      | 19.99             | >                      | 1.02                | <                       | 25.71                | 3Unit | False |
	 | 09/15/2019 | 03/03/2020 | Female | >             | 0          | <           | 50       | >                    | 11                | <                      | 18                | >                      | 1.99                | <                       | 20.89                | 3Unit | False |

Scenario: 14_Navigate to site and select patient
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

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
	  | No        | 2         | CRF Lab value				   | 15          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

 Scenario: 17_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 18_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Link            |                  |
		| 2         | Lab Test Description                     | HEM1                | Link            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Link            |                  |
		| 2         | CRF Lab value                            | 15                  | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.
		
Scenario: 19_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Gender:        | Male               | Female         | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 20_View-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And  I expand row "2" of table "Autobuild Table:"     
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.00             | Text            |                  |
		| 2         | Normal Reference Range High              | < 18.00             | Text            |                  |
		| 2         | Critical Reference Range High            | < 20.89             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.99              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.11              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.18              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.02              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.21              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

 Scenario: 21_Checkout-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF. 
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                                  | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                               | Test1         | Link            |                  |
		| 2         | Lab Test Description							  | HEM1          | Text            |                  |
		| 2			| CRF Lab  Unit             					  | 03		      | Link		    |				   |
		| 2			| CRF Lab value		  						      | 15			  | Link		    |				   |
		| 2         | Lab Test Name			                          | HEMOGLOBIN1   | Text            |                  |
		| 2         | Lab Test Code			                          | 1             | Text            |                  |
		| 2         | LOINC Code		                              | 123           | Text            |                  |
		| 2         | Category						                  | RBC1          | Text            |                  |
		| 2         | Subcategory					                  | Serum1        | Text            |                  |
		| 2         | Specimen                                        | Automated1    | Text		    |                  |
		| 2         | Method                                          | Quantitative1 | Text            |                  |
		| 2         | Result Type                                     | g/dl          | Text            |                  |
		| 2         | Normal Reference Range Low					  | > 11.00       | Text            |                  |
		| 2         | Normal Reference Range High                     | < 18.00       | Text            |                  |
		| 2         | Critical Reference Range High                   | < 20.89       | Text            |                  |
		| 2         | Critical Reference Range Low                    | > 1.99        | Text            |                  |
		| 2         | Reference Range ID                              | 1013          | Text            |                  |
		| 2         | Out of Normal Range Indicator                   | No            | Text            |                  |
		| 2         | Normalized Patient Lab Value                    | 0.15          | Text            |                  |
		| 2         | Normalized Lab Unit                             | 3Unit         | Text            |                  |
		| 2         | Normalized Normal Reference Range Low           | > 0.11        | Text            |                  |
		| 2         | Normalized Normal Reference Range High          | < 0.18        | Text            |                  |
		| 2         | Normalized Critical Reference Range Low         | > 0.02        | Text            |                  |
		| 2         | Reference Range Not Applicable                  | No            | Text            |                  |
		| 2         | Normalized Critical Reference Range High        | < 0.21        | Text            |                  |
		| 2         | Precision                                       | 2             | Text            |                  |
		| 2         | Conversion Factor                               | 0.01          | Text            |Cancel Row		   |
		And I click "Cancel" button on "LabForm2" CRF.

#######################################################################################################
#Scenario: 22_Verify Item change history for questions in Lab Form when Reference ranges recalculated:
#	When I expand "Visit (week2)" to select and open "LabForm2" CRF.
#	And  I expand row "2" of table "Autobuild Table:"     
#	Then I verify below "Autobuild Table:" table questions data in the CRF.
#	And I click "changeHistory.gif" icon of a question "Lab Test Name" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#	And I click icon "changeHistory.gif" for the table question "Lab Test Description" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEM1             | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Lab Test Code" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | 1			    | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "LOINC Code" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | 123              | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Category" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | RBC1             | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Subcategory" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | Serum1           | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Specimen" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | Automated1       | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Method" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#
#	| System (System\System)         | Quantitative1    | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#	And I click icon "changeHistory.gif" for the table question "Result Type" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | g/dl             | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#	And I click icon "changeHistory.gif" for the table question "Normal Reference Range High" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | < 18               | Reason: Derived						     |
#	| System (System\System)         | < 19.99            | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Critical Reference Range Low" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | > 1.99      | Reason: Derived						     |
#	| System (System\System)         | > 1.02      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Normal Reference Range Low" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | > 11.00          | Reason: Derived						     |
#	| System (System\System)         | > 11.99           | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Critical Reference Range High" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | < 20.89  | Reason: Derived                |
#	| System (System\System) | < 25.71  | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	##And I click icon "changeHistory.gif" for the table question "Reference Range ID" in CRF
#	#Then I see changehistory details in ChangeHistoryModal
#	#| # | DateTime               | Response    | ReasonNotes |
#	#| # | System (System\System) | HEMOGLOBIN1 | Reason: Derived |
#	#| # | System (System\System) | HEMOGLOBIN1 | Reason: Initial Entry[Derived] |
#	#And I click close button in ChangeHistoryModal
#
#
#	And I click icon "changeHistory.gif" for the table question "Out of Normal Range Indicator" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | No       | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Patient Lab Value" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response    | ReasonNotes                    |
#	| System (System\System) | HEMOGLOBIN1 | Reason: Derived                |
#	| System (System\System) | HEMOGLOBIN1 | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Lab Unit" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Lab Test Name" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Normal Reference Range Low" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Normal Reference Range High" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Critical Reference Range Low" in CRF
#    Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Reference Range Not Applicable" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Critical Reference Range High" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Precision" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Conversion Factor" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
####################################################################################################
	

Scenario: 22_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Gender:                   | Female             | Male           | DCF             |                 | ListBox         |
      | Age at Study Start:       | 28                 | 51             | DCF             |                 | TextBox         |
   	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 


Scenario: 23_View-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And  I expand row "2" of table "Autobuild Table:"     
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Link            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab  Unit                            | 03            | Link            |                  |
		| 2         | CRF Lab value                            | 15            | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1   | Text            |                  |
		| 2         | Lab Test Code                            | 1             | Text            |                  |
		| 2         | LOINC Code                               | 123           | Text            |                  |
		| 2         | Category                                 | RBC1          | Text            |                  |
		| 2         | Subcategory                              | Serum1        | Text            |                  |
		| 2         | Specimen                                 | Automated1    | Text            |                  |
		| 2         | Method                                   | Quantitative1 | Text            |                  |
		| 2         | Result Type                              | g/dl          | Text            |                  |
		| 2         | Normal Reference Range Low               | Blank         | Text            |                  |
		| 2         | Normal Reference Range High              | Blank         | Text            |                  |
		| 2         | Critical Reference Range High            | Blank         | Text            |                  |
		| 2         | Critical Reference Range Low             | Blank         | Text            |                  |
		| 2         | Reference Range ID                       | Blank         | Text            |                  |
		| 2         | Out of Normal Range Indicator            | Blank         | Text            |                  |
		| 2         | Normalized Patient Lab Value             | Blank         | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit         | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | Blank         | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | Blank         | Text            |                  |
		| 2         | Reference Range Not Applicable           | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range High | Blank         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | Blank         | Text            | Ok               |
		And I click "Cancel" button on "LabForm2" CRF.
		

 Scenario: 24_Checkout-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF. 
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Link            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab  Unit                            | 03            | Link            |                  |
		| 2         | CRF Lab value                            | 15            | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1   | Text            |                  |
		| 2         | Lab Test Code                            | 1             | Text            |                  |
		| 2         | LOINC Code                               | 123           | Text            |                  |
		| 2         | Category                                 | RBC1          | Text            |                  |
		| 2         | Subcategory                              | Serum1        | Text            |                  |
		| 2         | Specimen                                 | Automated1    | Text            |                  |
		| 2         | Method                                   | Quantitative1 | Text            |                  |
		| 2         | Result Type                              | g/dl          | Text            |                  |
		| 2         | Normal Reference Range Low               | Blank         | Text            |                  |
		| 2         | Normal Reference Range High              | Blank         | Text            |                  |
		| 2         | Critical Reference Range High            | Blank         | Text            |                  |
		| 2         | Critical Reference Range Low             | Blank         | Text            |                  |
		| 2         | Reference Range ID                       | Blank         | Text            |                  |
		| 2         | Out of Normal Range Indicator            | Blank         | Text            |                  |
		| 2         | Normalized Patient Lab Value             | Blank         | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit         | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | Blank         | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | Blank         | Text            |                  |
		| 2         | Reference Range Not Applicable           | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range High | Blank         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | Blank         | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

		#History

#Scenario: 25_Verify Item change history for questions in Lab Form when Reference ranges recalculated:
#	When I expand "Visit (week2)" to select and open "LabForm2" CRF.
#	And  I expand row "2" of table "Autobuild Table:"     
#	Then I verify below "Autobuild Table:" table questions data in the CRF.
#	And I click "changeHistory.gif" icon of a question "Lab Test Name" of table "Autobuild Table:"
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes     |
#	| System (System\System) | Blank    | Reason: Derived |
#	| System (System\System) | HEMOGLOBIN1 | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#	And I click icon "changeHistory.gif" for the table question "Lab Test Description" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | HEM1     | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Lab Test Code" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | 1        | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "LOINC Code" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | 123      | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Category" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | RBC1     | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Subcategory" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | Serum1   | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Specimen" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response   | ReasonNotes                    |
#	| System (System\System) | Blank      | Reason: Derived                |
#	| System (System\System) | Automated1 | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Method" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response      | ReasonNotes                    |
#	| System (System\System) | Blank         | Reason: Derived                |
#	| System (System\System) | Quantitative1 | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#	And I click icon "changeHistory.gif" for the table question "Result Type" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | g/dl     | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#	And I click icon "changeHistory.gif" for the table question "Normal Reference Range High" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | < 18     | Reason: Derived                |
#	| System (System\System) | < 19.99  | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Critical Reference Range Low" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | > 1.99   | Reason: Derived                |
#	| System (System\System) | > 1.02   | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Normal Reference Range Low" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | > 11.00  | Reason: Derived                |
#	| System (System\System) | > 11.99  | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Critical Reference Range High" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | < 20.89  | Reason: Derived                |
#	| System (System\System) | < 25.71  | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#	##And I click icon "changeHistory.gif" for the table question "Reference Range ID" in CRF
#	#Then I see changehistory details in ChangeHistoryModal
#	#| # | #                      | #                      | DateTime        | Response                       | ReasonNotes |
#	#| # | System (System\System) | Blank                  | Reason: Derived |
#	#| # | #                      | System (System\System) | HEMOGLOBIN1     | Reason: Derived                |
#	#| # | #                      | System (System\System) | HEMOGLOBIN1     | Reason: Initial Entry[Derived] |
#	#And I click close button in ChangeHistoryModal
#
#
#	And I click icon "changeHistory.gif" for the table question "Out of Normal Range Indicator" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response | ReasonNotes                    |
#	| System (System\System) | Blank    | Reason: Derived                |
#	| System (System\System) | No       | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Patient Lab Value" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime               | Response    | ReasonNotes                    |
#	| System (System\System) | HEMOGLOBIN1 | Reason: Derived                |
#	| System (System\System) | HEMOGLOBIN1 | Reason: Initial Entry[Derived] |
#	And I click close button in ChangeHistoryModal
#
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Lab Unit" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Lab Test Name" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Normal Reference Range Low" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Normal Reference Range High" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Critical Reference Range Low" in CRF
#    Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Reference Range Not Applicable" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Normalized Critical Reference Range High" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Precision" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal
#
#	And I click icon "changeHistory.gif" for the table question "Conversion Factor" in CRF
#	Then I see changehistory details in ChangeHistoryModal
#	| DateTime                       | Response         | ReasonNotes                                |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Derived						     |
#	| System (System\System)         | HEMOGLOBIN1      | Reason: Initial Entry[Derived]		     |
#	And I click close button in ChangeHistoryModal


Scenario: 25_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt            | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Age Units at Study Start: | Years              | Months         | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 


Scenario: 26_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 27_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Link            |                  |
		| 2         | Lab Test Description                     | HEM1                | Link            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Link            |                  |
		| 2         | CRF Lab value                            | 15                  | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.


#Recalculate Reference Range values  with Gender, Age, Age Unit changes for DOB as Day, Month and Year.

Scenario: 28_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 29_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Base1_DayMonthYear.zip" with study label "Questions"
    Then I see study label "Test4500_CodleistLinkages_Base" in header

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

#Add RR records in RR screen
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
      Then I see Patient details page for "01-PAT".

Scenario: 35_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      When I click "Checkout" button on "Demographics RTSM" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | AnswerValue | AnswerFieldType |
      | Gender:        | Male        | ListBox         |
      | Day:           | 28          | TextBox         |
      | Month          | JAN         | ListBox         |
      | Year           | 2000        | ListBox         |
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
	  | No        | 2         | CRF Lab value				   | 15          | TextBox         |                  |
	  | No        | 2         | CRF Lab Unit                   | 03          | LISTBOX         | Save & Close Row |
	  And I click on "Save & Close" button on "LabForm2" CRF.
	  Then The CRF with data is saved and checked-in successfully.

 Scenario: 37_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 38_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Link            |                  |
		| 2         | Lab Test Description                     | HEM1                | Link            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Link            |                  |
		| 2         | CRF Lab value                            | 15                  | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 39_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Year:          | 2000               | 1945           | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully.

Scenario: 40_View-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And  I expand row "2" of table "Autobuild Table:"     
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
			| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
			| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
			| 2         | Lab Test Description                     | HEM1          | Text            |                  |
			| 2         | CRF Lab Unit                             | 03            | Text            |                  |
			| 2         | CRF Lab value                            | 15            | Text            |                  |
			| 2         | Lab Test Name                            | HEMOGLOBIN1   | Text            |                  |
			| 2         | Lab Test Code                            | 1             | Text            |                  |
			| 2         | LOINC Code                               | 123           | Text            |                  |
			| 2         | Category                                 | RBC1          | Text            |                  |
			| 2         | Subcategory                              | Serum1        | Text            |                  |
			| 2         | Specimen                                 | Automated1    | Text            |                  |
			| 2         | Method                                   | Quantitative1 | Text            |                  |
			| 2         | Result Type                              | g/dl          | Text            |                  |
			| 2         | Normal Reference Range Low               | Blank         | Text            |                  |
			| 2         | Normal Reference Range High              | Blank         | Text            |                  |
			| 2         | Critical Reference Range High            | BLank         | Text            |                  |
			| 2         | Critical Reference Range Low             | Blank         | Text            |                  |
			| 2         | Reference Range ID                       | Blank         | Text            |                  |
			| 2         | Out of Normal Range Indicator            | Blank         | Text            |                  |
			| 2         | Normalized Patient Lab Value             | Blank         | Text            |                  |
			| 2         | Normalized Lab Unit                      | 3Unit         | Text            |                  |
			| 2         | Normalized Normal Reference Range Low    | Blank         | Text            |                  |
			| 2         | Normalized Normal Reference Range High   | Blank         | Text            |                  |
			| 2         | Normalized Critical Reference Range Low  | Blank         | Text            |                  |
			| 2         | Reference Range Not Applicable           | Blank         | Text            |                  |
			| 2         | Normalized Critical Reference Range High | Blank         | Text            |                  |
			| 2         | Precision                                | 2             | Text            |                  |
			| 2         | Conversion Factor                        | Blank         | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

 Scenario: 41_Checkout-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF. 
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15            | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1   | Text            |                  |
		| 2         | Lab Test Code                            | 1             | Text            |                  |
		| 2         | LOINC Code                               | 123           | Text            |                  |
		| 2         | Category                                 | RBC1          | Text            |                  |
		| 2         | Subcategory                              | Serum1        | Text            |                  |
		| 2         | Specimen                                 | Automated1    | Text            |                  |
		| 2         | Method                                   | Quantitative1 | Text            |                  |
		| 2         | Result Type                              | g/dl          | Text            |                  |
		| 2         | Normal Reference Range Low               | Blank         | Text            |                  |
		| 2         | Normal Reference Range High              | Blank         | Text            |                  |
		| 2         | Critical Reference Range High            | BLank         | Text            |                  |
		| 2         | Critical Reference Range Low             | Blank         | Text            |                  |
		| 2         | Reference Range ID                       | Blank         | Text            |                  |
		| 2         | Out of Normal Range Indicator            | Blank         | Text            |                  |
		| 2         | Normalized Patient Lab Value             | Blank         | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit         | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | Blank         | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | Blank         | Text            |                  |
		| 2         | Reference Range Not Applicable           | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range High | Blank         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | Blank         | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 42_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Day:           | 28                 |                | DCF             |                 | TextBox         |
      | Month:         | JAN                | 05             | DCF             |                 | ListBox         |
      | Year:          | 1945               | 1990           | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 43_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 44_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Link            |                  |
		| 2         | Lab Test Description                     | HEM1                | Link            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Link            |                  |
		| 2         | CRF Lab value                            | 15                  | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 45_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Day:           | 28                 | 01             | DCF             |                 | TextBox         |
      | Month:         | 05                 |                | DCF             |                 | ListBox         |
       And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 46_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 47_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Day:           | 01                 |                | DCF             |                 | TextBox         |
      | Year:          | 1990               |                | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 48_View-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And  I expand row "2" of table "Autobuild Table:"     
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15            | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1   | Text            |                  |
		| 2         | Lab Test Code                            | 1             | Text            |                  |
		| 2         | LOINC Code                               | 123           | Text            |                  |
		| 2         | Category                                 | RBC1          | Text            |                  |
		| 2         | Subcategory                              | Serum1        | Text            |                  |
		| 2         | Specimen                                 | Automated1    | Text            |                  |
		| 2         | Method                                   | Quantitative1 | Text            |                  |
		| 2         | Result Type                              | g/dl          | Text            |                  |
		| 2         | Normal Reference Range Low               | Blank         | Text            |                  |
		| 2         | Normal Reference Range High              | Blank         | Text            |                  |
		| 2         | Critical Reference Range High            | Blank         | Text            |                  |
		| 2         | Critical Reference Range Low             | Blank         | Text            |                  |
		| 2         | Reference Range ID                       | Blank         | Text            |                  |
		| 2         | Out of Normal Range Indicator            | Blank         | Text            |                  |
		| 2         | Normalized Patient Lab Value             | Blank         | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit         | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | Blank         | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | Blank         | Text            |                  |
		| 2         | Reference Range Not Applicable           | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range High | Blank         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | Blank         | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.

 Scenario: 49_Checkout-Verify the Reference Range values reassociated values for LabTest in LabForm2 when Gender changed from Male to Female.
	  When I expand "Visit (week2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF. 
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue   | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1         | Text            |                  |
		| 2         | Lab Test Description                     | HEM1          | Text            |                  |
		| 2         | CRF Lab Unit                             | 03            | Text            |                  |
		| 2         | CRF Lab value                            | 15            | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1   | Text            |                  |
		| 2         | Lab Test Code                            | 1             | Text            |                  |
		| 2         | LOINC Code                               | 123           | Text            |                  |
		| 2         | Category                                 | RBC1          | Text            |                  |
		| 2         | Subcategory                              | Serum1        | Text            |                  |
		| 2         | Specimen                                 | Automated1    | Text            |                  |
		| 2         | Method                                   | Quantitative1 | Text            |                  |
		| 2         | Result Type                              | g/dl          | Text            |                  |
		| 2         | Normal Reference Range Low               | Blank         | Text            |                  |
		| 2         | Normal Reference Range High              | Blank         | Text            |                  |
		| 2         | Critical Reference Range High            | Blank         | Text            |                  |
		| 2         | Critical Reference Range Low             | Blank         | Text            |                  |
		| 2         | Reference Range ID                       | Blank         | Text            |                  |
		| 2         | Out of Normal Range Indicator            | Blank         | Text            |                  |
		| 2         | Normalized Patient Lab Value             | Blank         | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit         | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | Blank         | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | Blank         | Text            |                  |
		| 2         | Reference Range Not Applicable           | Blank         | Text            |                  |
		| 2         | Normalized Critical Reference Range High | Blank         | Text            |                  |
		| 2         | Precision                                | 2             | Text            |                  |
		| 2         | Conversion Factor                        | Blank         | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 50_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Year:          |                    | 1990           | DCF             |                 | ListBox         |
	  And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 51_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I click "Checkout" button on "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Link            |                  |
		| 2         | Lab Test Description                     | HEM1                | Link            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Link            |                  |
		| 2         | CRF Lab value                            | 15                  | Link            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | Cancel Row       |
		And I click "Cancel" button on "LabForm2" CRF.

Scenario: 52_Expand the Event1 and open the demographics form to update the data.
	  When I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
      And I click "Checkout" button on "Demographics RTSM" CRF.
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AdditionalNotes | AnswerFieldType |
      | Day:           | 28                 | 01             | DCF             |                 | TextBox         |
      | Month:         | 05                 |                | DCF             |                 | ListBox         |
       And I click on "Save & Close" button on "Demographics RTSM" CRF.
	  Then The CRF with data is saved and checked-in successfully. 

Scenario: 53_Verify the Reference Range values for LabTest in LabForm2.
	  When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	  And I expand row "2" of table "Autobuild Table:"      
	  Then I verify below "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue         | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1               | Text            |                  |
		| 2         | Lab Test Description                     | HEM1                | Text            |                  |
		| 2         | CRF Lab Unit                             | 03                  | Text            |                  |
		| 2         | CRF Lab value                            | 15                  | Text            |                  |
		| 2         | Lab Test Name                            | HEMOGLOBIN1         | Text            |                  |
		| 2         | Lab Test Code                            | 1                   | Text            |                  |
		| 2         | LOINC Code                               | 123                 | Text            |                  |
		| 2         | Category                                 | RBC1                | Text            |                  |
		| 2         | Subcategory                              | Serum1              | Text            |                  |
		| 2         | Specimen                                 | Automated1          | Text            |                  |
		| 2         | Method                                   | Quantitative1       | Text            |                  |
		| 2         | Result Type                              | g/dl                | Text            |                  |
		| 2         | Normal Reference Range Low               | > 11.99             | Text            |                  |
		| 2         | Normal Reference Range High              | < 19.99             | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71             | Text            |                  |
		| 2         | Critical Reference Range Low             | > 1.02              | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1} | Text            |                  |
		| 2         | Out of Normal Range Indicator            | No                  | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 0.15                | Text            |                  |
		| 2         | Normalized Lab Unit                      | 3Unit               | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 0.12              | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 0.20              | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 0.01              | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                  | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 0.26              | Text            |                  |
		| 2         | Precision                                | 2                   | Text            |                  |
		| 2         | Conversion Factor                        | 0.01                | Text            | OK               |
		And I click "Cancel" button on "LabForm2" CRF.
















































































































































































































































































