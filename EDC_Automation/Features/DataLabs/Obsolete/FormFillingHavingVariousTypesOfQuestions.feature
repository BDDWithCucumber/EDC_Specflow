Feature: One End To End Functionality of filling form

@mytag
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a Study
When I delete study
Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a Study
When I click browse button in upload study file page
And I upload study "TestStudy_Orginal.zip" with Label "TS"
Then I see study label "TestStudy_Orginal" in header



