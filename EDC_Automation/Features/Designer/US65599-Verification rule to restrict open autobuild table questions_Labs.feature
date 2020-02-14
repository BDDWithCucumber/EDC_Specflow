Feature: US65599 Verification rule to restrict open autobuild table questions_Labs
As a Study Designer,
I want a verification rule to be executed for lab questions which are open auto-build table questions,
So that I can design lab forms using only fixed auto-build table questions as lab questions.

Acceptance Criteria:

Lab questions shall not allow users use open autobuild table.
An error must be thrown after study verification:  " Question "{0}" - Cannot be non-autobuild or open autobuild table question 
as it is assigned with domain item that is mapped to Lab Element "{1}" on instance "{2}".

@ObjectiveEvidence @ReqID:US65599.27
Scenario: 01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario:02_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Test4500_1_LabformwithFixedABT.zip" 
	And Enter the unique study name "Test4500_Verrules"
	And Select the sponsor name "A111"
	And I click on the Save button
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog 	
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Test4500_Verrules)" in "Complete" state

Scenario: 03_publish the study file successfully with Lab Forms as Fixed autobuild Table forms. 
	When click breadcrumb item "Study"
	And I click on the Link "Publish Study"
	And I see study publish dialog with title "Publish Study"
	And Enter Label for study publish as "Test4500_1_LabformwithFixedABT"
	And I click on study publish continue button
	And I should see the status of the study "Study Publish (Test4500_Verrules: Test4500_1_LabformwithFixedABT)" in "Complete" state

Scenario: 04_Update Labform2_Autobuild Form as open autobuild table by unchecking structure fixed checkbox at formlevel
	When I click on the Home Button
	And I click on the Link "Test4500_Verrules"
	And I click on the Forms button
	And I click on the form "LabForm2"
    Then I should see the form questions page "LabForm2 / LabForm2"

Scenario: 05_Update Labform2_Autobuild Form as open autobuild table by unchecking structure fixed checkbox at formlevel and verify error messages:
	When I click on the Link "Autobuild Table"
	And uncheck Structure Fixed check box
	And click on save and close button
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Test4500_Verrules)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I see error messages as below
	| Error                                                                                                                                                                                                                                   |
	| Question "CRF Lab Test Name" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                        |
	| Question "Lab Test Description" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                     |
	| Question "CRF Lab value" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                            |
	| Question "CRF Lab Unit" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                             |
	| Question "Lab Test Name" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                            |
	| Question "Lab Test Code" " - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                          |
	| Question "LOINC Code" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                               |
	| Question "Category" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                                 |
	| Question "Subcategory" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                              |
	| Question "Subcategory" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                              |
	| Question "Method" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                                   |
	| Question "Result Type" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                              |
	| Question "Normal Reference Range Low" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".               |
	| Question "Normal Reference Range High" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".              |
	| Question "Critical Reference Range Low" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".             |
	| Question "Critical Reference Range High" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".            |
	| Question "Reference Range Not Applicable" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".           |
	| Question "Reference Range ID" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                       |
	| Question "Out of Normal Range Indicator" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".            |
	| Question "Normalized Patient Lab Value" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".             |
	| Question "Normalized Normal Reference Range Low" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".    |
	| Question "Normalized Normal Reference Range High" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".   |
	| Question "Normalized Critical Reference Range Low" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".  |
	| Question "Normalized Critical Reference Range High" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups". |
	| Question "Precision" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                                |
	| Question "Conversion Factor" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                        |
	
Scenario: 06_Verify click on error message navigate to appropriate question properety page.
    When I click on the Home Button
	And I click on the Link "Test4500_Verrules"
	And I click on the error Link "Question "CRF Lab Test Name" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups"." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb        |
	| Home              |
	| Forms             |
	| LabForm2          |
	| CRF Lab Test Name |

Scenario: 07_Publish Study with error messages for open autobuild table Lab Form questions.
	When click breadcrumb item "Study"
	And I click on the Link "Publish Study"
	And I see study publish dialog with title "Publish Study"
	And Enter Label for study publish as "Test4500_1_LabformwithOpenABT"
	And I click on study publish continue button
	And I should see the status of the study "Study Publish (Test4500_Verrules: Test4500_1_LabformwithOpenABT)" in "Complete" state
	Then Study file should be downloaded

Scenario: 08_Update Labform2_Autobuild Form as open autobuild table by unchecking structure fixed checkbox at formlevel and verify error messages:
	When I click on the Link "Autobuild Table"
	And check Structure Fixed check box
	And click on save and close button
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Test4500_Verrules)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I do not see error messages as below
	| Error                                                                                                                                                                                                                                   |
	| Question "CRF Lab Test Name" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                        |
	| Question "Lab Test Description" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                     |
	| Question "CRF Lab value" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                            |
	| Question "CRF Lab Unit" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                             |
	| Question "Lab Test Name" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                            |
	| Question "Lab Test Code" " - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                          |
	| Question "LOINC Code" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                               |
	| Question "Category" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                                 |
	| Question "Subcategory" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                              |
	| Question "Subcategory" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                              |
	| Question "Method" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                                   |
	| Question "Result Type" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                              |
	| Question "Normal Reference Range Low" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".               |
	| Question "Normal Reference Range High" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".              |
	| Question "Critical Reference Range Low" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".             |
	| Question "Critical Reference Range High" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".            |
	| Question "Reference Range Not Applicable" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".           |
	| Question "Reference Range ID" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                       |
	| Question "Out of Normal Range Indicator" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".            |
	| Question "Normalized Patient Lab Value" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".             |
	| Question "Normalized Normal Reference Range Low" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".    |
	| Question "Normalized Normal Reference Range High" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".   |
	| Question "Normalized Critical Reference Range Low" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".  |
	| Question "Normalized Critical Reference Range High" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups". |
	| Question "Precision" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                                |
	| Question "Conversion Factor" - Cannot be non-autobuild or open autobuild table question as it is assigned with domain item that is mapped to Lab Element "CRF_Lab_Test_Name" on instance "LabAndCodeListGroups".                        |



#Login to Datalabs and verify error message when trying to publish study with Lab Form as Open autobuild Table Form.


@ObjectiveEvidence
Scenario: 09_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@ObjectiveEvidence	
Scenario: 10_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header


@ObjectiveEvidence
Scenario: 11_Publish the study
	When I click Link "Study Management" In StudyAdministrationPage
	And I upload a study "Test4500_1_LabformwithOpenABT.Zip" with study name "Test4500_Verrules"
	Then verify modal dialog having title "Error uploading study file" and partial message "There is one or more invalid Lab or Attribute Mappings"

