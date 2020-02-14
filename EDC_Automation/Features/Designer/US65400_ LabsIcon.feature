Feature: Designer_Lab_Items_Labs_Icon

@ObjectiveEvidence @ReqID:US65400.1
Scenario: T01_When I Login to Designer then I see the Designer home page
         Given I logged in to Designer
         Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US65400.2
Scenario: T02_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
         And I click on the Link "Import Study"
         And I import a study "Test4500_Labs_Unlocked_Patients2.zip" 
         And Enter the unique study name "Import_Study1"
         And Select the sponsor name "Sponsor1"
         And I click on the Save button       
		 And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
         And I click Continue button on the confirmation dialog
         And I should see the notification "Study has been successfully added"
         And I click on the Link "View Study Jobs"
         Then I should see the status of the study "Study Import (Import_Study1)" in "Complete" state		

@ObjectiveEvidence @ReqID:US63129.1
#Verify Lab Mappings Specification(LMS) in Documents section
Scenario: T03_When user clicks on Lab Mappings Specification(LMS) in Documents then user should not see Lab Mappings Specification(LMS) link in Documents section
         When I Search for the study in the studies list of Home page and open the study
         | StudyName     |
         | Import_Study1 | 
         Then I should see the tabs mentioned below
         | TabName        |
         | Events         |
         | Forms          |
         | Domains        |
         | Codelists      |
         | Dictionaries   |
         | Scripting      |
         | Configurations |
         | Labs           |
         And I should see the Labs Icon in next to Labs tab

Scenario: T04_When user clicks on Lab Mappings Specification(LMS) in Documents then user should not see Lab Mappings Specification(LMS) link in Documents section
         When I Search for the study in the studies list of Home page and open the study
         | StudyName     |
         | Import_Study1 |
         When I click on the Settings drop Icon
         And  I Select "No" from the "Labs" drop down
Then I should see the message "On changing the settings to No, lab related data will be removed from study" below the Labs drop down                 
         Then I should see the tabs mentioned below
         | TabName        |
         | Events         |
         | Forms          |
         | Domains        |
         | Codelists      |
         | Dictionaries   |
         | Scripting      |
         | Configurations | 
         And I shouldnot see the Labs Icon in next to Labs tab
