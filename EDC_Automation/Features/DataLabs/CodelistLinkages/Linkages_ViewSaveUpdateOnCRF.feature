Feature: Linkages_ViewSaveUpdateOnCRF
	Verify Codelist Linkages on CRF Page.
	Select Value for Primary question item and verify code items display on secondary question.

@ObjectiveEvidence
Scenario: T01_Login to DataLabs application as administrator user.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

Scenario: T02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

@ObjectiveEvidence @ReqId:US40539.1,US40539.2,US40539.3
Scenario: T03_01_Publish a study.
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_CodelistLinkages_Base.Zip" with study label "L1"
	Then I see study label "Test4500_GM" in header.

Scenario: T03_02_Select Complete Change History
	When I select DataManagerPortal item "User Preferences" from drop down
	When I select Complete Change History radio button on User Preferences page.
	And I click Save button on User Preferences page.
	Then I see Save Success message on User Preferences page.

	# Method to verify site details page
@ObjectiveEvidence @ReqId:US37916.1	
Scenario: T04_Add Site.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| S11    | Site1    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             |            |
	And I open site with siteid "S11" and site name "Site1" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "S11-Site1"
	
Scenario: T05_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu. 
	And I select the site "S11-Site1" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 06/12/2017 |
	| 02       | PAT             | 06/13/2017 |
	| 03       | PAT             | 06/14/2017 |
	| 04       | PAT             | 06/15/2017 |
	| 05       | PAT             | 06/16/2017 |
	| 06       | PAT             | 06/17/2017 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |
	| 02-PAT    |
	| 03-PAT    |
	| 04-PAT    |
	| 05-PAT    |
	| 06-PAT    |

# Codelist Linkages verification on Flat Questions: Direct scenarios, both primary and secondary are list box fields.
@ObjectiveEvidence @ReqId:US41971.1,US41971.3	
Scenario: T06_Select a form, enter value for primary question to verify relation items on secondary question
	When I select the patient "01-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	And I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent		 | Asia		   | ListBox         |
	Then I Verify below "ListBox" items are displayed in "Country" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| AS_India     |
	| AS_China     |
	| AS_Japan     |
@ObjectiveEvidence @ReqId:US41971.1,US41971.1
Scenario: T07_Select a form, enter value for primary question to verify relation items on secondary question
	When I click on "Cancel" button on "LinkagesForm_FlatQuestions" CRF.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	And I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent		 | Africa	   | ListBox         |
	Then I Verify below "ListBox" items are displayed in "Country" on the CRF.
	| ItemToVerify		|
	| [Blank]			|
	| AF_Kenya			|
	| AF_SouthAfrica    |
	| AF_Egypt			|

Scenario: T08_Select a form, enter value for primary question to verify relation items on secondary question
	When I click on "Cancel" button on "LinkagesForm_FlatQuestions" CRF.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	And I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent		 | Europe	   | ListBox         |
	Then I Verify below "ListBox" items are displayed in "Country" on the CRF.
	| ItemToVerify		|
	| [Blank]			|
	| EU_France			|
	| EU_Germany	    |
	| EU_Italy			|

	#  If primary value is blank and doesn't have any secondary items mapped, secondary question should be enabled and displays all codelist items. 
	@ObjectiveEvidence @ReqId:US41971.2
Scenario: T09_Select a form, enter value for primary question to verify relation items on secondary question  
	When I click on "Cancel" button on "LinkagesForm_FlatQuestions" CRF.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	And I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent		 | [Blank]	   | ListBox         |
	Then I Verify below "ListBox" items are displayed in "Country" on the CRF.
	| ItemToVerify   |
	| [Blank]        |
	| AS_India       |
	| AS_China       |
	| AS_Japan       |
	| AF_Kenya       |
	| AF_SouthAfrica |
	| AF_Egypt       |
	| EU_France      |
	| EU_Germany     |
	| EU_Italy       |

Scenario: T10_01_Select a form, enter value for primary and secondary question and verify data on CRF view page.
	When I click on "Cancel" button on "LinkagesForm_FlatQuestions" CRF.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	And I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent      | Asia        | ListBox         |
	| Country        | AS_India    | ListBox         |
	And I click "Save" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent      | Asia        | Text            |
	| Country        | AS_India    | Text            |
	
	# Change History Verification included
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T10_02_Select Change History icon for Q1.Response displays as "Asia" and Reason as "Initial Entry" and Notes as "Submitted"
	When I click icon "changeHistory.gif" for the flat question "Continent" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Asia     | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T10_03_Select Change History icon for Q2. Response display as "AS_India" and Reason as "Initial Entry" and Notes as "Submitted"
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Country" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes                               |
         |          | AS_India | Reason: Initial Entry\r\nNotes: Submitted |

# Codelist Linkages verification on Flat Questions: Nested scenarios,  both primary and secondary are list box fields.
	@ObjectiveEvidence @ReqId:US42987.1,US42987.1,US42987.2,US42987.4
Scenario: T11_Select a form, Verify listbox items on un-submitted CRF without checkout.
	Given I click cancel button in ChangeHistoryModal
	And I navigate to "Patients" tab from main menu.
	When I select the patient "02-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	Then I Verify below "ListBox" items are displayed in "Continent" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Asia         |
	| Africa       |
	| Europe       |
	And I Verify below "ListBox" items are displayed in "Country" on the CRF.
	| ItemToVerify   |
	| [Blank]        |
	| AS_India       |
	| AS_China       |
	| AS_Japan       |
	| AF_Kenya       |
	| AF_SouthAfrica |
	| AF_Egypt       |
	| EU_France      |
	| EU_Germany     |
	| EU_Italy       |
	And I Verify below "ListBox" items are displayed in "CountryLanguage" on the CRF.
	| ItemToVerify  |
	| MultiLanguage |
	| Chinese       |
	| Japanese      |
	And I Verify below "ListBox" items are displayed in "Country Government" on the CRF.
	| ItemToVerify            |
	| Constitutional Monarchy |
	| Communist Monarchy      |
	| Democratic Monarchy     |
@ObjectiveEvidence @ReqId:US41971.5,US42987.1,US42987.2,US42987.4
Scenario: T12_Select a form, verify data on un-submitted CRF after checkout.
	When I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Continent          | [Blank]     | ListBox         |
	| Country            | [Blank]     | ListBox         |
	| CountryLanguage    | [Blank]     | ListBox         |
	| Country Government | [Blank]     | ListBox         |
	@ObjectiveEvidence @ReqId:US42987.1,US42987.2,US42987.4
Scenario: T13_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent      | Asia        | ListBox         |
	| Country        | AS_India    | ListBox         |
	Then I Verify below "ListBox" items are displayed in "CountryLanguage" on the CRF.
	| ItemToVerify  |
	| [Blank]       |
	| MultiLanguage |
	And I Verify below "ListBox" items are displayed in "Country Government" on the CRF.
	| ItemToVerify        |
	| [Blank]             |
	| Democratic Monarchy |
	@ObjectiveEvidence @ReqId:US42987.1,US42987.2,US42987.4
Scenario: T14_Select a form, enter value for primary question to verify relation items on secondary question. 
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent      | Asia        | ListBox         |
	| Country        | AS_China    | ListBox         |
	Then I Verify below "ListBox" items are displayed in "CountryLanguage" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Chinese      |
	And I Verify below "ListBox" items are displayed in "Country Government" on the CRF.
	| ItemToVerify       |
	| [Blank]            |
	| Communist Monarchy |
	@ObjectiveEvidence @ReqId:US42987.1,US42987.2,US42987.4
Scenario: T15_Select a form, enter value for primary question to verify relation items on secondary question. 
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent      | Asia        | ListBox         |
	| Country        | AS_Japan    | ListBox         |
	Then I Verify below "ListBox" items are displayed in "CountryLanguage" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Japanese     |
	And I Verify below "ListBox" items are displayed in "Country Government" on the CRF.
	| ItemToVerify            |
	| [Blank]                 |
	| Constitutional Monarchy |
	@ObjectiveEvidence @ReqId:US42987.1,US42987.2,US42987.4
