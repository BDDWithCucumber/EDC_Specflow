Feature: US63110_DSCreateFormfromexisting_Use Existing UI changes
	

@ObjectiveEvidence @ReqID:US63110.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

#Scenario: T02_When I Import Study of 5.9 to Designer then I see message "Study has been successfully added" and status as complete
#    When I click on the Home Button
#	And I click on the Link "Import Study"
#	And I import a study "Import_1_US68936.zip" 
#	And Enter the unique study name "Import_59"
#	And Select the sponsor name "Sponsor1"
#	And I click on the Save button 	
#	And I should see the notification "Study has been successfully added"
#	And I click on the Link "View Study Jobs"
#	Then I should see the status of the study "Study Import (Import_59)" in "Complete" state
#
#Scenario: T03_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete
#    When I click on the Home Button
#	And I click on the Link "Import Study"
#	And I import a study "Test3210_57studyFile.zip" 
#	And Enter the unique study name "Import_57"
#	And Select the sponsor name "Sponsor1"
#	And I click on the Save button	
#	
#	And I should see the notification "Study has been successfully added"
#	And I click on the Link "View Study Jobs"
#	Then I should see the status of the study "Study Import (Import_57)" in "Complete" state

#Scenario: T04_When the user clicks on Forms tab then Forms page should be displayed
#	When I click on the "Forms" tab
#	Then I should see the "Forms" page	
#
#Scenario: T05_When I click on Create Form from Existing Source Target App is of 5.9 and Target TargetAPP 5.7
#	When I click on the Link "Create Form from Existing"	
#	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
#	And I click on the Link "Import_59"
#	And I click on the Link "Form1"
#	Then I should see the columns headings in the popup page
#	| Index | ColumnHeading |
#	| 1     |               |
#	| 2     | Include       |
#	| 3     | Source        |
#	| 4     | Target        |
#	| 5     |               |
#	| 6     | Include       |
#	| 7     | Source        |
#	| 8     | Target        |
#	| 9     | Merge         |
#	| 10    |               |
#	| 11    | Include       |
#	| 12    | Source        |
#	| 13    | Target        |
#	| 14    | Merge         |
	
Scenario: T06_When I click on Create Form from Existing and the Source Target App is of 5.7 and Target TargetAPP 5.7
	When I click on the Cancel button on the popup page
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_57"
	And I click on the Link "AutoBuild_Form01"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     | Merge         |	
	Then I should not see the Column headings in the popup page
	| Index | ColumnHeading |	
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |

Scenario: T07_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete	
	When I click on the Cancel button on the popup page	
    And I click on the Home Button	
	Then I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Import_59 |

Scenario: T08_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page

Scenario: T09_When I click on Create Form from Existing and the Source Target App is of 5.7 and Target TargetAPP 5.9
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_57"
	And I click on the Link "AutoBuild_Form01"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	And I should not see the Column headings in the popup page
	| Index | ColumnHeading |
	| 10    |               |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |

Scenario: T10_When I click on Create Form from Existing and the Source Target App is of 5.9 and Target TargetAPP 5.9
	When I click on the Cancel button on the popup page
	And I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_59"
	And I click on the Link "Form1"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     | Merge         |
	| 10    |               |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |

	###########Create study from existing study 57######################################
Scenario: T11_When we create a study from existing study and change the Lab Setting option to No then I should see the Message below the drop down			
	When I click on the Cancel button on the popup page
	When I click on the Home Button
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"
	
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName |
	| Import_57 |
	And I change the Study Name to "Create_E_57"
	And I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T12_When we create a study from existing study where the previous Labs option is Set to Yes then the study should be created with Labs Option Set to Yes	
	When I click on the Link "View Study Jobs"
	And I should see the status of the study "Create Study (Create_E_57)" in "Complete" state
	And I click breadcrumb item "Home"
	Then I see Designer Home Page
	

Scenario: T13_When the user clicks on Forms tab then Forms page should be displayed
	When I Search for the study in the studies list of Home page and open the study
	| StudyName   |
	| Create_E_57 |
	And I click on the "Forms" tab
	Then I should see the "Forms" page	



Scenario: T14_When I click on Create Form from Existing Source Target App is of 5.9 and Target TargetAPP 5.7
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_59"
	And I click on the Link "Form1"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     | Merge         |
	| 10    |               |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |

