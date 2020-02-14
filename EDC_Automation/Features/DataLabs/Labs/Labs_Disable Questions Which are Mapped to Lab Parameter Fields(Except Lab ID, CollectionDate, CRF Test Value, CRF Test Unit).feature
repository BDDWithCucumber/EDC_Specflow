Feature: LabSDisableQuestionswhicharenotmappedinLabParametermappings

Scenario: 01_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header
# No mapping in the D1 instance for the study File
Scenario: 03_Prepare a study file that doesn't have Lab Parameter mapping for all the fields except for the mandatory fields and with valid Questions for the Lab parameter Mapping fields and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "Questions_NoMapping_1D.zip" with study label "Questions"
      Then I see study label "Questions" in header      

Scenario: 04_Add Site 01-Site
      When I select DataManagerPortal item "Study Administration" from drop down
      And I click Link "Site Management" In StudyAdministrationPage
      And I enter sites details and Save
      | SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
      | 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
      And I open site with siteid "01" and site name "Site" from SiteManagement page
      And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
      And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
      Then I click breadcrumb "Site Management"

Scenario: 05_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 06_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 07_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

## Domain Item mapping not done for Mapping Elements in Lab mapping page of Dictionary while preparing the study itself except for the mandatory fields
Scenario: 08_Navigate to Patient and verify Whether the input field is enabled for all Questions
      When I expand "Visit (week2)" to select and open "FormD1" CRF.
      And I click "Checkout" button on "FormD1" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State   |
      | Lab ID Q1 For D1              | [Blank]     | LISTBOX         | Enabled |
      | Lab Name Q1 For D1            |             | TextBox         | Enabled |
      | Company Q1 For D1             |             | TextBox         | Enabled |
      | Lab Address Q1 For D1         |             | TextBox         | Enabled |
      | Country Q1 For D1             |             | TextBox         | Enabled |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled |	
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D1                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |	  
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
	  | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
	  | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
	  | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Code For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
	  | 2         | Category For D1                                 |             | TextBox         | Enabled  |                  |
	  | 2         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
	  | 2         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
	  | 2         | Method For D1                                   |             | TextBox         | Enabled  |                  |
	  | 2         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
	  | 2         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
	  | 2         | Normal Reference Range High For D1              |             | TextBox         | Enabled  |                  |
	  | 2         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
	  | 2         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
	  | 2         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
	  | 2         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
	  | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
	  | 2         | Precision For D1                                |             | TextBox         | Enabled  |                  |
	  | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
	  | 2         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
	  | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1" CRF.
     
## Delete this study from the data labs
Scenario: 09_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header
#
## Prepare a study that has all the mappings for all the lab parameters in D1
Scenario: 10_Prepare a study file that have Lab Parameter mapping for all the fields with valid Questions and publish it     
	  When I click breadcrumb "Study Management"
      And I upload a study "QuestionAllMapped_D1.zip" with study label "Questions"
      Then I see study label "Questions" in header    

Scenario: 11_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       | PAT             | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 12_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 13_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".
#
## Domain Item mapping done for all Mapping Elements in Lab mapping page of Dictionary while preparing the study itself for D1 with valid Question mapping
Scenario: 14_Navigate to Patient and verify that the input field is disabled for the questions except for the fields Lab Id Collection Date Lab Test value CRF Lab test Name CRF Lab Test Original Unit    
      And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D1              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D1            |             | TextBox         | Disabled |
      | Company Q1 For D1             |             | TextBox         | Disabled |
      | Lab Address Q1 For D1         |             | TextBox         | Disabled |
      | Country Q1 For D1             |             | TextBox         | Disabled |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled  |		
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Disabled |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 1         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Disabled |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Disabled |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 1         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled  |                  |
      | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D1                     |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Name For D1                            |             | TextBox         | Disabled |                  |
      | 2         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 2         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 2         | Result Type For D1                              |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range Low For D1               |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 2         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 2         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Disabled |                  |
      | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Disabled |                  |
      | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 2         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 2         | Conversion Factor for D1                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1" CRF.
