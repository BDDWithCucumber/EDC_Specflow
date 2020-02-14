Feature: Designer_Lab_Items_Conversation_Factor
	Test Summary:
	1. When the ConversationFactor is Zero while importing the Lab Dictionary
	 System should throw error.

@ObjectiveEvidence @ReqID:US65600.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US65600.2
Scenario: T02_Lab Dictionary Import file validation
	When I click on the Link "Manage Labs"
	And I Click "Add Lab Dictionary"
	And enter LabDictionaryName as "LabDict1" 
	And enter LabDictionaryDesc as "LabDictDesc1"
	And I click on the Lab Dict Save button
	And I click on the Link "LabDict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict"
	And I upload a labDict file "DataLabsEDC_LabDictionary_LabDictionary_PS1_V12.xlsx"
	Then I should see error message "import lab dictionary errors"

@ObjectiveEvidence @ReqID:US65600.3
Scenario: T03_Lab Dictionary Import file validation
	When I click on the error link
	Then I should get the below mentioned rows in the table
	| WorkSheet          | Row | Column                              | Error                            |
	| Conversion Factors | 7   | Conversion Factor                   | Conversion factor cannot be zero |
	| Conversion Factors | 8   | Conversion Factor                   | Conversion factor cannot be zero |
	| Conversion Factors | 11  | To Unit                             | Missing required fields          |
	| Conversion Factors | 12  | Conversion Factor                   | Missing required fields          |
	| Lab Tests          | 13  | Lab Test Description, Lab Test Code | Missing required fields          |	

@ObjectiveEvidence @ReqID:US65600.4
Scenario: T04_Lab Dictionary Import file validation
	When I select the Error Type "Conversion factor cannot be zero" from the drop down "Error Type: " for filtering
	And I click on the filter option
	Then I should get the below mentioned rows in the table
	| WorkSheet          | Row | Column                              | Error                            |
	| Conversion Factors | 7   | Conversion Factor                   | Conversion factor cannot be zero |
	| Conversion Factors | 8   | Conversion Factor                   | Conversion factor cannot be zero |

@ObjectiveEvidence @ReqID:US65600.5
Scenario: T05_Lab Dictionary Import file validation
	When I Unselect the Error Type "Conversion factor cannot be zero" from the drop down "Error Type: " for filtering
	And I click on the filter option
	Then I should get the below mentioned rows in the table
	| WorkSheet          | Row | Column                              | Error                            |
	| Conversion Factors | 7   | Conversion Factor                   | Conversion factor cannot be zero |
	| Conversion Factors | 8   | Conversion Factor                   | Conversion factor cannot be zero |
	| Conversion Factors | 11  | To Unit                             | Missing required fields          |
	| Conversion Factors | 12  | Conversion Factor                   | Missing required fields          |
	| Lab Tests          | 13  | Lab Test Description, Lab Test Code | Missing required fields          |	

@ObjectiveEvidence @ReqID:US65600.6
Scenario: T06_Add New Lab Dictionary
	When I click on the Home Button
	And I click on the Link "Manage Labs"
	And Click on the LabDict "LabDict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict1"
	And I upload a labDict file "DataLabsEDC_LabDictionary_LabDictionary_PS1_V7.xlsx"
	Then I should see below lab tests in the table
	| LabTestName |
	| 01          |
@ObjectiveEvidence @ReqID:US66097.1
#Conversion Factor shall not be less than or equal to zero (It can be decimal)
#Precision shall always be a whole number (>= 0) i.e.. Precision shall not be less than zero
Scenario: T07_Add New Lab Dictionary
	When I click on the Home Button
	And I click on the Link "Manage Labs"
	And Click on the LabDict "LabDict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict1"
	And I upload a labDict file "DataLabsEDC_LabDictionary_LabDictionary_PS1_V10.xlsx"
	Then I should see error message "import lab dictionary errors"

@ObjectiveEvidence @ReqID:US65600.3
Scenario: T08_Lab Dictionary Import file validation
	When I click on the error link
	Then I should get the below mentioned rows in the table
	| WorkSheet          | Row | Column            | Error                             |
	| Conversion Factors | 8   | Conversion Factor | Missing required fields           |
	| Conversion Factors | 9   | Conversion Factor | Conversion factor cannot be zero  |
	| Conversion Factors | 10  | Conversion Factor | Invalid data provided for a field |
	| Conversion Factors | 11  | Conversion Factor | Invalid data provided for a field |
	| Lab Tests          | 4   | Precision         | Invalid data provided for a field |
	| Lab Tests          | 5   | Precision         | Invalid data provided for a field |
	| Lab Tests          | 6   | Precision         | Invalid data provided for a field |
	| Lab Tests          | 7   | Precision         | Invalid data provided for a field |
	| Lab Tests          | 8   | Precision         | Invalid data provided for a field |
	| Lab Tests          | 9   | Precision         | Invalid data provided for a field |	

	
	