Scenario: T16_Select a form, enter value for primary question to verify relation items on secondary question. 
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent      | Africa      | ListBox         |
	| Country        | [Blank]     | ListBox         |
	Then I Verify below "ListBox" items are displayed in "CountryLanguage" on the CRF.
	| ItemToVerify  |
	| [Blank]       |
	| MultiLanguage |
	| Chinese       |
	| Japanese      |
	And I Verify below "ListBox" items are displayed in "Country Government" on the CRF.
	| ItemToVerify            |
	| [Blank]                 |
	| Constitutional Monarchy |
	| Communist Monarchy      |
	| Democratic Monarchy     |


#  If selected primary item has no mappings in study, secondary question displays all codelist items. 
	@ObjectiveEvidence @ReqId:US42987.1,US42987.2,US42987.4
Scenario: T17_Select a form, enter value for primary question to verify relation items on secondary question. 
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Continent      | Africa      | ListBox         |
	| Country        | AF_Kenya    | ListBox         |
	Then I Verify below "ListBox" items are displayed in "CountryLanguage" on the CRF.
	| ItemToVerify |
	| MultiLanguage |
	| Chinese       |
	| Japanese      |
	And I Verify below "ListBox" items are displayed in "Country Government" on the CRF.
	| ItemToVerify            |
	| [Blank]                 |
	@ObjectiveEvidence @ReqId:US42987.1,US42987.2,US42987.4
Scenario: T18_01_Select a form, enter value for primary and secondary question and verify data on CRF view page.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue         | AnswerFieldType |
	| Continent          | Asia                | ListBox         |
	| Country            | AS_India            | ListBox         |
	| CountryLanguage    | MultiLanguage       | ListBox         |
	| Country Government | Democratic Monarchy | ListBox         |
	And I click "Save" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue         | AnswerFieldType |
	| Continent          | Asia                | Text            |
	| Country            | AS_India            | Text            |
	| CountryLanguage    | MultiLanguage      | Text            |
	| Country Government | Democratic Monarchy | Text            |
	# Change History Verification
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T18_02_Select Change History icon for Q1
	When I click icon "changeHistory.gif" for the flat question "Continent" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Asia     | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T18_03_Select Change History icon for Q1
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Country" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | AS_India | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T18_04_Select Change History for Q3
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "CountryLanguage" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response      | ReasonNotes                               |
	|          | MultiLanguage | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T18_05_Select Change History for Q4
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Country Government" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response            | ReasonNotes                               |
	|          | Democratic Monarchy | Reason: Initial Entry\r\nNotes: Submitted |

	# Codelist Linkages verification on Flat Questions: Direct scenarios, both primary and secondary are radio fields.

Scenario: T19_Select a form, Verify radio items on un-submitted CRF without checkout.
	Given I click cancel button in ChangeHistoryModal
	And I navigate to "Patients" tab from main menu.
	When I select the patient "03-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	Then I Verify below "RadioGroup" items are displayed in "TypeOfMeasurement" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Length       |
	| Width        |
	| Speed        |
	| Weight       |
	And I Verify below "RadioGroup" items are displayed in "Measurement" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Feets        |
	| Meters       |
	| Kgs          |
	| Grams        |
	| MilliGrams   |
	| KMPH         |

Scenario: T20_Select a form, verify data on un-submitted CRF after checkout.
	When I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt    | AnswerValue | AnswerFieldType |
	| TypeOfMeasurement | [Blank]     | Radio           |
	| Measurement       | [Blank]     | Radio           |        
	

Scenario: T21_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt    | AnswerValue | AnswerFieldType |
	| TypeOfMeasurement | Length      | Radio           |	
	Then I Verify below "RadioGroup" items are displayed in "Measurement" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Feets        |
	| Meters       |

Scenario: T22_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt    | AnswerValue | AnswerFieldType |
	| TypeOfMeasurement | Width       | Radio           |	
	Then I Verify below "RadioGroup" items are displayed in "Measurement" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Feets        |
	| Meters       |
	
Scenario: T23_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt    | AnswerValue | AnswerFieldType |
	| TypeOfMeasurement | Speed       | Radio           |	
	Then I Verify below "RadioGroup" items are displayed in "Measurement" on the CRF.
	| ItemToVerify |
	| KMPH         |

Scenario: T24_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt    | AnswerValue | AnswerFieldType |
	| TypeOfMeasurement | Weight       | Radio           |	
	Then I Verify below "RadioGroup" items are displayed in "Measurement" on the CRF.
	| ItemToVerify |
	| Kgs          |
	| Grams        |
	| MilliGrams   |
@ObjectiveEvidence @ReqId:US41971.6
Scenario: T25_01_Select a form, enter value for primary and secondary question and verify data on CRF view page.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt    | AnswerValue | AnswerFieldType |
	| TypeOfMeasurement | Length      | Radio           |
	| Measurement       | Feets       | Radio           |
	And I click "Save" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt    | AnswerValue | AnswerFieldType |
	| TypeOfMeasurement | Length      | Text            |
	| Measurement       | Feets       | Text            |
	# Change History Verification for Radio button items
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T25_02_Select the Change history icon for the question "TypeOfMeasurement"
	When I click icon "changeHistory.gif" for the flat question "TypeOfMeasurement" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Length   | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T25_03_Select Change history icon for the question "Measurement"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Measurement" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Feets    | Reason: Initial Entry\r\nNotes: Submitted |

# Codelist Linkages verification on Flat Questions: Direct scenarios, primary item is listbox field and secondary item is radio field.

Scenario: T26_Select a form, Verify radio and listbox items on un-submitted CRF without checkout.
	Given I navigate to "Patients" tab from main menu.
	When I select the patient "04-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	Then I Verify below "ListBox" items are displayed in "ColorType" on the CRF.
	| ItemToVerify    |
	| [Blank]         |
	| PrimaryColors   |
	| SecondaryColors |
	And I Verify below "RadioGroup" items are displayed in "Color" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Red          |
	| Yellow       |
	| Blue         |
	| Green        |
	| Brown        |
	| White        |
	| Black        |

Scenario: T27_Select a form, verify data on un-submitted CRF after checkout.
	When I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| ColorType      | [Blank]     | ListBox         |
	| Color          | [Blank]     | Radio           |  
	
	# Primary value is blank, secondary item displays all codelist items
Scenario: T28_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| ColorType      | [Blank]     | ListBox         |
	Then I Verify below "RadioGroup" items are displayed in "Color" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Red          |
	| Yellow       |
	| Blue         |
	| Green        |
	| Brown        |
	| White        |
	| Black        |

Scenario: T29_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue   | AnswerFieldType |
	| ColorType      | PrimaryColors | ListBox         |	
	Then I Verify below "RadioGroup" items are displayed in "Color" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Red          |
	| Yellow       |
	| Blue         |
	
Scenario: T30_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue     | AnswerFieldType |
	| ColorType      | SecondaryColors | ListBox         |  
	Then I Verify below "RadioGroup" items are displayed in "Color" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Green        |
	| Brown        |
	| White        |
	| Black        |
@ObjectiveEvidence @ReqId:US41971.6
Scenario: T31_01_Select a form, enter value for primary and secondary question and verify data on CRF view page.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue     | AnswerFieldType |
	| ColorType      | SecondaryColors | ListBox         |
	| Color          | White           | Radio           |
	And I click "Save" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue     | AnswerFieldType |
	| ColorType      | SecondaryColors | Text            |
	| Color          | White           | Text            |
	# Change history verification
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T31_02_Select Change history icon for the question "ColorType"
	When I click icon "changeHistory.gif" for the flat question "ColorType" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response        | ReasonNotes                               |
	|          | SecondaryColors | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T31_03_Select Change history icon for the question "Color"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Color" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | White    | Reason: Initial Entry\r\nNotes: Submitted |

	# Codelist Linkages verification on Flat Questions: Direct scenarios, primary item is Radio field and secondary item is ListBox field.

