Feature: ODM_Patient Migration for multiple study updates to Labs setting
	Test Summary:
	1. US66270_Verify the Study update functionality in DL when the Designer study Labs settings changed multiple times Yes->No->Yes

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "StudyPublish.zip" with study label "AllmappedforD1_1"
    Then I see study label "AllmappedforD1_1" in header 

Scenario: 04_Add site in Site Management and associate testadmin testadmin user to 01-Site
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	#And I enter sites details and Save
	#| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	#| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

#Scenario: T05_Add Labs
#	When I click breadcrumb "Study Administration"
#	And I click Link "Lab Management" In StudyAdministrationPage
#	And I click Link "Manage Laboratories" In StudyAdministrationPage
#	And I enter labs details and Save
#	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	Then I see labs with details in lab grid
#	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#
#Scenario: T06_Associate Lab L02 to 01-Site
#	When I click breadcrumb "Study Administration"
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I open site with siteid "01" and site name "Site" from SiteManagement page
#	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
#	And I select sub tab "Labs" in site page
#	Then I see lab data in labs tab of Site in SitePage
#	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
#	| L02   | Lab02          | PFIZER  | RD         | Active           |

Scenario: T07_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

Scenario: T08_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST2" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Female | >             | 0          | <           | 25       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 30                   | 4Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID2} |

Scenario: T09_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 02       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 02-PAT    |

Scenario: T10_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T11_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T12_Expand the Visit (Screening) and open the demographics form to update the data
	When I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
    | QuestionPrompt      | AnswerValue | AnswerFieldType |
    | What is your age    | 31          | TextBox         |
    | Age Unit            | Year        | ListBox         |
    | What is your gender | Male        | ListBox         |
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully. 

Scenario: T13_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
	And I click "Checkout" button on "FormD1" CRF. 
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1              | Lab02 (L02) | ListBox         |
	| CRF Collection Date Q1 For D1 | 06/10/2019  | TextBox         |
    And I expand row "1" of table "AutoBuildQuestionsForD1:" 
	And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | CRF Lab Value For D1           | 20          | TextBox         |                  |
	| No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3      | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T14_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T15_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

Scenario: T16_Expand the Visit (Screening) and open the demographics form to update the data
	When I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
    | QuestionPrompt      | AnswerValue | AnswerFieldType |
    | What is your age    | 20          | TextBox         |
    | Age Unit            | Year        | ListBox         |
    | What is your gender | Female      | ListBox         |
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully. 

Scenario: T17_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
	And I click "Checkout" button on "FormD1" CRF. 
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1              | Lab02 (L02) | ListBox         |
	| CRF Collection Date Q1 For D1 | 06/10/2019  | TextBox         |
    And I expand row "2" of table "AutoBuildQuestionsForD1:" 
	And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 2         | CRF Lab Value For D1           | 30          | TextBox         |                  |
	| No        | 2         | CRF Lab (Original) Unit for D1 | Unit 4      | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T18_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

#Study publish-Major study update
#US63142-Labs Yes to No- Do Not Migrate
Scenario: T19_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "StudyPublish_Yes_No.zip" with Label "Major1"
	And I click continue in modal dialog having title "Confirm" and partial message "Uploaded study version has Local Labs as Not Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T20_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                       |
    | Publishing of Study file (Major1) - complete. |

Scenario: T21_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T22_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T23_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF. 
    And I expand row "1" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3             | Unit 4         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T24_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF. 
    And I expand row "2" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 2         | CRF Lab (Original) Unit for D1 | Unit 4             | Unit 5         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T25_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T26_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 02-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

#Study Publish
#Labs No to No - Major study update
Scenario: T27_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_AllDictionaryChanges.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T28_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	And I check subjects in inbox folder "Jobs"
    | Subject                                       |
    | Publishing of Study file (Major1) - complete. |
	Then  I do not see the Tab "Local Labs"

Scenario: T29_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

#@ObjectiveEvidence @ReqID:US67434.1
#Scenario: T29_Verify the XML Data evented out for the Item Data is entered via Flag Update
#	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
#	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
#	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
#	Then I verify that the data in both XML files is same except for below tags and fields.
#	| TagName | FieldName           |
#	|         | CreationDateTime    |
#	|         | DateTimeStamp       |
#	|         | SubjectKey          |
#	|         | FileOID             |
#	|         | SourceID            |
#	|         | SourceSystemVersion |

