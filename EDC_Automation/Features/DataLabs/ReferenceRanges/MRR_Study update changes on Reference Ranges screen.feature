Feature: Manage Reference Ranges Study Update changes
	
Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Study2_DICT_20181024_T15505995.zip" with study label "Base"
	#Then I see study label "Study2_DICT" in header

#Scenario: 04_Publish a study and verify the Lab Tests in Mrr 
#	When I select DataManagerPortal item "Study Administration" from drop down
#	And I click Link "Study Management" In StudyAdministrationPage
#	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
#	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
#	And I click browse button in upload study file page
#	And I upload study "Study2_DICT_20181009_T12550981.zip" with Label "Minor"
#	And I open study which has "Uploaded" status
#	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
#	And I open study which has "Staged" status	
#	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
#	And I clicked Continue button in PublishStudyFlagsPage
#	And I click Publish button in PublishStudyPage of MinorStudyUpdate
#	And I navigate to "Labs" tab from main menu.	
#	And I open lab with labid "L21" from ManageReferenceRanges page
#	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
#	| LabTestName |	
#	| Test2       |
#	| Test3       |
#	| MRRTEST1    |
#	| MRRTEST2    |
#	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
#	| LabTestName |	
#	| Hemoglobin  |
#	| BiteCells   |

#Prepared the study file Study2_DICT_20181012_T11351602.zip by setting the Reference range as Yes for Lab Tests MRRTEST1, MRRTEST2, MRRTEST3
Scenario: 05_Publish a minor study by setting the Reference Range to Yes for few of the lab Tests and to No for few of the lab tests and verify the Lab Tests lists in Mrr	page if the Reference Range set to Yes are coming the Mrr lab Tests lists 
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181024_T15505995.zip" with Label "Minor"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I Wait until the study publish is complete for "Minor" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |
	| MRRTEST1    |
	| MRRTEST2    |
	| MRRTEST3    |	
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
#Prepared the study file Study2_DICT_20181012_T14390083.zip by setting the Reference range as Yes for Lab Tests MRRTEST2, MRRTEST3 and set No to the lab test MRRTEST1
Scenario: 06_Publish a new minor study by changing the Reference range to No for the existing lab test and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181024_T16371238.zip" with Label "Minor"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I Wait until the study publish is complete for "Minor" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |
	| MRRTEST2   |	
	| MRRTEST3   |
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |
	| MRRTEST1    |
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
#Prepared the study file Study2_DICT_20181015_T11234399.zip by adding new lab tests MRRTEST19, MRRTEST20 by using the new lab dictonary MRR_AddededLabTest_1
Scenario: 07_Publish a new minor study by adding new lab tests to the existing study by adding a new lab dictonary and verify the Lab Tests lists in Mrr if the Lab tests with are coming or not if the Reference Range is set to yes
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181024_T16441287.zip" with Label "Minor"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I Wait until the study publish is complete for "Minor" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |	
	| MRRTEST1    |
	| MRRTEST19   |
	| MRRTEST20   |		
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |		
	| MRRTEST2    |
	| MRRTEST3    |
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
	| MRRTEST16   |
	| MRRTEST17   |
	| MRRTEST18   |

#Prepared the study file Study2_DICT_20181015_T11234399.zip by removing the newly added lab tests MRRTEST19, MRRTEST20 by using the new lab dictonary MRR_AddededLabTest_1
Scenario: 08_Publish a new minor study by removing few of the existing lab tests to the existing study and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181015_T13361950.zip" with Label "Minor"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I Wait until the study publish is complete for "Minor" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |
	| MRRTEST15   |
	| MRRTEST16   |		
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName |
	| MRRTEST1    |	
	| MRRTEST2    |
	| MRRTEST3    |
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
	| MRRTEST17   |	
	| MRRTEST18   |
	And I should not see the below mentioned Lab Tests in Mrr page which are not present in the input study file
	| LabTestName |
	| MRRTEST19   |	
	| MRRTEST20   |	

Scenario: 09_Publish a new minor study after changing the lab dictonary to the existing study and verify the Lab Tests lists in Mrr
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Study2_DICT_20181015_T13550985.zip" with Label "Minor"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status	
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette	
	And I clicked Continue button in PublishStudyFlagsPage
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I Wait until the study publish is complete for "Minor" Study
	And I navigate to "Labs" tab from main menu.	
	And I open lab with labid "L21" from ManageReferenceRanges page
	Then I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file
	| LabTestName |
	| HEMOGLOBIN1 |
	| HEMOGLOBIN10|
	| HEMOGLOBIN15|
	| HEMOGLOBIN16|
	| HEMOGLOBIN17|
	| HEMOGLOBIN18|	
	And I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file
	| LabTestName  |
	| HEMOGLOBIN2  |
	| HEMOGLOBIN3  |
	| HEMOGLOBIN4  |
	| HEMOGLOBIN5  |
	| HEMOGLOBIN6  |
	| HEMOGLOBIN7  |
	| HEMOGLOBIN8  |
	| HEMOGLOBIN9  |
	| HEMOGLOBIN11 |
	| HEMOGLOBIN12 |
	| HEMOGLOBIN13 |
	| HEMOGLOBIN14 |
	| MRRTEST15   |
	| MRRTEST16   |





	

	
