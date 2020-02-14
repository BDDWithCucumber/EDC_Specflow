Feature: DataLabs_V5.8.0_DataLabs Verify the existance of SAS Label in DataLabs DB
	Test Summary:
	1. One or more form questions are assigned with both Codelist Group and Linkage
	2. One or more form questions has invalid association of Codelist Linkage

@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@ObjectiveEvidence	
Scenario: 02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

@ObjectiveEvidence
Scenario: 03_Publish a study
	When I click Link "Study Management" In StudyAdministrationPage
	And I upload a study "Questions_D1D2_Update.zip" with study label "Study"
	Then I see study label "Questions" in header

@ObjectiveEvidence @ReqID:US63129.1
Scenario: T11_Remove SAS Label in Lab Mappings
	When I Execute the query for field verification "select FieldLabel from LabParameterField"
	Then The "SAS Label" field should not be found
