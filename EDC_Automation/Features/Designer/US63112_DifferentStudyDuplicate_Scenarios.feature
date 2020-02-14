Feature: US63112_DifferentStudy	

@ObjectiveEvidence @ReqID:US68936.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page
##created study
Scenario: T02_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_Study59_US63112_SameStudy.zip" 
	And Enter the unique study name "Import_Source59"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	And I click Continue button on the confirmation dialog	
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Source59)" in "Complete" state
	
#Test study
Scenario: T03_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_Study59_US63112_Target3.zip" 
	And Enter the unique study name "Import_Target59"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Target59)" in "Complete" state

Scenario: T04_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import_Target59"

Scenario: T05_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

@ObjectiveEvidence @ReqID:3.1.2.6
Scenario: T06_When user opens the pop up page then all the checkboxes should be checked by default and the save button should be in disabled state
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Source59"
	And I click on the Link "AutoBuild_Form03"			
	Then user should see Verify button before the save button at the top of the pop up window
	And user should see Verify button before the save button at the bottom of the pop up window	
	And I should see the all the checkboxes in enabled state and checked by default for the Domain Items
	  | Target1         | Include1 |
	  | CodeList1_Yes04 | checked  |
	  | CodeList2_Yes04 | checked  |
	  | CodeList3_Yes04 | checked  |
	  | AB_Integer04    | checked  |
	  | AB_Float04      | checked  |
	  | AB_Text04       | checked  |
	  | AB_Date04       | checked  |
	  | CodeList1_Yes05 | checked  |
	  | CodeList2_No05  | checked  |
	  | CodeList3_Yes05 | checked  |
	  | AB_Integer05    | checked  |
	  | AB_Float05      | checked  |
	  | AB_Text05       | checked  |
	  | AB_Date05       | checked  |
	  | JAPANSTY        | checked  |
	  | BRNINJAP        | checked  |
	  | JPARENTS        | checked  |
	  And I should see all the checkboxes in enabled state and checked by default for the codelist
	  | Target2                | Include2 |
	  | AB_Color               | checked  |
	  | AB_Color               | checked  |
	  | AB_Times               | checked  |
	  | XYN                    | checked  |
	  | AB_Gender              | checked  |
	  | RACE_CD                | checked  |
	  | RACE_CD                | checked  |
	  | AB_Form03_CountInteger | checked  |
	  | AB_Form07_CreatedDate  | checked  |
	  | XYN                    | checked  |
	  | XYN                    | checked  |
	  | JPPAR                  | checked  |	  
	  And I should see the Save button in disabled state at top of the pop up window
	  And I should see the Save button in disabled state at bottom of the pop up window	

Scenario: T07_When I click on Verify for the differnt study then the System should not highlight the the non duplicate items
	When I click on Verify button	
	And I expand the domain of row
	| Row |
	| 18  |
	| 26  |
	Then I should see the Save button in enabled state at top of the pop up window
	And I should see the Save button in enabled state at bottom of the pop up window
	And I should see the all the checkboxes in enabled state and checked by default for the Domain Items
	| Target1         | Include1 |
	| CodeList1_Yes04 | checked |
	| CodeList2_Yes04 | checked |
	| CodeList3_Yes04 | checked |
	| AB_Integer04    | checked |
	| AB_Float04      | checked |
	| AB_Text04       | checked |
	| AB_Date04       | checked |
	| CodeList1_Yes05 | checked |
	| CodeList2_No05  | checked |
	| CodeList3_Yes05 | checked |
	| AB_Integer05    | checked |
	| AB_Float05      | checked |
	| AB_Text05       | checked |
	| AB_Date05       | checked |
	| JAPANSTY        | checked |
	| BRNINJAP        | checked |
	| JPARENTS        | checked |
	And I should see all the checkboxes in enabled state and checked by default for the codelist
	  | Source2                | Include2  |
	  | AB_Color               | checked |
	  | AB_Color               | checked |
	  | AB_Times               | checked |
	  | XYN                    | checked |
	  | AB_Gender              | checked |
	  | XYN                    | checked |
	  | XYN                    | checked |
	  | AB_Form03_CountInteger | checked |
	  | AB_Form07_CreatedDate  | checked |
	  | XYN                    | checked |
	  | XYN                    | checked |
	  | JPPAR                  | checked |	
	  And I shouldnot see the orange background color for the Domain Item
	| Row | TargetForDomain |
	| 11  | CodeList1_Yes04 |
	| 20  | CodeList2_No05  |
	| 27  | JAPANSTY        |
	And I shouldnot see the Orange background color for the codelists
	| Row | TargetForCodelist |
	| 11  | XYN       |
	| 20  | XYN       |
	| 27  | XYN       |

