Feature: DataLabs_V5.8.0_DataLabs Study Verification Rules For Lab Mapping
	Test Summary:
	1. There is one or more invalid Lab or Attribute Mappings
	2. There is one or more invalid Lab or Attribute Mappings
	3. There are one or more lab dictionary mapping errors

@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@ObjectiveEvidence	
Scenario: 02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

@ObjectiveEvidence @ReqID:US56575.3
Scenario: 03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Study4_20181211_T11565144.Zip" with study name "LabMapping"
	Then verify modal dialog having title "Error uploading study file" and partial message "There is one or more invalid Lab or Attribute Mappings"

@ObjectiveEvidence @ReqID:US58668.3
Scenario: 04_Publish the study
	When I click Link "Study Management" In StudyAdministrationPage
	And I upload a study "Test4500_ChrisIL_20181204_T12350122.Zip" with study name "StudyVRules"
	Then verify modal dialog having title "Error uploading study file" and partial message "There is one or more invalid Lab or Attribute Mappings"

@ObjectiveEvidence @ReqID:US61853.3
Scenario: 05_Publish the study
	When I click Link "Study Management" In StudyAdministrationPage
	And I upload a study "Test4500_ChrisIL_20181204_T12350122.Zip" with study name "StudyVRules"
	Then verify modal dialog having title "Error uploading study file" and partial message "There are one or more lab dictionary mapping errors"
