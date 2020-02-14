Feature: ODM_RecalculateReferenceRanges


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
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: T05_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In StudyAdministrationPage
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L02   | Lab02          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |

Scenario: T06_Associate Lab L02 to 01-Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L02" and lab name "Lab02" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L02   | Lab02          | PFIZER  | RD         | Active           |

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

Scenario: T08_Add patient 01-PAT from Datalabs UI
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      When I add patient with below details.
      | ScreenID | PatientInitials | ScreenDate |
      | 01       |   PAT           | 06/14/2019 |
	 Then I see below patients added in the Patients table.
      | PatientID |
      | 01-PAT    |

Scenario: T09_Select Site1 and patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T10_Expand the Visit (Screening) and open the demographics form to update the data
	When I expand "Event 1" to select and open "Demographics" CRF.
    And I click "Checkout" button on "Demographics" CRF.      
    And I enter below flat questions data in the CRF.
    | QuestionPrompt      | AnswerValue | AnswerFieldType |
    | What is your age    | 31          | TextBox         |
    | Age Unit            | Year        | ListBox         |
    | What is your gender | Male        | ListBox         |
	And I click on "Save & Close" button on "Demographics" CRF.
	Then The CRF with data is saved and checked-in successfully. 

Scenario: T11_Expand the Visit (week2) event and open the FormD1 form and update the data.
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
Scenario: T12_Verify the XML Data evented out for the Item Data is entered via Flag Update
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
#Minor study update
#Study publish
#Recalcute RR for the study update when changes in Precision and Conversion Factor
Scenario: T13_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "StudyPublish_RecalRR_Precision_ConversionFactor.zip" with Label "Minor1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button for Minor study update in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                       |
    | Publishing of Study file (Minor1) - complete. |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T14_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "RecalRR_Precision_ConversionFactorActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "RecalRR_Precision_ConversionFactorExpected.xml" available in the project folder.
	And I have the XML file "RecalRR_Precision_ConversionFactorActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US32215.1, US32215.2, US32215.3, US32215.4, US32215.5
#Minor study update
#update the from unit 3unit to 4unit and to unit 1Unit to 2unit values
#Study publish
Scenario: T15_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "StudyPublish_RecalRR_FUnit_TUnit.zip" with Label "Minor1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button for Minor study update in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                       |
    | Publishing of Study file (Minor1) - complete. |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T16_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublish_FUnit_TUnitActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublish_FUnit_TUnitExpected.xml" available in the project folder.
	And I have the XML file "StudyPublish_FUnit_TUnitActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T17_Expand the Visit (week2) event and open the FormD1 form and update the data.
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    And I select the patient "01-PAT" from patients table.
	And I expand "Visit (week2)" to select and open "FormD1" CRF.
	When I click "Checkout" button on "FormD1" CRF.  
    And I enter below "AutoBuildQuestionsForD1:" table questions data in the CRF.
        | AddNewRow | RowNumber | QuestionPrompt                 | CurrentAnswerValue | NewAnswerValue | ReasonForChange | AnswerFieldType | RowButtonToClick |
        | No        | 1         | CRF Lab (Original) Unit for D1 | Unit 3             | Unit 4         | SEC             | ListBox         | Save & Close Row |
	And I click on "Save & Close" button on "FormD1" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T18_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click on "Edit" icon of the first record and enter the below lab data and click on save and I can see "LabTest Reference Range Updated Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2018 | 03/03/2022 | Male | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 4Unit | False |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T19_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "ReCalRR_FUnit_TUnitActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "ReCalRR_FUnit_TUnitExpected.xml" available in the project folder.
	And I have the XML file "ReCalRR_FUnit_TUnitActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US32215.1
#Major study update
#Change the Lab Attribute Mappings and publish the study (Male to Female, Female to Male, Not Specified to Not Specified)
#study publish
#Recalcute RR for the study update when changes in Lab Attribute Mappings
Scenario: T20_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "StudyPublish_RecalRR_ChangeAttributeMapping.zip" with Label "Major2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                                                                                                             |
    | Migration of Site 01 for Study file (Major2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
    | Publishing of Study file (Major2) - complete.                                                                                       |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T21_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "StudyPublish_Change_AttributeMappingActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "StudyPublish_Change_AttributeMappingExpected.xml" available in the project folder.
	And I have the XML file "StudyPublish_Change_AttributeMappingActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

Scenario: T22_Add a new lab test reference range record under Lab02 under WBC
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L02" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click on "Edit" icon of the first record and enter the below lab data and click on save and I can see "LabTest Reference Range Updated Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  | NA    |
	| 02/03/2018 | 03/03/2022 | Female | >             | 0          | <           | 35       | >                    | 10                | <                     | 15                 | >                      | 5                   | <                       | 20                   | 4Unit | False |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T23_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "ReCalRR_ChangeAttributeMappingActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "ReCalRR_ChangeAttributeMappingExpected.xml" available in the project folder.
	And I have the XML file "ReCalRR_ChangeAttributeMappingActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

@ObjectiveEvidence @ReqID:US32215.1
#Major study update
#Remove Lab Mappings for RRLow, RRHigh, Critical RRLow, Critical RRHigh
#study publish
#Recalcute RR for the study update when changes in Lab Attribute Mappings
Scenario: T24_Upload and Stage a Study which has major study changes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "DictLabData_MinorStudyUpdate_New5.zip" with Label "Major2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I see notes "Note: Major changes have been detected to the study design. Patient migration will be required." in StudyVersionPropertiesPage
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
    | Subject                                                                                                                             |
    | Migration of Site 01 for Study file (Major2) - complete. 1 out of 1 patients migrated successfully. To review see migration report. |
    | Publishing of Study file (Major2) - complete.                                                                                       |

@ObjectiveEvidence @ReqID:US67434.1
Scenario: T25_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "InitialFlagItemAndFormODMActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 order by OdmSubscriberDetailKey desc"
	And I have the XML file "InitialFlagItemAndFormODMExpected.xml" available in the project folder.
	And I have the XML file "InitialFlagItemAndFormODMActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceID            |
	|         | SourceSystemVersion |