## Delete the study
Scenario: 15_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header
#
##Prepare a study that has Lab Parameter mapping only for few fields Lab Name, Lab Test Name, in D1 
##Normal Reference Range Low, Normalized Patient Lab Value in D1
## Along with the mandatory fields in D1
Scenario: 16_Prepare a study file that have Lab Parameter mapping few fields with valid Questions and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "Questions_1D_Few_Mapped.zip" with study label "Questions"
      Then I see study label "Questions" in header    

Scenario: 17_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       | PAT             | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 18_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 19_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Prepare a study that has Lab Parameter mapping only for few fields Lab Name, Lab Test Name in D1
#Normal Reference Range Low, Normalized Patient Lab Value in D1
# Along with the mandatory fields in D1
# Domain Item mapping is done for Mapping Elements in Lab mapping page for few of the elements in Dictionary while preparing the study itself 
Scenario: 20_Navigate to Patient and verify that the input field is disabled for the questions except for the fields Lab Id Collection Date Lab Test value CRF Lab test Name CRF Lab Test Original Unit
     And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D1              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D1            |             | TextBox         | Disabled |
      | Company Q1 For D1             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D1         |             | TextBox         | Enabled  |
      | Country Q1 For D1             |             | TextBox         | Enabled  |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled  |		
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Disabled |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D1                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D1                     |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Code For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Name For D1                            |             | TextBox         | Disabled |                  |
      | 2         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
      | 2         | Category For D1                                 |             | TextBox         | Enabled  |                  |
      | 2         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
      | 2         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
      | 2         | Method For D1                                   |             | TextBox         | Enabled  |                  |
      | 2         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D1               |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range High For D1              |             | TextBox         | Enabled  |                  |
      | 2         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
      | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
      | 2         | Precision For D1                                |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
      | 2         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1" CRF.
## Delete the study
Scenario: 21_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header


Scenario: 22_Prepare a study file that have Lab Parameter mapping few fields with valid Questions and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "Questions_Update_D1.zip" with study label "Questions"
      Then I see study label "Questions" in header    

Scenario: 23_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       | PAT             | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 24_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 25_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#
##LabTestName mapped to updateLabNameForD1, Normal Reference range Low to UpdateNorRRLowForD1, Normalized Patient lab Value to updateNorPatientLabValuForD1
##Lab Name mapped to LabnameForD1, Company mapped to CompanyForD1, lab test Description mapped to CRFLabTestDesForD1, Lab Test Code mapped to LabTestCodeForD1
##Normal Reference Range High mapped to NorRRHighForD1, Normalized Lab Unit mapped to NormaliLabUnitForD1
## Along with the mandatory fields
## Domain Item mapping is done for Mapping Elements in Lab mapping page for few of the elements in Dictionary while preparing the study itself 
Scenario: 26_Navigate to Patient and verify that the input field is disabled for the questions except for the fields Lab Id Collection Date Lab Test value CRF Lab test Name CRF Lab Test Original Unit
     And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D1              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D1            |             | TextBox         | Disabled |
      | Company Q1 For D1             |             | TextBox         | Disabled |
      | Lab Address Q1 For D1         |             | TextBox         | Enabled  |
      | Country Q1 For D1             |             | TextBox         | Enabled  |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled  |		
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D1                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D1                     |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
      | 2         | Category For D1                                 |             | TextBox         | Enabled  |                  |
      | 2         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
      | 2         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
      | 2         | Method For D1                                   |             | TextBox         | Enabled  |                  |
      | 2         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 2         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
      | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
      | 2         | Precision For D1                                |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
      | 2         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1" CRF.
## Delete the study
Scenario: 27_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header
#
##Prepare a study that has 2 instances in Lab Parameter mapping 
##Domain D1 has all mapping with Questions 
##Domain D2 has only Required mapping in Lab Parameter mappings and it has all questions
Scenario: 28_Prepare a study file that have Lab Parameter mapping few fields with valid Questions and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "D1AllD2RequiredM.zip" with study label "Questions"
      Then I see study label "Questions" in header    

