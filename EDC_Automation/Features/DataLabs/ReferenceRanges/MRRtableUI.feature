Feature: MRRtableUI

@ObjectiveEvidence	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

#Scenario: 02_Delete a study
#	When I delete study
#	Then I see study label "No Study Loaded" in header
#
#Scenario: 03_Publish a study
#	When I click breadcrumb "Study Management"
#	And I upload a study "Import_Study1_BaseFileForDictionaryChanges.zip" with study label "MrrTableGridTesting"
#	Then I see study label "Study2_DICT" in header

#Scenario: 04_Add Sites
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Site Management" In StudyAdministrationPage
#	And I enter sites details and Save
#	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
#	| S11    | Site1    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#	| S12    | Site2    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
#	| S13    | Site3    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
#	| S14    | Site4    | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
#	| S21    | Site21   | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Inactive   | Electronic  | No             | -          |
#
#Scenario: 05_Assign testadmin testadmin user to site S11
#	When I click breadcrumb "Site Management"
#	And I open site with siteid "S11" and site name "Site1" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#
#Scenario: 06_Assign testadmin1 user to site S12
#	When I click breadcrumb "Site Management" 
#	And I open site with siteid "S12" and site name "Site2" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#
#Scenario: 07_Assign testadmin1 user to site S13
#	When I click breadcrumb "Site Management"
#	And I open site with siteid "S13" and site name "Site3" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#
#Scenario: 08_Assign testadmin1 user to site S14
#	When I click breadcrumb "Site Management"
#	And I open site with siteid "S14" and site name "Site4" from SiteManagement page
#	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
#	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
#	Then  I see ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
#
#Scenario: 09_Add Labs
#	When I click breadcrumb "Study Administration"
#	And I click Link "Lab Management" In StudyAdministrationPage
#	And I enter labs details and Save
#	| LabId | LaboratoryName | Company    | Department | Address1 | Address2 | Address3 | City   | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L21   | Lab21          | PFIZER     | RD         | A1       | A2       | A3       | City1  | AP    | 500084 | INDIA(IND) |  INDIA	 | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L22   | Lab22          | PFIZER     | RD         | A1       | A2       | A3       | City2  | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L23   | Lab23          | NOVARTIS   | Research   | A1       | A2       | A3       | City3  | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	| L24   | Lab24          | NOVARTIS   | Research   | A1       | A2       | A3       | City4  | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.MNO        |
#	| L25   | Lab25          | CIPLA      | Production | A1       | A2       | A3       | City5  | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L111  | Lab11          | CIPLA      | Production | A1       | A2       | A3       | City6  | KL    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L112  | Lab112         | Dr.Reddy's | Trials     | A1       | A2       | A3       | City7  | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |
#	| L113  | Lab113         | Dr.Reddy's | Trials     | A1       | A2       | A3       | City8  | PA    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	| L114  | Lab114         | Dr.Reddy's | RD         | A1       | A2       | A3       | City9  | HP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
#	| L115  | Lab115         | Dr.Reddy's | RD         | A1       | A2       | A3       | City10 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	Then I see labs with details in lab grid
#	| LabId | LaboratoryName | Company    | Department | Address  | City   | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
#	| L21   | Lab21          | PFIZER     | RD         | A1 A2 A3 | City1  | AP    | 500084 | INDIA(IND) | INDIA   | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L22   | Lab22          | PFIZER     | RD         | A1 A2 A3 | City2  | MP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L23   | Lab23          | NOVARTIS   | Research   | A1 A2 A3 | City3  | UP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	| L24   | Lab24          | NOVARTIS   | Research   | A1 A2 A3 | City4  | GOA   | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.MNO        |
#	| L25   | Lab25          | CIPLA      | Production | A1 A2 A3 | City5  | TN    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#	| L111  | Lab11          | CIPLA      | Production | A1 A2 A3 | City6  | KL    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
#	| L112  | Lab112         | Dr.Reddy's | Trials     | A1 A2 A3 | City7  | TS    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Inactive         | Mr.ABC        |
#	| L113  | Lab113         | Dr.Reddy's | Trials     | A1 A2 A3 | City8  | PA    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.IJK        |
#	| L114  | Lab114         | Dr.Reddy's | RD         | A1 A2 A3 | City9  | HP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.MNO        |
#	| L115  | Lab115         | Dr.Reddy's | RD         | A1 A2 A3 | City10 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.ABC        |
#
#Scenario: 10_Associate Site S11 for L21 Lab
#	When I click breadcrumb "Lab Management"
#	And I open lab with labid "L21" from LabManagement page
#	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
#	And I add and save site id "S11" and site name "Site1" to assocaited sites in LabManagementSitesPage
#	Then I see site data in sites tab of Lab in LabPage
#	| SiteId | SiteName | City      | State | Country | SiteStatus |
#	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |
#
#Scenario: 11_Associate Site S12 for L21 Lab
#	When I click breadcrumb "Lab Management"
#	And I open lab with labid "L21" from LabManagement page
#	And I click ActionPalette Item "Associate Site(s)" in "LabMgmt_Actions" ActionPalette
#	And I add and save site id "S12" and site name "Site2" to assocaited sites in LabManagementSitesPage
#	Then I see site data in sites tab of Lab in LabPage
#	| SiteId | SiteName | City      | State | Country | SiteStatus |
#	| S11    | Site1    | Hyderabad | AP    | INDIA   | Active     |
#	And I see site data in sites tab of Lab in LabPage
#	| SiteId | SiteName | City      | State | Country | SiteStatus |
#	| S12    | Site2    | Hyderabad | AP    | INDIA   | Active     |
#
#Scenario: 12_Verify the MRR table Column names when user clicks on  Mrr Lab Test Page	
#	When I navigate to "Labs" tab from main menu.
#	And I open lab with labid "L21" from ManageReferenceRanges page
#	And I open labtest with labname "MRRTEST2" from labtests page
#	Then I see the message "No records to display." before adding the records

