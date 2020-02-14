Feature: DataLabs_V5.8.0_Designer Lab Items
	Test Summary:
	1. Study Verification Rules for Codelist Groupd and Linkages
	2. Study Verification Rules for Lab Mappings
	3. Study Verification Rules for Attribute Mappings (Codelist Mappings)
	4. Study Verification Rules for Lab Dictionary mappings

@ObjectiveEvidence @ReqID:US63129.1
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US63129.2
Scenario: T02_Lab Dictionary Import file validation
	When I click on the Link "Manage Labs"
	And I Click "Add Lab Dictionary"
	And enter LabDictionaryName as "LabDict1" 
	And enter LabDictionaryDesc as "LabDictDesc1"
	And I click on the Lab Dict Save button
	And I click on the Link "LabDict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict"
	And I upload a labDict file "Dictionary_Error_1.xlsx"
	Then I should see error message "import lab dictionary errors"

@ObjectiveEvidence @ReqID:US63129.3
Scenario: T03_Lab Dictionary Import file validation
	When I click on the error link
	Then I should see the pop up with the below values
	| WorkSheet          | Row | Column        | Error                        |
	| Conversion Factors | 7   | To Unit       | Invalid Unit Name exists     |
	| Conversion Factors | 11  | Lab Test Name | Invalid Lab Test Name exists |
	| Lab Tests          | 2   | Standard Unit | Invalid Unit Name exists     |

@ObjectiveEvidence @ReqID:US63129.4
Scenario: T04_Add New Lab Dictionary
	When I click on the Home Button
	And I click on the Link "Manage Labs"
	And Click on the LabDict "LabDict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict1"
	And I upload a labDict file "DataLabsEDC_LabDictionary_GS1.xlsx"
	Then I should see below lab tests in the table
	| LabTestName |
	| MRRTEST10   |

@ObjectiveEvidence @ReqID:US63129.5
Scenario: T05_Lab Dictionary Import file validation
	When I click on the Home Button
	And I click on the Link "Manage Labs"
	And Click on the LabDict "LabDict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict1"
	And I upload a labDict file "Dictionary_Error_1.xlsx"
	Then I should see error message "import lab dictionary errors"

@ObjectiveEvidence @ReqID:US63129.6
Scenario: T06_Lab Dictionary Import file validation
	When I click on the error link
	Then I should see the pop up with the below values
	| WorkSheet          | Row | Column        | Error                        |
	| Conversion Factors | 7   | To Unit       | Invalid Unit Name exists     |
	| Conversion Factors | 11  | Lab Test Name | Invalid Lab Test Name exists |
	| Lab Tests          | 2   | Standard Unit | Invalid Unit Name exists     |

@ObjectiveEvidence @ReqID:US63129.7
Scenario: T07_Remove Race field in Lab Mappings
	When I click on the Home Button
	When I click on the Link "Create_Scr_Stdy"
	And I click on the Labs Button
	Then verify the display of below fields in Attribute Mapping
	| FieldName |
	| Race      |

@ObjectiveEvidence @ReqID:US63129.8
Scenario: T08_Verify the database for Race field
    When I Execute the query for field verification "select * from LabParameterField"
	Then The "Race" field should not be found

@ObjectiveEvidence @ReqID:US63129.9
Scenario: T09_Remove Race field in Lab Mappings
	Given I have the XML file "Questions_20190430_Lab_MetaData.xml" available in the project folder.
	Then I verify that the "Race" field is not present in the study xml file

@ObjectiveEvidence @ReqID:US63129.10
Scenario: T10_Verify attributes TestName, TestDescription and IsValid in study XML file
	Given I have the XML file "Questions_20190430_Lab_MetaData.xml" available in the project folder.
	Then I verify the below in the study xml file
	| AttributeName   | 
	| TestName        | 
	| TestDescription | 
	| IsValid         | 
	| UnitName        | 
	| UnitDescription | 
	| IsValid         | 
	#Then I verify the below in the study xml file
	#| AttributeName   | AttributeValue |
	#| TestName        | MRRTEST1       |
	#| TestDescription | Test1          |
	#| IsValid         | false          |
	#| UnitName        | 1Unit          |
	#| UnitDescription | Unit1desc      |
	#| IsValid         | false          |

