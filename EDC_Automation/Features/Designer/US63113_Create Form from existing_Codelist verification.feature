Feature: Create Form from existing_Codelist verification	
	Test Summary:
	User shall be able to verify codelist when user select verify button
User shall be able to see orange color background for duplicate items(codelist)
User shall be able to validate the enability of enable the include checkbox if there are no duplicate in source and target.
@ObjectiveEvidence @ReqID:US68936.1
#Import a study "Import_Study1"  with lower version
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: T02_When I Import Study of 5.7 to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "Import_1_US68936.zip" 
	And Enter the unique study name "Import_Study1"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs" 
	Then I should see the status of the study "Study Import (Import_Study1)" in "Complete" state

Scenario: T03_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

#Create a form from the  same study
Scenario: T04_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "Form1"
	 

Scenario: T05_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName10 | FormLabel10 | TableName10 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.

Scenario:   T_When verify button is clicked Then include checkbox should  unchecked and disabled
 When

Scenario: T06_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T07_When I have same domain items but codelists are different then include button for codelist should be disabled
	When I change the domain items in source and target as unique
	Then I can edit the codelist
	And I edit the codelist to unique in source and target
	And I click on verify button 
	When I edit again the domain item to be same in source and target
	And I click  on verify button 
	Then I see the codelist include checkbox is disabled

Scenario: T08_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source an d target are different 
	 Then I should see the codelist fields are editable

#Create A new Study and Do verify

Scenario: T09_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x then study should be added sucessfully
	When I click on the Cancel button on the popup page
	When I click breadcrumb item "Home"
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                     | SafetyMapping |
	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |		
	When I click on the Save button
	Then I should see the notification "Study has been successfully added"

Scenario: T10_When user adds the study and open then the study page should be displayed
	When I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study1    |
	Then I should see the "Study" page

Scenario: T11_When the user create a Codelist
	When I click on the "Codelists" tab
	And I Click on "Add Codelist"
	And I enter CodelistName as "Codelist1"
	And I enter CodelistDesc as "CodelistDesc"
	And I click on the Codelist Save button	
	Then I should see the notification "Codelist1 has been successfully added"

Scenario: T12_When the user create a codelist items
	When Click on the Codelist "Codelist1"
	Then I add the below codelist items and I should see the successful notification message
	| CodeListname | CodePrefix | CodeItemDesc  | CodeItemValue      |
	| Codelist1    | 1          | CodelistItem1 | CodelistItemvalue1 |
	| Codelist1    | 2          | CodelistItem2 | CodelistItemvalue2 |

Scenario: T13_When the user clicks on Domain tab then domain page should be displayed
	When I click on the "Domains" tab
	Then I should see the "Domains" page

Scenario: T14_When the user create Domain
	Then I should see the notification "Domain1 has been successfully added"

Scenario: T15_When the user create Domain Items
	When I Click on "Add Domain" to add new Domain
	And enter DomainName as "Domain1"
	And enter DomainDesc as "Domain1Desc"
	And I click on the Domains Save button
    When I click on the Link "Domain1"
	And I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName    | Source | Datatype | Codelist  | maxlen |
	| DomainItem1 | EDC    | Text     | Codelist1 | 30     |
	Then I should see the notification "DomainItem1 has been successfully added"

Scenario: T16_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

Scenario: T17_When the user clicks on Forms tab then Forms page should be displayed	
	When I click on the Link "Add Form"
	And I enter the FormName as "FormName8"
	And I enter the Formlabel as "FormLabel8"
	And I click on Form Save button
	Then I should see the notification "Form1 has been successfully added"

Scenario: T18_When the user clicks on Add Question
	When I click on the Link "FormName8"
	And I click on the Link "Add Question"
	And I enter the Question Data as "Question1"
	And I click on QuestionData Save button
	Then I should see the notification "Question1 has been successfully added"	

Scenario: T19_When the user clicks on Add Question 
	When I add the below form question items and I should see the successful notification message
	| Qestionname | Domain  | QuestionDisplayOption | QuestionItemName | ConditionalItemName | ConditionalComparator | ConditionalValue | DataGroup | CodelistGroup | CodelistLiknage | linkageItem | HeaderName | Keysequence |
	| Question1   | Domain1 | Drop-Down             | DomainItem1      | --                  | --                    |                  | --        |               |                 |             |            |             |
	And I click on the "Forms" tab
	Then I should see the "Forms" page
#Create a form from existing with same study
Scenario: T20_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study1"
	And I click on the Link "FormName8"
	