Scenario: 13_Navigate from home page to Labs page, then verify the Manage Reference Ranges page
	Given I navigate to "Labs" tab from main menu.
    When I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "01" from labtests page
	And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	| 09/19/2017 | 10/19/2017 | Not Specified | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	| 10/19/2017 | 10/20/2017 | Not Specified | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 03   |
	| 09/18/2016 | 09/18/2017 | Male          | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 04   |
	| 09/19/2017 | 10/19/2017 | Male          | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 05   |
	| 10/19/2017 | 10/20/2017 | Male          | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 06   |
	| 09/18/2016 | 09/18/2017 | Female        | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 07   |
	| 09/19/2017 | 10/19/2017 | Female        | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 08   |
	| 10/19/2017 | 10/20/2017 | Female        | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 09   |
	| 10/21/2017 | 10/21/2018 | Not Specified | =             | 1          | Months       | =           | 5        | Weeks      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 10   |
	| 10/22/2018 | 10/23/2019 | Not Specified | =             | 1          | Days         | =           | 24       | Hours      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 11   |
	| 10/24/2019 | 10/24/2020 | Not Specified | =             | 1          | Years        | =           | 365      | Days       | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 12   |
	Then I create a new record with the same data and I can see "Duplicate reference range record cannot be entered" error message upon each record save in ReferenceRangesPage
	| StartDate  | EndDate    | Gender        | FromAgeSelect | FromAgeSet | FromAgeRange | ToAgeSelect | ToAgeSet | ToAgeRange | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit |
	| 09/18/2016 | 09/18/2017 | Not Specified | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 01   |
	| 09/19/2017 | 10/19/2017 | Not Specified | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 02   |
	| 10/19/2017 | 10/20/2017 | Not Specified | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 03   |
	| 09/18/2016 | 09/18/2017 | Male          | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 04   |
	| 09/19/2017 | 10/19/2017 | Male          | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 05   |
	| 10/19/2017 | 10/20/2017 | Male          | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 06   |
	| 09/18/2016 | 09/18/2017 | Female        | =             | 1          | Years        | =           | 2        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 07   |
	| 09/19/2017 | 10/19/2017 | Female        | >             | 2          | Years        | <           | 3        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 08   |
	| 10/19/2017 | 10/20/2017 | Female        | =             | 4          | Years        | <           | 5        | Years      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 09   |
	| 10/21/2017 | 10/21/2018 | Not Specified | =             | 1          | Months       | =           | 5        | Weeks      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 10   |
	| 10/22/2018 | 10/23/2019 | Not Specified | =             | 1          | Days         | =           | 24       | Hours      | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 11   |
	| 10/24/2019 | 10/24/2020 | Not Specified | =             | 1          | Years        | =           | 365      | Days       | >                    | 23                | <                     | 85                 | >                      | 20                  | <                       | 100                  | 12   |
	
