Feature: DataLabs_V5.8.0_DataLabs Study Verification Rules For Lab Dictionary Mapping
	Test Summary:
	1. Lab Dictionary is not associated to the Study

@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@ObjectiveEvidence	
Scenario: 02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Study4_20181211_T11565144.Zip" with study name "LabMapping"
	Then verify modal dialog having title "Error uploading study file" and partial message "Lab Dictionary is not associated to the Study"

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 04_Publish a study
	When I click Link "Study Management" In StudyAdministrationPage
	And I upload a study "Study5_20181212_T10124600.zip" with study label "LabMapping"
	Then I see study label "Study1" in header