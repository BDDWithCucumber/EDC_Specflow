Feature: FormStatuAndStateOnStudyUpdate
Event out Form Status and State update on Study Update
	Event out item data on Study Update
	As a DataLabs Client,

		I want an ODM 1.3.2 XML to be pushed to endpoint configured in DataLabs when a item update occurs during Study Update,

    1. An ODM XML (attached to user story) format is generated and pushed to endpoint.
    2. I can view audit log is created for all the steps included in the eventing process.
    3. Messages should not be created when endpoint URL is not configured.
    4. Messages should be on hold when end point is down

@mytag
Scenario: Add two numbers
	Given I have entered 50 into the calculator
	And I have entered 70 into the calculator
	When I press add
	Then the result should be 120 on the screen