Scenario: 14_Verify the column Header names in Mrr table when user clicks on Mrr Lab Test link
	When I navigate to "Labs" tab from main menu.
	And I open lab with labid "L21" from ManageReferenceRanges page
	And I open labtest with labname "MRRTEST1" from labtests page
	And I sort column "Start Date1" in MrrGrid of ManageReferenceRangesPage
	And I sort column "From Age1" in MrrGrid of ManageReferenceRangesPage
	And I sort column "From Age2" in MrrGrid of ManageReferenceRangesPage
	And I sort column "Gender" in MrrGrid of ManageReferenceRangesPage
	And I sort column "Gender" in MrrGrid of ManageReferenceRangesPage
	Then I should see the checkbox in the MRR table column header of Manage Reference Ranges page			
	And I should see the below mentioned column header names in the MRR table of Manage Reference Ranges page
	| Name |
	|      |	
	| Ref ID          |
	| Start Date      |
	| End Date        |
	| Gender          |
	| From Age        |
	| To Age          |
	| Normal Range    |		
	| Critical Range  |	
	| Unit Name       |
	| NA              |
	| Actions         |
	And I should see the below mentioned sub column header names under the header Normal Range in the MRR table of Manage Reference Ranges page
	| Name           |
	| Low			 |
	| High			 |
	And  I should see the below mentioned sub column header names under the header Critical Range in the MRR table of Manage Reference Ranges page
	| Name           |
	| Low			 |
	| High			 |

#Scenario: 14_Verify the column SubHeading names in the Mrr table for the field Normal Range when user clicks on Mrr Lab Test link
#	When I navigate to "Labs" tab from main menu.
#	And I open lab with labid "L21" from ManageReferenceRanges page
#	And I open labtest with labname "HEMOGLOBIN3" from labtests page
	

Scenario: 15_Check sort for Ref ID column for descending
	When I sort column "Ref ID" in MrrGrid of ManageReferenceRangesPage
	Then I see data in sort order "Ascending" in column "Ref ID" in the MrrGrid of Mrr page for RefID

