Feature: DataLabs_V5.7.0_ODM:Sendrefreshedlabdataonpatientunlock
Test Summary:
1) Verification of ODM eventing xml for Enrolled patient status.
2) Verification of ODM eventing xml for Discontinued patient status.
3) Verification of ODM eventing xml for Completed patient status.
4) Verification of ODM eventing xml for Failed patient status.
5) Verification of ODM eventing xml for patient status override (Discontinued to Enrolled).
6) Verification of ODM eventing xml for patient status override (Completed to Enrolled).
7) Verification of ODM eventing xml for patient status override (Enrolled to Screened).
8) Verification of ODM eventing xml for patient status override (Failed to Screened).
9) Verification of unpublished events and forms as part of patient status override eventing xml.
10) Verification of derived enrolled id in Enrolled status xml.

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_ODM_Eventing_Base.Zip" with study label "Test4500"
	Then I see study label "Test4500" in header

Scenario: T04_Add Site 01-Site
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: T05_Navigate to the Edit Preferences page and set the Endpoint URL
	When I click breadcrumb "Study Administration"
	When I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Patient Data Eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful" 

Scenario: T06_Add patient 01-PAT from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |
	
Scenario: T07_Select and enroll patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 06/13/2018 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: T08_Add a new lab test reference range record
	 Given I navigate to "Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "01" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 02/25/2019 |         | Male          | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 01   | False |
	 | 02/25/2019 |         | Female        | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 01   | False |
	 | 02/25/2019 |         | Not Specified | >             | 20         | <           | 35       | >                    | 3                 | <                     | 15                 | >                      | 20.41               | <                       | 25.71                | 01   | False |
	 Then a Reference ID is auto generated for a newly added lab test in ReferenceRangesPage

#Enter data on Demographics form
Scenario: T09_Expand the Visit (Screening) and open the demographics form to update the data
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
Scenario: T10_Expand the Visit (Week2) event and open the LabForm1 form and update the data
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
	  And I click "Save" button on "LabForm1" CRF	  
	  Then The CRF with data is saved and checked-in successfully.
Scenario: T11_Verify the Lab report data
	  When I expand row "2" of table "Autobuild Table:"
	 # When I expand "Visit (Week2)" to select and open "LabForm1" CRF.
	  #And I click "Checkout" button on "LabForm2" CRF.      
	  Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
		| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
		| 2         | CRF Lab Test Name                        | Test1                   | Text            |                  |
		| 2         | Lab Test Description                     | 01                      | Text            |                  |
		| 2         | CRF Lab Unit                             | 01                      | Link            |                  |
		| 2         | CRF Lab value                            | 16                      | Link            |                  |
		| 2         | Lab Test Name                            | 01                      | Text            |                  |
		| 2         | Lab Test Code                            | 01                      | Text            |                  |
		| 2         | LOINC Code                               | 1                       | Text            |                  |
		| 2         | Category                                 | Cat1                    | Text            |                  |
		| 2         | Subcategory                              | SubCat1                 | Text            |                  |
		| 2         | Specimen                                 | Specimen1               | Text            |                  |
		| 2         | Method                                   | Method1                 | Text            |                  |
		| 2         | Result Type                              | Result1                 | Text            |                  |
		| 2         | Normal Reference Range High              | < 15.00                 | Text            |                  |
		| 2         | Critical Reference Range Low             | > 20.41                 | Text            |                  |
		| 2         | Normal Reference Range Low               | > 3.00                  | Text            |                  |
		| 2         | Critical Reference Range High            | < 25.71                 | Text            |                  |
		| 2         | Reference Range ID                       | {ReferenceRangeID1}     | Text            |                  |
		| 2         | Out of Normal Range Indicator            | Above normal range high | Text            |                  |
		| 2         | Normalized Patient Lab Value             | 16                      | Text            |                  |
		| 2         | Normalized Lab Unit                      | cm                      | Text            |                  |
		| 2         | Normalized Normal Reference Range Low    | > 3.00                  | Text            |                  |
		| 2         | Normalized Normal Reference Range High   | < 15.00                 | Text            |                  |
		| 2         | Normalized Critical Reference Range Low  | > 20.41                 | Text            |                  |
		| 2         | Reference Range Not Applicable           | No                      | Text            |                  |
		| 2         | Normalized Critical Reference Range High | < 25.71                 | Text            |                  |
		| 2         | Precision                                | 2                       | Text            |                  |
		| 2         | Conversion Factor                        | 1                       | Text            | Save & Close Row | 

	@ReqID:3.1.2.3 @ObjectiveEvidence