Scenario: T30_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF. 
    And I expand row "1" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 4             | Unit 3         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T31_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "02-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF. 
    And I expand row "2" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 2         | CRF Lab (Original) Unit for D1 | Unit 5             | Unit 4         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T32_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 02-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

#Study publish-Major study update
#US63142-Labs No to Yes- Do Not Migrate
Scenario: T33_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Study Publish_No_Yes.zip" with Label "Major1"
	And I click continue in modal dialog having title "Confirm" and partial message "Uploaded study version has Local Labs as Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T34_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Do not migrate" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                       |
    | Publishing of Study file (Major1) - complete. |

Scenario: T35_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 01-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T36_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T37_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T38_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T39_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST2" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Female | >             | 0          | <           | 25       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 30                   | 4Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID2} |

Scenario: T40_MigragePatients
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Migrate Patients" in "SiteActions" ActionPalette
	And I select patients in MigratePatientsPage
	| PatientID |
	| 02-PAT    |   
	And I click save button in MigratePatientsPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                                                                                             |
	| Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T41_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

#Initial Data Setup
Scenario: T42_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T43_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "StudyPublish.zip" with study label "AllmappedforD1_1"
    Then I see study label "AllmappedforD1_1" in header 

Scenario: T44_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

Scenario: T45_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T46_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T47_Expand the Visit (Screening) and open the demographics form to update the data
	When I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
    | QuestionPrompt      | AnswerValue | AnswerFieldType |
    | What is your age    | 31          | TextBox         |
    | Age Unit            | Year        | ListBox         |
    | What is your gender | Male        | ListBox         |
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully. 

Scenario: T48_Expand the Visit (week2) event and open the FormD1 form and update the data.
	When I expand "Visit (week2)" to select and open "FormD1" CRF.
	And I click "Checkout" button on "FormD1" CRF. 
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                | AnswerValue | AnswerFieldType |
	| Lab ID Q1 For D1              | Lab02 (L02) | ListBox         |
	| CRF Collection Date Q1 For D1 | 06/10/2019  | TextBox         |
    And I expand row "1" of table "AutoBuildQuestionsForD1:" 
	And I enter below "AutoBuildQuestionsForD1:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                 | AnswerValue | AnswerFieldType | RowButtonToClick |
	| No        | 1         | CRF Lab Value For D1           | 20          | TextBox         |                  |
	| No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3      | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T49_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US32215.1, US32215.2, US32215.3, US32215.4, US32215.5
#Study publish-Major study update
#Labs yes to No- Migrate all patients
Scenario: T50_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "StudyPublish_Yes_No.zip" with Label "Major1"
	And I click continue in modal dialog having title "Confirm" and partial message "Uploaded study version has Local Labs as Not Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T51_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                                                                                                             |
    | Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
    | Publishing of Study file (Major1) - complete.                                                                                       |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T52_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual09.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected09.xml" available in the project folder.
	And I have the XML file "StudyPublishActual09.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T53_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3             | Unit 4         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

#Labs No to No - Major study update
Scenario: T54_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Import_Study1_AllDictionaryChanges.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T55_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	And I check subjects in inbox folder "Jobs"
    | Subject                                                                                                                             |
    | Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
    | Publishing of Study file (Major1) - complete.                                                                                       |
	Then  I do not see the Tab "Local Labs"

Scenario: T56_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF.
    And I expand row "1" of table "AutoBuildQuestionsForD1:"	
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 4             | Unit 3         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

#Study publish-Major study update
#Labs No to Yes- Migrate all patients
Scenario: T57_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page	
	And I upload study "Study Publish_No_Yes.zip" with Label "Major1"
	And I click continue in modal dialog having title "Confirm" and partial message "Uploaded study version has Local Labs as Enabled which is different from earlier study version."
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage

Scenario: T58_Publish the study file that has Major changes	
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                                                                                                             |
    | Migration of Site 01 for Study file (Major1) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
    | Publishing of Study file (Major1) - complete.                                                                                       |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T59_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T60_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2019 | 03/03/2040 | Male   | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 3Unit | False |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T61_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublishActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublishExpected.xml" available in the project folder.
	And I have the XML file "StudyPublishActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |
