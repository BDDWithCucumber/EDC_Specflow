Feature: DataLabs_V5.8.0_DataLabs Study Verification Rules For Codelist Groups and Linkages
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

@ObjectiveEvidence @ReqID:US52814.1
Scenario: 03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_Chris_20181204_T12352143.Zip" with study name "StudyVRules"
	Then verify modal dialog having title "Error uploading study file" and partial message "One or more form questions are assigned with both Codelist Group and Linkage"

@ObjectiveEvidence @ReqID:US52814.1
Scenario: 04_Publish the study
	When I click Link "Study Management" In StudyAdministrationPage
	And I upload a study "Test4500_ChrisIL_20181204_T12350122.Zip" with study name "StudyVRules"
	Then verify modal dialog having title "Error uploading study file" and partial message "One or more form questions has invalid association of Codelist Linkage"

@ObjectiveEvidence
Scenario: 05_Publish a study
	When I click Link "Study Management" In StudyAdministrationPage
	And I upload a study "Questions_D1D2_Update.zip" with study label "Study"
	Then I see study label "Questions" in header