Scenario: T12_Verify the XML Data evented out for the Enrolled Patient from Datalabs UI
	Given I save the Event XML data in "EnrollPatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%ItemData ItemOID="ENRLID" TransactionType="Insert" Value="01"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "EnrollPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "EnrollPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

	
Scenario: T13_Discontinue the patient 01-PAT
	When I click ActionPalette Item "Discontinue Patient" in "PatientPortalActions" ActionPalette
	And I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Discontinued Date: | 06/24/2018  | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ReqID:3.1.2.3 @ObjectiveEvidence
Scenario: T14_Verify the XML Data evented out for the Discontinued Patient from Datalabs UI
	Given I save the Event XML data in "DiscontinuePatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%ItemData ItemOID="DISCDATE" TransactionType="Insert" Value="06/24/2018"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "DiscontinuePatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "DiscontinuePatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T15_Add patient 02-PAT from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 02       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 02-PAT    |

Scenario: T16_Select and enroll patient 02-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "02-PAT" from patients table.
	When I enroll the patient "02-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 02       | 06/13/2018 | Yes           |
	Then I see patient "02-PAT" status as "Enrolled" on Patient details page.

	
Scenario: T17_Complete the patient 02-PAT
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "02-PAT" from patients table.
	When I click ActionPalette Item "Complete Patient" in "PatientPortalActions" ActionPalette
	And I enter below flat questions data in the CRF.
	| QuestionPrompt  | AnswerValue | AnswerFieldType |
	| Completed Date: | 06/25/2018  | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ReqID:3.1.2.3 @ObjectiveEvidence
Scenario: T18_Verify the XML Data evented out for the Completed Patient from Datalabs UI
	Given I save the Event XML data in "CompletePatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%ItemData ItemOID="COMPDATE" TransactionType="Insert" Value="06/25/2018"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "CompletePatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "CompletePatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T19_Add patient 03-PAT from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 03       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 03-PAT    |

	
Scenario: T20_Fail the patient 03-PAT
	Given I select the patient "03-PAT" from patients table.
	When I click ActionPalette Item "Fail Patient" in "PatientPortalActions" ActionPalette
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Failed Date:   | 06/26/2018  | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ReqID:3.1.2.3 @ObjectiveEvidence
Scenario: T21_Verify the XML Data evented out for the Failed Patient from Datalabs UI
	Given I save the Event XML data in "FailPatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%ItemData ItemOID="SCRNFAILDATE" TransactionType="Insert" Value="06/26/2018"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "FailPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "FailPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T22_Select 01-Site and a patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: T23_Fill and save Discontinue Reason CRF from Discontinue event
	Given I expand "Discontinue" to select and open "Discontinue Reason" CRF.
	When I click "Checkout" button on "Discontinue Reason" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| Discontinue Reason: | Safety      | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "Discontinue Reason" CRF.
	Then The CRF with data is saved and checked-in successfully.	

	
Scenario: T24_Override the patient status from Discontinue to Enrolled for patient 01-PAT
Given I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
	And I select change to "Enrolled" in PatientStatusOverridePage
	And I enter reason "Status override from Discontinued to Enrolled" for patient status change in PatientStatusOverridePage
	And I Click save button in PatientStatusOverridePage
	Then I see success message "Status Override Changed Successfully."

	@ReqID:3.1.2.3,3.1.2.4 @ObjectiveEvidence
Scenario: T25_Verify the XML Data evented out for the Enrolled status due to status override.
	Given I save the Event XML data in "DiscontinuePatientOverrideActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%Status override from Discontinued to Enrolled%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "DiscontinuePatientOverrideExpected.xml" available in the project folder.
	And I have the XML file "DiscontinuePatientOverrideActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T26_Select 01-Site and a patient 02-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "02-PAT" from patients table.
	Then I see Patient details page for "02-PAT".

Scenario: T27_Fill and save FollowUp CRF from Complete event
	Given I expand "Complete" to select and open "FollowUp" CRF.
	When I click "Checkout" button on "FollowUp" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| Follow up comments: | Completed   | TextBox         |
	And I select entry complete checkbox on CRF.
	And I click on "Save & Close" button on "FollowUp" CRF.
	Then The CRF with data is saved and checked-in successfully.	

	
