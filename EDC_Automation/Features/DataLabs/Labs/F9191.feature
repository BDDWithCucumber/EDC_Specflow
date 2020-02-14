Feature: F9191Normalization & Refresh of Lab data 
A manual process should be implemented to refresh and normalize lab data.

	# login into the application
Scenario: 01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

	# Delete the study
Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

	#Upload the study
Scenario: 03_Upload and publish the study.
	When I click breadcrumb "Study Management"
	And I upload a study "TestLabs_Dictionary.zip" with study label "TestLabs_Data"
	Then I see study label "TestLabs_Data" in header 

	# Adding Sites and Assigning user to study
Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	Then I see site "01-Site" in SiteManagementPage
	And I see site "02-Site" in SiteManagementPage
            
Scenario: 05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: 06_Assign testadmin testadmin user to 02-Site
	When I click breadcrumb "Site Management"
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "02-Site"

#Adding Labs
Scenario: 07_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |

#Assosiating Labs to sites
Scenario: 08_Associate Labs L01 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
            
Scenario: 09_Associate Labs L01 for 02-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
			| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
			| L01   | Lab01          | PFIZER  | RD         | Active           |

Scenario: 10_Navigate to Patients tab and select a Site1 and add patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

Scenario: 11_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: 12_Expand the Visit (Screening) event and open the Demographics RTSM form and submit the form data.
	Given I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	When I click "Checkout" button on "Demographics RTSM" CRF.      
	And I enter below flat questions data in the CRF.
	| QuestionPrompt            | AnswerValue | AnswerFieldType |
	| Date of Birth:            | 08/09/1990  | TextBox         |
	| Gender:                   | Male        | ListBox         |
	| Age at Study Start:       | 28          | TextBox         |
	| Age Units at Study Start: | Years       | ListBox         |
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 13_Expand the Visit (Week 2) event and open the LabForm1 form and submit the form data.
	When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
			| QuestionPrompt      | AnswerValue | AnswerFieldType |
			| Lab ID              | Lab01 (L01) | ListBox         |
			| CRF Collection Date | 11/12/2019  | TextBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.
Scenario: 14_Checkout the CRF LabForm1 and Select the Row 1 of Autobuild Table: and Submit the row
	#When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	When I click "Checkout" button on "LabForm2" CRF.  
	And I enter below "Autobuild Table:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 2         | CRF Lab value  | 11          | TextBox         |                  |
	| No        | 2         | CRF Lab Unit   | fL          | ListBox         | Save & Close Row |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 15_Navigate to Patients tab and select a Site1 and add patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 02      | PAT             | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 02-PAT    |

Scenario: 16_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

Scenario:17_Expand the Visit (Screening) event and open the Demographics RTSM form and submit the form data.
	Given I expand "Visit (Screening)" to select and open "Demographics RTSM" CRF.
	When I click "Checkout" button on "Demographics RTSM" CRF.      
	And I enter below flat questions data in the CRF.
	| QuestionPrompt            | AnswerValue | AnswerFieldType |
	| Date of Birth:            | 08/09/1990  | TextBox         |
	| Gender:                   | Male        | ListBox         |
	| Age at Study Start:       | 28          | TextBox         |
	| Age Units at Study Start: | Years       | ListBox         |
	And I click on "Save & Close" button on "Demographics RTSM" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 18_Expand the Visit (Week 2) event and open the LabForm1 form and submit the form data.
	When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	And I click "Checkout" button on "LabForm2" CRF.  
	And I enter below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| Lab ID              | Lab01 (L01) | ListBox         |
	| CRF Collection Date | 11/29/2019  | TextBox         |
	And I click on "Save" button on "LabForm2" CRF.
	Then The CRF with data is saved and checked-in successfully.

@US68119
Scenario:19_Verify the display of job when lab attributes changed
	When I navigate to Study Administration page.
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
	And I enter labs details and Save to Edit
	| LabId | LaboratoryName | Company      | Address1 | Address2 | Address3 | ISOCountry | Country    |
	| L01   | Lab01          | PFIZER123456 | A1       | A2       | A3       | 500084     | INDIA(IND) |
	Then I see success message "Lab test reference range added successfully"
            
Scenario: 20_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs" for Normalization 
	| Subject                          |
	| Normalization Process – Complete |

@US68454
Scenario: 21_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "LabAttributeChangesExpected.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '01-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "LabAttributeChanges.xml" available in the project folder.
	And I have the XML file "LabAttributeChangesExpected.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion|   