Scenario: T32_Select a form, Verify radio and listbox items on un-submitted CRF without checkout.
	Given I navigate to "Patients" tab from main menu.
	When I select the patient "05-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	Then I Verify below "RadioGroup" items are displayed in "Game" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| Cricket      |
	| kabaddi      |
	| VolleyBall   |
	And I Verify below "ListBox" items are displayed in "NoOfPlayes" on the CRF.
	| ItemToVerify |
	| 6            |
	| 11           |
	| 7            |

Scenario: T33_Select a form, verify data on un-submitted CRF after checkout.
	When I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Game           | [Blank]     | Radio           |
	| NoOfPlayes     | [Blank]     | ListBox         |
	
	
Scenario: T34_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Game           | Cricket    | Radio           |
	Then I Verify below "ListBox" items are displayed in "NoOfPlayes" on the CRF.
	| ItemToVerify |
	| 11           |
	
# If primary value is blank, secondary question displays all codelist items
Scenario: T35_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Game           | [Blank]     | Radio           |
	Then I Verify below "ListBox" items are displayed in "NoOfPlayes" on the CRF.
	| ItemToVerify |
	| 6            |
	| 11           |
	| 7            |
	
Scenario: T36_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Game           | kabaddi     | Radio           |
	Then I Verify below "ListBox" items are displayed in "NoOfPlayes" on the CRF.
	| ItemToVerify |
	| 7            |

Scenario: T37_Select a form, enter value for primary and secondary question and verify data on CRF view page.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Game           | VolleyBall  | Radio           |
	Then I Verify below "ListBox" items are displayed in "NoOfPlayes" on the CRF.
	| ItemToVerify |
	| 6            |
	@ObjectiveEvidence @ReqId:US41971.6
Scenario: T38_01_Select a form, enter value for primary and secondary question and verify data on CRF view page.
	When I click "Save" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Game           | VolleyBall  | Text            |
	| NoOfPlayes     | 6           | ListBox         |
	# Change History verification
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T38_02_Select the change history icon for the question "Game"
	When I click icon "changeHistory.gif" for the flat question "Game" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response   | ReasonNotes                               |
	|          | VolleyBall | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T38_03_Close the Change history pop up
	When I click cancel button in ChangeHistoryModal
	Then I dont see icon "changeHistory.gif" for the flat question "NoOfPlayes" in CRF

Scenario: T39_Select a form, verify primary and secondary data on submitted CRF after checkout.
	#Given I click cancel button in ChangeHistoryModal
	When I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Game           | VolleyBall  | Link            |
	| NoOfPlayes     | 6           | ListBox         |
@ObjectiveEvidence @ReqId:US41971.4	
Scenario: T40_Select a form, Update value for primary question and verify secondary data on submitted CRF after checkout.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| Game           | VolleyBall         | Radio           | Cricket        | SOR             | Updated         |
	Then I Verify below "ListBox" items are displayed in "NoOfPlayes" on the CRF.
	| ItemToVerify |
	| 11           |
@ObjectiveEvidence @ReqId:US41971.6	
Scenario: T41_01_Select a form, Update value for secondary question and verify data on submitted CRF view page.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| NoOfPlayes     | 11          | ListBox         |
	And I click "Save" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Game           | Cricket     | Text            |
	| NoOfPlayes     | 11          | ListBox         |

	# Change History Verification
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T41_02_Select Change history icon for the question "Game" and I cannot see change history icon for the question "NoOfPlayers"
	When I click icon "changeHistory.gif" for the flat question "Game" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes |
	|          | Cricket  | Reason: SOR\r\nNotes: Updated |
Scenario: T41_03_Close the Change History pop up
	When I click cancel button in ChangeHistoryModal
	Then I dont see icon "changeHistory.gif" for the flat question "NoOfPlayes" in CRF
	# Same Primary question used in 3 secondary questions

Scenario: T42_Select a form, Verify radio and listbox items on un-submitted CRF without checkout.
	Given I navigate to "Patients" tab from main menu.
	When I select the patient "06-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF.
	Then I Verify below "RadioGroup" items are displayed in "IntermediateCourses" on the CRF.
	| ItemToVerify |
	| [Blank]      |
	| MPC          |
	| BiPC         |
	| CEC          |
	And I Verify below "ListBox" items are displayed in "MPC Subjects" on the CRF.
	| ItemToVerify |
	| Maths                |
	| Physics              |
	| Chemistry            |
	| Botony               |
	| Zoology              |
	| Civics               |
	| Economics            |
	| Commerce             |
	| C                    |
	| C++                  |
	| ComputerArchitecture |
	| DataStructures       |
	| DigitalElectronics   |
	| MicroProcessor       |
	| MicroController      |
	And I Verify below "ListBox" items are displayed in "BiPC Subjects" on the CRF.
	| ItemToVerify |
	| Maths                |
	| Physics              |
	| Chemistry            |
	| Botony               |
	| Zoology              |
	| Civics               |
	| Economics            |
	| Commerce             |
	| C                    |
	| C++                  |
	| ComputerArchitecture |
	| DataStructures       |
	| DigitalElectronics   |
	| MicroProcessor       |
	| MicroController      |
	And I Verify below "ListBox" items are displayed in "CEC Subjects" on the CRF.
	| ItemToVerify         |
	| Maths                |
	| Physics              |
	| Chemistry            |
	| Botony               |
	| Zoology              |
	| Civics               |
	| Economics            |
	| Commerce             |
	| C                    |
	| C++                  |
	| ComputerArchitecture |
	| DataStructures       |
	| DigitalElectronics   |
	| MicroProcessor       |
	| MicroController      |

Scenario: T43_Select a form, verify data on un-submitted CRF after checkout.
	When I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| IntermediateCourses | [Blank]     | Radio           |
	| MPC Subjects        | Maths       | ListBox         |
	| BiPC Subjects       | Maths       | ListBox         |
	| CEC Subjects        | Maths       | ListBox         |
	
	# Verify ListBox items which should or should not display as well.
Scenario: T44_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| IntermediateCourses | MPC         | Radio           |
	Then I Verify below "ListBox" items are displayed in "MPC Subjects" on the CRF.
	| ItemToVerify |
	| Maths        |
	| Physics      |
	| Chemistry    |
	And I Verify below "ListBox" items are displayed in "BiPC Subjects" on the CRF.
    | ItemToVerify |
	| Maths        |
	| Physics      |
	| Chemistry    |
	And I Verify below "ListBox" items are displayed in "CEC Subjects" on the CRF.
	| ItemToVerify |
	| Maths        |
	| Physics      |
	| Chemistry    |
	And I Verify below "ListBox" items are not displayed in "CEC Subjects" on the CRF.
    | ItemToVerify         |
    | Botony               |
    | Zoology              |
    | Civics               |
    | Economics            |
    | Commerce             |
    | C                    |
    | C++                  |
    | ComputerArchitecture |
    | DataStructures       |
    | DigitalElectronics   |
    | MicroProcessor       |
    | MicroController      |
	
