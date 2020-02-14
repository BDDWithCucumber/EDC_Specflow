Feature: Manage Reference Ranges Major Study update changes for Units

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Study2_DICT_20181024_T15505995.zip" with study label "Base"
	Then I see study label "Study1" in header

Scenario: 04_Publish a new major study and verify the Lab Units list in Mrr page
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181024_T10215882.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major1" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page	
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	And enter the below lab data in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  |
	| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   | 2Unit |
	And I click on "Save" icon of the first record in ReferenceRangesPage	
	And I click add button to add a new lab test in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 2Unit    |
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 20Unit   |

Scenario: 05_Publish a new major study and verify the units in Unit Name drop down in Edit mode of MRR record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 2Unit    |
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 20Unit   |

Scenario: 06_Publish a new major study and verify the units in Unit Name drop down in Copy mode of MRR record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Copy" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 2Unit    |
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 20Unit   |


Scenario: 07_Publish a new major study and verify the previously added MRR record
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181024_T10554018.zip" with Label "Major2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major2" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page	
	And I open labtest with labname "MRRTEST1" from labtests page	
	Then I should see the below records in the ManageReferenceRanges page
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  |
	| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   | 2Unit |
	#| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   | 20Unit |

Scenario: 08_Publish a new major study after removing units and verify the units in the dropdown while adding a record
	When I click add button to add a new lab test in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 2Unit    |
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 20Unit   |
Scenario: 09_Publish a new major study after removing the units and verify the units in the dropdown while Editing a record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 2Unit    |
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 20Unit   |

Scenario: 10_Publish a new major study after removing the units and verify the units in dropdown while copying a record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Copy" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 2Unit    |
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 20Unit   |

Scenario: 11_Publish a new major study after removing the units and verify the units if blank value is coming in place of UnitName for the removed Unit
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181024_T11153114.zip" with Label "Major3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major3" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page	
	And I open labtest with labname "MRRTEST1" from labtests page
	Then I should see the below records in the ManageReferenceRanges page
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit  |
	| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   |  |
	#| 10/15/2018 |  | Not Specified |               | 12         | Years        |             | 13       | Years      |                      | 14                |                       | 15                 |                        | 16                  |                         | 17                   |  |

Scenario: 12_Publish a new major study after removing the units and see that the removed unit is not coming in the UnitName dropdown while adding a Mrr record
	When I click add button to add a new lab test in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	
Scenario: 13_Publish a new major study after removing the units and see that the removed unit is not coming in the UnitName dropdown while editing a Mrr record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |	
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |

Scenario: 14_Publish a new major study after removing the units and see that the removed unit is not coming in the UnitName dropdown while copying a Mrr record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |	
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |

Scenario: 15_Publish a new major study after changing the lab dictonary  and verify if the newly added units are coming while adding a new MRR record
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181109_T05004165.zip" with Label "Major3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major3" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page	
	And I open labtest with labname "MRRTEST1" from labtests page
	And I click add button to add a new lab test in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 1Unit    |
	| 22Unit   |
	| 23Unit   |
	
Scenario: 16_Publish a new major study after changing the lab dictonary  and verify if the newly added units are coming while editing a new MRR record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Edit" icon for the first record in the MRR table of ManageReferenceRanges page
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |	
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 1Unit    |
	| 22Unit   |
	| 23Unit   |

Scenario: 17_Publish a new major study after changing the lab dictonary  and verify if the newly added units are coming while copying a new MRR record
	When I click on "Cancel" icon of the first record in ReferenceRangesPage 
	And I click on "Copy" icon of the first record in ReferenceRangesPage
	Then I should see the below mentioned values in the "Unit" drop down once I click on dropdown in ManageReferenceRanges page
	| Dropdown |
	| -Select- |	
	| 3Unit    |
	| 4Unit    |
	| 5Unit    |
	| 6Unit    |
	| 7Unit    |
	| 8Unit    |
	| 9Unit    |
	| 10Unit   |
	| 11Unit   |
	| 12Unit   |
	| 13Unit   |
	| 14Unit   |
	| 15Unit   |
	| 16Unit   |
	| 17Unit   |
	| 18Unit   |
	| 19Unit   |
	| 1Unit    |
	| 22Unit   |
	| 23Unit   |
	