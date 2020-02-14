@F9857
Feature:DS_EnableandDisableLabs
 #     As a Product Owner
	#I want Designer users to be able to enable/disable Labs for studies with TargetApp 5.8.0 or greater.
	#So that users can choose Labs if they wanted to use for respective study.

#Feature No:F9857
#Feature Link: https://rally1.rallydev.com/#/244270786880ud/detail/portfolioitem/feature/288686580304
#Owner:Rama Chinthapalli
#Author:Vishnu Priya
#Copyright © 2018 PAREXEL International


Scenario: 01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

Scenario: 02_When I click on Create New Study with Target APP as null then Labs setting option should be displayed as default by No in Other section and it should be disabled
	When I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp | SafetyMapping |
	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 |           | Not Enabled   |		
	Then I should see the Labs drop down state as "Disabled" in Other section 
	And I should see the selected Labs value as "No" in the drop down of Other section	

Scenario: 03_When I click on Create New Study with Target APP as DataLabs 5.6x or 5.7x or 5.8x then Labs setting option should be displayed as default by No in Other section and it should be disabled
	When I click on the Cancel button in Study Properties page
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                     | SafetyMapping |
	| Study1    | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.6x or 5.7x or 5.8x | Not Enabled   |		
	Then I should see the Labs drop down state as "Disabled" in Other section 
	And I should see the selected Labs value as "No" in the drop down of Other section	

Scenario: 04_When I open the existing study and change the Target App value to DataLabs 5.9x or greater then the Labs option should be Enabled with default value selected as NO
	When I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click breadcrumb item "Home"
	And I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study1    |
	And I click on the Settings drop Icon
	And I select value "DataLabs 5.9x or greater" from the "Target App:" drop down of Study page	
	And I click Continue on Target App pop up having  title "Target App" and partial message "If you change the Target App to a higher version you cannot select a lower version in the future"		
	Then I should see the Labs drop down state as "Enabled" in Other section 
	And I should see the selected Labs value as "No" in the drop down of Other section
	And I should see the below drop down options once I click on "Labs" drop down
	|Dropdown|
	| No  |
	| Yes |

Scenario: 05_When I Mouse hover on Labs Question mark then it should display Labs: If selected "Yes", Study has the Labs feature enabled for defining Attribute, Lab and Lab dictionary mappings.
	When I Mouse hover on Labs Question 	
	Then I should see the message "Labs: If selected "Yes", Study has the Labs feature enabled for defining Attribute, Lab and Lab dictionary mappings."

Scenario: 06_When I click on Create New Study with Target APP as DataLabs 5.8x or greater then Labs setting option should be displayed by default as No in Other section and it should be enabled
	When I click on the Cancel button in Study Properties page	
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping | 
	| Study2    | StudyLabel2 | Protocol2 | ProtocolTitle2 | PT2           | EXSTUID2         | Phase2     | Cal pol       | IND2            | Allergy         | Sponsor1 |DataLabs 5.9x or greater | Not Enabled   |		
	Then I should see the Labs drop down state as "Enabled" in Other section 
	And I should see the selected Labs value as "No" in the drop down of Other section
	And I should see the below drop down options once I click on "Labs" drop down
	|Dropdown|
	| No  |
	| Yes |

Scenario: 07_When I Click on Save button after changing the Labs option to Yes then verify and open that study in Home page
	When I Select "Yes" from the "Labs" drop down
	And I click on the Save button
	And I should see the notification "Study has been successfully added"	
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	Then I Search for the study in the studies list of Home page and open the study
	| StudyName |
	| Study2    |

Scenario: 08_When I Click change the Labs option to No in Other section then I should get the message below the drop down
	When I click on the Settings drop Icon
	And  I Select "No" from the "Labs" drop down
	Then I should see the message "On changing Labs setting to ‘No’, all lab data will be removed from the study." below the Labs drop down

Scenario: 09_When I change the drop down option to yes then the message below the drop down should be cleared
	When I Select "Yes" from the "Labs" drop down	
	Then I should not see the message "On changing Labs setting to ‘No’, all lab data will be removed from the study." below the Labs drop down	

Scenario: 10_When we create a study from existing study where the previous Labs option is Set to Yes then the study should be created with Labs Option Set to Yes
	When I click on the Save button
	And I should see the notification "Study has been successfully updated"
	#And I click on the Link "View Study Jobs"
	#And I should see the status of the study "Create Study (Study2)" in "Complete" state
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName |
	| Study2    |
	And Enter the unique study name "Study3"	
	Then I should see the selected Labs value as "Yes" in the drop down of Other section
	And I should see the below drop down options once I click on "Labs" drop down
	|Dropdown|
	| No  |
	| Yes |