Scenario: T08_When the user clicks on Save button then records should be saved	
	When I rename the "FormName" as below
	| Row | FormName         | ReNameFormName |
	| 5   | AutoBuild_Form03 | FormName1      |
	And I rename the "FormLabel" as below
	| Row | FormLabel        | ReNameFormLabel |
	| 6   | AutoBuild_Form03 | FormLabel       |
	And I rename the "TableName" as below
	| Row | TableName        | RenameTableName |
	| 7   | AutoBuild_Form03 | TableName       |
	And I rename the "AutobuildTableName" as below
	| Row | Autobuild        | RenameAutobuild |
	| 8   | AutoBuild_Form03 | AutoBuildTable  |
    And I click on the Save Button
	Then I should see the notification "FormName1 has been successfully created."

Scenario: T09_When user opens the pop up page then all the checkboxes should be checked by default and the save button should be in disabled state
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Source59"
	And I click on the Link "AutoBuild_Form03"
	And I click on Verify button	
	Then I should see the Save button in enabled state at top of the pop up window
	And I should see the Save button in enabled state at bottom of the pop up window
	And I should see all the checkboxes in disabled state and unchecked by default for the Domain Items
	| Target1         | Include1  |
	| CodeList1_Yes04 | unchecked |
	| CodeList2_Yes04 | unchecked |
	| CodeList3_Yes04 | unchecked |
	| AB_Integer04    | unchecked |
	| AB_Float04      | unchecked |
	| AB_Text04       | unchecked |
	| AB_Date04       | unchecked |
	| CodeList1_Yes05 | unchecked |
	| CodeList2_No05  | unchecked |
	| CodeList3_Yes05 | unchecked |
	| AB_Integer05    | unchecked |
	| AB_Float05      | unchecked |
	| AB_Text05       | unchecked |
	| AB_Date05       | unchecked |
	| JAPANSTY        | unchecked |
	| BRNINJAP        | unchecked |
	| JPARENTS        | unchecked |
	And I should see all the checkboxes in disabled state and unchecked by default for the Codelist
	  | Source2                | Include2  |
	  | AB_Color               | unchecked |
	  | AB_Color               | unchecked |
	  | AB_Times               | unchecked |
	  | XYN                    | unchecked |
	  | AB_Gender              | unchecked |
	  | XYN                    | unchecked |
	  | XYN                    | unchecked |
	  | AB_Form03_CountInteger | unchecked |
	  | AB_Form07_CreatedDate  | unchecked |
	  | XYN                    | unchecked |
	  | XYN                    | unchecked |
	  | JPPAR                  | unchecked |
	  And should see all the "Domains" and Domain Items in orange color
	| Target1         |
	| AB_Table04      |
	| CodeList1_Yes04 |
	| CodeList2_Yes04 |
	| CodeList3_Yes04 |
	| AB_Integer04    |
	| AB_Float04      |
	| AB_Text04       |
	| AB_Date04       |
	| AB_Table05      |
	| CodeList1_Yes05 |
	| CodeList2_No05  |
	| CodeList3_Yes05 |
	| AB_Integer05    |
	| AB_Float05      |
	| AB_Text05       |
	| AB_Date05       |
	| DEMO            |
	| JAPANSTY        |
	| BRNINJAP        |
	| JPARENTS        |
	And I should see all the Codelist in orange color
	| Target2                |
	| AB_Color               |
	| AB_Color               |
	| AB_Times               |
	| XYN                    |
	| AB_Gender              |
	| XYN                    |
	| XYN                    |
	| AB_Form03_CountInteger |
	| AB_Form07_CreatedDate  |
	| XYN                    |
	| XYN                    |
	| JPPAR                  |

