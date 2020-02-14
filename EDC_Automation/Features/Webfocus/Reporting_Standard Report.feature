Feature: Reporting_DatalabsStandardReport_OutstandingSDVDisplay
		This feature is to verify the display of outstanding SDV form fields

@ObjectiveEvidence
Scenario: T01_Login to WebFocus portal
	When I logged in to WebFocus
	Then I see WebFocus HomePage

@ObjectiveEvidence
Scenario: T02_Select the Study and Select Outstanding SDV
	When I select "Domains" item from main menu
	And I select the Study "ASZ817_UAT_AZ232703" from Domains main page
	And I select "Standard Reports" from Study Page
	And I select "DataLabs Standard Reports" from Standard Report Page
	And I select "CRFs" from DataLabs Standard Reports page
	And I select "OUTSTANDING SDV" from CRFs Page
	Then I see the Main panel Titled "Outstanding SDV (by Site)"
	And I see the "Filters:" subtitle has the link "Reset Filters" flushed right
	And I see all menu filters default selected as "ALL"
	And I see Country menu displayed below items
	| Country:       |
	| ALL            |
	| < No Country > |
	| BULGARIA       |
	| GERMANY        |
	| HUNGARY        |
	| JAPAN          |
	| POLAND         |
	| SOUTH AFRICA   |
	| UKRAINE        |
	| UNITED STATES  |

	And I see Site menu displayed below items
	|Site:			 |
	| ALL            |
	And I see Minutes per CRF: label displayed "4" 
	And I see Include Investigator Radio button selected Yes
	And I see the Select Format sub-title with the below options
	| SelectaFormat:   |
	| HTML             |
	| Excel            | 
	And I see View button flushed right

@ignore
Scenario: T03_Excel Report Format display
	When I select Include Investigator as "No"
	And I select Format as "Excel"
	And I select View button
	And I Open the Excel downloaded
	Then I see an excel report is produced titled as "Outstanding SDV (by Site)"
	And  I see the grid with rows of data in the columns named below
	| GridNames:                                   |
	| Country                                      |
	| City                                         |
	| Site Name – [Does not includes investigator] |
	| Site                                         |
	| Need SDV-All CRFs                            |
	| Need SDV-Completed CRFs                      |
	| Need SDV- Required Items                     |
	| Est. Total Onsite Workload (hrs)             |
	| A summary row                                |
	And I see a note displyed below
	| Note:                                                                                                                                                                                                                                                                      |
	| [Need SDV- All CRFs]- includes Incomplete and Submitted CRFs with required SDV [Need SDV- Completed CRFs]- only includes Submitted CRFs with required SDV Report excludes Mark Not Collected CRFs Workload is based on Completed CRFs and includes 1.5 hours routine time. |
	And I see the footer displayed
	| Footer:                                              |
	| Copyright © 2011 DataLabs, Inc. All rights reserved  |
	| Report Run                                           |
	| Data Last Update                                     |
	And I close the excel


Scenario: T04_HTML Report format display
	When I enter Minuter per CRF as "1"
	And I select format as "HTML"
	And I select the View button
	Then I see HTML report is produced with title "Outstanding SDV (by Site)"
	And I see the grid with rows of data in the columns named below
	| GridNames:                                   |
	| Country                                      |
	| City                                         |
	| Site Name – [Does not includes investigator] |
	| Site                                         |
	| Need SDV-All CRFs                            |
	| Need SDV-Completed CRFs                      |
	| Need SDV- Required Items                     |
	| Est. Total Onsite Workload (hrs)             |
	And I see a note displyed below
	| Note:                                                                                                                                                                                                                                                                      |
	| [Need SDV- All CRFs]- includes Incomplete and Submitted CRFs with required SDV [Need SDV- Completed CRFs]- only includes Submitted CRFs with required SDV Report excludes Mark Not Collected CRFs Workload is based on Completed CRFs and includes 1.5 hours routine time. |
	And I see the footer displayed
	| Footer:                                             |
	| Copyright © 2011 DataLabs, Inc. All rights reserved |
	| Run Date:                                           |
	| Data Last Updated:                                  |

Scenario: T05_Reset filter 
	When I select country as "Argentina"
	And I select site as "4444-Psite"
	And I select link Reset Filters
	Then I see "Country" list displayed "All"
	And I see "Site" list displayed "All"
	And I see Minutes per CRF: label displayed "4" 

Scenario: T06_Post Reset Filter criteria check
	When I select country as "Argentina"
	And I select site as "4444-Psite"
	And I select the View button
	Then I see HTML report is produced with title "Outstanding SDV (by Site)"
	And I see the grid with rows of data in the columns named below
	| GridNames:                                   |
	| Country                                      |
	| City                                         |
	| Site Name – [Does not includes investigator] |
	| Site                                         |
	| Need SDV-All CRFs                            |
	| Need SDV-Completed CRFs                      |
	| Need SDV- Required Items                     |
	| Est. Total Onsite Workload (hrs)             |
	And I see a note displyed below
	| Note:                                                                                                                                                                                                                                                                      |
	| [Need SDV- All CRFs]- includes Incomplete and Submitted CRFs with required SDV [Need SDV- Completed CRFs]- only includes Submitted CRFs with required SDV Report excludes Mark Not Collected CRFs Workload is based on Completed CRFs and includes 1.5 hours routine time. |
	And I see the footer displayed
	| Footer:                                              |
	| Copyright © 2011 DataLabs, Inc. All rights reserved  |
	| Report Run                                           |
	| Data Last Update                                     |