Scenario: 11_When we create a study from existing study and change the Target APP to DataLabs 5.6x or 5.7x then I should see the Labs option as disabled and the default value is set to NO	
	When I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Create Study (Study3)" in "Complete" state
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName |
	| Study2    |
	And Enter the unique study name "Study4"
	And I select value "DataLabs 5.6x or 5.7x or 5.8x" from the "Target App:" drop down of Study page
	And I click Continue on Target App pop up having  title "Target App" and partial message "System features not supported in the selected Target App will be inactivated."		
	Then I should see the Labs drop down state as "Disabled" in Other section 
	And I should see the selected Labs value as "No" in the drop down of Other section

Scenario: 12_When we create a study from existing study and change the Lab Setting option to No then I should see the Message below the drop down	
	   When I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Create Study (Study4)" in "Complete" state
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"	
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName |
	| Study2    |
	And I Select "No" from the "Labs" drop down
	Then I should see the message "On changing Labs setting to ‘No’, all lab data will be removed from the study." below the Labs drop down 	

Scenario: 13_When we create a study from existing study of Tagrget App 5.8 and Labs set to NO then I should see the Labs option as No in the created study
	When Enter the unique study name "Study5"
	And I click on the Save button
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Create Study (Study5)" in "Complete" state
	And I click breadcrumb item "Home"
	And I click on the Link "Create New Study"	
	And I enter study details 
	| StudyName | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping |
	| Study6   | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.9x or greater | Not Enabled   |			
	And I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click breadcrumb item "Home"
	And I see Designer Home Page
	And I click on the Link "Create Study from Existing"	
	And I select the pop up having title "Create Study from Existing" and partial message "Please select a Study"
	And I Search for the study in the studies list of Create Study from Existing  and click on the study
	| StudyName |
	| Study6    |
	And Enter the unique study name "Study7"	
	Then I should see the Labs drop down state as "Enabled" in Other section 
	And I should see the selected Labs value as "No" in the drop down of Other section
	And I should see the below drop down options once I click on "Labs" drop down
	|Dropdown|
	| No  |
	| Yes |

Scenario: 14_When we create a study from existing study of study ver 5.7 	
	When I click on the Save button
	And I click on the Link "View Study Jobs"
	And I should see the status of the study "Create Study (Study7)" in "Complete" state
	And I click breadcrumb item "Home"
	Then I see Designer Home Page

#Import a study of Target APP DataLabs 5.8x or greater then User should see the Labs option as enabled and the selected option as Yes in the drop down if the study has Labs 
Scenario: 15_When I Import Study of DataLabs 5.9x or greater to Designer which is having Labs module then I should see the Labs option as Yes in the others section Labs setting
	When I click on the Link "Import Study"
	And I import a study "Test4500_Labs_20191013_T09370580_withLabsYes.zip" 
	And Enter the unique study name "Import1"
	And Select the sponsor name "Sponsor1"
	Then I should see the Labs drop down state as "Enabled" in Other section 
	And I should see the selected Labs value as "Yes" in the drop down of Other section
	And I should see the below drop down options once I click on "Labs" drop down
	|Dropdown|
	| No  |
	| Yes |

Scenario: 16_When the user tries to save the study for which there is no Dictionary in the Manage Labs then user recieve the message Lab Dictionary mappings will be removed
	When I click on the Save button 	
	And I click continue in confirmation having title "Confirmation" and partial message "Lab Dictionary mappings will be removed"
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import1)" in "Complete" state

Scenario: 17_When I Import Study of DataLabs 5.9x or greater to Designer by changing the Labs No then user see the message below the drop down
	When I click breadcrumb item "Home"
	And I click on the Link "Import Study"
	And I import a study "Test4500_Labs_20191013_T09370580_withLabsYes.zip"	
	And Enter the unique study name "Import2"
	And Select the sponsor name "Sponsor1"
	And  I Select "No" from the "Labs" drop down
	Then I should see the Labs drop down state as "Enabled" in Other section 
	And I should see the message "On changing Labs setting to ‘No’, all lab data will be removed from the study." below the Labs drop down
	And I should see the below drop down options once I click on "Labs" drop down
	|Dropdown|
	| No  |
	| Yes |

Scenario: 18_When the user tries to save the study for which the Labs option is changed from Yes to No
	When I click on the Save button 		
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import2)" in "Complete" state