#Scenario: 16_Check sort for Ref ID column for ascending
#	When I sort column "Ref ID" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "Ref ID" in the MrrGrid of Mrr page for RefID
#	And I sort column "Ref ID" in MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 17_Check sort for Start Date column for Ascending
#	When I sort column "Start Date" in MrrGrid of ManageReferenceRangesPage	
#	Then I should see data in sort order "Ascending" in column "Start Date" in the MrrGrid of Mrr page
#
#Scenario: 18_Check sort for Laboratory Name column for descending
#	When I sort column "Start Date" in MrrGrid of ManageReferenceRangesPage
#	Then I should see data in sort order "Descending" in column "Start Date" in the MrrGrid of Mrr page
#	And I sort column "Start Date" in MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 19_Check sort for End Date column for ascending
#	When I sort column "End Date" in MrrGrid of ManageReferenceRangesPage
#	Then I should see data in sort order "Ascending" in column "End Date" in the MrrGrid of Mrr page
#
#Scenario: 20_Check sort for End Date column for descending
#	When I sort column "End Date" in MrrGrid of ManageReferenceRangesPage
#	Then I should see data in sort order "Descending" in column "End Date" in the MrrGrid of Mrr page
#	And I sort column "End Date" in MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 21_Check sort for Gender column for Ascending
#	When I sort column "Gender" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "Gender" in the MrrGrid of Mrr page for Gender
#	
#Scenario: 22_Check sort for Gender column for Descending
#	When I sort column "Gender" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "Gender" in the MrrGrid of Mrr page for Gender
#	And I sort column "Gender" in MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 23_Check sort for From Age column for Ascending
#	When I sort column "From Age" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "From Age" in the MrrGrid of Mrr page for Gender
#
#Scenario: 24_Check sort for From Age column for Descending
#	When I sort column "From Age" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "From Age" in the MrrGrid of Mrr page
#	And I sort column "From Age" in MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 25_Check sort for To Age column for Ascending
#	When I sort column "To Age" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "To Age" in the MrrGrid of Mrr page
#
#Scenario: 26_Check sort for To Age column for Descending
#	When I sort column "To Age" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "To Age" in the MrrGrid of Mrr page
#	And I sort column "To Age" in MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 27_Check sort for Unit column for Ascending
#	When I sort column "Unit Name" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "Unit Name" in the MrrGrid of Mrr page
#
#Scenario: 28_Check sort for Unit column for Descending
#	When I sort column "Unit Name" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "Unit Name" in the MrrGrid of Mrr page
#	And I sort column "Unit Name" in MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 29_Check sort for NA column for Ascending
#	When I sort column "NA" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "NA" in the MrrGrid of Mrr page
#
#Scenario: 30_Check sort for NA column for Descending
#	When I sort column "NA" in MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "NA" in the MrrGrid of Mrr page
#	And I sort column "NA" in MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 31_Check sort for Low column of Normal Range for ascending	
#	When I sort column "Low" of occurence "1" in Normal Range MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "Low" of "Normal Range" in the MrrGrid of Mrrpage
#
#Scenario: 32_Check sort for Low column of Normal Range for descending
#	When I sort column "Low" of occurence "1" in Normal Range MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "Low" of "Normal Range" in the MrrGrid of Mrrpage
#	And I sort column "Low" of occurence "1" in Normal Range MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 33_Check sort for High column of Normal Range for Ascending
#	When I sort column "High" of occurence "1" in Normal Range MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "High" of "Normal Range" in the MrrGrid of Mrrpage
#
#Scenario: 34_Check sort for High column of Normal Range for Descending
#	When I sort column "High" of occurence "1" in Normal Range MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "High" of "Normal Range" in the MrrGrid of Mrrpage
#	And I sort column "High" of occurence "1" in Normal Range MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 35_Check sort for Low column of Critial Range for ascending
#	When I sort column "Low" of occurence "2" in Critical Range MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "Low" of "Critical Range" in the MrrGrid of Mrrpage
#
#Scenario: 36_Check sort for Low column of Critial Range for descending
#	When I sort column "Low" of occurence "2" in Critical Range MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "Low" of "Crtitical Range" in the MrrGrid of Mrrpage
#	And  I sort column "Low" of occurence "2" in Critical Range MrrGrid of ManageReferenceRangesPage to clear sorting
#
#Scenario: 37_Check sort for High column of Critial Range for Ascending
#	When I sort column "High" of occurence "2" in Critical Range MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Ascending" in column "High" of "Critical Range" in the MrrGrid of Mrrpage
#
#Scenario: 38_Check sort for High column of Critial Range for Descending
#	When I sort column "High" of occurence "2" in Critical Range MrrGrid of ManageReferenceRangesPage
#	Then I see data in sort order "Descending" in column "High" of "Critical Range" in the MrrGrid of Mrrpage
#	And I sort column "High" of occurence "2" in Critical Range MrrGrid of ManageReferenceRangesPage to clear sorting

