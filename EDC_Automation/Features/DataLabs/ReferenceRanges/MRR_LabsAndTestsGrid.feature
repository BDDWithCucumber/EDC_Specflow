@F8164
Feature:MRR_LabsAndTestsGrid
      As a Sponsor,
      I want to be able to collect reference ranges for a study
      So that these reference ranges can be used to determine if patient lab values collected during the study are out of range.

#Feature No:F8164
#Feature Link: https://rally1.rallydev.com/#/244270786880d/detail/portfolioitem/feature/217047550132
#Owner:Rama Chinthapalli
#Author:Christopher Mulki
#Copyright © 2018 PAREXEL International

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

Scenario: 05_Verify the Manage Reference Ranges table column names
    Given I navigate to "Local Labs" tab from main menu.
    Then I verify the below columns names displayed in the Manage Reference Ranges table
	| Name            |
	| Lab ID          |
	| Laboratory Name |
	| Company         |
	| Department      |
	| Address         |
	| City/Town       |
	| State/Province  |
	| Country         |
	| Lab Status      |

Scenario: 06_Check sort for Laboratory Name column for ascending
	When I sort column "Lab ID" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "Lab ID" in ManageReferenceRangesPage

Scenario: 07_Check sort for Lab Id column for descending
	When I sort column "Lab ID" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Descending" in column "Lab ID" in ManageReferenceRangesPage

Scenario: 08_Check sort for Laboratory Name column for ascending
	When I sort column "Laboratory Name" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "Laboratory Name" in ManageReferenceRangesPage

Scenario: 09_Check sort for Laboratory Name column for descending
	When I sort column "Laboratory Name" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Descending" in column "Laboratory Name" in ManageReferenceRangesPage

Scenario: 10_Check sort for Company column for ascending
	When I sort column "Company" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "Company" in ManageReferenceRangesPage

Scenario: 11_Check sort for Company column for descending
	When I sort column "Company" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Descending" in column "Company" in ManageReferenceRangesPage

Scenario: 12_Check sort for Department column for ascending
	When I sort column "Department" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "Department" in ManageReferenceRangesPage

Scenario: 13_Check sort for Department column for descending
	When I sort column "Department" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Descending" in column "Department" in ManageReferenceRangesPage

Scenario: 14_Check sort for City/Town column for ascending
	When I sort column "City/Town" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "City/Town" in ManageReferenceRangesPage

Scenario: 15_Check sort for City/Town column for descending
	When I sort column "City/Town" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Descending" in column "City/Town" in ManageReferenceRangesPage

Scenario: 16_Check sort for State/Province column for ascending
	When I sort column "State/Province" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "State/Province" in ManageReferenceRangesPage

Scenario: 17_Check sort for State/Province column for descending
	When I sort column "State/Province" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Descending" in column "State/Province" in ManageReferenceRangesPage

Scenario: 18_Check sort for Country column for ascending
	When I sort column "Country" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "Country" in ManageReferenceRangesPage

Scenario: 19_Check sort for Country column for descending
	When I sort column "Country" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Descending" in column "Country" in ManageReferenceRangesPage

Scenario: 20_Check sort for Lab Status column for ascending
	When I sort column "Lab Status" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "Lab Status" in ManageReferenceRangesPage

Scenario: 21_Check sort for Lab Status column for descending
	When I sort column "Lab Status" in LabsGrid of ManageReferenceRangesPage
	Then I see data in sort order "Descending" in column "Lab Status" in ManageReferenceRangesPage

Scenario: 22_Filter Lab Id column with IsEqualTo filter criteria
	When I apply filter on column "Lab ID" with filter text "L01" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "Lab ID" with filter text "L01" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "Lab ID" in ManageReferenceRangesPage

Scenario: 23_Filter Laboratory Name column with IsEqualTo filter criteria
	When I apply filter on column "Laboratory Name" with filter text "Lab" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "Laboratory Name" with filter text "Lab" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "Laboratory Name" in ManageReferenceRangesPage

