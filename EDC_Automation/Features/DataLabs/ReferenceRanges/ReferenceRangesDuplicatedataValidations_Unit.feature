@F8164
Feature:ReferenceRangesDuplicatedataValidations_Unit
      As a Sponsor,
      I want to be able to collect reference ranges for a study
      So that these reference ranges can be used to determine if patient lab values collected during the study are out of range.
#Feature No:F8164
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/userstory/217392853280
#Owner:Rama Chinthapalli
#Author:Vishnu Priya
#Copyright © 2018 PAREXEL International

@ObjectiveEvidence
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

@ObjectiveEvidence @ReqID:US47414.1
Scenario: 02_Navigate from home page to Labs page, then verify the Manage Reference Ranges page
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "Lab test reference range added successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/19/2017 | 10/19/2017 | Not Specified | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/19/2017 | 10/20/2017 | Not Specified | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/18/2016 | 09/18/2017 | Male          | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/19/2017 | 10/19/2017 | Male          | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/19/2017 | 10/20/2017 | Male          | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/18/2016 | 09/18/2017 | Female        | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/19/2017 | 10/19/2017 | Female        | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/19/2017 | 10/20/2017 | Female        | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/21/2017 | 10/21/2018 | Not Specified | =             | 1          | Months       | =           | 5        | Weeks      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/22/2018 | 10/23/2019 | Not Specified | =             | 1          | Days         | =           | 24       | Hours      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/24/2019 | 10/24/2020 | Not Specified | =             | 1          | Years        | =           | 366      | Days       | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	Then I create a new record with the same data and I can see "Duplicate reference range record cannot be entered." error message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/19/2017 | 10/19/2017 | Not Specified | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/19/2017 | 10/20/2017 | Not Specified | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/18/2016 | 09/18/2017 | Male          | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/19/2017 | 10/19/2017 | Male          | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/19/2017 | 10/20/2017 | Male          | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/18/2016 | 09/18/2017 | Female        | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 09/19/2017 | 10/19/2017 | Female        | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/19/2017 | 10/20/2017 | Female        | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/21/2017 | 10/21/2018 | Not Specified | =             | 1          | Months       | =           | 5        | Weeks      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/22/2018 | 10/23/2019 | Not Specified | =             | 1          | Days         | =           | 24       | Hours      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	#| 10/24/2019 | 10/24/2020 | Not Specified | =             | 1          | Years        | =           | 366      | Days       | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	
	 

#@ObjectiveEvidence @ReqID:US47414.1
####################################After code changes ##################################################
Scenario: 03_Navigate from home page to Labs page, then verify the Manage Reference Ranges page
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	Then I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 09/19/2017 | 10/19/2017 | Not Specified | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 10/19/2017 | 10/20/2017 | Not Specified | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 09/18/2016 | 09/18/2017 | Male          | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 09/19/2017 | 10/19/2017 | Male          | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 10/19/2017 | 10/20/2017 | Male          | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 09/18/2016 | 09/18/2017 | Female        | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 09/19/2017 | 10/19/2017 | Female        | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 10/19/2017 | 10/20/2017 | Female        | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 10/21/2017 | 10/21/2018 | Not Specified | =             | 1          | Months       | =           | 5        | Weeks      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 10/22/2018 | 10/23/2019 | Not Specified | =             | 1          | Days         | =           | 24       | Hours      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	#| 10/24/2019 | 10/24/2020 | Not Specified | =             | 1          | Years        | =           | 366      | Days       | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |


Scenario: 04_Delete All records in Reference Ranges Page
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"
	Then I select the uncheckbox the checkbox to delete the all records			
	#Then a "Lab test reference range deleted successfully" message should be displayed in ReferenceRangesPage

#@ObjectiveEvidence @ReqID:US47414.1
Scenario: 05_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "Lab test reference range added successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 11/18/2020 | 09/18/2021 | Not Specified | =             | 6          | Years        | =           | 7        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |	
	Then  I click on "Copy" button I can see "Duplicate reference range record cannot be entered." error message upon each record save in ReferenceRangesPage
	
Scenario: 06_Now add the same above record with 02 system should allow it
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	Then I click add and enter reference ranges of a lab test and Save and can see "Lab test reference range added successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 11/18/2020 | 09/18/2021 | Not Specified | =             | 6          | Years        | =           | 7        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |	
	

Scenario: 07_Delete All records in Reference Ranges Page
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"		
	#Then a "Lab test reference range deleted successfully" message should be displayed in ReferenceRangesPage
	Then I select the uncheckbox the checkbox to delete the all records	

@ObjectiveEvidence @ReqID:US47414.1
Scenario: 08_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "Lab test reference range added successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2022 | 09/18/2023 | Not Specified | =             | 8          | Years        | =           | 9        | Years      | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 150                  | 01   |
	| 09/18/2022 | 09/18/2023 | Not Specified | =             | 8          | Years        | =           | 9        | Years      | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 150                  | 02   |	
	And I click on "Edit" icon of the first record in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage	
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2022 | 09/18/2023 | Not Specified | =             | 8          | Years        | =           | 9        | Years      | >                    | 50                | <                     | 100                | >                      | 30                  | <                       | 150                  | 02   |
	Then  I can see "Duplicate reference range record cannot be entered." error message upon each record save in ReferenceRangesPage

Scenario: 09_Delete All records in Reference Ranges Page
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page	
	And I select the checkbox to delete the all records	
	And I click on Delete button
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete"
	Then I select the uncheckbox the checkbox to delete the all records

Scenario: 10_Add a new lab test reference range record with Invalid From Age and ToAge, then verify the error message displayed
	When I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page			
	And I click add and enter reference ranges of a lab test and Save and can see "Lab test reference range added successfully" message upon each record save in ReferenceRangesPage	
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2016 |         | Not Specified | >             | 10        | Years        | <           | 10      | Years      | >                    | 20               | <                     | 237                | >                      | 10                  | <                       | 300                   | 1Unit   |
    Then I create a new record with the same data and I can see "Overlapping reference range record cannot be entered" error message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 01/01/2014 |         | Not Specified | >             | 10        | Years        | <           | 10      | Years      | >                    | 20               | <                     | 237                | >                      | 10                  | <                       | 300                   | 1Unit   |
	
