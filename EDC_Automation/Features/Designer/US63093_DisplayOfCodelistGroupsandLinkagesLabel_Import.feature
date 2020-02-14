Feature: DisplayOfCodelistGroupsandLinkagesLabel	

@ObjectiveEvidence @ReqID:US63093.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_Source59_US63093.zip" 
	And Enter the unique study name "Import_Source59"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Source59)" in "Complete" state
#
Scenario: T03_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

###############Verification of the label Codelist Group or Codelist Linkage if the corresponding codelist has codelist Group and Codelist Linkage ##########################
@ObjectiveEvidence @ReqID:3.1.2.6
Scenario: T04_When the user clicks on verify then the duplicate Domains should be highlited in orange color
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Source59"
	And I navigate to the page "5"
	And I click on the Link in the popup "LinkagesForm_LinkagesOnly"
	#Then I should the lable as below
	Then I should see the lable as below
	| Row | Label            |
	| 12  | Codelist Linkage |

Scenario: T05_When the Question has both the Codelist Linkage and Codelist Group then user should not see any label
	When I expand the domain of row
	| Row |
	| 14  |
	Then I should not see the lable
	| Row | TargetCodelist | Label |
	| 16  | Countris_CL    |       |

Scenario: T06_When the Question has Codelist Group then the user should see the label as Codelist Group
	Then I should see the lable as below
	| Row | Label          |
	| 19  | Codelist Group |

#############Import a study of Target App 5.7 and open a study of Target App 5.9 and verify ###########################

Scenario: T07_When I Import Study of 5.7 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Study_57_US63093_1.zip" 
	And Enter the unique study name "Import_Study57"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Study57)" in "Complete" state

Scenario: T08_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

###############Verification of the label Codelist Group or Codelist Linkage if the corresponding codelist has codelist Group and Codelist Linkage ##########################
@ObjectiveEvidence @ReqID:3.1.2.6
Scenario: T09_When the user clicks on verify then the duplicate Domains should be highlited in orange color
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Source59"
	And I navigate to the page "5"
	And I click on the Link in the popup "LinkagesForm_LinkagesOnly"
	#Then I should the lable as below
	Then I should see the lable as below
	| Row | Label            |
	| 12  | Codelist Linkage |

Scenario: T10_When the Question has both the Codelist Linkage and Codelist Group then user should not see any label
	When I expand the domain of row
	| Row |
	| 14  |
	Then I should not see the lable
	| Row | TargetCodelist | Label |
	| 16  | Countris_CL    |       |

Scenario: T11_When the Question has Codelist Group then the user should see the label as Codelist Group
	Then I should see the lable as below
	| Row | Label          |
	| 19  | Codelist Group |

Scenario: 12_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies	
	When I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName       |
	| Import_Source59 |
	| Import_Study57  |
Then I should not see these studies in the Home page
	| StudyName       |
	| Import_Source59 |
	| Import_Study57  |

