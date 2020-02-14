Feature: XMLScenarios
	This is a sample feature to test XML file tags, data and structure.

Scenario: 01_Verification of tags in an XML file
	Given I have the XML file "SampleAddPatientODM.xml" available in the project folder.
	Then I verify tags structure in "SampleAddPatientODM.xml" file as displayed in the table.
	| TagName            |
	| ODM                |
	| Study              |
	| GlobalVariables    |
	| StudyName          |
	| StudyDescription   |
	| ProtocolName       |
	| ClinicalData       |
	| SubjectData        |
	| AuditRecord        |
	| UserRef            |
	| LocationRef        |
	| DateTimeStamp      |
	| ReasonForChange    |
	| SourceID           |
	| SiteRef            |
	| Annotation         |
	| Comment            |
	| StudyEventData     |
	| FormData           |
	| ItemGroupData      |
	| ItemData           |
	| MeasurementUnitRef |
	| ItemData           |
	| MeasurementUnitRef |
	| ItemData           |
	| MeasurementUnitRef |
	| StudyEventData     |
	| FormData           |
	| FormData           |
	| FormData           |
	| FormData           |

Scenario: 02_Verification of tags in an XML file
	#Given I have opened the XML file "SampleAddPatientODM.xml" from Test XML files in project.
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify tags structure in the XML file as displayed in the table.
	| TagName            |
	| ODM                |
	| Study              |
	| GlobalVariables    |
	| StudyName          |
	| StudyDescription   |
	| ProtocolName       |
	| ClinicalData       |
	| SubjectData        |
	| AuditRecord        |
	| UserRef            |
	| LocationRef        |
	| DateTimeStamp      |
	| ReasonForChange    |
	| SourceID           |
	| SiteRef            |
	| Annotation         |
	| Comment            |
	| StudyEventData     |
	| FormData           |
	| ItemGroupData      |
	| ItemData           |
	| MeasurementUnitRef |
	| ItemData           |
	| MeasurementUnitRef |
	| ItemData           |
	| MeasurementUnitRef |
	| StudyEventData     |
	| FormData           |
	| FormData           |
	| FormData           |
	| FormData           |

Scenario: 03_Verify tags in test XML from standard input file
#	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Given I have the XML file "SampleAddPatientODM.xml" available in the project folder.
	And I have the XML file "SampleAddPatientODM.xml" available in the Test XML Files folder.
	Then I compare and verify the tags in source XML file from project and target xml file from test folder are same.

Scenario: 04_Verification of fields in a tag in a test xml file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for "ODM" tag in the XML file.
	| FieldName   |
	| Description |
	| FileType    |
	| ODMVersion  |
	| ID          |
	And I verify below fields are displayed for "StudyEventData" tag in the XML file.
	| FieldName     |
	| StudyEventOID |

Scenario: 05_Verification of fields in all tags of specific name in a test XML file
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below fields are displayed for all "ODM" tag in the XML file.
	| FieldName   |
	| Description |
	| FileType    |
	| ODMVersion  |
	| ID          |
	And I verify below fields are displayed for all "FormData" tag in the XML file.
	| FieldName       |
	| FormOID         |
	| FormRepeatKey   |
	| TransactionType |

Scenario: 06_Verification of data in fields of a tag in XML file.
	Given I have opened the XML file "SampleAddPatientODM.xml" located in test folder.
	Then I verify below data in the respective fields for "ODM" tag in the XML file.
	| FieldName   | DataValue    |
	| Description | Description1 |
	| FileOID     | FileOID1     |
	And I verify below data in the respective fields for "StudyEventData" tag in the XML file.
	| FieldName           | DataValue            |
	| StudyEventOID       | Week_1               |
	| StudyEventRepeatKey | StudyEventRepeatKey2 |
	| TransactionType     | Insert               |

Scenario: 07_Comparing data in two XML files
	Given I have the XML file "SampleAddPatientODM.xml" available in the project folder.
	And I have the XML file "SampleAddPatientODMTestFile.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same.

Scenario: 08_Comparing data in two XML files except few tags and fields
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData    | ProtocolVersionData | ResponseFile      |
	| Test3210_Pscript | 1.0                 | testMetaData2.xml |
	Given I have the XML file "testMetaDataExpected.xml" available in the project folder.
	And I have the XML file "testMetaData2.xml" available in the Test XML Files folder.
	Then I verify that the data in both metadata XML files is same except for below tags and fields.
	 | FieldName        |
	 | FileOID          |
	 | CreationDateTime |
	 | DerivedRunOrder  |
	 | OrderNumber      |
	 | QueryKey         |