#Scenario: 41_Filter Ref ID column with IsEqualTo filter criteria
#	When I apply filter on column "Ref ID" with filter text "1026" by filter criteria "Not equal to" in Mrr Lab Test Name Grid
#	Then I see filtered data in column "Ref ID" with filter text "1026" and filter criteria "Not equal to" in Mrr Lab Test Name Grid
#	And I clear filter on column "Ref ID" in Mrr Lab Test Name Grid

Scenario: 42_Filter Start Date column with IsEqualTo filter criteria
	When I apply filter on column "Start Date" with filter text "11/06/2018" by filter criteria "Not equal to" in Mrr Lab Test Name Grid
	Then I see filtered data in column "Start Date" with filter text "11/06/2018" and filter criteria "Not equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "Start Date" in Mrr Lab Test Name Grid

Scenario: 43_Filter Start Date column with IsEqualTo filter criteria
	When I apply filter on column "End Date" with filter text "10/15/2018" by filter criteria "Equal to" in Mrr Lab Test Name Grid
	Then I see filtered data in column "End Date" with filter text "10/15/2018" and filter criteria "Equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "End Date" in Mrr Lab Test Name Grid

Scenario: 44_Filter Start Date column with IsEqualTo filter criteria
	When I apply filter on column "Gender" with filter text "Male" by filter criteria "Equal to" in Mrr Lab Test Name Grid
	Then I see filtered data in column "Gender" with filter text "Male" and filter criteria "Equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "Gender" in Mrr Lab Test Name Grid

Scenario: 45_Filter Start Date column with IsEqualTo filter criteria
	When I apply filter on column "From Age" with filter text "48" by filter criteria "Equal to" in Mrr Lab Test Name Grid
	Then I see filtered data in column "From Age" with filter text "48" and filter criteria "Equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "From Age" in Mrr Lab Test Name Grid

Scenario: 46_Filter Start Date column with IsEqualTo filter criteria
	When I apply filter on column "To Age" with filter text "35" by filter criteria "Equal to" in Mrr Lab Test Name Grid
	Then I see filtered data in column "To Age" with filter text "35" and filter criteria "Equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "To Age" in Mrr Lab Test Name Grid

Scenario: 47_Filter Start Date column with IsEqualTo filter criteria
	When I apply filter on column "Unit" with filter text "3Unit" by filter criteria "Equal to" in Mrr Lab Test Name Grid
	Then I see filtered data in column "Unit" with filter text "3Unit" and filter criteria "Equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "Unit" in Mrr Lab Test Name Grid

Scenario: 48_Filter Start Date column with IsEqualTo filter criteria
	When I apply filter on column "NA" by selecting "true" option in Mrr Lab Test Name Grid in MRR page
	Then I see filtered data in column "NA" with filter text "true" and filter criteria "Equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "NA" in Mrr Lab Test Name Grid

Scenario: 49_Filter Low Normal Range column with IsEqualTo filter criteria
	When I apply filter on column Normal Range "Low" with filter text "> 235" by filter criteria "Is equal to" in Mrr Lab Test Name Grid for "1" sub column
	Then I see filtered data in column Normal Range "Low" with filter text "> 235" and filter criteria "Is equal to" in Mrr Lab Test Name Grid for "1" sub column
	And I clear filter on column Normal Range "Low" in Mrr Lab Test Name Grid for subcolumn "1"

Scenario: 50_Filter High Normal Range column with IsEqualTo filter criteria
	When I apply filter on column Normal Range "High" with filter text "< 83" by filter criteria "Is equal to" in Mrr Lab Test Name Grid for "1" sub column
	Then I see filtered data in column Normal Range "High" with filter text "< 83" and filter criteria "Is equal to" in Mrr Lab Test Name Grid for "1" sub column
	And I clear filter on column Normal Range "High" in Mrr Lab Test Name Grid for subcolumn "1"