Scenario: T21_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName7 | FormLabel7 | TableName7 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T22_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T23_When I have same domain items but codelists are different then include button for codelist should be disabled
When I change the domain items in source and target as unique
Then I can edit the codelist
And I edit the codelist to unique in source and target
And I click on verify button 
When I edit again the domain item to be same in source and target
And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T24_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

Scenario: T25_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

#Create a  form from existing using different study
Scenario: T26_When I click on Create Form from Existing and select a different study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "Form1"
	

Scenario: T27_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName6 | FormLabel6 | TableName6 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T28_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T29_When I have same domain items but codelists are different then include button for codelist should be disabled
	When I change the domain items in source and target as unique
	Then I can edit the codelist
	And I edit the codelist to unique in source and target
	And I click on verify button 
	When I edit again the domain item to be same in source and target
	And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T30_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

Scenario:  T31_When User clicks on Home tab in the header then home tab should be displayed
 When I click on the "Home" tab
	Then I should see the "Home" page	

#Create a study from existing ie.,from above created study and do validation as once updated  then we cannot degrade
Scenario: T32_When I click on Create Study from Existing and Study should be created with given name
	When I click on the Cancel button on the popup page	
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName |
	| Study1    |
	And Enter the unique study name "Study2"
	And I click on the Save button
	Then I should see the notification "Study has been successfully added"
	
Scenario: T33_When I click on Create Form from Existing and select the different study 
	When I click on the Link "View Study Jobs"
	Then I should see the status of the study "Create Study (Study2)" in "Complete" state

Scenario: T34_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page

#Create form from existing from the same study
Scenario: T35_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study2"
	And I click on the Link "FormName8"
	

Scenario: T36_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName4 | FormLabel4 | TableName4 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T37_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T38_When I have same domain items but codelists are different then include button for codelist should be disabled
When I change the domain items in source and target as unique
Then I can edit the codelist
And I edit the codelist to unique in source and target
And I click on verify button 
When I edit again the domain item to be same in source and target
And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T39_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

Scenario: T40_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

#Create Form from existing from different study
Scenario: T41_When I click on Create Form from Existing and select a different study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "Form1"
	

Scenario: T42_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName3 | FormLabel3 | TableName3 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T43_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T44_When I have same domain items but codelists are different then include button for codelist should be disabled
	When I change the domain items in source and target as unique
	Then I can edit the codelist
	And I edit the codelist to unique in source and target
	And I click on verify button 
	When I edit again the domain item to be same in source and target
	And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T45_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable


Scenario: T46_When user tries to upgrade the study and open the study then upgraded study should be successfully opened
      When I click on the Home Button
	  And I select the Study "Study1" from Home page
	  And I click on the Settings drop Icon
	  And I click on Target App and change the study to latest
	  And I click on the Save button in Study Properties page
	  And I click on the "Home" tab
	  And I click on the Link "Study2"
	  Then I should see the "Study" page

Scenario: T47_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

# Create form from Existing from same study
Scenario: T48_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study2"
	And I click on the Link "FormName8"

Scenario: T49_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName2 | FormLabel2 | TableName2 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.
	 

Scenario: T50_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T51_When I have same domain items but codelists are different then include button for codelist should be disabled
When I change the domain items in source and target as unique
Then I can edit the codelist
And I edit the codelist to unique in source and target
And I click on verify button 
When I edit again the domain item to be same in source and target
And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T52_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable


Scenario: T53_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

# Create form from Existing from a different study
Scenario: T54_When I click on Create Form from Existing and select a different study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "FormName1"
	

Scenario: T55_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName  | FormLabel  | TableName  |
		| FormName15 | FormLabel15 | TableName15 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T56_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T57_When I have same domain items but codelists are different then include button for codelist should be disabled
	When I change the domain items in source and target as unique
	Then I can edit the codelist
	And I edit the codelist to unique in source and target
	And I click on verify button 
	When I edit again the domain item to be same in source and target
	And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T58_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

# Go back to previous study and try to open that study(Study1)
Scenario: T59_When user tries to upgrade the study and open the study then upgraded study should be successfully opened
      When I click on the Home Button
	  And I select the Study "Study1" from Home page
	  And I click on the Settings drop Icon
	  And I click on Target App and change the study to latest
	  And I click on the Save button in Study Properties page
	  And I click on the "Home" tab
	  And I click on the Link "Study1"
	  Then I should see the "Study" page

Scenario: T60_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

# Create form from Existing from same study
Scenario: T61_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study1"
	And I click on the Link "FormName8"

Scenario: T62_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName6 | FormLabel6 | TableName6 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.
	 