@ObjectiveEvidence @ReqID:US63129.11
Scenario: T11_Remove SAS Label in Lab Mappings
	When I click on the Home Button
	And I click on the Link "Create_Scr_Stdy"
	And I click on the Labs Button
	And I click on the tab Lab Mapping
	Then verify the display of below fields in lab Mapping
	| FieldName |
	| SAS Label |

@ObjectiveEvidence @ReqID:US63129.12
Scenario: T12_Remove SAS Label in Lab Mappings
	Given I have the XML file "Questions_20190430_Lab_MetaData.xml" available in the project folder.
	Then I verify that the "SAS Label" field is not present in the study xml file

@ObjectiveEvidence @ReqID:US63129.13
Scenario: T13_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "study1_20190620_T18595558.zip" 
	And Enter the unique study name "Study1"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Study1)" in "Complete" state

@ObjectiveEvidence @ReqID:US63129.14
Scenario: T14_Verify the study after associating the lab dictionary
    When I click on the Home Button
	And I click on the Link "Study1"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict (LabDict) "
	And click on the save button 
	Then I see a error dialog with title "Error" and error message "Please provide mapping for at least one Lab Dictionary Test/Unit to save."

@ObjectiveEvidence @ReqID:US63129.15
Scenario: T15_Verify the study after associating the lab dictionary
	When I click ok button on the error dialog
	Then the pop up should close and Map Lab Dictionary page should be displayed
	
@ObjectiveEvidence @ReqID:US63129.16
Scenario: T16_Verify the study after associating the lab dictionary
    When I click on the Home Button
	And I click on the Link "Study1"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict (LabDict) "
	When Select the Code Value for LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And click on the save button 
	Then I see a error dialog with title "Error" and error message "Please provide mapping for at least one Lab Dictionary Test/Unit to save."

@ObjectiveEvidence @ReqID:US63129.17
Scenario: T17_Verify the study after associating the lab dictionary
	When I click ok button on the error dialog
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.18
Scenario: T18_Verify the study after associating the lab dictionary
 #   When I click on the Home Button
	#And I click on the Link "Study1"
	#And I click on the Labs Button
	#And I click on the Link "Map Lab Dictionary"
	#And Select the LabDict name "LabDict (LabDict) "
    When Select the Code Value for LabTest "Select"
	And I click on the tab "Lab Unit"
	And Select the Code Value for LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
	And click on the save button 
	Then I see a error dialog with title "Error" and error message "Please provide mapping for at least one Lab Dictionary Test/Unit to save."

@ObjectiveEvidence @ReqID:US63129.19
Scenario: T19_Verify the study after associating the lab dictionary
	When I click ok button on the error dialog
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.20
Scenario: T20_Verify the study after associating the lab dictionary
	When I click on the tab "Lab Test"
	When Select the Code Value for LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And Select the Code Value for second LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And I click on the tab "Lab Unit"
	And Select the Code Value for LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
	And Select the Code Value for Second LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
    And I click lab dict Save button
	Then I see a error dialog with title "Error" and error message "Duplicate mappings are not allowed on Lab Tests/Lab Units tab. Please update your mappings."

@ObjectiveEvidence @ReqID:US63129.21
Scenario: T21_Verify the study after associating the lab dictionary
	When I click ok button on the error dialog
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.22
Scenario: T22_Verify the study after associating the lab dictionary
	When I click on the tab "Lab Test"
	And Select the Code Value for LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And Select the Code Value for second LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And I click on the tab "Lab Unit"
	And Select the Code Value for LabUnit "Select"
	And Select the Code Value for Second LabUnit "Select"
	And I click lab dict Save button
	Then I see a error dialog with title "Error" and error message "Duplicate mappings are not allowed on Lab Tests tab. Please update your mappings."

