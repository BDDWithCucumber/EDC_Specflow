Feature: DataLabs_V5.7.0_ODM Eventing for Metadata
Test Summary:
	Verification of Metadata xml for multiple study protocols.
	Study-2
	1) Verify by adding crf and assign to existing event
	2) Verify by adding New Domain
	3) Verify by adding and event and assign an exisiting crf
	4) Verify by updating Event Category
	5) Verify by updating Question prompt
	6) Verify by moving Flat question to Table Question
	7) Verify by adding Codelist items and assign codelist to Domain item
	Study-3:
	1) Form name update
	2) Event name update
	3) Event Order update
	4) Question order change
	5) Moving Table question to Flat Question 
	6) Domain Name change 
	7) Domain item Name change
	8) Data Type of Domain Item Changed 
	9) Code Value Change 
	10) Code Description change
	Study-4:
	1) Delete Codelist item  
	2) Codelist name change  
	3) New pScript created with pScript name and Description 
	4) valid pScript status changes to Inactive
	5) Updated pScript name and added description 
	6) Update script text 
	7) Update description for Function
	Study-5:
	1) Form Delete 
	2) Event Delete
	3) Domain delete 
	4) Update Code description for system codelist 
	5) Inactive the edit check 
	6) Activate the edit checks 
	7) Update editcheck description 
	8) Update editcheck Action request 
	9) Update Query Description 
	10) Update Derivation Description 
	Study-6:
	1) Change Query description
	2) Change Query Action Request
	3) Warn user disable 
	Study-7:
	1) Parameter Reference change for Query 
	2) Script update by making invalid derivation 
	3) Parameter Reference change for Derivation 
	4) Delete Question 
	5) Change the comparator in condtional question 
	6) Change the condition value for conditional question 
	7) Change the parent question item in conditional question 
 

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And  I upload a study "Test3210_Metadata_01.zip" with study label "Test3210_Metadata_01"
	Then I see study label "Test3210_Query Smoke Test" in header

Scenario: 04_Get Metadata from PatientAndOperationalDataEventing webservice
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData | ProtocolVersionData | ResponseFile            |
	| Test3210_Base | 1.0                 | TestMetaData1Actual.xml |
	Then The response should contain success status code as "200".

	@ReqID:3.1.6.7,3.1.6.8,3.1.6.9,3.1.6.10 @ObjectiveEvidence
Scenario: 05_Verify the metadata XML Data generated
	Given I have the XML file "TestMetaData1Expected.xml" available in the project folder.
	And I have the XML file "TestMetaData1Actual.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName | FieldName           |
	|         | FileOID             |
	|         | CreationDateTime    |
	|         | DerivedRunOrder     |
	|         | OrderNumber         |
	|         | QueryKey            |
	|         | SourceSystemVersion |

Scenario: 06_Study update with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Metadata_02.zip" with Label "Test3210_Metadata_02"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                      |
	| Study file (Test3210_Metadata_02) - complete. |
	
Scenario: 07_Get Metadata from PatientAndOperationalDataEventing webservice
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData | ProtocolVersionData | ResponseFile             |
	| Test3210_Base | 2.0                 | TestMetaData2Actual.xml  |
	Then The response should contain success status code as "200".

	@ReqID:3.1.6.7,3.1.6.8,3.1.6.9,3.1.6.10 @ObjectiveEvidence
Scenario: 08_Verify the metadata XML Data generated
	Given I have the XML file "TestMetaData2Expected.xml" available in the project folder.
	And I have the XML file "TestMetaData2Actual.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	 | TagName | FieldName           |
	 |         | FileOID             |
	 |         | CreationDateTime    |
	 |         | DerivedRunOrder     |
	 |         | OrderNumber         |
	 |         | QueryKey            |
	 |         | SourceSystemVersion |

Scenario: 09_Study update with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Metadata_03.zip" with Label "Test3210_Metadata_03"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                      |
	| Study file (Test3210_Metadata_03) - complete. |
	
Scenario: 10_Get Metadata from PatientAndOperationalDataEventing webservice
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData | ProtocolVersionData | ResponseFile             |
	| Test3210_Base | 3.0                 | TestMetaData3Actual.xml  |
	Then The response should contain success status code as "200".

	@ReqID:3.1.6.7,3.1.6.8,3.1.6.9,3.1.6.10 @ObjectiveEvidence
Scenario: 11_Verify the metadata XML Data generated
	Given I have the XML file "TestMetaData3Expected.xml" available in the project folder.
	And I have the XML file "TestMetaData3Actual.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName | FieldName           |
	|         | FileOID             |
	|         | CreationDateTime    |
	|         | DerivedRunOrder     |
	|         | OrderNumber         |
	|         | QueryKey            |
	|         | SourceSystemVersion |

