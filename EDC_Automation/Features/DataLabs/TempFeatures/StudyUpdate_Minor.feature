Feature: StudyUpdate_Minor

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_Base.zip" with study label "Base"
	Then I see study label "Test4500" in header

Scenario: 04_Navigate to StudyManagement page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	Then I see BreadCrumb "Study Management"

Scenario: 05_Upload and Stage a Study which has major study changes
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_MinorUpdate.zip" with Label "Minor"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	Then I see notes "Note: The system has determined this is a minor update. Patient migration will NOT be required." in StudyVersionPropertiesPage

Scenario: 06_Publish Study which is in Staged status
	When I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	Then I see PublishStudyFlagsPage

Scenario: 07_Enable or Disable of reevaluation of Falgs and Signatures
	When I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	Then I see PublishStudyPage

Scenario: 08_Enable or Disable scripting execution at StudyPublish
	When I select scripting "Queries" in PublishStudyPage of MinorStudyUpdate
	#And I select scripting "pScripts" in PublishStudyPage of MinorStudyUpdate
	#And I select scripting "Derivations" in PublishStudyPage of MinorStudyUpdate
	And I click Publish button in PublishStudyPage of MinorStudyUpdate