@ObjectiveEvidence @ReqID:US63129.23
Scenario: T23_Verify the study after associating the lab dictionary
	When I click ok button on the error dialog
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.24
Scenario: T24_Verify the study after associating the lab dictionary
	When I click on the tab "Lab Test"
    When Select the Code Value for LabTest "Select"
	And Select the Code Value for second LabTest "Select"
	And I click on the tab "Lab Unit"
	And Select the Code Value for LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
	And Select the Code Value for Second LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
	And I click lab dict Save button
	Then I see a error dialog with title "Error" and error message "Duplicate mappings are not allowed on Lab Units tab. Please update your mappings."

@ObjectiveEvidence @ReqID:US63129.25
Scenario: T25_Verify the study after associating the lab dictionary
	When I click ok button on the error dialog
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.26
Scenario: T26_Verify the study after associating the lab dictionary
	When I click on the Link "Study1"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict (LabDict) "
    #And I click on the tab "Lab Test"
	And Select the Code Value for LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And select the check box display in RR table for first lab test
	And Select the Code Value for second LabTest "LabTests-CRF Lab Test -2 (CRF Lab Test -2)"
	And select the check box display in RR table for third lab test
    And I click on the tab "Lab Unit"
	And Select the Code Value for LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
	And Select the Code Value for Second LabUnit "LabUnits-CRF Lab Unit - 2 (CRF Lab Unit - 2)"
	And I click lab dict Save button
	Then I see a warning dialog with title "Warning" and warning message "One or more Lab Dictionary Tests have Display in Reference Range as "Yes" but not mapped to any Code Value (Code Description)."

@ObjectiveEvidence @ReqID:US63129.27
Scenario: T27_Verify the study after associating the lab dictionary
	When I click Continue button on the warning dialog
	Then I should see the notification "Saved successfully" 

@ObjectiveEvidence @ReqID:US63129.28
Scenario: T28_Verify the study after associating the lab dictionary
	When I click on the Link "Edit Selected"
	Then I see Edit Selected error popup with title "Error" and error message "Please select at least one item to edit."

@ObjectiveEvidence @ReqID:US63129.29
Scenario: T29_Verify the study after associating the lab dictionary
	When I click ok button on the Edit Selected error popup
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.30
Scenario: T30_Verify the study after associating the lab dictionary
    When I click on the tab "Lab Test"
	And select all lab test check box
	And I click on the Link "Edit Selected"
	And Select the Code Value for LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And Select the Code Value for second LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And click on the update save button
	Then I see duplicate mapping error dialog with title "Error" and error message "Duplicate mappings are not allowed. Please update your mappings."

@ObjectiveEvidence @ReqID:US63129.31
Scenario: T31_Verify the study after associating the lab dictionary
	When I click ok button on the duplicate mapping error popup
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.32
Scenario: T32_Verify the study after associating the lab dictionary
    When I click on the tab "Lab Unit"
	And select all lab unit check box
	And I click on the Link "Edit Selected"
	And Select the Code Value for LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
	And Select the Code Value for Second LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
	And click on the update unit save button
	Then I see duplicate mapping error dialog with title "Error" and error message "Duplicate mappings are not allowed. Please update your mappings."

@ObjectiveEvidence @ReqID:US63129.33
Scenario: T33_Verify the study after associating the lab dictionary
	When I click ok button on the duplicate mapping error popup
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.34
Scenario: T34_Verify the study after associating the lab dictionary
    When I click on the tab "Lab Test"
	And select all lab test check box
	And I click on the Link "Edit Selected"
	And Select the Code Value for LabTest "Select"
	And Select the Code Value for second LabTest "Select"
	And click on the update save button
	Then I see no mapping error dialog with title "Error" and error message "Please provide mapping for at least one Lab Dictionary Test to update."

@ObjectiveEvidence @ReqID:US63129.135
Scenario: T35_Verify the study after associating the lab dictionary
	When I click ok button on the no mapping error popup
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.36
Scenario: T36_Verify the study after associating the lab dictionary
    When I click on the tab "Lab Unit"
	And select all lab unit check box
	And I click on the Link "Edit Selected"
	And Select the Code Value for LabUnit "Select"
	And Select the Code Value for Second LabUnit "Select"
	And click on the update unit save button
	Then I see no mapping error dialog with title "Error" and error message "Please provide mapping for at least one Lab Dictionary Unit to update."

