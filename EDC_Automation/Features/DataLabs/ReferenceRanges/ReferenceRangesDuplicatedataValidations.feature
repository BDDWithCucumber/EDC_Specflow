@F8164
Feature:ReferenceRangesDuplicatedataValidations
      As a Sponsor,
      I want to be able to collect reference ranges for a study
      So that these reference ranges can be used to determine if patient lab values collected during the study are out of range.
#Feature No:F8164
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/217392853280
#Owner:Rama Chinthapalli
#Author:Christopher M1Unitki
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

@ObjectiveEvidence @ReqID:US47414.1
Scenario: 04_Navigate from home page to Labs page, then verify the Manage Reference Ranges page
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Not Specified | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Not Specified | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/18/2016 | 09/18/2017 | Male          | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Male          | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Male          | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/18/2016 | 09/18/2017 | Female        | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Female        | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Female        | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/21/2017 | 10/21/2018 | Not Specified | =             | 1          | Months       | =           | 5        | Weeks      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/22/2018 | 10/23/2019 | Not Specified | =             | 1          | Days         | =           | 24       | Hours      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/24/2019 | 10/24/2020 | Not Specified | =             | 1          | Years        | =           | 365      | Days       | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	Then I create a new record with the same data and I can see "Duplicate reference range record cannot be entered" error message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Not Specified | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Not Specified | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/18/2016 | 09/18/2017 | Male          | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Male          | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Male          | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/18/2016 | 09/18/2017 | Female        | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Female        | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Female        | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/21/2017 | 10/21/2018 | Not Specified | =             | 1          | Months       | =           | 5        | Weeks      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/22/2018 | 10/23/2019 | Not Specified | =             | 1          | Days         | =           | 24       | Hours      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/24/2019 | 10/24/2020 | Not Specified | =             | 1          | Years        | =           | 365      | Days       | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |

Scenario: 05_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.1
Scenario: 06_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 11/18/2020 | 09/18/2021 | Not Specified | =             | 6          | Years        | =           | 7        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	And I click on "Save" button to create a new record in ReferenceRangesPage
	And I can see the "LabTest Reference Range Added Successfully" message upon record save in ReferenceRangesPage
	And I click on "Copy" button to create a duplicate record in ReferenceRangesPage
	And click on the "Save" button of the copied record in ReferenceRangesPage
	Then I see "Duplicate reference range record cannot be entered" error message in ReferenceRangesPage

Scenario: 07_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.1
Scenario: 08_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2022 | 09/18/2023 | Not Specified | =             | 8          | Years        | =           | 9        | Years      | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 150                  | 1Unit |
	| 08/18/2024 | 09/18/2025 | Male          | =             | 10         | Years        | =           | 11       | Years      | >                    | 20                | <                     | 100                | >                      | 10                  | <                       | 150                  | 1Unit |
	And I click on "Edit" button of the first record to change the data to same as of already existing record in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2022 | 09/18/2023 | Not Specified | =             | 8          | Years        | =           | 9        | Years      | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 150                  | 1Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see "Duplicate reference range record cannot be entered" error message on duplicate record save in ReferenceRangesPage

Scenario: 09_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.2
Scenario: 10_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Not Specified | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Not Specified | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/18/2016 | 09/18/2017 | Male          | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Male          | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Male          | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/18/2016 | 09/18/2017 | Female        | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 09/19/2017 | 10/19/2017 | Female        | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/19/2017 | 10/20/2017 | Female        | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/21/2017 | 10/21/2018 | Not Specified | =             | 1          | Months       | =           | 5        | Weeks      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/22/2018 | 10/23/2019 | Not Specified | =             | 1          | Days         | =           | 24       | Hours      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 10/24/2019 | 10/24/2020 | Not Specified | =             | 1          | Years        | =           | 365      | Days       | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	And I click on add button to create the record with the overlap data and I can see "Overlapping reference range record cannot be entered" error message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit  |
	| 09/18/2021 | 09/18/2022 | Not Specified | =             | 0          | Hours        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 07/18/2022 | 12/18/2023 | Not Specified | >             | 1          | Months       | <           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 07/18/2024 | 10/18/2025 | Not Specified | >             | 1          | Weeks        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 07/18/2026 | 10/18/2027 | Not Specified | =             | 1          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 07/18/2013 | 10/18/2017 | Not Specified | >             | 7          | Years        | <           | 8        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |
	| 07/18/2017 | 10/18/2019 | Not Specified | >             | 8          | Years        | <           | 9        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 1Unit |