@US67418
@US67823
Scenario:22_Verify the display of job when MRR create operation.
	Given I navigate to "Local Labs" tab from main menu.
	When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "RBC" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "Lab test reference range added successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	| 10/12/2019 | 11/29/2019 | Male   | >             | 20         | <           | 30       | >                    | 5                 | <                     | 15                 | >                      | 4                   | <                       | 16                   | fL   | False |
	Then a "Lab test reference range added successfully" message should be displayed in ReferenceRangesPage

Scenario: 23_Expand the Visit (Week 2) event and open the LabForm1 form and submit the form data.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
			| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
			| 2         | CRF Lab Test Name                        | RBC         | TEXT            |                  |
			| 2         | Lab Test Description                     | RBC         | TEXT            |                  |
			| 2         | CRF Lab Unit                             | fL          | TEXT            |                  |
			| 2         | CRF Lab value                            | 11          | TEXT            |                  |
			| 2         | Lab Test Name                            | RBC         | TEXT            |                  |
			| 2         | Lab Test Code                            | 02          | TEXT            |                  |
			| 2         | LOINC Code                               | 2           | TEXT            |                  |
			| 2         | Category                                 | Cat2        | TEXT            |                  |
			| 2         | Subcategory                              | SubCat2     | TEXT            |                  |
			| 2         | Specimen                                 | Specimen2   | TEXT            |                  |
			| 2         | Method                                   | Method2     | TEXT            |                  |
			| 2         | Result Type                              | Result2     | TEXT            |                  |
			| 2         | Normal Reference Range High              | < 15.000    | TEXT            |                  |
			| 2         | Critical Reference Range Low             | > 4.000     | TEXT            |                  |
			| 2         | Normal Reference Range Low               | > 5.000     | TEXT            |                  |
			| 2         | Critical Reference Range High            | < 16.000    | TEXT            |                  |
			#| #         | #                                        | #           | #               | 1                | Reference Range ID | {ReferenceRangeID2} | TEXT |  |
			| 2         | Out of Normal Range Indicator            | No          | TEXT            |                  |
			| 2         | Normalized Patient Lab Value             | 55.000      | TEXT            |                  |
			| 2         | Normalized Lab Unit                      | pg          | TEXT            |                  |
			| 2         | Normalized Normal Reference Range Low    | > 25.000    | TEXT            |                  |
			| 2         | Normalized Normal Reference Range High   | < 75.000    | TEXT            |                  |
			| 2         | Normalized Critical Reference Range Low  | > 20.000    | TEXT            |                  |
			| 2         | Reference Range Not Applicable           | No          | TEXT            |                  |
			| 2         | Normalized Critical Reference Range High | < 80.000    | TEXT            |                  |
			| 2         | Precision                                | 3           | TEXT            |                  |
			| 2         | Conversion Factor                        | 5           | TEXT            |                  |
######Updated ##################
Scenario: 24_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs" for Normalization 
	| Subject                          |
	| Normalization Process – Complete |

@US67418
@US67823
Scenario:25_Verify the display of job when MRR update operation
   Given I navigate to "Local Labs" tab from main menu.
   When I open lab with labid "L01" from ManageReferenceRanges page
   And I open labtest with labname "RBC" from labtests page
   And I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
   And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| FromAgeSet | ToAgeSet | ClinicalRangeLowSet |
	| 26         | 36       | 2                   |
   And I Click the save button in ReferenceRangesPage
   Then a "Lab test reference range updated successfully" message should be displayed in ReferenceRangesPage

Scenario: 26_Login to Datalabs application.
    Given I have logged into DataLabs application as an Administrator user.
    And I navigate to "Inbox" tab from main menu.
    Then I check subjects in inbox folder "Jobs" for Normalization 
    | Subject                          |
    | Normalization Process – Complete |