Scenario: 29_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       | PAT             | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 30_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 31_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Prepare a study that has 2 instances in Lab Parameter mapping 
#Domain D1 has all mapping with Questions 
#Domain D2 has only Required mapping in Lab Parameter mappings and it has all questions
Scenario: 32_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the un mapping/improper mapping fields
      And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D1              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D1            |             | TextBox         | Disabled |
      | Company Q1 For D1             |             | TextBox         | Disabled |
      | Lab Address Q1 For D1         |             | TextBox         | Disabled |
      | Country Q1 For D1             |             | TextBox         | Disabled |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled  |		
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Disabled |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 1         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Disabled |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Disabled |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 1         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled  |                  |
      | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D1                     |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Name For D1                            |             | TextBox         | Disabled |                  |
      | 2         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 2         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 2         | Result Type For D1                              |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range Low For D1               |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 2         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 2         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Disabled |                  |
      | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Disabled |                  |
      | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 2         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 2         | Conversion Factor for D1                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1" CRF.

Scenario: 33_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the un mapping/improper mapping fields
      And I expand "Visit (Week3)" to select and open "FormD2" CRF.
      When I click "Checkout" button on "FormD2" CRF.      
     Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State   |
      | Lab ID Q1 For D2              | [Blank]     | LISTBOX         | Enabled |
      | Lab Name Q1 For D12            |             | TextBox         | Enabled |
      | Company Q1 For D2             |             | TextBox         | Enabled |
      | Lab Address Q1 For D2         |             | TextBox         | Enabled |
      | Country Q1 For D2             |             | TextBox         | Enabled |
      | CRF Collection Date Q1 For D2 |             | TextBox         | Enabled |	
      Then I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D2               |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D2             |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit ForD2                   |             | ListBox         | Enabled  | Cancel Row       |  
	  And I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
	  | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
	  | 2         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
	  | 2         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Name For D2                            |             | TextBox         | Enabled  |                  |
	  | 2         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
	  | 2         | Category For D2                                 |             | TextBox         | Enabled  |                  |
	  | 2         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
	  | 2         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
	  | 2         | Method For D2                                   |             | TextBox         | Enabled  |                  |
	  | 2         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
	  | 2         | Normal Reference Range Low For D2               |             | TextBox         | Enabled  |                  |
	  | 2         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
	  | 2         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
	  | 2         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
	  | 2         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
	  | 2         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
	  | 2         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Patient Lab Value For D2             |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
	  | 2         | Precision For D2                                |             | TextBox         | Enabled  |                  |
	  | 2         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
	  | 2         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
	  | 2         | CRF Lab (Original) Unit ForD2                   |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD2" CRF.
# Delete the study
Scenario: 34_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

#Prepare a study by updating the values in domain instance 1 and 2
#unmapped the mapping for the fields in D1 - Lab Name, lab Test Description, lab Test Name, Normal Reference Range Low, Conversion Factor
#In D1 Mapped Company to UpdateCompanyForD1
#Instance one has these mapping fields among with the mandatory mapping fields Lab Test Name,Lab Test Code,SAS Label,Normalized Patient Lab Value
#Instance two has these mapping fields among with the mandatory mapping fields Normal Reference Range Low,Normal Reference Range High,Normalized Critical Reference Range Low,Normalized Critical Reference Range High
Scenario: 35_Prepare a study file that have Lab Parameter mapping few fields with valid Questions and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "Questions_D1D2_Update.zip" with study label "Questions"
      Then I see study label "Questions" in header    