@ObjectiveEvidence @ReqID:US63129.37
Scenario: T37_Verify the study after associating the lab dictionary
	When I click ok button on the no mapping error popup
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.38
Scenario: T38_Verify the study after associating the lab dictionary
    When I click on the tab "Lab Test"
	And click the edit icon of the lab test "MRRTEST11(Test11)"
	And select the check box display in RR table for any lab test
	And click on single record save button
	Then I see lab test mapping update error dialog with title "Warning" and error message "Lab Dictionary Test has Display in Reference Range as "Yes" but not mapped to any Code Value (Code Description)."

@ObjectiveEvidence @ReqID:US63129.39
Scenario: T39_Verify the study after associating the lab dictionary
	When I click update Continue button on the lab test mapping error dialog
	Then I should see the notification "Update has been successful" 

@ObjectiveEvidence @ReqID:US63129.40
Scenario: T40_Verify the study after associating the lab dictionary
	When select all lab test check box
	And I click on the Link "Edit Selected"
	When Select the Code Value for LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
	And Select the Code Value for second LabTest "LabTests-CRF Lab Test -2 (CRF Lab Test -2)"
	And click on the update save button
	Then I see lab test mapping update error dialog with title "Warning" and error message "One or more Lab Dictionary Tests have Display in Reference Range as "Yes" but not mapped to any Code Value (Code Description)."

@ObjectiveEvidence @ReqID:US63129.41
Scenario: T41_Verify the study after associating the lab dictionary
	When I click update Continue button on the lab test mapping error dialog
	Then I should see the notification "Update has been successful for selected row(s)" 

@ObjectiveEvidence @ReqID:US63129.42
Scenario: T42_Verify the study after associating the lab dictionary
	When I click on the Link "Study1"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict1 (LabDictDesc1) "
	Then I see change map lab dict error dialog with title "Confirm" and error message "Changing Lab Dictionary will remove existing mappings."

@ObjectiveEvidence @ReqID:US63129.43
Scenario: T43_Verify the study after associating the lab dictionary
	When I click ok button on the change map lab dict error dialog
	Then the pop up should close and Map Lab Dictionary page should be displayed

@ObjectiveEvidence @ReqID:US63129.44
Scenario: T44_Verify the study after associating the lab dictionary
    When I click on the Home Button
	And click on the study link "Study1" of target app latest version
	Then I should see the Link "Lab Mappings Specification (LMS)"

@ObjectiveEvidence @ReqID:US63129.45
Scenario: T45_Verify the study after associating the lab dictionary
    When I click on the Home Button
	And I click on the Link "test01new"
	And I click on the Link "Lab Mappings Specification (LMS)"
	And I see LMS error dialog with title "Lab Mappings Specification" and message "The Lab Mappings Specification has been requested."
	And I click Continue button on the LMS error dialog
	And I should see the status of the study "Generate LMS (test01new)" in "Complete" state
	And I click on the Link "Generate LMS (test01new)"
	Then I Study file should be downloaded and the status of the study "Generate LMS (test01new)" in "Complete" state

@ObjectiveEvidence @ReqID:US63129.46
Scenario: T46_When we create a study from existing study where the previous Labs option is Set to Yes then the study should be created with Labs Option Set to Yes
    #When I click on the Home Button
	When I click on the Link "Create Study from Existing"	
	And I select the create study from existing dialog having title "Create Study from Existing"
	And I click on the study Link "test01new"
	And Enter the unique study name "StudyLowTargetA"
	And I select value "DataLabs 5.6x or 5.7x" from the "Target App:" drop down of Study page
    And I see target app error dialog with title "Target App" and error message "Are you sure you want to change the Target App?"
	And click on Continue button on the target app error dialog
	And I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Create Study (StudyLowTargetA)" in "Complete" state
	And I click breadcrumb item "Study"
	Then I should not see the Link "Lab Mappings Specification (LMS)"

@ObjectiveEvidence @ReqID:US63129.47
Scenario: T47_When I click on Create New Study with Target APP as DataLabs 5.8x or greater then Labs setting option should be displayed as default by No in Other section and it should be disabled
    When I click on the Home Button
	When I click on the Link "Create New Study"	
	And I enter study data details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp             | SafetyMapping |
	| Study4    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x | Not Enabled   |	
	And I should see the notification "Study has been successfully added"
	Then I should not see the Link "Lab Mappings Specification (LMS)"

