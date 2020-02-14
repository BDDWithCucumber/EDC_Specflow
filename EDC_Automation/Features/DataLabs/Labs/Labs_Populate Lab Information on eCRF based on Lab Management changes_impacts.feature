Feature: PopulateLabInformationLabManagementChanges

		Test Summary:

		1. Verify Lab Name, Company, Lab Address and Country are populated on Lab eCRF based on the Lab ID selected.
		2. Verify Lab Name, Company, Lab Address and Country are updated on Lab eCRF based on the changes made to these fields on Lab Management.
		3. Verify Lab Name, Company, Lab Address and Country are cleared when Site is de-associated from Lab.
		4. Verify Lab Name, Company, Lab Address and Country are cleared when Lab is de-associated from Site.
		5. Verify changed information on item history for Lab Information fields.

#Userstory: US59775
#Userstory Link US59775: https://rally1.rallydev.com/#/244270786880ud/detail/userstory/284975541128
#Author:Swathi Polishetty
#Copyright © 2018 PAREXEL International

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

# US52354 Study publish with lab mappings for new fields 
# US47059 Study Publish with Lab Dictionary mappings
# US52804 DL: Codelists mapping for Lab attributes - Gender and Age Unit - Study publish 
# US58955 DL: Remove SAS Label from Lab Mappings
# US60920  DL: Lab fields as external fields
#select * from MF_LabParameterMapping
#select * from MF_LabTestMapping
#Select * from MF_LabUnitMapping
#select * from LabParameterField
@ObjectiveEvidence @ReqID:US52354.1
@ObjectiveEvidence @ReqID:US47059.1
@ObjectiveEvidence @ReqID:US52804.1
@ObjectiveEvidence @ReqID:US58955.1
Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "Test4500_Labs_Original.zip" with study label "Test4500_CodleistLinkages_Base"
  	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                                               |
	| Publishing of Study file (Test4500_CodleistLinkages_Base) - complete. |

Scenario: 04_Add sites and associate user.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

#Adding Labs
Scenario: 05_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I enter labs details and Save
	| LabId | LaboratoryName | Company    | Department | Address1       | Address2  | Address3    | City      | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | Perceptive | EDC        | Building No 20 | Mindspace | Hitech city | Hyderabad | TG    | 500081 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company    | Department | Address1       | Address2  | Address3    | City      | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | Perceptive | EDC        | Building No 20 | Mindspace | Hitech city | Hyderabad | TG    | 500081 | INDIA(IND) | INDIA   | 11111111 | 22222222 | Active           | Mr.XYZ        |

#Associating Lab to Site
Scenario: 06_Associate Lab L01 to 01-Site
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company    | Department | LaboratoryStatus |
	| L01   | Lab01          | Perceptive | EDC        | Active           |

Scenario: 07_Select Complete Change History in User preferences
	When I select DataManagerPortal item "User Preferences" from drop down
	And I enable CompleteChangeHistory in UserPreferencesPage
	And I click save button in UserPreferencesPage
	Then I see Save Success message on User Preferences page.

Scenario: 08_Add Patient
	Given I navigate to "Patients" tab from main menu.
    And I select the site "01-Site" from Sites dropdown.
    When I add patient with below details.
     | ScreenID | PatientInitials | ScreenDate |
     | 01       |   PAT           | 06/13/2018 |
	Then I see below patients added in the Patients table.
     | PatientID |
     | 01-PAT    |

Scenario: 09_Select and enroll patient 01-PAT.
      Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
      When I enroll the patient "01-PAT" with below data.
      | EnrollID | EnrollDate   | EntryComplete |
      | 01       | 06/13/2018   | Yes           |
      Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

#Provide Lab ID on eCRF
Scenario: 10_Expand the Visit (Week 2) event and open LabForm1 and enter the LAB ID.
	  When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
      And I click "Checkout" button on "LabForm1" CRF.      
      And I enter below flat questions data in the CRF.
      | QuestionPrompt | AnswerValue | AnswerFieldType |
      | Lab ID         | Lab01 (L01) | ListBox         |
	  And I click on "Save & Close" button on "LabForm1" CRF.
	  Then The CRF with data is saved and checked-in successfully.

#Verifying Lab Information on eCRF view mode based on Lab ID selection.
@ObjectiveEvidence @ReqID:US59775.1 
Scenario: 11_Verify the lab data without form checkout.
	 When I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue                          | AnswerFieldType |
	| Lab ID         | Lab01 (L01)                          | Text            |
	| Lab Name       | Lab01                                | Text            |
	| Company        | Perceptive                           | Text            |
	| Lab Address    | Building No 20 Mindspace Hitech city | Text            |
	| Country        | INDIA                                | Text            |
	