Scenario: 12_Study update with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Metadata_04.zip" with Label "Test3210_Metadata_04"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                      |
	| Study file (Test3210_Metadata_04) - complete. |
	
Scenario: 13_Get Metadata from PatientAndOperationalDataEventing webservice
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData | ProtocolVersionData | ResponseFile             |
	| Test3210_Base | 4.0                 | TestMetaData4Actual.xml  |
	Then The response should contain success status code as "200".

	@ReqID:3.1.6.7,3.1.6.8,3.1.6.9,3.1.6.10 @ObjectiveEvidence
Scenario: 14_Verify the metadata XML Data generated
	Given I have the XML file "TestMetaData4Expected.xml" available in the project folder.
	And I have the XML file "TestMetaData4Actual.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName | FieldName           |
	|         | FileOID             |
	|         | CreationDateTime    |
	|         | DerivedRunOrder     |
	|         | OrderNumber         |
	|         | QueryKey            |
	|         | SourceSystemVersion |
Scenario: 15_Study update with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Metadata_05.zip" with Label "Test3210_Metadata_05"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                      |
	| Study file (Test3210_Metadata_05) - complete. |
	
Scenario: 16_Get Metadata from PatientAndOperationalDataEventing webservice
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData | ProtocolVersionData | ResponseFile             |
	| Test3210_Base | 5.0                 | TestMetaData5Actual.xml  |
	Then The response should contain success status code as "200".

	@ReqID:3.1.6.7,3.1.6.8,3.1.6.9,3.1.6.10 @ObjectiveEvidence
Scenario: 17_Verify the metadata XML Data generated
	Given I have the XML file "TestMetaData5Expected.xml" available in the project folder.
	And I have the XML file "TestMetaData5Actual.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName | FieldName           |
	|         | FileOID             |
	|         | CreationDateTime    |
	|         | DerivedRunOrder     |
	|         | OrderNumber         |
	|         | QueryKey            |
	|         | SourceSystemVersion |

Scenario: 18_Upload and Stage a Study which has Minor study changes
       When I select DataManagerPortal item "Study Administration" from drop down
       And I click Link "Study Management" In StudyAdministrationPage
       And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
       And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
       And I click browse button in upload study file page
       And I upload study "Test3210_Metadata_05.1.zip" with Label "Test3210_Metadata_05.1"
       And I open study which has "Uploaded" status
       And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
       And I open study which has "Staged" status
       And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
       And I clicked Continue button in PublishStudyFlagsPage
       And I click Publish button in PublishStudyPage of MinorStudyUpdate
       And I navigate to "Inbox" tab from main menu.
       Then I check subjects in inbox folder "Jobs"
        | Subject						                                |
        | Publishing of Study file (Test3210_Metadata_05.1) - complete. |

Scenario: 19_Get Metadata from PatientAndOperationalDataEventing webservice
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData | ProtocolVersionData | ResponseFile             |
	| Test3210_Base | 5.1                 | TestMetaData5_1Actual.xml  |
	Then The response should contain success status code as "200".

	@ReqID:3.1.6.7,3.1.6.8,3.1.6.9,3.1.6.10 @ObjectiveEvidence
Scenario: 20_Verify the metadata XML Data generated
	Given I have the XML file "TestMetaData5_1Expected.xml" available in the project folder.
	And I have the XML file "TestMetaData5_1Actual.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	| TagName | FieldName           |
	|         | FileOID             |
	|         | CreationDateTime    |
	|         | DerivedRunOrder     |
	|         | OrderNumber         |
	|         | QueryKey            |
	|         | SourceSystemVersion |

Scenario: 21_Study update with patients migration
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test3210_Metadata_06.zip" with Label "Test3210_Metadata_06"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select patient migration option "Migrate all patients" in PublishStudyPage
	And I click Publish button in PublishStudyPage
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                      |
	| Study file (Test3210_Metadata_06) - complete. |
	
Scenario: 22_Get Metadata from PatientAndOperationalDataEventing webservice
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData | ProtocolVersionData | ResponseFile             |
	| Test3210_Base | 6.0                 | TestMetaData6Actual.xml  |
	Then The response should contain success status code as "200".

	@ReqID:3.1.6.7,3.1.6.8,3.1.6.9,3.1.6.10 @ObjectiveEvidence
Scenario: 23_Verify the metadata XML Data generated
	Given I have the XML file "TestMetaData6Expected.xml" available in the project folder.
	And I have the XML file "TestMetaData6Actual.xml" available in the Result XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below fields.
	 | TagName | FieldName           |
	 |         | FileOID             |
	 |         | CreationDateTime    |
	 |         | DerivedRunOrder     |
	 |         | OrderNumber         |
	 |         | QueryKey            |
	 |         | SourceSystemVersion |