Feature: SignaturestatusVerification
	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: 02_Delete A study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_Codelist groups Minor and major study Upadate Base study V1.Zip" with study label "L1"
	Then I see study label "Test3210" in header

Scenario: 04_Add Sites
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: 06_Navigate to Patients tab and select a site and add patient(s).
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 08/02/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

Scenario: 07_Select and enroll a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 08/02/2018 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.	
	
Scenario: 08_Select a site and a patient.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT".

Scenario: 09_Click on "Request Signature" for request signature
	When I click ActionPalette Item "Request Signature" in "PatientPortalActions" ActionPalette
	And I select Request checkbox for below forms in RequestSignaturePage
	| EventName      | FormName |
	| Visit (Week 7) | DT1Form  |	
	And I click on Submit button in RequestSignaturePage
	Then I see success message "CRF for Signature Saved Successful"

Scenario: 10_Verify Workflow tab for Request signature
	Given I expand "Visit (Week 7)" to select and open "DT1Form" CRF.
	Then I open main tab "Workflow" of Form
	And I see workflow items in CRF
	| Action				 | DateTime |
	| PI Signature [ Ready ] |          |

Scenario: 11_Sign casebook for request signature form
	When I click breadcrumb "01-PAT"
	And I click ActionPalette Item "Sign Casebook" in "PatientPortalActions" ActionPalette
	And I select radio button for below forms in SignCasebookPage
	| EventName      | FormName | RadioButton |
	| Visit (Week 7) | DT1Form  | Accept      |
	And I given username as "testadmin" in SignCasebookPage
	And I given password as "Datalabs1234" in SignCasebookPage
	And I click on Submit button in SignCasebbokPage
	Then I see success message "CRFs for Casebook Saved Successful"
	
Scenario: 12_Verify signed by user in CRF page
	Given I expand "Visit (Week 7)" to select and open "DT1Form" CRF.
	Then I see signature info bar "Signed By: testadmin testadmin (EDCDEV\testadmin)" in CRF

Scenario: 13_Verify work flow tab for signed casebook
	Given I expand "Visit (Week 7)" to select and open "DT1Form" CRF.
	Then I open main tab "Workflow" of Form
	And I see workflow items in CRF
	| Action				  | DateTime |
	| PI Signature [ Signed ] |          |

Scenario: 14_Select a Form and enter data in CRF.
	Given I click breadcrumb "01-PAT".
	And I expand "Visit (Week 7)" to select and open "DT1Form" CRF.
	When I click "Checkout" button on "DT1Form" CRF.
	And I enter below flat questions data in the CRF.
	| QuestionPrompt                                     | AnswerValue | AnswerFieldType |
	| Text (DT1_Text1):                                  | testdata	   | TextBox         |
	And I click on "Save & Close" button on "DT1Form" CRF.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 15_Verify signature updated to changed status
	Given I expand "Visit (Week 7)" to select and open "DT1Form" CRF.
	Then I open main tab "Workflow" of Form
	And I see workflow items in CRF
	| Action					| DateTime |
	| PI Signature [ Changed ]  |          |	

Scenario: 16_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page