Scenario: 51_Filter Low Critial Range column with IsEqualTo filter criteria
	When I apply filter on column Critical Range "Low" with filter text "> 235" by filter criteria "Is equal to" in Mrr Lab Test Name Grid for "2" sub column
	Then I see filtered data in column Critical Range "Low" with filter text "> 235" and filter criteria "Is equal to" in Mrr Lab Test Name Grid for "2" sub column
	And I clear filter on column Critical Range "Low" in Mrr Lab Test Name Grid for subcolumn "2"

Scenario: 52_Filter High Critial Range column with IsEqualTo filter criteria
	When I apply filter on column Critical Range "High" with filter text "< 83" by filter criteria "Is equal to" in Mrr Lab Test Name Grid for "2" sub column
	Then I see filtered data in column Critical Range "High" with filter text "< 83" and filter criteria "Is equal to" in Mrr Lab Test Name Grid for "2" sub column
	And I clear filter on column Critical Range "High" in Mrr Lab Test Name Grid for subcolumn "2"

Scenario: 100_Filter Gender Name column with IsNotEqualTo filter criteria
	When I apply filter on column "Gender" with filter text "Female" by filter criteria "Is not equal to" in Mrr Lab Test Name Grid
	Then I see filtered data in column "Gender" with filter text "Female" and filter criteria "Is not equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "Gender" in Mrr Lab Test Name Grid

Scenario: 54_Filter Start Date column with Contains filter criteria
	When I apply filter on column "Start Date" with filter text "14" by filter criteria "Contains" in Mrr Lab Test Name Grid
	Then I see filtered data in column "Start Date" with filter text "14" and filter criteria "Contains" in Mrr Lab Test Name Grid
	And I clear filter on column "Start Date" in Mrr Lab Test Name Grid

Scenario: 55_Filter End Date column with DoesNotContain filter criteria
	When I apply filter on column "End Date" with filter text "2019" by filter criteria "Does not contain" in Mrr Lab Test Name Grid
	Then I see filtered data in column "End Date" with filter text "2019" and filter criteria "Does not contain" in Mrr Lab Test Name Grid
	And I clear filter on column "End Date" in Mrr Lab Test Name Grid

Scenario: 56_Filter Unit column with EndsWith filter criteria
	When I apply filter on column "Unit" with filter text "/L" by filter criteria "Ends with" in Mrr Lab Test Name Grid
	Then I see filtered data in column "Unit" with filter text "/L" and filter criteria "Ends with" in Mrr Lab Test Name Grid
	And I clear filter on column "Unit" in Mrr Lab Test Name Grid

Scenario: 57_Filter To Age column with EndsWith filter criteria
	When I apply filter on column "To Age" with filter text "Months" by filter criteria "Ends with" in Mrr Lab Test Name Grid
	Then I see filtered data in column "To Age" with filter text "Months" and filter criteria "Ends with" in Mrr Lab Test Name Grid
	And I clear filter on column "To Age" in Mrr Lab Test Name Grid

Scenario: 58_Filter From Age column with StartsWith filter criteria
	When I apply filter on column "From Age" with filter text "<" by filter criteria "Starts with" in Mrr Lab Test Name Grid
	Then I see filtered data in column "From Age" with filter text "<" and filter criteria "Starts with" in Mrr Lab Test Name Grid
	And I clear filter on column "From Age" in Mrr Lab Test Name Grid

Scenario: 59_Filter RefID column with IsNotEqualTo filter criteria
	When I apply filter on column "Ref ID" with filter text "%&*$" by filter criteria "Is not equal to" in Mrr Lab Test Name Grid
	Then I see filtered data in column "Ref ID" with filter text "%&*$" and filter criteria "Is not equal to" in Mrr Lab Test Name Grid
	And I clear filter on column "Ref ID" in Mrr Lab Test Name Grid




	          