Scenario: T45_Select a form, enter value for primary question to verify relation items on secondary question.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| IntermediateCourses | [Blank]     | Radio           |
	Then I Verify below "ListBox" items are displayed in "MPC Subjects" on the CRF.
	| ItemToVerify |
	| Maths                |
	| Physics              |
	| Chemistry            |
	| Botony               |
	| Zoology              |
	| Civics               |
	| Economics            |
	| Commerce             |
	| C                    |
	| C++                  |
	| ComputerArchitecture |
	| DataStructures       |
	| DigitalElectronics   |
	| MicroProcessor       |
	| MicroController      |
	And I Verify below "ListBox" items are displayed in "BiPC Subjects" on the CRF.
    | ItemToVerify |
	| Maths                |
	| Physics              |
	| Chemistry            |
	| Botony               |
	| Zoology              |
	| Civics               |
	| Economics            |
	| Commerce             |
	| C                    |
	| C++                  |
	| ComputerArchitecture |
	| DataStructures       |
	| DigitalElectronics   |
	| MicroProcessor       |
	| MicroController      |
	And I Verify below "ListBox" items are displayed in "CEC Subjects" on the CRF.
	| ItemToVerify |
	| Maths                |
	| Physics              |
	| Chemistry            |
	| Botony               |
	| Zoology              |
	| Civics               |
	| Economics            |
	| Commerce             |
	| C                    |
	| C++                  |
	| ComputerArchitecture |
	| DataStructures       |
	| DigitalElectronics   |
	| MicroProcessor       |
	| MicroController      |
@ObjectiveEvidence @ReqId:US41971.6	
Scenario: T46_01_Select a form, enter value for primary and secondary questions and verify data on CRF view page.
	When I enter below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| IntermediateCourses | BiPC        | Radio           |
	| MPC Subjects        | Chemistry   | ListBox         |
	| BiPC Subjects       | Botony      | ListBox         |
	| CEC Subjects        | Physics     | ListBox         |
	And I click "Save" button on "LinkagesForm_FlatQuestions" CRF
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| IntermediateCourses | BiPC        | Text            |
	| MPC Subjects        | Chemistry   | Text            |
	| BiPC Subjects       | Botony      | Text            |
	And I Verify below "ListBox" items are displayed in "CEC Subjects" on the CRF.
	| ItemToVerify |
	| Physics      |
	| Chemistry    |
	| Botony       |
	| Zoology      |

	# Change history verification 
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T46_02_Select the Change history icon for the Question "IntermediateCourses"
	When I click icon "changeHistory.gif" for the flat question "IntermediateCourses" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | BiPC     | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T46_03_Select the Change history icon for the Question "MPC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "MPC Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response  | ReasonNotes                               |
	|          | Chemistry | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T46_04_Select the Change history icon for the Question "MPC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "BiPC Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Botony   | Reason: Initial Entry\r\nNotes: Submitted |

Scenario: T46_05_I cannot see change history icon for the question "CEC Subjects" in CRF
	When I click cancel button in ChangeHistoryModal
	Then I dont see icon "changeHistory.gif" for the flat question "CEC Subjects" in CRF

# Entry complete Checked
@ObjectiveEvidence @ReqId:US41971.6
Scenario: T47_01_Select a form, Update value for primary question and verify secondary question data on submitted CRF view page.
	When I click "Checkout" button on "LinkagesForm_FlatQuestions" CRF.
	And I enter below flat questions data in the CRF.
         | QuestionPrompt  | AnswerValue   | AnswerFieldType |
         | CountryLanguage | MultiLanguage | ListBox         |
	And I enter below flat questions data in the CRF.
	| QuestionPrompt      | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes |
	| IntermediateCourses | BiPC               | Radio           | CEC            | DCF             | Updated         |
	And I select entry complete checkbox on CRF.
	And I click "Save" button on "LinkagesForm_FlatQuestions" CRF.
	And I click Continue button of Modal "Queries Result"
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt      | AnswerValue | AnswerFieldType |
	| IntermediateCourses | CEC         | Text            |
	| MPC Subjects        | Civics      | Text            |
	| BiPC Subjects       | Civics      | Text            |
	| CEC Subjects        | Civics      | Text            |
	
	# Change History Verification for linkage question update
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T47_02_Select Change history icon for the question "IntermediateCourses"
	When I click icon "changeHistory.gif" for the flat question "IntermediateCourses" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                   |
	|          | CEC      | Reason: DCF\r\nNotes: Updated |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T47_03_Select Change history icon for the question "MPC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "MPC Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                                           |
	|          | Civics   | Reason: Linkage\r\nNotes: Due to response change in the linked field. |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T47_04_Select Change history icon for the question "BiPC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "BiPC Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                                           |
	|          | Civics   | Reason: Linkage\r\nNotes: Due to response change in the linked field. |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T47_05_Select Change history icon for the question "CEC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "CEC Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Civics   | Reason: Initial Entry\r\nNotes: Submitted |

# Codelist Linkages Verification on Non-Autobuild Table Form
# Display Type: Dropdown, Radio, Checkbox
# Same Linkage and primary question used for multiple questions
# Breadcrumb method for patient ID is needed
	@ObjectiveEvidence @ReqId:US42987.1,US42987.2,US42987.4
Scenario: T48_Verify listbox and radio items of unsubmitted CRF on Non-Autobuild Table form
	Given I click cancel button in ChangeHistoryModal
	When I click breadcrumb "06-PAT"
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_NonAutobuildTable" CRF.
	And I click "Checkout" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I click on "Add New Row" button in "CodeListLinkages table:" table.
	Then I verify below "ListBox" items are displayed for "Country" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify   |
	| [Blank]        |
	| AS_India       |
	| AS_China       |
	| AS_Japan       |
	| AF_Kenya       |
	| AF_SouthAfrica |
	| AF_Egypt       |
	| EU_France      |
	| EU_Germany     |
	| EU_Italy       |
	And I verify below "RadioGroup" items are displayed for "Measurement" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify |
	| [Blank]      |
	| Feets        |
	| Meters       |
	| Kgs          |
	| Grams        |
	| MilliGrams   |
	| KMPH         |
	And I verify below "CheckBox" items are displayed for "CEC Subjects" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify         |
	| Maths                |
	| Physics              |
	| Chemistry            |
	| Botony               |
	| Zoology              |
	| Civics               |
	| Economics            |
	| Commerce             |
	| C                    |
	| C++                  |
	| ComputerArchitecture |
	| DataStructures       |
	| DigitalElectronics   |
	| MicroProcessor       |
	| MicroController      |
	And I click table row button "Cancel Row" of table "CodeListLinkages table:" 

# Field Type for checkbox ?
# Is checkbox implemented for linkages, what is functionality ?
	@ObjectiveEvidence @ReqId:US42987.1,US42987.2,US42987.4
Scenario: T49_For a table questions, enter value for primary question and verify secondary question data
	When I enter below "CodeListLinkages table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue     | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Continent           | Asia            | ListBox         |                  |
	| No        | 1         | TypeOfMeasurement   | Length          | Radio           |                  |
	| No        | 1         | ColorType           | SecondaryColors | ListBox         |                  |
	| No        | 1         | Color               | White           | Radio           |                  |
	| No        | 1         | Game                | [Blank]         | Radio           |                  |
	| N0        | 1         | IntermediateCourses | MPC             | CheckBox        |                  |	
	Then I verify below "ListBox" items are displayed for "Country" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify   |
	| AS_India       |
	| AS_China       |
	| AS_Japan       |
	And I verify below "RadioGroup" items are displayed for "Measurement" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify |
	| [Blank]      |
	| Feets        |
	| Meters       |
	And I verify below "RadioGroup" items are displayed for "Color" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify |
	| [Blank]      |
	| Green        |
	| Brown        |
	| White        |
	| Black        |
	And I verify below "ListBox" items are displayed for "NoOfPlayers" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify |
	| [Blank]      |
	| 6            |
	| 11           |
	| 7            |
	And I verify below "ListBox" items are displayed for "MPC Subjects" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify |
	| Maths        |
	| Physics      |
	| Chemistry    |
	And I verify below "Radio" items are displayed for "BiPC Subjects" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify |
	| Maths        |
	| Physics      |
	| Chemistry    |
	And I verify below "CheckBox" items are displayed for "CEC Subjects" question in row "1" of "CodeListLinkages table:" table.
	| ItemToVerify |
	| Maths        |
	| Physics      |
	| Chemistry    |
	And I click on "Cancel" button on "LinkagesForm_NonAutobuildTable" CRF.