Scenario: 19_Add New Lab Dictionary	
	When I click breadcrumb item "Home"
	And I click on the Link "Manage Labs"
	And I Click "Add Lab Dictionary"
	And enter LabDictionaryName as "Dict1" 
	And enter LabDictionaryDesc as "Dict1Desc1"
	And I click on the Lab Dict Save button
	And I should see the Dict notification "Dict1 has been successfully added"
	And Click on the LabDict "Dict1"
	And Click on the image "Import Lab Dictionary" link
	And Enter Label as "LabDict"
	And I upload a labDict file "DataLabsEDC_LabDictionary_LabDictionary_PS1_V3.xlsx"
	#And I should see the notification message "Import has been successful"
	#Then I should the notification message "Import has been successful"
	#Then I should see the Import notification "Import has been successful"
	#Then I see the Lab test "01" in table
	Then I see the Lab test "01" in table of Lab Dictionary

Scenario: 20_When I Import Study to Designer that has the Dictionary and Labs data then user should see the Labs state as Enabled
	When I click breadcrumb item "Home"
	And I click on the Link "Import Study"
	And I import a study "Test4500_Labs_20191013_T09370580_withLabsYes.zip" 
	And Enter the unique study name "Import3"
	And Select the sponsor name "Sponsor1"
	And  I Select "No" from the "Labs" drop down
	Then I should see the Labs drop down state as "Enabled" in Other section 
	And I should see the message "On changing Labs setting to ‘No’, all lab data will be removed from the study." below the Labs drop down	
	And I should see the below drop down options once I click on "Labs" drop down
	|Dropdown|
	| No  |
	| Yes |

Scenario: 21_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete
	When I click on the Save button	
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import3)" in "Complete" state
#
##Import a study of Target APP DataLabs 5.9x or greater then User should see the Labs option as enabled and the selected option as Yes in the drop down if the study has Labs 
Scenario: 22_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete
	When I click breadcrumb item "Home"
	And I click on the Link "Import Study"
	And I import a study "Test4500_Labs_20191013_T09370580_withLabsYes.zip" 
	And Enter the unique study name "Import4"
	And Select the sponsor name "Sponsor1"
	Then I should see the Labs drop down state as "Enabled" in Other section 
	And I should see the selected Labs value as "Yes" in the drop down of Other section
	And I should see the below drop down options once I click on "Labs" drop down
	|Dropdown|
	| No  |
	| Yes |

Scenario: 23_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete	
	When I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import4)" in "Complete" state

Scenario: 24_When I Import Study of Target App 5.6 to Designer then I see message "Study has been successfully added" and status as complete
	When I click breadcrumb item "Home"
	And I click on the Link "Import Study"
	And I import a study "TestStudy_Original_56.zip" 
	And Enter the unique study name "Import5"
	And Select the sponsor name "Sponsor1"
	Then I should see the Labs drop down state as "Disabled" in Other section 

Scenario: 25_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete	
	When I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import5)" in "Complete" state

Scenario: 26_When I Import Study of Target App 5.9 with Labs Equalto NO to Designer then I see message "Study has been successfully added" and status as complete
	When I click breadcrumb item "Home"
	When I click on the Link "Import Study"
	And I import a study "Import1_20191012_T20551331_59withLabsNo.zip" 
	And Enter the unique study name "Import6"
	And Select the sponsor name "Sponsor1"
	Then I should see the selected Labs value as "No" in the drop down of Other section	

Scenario: 27_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete	
	When I click on the Save button
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import6)" in "Complete" state

Scenario: 28_When I navigate back to the Home page and click on Delete all previously created studies then I should see all those studies	
	When I click breadcrumb item "Home"	
	And I Search for the study in the studies list of Home page and delete the study
	| StudyName |
	| Import4   |
	| Import5   |
	| Import6   |
	| Import1   |
	| Import2   |
	| Import3   |
	| Study1    |
	| Study2    |
	| Study3    |
	| Study4    |
	| Study5    |
	| Study6    |
	| Study7    |
	Then I should not see these studies in the Home page
	| StudyName |
	| Import4   |
	| Import5   |
	| Import6   |
	| Import1   |
	| Import3   |
	| Import2   |
	| Study1    |
	| Study2    |
	| Study3    |
	| Study4    |
	| Study5    |
	| Study6    |
	| Study7    |

Scenario: 29_Navigate to Manage Labs tab and Delete the Dictionaries
	When I click on the Link "Manage Labs"
	And I select the Check box 	
	And I Click on "Delete Lab Dictionary(s)" for deletion
	And I click continue in confirmation having title "Delete" and partial message "Are you sure you want to permanently delete 1 Lab Dictionary?"
	Then I see the message "No records to display."
	