@F8164
Feature:ReferenceRangesCopyValidations
      As a Sponsor,
      I want to be able to collect reference ranges for a study
      So that these reference ranges can be used to determine if patient lab values collected during the study are out of range.
#Feature No:F8164
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/124537141
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

@ObjectiveEvidence @ReqID:US32651.1
Scenario: 04_Navigate from home page to Labs page, then verify the Manage Reference Ranges page
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	|           |         | Not Specified | =             |            | Years        | =           |          | Years      | =                    |                   | =                     |                    | >                      | 44                  | <                       | 79                   | 1Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "StartDate"
	And I see error message "Required" for column "FromAge"
	And  I see error message "Required" for column "ToAge"
	And  I see error message "Required" for column "NormalRangeLow"
	And  I see error message "Required" for column "NormalRangeHigh"

@ObjectiveEvidence @ReqID:US32651.1,US32651.7
Scenario: 05_Add a blank lab test reference range record and check the Not Applicable checkbox, then verify the error message displayed at field level
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	|           |         | Not Specified | =             |            | Years        | =           |          | Years      |                      |                   |                       |                    | >                      | 44                  | <                       | 79                   | 1Unit |
	And I check the not applicable checkbox in ReferenceRangesPage
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "StartDate"
	And I see error message "Required" for column "FromAge"
	And  I see error message "Required" for column "ToAge"

@ObjectiveEvidence @ReqID:US32651.1
Scenario: 06_Add a new lab test reference range record, then verify the error message displayed at field level
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 |         | =      |               |            | =            |             |          | =          | >                    | 50                | <                     | 100                | >                      | 44                  | <                       | 150                  | 1Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "Gender"	
	And I see error message "Required" for column "FromAge"
	And I see error message "Required" for column "FromAgeUnitTypeKey"
	And I see error message "Required" for column "ToAge"
	And I see error message "Required" for column "ToAgeUnitTypeKey"

@ObjectiveEvidence @ReqID:US32651.8
Scenario: 07_Add a new lab test reference range record with empty CriticalRange(Low), then verify the error message displayed at field level
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10        | Years        | <           | 19      | Years      | >                    | 23               | <                     | 83                 |                        |                     |                         | 79                   | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "CriticalRangeLow"	

@ObjectiveEvidence @ReqID:US32651.8
Scenario: 08_Add a new lab test reference range record with empty CriticalRange(High), then verify the error message displayed at field level
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10        | Years        | <           | 19      | Years      | >                    | 23               | <                     | 83                 |                        | 44                  |                         |                      | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "CriticalRangeHigh"	

@ObjectiveEvidence @ReqID:US32651.8
Scenario: 09_Add a new lab test reference range record with empty CriticalRange(Low), then verify the error message displayed at field level
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10        | Years        | <           | 19      | Years      |                      |                   |                       | 83                 | >                      | 50                  | <                       | 79                   | 1Unit  |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "NormalRangeLow"	

@ObjectiveEvidence @ReqID:US32651.8
Scenario: 10_Add a new lab test reference range record with empty CriticalRange(High), then verify the error message displayed at field level
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10         | Years        | <           | 19       | Years      |                      | 23                |                       |                    | >                      |       50              | <                       | 79                   | 1Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "NormalRangeHigh"	

@ObjectiveEvidence @ReqID:US32651.10
Scenario: 11_Add a new lab test reference range record with Negative FromAge, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10         | Years        | <           | 10       | Years      | >                    | 50                | <                     | 83                 | >                      | 20                  | <                       | 100                   | 1Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Cannot be less than From Age" for column "ToAge"

@ObjectiveEvidence @ReqID:US32651.2
Scenario: 12_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	Then enter the below lab data and click on save and I can see "StartDate is not valid date" error message upon each record save for column "StartDate"
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 1234567    | 09/18/2020 | Female        | >             | 10       | Weeks        | <           | 20      | Weeks      | >                    | 20               | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit   |
	| !@#$%^&    | 09/18/2020 | Male          | >             | 10        | Days         | <           | 19      | Days       | >                    | 23              | <                     | 84                 | >                      | 10                  | <                       | 100                   | 1Unit  |
	| asdfgrYHGT | 09/18/2020 | Not Specified | >             | 10        | Weeks        | <           | 19      | Weeks      | >                    | 23               | <                     | 85                 | >                      | 10                  | <                       | 100                   | 1Unit   |
	| asa!@&456  | 09/18/2020 | Male          | >             | 10        | Months       | <           | 19      | Months     | >                    | 23               | <                     | 86                 | >                      | 10                  | <                       | 100                   | 1Unit |
	| as  @&456  | 09/18/2020 | Male          | >             | 10        | Months       | <           | 19      | Months     | >                    | 23               | <                     | 86                 | >                      | 10                  | <                       | 100                   | 1Unit |