@ObjectiveEvidence @ReqId:US41971.6,US42987.1,US42987.2,US42987.4
Scenario: T50_01_For a table questions, enter value for primary question and verify secondary question data
	When I expand "Visit (Week 2)" to select and open "LinkagesForm_NonAutobuildTable" CRF.
	And I click "Checkout" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I enter below "CodeListLinkages table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue     | AnswerFieldType | RowButtonToClick |
	| Yes       | 1         | Continent           | Asia            | ListBox         |                  |
	| No        | 1         | TypeOfMeasurement   | Length          | Radio           |                  |
	| No        | 1         | ColorType           | SecondaryColors | ListBox         |                  |
	| No        | 1         | Color               | White           | Radio           |                  |
	| No        | 1         | Game                | [Blank]         | Radio           |                  |
	| N0        | 1         | IntermediateCourses | MPC             | Checkbox        | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I click Continue button of Modal "Queries Result"
	Then I verify below "CodeListLinkages table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt      | AnswerValue     | AnswerFieldType | RowButtonToClick |
	| 1         | Continent           | Asia            | Text            |                  |
	| 1         | Country             | [Blank]         | Text            |                  |
	| 1         | TypeOfMeasurement   | Length          | Text            |                  |
	| 1         | Measurement         | [Blank]         | Text            |                  |
	| 1         | ColorType           | SecondaryColors | Text            |                  |
	| 1         | Color               | White           | Text            |                  |
	| 1         | Game                | [Blank]         | Text            |                  |
	| 1         | NoOfPlayers         | [Blank]         | Text            |                  |
	| 1         | IntermediateCourses | MPC             | Text            |                  |
	| 1         | MPC Subjects        | Maths           | Text            |                  |
	| 1         | BiPC Subjects       | Maths           | Text            |                  |
	| 1         | CEC Subjects        | [Blank]         | Text            | OK               |


# Field Type for checkbox ?
# Is checkbox implemented for linkages, what is functionality ?

	# Change History Verification
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_02_Select the table row and Verify change history for the question "Continent"
	When I expand row "1" of table "CodeListLinkages table:"
	And I click "changeHistory.gif" icon of a question "Continent" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Asia     | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_03_Select the table row and Verify change history for the question "Country"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Country" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | [Blank]  | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_04_Select the table row and Verify change history for the question "TypeOfMeasurement"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "TypeOfMeasurement" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Length   | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_05_Select the table row and Verify change history for the question "Measurement"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Measurement" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | [Blank]  | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_06_Select the table row and Verify change history for the question "ColorType"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "ColorType" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response        | ReasonNotes                               |
	|          | SecondaryColors | Reason: Initial Entry\r\nNotes: Submitted |

	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_07_Select the table row and Verify change history for the question "Color"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Color" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | White    | Reason: Initial Entry\r\nNotes: Submitted |

	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_08_Select the table row and Verify change history for the question "Game"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Game" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | [Blank]  | Reason: Initial Entry\r\nNotes: Submitted |

	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_09_Select the table row and Verify change history for the question "NoOfPlayers"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "NoOfPlayers" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | [Blank]  | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_10_Select the table row and Verify change history for the question "IntermediateCourses"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "IntermediateCourses" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | MPC      | Reason: Initial Entry\r\nNotes: Submitted |

Scenario: T50_11_Select the table row and Verify change history for the question "MPC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "MPC Subjects" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Maths	  | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_12_Select the table row and Verify change history for the question "BiPC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "BiPC Subjects" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | Maths    | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T50_13_Select the table row and Verify change history for the question "CEC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "CEC Subjects" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                               |
	|          | [Blank]  | Reason: Initial Entry\r\nNotes: Submitted |

	@ObjectiveEvidence @ReqId:US41971.6
Scenario: T51_01_Add multiple rows on submitted CRF, Enter value for primary question and verify secondary question data
	Given I click cancel button in ChangeHistoryModal
	When  I click "Checkout" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I enter below "CodeListLinkages table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue | ReasonForChange | AdditionalNotes | RowButtonToClick |
	| No        | 1         | Country        | [Blank]            | ListBox         | AS_India       | SOR             |                 |                  |
	| No        | 1         | Measurement    | [Blank]            | Radio           | Feets          | DCF             | Test            |                  |
	| No        | 1         | CEC Subjects   | [Blank]            | CheckBox        | Physics        | SEC             | Test            |                  |
	| No        | 1         | CEC Subjects   | Physics            | CheckBox        | Chemistry      | SEC             | Test            | Save & Close Row |
	And I enter below "CodeListLinkages table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| Yes       | 2         | Continent           | Europe        | ListBox         |                  |
	| No        | 2         | Country             | EU_Italy      | ListBox         |                  |
	| No        | 2         | Country_Language    | MultiLanguage | ListBox         |                  |
	| No        | 2         | TypeOfMeasurement   | Speed         | Radio           |                  |
	| No        | 2         | ColorType           | PrimaryColors | ListBox         |                  |
	| No        | 2         | Color               | Red           | Radio           |                  |
	| No        | 2         | Game                | Cricket       | Radio           |                  |
	| No        | 2         | IntermediateCourses | CEC           | CheckBox        |                  |
	| No        | 2         | CEC Subjects        | Civics        | CheckBox        |                  |
	| No        | 2         | CEC Subjects        | Economics     | CheckBox        |                  |
	| No        | 2         | CEC Subjects        | Commerce      | CheckBox        | Save & Close Row |
	And I select entry complete checkbox on CRF.
	And I click on "Save" button on "LinkagesForm_NonAutobuildTable" CRF.
	Then I verify below "CodeListLinkages table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt      | AnswerValue                     | AnswerFieldType | RowButtonToClick |
	| 1         | Continent           | Asia                            | Text            |                  |
	| 1         | Country             | AS_India                        | Text            |                  |
	| 1         | TypeOfMeasurement   | Length                          | Text            |                  |
	| 1         | Measurement         | Feets                           | Text            |                  |
	| 1         | ColorType           | SecondaryColors                 | Text            |                  |
	| 1         | Color               | White                           | Text            |                  |
	| 1         | Game                | [Blank]                         | Text            |                  |
	| 1         | NoOfPlayers         | [Blank]                         | Text            |                  |
	| 1         | IntermediateCourses | MPC                             | Text            |                  |
	| 1         | MPC Subjects        | Maths                           | Text            |                  |
	| 1         | BiPC Subjects       | Maths                           | Text            |                  |
	| 1         | CEC Subjects        | Physics\r\nChemistry            | Text            | OK               |
	| 2         | Continent           | Europe                          | Text            |                  |
	| 2         | Country             | EU_Italy                        | Text            |                  |
	| 2         | Country_Language    | MultiLanguage                   | Text            |                  |
	| 2         | TypeOfMeasurement   | Speed                           | Text            |                  |
	| 2         | Measurement         | KMPH                            | Text            |                  |
	| 2         | ColorType           | PrimaryColors                   | Text            |                  |
	| 2         | Color               | Red                             | Text            |                  |
	| 2         | Game                | Cricket                         | Text            |                  |
	| 2         | NoOfPlayers         | 11                              | Text            |                  |
	| 2         | IntermediateCourses | CEC                             | Text            |                  |
	| 2         | MPC Subjects        | Civics                          | Text            |                  |
	| 2         | BiPC Subjects       | Civics                          | Text            |                  |
	| 2         | CEC Subjects        | Civics\r\nEconomics\r\nCommerce | Text            | OK               |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T51_02_Select the row 1 of the table "CodeListLinkages table:" and verify the change history of Question "Country"
	When I expand row "1" of table "CodeListLinkages table:"
	When I click "changeHistory.gif" icon of a question "Country" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes |
	|          | AS_India | Reason: SOR |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T51_03_verify the change history of Question "Country_Language"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Country_Language" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                                           |
	|          | [Blank]  | Reason: Linkage\r\nNotes: Due to response change in the linked field. |
	
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T51_04_verify the change history of Question "Country_Government"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Country_Government" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                                           |
	|          | [Blank]  | Reason: Linkage\r\nNotes: Due to response change in the linked field. |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T51_05_verify the change history of Question "Measurement"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Measurement" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                |
	|          | Feets    | Reason: DCF\r\nNotes: Test |
	@ObjectiveEvidence @ReqId:US41971.7,US42987.3