Scenario: 11_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.1
Scenario: 12_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 |         | Not Specified | >             | 10        | Years        | <           | 11      | Years      | >                    | 20               | <                     | 237                | >                      | 10                  | <                       | 250                   | 1Unit   |
   And I click on "Save" icon of the first record in ReferenceRangesPage
	And I see "LabTest Reference Range Added Successfully" message upon record save in ReferenceRangesPage
	And I click on add button to create the record with the duplicate data in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 |         | Not Specified | >             | 10        | Years        | <           | 11      | Years      | >                    | 20               | <                     | 237                | >                      | 10                  | <                       | 250                   | 1Unit   |
	And I check the not applicable checkbox in ReferenceRangesPage	
   And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see "Duplicate reference range record cannot be entered." error message on duplicate record save in ReferenceRangesPage

Scenario: 13_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.2
Scenario: 14_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 |         | Not Specified | >             | 10        | Years        | <           | 10      | Years      | >                    | 20               | <                     | 237                | >                      | 10                  | <                       | 300                   | 1Unit   |
    And I click on "Save" icon of the first record in ReferenceRangesPage
	And I see "LabTest Reference Range Added Successfully" message upon record save in ReferenceRangesPage
	And I click on add button to create the record with the overlap data in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 01/01/2014 |         | Not Specified | >             | 10        | Years        | <           | 10      | Years      | >                    | 20               | <                     | 237                | >                      | 10                  | <                       | 300                   | 1Unit   |
    And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see "Overlapping reference range record cannot be entered" error message upon record save in ReferenceRangesPage

Scenario: 15_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.2
Scenario: 16_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 |         | Not Specified | >             | 10        | Years        | <           | 10      | Years      | >                    | 20               | <                     | 237                | >                      | 10                  | <                       | 300                   | 1Unit   |
    And I click on "Save" icon of the first record in ReferenceRangesPage
	And I see "LabTest Reference Range Added Successfully" message upon record save in ReferenceRangesPage
	And I click on "Copy" button to create a duplicate record in ReferenceRangesPage
	And I update the copied record with the overlap data in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 01/01/2014 |         | Not Specified | >             | 10        | Years        | <           | 10      | Years      | >                    | 20               | <                     | 237                | >                      | 100                  | <                       | 300                   | 1Unit   |
    And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see "Overlapping reference range record cannot be entered" error message upon record save in ReferenceRangesPage

Scenario: 17_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.1
Scenario: 18_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 08/18/2020 | Not Specified | >             | 50         | Years        | <           | 105      | Years      | >                    | 20                | <                     | 150                | >                      | 10                  | <                       | 200                   | 1Unit  |
	| 08/18/2021 |            | Male          | >             | 20         | Months       | <           | 50       | Months     | >                    | 10                | <                     | 20                 | >                      | 5                  | <                       | 100                   | 1Unit   |
   And I click on "Save" icon of the first record in ReferenceRangesPage
	And I see "LabTest Reference Range Added Successfully" message upon record save in ReferenceRangesPage
	And I click on "Edit" button of the record in ReferenceRangesPage
	And I change the data to same as of already existing record in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 08/18/2020 | Not Specified | >             | 50         | Years        | <           | 105      | Years      | >                    | 20                | <                     | 150                | >                      | 10                  | <                       | 200                   | 1Unit  |
	And I check the not applicable checkbox in ReferenceRangesPage
	And click on "Save" button in ReferenceRangesPage
	Then I see "Duplicate reference range record cannot be entered" error message in ReferenceRangesPage

Scenario: 19_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.1
Scenario: 20_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 50         | Years        | <           | 105      | Years      | >                    | 50                | <                     | 150                | >                      | 46                  | <                       | 200                   | 1Unit  |
	| 08/18/2021 | 09/18/2025 | Male          | >             | 20         | Months       | <           | 50       | Months     | >                    | 10                | <                     | 20                 | >                      | 5                  | <                       | 100                   | 1Unit   |
   And I click on "Save" icon of the first record in ReferenceRangesPage
	And I see "LabTest Reference Range Added Successfully" message upon record save in ReferenceRangesPage
	And I click on "Edit" button of the record in ReferenceRangesPage
	And I change the data to same as of already existing record in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2020 | Not Specified | >             | 50         | Years        | <           | 105      | Years      | >                    | 50                | <                     | 150                | >                      | 46                  | <                       | 200                   | 1Unit  |
	And I check the not applicable checkbox in ReferenceRangesPage
	And click on "Save" button in ReferenceRangesPage
	Then I see "Duplicate reference range record cannot be entered" error message in ReferenceRangesPage

