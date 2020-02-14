@F8164
Feature:ReferenceRangesAddValidations
      As a Sponsor,
      I want to be able to collect reference ranges for a study
      So that these reference ranges can be used to determine if patient lab values collected during the study are out of range.
#Feature No:F8164
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/121846089076
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

@ObjectiveEvidence @ReqID:US32215.1
Scenario: 04_Navigate from home page to Labs page, then verify the Manage Reference Ranges page
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then  I see error message "Required" for column "ToAge"
	And  I see error message "Required" for column "NormalRangeLow"
	And  I see error message "Required" for column "NormalRangeHigh"
	And I click on "Cancel" icon of the first record in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US32215.1,US32215.7
Scenario: 05_Add a blank lab test reference range record and check the Not Applicable checkbox, then verify the error message displayed at field level
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And I check the not applicable checkbox in ReferenceRangesPage
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then  I see error message "Required" for column "ToAge"
	And I click on "Cancel" icon of the first record in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US32215.1
Scenario: 06_Add a new lab test reference range record, then verify the error message displayed at field level
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below default lab data in ReferenceRangesPage
	| StartDate  | EndDate | Gender   | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 |         | -Select- | =             |            | -Select-     | =           |          | -Select-   | =                    | 50                | =                     | 100                | =                      | 44                  | =                       | 200                  | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	Then I see error message "Required" for column "Gender"	
	And I see error message "Required" for column "FromAge"
	And I see error message "Required" for column "FromAgeUnitTypeKey"
	And I see error message "Required" for column "ToAge"
	And I see error message "Required" for column "ToAgeUnitTypeKey"
	And I click on "Cancel" icon of the first record in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US32215.8
Scenario: 07_Add a new lab test reference range record with empty CriticalRange(Low), then verify the error message displayed at field level
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 104        | Years        | <           | 196      | Years      | >                    | 23                | <                     | 83                 |                        |                     |                         | 100                  | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "CriticalRangeLow"	
	And I click on "Cancel" icon of the first record in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US32215.8
Scenario: 08_Add a new lab test reference range record with empty CriticalRange(High), then verify the error message displayed at field level
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 104        | Years        | <           | 196      | Years      | >                    | 23                | <                     | 83                 |                        | 15                  |                         |                      | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "CriticalRangeHigh"	
	And I click on "Cancel" icon of the first record in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US32215.8
Scenario: 09_Add a new lab test reference range record with empty CriticalRange(Low), then verify the error message displayed at field level
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 104        | Years        | <           | 196      | Years      |                      |                   |                       | 83                 | >                      | 50                  | <                       | 100                   | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	Then I see error message "Required" for column "NormalRangeLow"	

@ObjectiveEvidence @ReqID:US32215.8
Scenario: 10_Add a new lab test reference range record with empty CriticalRange(High), then verify the error message displayed at field level
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 104        | Years        | <           | 196      | Years      |                      | 235               |                       |                    | >                      | 50                  | <                       | 79                   | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	Then I see error message "Required" for column "NormalRangeHigh"	
	And I click on "Cancel" icon of the first record in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US32215.10
Scenario: 11_Add a new lab test reference range record with Negative FromAge, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10         | Years        | <           | 10       | Years      | >                    | 235               | <                     | 300                | >                      | 50                  | <                       | 350                  | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	Then I see error message "Cannot be less than From Age" for column "ToAge"

@ObjectiveEvidence @ReqID:US32215.2
Scenario: 12_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "Invalid Date" error message upon each record save for column "StartDate"
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 1234567    | 09/18/2020 | Female        | >             | 10         | Weeks        | <           | 200      | Weeks      | >                    | 20                | <                     | 100                | >                      | 5                   | <                       | 150                  | 1Unit  |
	| !@#$%^&    | 09/18/2020 | Male          | >             | 10         | Days         | <           | 197      | Days       | >                    | 23                | <                     | 84                 | >                      | 4                   | <                       | 100                  | 1Unit  |
	| asdfgrYHGT | 09/18/2020 | Not Specified | >             | 10         | Weeks        | <           | 196      | Weeks      | >                    | 23                | <                     | 85                 | >                      | 4                   | <                       | 100                  | 1Unit  |
	| asa!@&456  | 09/18/2020 | Male          | >             | 10         | Months       | <           | 196      | Months     | >                    | 23                | <                     | 86                 | >                      | 4                   | <                       | 100                  | 1Unit  |
	| as  @&456  | 09/18/2020 | Male          | >             | 10         | Months       | <           | 196      | Months     | >                    | 23                | <                     | 86                 | >                      | 4                   | <                       | 100                  | 1Unit  |