Scenario: 27_Expand the Visit (Week 2) event and open the LabForm1 form and submit the form data.
    Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
    When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
    Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | RBC         | TEXT            |                  |
		| 2         | Lab Test Description                     | RBC         | TEXT            |                  |
		| 2         | CRF Lab Unit                             | fL          | TEXT            |                  |
		| 2         | CRF Lab value                            | 11          | TEXT            |                  |
		| 2         | Lab Test Name                            | RBC         | TEXT            |                  |
		| 2         | Lab Test Code                            | 02          | TEXT            |                  |
		| 2         | LOINC Code                               | 2           | TEXT            |                  |
		| 2         | Category                                 | Cat2        | TEXT            |                  |
		| 2         | Subcategory                              | SubCat2     | TEXT            |                  |
		| 2         | Specimen                                 | Specimen2   | TEXT            |                  |
		| 2         | Method                                   | Method2     | TEXT            |                  |
		| 2         | Result Type                              | Result2     | TEXT            |                  |
		| 2         | Normal Reference Range High              | < 15.000    | TEXT            |                  |
		| 2         | Critical Reference Range Low             | > 2.000     | TEXT            |                  |
		| 2         | Normal Reference Range Low               | > 5.000     | TEXT            |                  |
		| 2         | Critical Reference Range High            | < 16.000    | TEXT            |                  |
		#| #         | #                                        | #           | #               | 1                | Reference Range ID | {ReferenceRangeID2} | TEXT |  |
		| 2         | Out of Normal Range Indicator            | No          | TEXT            |                  |
		| 2         | Normalized Patient Lab Value             | 55.000      | TEXT            |                  |
		| 2         | Normalized Lab Unit                      | pg          | TEXT            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 25.000     | TEXT            |                  |
		| 2         | Normalized Normal Reference Range High   | < 75.000    | TEXT            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 10.000    | TEXT            |                  |
		| 2         | Reference Range Not Applicable           | No          | TEXT            |                  |
		| 2         | Normalized Critical Reference Range High | < 80.000    | TEXT            |                  |
		| 2         | Precision                                | 3           | TEXT            |                  |
		| 2         | Conversion Factor                        | 5           | TEXT            |                  |

@US67419
Scenario:28_Verify the display of job when site to lab disassociation
    When I select DataManagerPortal item "Study Administration" from drop down
    And I click Link "Site Management" In StudyAdministrationPage 
    And I open site with siteid "01" and site name "Site" from SiteManagement page
    And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
    And I remove and save lab id "L01" and lab name "Lab01" from associated labs in AssociateLabs page
    Then a "Lab data updated successfully" message should be displayed in ReferenceRangesPage

 Scenario: 29_Login to Datalabs application.
    Given I have logged into DataLabs application as an Administrator user.
    And I navigate to "Inbox" tab from main menu.
    Then I check subjects in inbox folder "Jobs" for Normalization 
    | Subject                          |
    | Normalization Process – Complete |

Scenario: 30_Login to Datalabs application.
    Given I have logged into DataLabs application as an Administrator user.
    Then I see Datalabs Home Page

@US67299
Scenario: 31_Verify the XML Data evented out for the Item Data is entered via Flag Update
    Given I save the Event XML data in "labfromsitedisassociaitonExpected.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '01-PAT') +  '%' order by OdmSubscriberDetailKey desc"
    And I have the XML file "sitetolabdisassociaiton.xml" available in the project folder.
    And I have the XML file "labfromsitedisassociaitonExpected.xml" available in the Result XML Files folder.
    Then I verify that the data in both XML files is same except for below tags and fields.
    | TagName | FieldName           |
    |         | CreationDateTime    |
    |         | DateTimeStamp       |
    |         | SubjectKey          |
    |         | FileOID             |
    |         | SourceID            |
    |         | SourceSystemVersion |

@US67418
@US67823
Scenario:32_Verify the display of job when MRR delete operation
    Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
    And I open labtest with labname "RBC" from labtests page
    And I select the checkbox to delete the all records
    And I click on Delete button  
    And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 1 reference range record(s)?"
    And I navigate to "Inbox" tab from main menu.
    Then I check subjects in inbox folder "Jobs" for Normalization 
    | Subject                          |
    | Normalization Process – Complete |

Scenario: 33_Expand the Visit (Week 2) event and open the LabForm1 form and submit the form data.
    Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
    When I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
    Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | RBC         | TEXT            |                  |
		| 2         | Lab Test Description                     | RBC         | TEXT            |                  |
		| 2         | CRF Lab Unit                             | fL          | TEXT            |                  |
		| 2         | CRF Lab value                            | 11          | TEXT            |                  |
		| 2         | Lab Test Name                            | RBC         | TEXT            |                  |
		| 2         | Lab Test Code                            | 02          | TEXT            |                  |
		| 2         | LOINC Code                               | 2           | TEXT            |                  |
		| 2         | Category                                 | Cat2        | TEXT            |                  |
		| 2         | Subcategory                              | SubCat2     | TEXT            |                  |
		| 2         | Specimen                                 | Specimen2   | TEXT            |                  |
		| 2         | Method                                   | Method2     | TEXT            |                  |
		| 2         | Result Type                              | Result2     | TEXT            |                  |
		| 2         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
		| 2         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
		| 2         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
		| 2         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
	#	| #         | #                                        | #           | #               | #                | 1 | Reference Range ID | {ReferenceRangeID2} | TEXT |  |
		| 2         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
		| 2         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
		| 2         | Normalized Lab Unit                      | pg          | TEXT            |                  |
		| 2         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
		| 2         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
		| 2         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
		| 2         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
		| 2         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
		| 2         | Precision                                | 3           | TEXT            |                  |
		| 2         | Conversion Factor                        | [Blank]     | TEXT            |                  |
			   		 	  	  	   	
