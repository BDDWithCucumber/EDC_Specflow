Feature: MRR_AuditHistory

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Verification of Audit History in the MRR table grid of Manage Reference Ranges page after adding a record
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I sort column "Start Date1" in MrrGrid of ManageReferenceRangesPage
	And I sort column "From Age1" in MrrGrid of ManageReferenceRangesPage
	And I sort column "From Age2" in MrrGrid of ManageReferenceRangesPage
	And I sort column "Gender" in MrrGrid of ManageReferenceRangesPage
	And I sort column "Gender" in MrrGrid of ManageReferenceRangesPage
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  |
	| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   | 6Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage
	And I read the Ref ID of the created record in the MRR table of Manage Reference Ranges page
	And I click on "History" Icon for the added record in the MRR table grid of Manage Reference Range page	
	Then I should see the "Lab Name" as "LabName (L21)" in the Change History window of MRR table grid in Manage Reference page
	#And I should see the "Lab TestName" as "MRRTEST1 (26,996.00)" in the Change History window of MRR table grid in Manage Reference page
	#And I should see the "Heading" as "Change History" in the Change History window of MRR table grid in Manage Reference page
	#And I should see the "Ref ID" as "Ref ID:" in the Change History window of MRR table grid in Manage Reference page
	And I should see the below mentioned details in the Change History Window
	| Date/Time                                                             | Reference Range                             | Action        |	
	| GST\r\n testadmin testadmin (EDCDEV\testadmin) | Date (Start, End): 15-Oct-2018, --\r\nGender: Not Specified\r\nAge (From, To): 12 Years, 13 Years\r\nNormal Range (Low, High): 14, 15\r\nCritical Range (Low, High): 16, 17\r\nUnit: 6Unit\r\nNot Applicable: False  | Initial Entry |
	And I should view the button "Print" in the Change History window of MRR table grid in Manage Reference page
	And I should view the button "Close" in the Change History window of MRR table grid in Manage Reference page
	And I Click on "Close" button in the in the Change History window of MRR table grid in Manage Reference page

Scenario: 03_Verification of Audit History in the MRR table grid of Manage Reference Ranges page after editing the record
	When I read the Ref ID of the created record in the MRR table of Manage Reference Ranges page
	And I sort column "Ref ID" in MrrGrid of ManageReferenceRangesPage
	And I sort column "Ref ID" in MrrGrid of ManageReferenceRangesPage
	#And I apply filter on column "Ref ID" for the created record by filter criteria "Equal to" in Mrr Lab Test Name Grid
	And I click on "Edit" Icon for the added record in the MRR table grid of Manage Reference Range page
	And enter the below lab data in ReferenceRangesPage
	| StartDate | EndDate    | Gender | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 10/16/2018 | 10/28/2018 | Male |            | 14       | Years        |           | 15     | Years      |                  | 24              |                    | 34              |                     | 36                 |                        | 46                 | 9Unit   |
	And I check the not applicable checkbox in ReferenceRangesPage
	And I click on "Save" icon of the first record in ReferenceRangesPage
	And I click on "History" Icon for the updated record in the MRR table grid of Manage Reference Range page
	Then I should see the below mentioned details in the Change History Window
	| Date/Time                                                             | Reference Range                             | Action        |
	| GST\r\n testadmin testadmin (EDCDEV\\testadmin)| Date (Start, End): 16-Oct-2018, 28-Oct-2018\r\nGender: Male\r\nAge (From, To): 14 Years, 15 Years\r\nNormal Range (Low, High): 24, 34\r\nCritical Range (Low, High): 36, 46\r\nUnit: 9Unit\r\nNot Applicable: True | Updated |		
	| GST\r\n testadmin testadmin (EDCDEV\testadmin) | Date (Start, End): 15-Oct-2018, --\r\nGender: Not Specified\r\nAge (From, To): 12 Years, 13 Years\r\nNormal Range (Low, High): 14, 15\r\nCritical Range (Low, High): 16, 17\r\nUnit: 6Unit\r\nNot Applicable: False  | Initial Entry |
	And I Click on "Close" button in the in the Change History window of MRR table grid in Manage Reference page
	
	#And I clear filter on column "Ref ID" in Mrr Lab Test Name Grid

Scenario: 04_Verification of Audit History in the MRR table grid of Manage Reference Ranges page after deleting the record
	When I sort column "Ref ID" in MrrGrid of ManageReferenceRangesPage
	And I read the Ref ID of the created record in the MRR table of Manage Reference Ranges page
	And I click on "Delete" Icon for the updated record in the MRR table grid of Manage Reference Range page	
	And I click continue in modal dialog having title "Delete Reference Range Record(s)" and partial message "Are you sure you want to permanently delete 1 reference range record?"
	And I Check the Checkbox View deleted Reference Ranges	
	And I click on "History" Icon for the deleted record in the MRR table grid of Manage Reference Range page
	Then I should see the below mentioned details in the Change History Window
	| Date/Time                                                             | Reference Range                             | Action        |
	| GST\r\n testadmin testadmin (EDCDEV\\testadmin)| Date (Start, End): 16-Oct-2018, 28-Oct-2018\r\nGender: Male\r\nAge (From, To): 14 Years, 15 Years\r\nNormal Range (Low, High): 24, 34\r\nCritical Range (Low, High): 36, 46\r\nUnit: 9Unit\r\nNot Applicable: True | Deleted |
	| GST\r\n testadmin testadmin (EDCDEV\\testadmin)| Date (Start, End): 16-Oct-2018, 28-Oct-2018\r\nGender: Male\r\nAge (From, To): 14 Years, 15 Years\r\nNormal Range (Low, High): 24, 34\r\nCritical Range (Low, High): 36, 46\r\nUnit: 9Unit\r\nNot Applicable: True | Updated |		
	| GST\r\n testadmin testadmin (EDCDEV\testadmin) | Date (Start, End): 15-Oct-2018, --\r\nGender: Not Specified\r\nAge (From, To): 12 Years, 13 Years\r\nNormal Range (Low, High): 14, 15\r\nCritical Range (Low, High): 16, 17\r\nUnit: 6Unit\r\nNot Applicable: False  | Initial Entry |