Scenario: 36_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       | PAT             | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 37_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 38_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Prepare a study by updating the values in domain instance 1 and 2
#unmapped the mapping for the fields in D1 - Lab Name, lab Test Description, lab Test Name, Normal Reference Range Low, Conversion Factor
#In D1 Mapped Company to UpdateCompanyForD1, Result Type to updatedResultTypeForD1, Out of Normal Range Indicator to updateoutOfNRINDI, Normalized Normal Reference Range Low to UpdateNormaNorRRLow
Scenario: 39_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the unmapping/improper mapping fields
       When I expand "Visit (week2)" to select and open "FormD1" CRF.
      And I click "Checkout" button on "FormD1" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D1              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D1            |             | TextBox         | Enabled  |
      | Company Q1 For D1             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D1         |             | TextBox         | Disabled |
      | Country Q1 For D1             |             | TextBox         | Disabled |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled  |		
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 1         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 1         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 2         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 2         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D1               |             | TextBox         | Enabled |                  |
      | 2         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 2         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 2         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 2         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 2         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1" CRF.
#In D2 along with the mandatory fields Mapped Country to update country, CoversionFactor to updateConversionFactorForD2 in lab Mapping tab
#In D2 along with the mandatory fields Mapped Lab Name mapped to LabNameForD2, Lab test name to LabTestNameForD2 in lab Mapping tab, Normal RR Low to NorRRLowForD2
# Normalized Patient Lab Value mapped to NorPatientLabValuForD2 
Scenario: 40_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the un mapping/improper mapping fields
      When I expand "Visit (Week3)" to select and open "FormD2" CRF.
	  And I click "Checkout" button on "FormD2" CRF. 
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D2              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D2            |             | TextBox         | Disabled |
      | Company Q1 For D2             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D2         |             | TextBox         | Enabled  |
      | Country Q1 For D2             |             | TextBox         | Enabled |
      | CRF Collection Date Q1 For D2 |             | TextBox         | Enabled  |
      Then I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 1         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Code For D2                            |             | TextBox         | Enabled |                  |
      | 2         | Lab Test Name For D2                            |             | TextBox         | Disabled  |                  |
      | 2         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 2         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 2         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 2         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 2         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 2         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 2         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD2" CRF.
# Delete the study
Scenario: 41_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

#Duplicate the Forms FormD1 and Form D2 and map them to Questions And Events - same Domain Items
Scenario: 42_Prepare a study file that have Lab Parameter mapping few fields with valid Questions and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "Questions_CopyFormsForD1andD2.zip" with study label "Questions"
      Then I see study label "Questions" in header    

Scenario: 43_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       | PAT             | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 44_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 45_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#unmapped the mapping for the fields in D1 - Lab Name, lab Test Description, lab Test Name, Normal Reference Range Low, Conversion Factor
#In D1 Mapped Company to UpdateCompanyForD1, Result Type to updatedResultTypeForD1, Out of Normal Range Indicator to updateoutOfNRINDI, Normalized Normal Reference Range Low to UpdateNormaNorRRLow
Scenario: 46_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the unmapping/improper mapping fields
      When I expand "Visit (week2)" to select and open "FormD1" CRF.
      And I click "Checkout" button on "FormD1" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D1              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D1            |             | TextBox         | Enabled  |
      | Company Q1 For D1             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D1         |             | TextBox         | Disabled |
      | Country Q1 For D1             |             | TextBox         | Disabled |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled  |		
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 1         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 1         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 2         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 2         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D1               |             | TextBox         | Enabled |                  |
      | 2         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 2         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 2         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 2         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 2         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1" CRF.

Scenario: 47_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the unmapping/improper mapping fields
      When I expand "Visit (week2)" to select and open "FormD1_Copy" CRF.
      And I click "Checkout" button on "FormD1_Copy" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D1              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D1            |             | TextBox         | Enabled  |
      | Company Q1 For D1             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D1         |             | TextBox         | Disabled |
      | Country Q1 For D1             |             | TextBox         | Disabled |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled  |		
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 1         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 1         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 1         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Code For D1                            |             | TextBox         | Disabled |                  |
      | 2         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 2         | LOINC Code For D1                               |             | TextBox         | Disabled |                  |
      | 2         | Category For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | SAS Label For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Specimen For D1                                 |             | TextBox         | Disabled |                  |
      | 2         | Method For D1                                   |             | TextBox         | Disabled |                  |
      | 2         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range High For D1              |             | TextBox         | Disabled |                  |
      | 2         | Subcategory For D1                              |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range High For D1            |             | TextBox         | Disabled |                  |
      | 2         | Critical Reference Range Low For D1             |             | TextBox         | Disabled |                  |
      | 2         | Reference Range ID For D1                       |             | TextBox         | Disabled |                  |
      | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Disabled |                  |
      | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Disabled |                  |
      | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Disabled |                  |
      | 2         | Precision For D1                                |             | TextBox         | Disabled |                  |
      | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Disabled |                  |
      | 2         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1_Copy" CRF.

