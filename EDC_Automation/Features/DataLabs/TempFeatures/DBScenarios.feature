Feature: DBScenarios
	This feature has sample scenarios to test DB verifications

@mytag
Scenario: Get Site data from sites table
	Given I have connected to Database.
	When I execute the query "select * from MF_Site".
	Then The below result should be retrieved.
	| SiteID | SiteName |
	| 01     | Site     |
	| 02     | Site     |
	And I close the Database connection.

Scenario: 2 Get Site data from sites table
	#Given I have connected to Database.
	When I execute the query "select SiteID, SiteName from MF_Site".
	Then The below result should be retrieved.
	| SiteID | SiteName |
	| 01     | Site     |
	| 02     | Site     |
	And I have "2" records resulted on querying the DB.
	#And I close the Database connection.

Scenario: 3_Get XML Message from DB
	#Given I have connected to DB and execute the query "select SubjectKey from Patient where PatientStatus = (select statuskey from MF_Status where StatusName = 'Enrolled')".
	#Given I save the XML data into an XML file with name as "SampleData.xml".
	Given I save the Event XML data in "SampleData.xml" file by executing the query "select SubjectKey from Patient where PatientStatus = (select statuskey from MF_Status where StatusName = 'Enrolled')"

Scenario: Test_Verify the XML Data evented out for the Added Patient from Datalabs UI
	Given I save the Event XML data in "AddPatientFromUIActual.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and StatusKey = 311 order by OdmSubscriberDetailKey desc"
	And I have the XML file "AddPatientFromUIExpected.xml" available in the project folder.
	And I have the XML file "AddPatientFromUIActual.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName           |
	|         | CreationDateTime    |
	|         | DateTimeStamp       |
	|         | SubjectKey          |
	|         | FileOID             |
	|         | SourceSystemVersion |

Scenario: Test02_Save the record from db into the file name using the record count
	Then I save the file with name prefix "LabsUpdateReferencerange" by executing the Query.