Feature: US63102- DS-Create Form from existing: Use Existing for Codelist Linkages - Save
	

@ObjectiveEvidence @ReqID:US63102
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I Import Source Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_TS_SourceLink1.zip" 
	And Enter the unique study name "TS_SourceLink1"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (TS_SourceLink1)" in "Complete" state

	Scenario: T03_When I Import Target Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_TS_SourceLink1.zip" 
	And Enter the unique study name "TS_TargetLink2"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (TS_TargetLink2)" in "Complete" state

Scenario: T03_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

@ObjectiveEvidence @ReqID:3.1.2.6
Scenario: T05_When user opens the pop up page then all the checkboxes should be checked by default and the save button should be in disabled state
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "TS_SourceLink1"
	And I click on the Link "Linkage_Form1"			
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

Scenario: T06_When I click on Verify for the same study then the System should highlight all the duplicate fields in orange color and unchecked and the Include checkbox should be disabled
	When I click on Verify button	
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
	  And should see all the "Domains" and Domain Items in orange color
	  	#| Target1         |
	#| AB_Table04      |
	#| CodeList1_Yes04 |
	#| CodeList2_Yes04 |
	#| CodeList3_Yes04 |
	#| AB_Integer04    |
	#| AB_Float04      |
	#| AB_Text04       |
	#| AB_Date04       |
	#| AB_Table05      |
	#| CodeList1_Yes05 |
	#| CodeList2_No05  |
	#| CodeList3_Yes05 |
	#| AB_Integer05    |
	#| AB_Float05      |
	#| AB_Text05       |
	#| AB_Date05       |
	#| DEMO            |
	#| JAPANSTY        |
	#| BRNINJAP        |
	#| JPARENTS        |
	  And I shouldnot see the orange background color for the Domain Item
	| Row | TargetForDomain        |
	| 11  | CodeList1_Yes04_Rename |
	| 20  | CodeList2_No05_Rename  |
	| 27  | JAPANSTY_Rename        |	

	And I shouldnot see the Orange background color for the codelists
	| Row | TargetForCodelist |
	| 11  | XYN_Rename1       |
	| 20  | XYN_Rename2       |
	| 27  | XYN_Rename3       |	
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