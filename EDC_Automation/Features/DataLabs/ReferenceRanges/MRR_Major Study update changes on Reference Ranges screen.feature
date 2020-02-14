Feature: Manage Reference Ranges Major Study Update changes
	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Study2_Hemo_20181030_T16251150.zip" with study label "Base"
	Then I see study label "Study1" in header

#Prepare a mojor study file by setting the Reference Range to Yes for the tests HEMOGLOBIN1, HEMOGLOBIN2, HEMOGLOBIN3, HEMOGLOBIN4
Scenario: 04_Publish a new major study by changing the Reference range to Yes for the existing lab test and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181030_T16593309.zip" with Label "Major1"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major1" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |
	| HEMOGLOBIN1 |
	| HEMOGLOBIN2 |
	| HEMOGLOBIN3 |
	| HEMOGLOBIN4 |
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |	
	| HEMOGLOBIN5 |
	| HEMOGLOBIN6 |
	| HEMOGLOBIN7 |
	| HEMOGLOBIN8 |
	| HEMOGLOBIN9 |
	| HEMOGLOBIN10|
	| HEMOGLOBIN11|
	| HEMOGLOBIN12|
	| HEMOGLOBIN13|
	| HEMOGLOBIN14|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|
	

#Prepare a mojor study file by setting the Reference Range to No for the tests HEMOGLOBIN1, HEMOGLOBIN2
Scenario: 05_Publish a new major study by changing the Reference range to Yes for the existing lab test and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181109_T12035523.zip" with Label "Major2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major2" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |
	| HEMOGLOBIN1 |
	| HEMOGLOBIN2 |
	| HEMOGLOBIN3 |
	| HEMOGLOBIN4 |
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |	
	| HEMOGLOBIN5 |
	| HEMOGLOBIN6 |
	| HEMOGLOBIN7 |
	| HEMOGLOBIN8 |
	| HEMOGLOBIN9 |
	| HEMOGLOBIN10|
	| HEMOGLOBIN11|
	| HEMOGLOBIN12|
	| HEMOGLOBIN13|
	| HEMOGLOBIN14|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|
#Prepare a mojor study file by setting the Reference Range to No for the tests HEMOGLOBIN1, HEMOGLOBIN2
Scenario: 06_Publish a new major study by changing the Reference range to Yes for the existing lab test and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181109_T12104553.zip" with Label "Major3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major3" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |	
	| HEMOGLOBIN3 |
	| HEMOGLOBIN4 |
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |
	| HEMOGLOBIN1 |
	| HEMOGLOBIN2 |	
	| HEMOGLOBIN5 |
	| HEMOGLOBIN6 |
	| HEMOGLOBIN7 |
	| HEMOGLOBIN8 |
	| HEMOGLOBIN9 |
	| HEMOGLOBIN10|
	| HEMOGLOBIN11|
	| HEMOGLOBIN12|
	| HEMOGLOBIN13|
	| HEMOGLOBIN14|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|
#Prepare a mojor study file by setting the Reference Range to yes by adding new tests HEMOGLOBIN19 and HEMOGLOBIN20 to NO 
Scenario: 07_Publish a new major study by adding new lab tests to the existing study and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181109_T13104870.zip" with Label "Major4"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major4" Study	
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName  |
	| HEMOGLOBIN3  |
	| HEMOGLOBIN4  |
	| HEMOGLOBIN19 |
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |
	| HEMOGLOBIN1 |
	| HEMOGLOBIN2 |	
	| HEMOGLOBIN5 |
	| HEMOGLOBIN6 |
	| HEMOGLOBIN7 |
	| HEMOGLOBIN8 |
	| HEMOGLOBIN9 |
	| HEMOGLOBIN10|
	| HEMOGLOBIN11|
	| HEMOGLOBIN12|
	| HEMOGLOBIN13|
	| HEMOGLOBIN14|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|	
	| HEMOGLOBIN20|	
#Prepare a mojor study file by removing the tests HEMOGLOBIN19 and HEMOGLOBIN20
Scenario: 08_Publish a new major study by removing few of the existing lab tests to the existing study and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181109_T13202937.zip" with Label "Major5"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major5" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName  |
	| HEMOGLOBIN3  |
	| HEMOGLOBIN4  |
	| HEMOGLOBIN19 |
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |
	| HEMOGLOBIN1 |
	| HEMOGLOBIN2 |	
	| HEMOGLOBIN5 |
	| HEMOGLOBIN6 |
	| HEMOGLOBIN7 |
	| HEMOGLOBIN8 |
	| HEMOGLOBIN9 |
	| HEMOGLOBIN10|
	| HEMOGLOBIN11|
	| HEMOGLOBIN12|
	| HEMOGLOBIN13|
	| HEMOGLOBIN14|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|	
	| HEMOGLOBIN20|		
