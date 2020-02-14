Feature: Linkages_EditChecks

@ObjectiveEvidence
Scenario: 001_Login to DataLabs Application
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 002_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 003_01_Publish a study.
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_Linkages_Editchecks and Custom Queries.Zip" with study label "LABSEDITCHECKS"
	Then I see study label "Test4500_GM" in header.

Scenario: 003_02_Add Site.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             |            |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: 004_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials	 | ScreenDate |
	| 01       | Patient             | 12/06/2017 |
	| 02       | Patient	         | 12/06/2017 |
	| 03       | Patient		     | 12/06/2017 |
	Then I see below patients added in the Patients table.
	| PatientID		|
	| 01-Patient    |
	| 02-Patient    |
	| 03-Patient    |
#Enforced Edit Check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 005_Select Patient and select form "LinkagesForm_FlatQuestions"
	Given I select the patient "01-Patient" from patients table.
	When I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	And I select "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I select entry complete checkbox.
	And I select "Save" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify queries under queries type "Please Resolve Enforced Queries" in Modal "Queries Result"
         | Queries								|
         | CountryLanguage is missing.		    |
#Required Edit Check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 006_Select the back to CRF button and Select the Value Countrylanguage as "MultiLanguage" and save the CRF
	When I click back to CRF button of Modal "Queries Result" 
	And I enter below flat questions data in the CRF.
	| QuestionPrompt  | AnswerValue   | AnswerFieldType |
	| CountryLanguage | MultiLanguage | ListBox         |
	And I select "Save" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
         | Queries             |
         | Country is missing. |
#MNA Edit check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 007_Select the back to CRF button and Select the Mark Not Answered and Save the CRF
	When I click back to CRF button of Modal "Queries Result"
	And  I enter below flat questions data in the CRF.
	| QuestionPrompt| AnswerValue | AnswerFieldType |
	| Country		| AS_India	| ListBox         |

	And I click icon "icon_mna_disabled.png" for the flat question "TypeOfMeasurement" in CRF
    And I enter comments "MNA1" in MarkItemDialog
    And I click ok button in MarkItemDialog
	And I select "Save & Close" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
    | Queries                                            |
    | TypeOfMeasurement cannot be marked "Not Answered". |

Scenario: 008_Select the Continue button. CRF data is saved and checked in Successfully
	When I click Continue button of Modal "Queries Result"
	Then The CRF with data is saved and checked-in successfully.

#Enforced Edit Check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 009_Verify enforced edit check for autobuild table question
	When I expand "Visit (Week 2)" to select and open "LinkagesForm_AutobuildTable" CRF.
	And I select "Checkout" button on "LinkagesForm_AutobuildTable" CRF.
	And I select entry complete checkbox.
	And I enter below "Linkages Autobuild table:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                      | AnswerValue			 | AnswerFieldType | RowButtonToClick |
	| No        | 1         | ColorType                                           | PrimaryColors        | ListBox         | Save & Close Row |
	Then I verify queries under queries type "Please Resolve Enforced Queries" in Modal "Queries Result"
         | Queries						|
         | Row # 1: Degree Courses is missing. |

#Required Edit Check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 010_Verify required edit check for autobuild table question
	When I click back to CRF button of Modal "Queries Result"
	And I enter below "Linkages Autobuild table:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                      | AnswerValue			 | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Degree Courses                                      | CSE			         | ListBox         | Save & Close Row |
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
         | Queries						|
         | Row # 1: Country is missing. |

#MNA Edit check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 011_Verify MNA edit check for autobuild table question
	When I click back to CRF button of Modal "Queries Result"
	And I click "icon_mna_disabled.png" icon of a question "IntermediateCourses" of table "Linkages Autobuild table:"
	And I enter comments "Commetns for MarkItemNotAnswered" in MarkItemDialog
    And I click ok button in MarkItemDialog
	And I enter below "Linkages Autobuild table:" autobuild table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt                                      | AnswerValue			 | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Country			                                  | AS_India	         | Radio	       | Save & Close Row |
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
         | Queries |
         | Row # 1: IntermediateCourses cannot be marked "Not Answered". |

Scenario: 012_Save form "LinkagesForm_AutobuildTable" without entry complete checkbox
	When I click Continue button of Modal "Queries Result"
	And I deselect entry complete checkbox
	And I select "Save & Close" button on "LinkagesForm_AutobuildTable" CRF.
	Then The CRF with data is saved and checked-in successfully.

#Enforced Edit Check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 013_Verify enforced edit check for non-autobuild table question
	Given I expand "Visit (Week 2)" to select and open "LinkagesForm_NonAutobuildTable" CRF.
	When I select "Checkout" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I select entry complete checkbox.
	And I enter below "CodeListLinkages table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt   | AnswerValue   | AnswerFieldType | RowButtonToClick |
         | Yes       | 1         | Measurement      | Meters        | Radio           |                  |
         | No        | 1         | Country_Language | MultiLanguage | ListBox         | Save & Close Row |
	Then I verify queries under queries type "Please Resolve Enforced Queries" in Modal "Queries Result"
         | Queries |
         | Row # 1: Color is missing. |

#Required Edit Check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 014_Verify required edit check for non-autobuild table question
	When I click back to CRF button of Modal "Queries Result"
	And I enter below "CodeListLinkages table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         |     No    |     1     |      Color     |  Red        |      Radio      | Save & Close Row |
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
         | Queries |
         | Row # 1: Continent is missing.       |