#Scenario: T24_Override the patient status from Complete to Enrolled for patient 02-PAT
#	Given I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
#	And I select change to "Enrolled" in PatientStatusOverridePage
#	And I enter reason "Status override from Completed to Enrolled" for patient status change in PatientStatusOverridePage
#	And I Click save button in PatientStatusOverridePage
#	Then I see success message "Status Override Changed Successfully."
#
#	@ReqID:3.1.2.3,3.1.2.4 @ObjectiveEvidence
#Scenario: T25_Verify the XML Data evented out for the Enrolled status due to status override.
#	Given I save the Event XML data in "CompletePatientOverrideActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%Status override from Completed to Enrolled%' order by OdmSubscriberDetailKey desc"
#	And I have the XML file "CompletePatientOverrideExpected.xml" available in the project folder.
#	And I have the XML file "CompletePatientOverrideActual.xml" available in the Test XML Files folder.
#	Then I verify that the data in both XML files is same except for below tags and fields.
#	| TagName | FieldName        |
#	|         | CreationDateTime |
#	|         | DateTimeStamp    |
#	|         | SubjectKey       |
#	|         | FileOID          |
#	|         | SourceID         |
#	|         | SourceSystemVersion |
#
#	
#Scenario: T26_Override the patient status from Enrolled to Screened for patient 01-PAT
#	Given I navigate to "Patients" tab from main menu.
#	And I select the site "01-Site" from Sites dropdown.
#	When I select the patient "01-PAT" from patients table.
#	Given I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
#	And I select change to "Screened" in PatientStatusOverridePage
#	And I enter reason "Status override from Enrolled to Screened" for patient status change in PatientStatusOverridePage
#	And I Click save button in PatientStatusOverridePage
#	Then I see success message "Status Override Changed Successfully."
#
#	@ReqID:3.1.2.3,3.1.2.4 @ObjectiveEvidence
#Scenario: T27_Verify the XML Data evented out for the Screened status due to status override.
#	Given I save the Event XML data in "EnrollPatientOverride01PATActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%Status override from Enrolled to Screened%' and XmlMessage like '%' +(Select SubjectKey from Patient where PatientIdentity='01-PAT')+ '%' order by OdmSubscriberDetailKey desc"
#	And I have the XML file "EnrollPatientOverride01PATExpected.xml" available in the project folder.
#	And I have the XML file "EnrollPatientOverride01PATActual.xml" available in the Test XML Files folder.
#	Then I verify that the data in both XML files is same except for below tags and fields.
#	| TagName | FieldName        |
#	|         | CreationDateTime |
#	|         | DateTimeStamp    |
#	|         | SubjectKey       |
#	|         | FileOID          |
#	|         | SourceID         |
#	|         | SourceSystemVersion |
#
#Scenario: T28_Override the patient status from Enrolled to Screened for patient 02-PAT
#	Given I navigate to "Patients" tab from main menu.
#	And I select the site "01-Site" from Sites dropdown.
#	When I select the patient "02-PAT" from patients table.
#	Given I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
#	And I select change to "Screened" in PatientStatusOverridePage
#	And I enter reason "Status override from Enrolled to Screened" for patient status change in PatientStatusOverridePage
#	And I Click save button in PatientStatusOverridePage
#	Then I see success message "Status Override Changed Successfully."
#
#	@ReqID:3.1.2.3,3.1.2.4 @ObjectiveEvidence
#Scenario: T29_Verify the XML Data evented out for the Screened status due to status override.
#	Given I save the Event XML data in "EnrollPatientOverride02PATActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%Status override from Enrolled to Screened%' and XmlMessage like '%' +(Select SubjectKey from Patient where PatientIdentity='02-PAT')+ '%' order by OdmSubscriberDetailKey desc"
#	And I have the XML file "EnrollPatientOverride02PATExpected.xml" available in the project folder.
#	And I have the XML file "EnrollPatientOverride02PATActual.xml" available in the Test XML Files folder.
#	Then I verify that the data in both XML files is same except for below tags and fields.
#	| TagName | FieldName        |
#	|         | CreationDateTime |
#	|         | DateTimeStamp    |
#	|         | SubjectKey       |
#	|         | FileOID          |
#	|         | SourceID         |
#	|         | SourceSystemVersion |
#
#Scenario: T30_Select 01-Site and a patient 03-PAT.
#	Given I navigate to "Patients" tab from main menu.
#	And I select the site "01-Site" from Sites dropdown.
#	When I select the patient "03-PAT" from patients table.
#	Then I see Patient details page for "03-PAT".
#
#Scenario: T31_Fill and save FollowUp CRF from Fail event
#	Given I expand "Fail" to select and open "Fail Reason" CRF.
#	When I click "Checkout" button on "Fail Reason" CRF.
#	And I enter below flat questions data in the CRF.
#	| QuestionPrompt   | AnswerValue | AnswerFieldType |
#	| Reason for fail? | Illness     | TextBox         |
#	And I select entry complete checkbox on CRF.
#	And I click on "Save & Close" button on "Fail Reason" CRF.
#	Then The CRF with data is saved and checked-in successfully.	
#
#	
#Scenario: T32_Override the patient status from Failed to Screened for patient 03-PAT
#	Given I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
#	And I select change to "Screened" in PatientStatusOverridePage
#	And I enter reason "Status override from Failed to Screened" for patient status change in PatientStatusOverridePage
#	And I Click save button in PatientStatusOverridePage
#	Then I see success message "Status Override Changed Successfully."
#
#	@ReqID:3.1.2.3, 3.1.2.4 @ObjectiveEvidence
#Scenario: T33_Verify the XML Data evented out for the Screened status due to status override.
#	Given I save the Event XML data in "FailPatientOverrideActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%Status override from Failed to Screened%' order by OdmSubscriberDetailKey desc"
#	And I have the XML file "FailPatientOverrideExpected.xml" available in the project folder.
#	And I have the XML file "FailPatientOverrideActual.xml" available in the Test XML Files folder.
#	Then I verify that the data in both XML files is same except for below tags and fields.
#	| TagName | FieldName        |
#	|         | CreationDateTime |
#	|         | DateTimeStamp    |
#	|         | SubjectKey       |
#	|         | FileOID          |
#	|         | SourceID         |
#	|         | SourceSystemVersion |
#
#Scenario: T34_Add patient 04-PAT from Datalabs UI
#	Given I navigate to "Patients" tab from main menu.
#	And I select the site "01-Site" from Sites dropdown.
#	When I add patient with below details.
#	| ScreenID | PatientInitials | ScreenDate |
#	| 04       | PAT             | 06/13/2018 |
#	Then I see below patients added in the Patients table.
#	| PatientID |
#	| 04-PAT    |
#
#Scenario: T35_Select and enroll patient 04-PAT.
#	Given I navigate to "Patients" tab from main menu.
#	And I select the site "01-Site" from Sites dropdown.
#	And I select the patient "04-PAT" from patients table.
#	When I enroll the patient "04-PAT" with below data.
#	| EnrollID | EnrollDate | EntryComplete |
#	| 04       | 06/13/2018 | Yes           |
#	Then I see patient "04-PAT" status as "Enrolled" on Patient details page.
#
#Scenario: T36_Select Form1 from Visit (Week 2) event and enter data in CRF.
#	Given I expand "Visit (Week 2)" to select and open "Form1" CRF.
#	When I click "Checkout" button on "Form1" CRF.
#	And I enter below flat questions data in the CRF.
#	| QuestionPrompt         | AnswerValue | AnswerFieldType |
#	| Sample text question:  | Text        | TextBox         |
#	| Sample radio question: | No          | Radio           |
#	And I enter below "Sample Table:" table questions data in the CRF.
#	| AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
#	| Yes       | 1         | Drug Name:     | Test Drug   | TextBox         |                  |
#	| No        | 1         | Condition:     | Initial     | TextBox         |                  |
#	| No        | 1         | Start Date:    | 01/01/2000  | TextBox         | Save & Close Row |
#	| Yes       | 2         | Drug Name:     | Test Drug 2 | TextBox         |                  |
#	| N0        | 2         | Start Date:    | 01/01/2010  | TextBox         | Save & Close Row |
#	And I select entry complete checkbox on CRF.
#	And I click on "Save & Close" button on "Form1" CRF.
#	And I click Continue button of Modal "Queries Result"
#	Then The CRF with data is saved and checked-in successfully.
#
#Scenario: T37_Select Autobuild Fixed 1 from Visit (Week 20) event and enter data in CRF.
#	Given I expand "Visit (Week 20)" to select and open "Autobuild Fixed 1" CRF.
#	When I click "Checkout" button on "Autobuild Fixed 1" CRF.
#	And I enter below "First auto build table (max rows: 6, structure: fixed):" autobuild table questions data in the CRF.
#	| AddNewRow | RowNumber | QuestionPrompt                                                              | AnswerValue | AnswerFieldType | RowButtonToClick |
#	| No        | 1         | Gender question (male or female):                                           | Male        | ListBox         |                  |
#	| No        | 1         | Non-key sequence code list (inches or centimeters):                         | cm          | Radio           |                  |
#	| No        | 1         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
#	| No        | 3         | Float value: (Maxlength: 5 {Sent}, DataType {Sent}, MaxPrecision: 3 {Draft} | 166.12      | TextBox         | Save & Close Row |
#	And I select entry complete checkbox on CRF.
#	And I click on "Save & Close" button on "Autobuild Fixed 1" CRF.
#	Then The CRF with data is saved and checked-in successfully.
#
#	
#Scenario: T38_Override the patient status from Enrolled to Screened for patient 04-PAT
#	Given I click ActionPalette Item "Patient Status Override" in "PatientPortalActions" ActionPalette
#	And I select change to "Screened" in PatientStatusOverridePage
#	And I enter reason "Status override from Enrolled to Screened" for patient status change in PatientStatusOverridePage
#	And I Click save button in PatientStatusOverridePage
#	Then I see success message "Status Override Changed Successfully."
#
#	@ReqID:3.1.2.3,3.1.2.4 @ObjectiveEvidence
#Scenario: T39_Verify the XML Data evented out for the Screened status due to status override.
#	Given I save the Event XML data in "EnrollPatientOverride04PATActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%Status override from Enrolled to Screened%' and XmlMessage like '%' +(Select SubjectKey from Patient where PatientIdentity='04-PAT')+ '%' order by OdmSubscriberDetailKey desc"
#	And I have the XML file "EnrollPatientOverride04PATExpected.xml" available in the project folder.
#	And I have the XML file "EnrollPatientOverride04PATActual.xml" available in the Test XML Files folder.
#	Then I verify that the data in both XML files is same except for below tags and fields.
#	| TagName | FieldName        |
#	|         | CreationDateTime |
#	|         | DateTimeStamp    |
#	|         | SubjectKey       |
#	|         | FileOID          |
#	|         | SourceID         |
#	|         | SourceSystemVersion |
#
#Scenario: T40_Delete the current study
#	When I delete study
#	Then I see study label "No Study Loaded" in header
#
#Scenario: T41_Publish the study
#	When I click breadcrumb "Study Management"
#	And I upload a study "Test4500_ODM_Eventing_DeriveEnrollID.Zip" with study label "Test4500"
#	Then I see study label "Test4500" in header
#
#Scenario: T42_Add patient 04-PAT from Datalabs UI
#	Given I navigate to "Patients" tab from main menu.
#	And I select the site "01-Site" from Sites dropdown.
#	When I add patient with below details.
#	| ScreenID | PatientInitials | ScreenDate |
#	| 05       | PAT             | 06/13/2018 |
#	Then I see below patients added in the Patients table.
#	| PatientID |
#	| 05-PAT    |
#
#	
#Scenario: T43_Select and enroll patient 05-PAT.
#	Given I navigate to "Patients" tab from main menu.
#	And I select the site "01-Site" from Sites dropdown.
#	And I select the patient "05-PAT" from patients table.
#	When I enroll the patient "05-PAT" with below data.
#	| EnrollID | EnrollDate | EntryComplete |
#	|          | 06/13/2018 | Yes           |
#	Then I see patient "05-PAT" status as "Enrolled" on Patient details page.
#
#	@ReqID:3.1.2.3 @ObjectiveEvidence
#Scenario: T44_Verify the XML Data evented out for the Enrolled Patient from Datalabs UI
#	Given I save the Event XML data in "EnrollPatientFromUIActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 3 and XmlMessage like '%ItemData ItemOID="ENRLID" TransactionType="Insert" Value="05"%' order by OdmSubscriberDetailKey desc"
#	And I have the XML file "EnrollPatientFromUIExpected2.xml" available in the project folder.
#	And I have the XML file "EnrollPatientFromUIActual2.xml" available in the Test XML Files folder.
#	Then I verify that the data in both XML files is same except for below tags and fields.
#	| TagName | FieldName        |
#	|         | CreationDateTime |
#	|         | DateTimeStamp    |
#	|         | SubjectKey       |
#	|         | FileOID          |
#	|         | SourceID         |
#	|         | SourceSystemVersion |

Scenario: T45_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page