@ObjectiveEvidence @ReqID:US32651.2
Scenario: 13_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	Then enter the below lab data and click on save and I can see "EndDate is not valid date" error message upon each record save for column "EndDate"
	| StartDate  | EndDate     | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 5678907     | Female        | >             | 10       | Weeks        | <           | 200      | Weeks      | >                    | 20               | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit   |
	| 09/18/2016 | $%^&*(      | Male          | >             | 10        | Days         | <           | 197      | Days       | >                    | 23               | <                     | 84                 | >                      | 10                  | <                       | 100                   | 1Unit  |
	| 09/18/2016 | uhytfJUHY   | Not Specified | >             | 10        | Weeks        | <           | 196      | Weeks      | >                    | 23               | <                     | 85                 | >                      | 10                  | <                       | 100                   | 1Unit   |
	| 09/18/2016 | asa!@&456   | Not Specified | >             | 10        | Weeks        | <           | 196      | Weeks      | >                    | 23               | <                     | 85                 | >                      | 10                  | <                       | 100                   | 1Unit   |
	| 09/18/2016 | lk   !@#789 | Male          | >             | 10        | Months       | <           | 196      | Months     | >                    | 23               | <                     | 86                 | >                      | 10                  | <                       | 100                   | 1Unit |

@ObjectiveEvidence @ReqID:US32651.4
Scenario: 14_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	Then enter the below lab data and click on save and I can see "Cannot be less than From Age" error message upon each record save for column "ToAge"
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 106        | Years        | <           | 105      | Years      | >                    | 20                 | <                     | 85                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1          | Years        | <           | 11       | Months     | >                    | 20                 | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1          | Years        | <           | 51       | Weeks      | >                    | 20                 | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1          | Years        | <           | 364      | Days       | >                    | 20                 | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 13         | Months       | <           | 1        | Years      | >                    | 20                 | <                     | 84                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 25         | Months       | <           | 2        | Years      | >                    | 20                 | <                     | 84                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Months       | <           | 3        | Weeks      | >                    | 20                 | <                     | 84                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Months       | <           | 29       | Days       | >                    | 20                 | <                     | 84                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 107        | Months       | <           | 106      | Months     | >                    | 20                 | <                     | 86                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 5          | Weeks        | <           | 1        | Months     | >                    | 20                 | <                     | 85                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 9          | Weeks        | <           | 2        | Months     | >                    | 20                 | <                     | 85                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 4          | Weeks        | <           | 28       | Days       | >                    | 20                 | <                     | 85                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1000       | Weeks        | <           | 999      | Weeks      | >                    | 20                 | <                     | 100                | >                      | 10                  | <                       | 200                  | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 105        | Days         | <           | 104      | Days       | >                    | 20                 | <                     | 84                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Days         | <           | 23       | Hours      | >                    | 20                 | <                     | 84                 | >                      | 10                  | <                       | 200                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 2          | Hours        | <           | 1        | Hours      | >                    | 20                 | <                     | 84                 | >                      | 10                  | <                       | 200                   | 1Unit |

@ObjectiveEvidence @ReqID:US32651.5
Scenario: 15_Add a new lab test reference range record with Invalid Normal Range(High), then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	Then enter the below lab data and click on save and I can see "Cannot be less than Normal Range Low" error message upon each record save for column "NormalRangeHigh"
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Years        | <           | 11       | Years      | >                    | 100               | <                     | 99                 | >                      | 46                  | <                       | 100                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Years        | <           | 11       | Years      |                      | 100               |                       | 99                 | >                      | 46                  | <                       | 100                   | 1Unit |

@ObjectiveEvidence @ReqID:US32651.6
Scenario: 16_Add a new lab test reference range record with Invalid Critical Range(High), then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	Then enter the below lab data and click on save and I can see "Cannot be less than Critical Range Low" error message upon each record save for column "CriticalRangeHigh"
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Years        | <           | 105      | Years      | >                    | 20                | <                     | 50                 | >                      | 100                 | <                       | 99                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 10         | Years        | <           | 105      | Years      | >                    | 20                | <                     | 50                 |                        | 100                 |                         | 99                   | 1Unit |

@ObjectiveEvidence @ReqID:US32651.1,US32651.9
Scenario: 17_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2020 | 09/18/2021 | Female | >             |            | Years        | <           |          | Years      | >                    | 20               | <                     | 100                | >                      | 10                  | <                       | 150                  | 1Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "FromAge"	
	And  I see error message "Required" for column "ToAge"

@ObjectiveEvidence @ReqID:US32651.1,US32651.9
Scenario: 18_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2020 | 09/18/2021 | Female | >             | 20         | =            | <           | 30       | =          | >                    | 20                | <                     | 100                | >                      | 10                  | <                       | 150                  | 1Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "FromAgeUnitTypeKey"	
	And  I see error message "Required" for column "ToAgeUnitTypeKey"

@ObjectiveEvidence @ReqID:US32651.1,US32651.9
Scenario: 19_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	When I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Female | >             |            | =            | <           |          | =          | >                    | 20                | <                     | 100                | >                      | 10                  | <                       | 150                  | 1Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Required" for column "FromAge"	
	And I see error message "Required" for column "FromAgeUnitTypeKey"
	And I see error message "Required" for column "ToAge"
	And I see error message "Required" for column "ToAgeUnitTypeKey"

@ObjectiveEvidence @ReqID:US52745.1
Scenario: 20_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I click on "Copy" icon of the first record and enter the below lab data and click on save and I can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2020 | Not Specified |               | 4          | Years        |             | 4        | Years      | >                    | 20               | <                     | 23                | >                      | 10                  | <                       | 81                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 4          | Years        | <           | 5        | Years      | >                    | 20               | <                     | 23                | >                      | 10                  | <                       | 81                   | 1Unit |
	| 09/18/2016 | 09/18/2020 | Female        | >             | 1          | Years        | <           | 13       | Months     | >                    | 20               | <                     | 23                | >                      | 10                  | <                       | 100                  | 1Unit |
	| 09/18/2016 | 09/18/2020 | Male          | >             | 1          | Years        | <           | 53       | Weeks      | >                    | 20               | <                     | 23                | >                      | 10                  | <                       | 100                  | 1Unit |

@ObjectiveEvidence @ReqID:US32651.3
Scenario: 21_Add a new lab test reference range record with Invalid date Format, then verify the error message displayed
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	Then enter the below lab data and click on save and I can see "Cannot be before Start Date" error message upon each record save for column "EndDate"
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2015 | Female | >             | 10         | Weeks        | <           | 20       | Weeks      | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 150                  | 1Unit |
	| 09/18/2016 | 08/18/2016 | Female | >             | 10         | Weeks        | <           | 20       | Weeks      | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 150                  | 1Unit |
	| 09/18/2016 | 09/17/2016 | Female | >             | 10         | Weeks        | <           | 20       | Weeks      | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 150                  | 1Unit |

@ObjectiveEvidence @ReqID:US32215.20
Scenario: 22_Add a new lab test reference range record with empty CriticalRange(Low), then verify the error message displayed at field level
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10         | Years        | <           | 19       | Years      |                      | 50                |                       | 100                |                        | 70                  |                         | 80                   | 1Unit   |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Cannot be more than Normal Range Low" for column "CriticalRangeLow"
	And I see error message "Cannot be less than Normal Range high" for column "CriticalRangeHigh"

@ObjectiveEvidence @ReqID:US32215.21
Scenario: 23_Add a new lab test reference range record with empty CriticalRange(Low), then verify the error message displayed at field level
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Male   | >             | 10         | Years        | <           | 19       | Years      | >                    | 50                | <                     | 100                | >                      | 70                  | <                       | 80                   | 1Unit   |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see error message "Cannot be more than Normal Range Low" for column "CriticalRangeLow"
	Then I see error message "Cannot be less than Normal Range high" for column "CriticalRangeHigh"

Scenario: 24_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