Scenario: 24_Filter Company column with IsEqualTo filter criteria
	When I apply filter on column "Company" with filter text "Clinical" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "Company" with filter text "Clinical" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "Company" in ManageReferenceRangesPage

Scenario: 25_Filter Department column with IsEqualTo filter criteria
	When I apply filter on column "Department" with filter text "Health&Science" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "Department" with filter text "Health&Science" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "Department" in ManageReferenceRangesPage

Scenario: 26_Filter Address column with IsEqualTo filter criteria
	When I apply filter on column "Address" with filter text "RP Road" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "Address" with filter text "RP Road" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "Address" in ManageReferenceRangesPage

Scenario: 27_Filter City/Town column with IsEqualTo filter criteria
	When I apply filter on column "City/Town" with filter text "Hyderabad" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "City/Town" with filter text "Hyderabad" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "City/Town" in ManageReferenceRangesPage

Scenario: 28_Filter State/Province column with IsEqualTo filter criteria
	When I apply filter on column "State/Province" with filter text "AP" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "State/Province" with filter text "AP" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "State/Province" in ManageReferenceRangesPage

Scenario: 29_Filter Country column with IsEqualTo filter criteria
	When I apply filter on column "Country" with filter text "INDIA" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "Country" with filter text "INDIA" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "Country" in ManageReferenceRangesPage

Scenario: 30_Filter Country column with IsEqualTo filter criteria
	When I apply filter on column "Lab Status" with filter text "Active" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see filtered data in column "Lab Status" with filter text "Active" and filter criteria "Is equal to" in ManageReferenceRangesPage
	And I clear filter on column "Lab Status" in ManageReferenceRangesPage

Scenario: 31_Verify the LabTests table columns
    Given I open lab with labid "L01" from ManageReferenceRanges page
    Then I verify the below columns names displayed in the labTests table	
	| Name            |
	| Lab Test (Name) |
	| Category        |
	| Subcategory     |
	| Speciman        |
	| Method          |
	| Loinc           |
	And I see breadcrumb items in order
	| BreadCrumb              |
	| Manage Reference Ranges |
	| Lab(L01)                |

Scenario: 32_Check sort for Lab Test (Name) column for ascending
	When I sort column "Lab Test (Name)" in LabsGrid of LabTestsPage
	Then I see data in sort order "Ascending" in column "Lab Test (Name)" in LabTestsPage

Scenario: 33_Check sort for Lab Test (Name) column for descending
	When I sort column "Lab Test (Name)" in LabsGrid of LabTestsPage
	Then I see data in sort order "Descending" in column "Lab Test (Name)" in LabTestsPage

Scenario: 34_Filter Lab Test (Name) column with IsEqualTo filter criteria
	When I apply filter on column "Lab Test (Name)" with filter text "MRRTEST1" by filter criteria "Is equal to" in LabTestsGrid
	Then I see filtered data in column "Lab Test (Name)" with filter text "MRRTEST1" and filter criteria "Is equal to" in LabTestsGrid
	And I clear filter on column "Lab Test (Name)" in LabTestsGrid

Scenario: 35_Verify the LabTests table columns
	Given I click breadcrumb "Manage Reference Ranges"
	Then I see page "Manage Reference Ranges" 

Scenario: 36_Apply Filter on LabID  column to verify No Data found 
    When I apply filter on column "Lab ID" with filter text "100" by filter criteria "Is equal to" in ManageReferenceRangesPage
	Then I see No records message in Manage Reference Range Page
	And I clear filter on column "Lab ID" in ManageReferenceRangesPage

Scenario: 37_Apply Filter on Lab Test (Name) column to verify No Data found
    Given I open lab with labid "101LAB" from ManageReferenceRanges page
    When I apply filter on column "Lab Test (Name)" with filter text "100obin" by filter criteria "Is equal to" in LabTestsGrid
	Then I see No records message in Manage Reference Range Page
	And I clear filter on column "Lab Test (Name)" in LabTestsGrid	
	
Scenario: 38_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page
