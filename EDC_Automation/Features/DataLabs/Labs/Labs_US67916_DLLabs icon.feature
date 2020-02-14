Feature: DL_Labs icon
	I can view the attached lab icon is displayed for Labs tab.(Study Administration >> Lab Management)
	The icon shall be in it is in 16x16 png format.


Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: T02_Verify the Labs Icon next to Lab Management in Study Administration page
	When I select DataManagerPortal item "Study Administration" from drop down	
	Then A logo on left of Lab Management link is displayed.
	