Scenario: 21_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.2
Scenario: 22_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 01/01/2016 |            | Not Specified | >             | 105        | Years        | <           | 106      | Years      | >                    | 50               | <                     | 100                | >                      | 30                  | <                       | 150                   | 1Unit   |
	| 08/18/2014 | 08/18/2015 | Male          | >             | 20         | Months       | <           | 50       | Months     | >                    | 30                | <                     | 50                 | >                      | 10                  | <                       | 100                   | 1Unit   |
   And I click on "Save" icon of the first record in ReferenceRangesPage
	And I see "LabTest Reference Range Added Successfully" message upon record save in ReferenceRangesPage
	And I click on "Edit" button of the record in ReferenceRangesPage
	And I change the data to same as of already existing record in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 01/01/2014 |         | Not Specified | >             | 105        | Years        | <           | 106      | Years      | >                    | 50               | <                     | 100                | >                      | 30                  | <                       | 150                   | 1Unit   |
   And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see "Overlapping reference range record cannot be entered" error message upon record save in ReferenceRangesPage

Scenario: 23_Delete All records in Reference Ranges Page
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	Then a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage

@ObjectiveEvidence @ReqID:US47414.2
Scenario: 24_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page	
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 01/01/2016 |            | Not Specified | >             | 105        | Years        | <           | 106      | Years      | >                    | 50               | <                     | 100                | >                      | 20                  | <                       | 150                   | 1Unit   |
	| 08/18/2014 | 08/18/2015 | Male          | >             | 20         | Months       | <           | 50       | Months     | >                    | 10                | <                     | 20                 | >                      | 5                  | <                       | 50                   | 1Unit   |
   And I click on "Save" icon of the first record in ReferenceRangesPage
	And I see "LabTest Reference Range Added Successfully" message upon record save in ReferenceRangesPage
	And I click on "Edit" button of the record in ReferenceRangesPage
	And I change the data to same as of already existing record in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 01/01/2014 |         | Not Specified | >             | 105        | Years        | <           | 106      | Years      | >                    | 50               | <                     | 100                | >                      | 20                  | <                       | 150                   | 1Unit   |
	And I check the not applicable checkbox in ReferenceRangesPage
   And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see "Overlapping reference range record cannot be entered" error message upon record save in ReferenceRangesPage

Scenario: 25_Verify the functionality of View deleted Reference Ranges checkbox when selected
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page	
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |	
	And I select the checkbox to delete the all records
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"
	And I Check the Checkbox View deleted Reference Ranges	
	And I click on "Copy" button to create a new record from a deleted record in ReferenceRangesPage
   And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see "LabTest Reference Range Added Successfully" error message upon record save in ReferenceRangesPage

Scenario: 26_Verify the functionality of View deleted Reference Ranges checkbox when selected
	When I navigate to "Local Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "BiteCells" from labtests page	
	And I read the RefID for the below records in Mrr table
	|Row|
	| 1 |	
	And I select the checkbox to delete the all records
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"
	And I Check the Checkbox View deleted Reference Ranges
	And a "LabTest Reference Range Deleted Successfully" message should be displayed in ReferenceRangesPage
	And I click on "Copy" button to create a new record from a deleted record in ReferenceRangesPage
	And I change the data of a deleted copied record in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | CriticalRangeLowSelect | CriticalRangeLowSet | CriticalRangeHighSelect | CriticalRangeHighSet | Unit |
	| 09/18/2016 | 08/18/2020 | Not Specified | >             | 50         | Years        | <           | 105      | Years      | >                    | 50                | <                     | 150                | >                      | 46                  | <                       | 200                   | 1Unit  |
   And I click on "Save" icon of the first record in ReferenceRangesPage
	Then I see "LabTest Reference Range Added Successfully" error message upon record save in ReferenceRangesPage

Scenario: 27_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