Scenario: T15_When I click on Create Form from Existing and the Source Target App is of 5.7 and Target TargetAPP 5.7
	When I click on the Cancel button on the popup page
	And I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Create_E_57"
	And I click on the Link "AutoBuild_Form01"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     |               |
	And I should not see the Column headings in the popup page
	| Index | ColumnHeading |
	| 10    |               |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |
#
#	#############################Create Study From existing study 5.9 ver########################################
#
	
Scenario: T16_When we create a study from existing study and change the Lab Setting option to No then I should see the Message below the drop down			
	When I click on the Cancel button on the popup page
	And I click on the Home Button
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"	
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName     |
	| Import_59 |
	And I change the Study Name to "Create_E_59"
	And I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T17_When we create a study from existing study where the previous Labs option is Set to Yes then the study should be created with Labs Option Set to Yes	
	When I click on the Link "View Study Jobs"
	And I should see the status of the study "Create Study (Create_E_59)" in "Complete" state
	And I click breadcrumb item "Home"
	Then I see Designer Home Page


Scenario: T18_When the user clicks on Forms tab then Forms page should be displayed
	When I Search for the study in the studies list of Home page and open the study
	| StudyName   |
	| Create_E_59 |
	And I click on the "Forms" tab
	Then I should see the "Forms" page


Scenario: T19_When I click on Create Form from Existing and the Source Target App is of 5.7 and Target TargetAPP 5.9
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Create_E_57"
	And I click on the Link "AutoBuild_Form01"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	And I should not see the Column headings in the popup page
	| Index | ColumnHeading |
	| 10    |               |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |

Scenario: T20_When I click on Create Form from Existing and the Source Target App is of 5.9 and Target TargetAPP 5.9
	When I click on the Cancel button on the popup page
	And I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Create_E_59"
	And I click on the Link "Form1"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     |               |
	| 10    | Merge         |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |

Scenario: T21_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x or 5.8x then study should be added sucessfully
	When I click on the Cancel button on the popup page
	When I click breadcrumb item "Home"
	When I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                     | SafetyMapping |
	| Study_57    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |		
	When I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T22_When user adds the study and open then the study page should be displayed
	When I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study_57    |
	Then I should see the "Study" page

Scenario: T23_When the user create a Codelist
	When I click on the "Codelists" tab
	And I Click on "Add Codelist"
	And I enter CodelistName as "Codelist1"
	And I enter CodelistDesc as "CodelistDesc"
	And I click on the Codelist Save button	
	Then I should see the notification "Codelist1 has been successfully added"

Scenario: T24_When the user create a Form
	When Click on the Codelist "Codelist1"
	Then I add the below codelist items and I should see the successful notification message
	| CodeListname | CodePrefix | CodeItemDesc  | CodeItemValue      |
	| Codelist1    | 1          | CodelistItem1 | CodelistItemvalue1 |
	| Codelist1    | 2          | CodelistItem2 | CodelistItemvalue2 |

Scenario: T25_When the user create Domain
	When I click on the "Domains" tab
	Then I should see the "Domains" page

Scenario: T26_When the user create Domain
	When I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain1"
	And enter DomainDesc as "Domain1Desc"
	And I click on the Domains Save button
	Then I should see the notification "Domain1 has been successfully added"

Scenario: T27_When the user create Domain Items
    When I click on the Link "Domain1"
	And I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName    | Source | Datatype | Codelist  | maxlen |
	| DomainItem1 | EDC    | Text     | Codelist1 | 30     |
	Then I should see the notification "DomainItem1 has been successfully added"

Scenario: T28_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

Scenario: T29_When the user clicks on Forms tab then Forms page should be displayed	
	When I click on the Link "Add Form"
	And I enter the FormName as "Form1"
	And I enter the Formlabel as "FormLabel"
	And I click on Form Save button
	Then I should see the notification "Form1 has been successfully added"

Scenario: T30_When the user clicks on Add Question
	When I click on the Link "Form1"
	And I click on the Link "Add Question"
	And I enter the Question Data as "Question1"
	And I click on QuestionData Save button
	Then I should see the notification "Question has been successfully added"	