@ObjectiveEvidence @ReqID:US32215.2
Scenario: 13_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "Invalid Date" error message upon each record save for column "EndDate"
	| StartDate  | EndDate     | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 5678907     | Female        | >             | 10         | Weeks        | <           | 200      | Weeks      | >                    | 20                | <                     | 100                | >                      | 5                   | <                       | 150                  | 1Unit  |
	| 09/18/2016 | $%^&*(      | Male          | >             | 10         | Days         | <           | 197      | Days       | >                    | 23                | <                     | 84                 | >                      | 4                   | <                       | 100                  | 1Unit  |
	| 09/18/2016 | uhytfJUHY   | Not Specified | >             | 10         | Weeks        | <           | 196      | Weeks      | >                    | 23                | <                     | 85                 | >                      | 4                   | <                       | 100                  | 1Unit  |
	| 09/18/2016 | asa!@&456   | Not Specified | >             | 10         | Weeks        | <           | 196      | Weeks      | >                    | 23                | <                     | 85                 | >                      | 4                   | <                       | 100                  | 1Unit  |
	| 09/18/2016 | lk   !@#789 | Male          | >             | 10         | Months       | <           | 196      | Months     | >                    | 23                | <                     | 86                 | >                      | 4                   | <                       | 100                  | 1Unit  |

@ObjectiveEvidence @ReqID:US32215.4
Scenario: 14_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "Cannot be less than From Age" error message upon each record save for column "ToAge"
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 106        | Years        | <           | 105      | Years      | >                    | 20                | <                     | 85                 | >                      | 10                  | <                       | 100                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1          | Years        | <           | 11       | Months     | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 100                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1          | Years        | <           | 51       | Weeks      | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 100                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1          | Years        | <           | 364      | Days       | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 100                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 13         | Months       | <           | 1        | Years      | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 80                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 25         | Months       | <           | 2        | Years      | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 80                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Months       | <           | 3        | Weeks      | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 80                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Months       | <           | 29       | Days       | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 80                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 107        | Months       | <           | 106      | Months     | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 82                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 5          | Weeks        | <           | 1        | Months     | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 81                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 9          | Weeks        | <           | 2        | Months     | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 81                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 4          | Weeks        | <           | 28       | Days       | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 81                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1000       | Weeks        | <           | 999      | Weeks      | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 100                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 105        | Days         | <           | 104      | Days       | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 80                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Days         | <           | 23       | Hours      | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 80                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 2          | Hours        | <           | 1        | Hours      | >                    | 20                | <                     | 50                 | >                      | 10                  | <                       | 80                   | 1Unit  |

@ObjectiveEvidence @ReqID:US32215.5
Scenario: 15_Add a new lab test reference range record with Invalid Normal Range(High), then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "Cannot be less than Normal Range Low" error message upon each record save for column "NormalRangeHigh"
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Years        | <           | 105      | Years      | >                    | 100               | <                     | 99                 | >                      | 50                  | <                       | 100                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Years        | <           | 105      | Years      |                      | 100               |                       | 99                 | >                      | 50                  | <                       | 100                   | 1Unit  |

@ObjectiveEvidence @ReqID:US32215.6
Scenario: 16_Add a new lab test reference range record with Invalid Critical Range(High), then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "Cannot be less than Critical Range Low" error message upon each record save for column "CriticalRangeHigh"
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Years        | <           | 105      | Years      | >                    | 20                | <                     | 50                | >                      | 100                 | <                       | 99                   | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Years        | <           | 105      | Years      | >                    | 20                | <                     | 50                |                        | 100                 |                         | 99                   | 1Unit  |

@ObjectiveEvidence @ReqID:US32215.1,US32215.9
Scenario: 17_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2020 | 09/18/2021 | Female | >             |            | Years        | <           |          | Years      | >                    | 50               | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	Then I see error message "Required" for column "FromAge"	
	And  I see error message "Required" for column "ToAge"

@ObjectiveEvidence @ReqID:US32215.1,US32215.9
Scenario: 18_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
	When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2020 | 09/18/2021 | Female | >             | 20         | -Select-     | <           | 30       | -Select-   | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 200                  | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	Then I see error message "Required" for column "FromAgeUnitTypeKey"	
	And  I see error message "Required" for column "ToAgeUnitTypeKey"

@ObjectiveEvidence @ReqID:US32215.1,US32215.9
Scenario: 19_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
	When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Female | >             |            | -Select-     | <           |          | -Select-   | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 200                  | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	Then I see error message "Required" for column "FromAge"	
	And I see error message "Required" for column "FromAgeUnitTypeKey"
	And I see error message "Required" for column "ToAgeUnitTypeKey"

@ObjectiveEvidence @ReqID:US52745.1
Scenario: 20_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 105        | Weeks        | <           | 106      | Weeks      | >                    | 100               | <                     | 237                | >                      | 46                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified |               | 105        | Years        |             | 105      | Years      | >                    | 100               | <                     | 237                | >                      | 46                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1          | Years        | <           | 13       | Months     | >                    | 100               | <                     | 237                | >                      | 50                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 11         | Months       | <           | 1        | Years      | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 23         | Months       | <           | 2        | Years      | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Months       | <           | 5        | Weeks      | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 106        | Months       | <           | 107      | Months     | >                    | 100               | <                     | 237                | >                      | 47                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 3          | Weeks        | <           | 1        | Months     | >                    | 100               | <                     | 237                | >                      | 46                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 7          | Weeks        | <           | 2        | Months     | >                    | 100               | <                     | 237                | >                      | 46                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 1          | Weeks        | <           | 8        | Days       | >                    | 100               | <                     | 237                | >                      | 46                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 999        | Weeks        | <           | 1000     | Weeks      | >                    | 100               | <                     | 237                | >                      | 50                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 105        | Days         | <           | 106      | Days       | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          |               | 1          | Days         |             | 1        | Days       | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Days         | <           | 1        | Weeks      | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 29         | Days         | <           | 30       | Days       | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Days         | <           | 1        | Years      | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Hours        | <           | 1        | Days       | >                    | 100               | <                     | 237                | >                      | 45                  | <                       | 300                  | 1Unit  |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 104        | Years        | <           | 196      | Years      | >                    | 10                | <                     | 20                 | >                      | 5                   |                         |                      | 1Unit  |

@ObjectiveEvidence @ReqID:US32215.3
Scenario: 21_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "Cannot be before StartDate" error message upon each record save for column "EndDate"
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2015 | Female | >             | 10       | Weeks        | <           | 200      | Weeks      | >                    | 20               | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit  |
	| 09/18/2016 | 08/18/2016 | Female | >             | 10       | Weeks        | <           | 200      | Weeks      | >                    | 20               | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit  |
	| 09/18/2016 | 09/17/2016 | Female | >             | 10       | Weeks        | <           | 200      | Weeks      | >                    | 20               | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit  |

@ObjectiveEvidence @ReqID:US32215.20
Scenario: 22_Add a new lab test reference range record with empty CriticalRange(Low), then verify the error message displayed at field level
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10         | Years        | <           | 19       | Years      |                      | 50                |                       | 100                |                        | 70                  |                         | 80                   | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Should be less than Normal Range Low" for column "CriticalRangeLow"
	And I see error message "Should be greater than Normal Range High" for column "CriticalRangeHigh"

@ObjectiveEvidence @ReqID:US32215.21
Scenario: 23_Add a new lab test reference range record with empty CriticalRange(Low), then verify the error message displayed at field level
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10         | Years        | <           | 19       | Years      | >                    | 50                | <                     | 100                | >                      | 70                  | <                       | 80                   | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Should be less than Normal Range Low" for column "CriticalRangeLow"
	And I see error message "Should be greater than Normal Range High" for column "CriticalRangeHigh"

Scenario: 24_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