#Prepare a mojor study file by removing the tests HEMOGLOBIN19 and HEMOGLOBIN20
Scenario: 09_Publish a new major study by removing few of the existing lab tests to the existing study and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181109_T13245955.zip" with Label "Major5"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major5" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName  |
	| HEMOGLOBIN3  |
	| HEMOGLOBIN4  |	
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |
	| HEMOGLOBIN1 |
	| HEMOGLOBIN2 |	
	| HEMOGLOBIN5 |
	| HEMOGLOBIN6 |
	| HEMOGLOBIN7 |
	| HEMOGLOBIN8 |
	| HEMOGLOBIN9 |
	| HEMOGLOBIN10|
	| HEMOGLOBIN11|
	| HEMOGLOBIN12|
	| HEMOGLOBIN13|
	| HEMOGLOBIN14|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|
	| HEMOGLOBIN19 |	
	| HEMOGLOBIN20|	
# Prepare a major study file by changing the Labdictonary
	Scenario: 10_Publish a new major study by removing few of the existing lab tests to the existing study and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181109_T13282965.zip" with Label "Major5"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major5" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |
	| HEMOGLOBIN3  |
	| HEMOGLOBIN4  |
	| MRRTEST1    |
	| MRRTEST2    |		
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |	
	| MRRTEST4    |
	| MRRTEST5    |
	| MRRTEST6    |
	| MRRTEST7    |
	| MRRTEST8    |
	| MRRTEST9    |
	| MRRTEST10   |
	| MRRTEST11   |
	| MRRTEST12   |
	| MRRTEST13   |
	| MRRTEST14   |
	| MRRTEST15   |
	| MRRTEST16   |
	| MRRTEST17   |
	| MRRTEST18   |
	| MRRTEST19   |
	| MRRTEST20   |
	| HEMOGLOBIN2  |	
	| HEMOGLOBIN5  |
	| HEMOGLOBIN6  |
	| HEMOGLOBIN7  |
	| HEMOGLOBIN8  |
	| HEMOGLOBIN9  |
	| HEMOGLOBIN11 |
	| HEMOGLOBIN12 |
	| HEMOGLOBIN13 |
	| HEMOGLOBIN14 |	
	| HEMOGLOBIN10|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|	
	
# Prepare a major study file by changing the Labdictonary
	Scenario: 11_Publish a new major study by removing few of the existing lab tests to the existing study and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_Hemo_20181110_T10362370.zip" with Label "Major5"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage
	And I Wait until the study publish is complete for "Major5" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |	
	| MRRTEST1    |
	| MRRTEST2    |		
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |
	| MRRTEST4    |
	| MRRTEST5    |
	| MRRTEST6    |
	| MRRTEST7    |
	| MRRTEST8    |
	| MRRTEST9    |
	| MRRTEST10   |
	| MRRTEST11   |
	| MRRTEST12   |
	| MRRTEST13   |
	| MRRTEST14   |
	| MRRTEST15   |
	| MRRTEST16   |
	| MRRTEST17   |
	| MRRTEST18   |
	| MRRTEST19   |
	| MRRTEST20   |
	| HEMOGLOBIN1 |
	| HEMOGLOBIN3  |
	| HEMOGLOBIN4  |
	| HEMOGLOBIN2  |	
	| HEMOGLOBIN5  |
	| HEMOGLOBIN6  |
	| HEMOGLOBIN7  |
	| HEMOGLOBIN8  |
	| HEMOGLOBIN9  |
	| HEMOGLOBIN11 |
	| HEMOGLOBIN12 |
	| HEMOGLOBIN13 |
	| HEMOGLOBIN14 |	
	| HEMOGLOBIN10|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|		

#Scenario: 09_Publish a new major study after changing the lab dictonary to the existing study and verify the Lab Tests lists in Mrr
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Study Management" In StudyAdministrationPage
#	When I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
#	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
#	And I click browse button in upload study file page
#	And I upload study "Study2_DICT_20181010_T09563934.zip" with Label "Major6"
#	And I open study which has "Uploaded" status
#	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
#	And I open study which has "Staged" status
#	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
#	And I clicked Continue button in PublishStudyFlagsPage
#	And I click Publish button in PublishStudyPage
#	And I Wait until the study publish is complete for "Major6" Study
#	And I navigate to "Labs" tab from main menu.	
#	And I open lab with labid "L21" from ManageReferenceRanges page
#	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
#	| LabTestName |
#	| Test2       |
#	| Test3       |
#	| MRRTEST1    |
#	| MRRTEST2    |
#	| MRRTEST3    |
#	| MRRDICT1    |	
#	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
#	| LabTestName |
#	| Hemoglobin  |
#	| BiteCells   |
#	| MRRTEST4    |
#	| MRRDICT2    |
#	Then I should see all the Lab Tests in Mrr Lab Tests page which are marked as yes for the Reference Range record in either of the study files
#	And I shouldnot see the Lab Tests in Mrr Lab Tests page which are marked as NO for the Reference Range record in both the versions
#

	

	


