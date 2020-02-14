Feature: IntegrationManagement_RTSM
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers


Scenario: 00_Login to Datalabs application.
	Given I have logged into DataLabs application as an Administrator user.
	Then I see Datalabs Home Page

@mytag
Scenario: 01_Setup Source system and Web service URL in General Configurations.
	Given I select DataManagerPortal item "Study Administration" from drop down
	When I click Link "Integration Management" In StudyAdministrationPage
	And I click ActionPalette Item "General Configurations" in "IntegrationMgmt_Actions" ActionPalette
	And I select "EDC" as source system for Add or Screen Patient.
	And I enter "http://172.18.6.22/Simulator500/WSIntegrationHarness.aspx" in the Web Service URL field.
	And I click "Save" button on General Configurations page.
	Then I see Save Success message on "General Configurations" page.

Scenario:  02_Define patient identifiers
	Given I click ActionPalette Item "Define Patient Identifiers" in "IntegrationMgmt_Actions" ActionPalette
	When I select "Common" event from the Event dropdown.
	And I click on "Expand" icon for "Form1" CRF.
	And I select default value as Yes for below questions of "Form1".
	| QuestionPrompt          |
	| Sample text question:   |
	| Sample select question: |
	| Sample float question:  |
	And I click on "Collapse" icon for "Form1" CRF.
	And I click on "Save" button on Define Patient Identifiers page.
	Then I see Save Success message on "Define Patient Identifiers" page.



