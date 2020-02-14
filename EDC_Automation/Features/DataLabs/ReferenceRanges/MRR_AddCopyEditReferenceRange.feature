@F8164
Feature:MRR_AddCopyEditReferenceRange
      As a Sponsor,
      I want to be able to collect reference ranges for a study
      So that these reference ranges can be used to determine if patient lab values collected during the study are out of range.
#Feature No:F8164
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/211807444436
#Owner:Rama Chinthapalli
#Author:Christopher Mulki
#Copyright © 2018 PAREXEL International

@ObjectiveEvidence
Scenario: 1_Login to Datalabs
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
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I can see the Reference Ranges of a "Test1(MRRTEST1)" lab test in ReferenceRangesPage
	Then Page header should be displayed as " Lab(L01), Clinical, Health&Science" 

@ObjectiveEvidence @ReqID:US52745.1,US52745.2,US52745.3,US52745.4
Scenario: 06_Add a new lab test reference range record
	When I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 10         | Weeks        | <           | 20       | Weeks      | >                    | 20                | <                     | 30                 | >                      | 10                  | <                       | 40                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 10         | Days         | <           | 20       | Weeks      | >                    | 20                | <                     | 30                 | >                      | 10                  | <                       | 40                   | 2Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Weeks        | <           | 20       | Weeks      | >                    | 20                | <                     | 30                 | >                      | 10                  | <                       | 40                   | 3Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 10         | Months       | <           | 20       | Months     | >                    | 20                | <                     | 30                 | >                      | 10                  | <                       | 40                   | 4Unit |
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

@ObjectiveEvidence @ReqID:US52749.1,US52749.2
Scenario: 07_copy a lab test reference range record
	When I click on "Copy" icon for the first record to copy the data in ReferenceRangesPage
	And I click on "Cancel" icon of the first record in ReferenceRangesPage
	And I click on "Copy" icon for the first record to copy the data in ReferenceRangesPage
    And I change reference ranges of a copied lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 104        | Years        | <           | 196      | Years      | >                    | 20                | <                     | 30                 | >                      | 10                  | <                       | 40                   | 5Unit |
	And I check the not applicable checkbox in ReferenceRangesPage
	And I click on "Save" icon of the first record in ReferenceRangesPage
	And a "LabTest Reference Range Added Successfully" message should be displayed in ReferenceRangesPage
	Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID1} |

@ObjectiveEvidence @ReqID:US52745.1,US52747.2,US52747.3
Scenario: 08_update a lab test reference range record
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage 
    And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2018 | 09/18/2030 | Male   | >             | 107        | Years        | <           | 200      | Years      | >                    | 200               | <                     | 80                 | >                      | 45                  | <                       | 80                   | 1Unit   |
	And I uncheck the not applicable checkbox in ReferenceRangesPage
	And Reference Range ID in readonly mode in ReferenceRangesPage
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 09_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
