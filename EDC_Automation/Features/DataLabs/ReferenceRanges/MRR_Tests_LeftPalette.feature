@F8164
Feature:MRR_Tests_LeftPalette
      As a Sponsor,
      I want to be able to collect reference ranges for a study
      So that these reference ranges can be used to determine if patient lab values collected during the study are out of range.
#Feature No:F8164
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/211807444436
#Owner:Rama Chinthapalli
#Author:Christopher Mulki
#Copyright © 2018 PAREXEL International

@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "StudyPublish.zip" with study label "AllmappedforD1_1"
    Then I see study label "AllmappedforD1_1" in header 

Scenario: 04_Navigate to Labs page from Datalabs Patients page	
	Given I navigate to "Local Labs" tab from main menu.
	Then I see page "Manage Reference Ranges"

Scenario: 05_Navigate to Labtests
    Given I open lab with labid "L01" from ManageReferenceRanges page
	Then Page header should be displayed as "Lab(L01), Clinical, Health&Science"
	And I see breadcrumb items in order
	| BreadCrumb              |
	| Manage Reference Ranges |
	| Lab(L01)                |

@ObjectiveEvidence @ReqID:US46326.1
Scenario: 06_Navigate to Reference Ranges
    When I open labtest with labname "MRRTEST1" from labtests page 
	Then I see "Lab Test (Name)" left action palette for a Lab Test
	And I see breadcrumb items in order
	| BreadCrumb              |
	| Manage Reference Ranges |
	| Lab(L01)                |
	| MRRTEST1                |
	And I see below ActionPalette Items in "Lab Test (Name)" ActionPalette
	| ActionPaletteItems |
	| MRRTEST1           |
	| MRRTEST2           |
	| MRRTEST3           |
	| MRRTEST4           |
	| MRRTEST5           |
	| MRRTEST6           |
	| MRRTEST7           |
	| MRRTEST8           |
	| MRRTEST9           |

@ObjectiveEvidence @ReqID:US46326.2
Scenario: 07_Filter Available sites in Associate sites page
	When I enter search text "MRR" in Lab Test (Name) search box in ReferenceRangesPage
	Then I see lab tests based on searchtext "MRR" in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US46326.2
Scenario: 08_Filter Available sites in Associate sites page
	When I enter search text "mrr" in Lab Test (Name) search box in ReferenceRangesPage
	Then I see lab tests based on searchtext "mrr" in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US46326.3
Scenario: 09_Navigation from one test to another test
	When I click test "MRRTEST2(Test2)" in reference range page
	And I can see the Reference Ranges of a "Test2(MRRTEST2)" lab test in ReferenceRangesPage
	And I click test "MRRTEST3(Test3)" in reference range page
	And I can see the Reference Ranges of a "Test3(MRRTEST3)" lab test in ReferenceRangesPage

Scenario: 10_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