Scenario: T51_06_verify the change history of Question "CEC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "CEC Subjects" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response           | ReasonNotes                 |
	|          | Physics; Chemistry | Reason: SEC\r\nNotes: Test |


# Delete Table Row
Scenario: T52_Delete Table Row
	Given I click cancel button in ChangeHistoryModal
	When  I click "Checkout" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I expand row "2" of table "CodeListLinkages table:" 
    And I click table row button "Delete Row" of table "CodeListLinkages table:" 
    And I select reason for change "DCF" in DeleteTableRowModalDialog 
    And I enter additional notes "Delete Table Row Test" in DeleteTableRowModalDialog 
    And I click continue button in DeleteTableRowModalDialog 
	Then I see deleted row "2" of table "CodeListLinkages table:"  
@ObjectiveEvidence @ReqId:US41971.6		
Scenario: T53_01_Restore Table Row
	When I expand row "2" of table "CodeListLinkages table:" 
    And I click table row button "Restore Row" of table "CodeListLinkages table:" 
    And I select reason for change "SEC" in RestoreTableRowModalDialog 
    And I enter additional notes "Restore Table Row Test" in RestoreTableRowModalDialog 
    And I click continue button in RestoreTableRowModalDialog 
	Then I see restored row "2" of table "CodeListLinkages table:"  
	And I click on "Save" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I verify below "CodeListLinkages table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt      | AnswerValue   | AnswerFieldType | RowButtonToClick |
	| 2         | Continent           | Europe        | Text            |                  |
	| 2         | Country             | EU_Italy      | Text            |                  |
	| 2         | Country_Language    | MultiLanguage | Text            |                  |
	| 2         | TypeOfMeasurement   | Speed         | Text            |                  |
	| 2         | Measurement         | KMPH          | Text            |                  |
	| 2         | ColorType           | PrimaryColors | Text            |                  |
	| 2         | Color               | Red           | Text            |                  |
	| 2         | Game                | Cricket       | Text            |                  |
	| 2         | NoOfPlayers         | 11            | Text            |                  |
	| 2         | IntermediateCourses | CEC           | Text            |                  |
	| 2         | MPC Subjects        | Civics        | Text            |                  |
	| 2         | BiPC Subjects       | Civics        | Text            | OK               |
	#| 2         | CEC Subjects      | Civics,Economics,Commerce | Text            | OK               |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T53_02_Select Row 2 and Verify the change history for Question "Country"
	When I expand row "2" of table "CodeListLinkages table:"
	And I click "changeHistory.gif" icon of a question "Country" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                                               |
	|          | EU_Italy | Reason: Table Row Delete\r\nNotes: [Row Deleted] Delete Table Row Test    |
	|          | EU_Italy | Reason: Table Row Restore\r\nNotes: [Row Restored] Restore Table Row Test |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T53_03_Select Row 2 and Verify the change history for Question "Measurement"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Measurement" of table "CodeListLinkages table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                                               |
	|          | KMPH     | Reason: Table Row Delete\r\nNotes: [Row Deleted] Delete Table Row Test    |
	|          | KMPH     | Reason: Table Row Restore\r\nNotes: [Row Restored] Restore Table Row Test |

	@ObjectiveEvidence @ReqId:US41796.1.1,US41796.1.2,US41796.1.3
Scenario: T54_For Autobuild Table, verify data for questions.
	Given I click cancel button in ChangeHistoryModal
	When  I click on "Cancel" button on "LinkagesForm_NonAutobuildTable" CRF.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_AutobuildTable" CRF.
	And I click "Checkout" button on "LinkagesForm_AutobuildTable" CRF.
	Then I verify below "Linkages Autobuild table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Continent      | [Blank]     | ListBox         |                  |
	| 1         | Degree Courses | [Blank]     | ListBox         |                  |
	| 1         | CSE Subjects   | Maths       | Radio           | Cancel Row       |
	| 2         | Continent      | [Blank]     | ListBox         |                  |
	| 2         | Degree Courses | MPC         | ListBox         |                  |
	| 2         | CSE Subjects   | Maths       | Radio           | Cancel Row       |
	| 3         | Continent      | [Blank]     | ListBox         |                  |
	| 3         | Degree Courses | BiPC        | ListBox         |                  |
	| 3         | CSE Subjects   | Physics     | Radio           | Cancel Row       |
	| 4         | Continent      | [Blank]     | ListBox         |                  |
	| 4         | Degree Courses | CEC         | ListBox         |                  |
	| 4         | CSE Subjects   | Civics      | Radio           | Cancel Row       |
	| 5         | Continent      | [Blank]     | ListBox         |                  |
	| 5         | Degree Courses | CSE         | ListBox         |                  |
	| 5         | CSE Subjects   | C           | Radio           | Cancel Row       |
	| 6         | Continent      | [Blank]     | ListBox         |                  |
	| 6         | Degree Courses | ECE         | ListBox         |                  |
	| 6         | CSE Subjects   | C           | Radio           | Cancel Row       |
	| 7         | Continent      | Asia        | ListBox         |                  |
	| 7         | Degree Courses | [Blank]     | ListBox         |                  |
	| 7         | CSE Subjects   | Maths       | Radio           | Cancel Row       |
	| 8         | Continent      | Asia        | ListBox         |                  |
	| 8         | Degree Courses | MPC         | ListBox         |                  |
	| 8         | CSE Subjects   | Maths       | Radio           | Cancel Row       |
	| 9         | Continent      | Asia        | ListBox         |                  |
	| 9         | Degree Courses | BiPC        | ListBox         |                  |
	| 9         | CSE Subjects   | Physics     | Radio           | Cancel Row       |
	| 10        | Continent      | Asia        | ListBox         |                  |
	| 10        | Degree Courses | CEC         | ListBox         |                  |
	| 10        | CSE Subjects   | Civics      | Radio           | Cancel Row       |
	| 11        | Continent      | Asia        | ListBox         |                  |
	| 11        | Degree Courses | CSE         | ListBox         |                  |
	| 11        | CSE Subjects   | C           | Radio           | Cancel Row       |
	| 12        | Continent      | Asia        | ListBox         |                  |
	| 12        | Degree Courses | ECE         | ListBox         |                  |
	| 12        | CSE Subjects   | C           | Radio           | Cancel Row       |
	| 13        | Continent      | Africa      | ListBox         |                  |
	| 13        | Degree Courses | [Blank]     | ListBox         |                  |
	| 13        | CSE Subjects   | Maths       | Radio           | Cancel Row       |
	| 14        | Continent      | Africa      | ListBox         |                  |
	| 14        | Degree Courses | MPC         | ListBox         |                  |
	| 14        | CSE Subjects   | Maths       | Radio           | Cancel Row       |
	| 15        | Continent      | Africa      | ListBox         |                  |
	| 15        | Degree Courses | BiPC        | ListBox         |                  |
	| 15        | CSE Subjects   | Physics     | Radio           | Cancel Row       |
	| 16        | Continent      | Africa      | ListBox         |                  |
	| 16        | Degree Courses | CEC         | ListBox         |                  |
	| 16        | CSE Subjects   | Civics      | Radio           | Cancel Row       |
	| 17        | Continent      | Africa      | ListBox         |                  |
	| 17        | Degree Courses | CSE         | ListBox         |                  |
	| 17        | CSE Subjects   | C           | Radio           | Cancel Row       |
	| 18        | Continent      | Africa      | ListBox         |                  |
	| 18        | Degree Courses | ECE         | ListBox         |                  |
	| 18        | CSE Subjects   | C           | Radio           | Cancel Row       |
	| 19        | Continent      | Europe      | ListBox         |                  |
	| 19        | Degree Courses | [Blank]     | ListBox         |                  |
	| 19        | CSE Subjects   | Maths       | Radio           | Cancel Row       |
	| 20        | Continent      | Europe      | ListBox         |                  |
	| 20        | Degree Courses | MPC         | ListBox         |                  |
	| 20        | CSE Subjects   | Maths       | Radio           | Cancel Row       |
	| 21        | Continent      | Europe      | ListBox         |                  |
	| 21        | Degree Courses | BiPC        | ListBox         |                  |
	| 21        | CSE Subjects   | Physics     | Radio           | Cancel Row       |
	| 22        | Continent      | Europe      | ListBox         |                  |
	| 22        | Degree Courses | CEC         | ListBox         |                  |
	| 22        | CSE Subjects   | Civics      | Radio           | Cancel Row       |
	| 23        | Continent      | Europe      | ListBox         |                  |
	| 23        | Degree Courses | CSE         | ListBox         |                  |
	| 23        | CSE Subjects   | C           | Radio           | Cancel Row       |
	| 24        | Continent      | Europe      | ListBox         |                  |
	| 24        | Degree Courses | ECE         | ListBox         |                  |
	| 24        | CSE Subjects   | C           | Radio           | Cancel Row       |
	And I verify below "ListBox" items are displayed for "Country" question in row "1" of "Linkages Autobuild table:" table.
	| ItemToVerify   |
	| [Blank]        |
	| AS_India       |
	| AS_China       |
	| AS_Japan       |
	| AF_Kenya       |
	| AF_SouthAfrica |
	| AF_Egypt       |
	| EU_France      |
	| EU_Germany     |
	| EU_Italy       |
	And I verify below "ListBox" items are displayed for "Country" question in row "7" of "Linkages Autobuild table:" table.
	| ItemToVerify   |
	| [Blank]        |
	| AS_India       |
	| AS_China       |
	| AS_Japan       |
	And I verify below "ListBox" items are displayed for "Country" question in row "13" of "Linkages Autobuild table:" table.
	| ItemToVerify   |
	| [Blank]        |
	| AF_Kenya       |
	| AF_SouthAfrica |
	| AF_Egypt       |
	And I verify below "ListBox" items are displayed for "Country" question in row "19" of "Linkages Autobuild table:" table.
	| ItemToVerify   |
	| [Blank]        |
	| EU_France      |
	| EU_Germany     |
	| EU_Italy       |	
	And I verify below "ListBox" items are not displayed for "Country" question in row "19" of "Linkages Autobuild table:" table.
	| ItemToVerify   |
	| [Blank]        |
	| AS_India       |
	| AS_China       |
	| AS_Japan       |
	| AF_Kenya       |
	| AF_SouthAfrica |
	| AF_Egypt       |
	@ObjectiveEvidence @ReqId:US41796.2.1,US41796.2.2,US41796.2.3
