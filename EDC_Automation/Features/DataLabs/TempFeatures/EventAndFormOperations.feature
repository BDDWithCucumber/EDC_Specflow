Feature: EventAndFormOperations
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Open Form
	When I open form "Form1" of event "Visit (Screening)"
	Then I see CRF "Form1" of event "Visit (Screening)"







#Scenario: 03_Checkout the form and Save
#	When I click "Checkout" button on "Form1" CRF
#	And I select entry complete checkbox on CRF
#	And I click "Save & Close" button on "Form1" CRF
#	Then I see Modal Dialog with title "Queries Result"
#
#Scenario: 04_Verify queries in query results modal
#	Given I verify queries under queries type "New Queries" in Modal "Queries Result"
#	| Queries                                                      |
#	| Q1: Field is Required                                        |
#	| Q5: Value does not meet the minimum length requirement of 4. |
#	| Q5: Value does not meet the minimum precision of 2.          |
#	When I click back to CRF button of Modal "Queries Result"	

#Scenario: 03_Open Form
#	When I open form "Form1" of event "Visit (Week 4)"
#	Then I see CRF "Form1" of event "Visit (Week 4)"
#
#Scenario: 04_Open Form
#	When I open form "Form1" of event "Visit (Week 5)"
#	Then I see CRF "Form1" of event "Visit (Week 5)"
#
#Scenario: 05_Open Form
#	When I open form "AutoBuild Form01" of event "Visit (Week 51)"
#	Then I see CRF "AutoBuild Form01" of event "Visit (Week 51)"
#
#Scenario: 06_Open Form
#	When I open form "AutoBuild Form02" of event "Visit (Week 51)"
#	Then I see CRF "AutoBuild Form02" of event "Visit (Week 51)"
#
#Scenario: 07_Open Form
#	When I open form "AutoBuild Form01" of event "Visit (Week 51)"
#	Then I see CRF "AutoBuild Form01" of event "Visit (Week 51)"
