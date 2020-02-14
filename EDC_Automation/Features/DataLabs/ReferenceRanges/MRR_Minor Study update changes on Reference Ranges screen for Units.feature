Feature: MRR_Minor Study update changes for Units

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Study2_Hemo_20181030_T16593309.zip" with study label "Base"
	Then I see study label "Study1" in header

Scenario: 04_Publish a new minor study and verify the Lab Units list in Mrr page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181030_T16593309.zip" with Label "Minor1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I Wait until the study publish is complete for "Minor1" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page	
	And I open labtest with labname "HEMOGLOBIN1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  |
	| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   | 18Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	And I click add button to add a new lab test in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |	

Scenario: 05_Publish a new minor study and verify the Lab Units list in Mrr page after clicking on the Edit Icon
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |

Scenario: 06_Publish a new minor study and verify the Lab Units list in Mrr page after clicking on the Copy Icon
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Copy" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |


Scenario: 07_Publish a new minor study after removing the units and verify if the blank value is coming in place of Unit Name for the previously added MRR records
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181031_T10220548_modified" with Label "Minor2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I Wait until the study publish is complete for "Minor2" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page	
	And I open labtest with labname "HEMOGLOBIN1" from labtests page
	Then I should see the below records in the ManageReferenceRanges page
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  |
	| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   |  |
	

Scenario: 08_Publish a new minor study after removing and adding the units and verify if the removed units and newly added units are reflecting as expected or not
	When I click add button to add a new lab test in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |	
	| 19Unit   |
	| 20Unit   |
Scenario: 09_Publish a new minor study after removing and adding the units and verify if the removed units and newly added units are reflecting as expected or not while editing a MRR record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |	
	| 19Unit   |
	| 20Unit   |

Scenario: 10_Publish a new minor study after removing and adding the units and verify the Lab Units list in Mrr page after clicking on the Copy Icon
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Copy" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |	
	| 19Unit   |
	| 20Unit   |

Scenario: 11_Publish a new minor study after changing the lab dictonary to the existing study and verify the Lab units list in Unit Name of Mrr page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181111_T00011484.zip" with Label "Minor3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I Wait until the study publish is complete for "Minor3" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page	
	And I open labtest with labname "HEMOGLOBIN1" from labtests page
	Then I should see the below records in the ManageReferenceRanges page
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  |
	| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   |  |
	
Scenario: 12_Publish a new minor study after changing the lab dictonary to the existing study and verify the Lab units list in Unit Name of Mrr page
	When I click add button to add a new lab test in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 19Unit   |
	| 20Unit   |
	| 21Unit   |
	| 22Unit   |
	
Scenario: 13_Publish a new minor study after changing the lab dictonary to the existing study and verify the Lab units list in Unit Name of Mrr page
	When I click on "Cancel" icon of the first record in ReferenceRangesPage
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |	
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 19Unit   |
	| 20Unit   |
	| 21Unit   |
	| 22Unit   |

Scenario: 14_Publish a new minor study after changing the lab dictonary to the existing study and verify the Lab units list in Unit Name of Mrr page
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Copy" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |	
	| 1Unit    |
	| 2Unit    |
	| 3Unit    |
	| 4unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 19Unit   |
	| 20Unit   |
	| 21Unit   |
	| 22Unit   |