Scenario: T10_When the user renames the Domain Item then the Domain Item should be automatically checked by the system upon rename 
	When I rename the DomainItem as below
	| Row | SourceForDoamin | TargetForDomain | TargetRenameForDomain  |
	| 11  | CodeList1_Yes04 | CodeList1_Yes04 | CodeList1_Yes04_Rename |
	And I expand the domain of row
	| Row |
	| 18  |
	And I rename the DomainItem as below
	| Row | SourceForDoamin | TargetForDomain | TargetRenameForDomain  |
	| 20  | CodeList2_No05 | CodeList2_No05 | CodeList2_No05_Rename |
	And I expand the domain of row
	| Row |
	| 26  |
	And I rename the DomainItem as below
	| Row | SourceForDoamin | TargetForDomain | TargetRenameForDomain  |
	| 27  | JAPANSTY        | JAPANSTY        | JAPANSTY_Rename        |
	And I click on Verify button	
	Then I should see the checkbox in enabled state and checked by default for the Domain Item
	| Row | TargetForDomain        |
	| 11  | CodeList1_Yes04_Rename |
	| 20  | CodeList2_No05_Rename  |
	| 27  | JAPANSTY_Rename        |	
	And I shouldnot see the orange background color for the Domain Item
	| Row | TargetForDomain        |
	| 11  | CodeList1_Yes04_Rename |
	| 20  | CodeList2_No05_Rename  |
	| 27  | JAPANSTY_Rename        |	
	And I should see the Target Codelist textbox in enabled state as below
	| Row | TargetForCodelist |
	| 11  | XYN               |
	| 20  | XYN               |
	| 27  | XYN               |
	And the CodeList Include Checkbox should be unchecked and disabled for the below Codelists
	| Row | IncludeForCodelist | TargetForCodelist |
	| 11  | disabled           | XYN               |
	| 20  | disabled           | XYN               |
	| 27  | disabled           | XYN               |

Scenario: T11_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I rename the Codelist as below
	| Row | TargetForCodelist | TargetRenameForCodelist |
	| 11  | XYN               | XYN_Rename1              |
	| 20  | XYN               | XYN_Rename2              |
	| 27  | XYN               | XYN_Rename3              |		
	Then I should see the renamed Codelist as below
	| Row | TargetForCodelist |
	| 11  | XYN_Rename1        |
	| 20  | XYN_Rename2        |
	| 27  | XYN_Rename3        |
	And the CodeList Include Checkbox should be checked and enabled for the below Codelists
	| Row | IncludeForCodelist | TargetForCodelist |
	| 11  | enabled            | XYN_Rename1       |
	| 20  | enabled            | XYN_Rename2        |
	| 27  | enabled            | XYN_Rename3        |	
	And I shouldnot see the Orange background color for the codelists
	| Row | TargetForCodelist |
	| 11  | XYN_Rename1       |
	| 20  | XYN_Rename2       |
	| 27  | XYN_Rename3       |		

Scenario: T12_When user renames the first codelist item then all the similar codelist items will be renamed
	When I click on Verify button
	Then I should see the renamed Codelist as below
	| Row | TargetForCodelist |
	| 11  | XYN_Rename1        |
	| 20  | XYN_Rename1        |
	| 27  | XYN_Rename1        |

Scenario: T13_When user unchecks the Domain Item then validation should not happen for the entire record upon verify
	When I Uncheck the Include checkbox for Domain Item
	| Row | TargetForDomain        |
	| 11  | CodeList1_Yes04_Rename |
	| 20  | CodeList2_No05_Rename  |
	| 27  | JAPANSTY_Rename        |
	And I click on Verify button	
	Then the CodeList Include Checkbox should be unchecked and disabled automatically for codelists
	| Row | TargetForCodelist |
	| 11  | XYN_Rename1       |
	| 20  | XYN_Rename1       |
	| 27  | XYN_Rename1       |	
	And the Domain Item textbox is disabled for Domain Item
	| Row | TargetForDomain        |
	| 11  | CodeList1_Yes04_Rename |
	| 20  | CodeList2_No05_Rename  |
	| 27  | JAPANSTY_Rename        |	
	And the CodeList textbox is disabled for CodeList
	| Row | TargetForCodelist |
	| 11  | XYN_Rename1       |
	| 20  | XYN_Rename1       |
	| 27  | XYN_Rename1       |
	