#In D2 along with the mandatory fields Mapped Country to update country, CoversionFactor to updateConversionFactorForD2 in lab Mapping tab
#In D2 along with the mandatory fields Mapped Lab Name mapped to LabNameForD2, Lab test name to LabTestNameForD2 in lab Mapping tab, Normal RR Low to NorRRLowForD2
# Normalized Patient Lab Value mapped to NorPatientLabValuForD2 
Scenario: 48_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the un mapping/improper mapping fields
      And I expand "Visit (Week3)" to select and open "FormD2" CRF.
	  When I click "Checkout" button on "FormD2" CRF.
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D2              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D2            |             | TextBox         | Disabled |
      | Company Q1 For D2             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D2         |             | TextBox         | Enabled  |
      | Country Q1 For D2             |             | TextBox         | Enabled  |
      | CRF Collection Date Q1 For D2 |             | TextBox         | Enabled  |
      Then I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 1         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 2         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 2         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 2         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 2         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 2         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 2         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 2         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD2" CRF.

Scenario: 49_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the un mapping/improper mapping fields
      And I expand "Visit (Week3)" to select and open "FormD2_Copy" CRF.
	  When I click "Checkout" button on "FormD2_Copy" CRF.
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D2              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D2            |             | TextBox         | Disabled |
      | Company Q1 For D2             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D2         |             | TextBox         | Enabled  |
      | Country Q1 For D2             |             | TextBox         | Enabled  |
      | CRF Collection Date Q1 For D2 |             | TextBox         | Enabled  |
      Then I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 1         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 2         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 2         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 2         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 2         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 2         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 2         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 2         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD2_Copy" CRF.
# Delete the study
Scenario: 50_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

#Remove the Domain Instance D1 in Lab Mapping page
#In D2 along with the mandatory fields Mapped Country to update country, CoversionFactor to updateConversionFactorForD2 in lab Mapping tab
#In D2 along with the mandatory fields Mapped Lab Name mapped to LabNameForD2, Lab test name to LabTestNameForD2 in lab Mapping tab, Normal RR Low to NorRRLowForD2
# Normalized Patient Lab Value mapped to NorPatientLabValuForD2 
Scenario: 51_Prepare a study file that have Lab Parameter mapping few fields with valid Questions and publish it
      When I click breadcrumb "Study Management"
      And I upload a study "Questions_D1InstanceDeleted.zip" with study label "Questions"
      Then I see study label "Questions" in header    

Scenario: 52_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       | PAT             | 06/13/2018 |
      Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: 53_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate | EntryComplete |
      | 01       | 06/13/2018 | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: 54_Select a site and a patient.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I select the patient "01-PAT" from patients table.
      Then I see Patient details page for "01-PAT".

#Remove the Domain Instance D1 in Lab Mapping page
Scenario: 55_Navigate to Patient and verify Whether the input field is enabled for all Questions
      And I expand "Visit (week2)" to select and open "FormD1" CRF.
      When I click "Checkout" button on "FormD1" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State   |
      | Lab ID Q1 For D1              |             | TextBox         | Enabled |
      | Lab Name Q1 For D1            |             | TextBox         | Enabled |
      | Company Q1 For D1             |             | TextBox         | Enabled |
      | Lab Address Q1 For D1         |             | TextBox         | Enabled |
      | Country Q1 For D1             |             | TextBox         | Enabled |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled |	
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D1                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |	  
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
	  | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
	  | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
	  | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Code For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
	  | 2         | Category For D1                                 |             | TextBox         | Enabled  |                  |
	  | 2         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
	  | 2         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
	  | 2         | Method For D1                                   |             | TextBox         | Enabled  |                  |
	  | 2         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
	  | 2         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
	  | 2         | Normal Reference Range High For D1              |             | TextBox         | Enabled  |                  |
	  | 2         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
	  | 2         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
	  | 2         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
	  | 2         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
	  | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
	  | 2         | Precision For D1                                |             | TextBox         | Enabled  |                  |
	  | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
	  | 2         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
	  | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1" CRF.