Scenario: T63_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T64_When I have same domain items but codelists are different then include button for codelist should be disabled
When I change the domain items in source and target as unique
Then I can edit the codelist
And I edit the codelist to unique in source and target
And I click on verify button 
When I edit again the domain item to be same in source and target
And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T65_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable


Scenario: T66_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

# Create form from Existing from different study
Scenario: T67_When I click on Create Form from Existing and select a different study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "FormName1"
	

Scenario: T68_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName  | FormLabel  | TableName  |
		| FormName5 | FormLabel5 | TableName5 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T69_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T70_When I have same domain items but codelists are different then include button for codelist should be disabled
	When I change the domain items in source and target as unique
	Then I can edit the codelist
	And I edit the codelist to unique in source and target
	And I click on verify button 
	When I edit again the domain item to be same in source and target
	And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T71_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

#Now go back to first imported study and complete the remaining validation
Scenario:  T72_When User clicks on Home tab in the header then home tab should be displayed
 When I click on the "Home" tab
	Then I should see the "Home" page	

Scenario: T73_When user adds the study and open then the study page should be displayed
	When I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName      |
	| Import_Study1  |
	Then I should see the "Import_Study1" page

Scenario: T74_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page
# Create form from Existing from different study
Scenario: T75_When I click on Create Form from Existing and select a different study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study2"
	And I click on the Link "FormName8"
	

Scenario: T76_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel  | TableName   |
		| FormName16 | FormLabel6 | TableName16 |
	And I click on verify Button
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T77_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T78_When I have same domain items but codelists are different then include button for codelist should be disabled
When I change the domain items in source and target as unique
Then I can edit the codelist
And I edit the codelist to unique in source and target
And I click on verify button 
When I edit again the domain item to be same in source and target
And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T79_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

#User tries to update the study to higher version
Scenario: T80_When user tries to upgrade the study and open the study then upgraded study should be successfully opened
      When I click on the Home Button
	  And I select the Study "Import_Study1" from Home page
	  And I click on the Settings drop Icon
	  And I click on Target App and change the study to latest
	  And I click on the Save button in Study Properties page
	  And I click on the "Home" tab
	  And I click on the Link "Import_Study1"
	  Then I should see the "Study" page

Scenario: T81_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

# Create form from Existing from the same study
Scenario: T82_When I click on Create Form from Existing and select a same study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Import_Study1"
	And I click on the Link "Form1"

Scenario: T83_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName17 | FormLabe17 | TableName17 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T84_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T85_When I have same domain items but codelists are different then include button for codelist should be disabled
When I change the domain items in source and target as unique
Then I can edit the codelist
And I edit the codelist to unique in source and target
And I click on verify button 
When I edit again the domain item to be same in source and target
And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T86_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

# Create form from Existing from different study
Scenario: T87_When I click on Create Form from Existing and select a different study then verify button should be displayed
	When I click on the Link "Create Form from Existing"	
	And I select the pop up having title "Create Form from Existing" and partial message "Please select a Study"
	And I click on the Link "Study2"
	And I click on the Link "FormName8"
	
Scenario: T88_When the user clicks on Forms tab then Forms page should be displayed
	When I click on the "Forms" tab
	Then I should see the "Forms" page	

Scenario: T89_When I give the unique name for the form,form label and table name and click verify button and validate the background colours for codelist
	When : I enter the form name, form label and table name with following details
		| FormName   | FormLabel   | TableName   |
		| FormName16 | FormLabel6 | TableName16 |
	And I click on verify Button		
	Then I should see orange background in target codelist when duplicate items in codelists as source and target are same.


Scenario: T90_When I ensure codelists and items are different in source and target then codelist include checkbox should be enabled
    When I change the items in target so that source and target are different but already present in the target
    And I change the codelist in target so that source and target are different	 
	Then I should see the include checkBox is in enabled state

Scenario: T91_When I have same domain items but codelists are different then include button for codelist should be disabled
When I change the domain items in source and target as unique
Then I can edit the codelist
And I edit the codelist to unique in source and target
And I click on verify button 
When I edit again the domain item to be same in source and target
And I click  on verify button 
Then I see the codelist include checkbox is disabled

Scenario: T92_When I ensure items are different in source and target then codelist fields are editable
	 When I see the items in source and target are different 
	 Then I should see the codelist fields are editable

Scenario: T93_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies
	When I click on the Cancel button on the popup page		
	And I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName     |
	| Import_Study1 |
	| Study1        |
	| Study3        |
Then I should not see these studies in the Home page
	| StudyName     |
	| Import_Study1 |
	| Study1        |
	| Study3        |