#Verifying Lab Information on eCRF checkout mode based on Lab ID selection.
@ObjectiveEvidence @ReqID:US59775.1
Scenario: 12_Verify the lab data on form checkout.
	 When I click "Checkout" button on "LabForm1" CRF.    
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue                          | AnswerFieldType |
	#| Lab ID         | Lab01 (L01)                          | Link            |
	| Lab Name       | Lab01                                | Text            |
	| Company        | Perceptive                           | Text            |
	| Lab Address    | Building No 20 Mindspace Hitech city | Text            |
	| Country        | INDIA                                | Text            |
	
#Change History Verification included
@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.4,5
Scenario: 13_Select Change History icon for Q3.Response displays as "Lab01" and Reason as "Initial Entry[Derived]" and Notes as "Submitted"
	When I click icon "changeHistory.gif" for the flat question "Lab Name" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes |
	# | GST\r\n System (System\System) | Lab01                           | Reason: Initial Entry[Derived]\r\nNotes: Submitted |
	|  | Lab01                          | Reason: Initial Entry[Derived]|

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.4,5
Scenario: 14_Select Change History icon for Q4.Response displays as "Perceptive" and Reason as "Initial Entry[Derived]" and Notes as "Submitted"
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Company" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response   | ReasonNotes                    |
	|          | Perceptive | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.4,5
Scenario: 15_Select Change History icon for Q5.Response displays as "Building No 20 Mindspace Hitechcity" and Reason as "Initial Entry[Derived]" and Notes as "Submitted"
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Lab Address" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response                             | ReasonNotes                    |
	|          | Building No 20 Mindspace Hitech city | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.4,5
Scenario: 16_Select Change History icon for Q6.Response displays as "INDIA" and Reason as "Initial Entry[Derived]" and Notes as "Submitted"
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Country" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response | ReasonNotes                    |
	|          | INDIA    | Reason: Initial Entry[Derived] |

#Update Lab Information from Lab Management
@ObjectiveEvidence @ReqId:US59775.2
@ObjectiveEvidence @ReqId:US63247.1
Scenario: 17_Update Lab details
	When I click cancel button in ChangeHistoryModal
	And I click on "cancel" button on "LabForm1" CRF.
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I edit Lab "L01" And Save Lab with details
	| LabId | LaboratoryName | Company                | Department | Address1 | Address2  | Address3    | City      | State | Zip    | ISOCountry         | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01 Updated  | Perceptive Informatics | EDC        |          | Mindspace | Hitech city | Hyderabad | TG    | 500081 | UNITED STATES(USA) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company                | Department | Address1 | Address2  | Address3    | City      | State | Zip    | ISOCountry         | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01 Updated  | Perceptive Informatics | EDC        |          | Mindspace | Hitech city | Hyderabad | TG    | 500081 | UNITED STATES(USA) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |

#Verifying Lab Information on eCRF view mode after updating Lab Details on Lab Management page
@ObjectiveEvidence @ReqId:US59775.2
@ObjectiveEvidence @ReqId:US63247.1
Scenario: 18_Verify the lab data without form checkout.
      Given I navigate to "Patients" tab from main menu.
      When I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue            | AnswerFieldType |
	| Lab ID         | Lab01 Updated (L01)    | Text            |
	| Lab Name       | Lab01 Updated          | Text            |
	| Company        | Perceptive Informatics | Text            |
	| Lab Address    | Mindspace Hitech city  | Text            |
	| Country        | UNITED STATES          | Text            |


#Verifying Lab Information on eCRF checkout mode after updating Lab Details on Lab Management page
@ObjectiveEvidence @ReqID:US59775.2
@ObjectiveEvidence @ReqId:US63247.1
Scenario: 19_Verify the lab data on form checkout.
	 When I click "Checkout" button on "LabForm1" CRF.    
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue            | AnswerFieldType     |
	| Lab Name       | Lab01 Updated          | Text                |
	| Company        | Perceptive Informatics | Text                |
	| Lab Address    | Mindspace Hitech city  | Text                |
	| Country        | UNITED STATES          | Text                |

	#Change History Verification included
@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.1,4,5,6
Scenario: 20_Select Change History icon for Q3.Response displays as "Lab01 Updated" and Reason as "Derived" and Notes is empty.
	When I click icon "changeHistory.gif" for the flat question "Lab Name" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response      | ReasonNotes                    |
	|          | Lab01 Updated | Reason: Derived                |
	|          | Lab01         | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.1,4,5,6