Scenario: 56_Navigate to Patient and verify Whether the input field is enabled for all Questions
      And I expand "Visit (week2)" to select and open "FormD1_Copy" CRF.
      When I click "Checkout" button on "FormD1_Copy" CRF.      
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State   |
      | Lab ID Q1 For D1              |             | TextBox         | Enabled |
      | Lab Name Q1 For D1            |             | TextBox         | Enabled |
      | Company Q1 For D1             |             | TextBox         | Enabled |
      | Lab Address Q1 For D1         |             | TextBox         | Enabled |
      | Country Q1 For D1             |             | TextBox         | Enabled |
      | CRF Collection Date Q1 For D1 |             | TextBox         | Enabled |	
      Then I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
      | 1         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D1                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range High For D1              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D1             |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Lab Unit For D1                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D1                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |	  
	  And I verify below "AutoBuildQuestionsForD1:" table questions answer data status in the CRF.
	  | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
	  | 2         | CRF Lab Test Name For D1                        |             | TextBox         | Disabled |                  |
	  | 2         | CRF Lab Value For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Description For D1                     |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Code For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | Lab Test Name For D1                            |             | TextBox         | Enabled  |                  |
	  | 2         | LOINC Code For D1                               |             | TextBox         | Enabled  |                  |
	  | 2         | Category For D1                                 |             | TextBox         | Enabled  |                  |
	  | 2         | SAS Label For D1                                |             | TextBox         | Enabled  |                  |
	  | 2         | Specimen For D1                                 |             | TextBox         | Enabled  |                  |
	  | 2         | Method For D1                                   |             | TextBox         | Enabled  |                  |
	  | 2         | Result Type For D1                              |             | TextBox         | Enabled  |                  |
	  | 2         | Normal Reference Range Low For D1               |             | TextBox         | Enabled  |                  |
	  | 2         | Normal Reference Range High For D1              |             | TextBox         | Enabled  |                  |
	  | 2         | Subcategory For D1                              |             | TextBox         | Enabled  |                  |
	  | 2         | Critical Reference Range High For D1            |             | TextBox         | Enabled  |                  |
	  | 2         | Critical Reference Range Low For D1             |             | TextBox         | Enabled  |                  |
	  | 2         | Reference Range ID For D1                       |             | TextBox         | Enabled  |                  |
	  | 2         | Out of Normal Range Indicator For D1            |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Patient Lab Value For D1             |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Lab Unit For D1                      |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Normal Reference Range Low For D1    |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Normal Reference Range High For D1   |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Critical Reference Range Low for D1  |             | TextBox         | Enabled  |                  |
	  | 2         | Normalized Critical Reference Range High For D1 |             | TextBox         | Enabled  |                  |
	  | 2         | Precision For D1                                |             | TextBox         | Enabled  |                  |
	  | 2         | Reference Range Not Applicable For D1           |             | TextBox         | Enabled  |                  |
	  | 2         | Conversion Factor for D1                        |             | TextBox         | Enabled  |                  |
	  | 2         | CRF Lab (Original) Unit for D1                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD1_Copy" CRF.