Scenario: T14_When the user checks the Domain Item then the corresponding Codelist should be checked  
	When I check the Include checkbox for Domain Item
	| Row | TargetForDomain        |
	| 11  | CodeList1_Yes04_Rename |
	| 20  | CodeList2_No05_Rename  |
	| 27  | JAPANSTY_Rename        |
	Then the Domain Item textbox is enabled for Domain Item
	| Row | TargetForDomain        |
	| 11  | CodeList1_Yes04_Rename |
	| 20  | CodeList2_No05_Rename  |
	| 27  | JAPANSTY_Rename        |
	And the CodeList Include Checkbox should be checked and enabled for the below Codelists
	| Row | IncludeForCodelist | TargetForCodelist |
	| 11  | enabled            | XYN_Rename1       |
	| 20  | enabled            | XYN_Rename1       |
	| 27  | enabled            | XYN_Rename1       |

Scenario: T15_When the same Domain item name exists for two domain items then the system should throw the error that the Item Name is already in use
	When I click on Verify button
	And I rename the DomainItem as below
	| Row | SourceForDoamin | TargetForDomain | TargetRenameForDomain  |
	| 12  | CodeList2_Yes04 | CodeList2_Yes04 | CodeList1_Yes04_Rename |
	| 21  | CodeList3_Yes05 | CodeList3_Yes05 | CodeList2_No05_Rename  |
	| 28  | BRNINJAP        | BRNINJAP        | JAPANSTY_Rename        |	
	And I click on Verify button	
	Then I should see the error message "Item name is already in use."
	| Row |
	| 12  |
	| 21  |
	| 28  |

Scenario: T16_When the same Domain name exists for two Domains then the system should throw the already in use error upon verify
	When I click on Verify button
	And I rename the Domain "AB_Table05" to "AB_Table04" in row "17"	
	And I click on Verify button
	Then I should see the error message "Item name is already in use." in row "17"

Scenario: T17_When the user clicks on Forms tab then Forms page should be displayed
	When I click on cancel button
	And I click on the "Forms" tab
	Then I should see the "Forms" page

Scenario: T18_When the user unchecks the Include checkbox of Codelist then validation should not happen for Codelist upon verify
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Source59"
	And I click on the Link "AutoBuild_Form03"	
	And I expand the domain of row
	| Row |
	| 18  |
	| 26  |
	And I Uncheck the Include checkbox for Codelist Item
	| Row | TargetForCodelist |
	| 11  | XYN               |
	| 20  | XYN               |
	| 27  | XYN               |
	And I click on Verify button
	Then I shouldnot see the Orange background color for the codelists
	| Row | TargetForCodelist |
	| 11  | XYN               |
	| 20  | XYN               |
	| 27  | XYN               |
	And I should see the blue background color for the codelists
	| Row | TargetForCodelist |
	| 11  | XYN               |
	| 20  | XYN               |
	| 27  | XYN               |
	Then the CodeList Include Checkbox should be unchecked and disabled automatically for codelists
	| Row | TargetForCodelist |
	| 11  | XYN               |
	| 20  | XYN               |
	| 27  | XYN               |

Scenario: T19_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies	
	When I click on cancel button
	And I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName        |
	| Import_Source59  |
	| Import_Target59 |
Then I should not see these studies in the Home page
	| StudyName        |
	| Import_Source59  |
	| Import_Target59 |


#Scenario: T20_When I Import Study of 5.7 to Designer then I see message "Study has been successfully added" and status as complete
#    When I click on the Home Button
#	And I click on the Link "Import Study"
#	And I import a study "Import_Study59_US63112_Source.zip" 
#	And Enter the unique study name "Import_Source59"
#	And Select the sponsor name "Sponsor1"
#	And I click on the Save button 	
#	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
#	#And I click Continue button on the confirmation dialog
#	And I should see the notification "Study has been successfully added"
#	And I click on the Link "View Study Jobs"
#	Then I should see the status of the study "Study Import (Import_Source59)" in "Complete" state
#
#Scenario: T21_When the Domain Item alredy exists in Target and mapped to a different codelist then the Codelist should be displayed in blue and 
#	When I click on Verify button	
#	And I expand the domain of row
#	| Row |
#	| 30  |	
#	Then I should see the Orange background color for the DomainItems
#	| Row | TargetForDomain |
#	| 31  | DomainItem59D_1 |	
#	And I should see the blue background color for the codelists
#	| Row | TargetForCodelist |
#	| 31  | Codelist59_1      |
#	And the CodeList Include Checkbox should be unchecked and disabled for the below Codelists
#	| Row | IncludeForCodelist | TargetForCodelist |
#	| 31  | disabled           | Codelist59_1      |
#	
	
	