#@ObjectiveEvidence @ReqID:US63129.1
#Scenario: T48_Compare Study for same study
#	When I click on the Link "Compare Study"
#	And I click on Compare within the same study radio button
#	And click on Next button
#	And select the study
#	And click on Next button
#	And select the study different versions as SourceStudy "" and TargetStudy ""
#	And click on Compare button
#	Then I should see the Compare Study page
#
#@ObjectiveEvidence @ReqID:US63129.1
#Scenario: T49_Compare Study Report for same study
#	When I click on the Link "Lab Dictionary Mapping"
#	And click on the "Lab Dictionary Mapping" image to expand
#	Then I see the dictionary mapping of two versions of a study with added and deleted colors
#
Scenario: T50_Compare Study for two different studies
	When I click on the Link "Compare Study"
	And I click on Compare two different studies radio button
	And click on study Next button
	And select the SourceStudy as "test01"
	And select the TargetStudy as "test02"
	And click on study version Next button
	And select the version of SourceStudy "test01 (Current Study)" 
	And select the version of TargetStudy "test02 (Current Study)"
	And click on Compare button
	Then I should see the Compare Study page and breadcrumb in order
	| BreadCrumb    |
	| Home          |
	| Compare Study |
	
Scenario: T51_Compare Codelist Mappings in Attribute Mappings for two different studies
	When I click on the Link "Attribute Mappings"
	And Navigate to Codelist Mappings in Attribute Mappings
	#Then I see the changes in Attribute mappings of source and target study
	Then And I see the changes in Attribute mappings of source and target study as below
	| SourceItem    | SourceStudy   | TargetStudy   |
	| Female        | Female        | Not Specified |
	| Male          | Male          |               |
	| Not Specified | Not Specified | Male          |

########3make sure that study is not duplicated and check sponsorname
@US65323
Scenario: T52_Lab Mapping Specification link should be visible at left side in "Configure File Name" page
	 When I click on the Home Button
	 When I click on the Link "Create New Study"	
	 And I enter study data details 
		| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp             | SafetyMapping |
		| Study5    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x | Not Enabled   |	
	 When I click on the Link "Study5"
	 When I click on the Link "Configure File Name"
	 Then I should not see the Link "Lab Mappings Specification (LMS)"
@US65323
 Scenario: T53_Default name for Lab Mapping specification should "LMS.xlsm"
    Given I logged in to Designer with download prompt false
	When I click on the Home Button
	When I click on the Link "Study5"
	And I click on the Link "Lab Mappings Specification (LMS)"
	And click on "Continue"
	And I click on the Link "Generate LMS (Study5)"
	Then I Study file should be downloaded and the status of the study "Generate LMS (Study5)" in "Complete" state
	And I should see the file name as "LMS.xlsm"

@US65323
Scenario:T54_Configuring the file name for Lab Mapping Specification 
	When I click on the Home Button
	And I click on the Link "BaseStudy"
	And I click on the Link "Configure File Name"
	And I select value "Study Name" from the "Document name  selection listbox1" drop down of Study page       
	And I click on the Save button 	
	Then saving  should see notification"Configure file name has been successfully updated"

@US65323
Scenario:T55_Configured file name should be assigned to Lab Mapping Specification file 
	Given I logged in to Designer with download prompt false
	When I click on the Home Button
	When I click on the Link "BaseStudy"
	And I click on the Link "Lab Mappings Specification (LMS)"
	And click on "Continue"
	And I click on the Link "Generate LMS (Study5)"
	Then I Study file should be downloaded and the status of the study "Generate LMS (Study5)" in "Complete" state
	And I should see the file name as "Study5.xlsm"
@US66088
Scenario: T56_Display of Lab Attribute in study compare report
	When I click on the Home Button
	And I click on the Link "Compare Study"
	And I click on Compare two different studies radio button
	And click on study Next button
	And select the SourceStudy as "test01"
	And select the TargetStudy as "test02"
	And click on study version Next button
	And select the version of SourceStudy "test01 (Current Study)" 
	And select the version of TargetStudy "test02 (Current Study)"
	And click on Compare button
	Then I should see the Compare Study page and breadcrumb in order
	| BreadCrumb    |
	| Home          |
	| Compare Study |
	And I should see labs attribute in the study compare report