#Remove the Domain Instance D1 in Lab Mapping page
#In D2 along with the mandatory fields Mapped Country to update country, CoversionFactor to updateConversionFactorForD2 in lab Mapping tab
#In D2 along with the mandatory fields Mapped Lab Name mapped to LabNameForD2, Lab test name to LabTestNameForD2 in lab Mapping tab, Normal RR Low to NorRRLowForD2
# Normalized Patient Lab Value mapped to NorPatientLabValuForD2 
Scenario: 57_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the un mapping/improper mapping fields
      And I expand "Visit (Week3)" to select and open "FormD2" CRF.	
	  When I click "Checkout" button on "FormD2" CRF.   
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D2              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D2            |             | TextBox         | Disabled |
      | Company Q1 For D2             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D2         |             | TextBox         | Enabled  |
      | Country Q1 For D2             |             | TextBox         | Enabled  |
      | CRF Collection Date Q1 For D2 |             | TextBox         | Enabled  |
      Then I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 1         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 2         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 2         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 2         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 2         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 2         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 2         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 2         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD2" CRF.

Scenario: 58_Navigate to Patient and verify that the input field is disabled for the mapped fields and Enabled for the un mapping/improper mapping fields
      And I expand "Visit (Week3)" to select and open "FormD2_Copy" CRF.
	  When I click "Checkout" button on "FormD2_Copy" CRF. 
      Then I verify below flat questions status in the CRF.
      | QuestionPrompt                | AnswerValue | AnswerFieldType | State    |
      | Lab ID Q1 For D2              | [Blank]     | LISTBOX         | Enabled  |
      | Lab Name Q1 For D2            |             | TextBox         | Disabled |
      | Company Q1 For D2             |             | TextBox         | Enabled  |
      | Lab Address Q1 For D2         |             | TextBox         | Enabled  |
      | Country Q1 For D2             |             | TextBox         | Enabled  |
      | CRF Collection Date Q1 For D2 |             | TextBox         | Enabled  |
      Then I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 1         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 1         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 1         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 1         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 1         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 1         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 1         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 1         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 1         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 1         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 1         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 1         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 1         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 1         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 1         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 1         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I verify below "AutoBuildQuestionsForD2:" table questions answer data status in the CRF.
      | RowNumber | QuestionPrompt                                  | AnswerValue | AnswerFieldType | State    | RowButtonToClick |
      | 2         | CRF Lab Test Name For D2                        |             | TextBox         | Disabled |                  |
      | 2         | CRF Lab Value For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Description For D2                     |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Code For D2                            |             | TextBox         | Enabled  |                  |
      | 2         | Lab Test Name For D2                            |             | TextBox         | Disabled |                  |
      | 2         | LOINC Code For D2                               |             | TextBox         | Enabled  |                  |
      | 2         | Category For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | SAS Label For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Specimen For D2                                 |             | TextBox         | Enabled  |                  |
      | 2         | Method For D2                                   |             | TextBox         | Enabled  |                  |
      | 2         | Result Type For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Normal Reference Range Low For D2               |             | TextBox         | Disabled |                  |
      | 2         | Normal Reference Range High For D2              |             | TextBox         | Enabled  |                  |
      | 2         | Subcategory For D2                              |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range High For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Critical Reference Range Low For D2             |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range ID For D2                       |             | TextBox         | Enabled  |                  |
      | 2         | Out of Normal Range Indicator For D2            |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Patient Lab Value For D2             |             | TextBox         | Disabled |                  |
      | 2         | Normalized Lab Unit For D2                      |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range Low For D2    |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Normal Reference Range High For D2   |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range Low for D2  |             | TextBox         | Enabled  |                  |
      | 2         | Normalized Critical Reference Range High For D2 |             | TextBox         | Enabled  |                  |
      | 2         | Precision For D2                                |             | TextBox         | Enabled  |                  |
      | 2         | Reference Range Not Applicable For D2           |             | TextBox         | Enabled  |                  |
      | 2         | Conversion Factor for D2                        |             | TextBox         | Enabled  |                  |
      | 2         | CRF Lab (Original) Unit For D2                  |             | ListBox         | Enabled  | Cancel Row       |
	  And I click on "Cancel" button on "FormD2_Copy" CRF.	
#      
Scenario: 52_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page 
	