Scenario: T55_01_For Autobuild Table, enter primary data and verify secondary data for questions.
	When I enter below "Linkages Autobuild table:" table questions data in the CRF.
	| AddNewRow | RowNumber | QuestionPrompt      | AnswerValue     | AnswerFieldType | RowButtonToClick |
	| No        | 1         | Continent           | Asia            | ListBox         |                  |
	| No        | 1         | Country             | AS_India        | Radio           |                  |
	| No        | 1         | Country Language    | MultiLanguage   | CheckBox        |                  |
	| No        | 1         | TypeOfMeasurement   | Length          | Radio           |                  |
	| No        | 1         | Measurement         | Feets           | CheckBox        |                  |
	| No        | 1         | ColorType           | SecondaryColors | ListBox         |                  |
	| No        | 1         | Color               | White           | CheckBox        |                  |
	| No        | 1         | Game                | [Blank]         | ListBox         |                  |
	| No        | 1         | IntermediateCourses | MPC             | ListBox         |                  |
	| No        | 1         | MPC Subjects        | Maths           | ListBox         | Save & Close Row |
	| No        | 17        | Country             | AF_Kenya        | Radio           |                  |
	| No        | 17        | Country Language    | MultiLanguage   | CheckBox        |                  |
	| No        | 17        | TypeOfMeasurement   | Speed           | Radio           |                  |
	| No        | 17        | ColorType           | PrimaryColors   | ListBox         |                  |
	| No        | 17        | Color               | Red             | CheckBox        |                  |
	| No        | 17        | Game                | Cricket         | ListBox         |                  |
	| No        | 17        | IntermediateCourses | CEC             | ListBox         |                  |
	| No        | 17        | CEC Subjects        | Civics          | CheckBox        |                  |
	| No        | 17        | CEC Subjects        | Economics       | CheckBox        |                  |
	| No        | 17        | CEC Subjects        | Commerce        | CheckBox        | Save & Close Row |
	And I click on "Save" button on "LinkagesForm_AutobuildTable" CRF.
	Then I verify below "Linkages Autobuild table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt      | AnswerValue                     | AnswerFieldType | RowButtonToClick |
	| 1         | Continent           | Asia                            | Text            |                  |
	| 1         | Country             | AS_India                        | Text            |                  |
	| 1         | Country Language    | MultiLanguage                   | Text            |                  |
	| 1         | TypeOfMeasurement   | Length                          | Text            |                  |
	| 1         | Measurement         | Feets                           | Text            |                  |
	| 1         | ColorType           | SecondaryColors                 | Text            |                  |
	| 1         | Color               | White                           | Text            |                  |
	| 1         | Game                | [Blank]                         | ListBox         |                  |
	| 1         | NoOfPlayers         | [Blank]                         | Radio           |                  |
	| 1         | IntermediateCourses | MPC                             | Text            |                  |
	| 1         | MPC Subjects        | Maths                           | ListBox         | OK               |
	| 17        | Continent           | Africa                          | Text            |                  |
	| 17        | Country             | AF_Kenya                        | Text            |                  |
	| 17        | Country Language    | MultiLanguage                   | Text            |                  |
	| 17        | TypeOfMeasurement   | Speed                           | Text            |                  |
	| 17        | Measurement         | KMPH                            | Checkbox        |                  |
	| 17        | ColorType           | PrimaryColors                   | Text            |                  |
	| 17        | Color               | Red                             | Text            |                  |
	| 17        | Game                | Cricket                         | Text            |                  |
	| 17        | NoOfPlayers         | 11                              | Radio           |                  |
	| 17        | IntermediateCourses | CEC                             | Text            |                  |
	| 17        | MPC Subjects        | Civics                          | ListBox         |                  |
	| 17        | BiPC Subjects       | Civics                          | Radio           |                  |
	| 17        | CEC Subjects        | Civics\r\nEconomics\r\nCommerce | Text            | OK               |
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T55_02_Select Row 1 of the table "Linkages Autobuild table:" and Verify the change history of the question "Continent"
	When I expand row "1" of table "Linkages Autobuild table:"
	And I click "changeHistory.gif" icon of a question "Continent" of table "Linkages Autobuild table:"	
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                |
	|          | Asia     | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T55_03_Verify change history of the question "Country"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Country" of table "Linkages Autobuild table:"	
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                |
	|          | AS_India | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T55_04_Verify change history of the question "IntermediateCourses"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "IntermediateCourses" of table "Linkages Autobuild table:"	
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                |
	|          | MPC      | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T55_05_ Expand row 17 and verify the change history icon for question "Country"
	Given I click cancel button in ChangeHistoryModal
	When I click table row button "OK" of table "Linkages Autobuild table:" 
	When I expand row "17" of table "Linkages Autobuild table:"
	When I click "changeHistory.gif" icon of a question "Country" of table "Linkages Autobuild table:"	
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                |
	|          | AF_Kenya | Reason: Initial Entry\r\nNotes: Submitted |
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T55_06_verify the change history icon for question "TypeOfMeasurement"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "TypeOfMeasurement" of table "Linkages Autobuild table:"	
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                |
	|          | Speed    | Reason: Initial Entry\r\nNotes: Submitted |