Scenario: 21_Select Change History icon for Q4.Response displays as "Perceptive Informatics" and Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Company" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response               | ReasonNotes                    |
	|          | Perceptive informatics | Reason: Derived                |
	|          | Perceptive             | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.1,4,5,6
Scenario: 22_Select Change History icon for Q5.Response displays as "Mindspace Hitechcity" and Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Lab Address" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response                             | ReasonNotes                    |
	|          | Mindspace Hitech city                | Reason: Derived                |
	|          | Building No 20 Mindspace Hitech city | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.1,4,5,6
Scenario: 23_Select Change History icon for Q6.Response displays as "UNITED STATES" and Reason as Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Country" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response      | ReasonNotes                    |
	|          | UNITED STATES | Reason: Derived                |
	|          | INDIA         | Reason: Initial Entry[Derived] |


#De-associate Site from Lab
@ObjectiveEvidence @ReqId:US59775.2
@ObjectiveEvidence @ReqId:US63247.1
Scenario: 24_De-associate lab "Lab01" from site
	When I click cancel button in ChangeHistoryModal
	And I click on "cancel" button on "LabForm1" CRF.
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I open lab with labid "L01" from LabManagement page
	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
	And I remove and save site id "01" and site name "Site" from assocaited sites in LabManagementSitesPage
	Then I see No records message in sites tab of Lab in LabPage

#Verifying Lab Information on eCRF view mode after de-associating Site on Lab Management page
@ObjectiveEvidence @ReqId:US59775.2
@ObjectiveEvidence @ReqId:US63247.1
Scenario: 25_Verify the lab data without form checkout.
      Given I navigate to "Patients" tab from main menu.
      When I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Lab ID         | [Blank]     | Text            |
	| Lab Name       | [Blank]     | Text            |
	| Company        | [Blank]     | Text            |
	| Lab Address    | [Blank]     | Text            |
	| Country        | [Blank]     | Text            |

#Verifying Lab Information on eCRF checkout mode after de-associating site on Lab Management page
@ObjectiveEvidence @ReqID:US59775.2
@ObjectiveEvidence @ReqId:US63247.1
Scenario: 26_Verify the lab data on form checkout.
	 When I click "Checkout" button on "LabForm1" CRF.    
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Lab Name       | [Blank]     | Text            |
	| Company        | [Blank]     | Text            |
	| Lab Address    | [Blank]     | Text            |
	| Country        | [Blank]     | Text            |

	#Change History Verification included
@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.1,4,5,6
Scenario: 27_Select Change History icon for Q3.Response displays as "[Blank]" and Reason as "Derived" and Notes is empty.
	When I click icon "changeHistory.gif" for the flat question "Lab Name" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response      | ReasonNotes                    |
	|          | [Blank]       | Reason: Derived                |
	|          | Lab01 Updated | Reason: Derived                |
	|          | Lab01         | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.1,4,5,6
Scenario: 28_Select Change History icon for Q4.Response displays as "[Blank]" and Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Company" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response               | ReasonNotes                    |
	|          | [Blank]                | Reason: Derived                |
	|          | Perceptive informatics | Reason: Derived                |
	|          | Perceptive             | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.1,4,5,6
Scenario: 29_Select Change History icon for Q5.Response displays as "[Blank]" and Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Lab Address" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response                             | ReasonNotes                    |
	|          | [Blank]                              | Reason: Derived                |
	|          | Mindspace Hitech city                | Reason: Derived                |
	|          | Building No 20 Mindspace Hitech city | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.1,4,5,6
Scenario: 30_Select Change History icon for Q6.Response displays as "[Blank]" and Reason as Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Country" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response      | ReasonNotes                    |
	|          | [Blank]       | Reason: Derived                |
	|          | UNITED STATES | Reason: Derived                |
	|          | INDIA         | Reason: Initial Entry[Derived] |

#Associate Lab to Site
Scenario: 31_Associate lab "Lab01 Updated" to site
	When I click cancel button in ChangeHistoryModal
	And I click on "cancel" button on "LabForm1" CRF.
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01 Updated" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company                | Department | LaboratoryStatus |
	| L01   | Lab01 Updated  | Perceptive Informatics | EDC        | Active           |

