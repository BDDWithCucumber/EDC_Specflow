Feature: DataLabs_V5.8.0_DataLabs Study Verification Rules
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
	And I upload a study "CreateNewStudy_20190905_T11371586_Attribute Mapping.Zip" with study name "CreateNewStudyError"
	Then verify modal dialog having title "Error uploading study file" and partial message "There is one or more invalid Lab or Attribute Mappings."

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 04_Publish the study
	When I upload a study "Import_Study_20190905_T10300900_LabMappingErrors.Zip" with study name "LabMappingError"
	Then verify modal dialog having title "Error uploading study file" and partial message "One or more form questions has invalid association of Codelist Linkage."

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 05_Publish the study
	When I upload a study "Import_Study_20190905_T12152169_Lab Dictionary Mapping.Zip" with study name "LabDictMappingError"
	Then verify modal dialog having title "Error uploading study file" and partial message "There are one or more lab dictionary mapping errors."

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 06_Publish the study
	When I upload a study "Import_Study2_20190905_T12265351_FormQuestions.Zip" with study name "FormQuestionErrors"
	Then verify modal dialog having title "Error uploading study file" and partial message "One or more form questions are assigned with both Codelist Group and Linkage."

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 07_Publish the study
	When I upload a study "Import_Study2_20190905_T12483607_FormQuestions.Zip" with study name "FormQuestionErrors"
	Then verify modal dialog having title "Error uploading study file" and partial message "There is one or more Event(s) that contains Invalid Form(s)."

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 08_Publish the study
	When I upload a study "Import_Study2_20190916_T10102385_FormQuestion.Zip" with study name "FormQuestionErrors"
	Then verify modal dialog having title "Error uploading study file" and partial message "There is one or more Event(s) that contains Invalid Form(s)."

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 09_Publish the study
	When I upload a study "Linkages_Hidden_20190905_T12335432.Zip" with study name "FormHiddenQuestionErrors"
	Then verify modal dialog having title "Error uploading study file" and partial message "One or more form questions has invalid association of Codelist Linkage."

@ObjectiveEvidence @ReqID:US46266.3
Scenario: 10_Publish a study
	When I upload a study "test01new_20190916_T10483512_NoErrors.zip" with study label "NoErrorsStudy"
	Then I see study label "test01new" in header