Scenario: T55_07_Verify the change history icon is not displayed for the question "NoOfPlayers"
	When I click cancel button in ChangeHistoryModal
	#Need to change for table question
	Then I dont see icon "changeHistory.gif" for the flat question "NoOfPlayers" in CRF

Scenario: T56_Add comments for linkage question
	When I click "Checkout" button on "LinkagesForm_AutobuildTable" CRF.
	Then I add comments to questions of table "Linkages Autobuild table:" in the CRF.
	| RowNumber | QuestionPrompt | CommentsToAdd  | RowButtonToClick |
	| 1         | Country        | Comment 1.1.2  |                  |
	| 1         | NoOfPlayers    | Comment 1.1.10 | Cancel Row       |
	| 2         | Measurement    | Comment 1.2.6  | Cancel Row       |

	# ClearItem 
	@ObjectiveEvidence @ReqId:US41796.3.1,US41796.3.2,US41796.3.3
Scenario: T57_Clear primary item value and verify secondary question data.
	When I expand row "1" of table "Linkages Autobuild table:"
	And I clear question "Continent" of table "Linkages Autobuild table:"
	And I enter notes "Clear Item 1.1.1 for testing" in ClearItemModalDialog
	And I click ok button in ClearItemModalDialog
	And I click table row button "Save & Close Row" of table "Linkages Autobuild table:"
	Then I verify below "Linkages Autobuild table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | Continent      | [Blank]     | Link            |                  |
	| 1         | Country        | [Blank]     | Link            |                  |

	#MarkItemNotAnswered method for table question should be included
	@ObjectiveEvidence @ReqId:US41796.3.1,US41796.3.2,US41796.3.3
Scenario: T58_01_Clear primary item by clicking MarkNotAnswered and verify secondary question data.
	When I expand row "1" of table "Linkages Autobuild table:" 
    And I click "icon_mna_disabled.png" icon of a question "IntermediateCourses" of table "Linkages Autobuild table:" 
    And I enter comments "Comments for MarkItemNotAnswered" in MarkItemDialog 
    And I click ok button in MarkItemDialog 
    Then I see icon "icon_mna.png" of a question "IntermediateCourses" of table "Linkages Autobuild table:"
	And I click table row button "Save & Close Row" of table "Linkages Autobuild table:"
    And I verify below "Linkages Autobuild table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt      | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | IntermediateCourses | [Blank]     | Link            |                  |
	| 1         | MPC Subjects        | Maths       | Link            |                  |
	| 1         | BiPC Subjects       | Maths       | Link            |                  |
	| 1         | CEC Subjects        | [Blank]     | Link            |                  |

	#Change History for the question After MNA and Clear Item
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T58_02_Select the Save and Close Row button for the row 1 and verfiy the change hisotry for the Question "Continent"
	When I click table row button "Save & Close Row" of table "Linkages Autobuild table:" 
	#And I click Continue button of Modal "Queries Result"
	And I select "Save" button on "Linkages Autobuild table:" CRF.
	And I expand row "1" of table "Linkages Autobuild table:"
	And I click "changeHistory.gif" icon of a question "Continent" of table "Linkages Autobuild table:"
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                                                |
	|          | [Blank]  | Reason: Item Reset\r\nNotes: Clear Item 1.1.1 for testing |
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T58_03_Verify the Change history icon for the question "Country"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "Country" of table "Linkages Autobuild table:"
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes                                                            |
         |          | [Blank]  | Reason: Linkage\r\nNotes: Due to response change in the linked field. |
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T58_04_Verify the Change history icon for the question "Country"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "IntermediateCourses" of table "Linkages Autobuild table:"
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes                  |
         |          | [Blank]  | Reason: Marked Not Answered |
	@ObjectiveEvidence @ReqId:US41796.4.1
Scenario: T58_05_Verify the change history for the question "CEC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click "changeHistory.gif" icon of a question "CEC Subjects" of table "Linkages Autobuild table:"
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes                  |
         |          | [Blank]  | Reason: Linkage\r\nNotes: Due to response change in the linked field.  |

Scenario: T59_01_Reset CRF and verify primary and secondary question data.
	Given I click cancel button in ChangeHistoryModal
	When I click on "Cancel" button on "LinkagesForm_AutobuildTable" CRF.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF. 
	And I click ActionPalette Item "Reset CRF" in "CRFAction" ActionPalette
	And I click Yes button in ResetCRFModalDialog 
	And I enter reason "Reset CRF Testing" in ResetCRFModalDialog 
    And I click Continue button in ResetCRFModalDialog 
    And I navigate to "Inbox" tab from main menu. 
	And I check subjects in inbox folder "Jobs" 
    | Subject                                                                                            |
    | CRF Reset - Visit (Week 2)/LinkagesForm_FlatQuestions for patient 06-PAT - COMPLETE. View Summary. | 
	And I navigate to "Patients" tab from main menu.
	And I select the patient "06-PAT" from patients table.
	And I expand "Visit (Week 2)" to select and open "LinkagesForm_FlatQuestions" CRF. 
	Then I Verify below "ListBox" items are displayed in "Country" on the CRF.
	| ItemToVerify   |
	| [Blank]        |
	| AS_India       |
	| AS_China       |
	| AS_Japan       |
	| AF_Kenya       |
	| AF_SouthAfrica |
	| AF_Egypt       |
	| EU_France      |
	| EU_Germany     |
	| EU_Italy       |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T59_02_Verify the change history for the question "Continent"
	When I click icon "changeHistory.gif" for the flat question "Continent" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T59_03_Verify the change history for the question "Country"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Country" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T59_04_Verify the change history for the question "CountryLanguage"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "CountryLanguage" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_05_Verify the change history for the question "Country Government"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Country Government" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_06_Verify the change history for the question "TypeOfMeasurement"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "TypeOfMeasurement" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7 
Scenario: T59_07_Verify the change history for the question "Measurement"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Measurement" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_08_Verify the change history for the question "ColorType"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "ColorType" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_09_Verify the change history for the question "Color"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Color" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_10_Verify the change history for the question "Game"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "Game" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |		 		 		 		 		 		 	
	@ObjectiveEvidence @ReqId:US41971.7
Scenario: T59_11_Verify the change history for the question "NoOfPlayes"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "NoOfPlayes" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |		
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_12_Verify the change history for the question "IntermediateCourses"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "IntermediateCourses" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes          |
         |          | [Blank]  | Reason: CRF [Reset] |		
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_13_Verify the change history for the question "MPC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "MPC Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes         |
         |          | Maths    | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_14_Verify the change history for the question "BiPC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "BiPC Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes         |
         |          | Maths    | Reason: CRF [Reset] |		
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_15_Verify the change history for the question "CEC Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "CEC Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes         |
         |          | Maths    | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_16_Verify the change history for the question "DegreeCourses"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "DegreeCourses" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes         |
         |          | [Blank]  | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_17_Verify the change history for the question "CSE Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "CSE Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes         |
         |          | Maths    | Reason: CRF [Reset] |
	@ObjectiveEvidence @ReqId:US41971.7	 
Scenario: T59_18_Verify the change history for the question "ECE Subjects"
	Given I click cancel button in ChangeHistoryModal
	When I click icon "changeHistory.gif" for the flat question "ECE Subjects" in CRF
	Then I see changehistory details in ChangeHistoryModal
         | DateTime | Response | ReasonNotes         |
         |          | Maths    | Reason: CRF [Reset] |