Scenario: T31_When the user clicks on Add Question 
	When I add the below form question items and I should see the successful notification message
	| Qestionname | Domain  | QuestionDisplayOption | QuestionItemName | ConditionalItemName | ConditionalComparator | ConditionalValue | DataGroup | CodelistGroup | CodelistLiknage | linkageItem | HeaderName | Keysequence |
	| Question1   | Domain1 | Drop-Down             | DomainItem1      | --                  | --                    |                  | --        |               |                 |             |            |             |
	And I click on the "Forms" tab
	Then I should see the "Forms" page

Scenario: T32_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x or 5.8x then study should be added sucessfully
	When I click breadcrumb item "Home"
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping |
	| Study_59  | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.9x or greater | Not Enabled   |	
	When I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T33_When user adds the study and open then the study page should be displayed
	When I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study_59    |
	Then I should see the "Study" page

Scenario: T34_When the user create a Codelist
	When I click on the "Codelists" tab
	And I Click on "Add Codelist"
	And I enter CodelistName as "Codelist1"
	And I enter CodelistDesc as "CodelistDesc"
	And I click on the Codelist Save button	
	Then I should see the notification "Codelist1 has been successfully added"

Scenario: T35_When the user create a Form
	When Click on the Codelist "Codelist1"
	Then I add the below codelist items and I should see the successful notification message
	| CodeListname | CodePrefix | CodeItemDesc  | CodeItemValue      |
	| Codelist1    | 1          | CodelistItem1 | CodelistItemvalue1 |
	| Codelist1    | 2          | CodelistItem2 | CodelistItemvalue2 |

Scenario: T36_When the user create Domain
	When I click on the "Domains" tab
	Then I should see the "Domains" page

Scenario: T37_When the user create Domain
	When I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain1"
	And enter DomainDesc as "Domain1Desc"
	And I click on the Domains Save button
	Then I should see the notification "Domain1 has been successfully added"

Scenario: T38_When the user create Domain Items
    When I click on the Link "Domain1"
	And I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName    | Source | Datatype | Codelist  | maxlen |
	| DomainItem1 | EDC    | Text     | Codelist1 | 30     |
	Then I should see the notification "DomainItem1 has been successfully added"

Scenario: T39_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

Scenario: T40_When the user clicks on Forms tab then Forms page should be displayed	
	When I click on the Link "Add Form"
	And I enter the FormName as "Form1"
	And I enter the Formlabel as "FormLabel"
	And I click on Form Save button
	Then I should see the notification "Form1 has been successfully added"

Scenario: T41_When the user clicks on Add Question
	When I click on the Link "Form1"
	And I click on the Link "Add Question"
	And I enter the Question Data as "Question1"
	And I click on QuestionData Save button
	Then I should see the notification "Question has been successfully added"	

Scenario: T42_When the user clicks on Add Question 
	When I add the below form question items and I should see the successful notification message
	| Qestionname | Domain  | QuestionDisplayOption | QuestionItemName | ConditionalItemName | ConditionalComparator | ConditionalValue | DataGroup | CodelistGroup | CodelistLiknage | linkageItem | HeaderName | Keysequence |
	| Question1   | Domain1 | Drop-Down             | DomainItem1      | --                  | --                    |                  | --        |               |                 |             |            |             |
	And I click on the "Forms" tab
	Then I should see the "Forms" page

#Scenario: T43_When I click on Create Form from Existing and select the different study 
#	When I click on the Link "Create Form from Existing"	
#	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
#	And I click on the Link "Study1"
#	And I click on the Link "Form1"	

Scenario: T44_When I click on Create Form from Existing and select the different study 
	When I click breadcrumb item "Home"
	Then I see Designer Home Page

Scenario: T45_When the user clicks on Forms tab then Forms page should be displayed
	When I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study_59  |
	And I click on the "Forms" tab
	Then I should see the "Forms" page


Scenario: T46_When I click on Create Form from Existing and the Source Target App is of 5.7 and Target TargetAPP 5.9
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study_57"
	And I click on the Link "Form1"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     | Merge         |
	And I should not see the Column headings in the popup page
	| Index | ColumnHeading |
	| 10    |               |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |

Scenario: T47_When I click on Create Form from Existing and the Source Target App is of 5.9 and Target TargetAPP 5.9
	When I click on the Cancel button on the popup page
	And I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study_59"
	And I click on the Link "Form1"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     |               |
	| 10    | Merge         |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |

Scenario: T48_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the Cancel button on the popup page
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study_57  |
	And I click on the "Forms" tab
	Then I should see the "Forms" page	

Scenario: T49_When I click on Create Form from Existing Source Target App is of 5.9 and Target TargetAPP 5.7
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study_59"
	And I click on the Link "Form1"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     |               |
	| 10    | Include       |
	| 11    | Source        |
	| 12    | Target        |

Scenario: T50_When I click on Create Form from Existing and the Source Target App is of 5.7 and Target TargetAPP 5.7
	When I click on the Cancel button on the popup page
	And I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study_57"
	And I click on the Link "Form1"
	Then I should see the columns headings in the popup page
	| Index | ColumnHeading |
	| 1     |               |
	| 2     | Include       |
	| 3     | Source        |
	| 4     | Target        |
	| 5     |               |
	| 6     | Include       |
	| 7     | Source        |
	| 8     | Target        |
	| 9     |               |
	And I should not see the Column headings in the popup page
	| Index | ColumnHeading |
	| 10    |               |
	| 11    | Include       |
	| 12    | Source        |
	| 13    | Target        |
	| 14    | Merge         |

Scenario: T51_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
	When I click on the Cancel button on the popup page		
	And I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName   |
	| Import_59   |
	| Import_57   |
	| Create_E_59 |
	| Create_E_57 |
	| Study_57    |
	| Study_59    |
Then I should not see these studies in the Home page
	| StudyName   |
	| Import_59   |
	| Import_57   |
	| Create_E_59 |
	| Create_E_57 |
	| Study_59    |
	| Study_59    |





















#
#	Then I should see the column "Codelist Group" aganist Codelist option
#	And I should see the column "Codelist Linkage" aganist Codelist option
#	#And I should see the included checkbox and not selected
#	And I should see Include option and it not checked by default
#	And I click on "Cancel" button in the popupWindow
#
#Scenario: T06_When I click on Create Form from Existing and the Source Target App is of 5.7 or greater and Target 5.7 or lesser
#	When I click on the Link "Create Form from Existing"	
#	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
#	And I click on the Link "Import_Study1"
#	And I click on the Link "AutoBuild_Form01"
#	Then I shouldnot  see the column "Codelist Group" aganist Codelist option
#	And I shouldnot  see the column "Codelist Linkage" aganist Codelist option
#	And I shouldnot see the Included checkbox
#	#And I should  see Include option and it not checked by default
#	And I click on "Cancel" button in the popupWindow
#
#Scenario: T07_When I click on Create Form from Existing and the Target Target App is of 5.9 and Source 5.7
#	When I click on the Link "Create Form from Existing"	
#	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
#	And I click on the Link "Import_Study1"
#	And I click on the Link "AutoBuild_Form01"
#	Then I shouldnot  see the column "Codelist Group" aganist Codelist option
#	And I shouldnot  see the column "Codelist Linkage" aganist Codelist option
#	And I shouldnot see the Included checkbox
#	And user should see Domain, Domain Items and Codelists
#	#And I shouldnot see Include option and it not checked by default
#	And I click on "Cancel" button in the popupWindow
#
#Scenario: T08_When I click on Create Form from Existing and the Target Target App is of 5.7 or less and Source 5.9
#	When I click on the Link "Create Form from Existing"	
#	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
#	And I click on the Link "Import_Study1"
#	And I click on the Link "AutoBuild_Form01"
#	Then I should  see the column "Codelist Group" in disabled state aganist Codelist option
#	And I should  see the column "Codelist Linkage" in disabled state aganist Codelist option
#	And Included checkbox is disabled
#	#And I shouldnot see Include option and it not checked by default
#	And I click on "Cancel" button in the popupWindow
#
#Scenario: T09_Create a study from Existing study of TargetAPP 5.9 
#Repeat the scenarios T05 and T07
#
#Scenario: T10_Create a study from Existing study of TargetAPP 5.7
#Repeat the scenarios T06,T08
#
#Scenario: T11_Create a new study of TargetAPP 5.9
#Repeat the scenarios T05 and T07
#
#Scenario: T12_Create a new study of TargetAPP 5.7
#Repeat the scenarios T06,T08
#
#Scenario: T13_Create a new study of TargetAPP 5.9
#Repeat the scenarios T05 and T07
#
#Scenario :: Only







	