############################# V 
#Scenario: T58_When I Login to Designer then I see the Designer home page
#	Given I logged in to Designer
#	Then I see Designer Home Page
@US68896
Scenario: T58_Lab Dictionary Import file validation
	When I click on the Link "Manage Labs"
	And I Click "Add Lab Dictionary"
	And enter LabDictionaryName as "LabDict1" 
	And enter LabDictionaryDesc as "LabDictDesc1"
	And I click on the Lab Dict Save button
	And I click on the Link "LabDict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict"
	And I upload a labDict file "Dictionary_Error_1.xlsx"
	Then I should see error message "import lab dictionary errors"
@US68896
Scenario: T59_Lab Dictionary Import file validation
	When I click on the Link "Manage Labs"
	And I Click "Add Lab Dictionary"
	And enter LabDictionaryName as "LabDict2" 
	And enter LabDictionaryDesc as "LabDictDesc2"
	And I click on the Lab Dict Save button
	And I click on the Link "LabDict2"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict"
	And I upload a labDict file "DataLabsEDC_LabDictionary_LabDictionary_PS1_Phani..xlsx"
	Then I should see error message "import lab dictionary errors"
	@US68896
Scenario: T60_Lab Dictionary Import file validation
	When I click on the Link "Manage Labs"
	And I Click "Add Lab Dictionary"
	And enter LabDictionaryName as "LabDict3" 
	And enter LabDictionaryDesc as "LabDictDesc3"
	And I click on the Lab Dict Save button
@US68896
Scenario:T61_Verify the display of Save button disabled
	#Given I logged in to Designer
	When I click on the Link "Home"
	And I click on the Link "stdy"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	Then i should see "Save" button disabeld

	#########################
@US68896
Scenario:T62_Verify the display of Save button disabled when valid with no data
	#Given I logged in to Designer
	When I click on the Link "Home"
	And I click on the Link "stdy"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict1 (LabDictDesc1) "
	Then i should see "Save" button disabeld
@US68896
Scenario:T63_Verify the display of Save button disabled when valid with no data
	#Given I logged in to Designer
	When I click on the Link "Home"
	And I click on the Link "stdy"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict2 (LabDictDesc1) "
	Then i should see "Save" button enabled
@US68896
Scenario:T64_Verify the display of Save button disabled when valid with no data
	#Given I logged in to Designer
	When I click on the Link "Home"
	And I click on the Link "stdy"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict3 (LabDictDesc1) "
	Then i should see "Save" button disabeld

#############################@US68902###################

#note:Import valid Labdictionary and the invalid dictionary
#Execute 1 and the below 3 to complete this story execution
#And enter LabDictionaryName as "LabDict231112111"  labdic name should be unique
#########################################################3

Scenario:T65_upload a valid labdictionary
	When I click on the Link "Manage Labs"
	And I Click "Add Lab Dictionary"
	And enter LabDictionaryName as "LabDict2311" 
	And enter LabDictionaryDesc as "LabDictDesc2"
	And I click on the Lab Dict Save button
	And I click on the Link "LabDict2311"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict"
	And I upload a labDict file "DataLabsEDC_LabDictionary_LabDictionary_PS1_Phani"
	Then I should not see Modal Popup on the screen

Scenario:T66_upload a invalid labdictionary
	When I click on the Link "Manage Labs"
	And I click on the Link "LabDict2311"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict"
	And I upload a labDict file "Copy of Dictionary_Error_11"
	Then I should not see Modal Popup on the screen   
@US68902
Scenario:T67_verify the display of error message when lab dictionary is failed after successfull lab dictionary imported
	When I click on the Link "Manage Labs"
	And I click on the Link "LabDict2311"
	Then I should see the error messages "The imported lab dictionary has encountered 2 errors. Please rectify.","The data displayed belongs to the latest successfully imported lab dictionary."