@US67419      
Scenario:34_Verify the display of job when lab to site disassociation
    When I navigate to Study Administration page.
    And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I open lab with labid "L01" from LabManagement page
    And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette 
    And I remove and save sites from assocaited sites in LabManagementSitesPage
    | Site              |
    | 02 - Site         |
    Then a "Lab data updated successfully and job queued for normalization" message should be displayed in ReferenceRangesPage

Scenario: 35_Login to Datalabs application.
    Given I have logged into DataLabs application as an Administrator user.
    And I navigate to "Inbox" tab from main menu.
   Then I check subjects in inbox folder "Jobs" for Normalization 
    | Subject                          |
    | Normalization Process – Complete |

Scenario: 36_Login to Datalabs application.
    Given I have logged into DataLabs application as an Administrator user.
    Then I see Datalabs Home Page

@US51842  DE Scoped
#Scenario:37_Verify the display of "Normalize lab Data" link
#          When I navigate to Study Administration page.
#          And I click Link "Lab Management" In StudyAdministrationPage
#          Then I should be able to see"Normalize Lab Data" link left side

@US67300 ODM for labfromsitedisassociation
Scenario: 38_Verify the XML Data evented out for the Item Data is entered via Flag Update
    Given I save the Event XML data in "sitefromlabdisassociaitonExpected.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '02-PAT') +  '%' order by OdmSubscriberDetailKey desc"
    And I have the XML file "labtositedisassociaiton.xml" available in the project folder.
    And I have the XML file "sitefromlabdisassociaitonExpected.xml" available in the Result XML Files folder.
    Then I verify that the data in both XML files is same except for below tags and fields.
    | TagName | FieldName           |
    |         | CreationDateTime    |
    |         | DateTimeStamp       |
    |         | SubjectKey          |
    |         | FileOID             |
    |         | SourceID            |
    |         | SourceSystemVersion |

	###EXe
@US68909
Scenario:39 Verify the display of Yes or No in N/A filed
          Given I navigate to "Local Labs" tab from main menu.
          When I open lab with labid "test" from ManageReferenceRanges page
          And I open labtest with labname "B.P" from labtests page
          And I read the Ref ID of the created record in the MRR table of Manage Reference Ranges page
          And I click on "History" Icon for the added record in the MRR table grid of Manage Reference Range page
          Then I should see the below mentioned details in the Change History Window
          | Date/Time                                                             | Reference Range                             | Action        |        
          | GST\r\n testadmin testadmin (EDCDEV\\testadmin) | Date (Start, End): 02-Dec-2019, 17-Dec-2019\r\nGender: Male\r\nAge (From, To): 1 Years, 100 Years\r\nNormal Range (Low, High): 5, 50\r\nCritical Range (Low, High): 3, 100\r\nUnit: µL\r\nNot Applicable: False  | Initial Entry |

@US68909
Scenario:40 verify the display of "Is Yes" or "Is No" values in filter for NA
          Given I navigate to "Local Labs" tab from main menu.
          When I open lab with labid "test" from ManageReferenceRanges page
          And I open labtest with labname "B.P" from labtests page
          And I read the Ref ID of the created record in the MRR table of Manage Reference Ranges page
          Then clicking on Filter button should display Is yes or Is No values

@US68870
Scenario:41 Verify the display of Lab Mangement description
    When I navigate to Study Administration page.
    Then I should be able to see"Manage Labs, Run Normalization." description under Lab Mangement

@US68871
Scenario:42 Verify the display of 2 links in Labmanagement
    When I navigate to Study Administration page.
    And I click Link "Lab Management" In StudyAdministrationPage
    Then I should see "Manage Laboratories","Normalize Lab Data"

@US68882
Scenario:43 Verify the navigation of Labmanagement click
    When I navigate to Study Administration page.
    And I click Link "Lab Management" In StudyAdministrationPage
    And I click Link "Manage Laboratories" In StudyAdministrationPage
    #Then I should see "Manage Laboratories","Normalize Lab Data"

@US68882
Scenario:44 Verify the navigation of Normalize lab data link click
    When I navigate to Study Administration page.
    And I click Link "Lab Management" In StudyAdministrationPage
    And I click Link "Normalize Lab Data" In StudyAdministrationPage
    #Then I should see "Manage Laboratories","Normalize Lab Data"


Scenario: 044_Logout form DataLabs
    When I clik logout of Datalabs
    Then I see login page