#MNA Edit check
	@ObjectiveEvidence @ReqID:US44391.1,US44391.2,US44391.3
Scenario: 015_Verify MNA edit check for non-autobuild table question
	When I click back to CRF button of Modal "Queries Result"
	And I click "icon_mna_disabled.png" icon of a question "Country" of table "CodeListLinkages table:"
	And I enter comments "Commetns for MarkItemNotAnswered" in MarkItemDialog
    And I click ok button in MarkItemDialog
	And I enter below "CodeListLinkages table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         |     No    |     1     |      Continent     |  Asia        |      ListBox      | Save & Close Row |
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
         | Queries |
         | Row # 1: Country cannot be marked "Not Answered".        |

Scenario: 016_Select the Continue button. CRF data is saved and checked in Successfully
	When I click Continue button of Modal "Queries Result"
	And I select "Save & Close" button on "LinkagesForm_NonAutobuildTable" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	#L4 Param1
Scenario: 017_Enter param1 value to verify L4 query edit check
	Given I click breadcrumb "All Patients".
	And I select the patient "02-Patient" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	When I select "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt | AnswerValue | AnswerFieldType |
         |     Country    |   AS_India  |     ListBox     |
	And I select "Save & Close" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"
	
	#L4 Param2
Scenario: 018_Enter param2 value to verify L4 query edit check
	Given I expand "Visit (Week 2)" to select and open "LinkagesForm_NonAutobuildTable" CRF.
	When I select "checkout" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I enter below "CodeListLinkages table:" table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         |    Yes    |     1     |  Country       |   AS_India  |    ListBox      | Save & Close Row |
	And I click on "Save & Close" button on "LinkagesForm_NonAutobuildTable" CRF.
	Then I verify the success message displayed as "CRF has been saved and checked in successfully"

	#L4 Query Verification
Scenario: 019_Verify L4 query for flat question
	Given I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
		 | DCFID | Status | QueryDescription | DateTime |
		 |       | Sent	 | LinkagesForm_FlatQuestions Country value is same as Row 1 of LinkagesForm_NonAutobuildTable Country value     |          |
	
	#L4 Query Verification
Scenario: 020_Verify L4 query for non-autobuild table
	Given I click breadcrumb "02-Patient".
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_NonAutobuildTable" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form 
	Then I see DCF details in DCFs subtab in Form
         | DCFID | Status | QueryDescription | DateTime |
         |       | Sent   | LinkagesForm_FlatQuestions Country value is same as Row 1 of LinkagesForm_NonAutobuildTable Country value |          |
	
	#L5 Param1
Scenario: 021_Enter param1 to verify L5 query edit check
	Given I click breadcrumb "02-Patient".
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_AutoBuildTable" CRF.
	When I select "checkout" button on "LinkagesForm_AutobuildTable" CRF.
	And I enter below "Linkages Autobuild table:" autobuild table questions data in the CRF.
         | AddNewRow | RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
         | No        | 1         | Country        | AS_India    | Radio           | Save & Close Row |
	And I select "Save & Close" button on "LinkagesForm_AutobuildTable" CRF.
	Then The CRF with data is saved and checked-in successfully.
	
	#L5 Param2
Scenario: 022_Enter param2 to verify L5 query edit check
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I select "checkout" button on "Form1" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt        | AnswerValue | AnswerFieldType |
         | Sample text question: | AS_India    | TextBox         |
	And I select "Save & Close" button on "Form1" CRF.
	Then The CRF with data is saved and checked-in successfully.

	#L5 Query Verification
Scenario: 023_Verify L5 query in form "Form1"
	Given I expand "Visit (Screening)" to select and open "Form1" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form 
	Then I see DCF details in DCFs subtab in Form
         | DCFID | Status | QueryDescription                                                            | DateTime |
         |       | Sent   | Form1 Text Value is same as LinkagesForm_AutobuildTable Row 1 country Value |          |

	#L5 Query Verification
Scenario: 024_Verify L5 query in form "LinkagesForm_AutobuildTable"
	Given I click breadcrumb "02-Patient".
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_AutoBuildTable" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
         | DCFID | Status | QueryDescription                                                            | DateTime |
         |       | Sent   | Form1 Text Value is same as LinkagesForm_AutobuildTable Row 1 country Value |          |
	
	#L3 within form Query Check
Scenario: 025_Verify L3 query in form "LinkagesForm_FlatQuestions"
	Given I select "Patients" tab from the main menu of DataLabs.
	And I select the patient "03-Patient" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	When I select "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I enter below data for Flat questions in CRF.
         | QuestionPrompt | AnswerValue | AnswerFieldType |
         | Continent      | Asia        | ListBox         |
         | Country        | AS_India    | ListBox         |
	And I select "Save & Close" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify queries under queries type "New Queries" in Modal "Queries Result"
         | Queries                                   |
         | Continent is Asia and Country is AS_India |

Scenario: 026_Verify L3 query in DCF tab of form "LinkagesForm_FlatQuestions"
	Given I click continue button of Modal "Queries Result"
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	When I open main tab "DCFs" of Form
	And I open DCFs subtab "All" in Form
	Then I see DCF details in DCFs subtab in Form
		 | DCFID | Status | QueryDescription                          | DateTime |
		 |       | Sent   | Continent is Asia and Country is AS_India |          |