#Provide Lab ID on eCRF and Verifying Lab Information on eCRF view mode based on Lab ID selection.
Scenario: 32_Expand the Visit (Week 2) event and open LabForm1 and enter the LAB ID.
	  Given I navigate to "Patients" tab from main menu.
      And I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
      When I click "Checkout" button on "LabForm1" CRF.      
	  And I enter below flat questions data in the CRF.
	  | QuestionPrompt | CurrentAnswerValue | AnswerFieldType | NewAnswerValue      | ReasonForChange | AdditionalNotes |
	  | Lab ID         | [Blank]            | ListBox         | Lab01 Updated (L01) | DCF             | Lab ID selected |
	  And I click on "Save" button on "LabForm1" CRF.
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue            | AnswerFieldType |
	| Lab ID         | Lab01 Updated (L01)    | Text            |
	| Lab Name       | Lab01 Updated          | Text            |
	| Company        | Perceptive Informatics | Text            |
	| Lab Address    | Mindspace Hitech city  | Text            |
	| Country        | UNITED STATES          | Text            |

#De-Associate Lab from Site
@ObjectiveEvidence @ReqId:US59775.2
@ObjectiveEvidence @ReqId:US63247.3,4,5,6
Scenario: 33_De-Associate lab "Lab01 Updated" from site
	When I click on "cancel" button on "LabForm1" CRF.
	And I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I remove and save lab id "L01" and lab name "Lab01 Updated" from associated labs in AssociateLabs page
	Then I see Site details page for "01-Site"

#Verifying Lab Information on eCRF view mode after de-associating Lab on Site Management page
@ObjectiveEvidence @ReqId:US59775.2
@ObjectiveEvidence @ReqId:US63247.3
Scenario: 34_Verify the lab data without form checkout.
      Given I navigate to "Patients" tab from main menu.
      When I select the site "01-Site" from Sites dropdown.
      And I select the patient "01-PAT" from patients table.
	  And I expand "Visit (Week 2)" to select and open "LabForm1" CRF.
	  Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Lab ID         | [Blank]     | Text            |
	| Lab Name       | [Blank]     | Text            |
	| Company        | [Blank]     | Text            |
	| Lab Address    | [Blank]     | Text            |
	| Country        | [Blank]     | Text            |

#Verifying Lab Information on eCRF checkout mode after de-associating Lab on Site Management page
@ObjectiveEvidence @ReqID:US59775.2
@ObjectiveEvidence @ReqId:US63247.3
Scenario: 35_Verify the lab data on form checkout.
	 When I click "Checkout" button on "LabForm1" CRF.    
	 Then I verify below flat questions data in the CRF.
	| QuestionPrompt | AnswerValue | AnswerFieldType |
	| Lab Name       | [Blank]     | Text            |
	| Company        | [Blank]     | Text            |
	| Lab Address    | [Blank]     | Text            |
	| Country        | [Blank]     | Text            |

	#Change History Verification included
@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.3,4,5,6
Scenario: 36_Select Change History icon for Q3.Response displays as "[Blank]" and Reason as "Derived" and Notes is empty.
	When I click icon "changeHistory.gif" for the flat question "Lab Name" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response      | ReasonNotes                    |
	|          | [Blank]       | Reason: Derived                |
	|          | Lab01 Updated | Reason: Derived                |
	|          | [Blank]       | Reason: Derived                |
	|          | Lab01 Updated | Reason: Derived                |
	|          | Lab01         | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.3,4,5,6
Scenario: 37_Select Change History icon for Q4.Response displays as "[Blank]" and Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Company" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response               | ReasonNotes                    |
	|          | [Blank]                | Reason: Derived                |
	|          | Perceptive informatics | Reason: Derived                |
	|          | [Blank]                | Reason: Derived                |
	|          | Perceptive informatics | Reason: Derived                |
	|          | Perceptive             | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.3,4,5,6
Scenario: 38_Select Change History icon for Q5.Response displays as "[Blank]" and Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Lab Address" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response                             | ReasonNotes                    |
	|          | [Blank]                              | Reason: Derived                |
	|          | Mindspace Hitech city                | Reason: Derived                |
	|          | [Blank]                              | Reason: Derived                |
	|          | Mindspace Hitech city                | Reason: Derived                |
	|          | Building No 20 Mindspace Hitech city | Reason: Initial Entry[Derived] |

@ObjectiveEvidence @ReqId:US59775.3,4
@ObjectiveEvidence @ReqId:US63247.3,4,5,6
Scenario: 39_Select Change History icon for Q6.Response displays as "[Blank]" and Reason as Reason as "Derived" and Notes is empty.
	When I click cancel button in ChangeHistoryModal
	And I click icon "changeHistory.gif" for the flat question "Country" in CRF
	Then I see changehistory details in ChangeHistoryModal
	| DateTime | Response      | ReasonNotes                    |
	|          | [Blank]       | Reason: Derived                |
	|          | UNITED STATES | Reason: Derived                |
	|          | [Blank]       | Reason: Derived                |
	|          | UNITED STATES | Reason: Derived                |
	|          | INDIA         | Reason: Initial Entry[Derived] |
