Feature: DataLabs_V5.8.0_Designer Study Verification Rules For Lab Components
	Test Summary:
	1. Study Verification Rules for Codelist Groupd and Linkages
	2. Study Verification Rules for Lab Mappings
	3. Study Verification Rules for Attribute Mappings (Codelist Mappings)
	4. Study Verification Rules for Lab Dictionary mappings

@ObjectiveEvidence @ReqID:US63653.01
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US63129.02
Scenario: T02_When I click on Create New Study with Target APP as DataLabs 5.8x or greater then Labs setting option should be displayed as default by No in Other section and it should be disabled
    #When I click on the Home Button
	When I click on the Link "Create New Study"	
	And I enter study data details 
	| StudyName      | StudyLabel  | Protocol  | ProtocolLabel  | ProtocolTitle | ExternalStudyID | StudyPhase | StudyDrugName | StudyIndication | TherapeuticArea | Sponsor  | TargetApp                | SafetyMapping |
	| CreateNewStudy | StudyLabel1 | Protocol1 | ProtocolTitle1 | PT1           | EXSTUID         | Phase1     | Cal pol       | IND1            | Allergy         | Sponsor1 | DataLabs 5.8x or greater | Not Enabled   |
	And I should see the notification "Study has been successfully added"
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (CreateNewStudy)" in "Complete with Errors" state
	When I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I see error messages as below
	| Error                                                                                               |
	| Attribute Mapping: Event, Form and Item mappings must be provided for lab attributes.               |
	| Lab Mapping: Lab Mappings must be entered for at least one instance.                                |
	| Lab Dictionary Mapping: Lab Dictionary is not associated to the Study.                              |

@ObjectiveEvidence @ReqID:US63653.03
Scenario: T03_Verify the study when lab dict is not associated
	When I click on the study verify error link
	And I click on the error Link "Attribute Mapping: Event, Form and Item mappings must be provided for lab attributes." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb        |
	| Home              |
	| Labs              |

@ObjectiveEvidence @ReqID:US63653.04
Scenario: T04_Verify the study when lab dict is not associated
	When I click on the study verify error link
	And I click on the error Link "Lab Mapping: Lab Mappings must be entered for at least one instance." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb  |
	| Home        |
	| Labs        |

@ObjectiveEvidence @ReqID:US63653.05
Scenario: T05_Verify the study when lab dict is not associated
	When I click on the study verify error link
	And I click on the error Link "Lab Dictionary Mapping: Lab Dictionary is not associated to the Study." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb         |
	| Home               |
	| Labs               |
	| Map Lab Dictionary |

@ObjectiveEvidence @ReqID:US63653.06
Scenario: T06_publish the study file
	When I click on the Link "CreateNewStudy"
	#When I click on the Study button
	And I click on the Link "Publish Study"
	And I see study publish dialog with title "Publish Study"
	And Enter Label for study publish as "LabDictMapping"
	And I click on study publish continue button
	Then I should see the status of the study "Study Publish (CreateNewStudy: LabDictMapping)" in "Complete" state
	#And I click on the Link "Study Publish (CreateNewStudy: LabDictMapping)"
	#Then Study file should be downloaded

@ObjectiveEvidence @ReqID:US63129.07
Scenario: T07_When I Import Study to Designer then I see message "Study has been successfully added" and status as complete
    When I click on the Home Button
	And I click on the Link "Import Study"
	And I import a study "StudyFile_VerificationRules.zip" 
	And Enter the unique study name "Import_Study3"
	And Select the sponsor name "Sponsor1"
	And I click on the Save button 	
	#And I see a confirmation dialog with title "Confirmation" and confirmation message "Lab Dictionary mappings will be removed"
	#And I click Continue button on the confirmation dialog
	And I should see the notification "Study has been successfully added"
	And I click on the Link "View Study Jobs"
	Then I should see the status of the study "Study Import (Import_Study3)" in "Complete" state

@ObjectiveEvidence @ReqID:US63653.08
Scenario: T08_Create CodeLists and CodeLists Items
    When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict1 (LabDictDesc1) "
	And I add the below labtest and labunit items and I should see the successful message
	| linkName      | LabTestsTabName | LabTestName1                               | LabTestName2                               | LabUnitsTabName | LabUnitName1                                 | LabUnitName2                                 |
	| Edit Selected | Lab Test        | LabTests-CRF Lab Test -1 (CRF Lab Test -1) | LabTests-CRF Lab Test -2 (CRF Lab Test -2) | Lab Unit        | LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1) | LabUnits-CRF Lab Unit - 2 (CRF Lab Unit - 2) |
	And I click on the Codelists Button
	And select the below items and delete
	| CodelistName | CodeItemDesc     |
	| LabUnits     | CRF Lab Unit - 1 |
	| LabTests     | CRF Lab Test -1  |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study)" in "Complete with Errors" state
	When I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I see error warning messages as below
	| Error                                                                                               |
	| Lab Dictionary Mapping: At least one Lab Dictionary Test or Unit should be mapped to any code item. |
	And I see warning messages as below
	| Warning                                                                                              |
	| Lab Dictionary Mapping: One or more Lab Dictionary Test(s) have invalid mappings.                    |
	| Lab Dictionary Mapping: One or more Lab Dictionary Unit(s) have invalid mappings.                    |
	| Lab Dictionary Mapping: None of the Lab Dictionary Test(s) have Display in Reference Ranges as "Yes" |

@ObjectiveEvidence @ReqID:US63653.09
Scenario: T09_Verify the study after associating the lab dictionary
    When I click on the Link "Import_Study"
	And I click on the study verify error link
	And I click on the error Link "Lab Dictionary Mapping: At least one Lab Dictionary Test or Unit should be mapped to any code item." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb         |
	| Home               |
	| Labs               |
	| Map Lab Dictionary |

@ObjectiveEvidence @ReqID:US63653.10
Scenario: T10_Verify the study after associating the lab dictionary
	When I click on the study verify error link
    And I click on the warning Link "Lab Dictionary Mapping: One or more Lab Dictionary Test(s) have invalid mappings." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb         |
	| Home               |
	| Labs               |
	| Map Lab Dictionary |

@ObjectiveEvidence @ReqID:US63653.11
Scenario: T11_Verify the study after associating the lab dictionary
	When I click on the study verify error link
	And I click on the warning Link "Lab Dictionary Mapping: One or more Lab Dictionary Test(s) have invalid mappings." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb         |
	| Home               |
	| Labs               |
	| Map Lab Dictionary |

@ObjectiveEvidence @ReqID:US63653.12
Scenario: T12_Verify the study after associating the lab dictionary
	When I click on the study verify error link
	And I click on the warning Link "Lab Dictionary Mapping: One or more Lab Dictionary Test(s) have invalid mappings." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb         |
	| Home               |
	| Labs               |
	| Map Lab Dictionary |

@ObjectiveEvidence @ReqID:US63653.13
Scenario: T13_publish the study file 
	When I click on the Study button
	And I click on the Link "Publish Study"
	And I see study publish dialog with title "Publish Study"
	And Enter Label for study publish as "LabDictMapping1"
	And I click on study publish continue button
	Then I should see the status of the study "Study Publish (Import_Study: LabDictMapping1)" in "Complete" state
	#And I click on the Link "Study Publish (Import_Study1: LabDictMapping1)"
	#Then I Study file should be downloaded

@ObjectiveEvidence @ReqID:US63653.14
Scenario: T14_When click the on form then I see the form questions page 
	When I click on the Home Button
	And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "TestForm"
	Then I should see the form questions page "TestForm/TestForm"

@ObjectiveEvidence @ReqID:US63653.15
Scenario: T15_Create CodeLists and CodeLists Items
	When I click on the Home Button
	And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "TestForm"
	And I add the below form question items and I should see the successful notification message
	| FormName | Qestionname | QuestionDisplayOption | QuestionItemName | ConditionalItemName | ConditionalComparator | ConditionalValue | DataGroup             | CodelistGroup | CodelistLiknage     | linkageItem | HeaderName | Keysequence |
	| TestForm | Continent   | Checkbox              | Country          | Country             | Not In List           | UG               | GroupManagemet (Edit) |               |                     |             |            |             |
	| TestForm | Country     |                       |                  |                     |                       |                  |                       | CodelistGroup | CountriesContinents | Continent   |            |             |
	| TestForm | dist        |                       |                  |                     |                       |                  |                       |               | StateDist           | State       | HeaderName | 1           |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study2)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I see error messages as below
	| Error                                                                                                                |
	| Question "Continent" - Cannot have checkbox as display opton since it is associated to linkage as a parent question. |
	| Question "Continent" - Cannot be ILS question as it is associated to a linkage as a parent question.                 |
	| Question "Continent" - Cannot be conditional question as it is associated to a linkage as a parent question.         |
	| Question "Country" - Cannot be assigned with both Codelist Group and Codelist Linkage.                                  |
	| Question "dist" - Cannot be assigned as a key sequence since it is associated to a linkage as a child question.     |

@ObjectiveEvidence @ReqID:US63653.16
Scenario: T16_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Continent" - Cannot have checkbox as display opton since it is associated to linkage as a parent question." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Forms      |
	| TestForm   |
	| Continent  |

@ObjectiveEvidence @ReqID:US63653.17
Scenario: T17_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Continent" - Cannot be ILS question as it is associated to a linkage as a parent question."
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Forms      |
	| TestForm   |
	| Continent  |

@ObjectiveEvidence @ReqID:US63653.18
Scenario: T18_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Continent" - Cannot be conditional question as it is associated to a linkage as a parent question."
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Forms      |
	| TestForm   |
	| Continent  |

@ObjectiveEvidence @ReqID:US63653.19
Scenario: T19_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Country" - Cannot be assigned with both Codelist Group and Codelist Linkage."
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Forms      |
	| TestForm   |
	| Country    |

@ObjectiveEvidence @ReqID:US63653.20
Scenario: T20_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "dist" - Cannot be assigned as a key sequence since it is associated to a linkage as a child question."
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Forms      |
	| TestForm   |
	| dist       |

@ObjectiveEvidence @ReqID:US63653.21
Scenario: T21_publish the study file 
	When I click on the Study button
	#And I click on the Link "View Study Jobs"
	#And select all processes check box
	#And click on delete button
	#And click breadcrumb item "Study"
	And I click on the Link "Publish Study"
	And I see study publish dialog with title "Publish Study"
	And Enter Label for study publish as "FormQuestion"
	And I click on study publish continue button
	Then I should see the status of the study "Study Publish (Import_Study2: FormQuestion)" in "Complete" state
	#And I click on the Link "Study Publish (Import_Study1: FormQuestion)"
	#Then Study file should be downloaded

@ObjectiveEvidence @ReqID:US63653.22
Scenario: T22_When click the on form then I see the form questions page 
	When I click on the Link "Linkages_Hidden"
	And I click on the Forms button
	And I click on the form "TestForm"
	Then I should see the form questions page "TestForm/TestForm"

@ObjectiveEvidence @ReqID:US63653.23
Scenario: T23_When I change the question property then I see the verification rule error/warning message to that question
    When I click on the Link "Continent"
	And select the radio button Question Hidden for parent question
    And click on form question save button
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Linkages_Hidden)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I see error messages as below
	| Error                                                                                          |
	| Question "Continent" - Cannot be hidden as it is associated to a linkage as a parent question. |

@ObjectiveEvidence @ReqID:US63653.24
Scenario: T24_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the error Link "Question "Continent" - Cannot be hidden as it is associated to a linkage as a parent question." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Forms      |
	| TestForm   |
	| Continent  |

@ObjectiveEvidence @ReqID:US63653.25
Scenario: T25_publish the study file 
	When I click on the Study button
	And I click on the Link "Publish Study"
	And I see study publish dialog with title "Publish Study"
	And Enter Label for study publish as "QuestionHidden"
	And I click on study publish continue button
	Then I should see the status of the study "Study Publish (Linkages_Hidden: QuestionHidden)" in "Complete" state
	#And I click on the Link "Study Publish (Linkages_Hidden : QuestionHidden)"
	#Then Study file should be downloaded

@ObjectiveEvidence @ReqID:US63653.26
Scenario: T26_When click the on form then I see the form questions page 
	When I click on the Home Button
	And I click on the Link "Linkages_Hidden"
	And I click on the Forms button
	And I click on the form "TestForm"
	Then I should see the form questions page "TestForm/TestForm"

@ObjectiveEvidence @ReqID:US63653.27
Scenario: T27_When I change the question property then I see the verification rule error/warning message to that question
    When I click on the Link "Continent"
	And select the radio button None for parent question 
    And click on form question save button
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Linkages_Hidden)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I do not see error messages as below
	| Error                                                                                          |
	| Question "Continent" - Cannot be hidden as it is associated to a linkage as a parent question. |

@ObjectiveEvidence @ReqID:US63653.28
Scenario: T28_When click the on form then I see the form questions page 
	When I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "TestForm"
	Then I should see the form questions page "TestForm/TestForm"

@ObjectiveEvidence @ReqID:US63653.29
Scenario: T29_Create CodeLists and CodeLists Items
	When I click on the Home Button
	And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "TestForm"
	And I add the below form question items and I should see the successful notification message
	| FormName | Qestionname | QuestionDisplayOption | QuestionItemName | ConditionalItemName | ConditionalComparator | ConditionalValue | DataGroup | CodelistGroup | CodelistLiknage | linkageItem | HeaderName | Keysequence |
	| TestForm | Continent   | Drop-Down             | Country          | --                  | --                    |                  | --        |               |                 |             |            |             |
	| TestForm | Country     |                       |                  |                     |                       |                  |           | --            | --              |             |            |             |
	| TestForm | dist        |                       |                  |                     |                       |                  |           |               | --              |             |            | --          |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study2)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I do not see error messages as below
	| Error                                                                                                                |
	| Question "Continent" - Cannot have checkbox as display opton since it is associated to linkage as a parent question. |
	| Question "Continent" - Cannot be ILS question as it is associated to a linkage as a parent question.                 |
	| Question "Continent" - Cannot be conditional question as it is associated to a linkage as a parent question.         |
	| Question "Country" - Cannot be assigned with both Codelist Group and Codelist Linkage.                                  |
	| Question "dist" - Cannot be assigned as a key sequence since it is associated to a linkage as a child question.     |

@ObjectiveEvidence @ReqID:US63653.30
Scenario: T30_When click on form then I see the form questions page 
    When I click on the Home Button 
    When I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "LabMappingForm"
	Then I should see the form questions page "LabMappingForm/LabMappingForm"

@ObjectiveEvidence @ReqID:US63653.31
Scenario: T31_When click on form then I see the form questions page 
    When I click on the Home Button 
    When I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "LabMappingForm"
	And I map the below form question items
	| FormName       | Qestionname     | Domain       | QuestionItemName  |
	| LabMappingForm | FormQuestion1   | LabElements  | CRFLabTests       |
	| LabMappingForm | FormQuestion2   | Lab_Elements | NonLabElement     |
	| LabMappingForm | AutoBuildTable  | LabElements  |                   |
	| LabMappingForm | Lab Id          | LabElements  | LabID             |
	| LabMappingForm | Company         | LabElements  | Company           |
	| LabMappingForm | Address         | LabElements  | LabAddress        |
	| LabMappingForm | Country         | LabElements  | Country1          |
	| LabMappingForm | Lab Name        | LabElements  | LabName           |
	| LabMappingForm | Collection Date | LabElements  | CRFCollectionDate |
	| LabMappingForm | FormQuestion3   | LabElements  | Precision         |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study2)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I see error warning messages as below
	| Error                                                                                                                                                                    |
	| Question "Lab Id" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab ID of instance "LabElements".                       |
	| Question "Lab Name" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Name of instance "LabElements".                   |
	| Question "Company" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Company of instance "LabElements".                     |
	| Question "Address" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Address of instance "LabElements".                 |
	| Question "Country" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Country of instance "LabElements".                     |
	| Question "Collection Date" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to CRF Collection Date of instance "LabElements". |
	| Form "LabMappingForm" - Must have all questions associated to lab elements of a same Lab mappings domain instance.                                                       |
	| Form "LabMappingForm" - Must have questions associated to Lab ID, CRF Lab Test Name, CRF Lab Value as it is associated to at least one lab element.                      |
	| Form "LabMappingForm" - Cannot have non autobuild table questions associated to all lab elements except Laboratory elements and CRF Collection Date.                     |
	And I see warning messages as below
	| Warning                                                                                                                    |
	| Form "LabMappingForm" - Not all mapped lab elements of lab domain instance "LabElements" are associated to form questions. |
	| Lab Mapping: For instance "LabElements" - One or more Lab Element(s) are not mapped to domain item.                        |
	| Lab Mapping: None of the Lab Mapping instance domain and domain items are assigned to Form.                                |

@ObjectiveEvidence @ReqID:US63653.32
Scenario: T32_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the Link "Import_Study2"
	And I click on the study verify error link
	And I click on the error Link "Question "Lab Id" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab ID of instance "LabElements"." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb     |
	| Home           |
	| Forms          |
	| LabMappingForm |
	| Lab Id         |

@ObjectiveEvidence @ReqID:US63653.33
Scenario: T33_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Lab Name" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Name of instance "LabElements"." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb     |
	| Home           |
	| Forms          |
	| LabMappingForm |
	| Lab Name       |

@ObjectiveEvidence @ReqID:US63653.34
Scenario: T34_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Company" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Company of instance "LabElements"." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb     |
	| Home           |
	| Forms          |
	| LabMappingForm |
	| Company        |

@ObjectiveEvidence @ReqID:US63653.35
Scenario: T35_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Address" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Address of instance "LabElements"." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb     |
	| Home           |
	| Forms          |
	| LabMappingForm |
	| Address        |

@ObjectiveEvidence @ReqID:US63653.36
Scenario: T36_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Country" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Country of instance "LabElements"." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb     |
	| Home           |
	| Forms          |
	| LabMappingForm |
	| Country        |

@ObjectiveEvidence @ReqID:US63653.37
Scenario: T37_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Question "Collection Date" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to CRF Collection Date of instance "LabElements"." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb      |
	| Home            |
	| Forms           |
	| LabMappingForm  |
	| Collection Date |

@ObjectiveEvidence @ReqID:US63653.38
Scenario: T38_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Form "LabMappingForm" - Must have questions associated to Lab ID, CRF Lab Test Name, CRF Lab Value as it is associated to at least one lab element." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb     |
	| Home           |
	| Forms          |
	| LabMappingForm |

@ObjectiveEvidence @ReqID:US63653.39
Scenario: T39_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Form "LabMappingForm" - Cannot have non autobuild table questions associated to all lab elements except Laboratory elements and CRF Collection Date." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb     |
	| Home           |
	| Forms          |
	| LabMappingForm |

@ObjectiveEvidence @ReqID:US63653.40
Scenario: T40_When I change the question property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the warning Link "Form "LabMappingForm" - Not all mapped lab elements of lab domain instance "LabElements" are associated to form questions." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb     |
	| Home           |
	| Forms          |
	| LabMappingForm |

@ObjectiveEvidence @ReqID:US63653.41
Scenario: T41_publish the study file 
	When I click on the Study button
	And I click on the Link "View Study Jobs"
	And select all processes check box
	And click on delete button
	And click breadcrumb item "Study"
	And I click on the Link "Publish Study"
	And I see study publish dialog with title "Publish Study"
	And Enter Label for study publish as "LabMappingForm"
	And I click on study publish continue button
	Then I should see the status of the study "Study Publish (Import_Study2: LabMappingForm)" in "Complete" state
	#And I click on the Link "Study Publish (Import_Study1: LabMappingForm)"
	#Then Study file should be downloaded

@ObjectiveEvidence @ReqID:US63653.42
Scenario: T42_When click on form then I see the form questions page 
    When I click on the Home Button 
    And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "LabMappingForm"
	Then I should see the form questions page "LabMappingForm/LabMappingForm"

@ObjectiveEvidence @ReqID:US63653.43
Scenario: T43_When click on form then I see the form questions page 
    When I click on the Home Button 
    And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "LabMappingForm"
	And I map the below form question items
	| FormName       | Qestionname     | Domain      | QuestionItemName |
	| LabMappingForm | FormQuestion1   | LabElements | LabValue         |
	| LabMappingForm | AutoBuildTable  | LabElements |                  |
	| LabMappingForm | Lab Id          | LabElements | NewLabID         |
	| LabMappingForm | Company         | LabElements | NewCompany       |
	| LabMappingForm | Address         | LabElements | NewAddress       |
	| LabMappingForm | Country         | LabElements | NewCountry       |
	| LabMappingForm | Lab Name        | LabElements | NewLabName       |
	| LabMappingForm | Collection Date | LabElements | NewColectionDate |
	| LabMappingForm | FormQuestion3   | LabElements | CRFLabTests      |
	| LabMappingForm | FormQuestion2   | LabElements | LabID            |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study2)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I do not see error messages as below
	| Error                                                                                                                                                                    |
	| Question "Lab Id" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab ID of instance "LabElements".                       |
	| Question "Lab Name" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Name of instance "LabElements".                   |
	| Question "Company" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Company of instance "LabElements".                     |
	| Question "Address" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Address of instance "LabElements".                 |
	| Question "Country" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Country of instance "LabElements".                     |
	| Question "Collection Date" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to CRF Collection Date of instance "LabElements". |
	| Form "LabMappingForm" - Must have questions associated to Lab ID, CRF Lab Test Name, CRF Lab Value as it is associated to at least one lab element.                      |
	| Form "LabMappingForm" - Must have all questions associated to lab elements of a same Lab mappings domain instance.                                                       |
	And I see error warning messages as below
	| Error                                                                                                                                                |
	| Form "LabMappingForm" - Cannot have non autobuild table questions associated to all lab elements except Laboratory elements and CRF Collection Date. |

@ObjectiveEvidence @ReqID:US63653.44
Scenario: T44_When click on form then I see the form questions page 
    When I click on the Home Button 
    And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "LabMappingForm"
	Then I should see the form questions page "LabMappingForm/LabMappingForm"

@ObjectiveEvidence @ReqID:US63653.45
Scenario: T45_When click on form then I see the form questions page 
    When I click on the Home Button 
    And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "LabMappingForm"
	And I map the below form question items
	| FormName       | Qestionname   | Domain      | QuestionItemName |
	| LabMappingForm | FormQuestion1 | LabElements | LabID            |
	| LabMappingForm | FormQuestion2 | LabElements | CRFLabTests      |
	| LabMappingForm | FormQuestion3 | LabElements | LabValue         |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study2)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I do not see error messages as below
	| Error                                                                                                                                                                    |
	| Question "Lab Id" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab ID of instance "LabElements".                       |
	| Question "Lab Name" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Name of instance "LabElements".                   |
	| Question "Company" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Company of instance "LabElements".                     |
	| Question "Address" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Address of instance "LabElements".                 |
	| Question "Country" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Country of instance "LabElements".                     |
	| Question "Collection Date" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to CRF Collection Date of instance "LabElements". |
	| Form "LabMappingForm" - Must have questions associated to Lab ID, CRF Lab Test Name, CRF Lab Value as it is associated to at least one lab element.                      |
	| Form "LabMappingForm" - Must have all questions associated to lab elements of a same Lab mappings domain instance.                                                       |
	And I see error messages as below
	| Error                                                                                                                                                |
	| Form "LabMappingForm" - Cannot have non autobuild table questions associated to all lab elements except Laboratory elements and CRF Collection Date. |

@ObjectiveEvidence @ReqID:US63653.46
Scenario: T46_When I go to form question and change the form question property then I do not see the verification rule error/warning message to that question
    When I click on the Home Button 
    And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "LabMappingForm"
	And I map the below form question items
	| FormName       | Qestionname   | Domain      | QuestionItemName |
	| LabMappingForm | FormQuestion1 | LabElements | LabName          |
	| LabMappingForm | FormQuestion2 | LabElements | LabID            |
	| LabMappingForm | FormQuestion3 | LabElements | Company          |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study2)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I see error warning messages as below
	| Error                                                                                                                                               |
	| Form "LabMappingForm" - Must have questions associated to Lab ID, CRF Lab Test Name, CRF Lab Value as it is associated to at least one lab element. |
	And I do not see error messages as below
	| Error                                                                                                                                                                    |
	| Question "Lab Id" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab ID of instance "LabElements".                       |
	| Question "Lab Name" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Name of instance "LabElements".                   |
	| Question "Company" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Company of instance "LabElements".                     |
	| Question "Address" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Address of instance "LabElements".                 |
	| Question "Country" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Country of instance "LabElements".                     |
	| Question "Collection Date" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to CRF Collection Date of instance "LabElements". |
	| Form "LabMappingForm" - Cannot have non autobuild table questions associated to all lab elements except Laboratory elements and CRF Collection Date.                     |
	| Form "LabMappingForm" - Must have all questions associated to lab elements of a same Lab mappings domain instance.                                                       |

@ObjectiveEvidence @ReqID:US63653.47
Scenario: T47_When click on form then I see the form questions page 
    When I click on the Home Button 
    And I click on the Link "Import_Study2"
	And I click on the Forms button
	And I click on the form "LabMappingForm"
	Then I should see the form questions page "LabMappingForm/LabMappingForm"

@ObjectiveEvidence @ReqID:US63653.48
Scenario: T48_When I go to form question and change the form question property then I do not see the verification rule error/warning message to that question
    When I click on the Link "FormQuestion3"
	And I map the below form question items
	| FormName       | Qestionname   | Domain      | QuestionItemName |
	| LabMappingForm | FormQuestion3 | LabElements | Precision        |
	And I click on the Home Button
	Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US63653.49
Scenario: T49_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Domains Button
	And I Click on "Add Domain" to add new Domain
	And enter DomainName as "NewDomain" 
	And enter DomainDesc as "NewDomain"
	And I click on the Domains Save button
	And I should see the notification "NewDomain has been successfully added"
	And Click on the Domain "NewDomain"
	Then I enter domain item details and each time when i add a new record success message should be displayed 
	| ItemName | Source | Datatype | Codelist | maxlen |
	| LabID2   | EDC    | Text     |          | 30     |
	| CRFCD    | EDC    | Text     |          | 30     |
	| CRFLT1   | EDC    | Text     |          | 30     |
	| CRFLU1   | EDC    | Text     |          | 30     |
	| LabTD1   | EDC    | Text     |          | 30     |

@ObjectiveEvidence @ReqID:US63653.50
Scenario: T50_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Domains Button
    And Click on the Domain "NewDomain"
	And I update domain item details and each time when i update record updated message should be displayed 
	| ItemName | Source   | Datatype | Codelist | maxlen |
	| LabID2   | External | Text     |          | 30     |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study)" in "Complete with Errors" state
	Then I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	And I see error messages as below
	| Error                                                                                                                                                 |
	| Lab Mapping: For Lab Element "LAB ID" on instance "NewDomain" - Mapping is invalid as domain item with source as External cannot be mapped.         |
	| Lab Mapping: For Lab Element "Collection Date" on instance "NewDomain" - Domain Item with data type other than Date cannot be mapped.               |
	| Lab Mapping: For Lab Element "CRF Lab Test Name" on instance "NewDomain" - Domain Item other than Codelist cannot be mapped.                        |
	| Lab Mapping: For Lab Element "CRF Lab (Original) Unit" on instance "NewDomain" - Domain Item other than Codelist cannot be mapped.                  |
	| Lab Mapping: For Lab Element "Lab Test Description" on instance "NewDomain" - Domain Item with source other than External cannot be mapped.         |
    And I see warning messages as below
	| Warning                                                                                           |
	| Lab Mapping: For instance "NewDomain" - One or more Lab Element(s) are not mapped to domain item. |
	| Lab Mapping: None of the Lab Mapping instance domain and domain items are assigned to Form.       |

@ObjectiveEvidence @ReqID:US63653.51
Scenario: T51_publish the study file 
	When I click on the Link "Import_Study"
	And I click on the Link "Publish Study"
	And I see study publish dialog with title "Publish Study"
	And Enter Label for study publish as "LabMapping"
	And I click on study publish continue button
	Then I should see the status of the study "Study Publish (Import_Study: LabMapping)" in "Complete" state
	#And I click on the Link "Study Publish (Import_Study1: LabMapping)"
	#Then Study file should be downloaded

@ObjectiveEvidence @ReqID:US63653.52
Scenario: T52_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Lab Mapping: For Lab Element "LAB ID" on instance "NewDomain" - Mapping is invalid as domain item with source as External cannot be mapped." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.53
Scenario: T53_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Lab Mapping: For Lab Element "Collection Date" on instance "NewDomain" - Domain Item with data type other than Date cannot be mapped." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.54
Scenario: T54_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Lab Mapping: For Lab Element "CRF Lab Test Name" on instance "NewDomain" - Domain Item other than Codelist cannot be mapped." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.55
Scenario: T55_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Lab Mapping: For Lab Element "CRF Lab (Original) Unit" on instance "NewDomain" - Domain Item other than Codelist cannot be mapped." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.56
Scenario: T56_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the error Link "Lab Mapping: For Lab Element "Lab Test Description" on instance "NewDomain" - Domain Item with source other than External cannot be mapped." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.57
Scenario: T57_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the warning Link "Lab Mapping: For instance "NewDomain" - One or more Lab Element(s) are not mapped to domain item." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.58
Scenario: T58_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the study verify error link
	And I click on the warning Link "Lab Mapping: None of the Lab Mapping instance domain and domain items are assigned to Form." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.59
Scenario: T59_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Domains Button
    And Click on the Domain "NewDomain"
	And I update domain item details and each time when i update record updated message should be displayed 
	| ItemName | Source   | Datatype | Codelist | maxlen |
	| LabID2   | Encoding | Text     |          | 30     |
	| CRFCD    | EDC      | Date     |          |        |
	| CRFLT1   | EDC      | Text     | LabTests |        |
	| CRFLU1   | EDC      | Text     | LabUnits |        |
	| LabTD1   | External | Text     |          | 30     |
	#And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study)" in "Complete with Errors" state
	Then I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	And I see error messages as below
	| Error                                                                                                                                                            |
	| Lab Mapping: For Lab Element "LAB ID" on instance "NewDomain" - Mapping is invalid as domain item with source as Encoding (or) Encoding Target cannot be mapped. |

@ObjectiveEvidence @ReqID:US63653.60
Scenario: T60_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the error Link "Lab Mapping: For Lab Element "LAB ID" on instance "NewDomain" - Mapping is invalid as domain item with source as Encoding (or) Encoding Target cannot be mapped." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.61
Scenario: T61_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Domains Button
    And Click on the Domain "NewDomain"
	And I update domain item details and each time when i update record updated message should be displayed 
	| ItemName | Source          | Datatype | Codelist | maxlen |
	| LabID2   | Encoding Target | Text     |          | 30     |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study)" in "Complete with Errors" state
	Then I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	And I see error messages as below
	| Error                                                                                                                                                            |
	| Lab Mapping: For Lab Element "LAB ID" on instance "NewDomain" - Mapping is invalid as domain item with source as Encoding (or) Encoding Target cannot be mapped. |

@ObjectiveEvidence @ReqID:US63653.62
Scenario: T62_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
	When I click on the error Link "Lab Mapping: For Lab Element "LAB ID" on instance "NewDomain" - Mapping is invalid as domain item with source as Encoding (or) Encoding Target cannot be mapped." 
	Then I see Parent question properties page and breadcrumb items in order
	| BreadCrumb |
	| Home       |
	| Labs       |

@ObjectiveEvidence @ReqID:US63653.63
Scenario: T63_Create Domain and Domain Items
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Domains Button
    And Click on the Domain "NewDomain"
	And I update domain item details and each time when i update record updated message should be displayed 
	| ItemName | Source | Datatype | Codelist | maxlen |
	| LabID2   | EDC    | Text     |          | 30     |
	And I click on the Study button
	And I click on the Link "Verify Study"
	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
	And I click Continue button on the study verify dialog
	And I should see the status of the study "Study Verify (Import_Study)" in "Complete with Errors" state
	And I click on the Link "Complete with Errors"
	And I should see the Verification Rules Messages dialog with title "Messages"
	Then I do not see error messages as below
	| Error                                                                                                                                                            |
	| Lab Mapping: For Lab Element "LAB ID" on instance "NewDomain" - Mapping is invalid as domain item with source as Encoding (or) Encoding Target cannot be mapped. |

@ObjectiveEvidence @ReqID:US63653.64
Scenario: T64_Create CodeLists and CodeLists Items
	When I click on the Home Button
	And I click on the Link "Import_Study1"
	And I click on the Codelists Button
	Then I add the below codelist items and I should see the successful notification message
	| CodeListname | CodePrefix | CodeItemDesc      | CodeItemValue     |
	| LabUnits     | 1          | CRF Lab Unit - 10 | CRF Lab Unit - 10 |
	| LabUnits     | 2          | CRF Lab Unit - 11 | CRF Lab Unit - 11 |
	| LabTests     | 1          | CRF Lab Test - 10 | CRF Lab Test - 10 |
	| LabTests     | 2          | CRF Lab Test - 11 | CRF Lab Test - 11 |

@ObjectiveEvidence @ReqID:US63653.65
Scenario: T65_Create CodeLists and CodeLists Items	
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Codelists Button
	And click on link "Groups" tab
	And I Click on "Add Group" to add new CodelistGroup
	And enter GroupName as "CodelistGroup1" 
	And enter GroupDesc as "CodelistGroup1"
	And I click on the CodelistGroup Save button
	And I should see the notification "CodelistGroup1 has been successfully added"
	And Click on the CodelistGroup "CodelistGroup1"
	And I select the Codelist "Countries" that we want to assign to group
	Then I add country name "France" and country description "France" to group clodelist items

@ObjectiveEvidence @ReqID:US63653.66
Scenario: T66_Create CodeLists and CodeLists Items	
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Codelists Button
	And click on link "Groups" tab
	And Click on the CodelistGroup "CodelistGroup1"
	And I select the Codelist "Countries" that we want to assign to group
	Then I add country name "France" and country description "France" to group clodelist items

@ObjectiveEvidence @ReqID:US63653.67
Scenario: T67_Remove CodeLists and CodeLists Items	
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Codelists Button
	And click on link "Groups" tab
	And Click on the CodelistGroup "CodelistGroup1"
	And I select the Codelist "Countries" that we want to assign to group
	Then I remove country name "France" and country description "France" to group clodelist items

@ObjectiveEvidence @ReqID:US63653.68
Scenario: T68_Create CodeLists and CodeLists Items	
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Codelists Button
	And click on link "Linkages" tab
	And I Click on "Add Linkage" to add new CodelistGroup
	And enter Linkage Name as "Linkage" 
	And enter LinkageDesc as "Linkage"
	And select primary codelist as "Continents"
	And select secondary codelist as "Countries"
	And I click on the Linkage Save button
	And I should see the notification "Linkage has been successfully added"
	And Click on the linkage link "CountriesContinents"
	And I click on the link to add/edit secondary Codelist item to the primary Codelist item "Africa"
	And I select the Codelist "Countries" that we want to assign to group
	Then I add country name "France" and country description "France" to group clodelist items

@ObjectiveEvidence @ReqID:US63653.69
Scenario: T69_Create CodeLists and CodeLists Items	
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Codelists Button
	And click on link "Linkages" tab
	And Click on the linkage link "CountriesContinents"
	And I click on the link to add/edit secondary Codelist item to the primary Codelist item "Africa"
	Then I add country name "France" and country description "France" to group clodelist items

@ObjectiveEvidence @ReqID:US63653.70
Scenario: T70_Create CodeLists and CodeLists Items	
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Codelists Button
	And click on link "Linkages" tab
	And Click on the linkage link "CountriesContinents"
	And I click on the link to add/edit secondary Codelist item to the primary Codelist item "Africa"
	Then I remove country name "France" and country description "France" to group clodelist items

@ObjectiveEvidence @ReqID:US63653.71
Scenario: T71_Create CodeLists and CodeLists Items
	When I click on the Home Button
	And I click on the Link "Linkages_22"
	And I click on the Labs Button
	Then I update the below codelist items in the attribute mappings
	| Male          | Female | NotSpecified |
	| Not Specified | Male   | Female       |


#@ObjectiveEvidence @ReqID:US63129.60
#Scenario: T60_When we create a study from existing study where the previous Labs option is Set to Yes then the study should be created with Labs Option Set to Yes
#    When I click on the Home Button
#	And I click on the Link "Create Study from Existing"	
#	And I select the create study from existing dialog having title "Create Study from Existing"
#	And I click on the study Link "Study1"
#	And Enter the unique study name "Study2"
#	And I select value "DataLabs 5.6x or 5.7x" from the "Target App:" drop down of Study page
#    And I see target app error dialog with title "Target App" and error message "Are you sure you want to change the Target App?"
#	And click on Continue button on the target app error dialog
#	And I click on the Save button
#	And I should see the notification "Study has been successfully added"
#	And I click on the Link "View Study Jobs"
#	Then I should see the status of the study "Create Study (Study2)" in "Complete" state

#@ObjectiveEvidence @ReqID:US63653.03a
#Scenario: T03a_Create CodeLists and CodeLists Items
#	#When I click on the Home Button
#	When I click on the Link "ImportStudy"
#	And I click on the Codelists Button
#	And I Click on "Add Codelist"
#	And enter CodelistName as "Codelist1" 
#	And enter CodelistDesc as "Codelist1"
#	And I click on the Codelist Save button
#	And Click on the Codelist "Codelist1"
#	And I Click on CodeList item "Add Item"
#	And enter codeprefix as "1"
#	And enter CodeDesc as "CodeValue1" 
#	And enter CodeValue as "CodeValue1"
#	And I click on the CodelistItem Save button
#	Then I should see the notification "CodeValue1 has been successfully added"
#
#
#@ObjectiveEvidence @ReqID:US63653.03c
#Scenario: T03c_LabMapping Domain
#	#When I click on the Home Button
#	When I click on the Link "ImportStudy"
#	And I click on the Labs Button
#	And I click on the tab Lab Mapping
#	And click on the add button for the newdomain
#	And select Lab Mapping DomainName "NewDomain"
#	And select LabId "NewLabID1" 
#	And select CRF Collection Date "collDate"
#	And select CRF LabTestName "CRFLTN"
#	And select CRF LabValue "CRFLV"
#	And select CRF LabUnit "CRFOU"
#	And click on Labmapping Save button
#	Then I click on the Home Button

#@ObjectiveEvidence @ReqID:US63653.08
#Scenario: T08_Verify the study after associating the lab dictionary
#    When I click on the Home Button
#	And I click on the Link "Import_Study1"
#	And I click on the Labs Button
#	And I click on the Link "Map Lab Dictionary"
#	And Select the LabDict name "LabDict1 (LabDict1) "
#	And select all lab test check box
#	And I click on the Link "Edit Selected"
#	And Select the Code Value for LabTest "LabTests-CRF Lab Test -1 (CRF Lab Test -1)"
#	And select the uncheck box display in RR table for any lab test
#	And click on the update save button
#	And I see lab test mapping update error dialog with title "Warning" and error message "One or more Lab Dictionary Tests have Display in Reference Range as "Yes" but not mapped to any Code Value (Code Description)."
#	And I click update Continue button on the lab test mapping error dialog
#    And I click on the tab "Lab Unit"
#	And select all lab unit check box
#	And I click on the Link "Edit Selected"
#	And Select the Code Value for LabUnit "LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1)"
#	And click on the update unit save button
#	#And Select the Code Value for LabTest "Codelist1-CodeValue1 (CodeValue1)"
#	#And I click on the tab "Lab Unit"
#	#And Select the Code Value for LabUnit "Codelist1-CodeValue1 (CodeValue1)"
#	#And I click lab dict Save button
#	And I click on the Codelists Button
#	And I click on the CodeList item "LabTests"
#	And select the codelist item "CRF Lab Test -1" check box
#	And I click on "Delete Items" link
#	And I see popup having title "Delete" and partial message "The selected Codelist Code(s) may be associated to a Codelist Group(s) or Linkage(s)."
#	And I click on yes button
#	And I click on the Codelists Button
#	And I click on the CodeList item "LabUnits"
#	And select the codelist item "CRF Lab Unit - 1" check box
#	And I click on "Delete Items" link
#	And I see popup having title "Delete" and partial message "The selected Codelist Code(s) may be associated to a Codelist Group(s) or Linkage(s)."
#	And I click on yes button
#	And I click on the Study button
#	And I click on the Link "Verify Study"
#	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
#	And I click Continue button on the study verify dialog
#	And I should see the status of the study "Study Verify (Import_Study1)" in "Complete with Errors" state
#	When I click on the Link "Complete with Errors"
#	And I should see the Verification Rules Messages dialog with title "Messages"
#	Then I see error warning messages as below
#	| Error                                                                                               |
#	| Lab Dictionary Mapping: At least one Lab Dictionary Test or Unit should be mapped to any code item. |
#	And I see warning messages as below
#	| Warning                                                                                              |
#	| Lab Dictionary Mapping: One or more Lab Dictionary Test(s) have invalid mappings.                    |
#	| Lab Dictionary Mapping: One or more Lab Dictionary Unit(s) have invalid mappings.                    |
#	| Lab Dictionary Mapping: None of the Lab Dictionary Test(s) have Display in Reference Ranges as "Yes" |

#@ObjectiveEvidence @ReqID:US63653.14
#Scenario: T14_Create CodeLists and CodeLists Items
#	When I click on the Home Button
#	When I click on the Link "ImportStudy"
#	And I click on the Codelists Button
#	And Click on the Codelist "LabTests"
#	And I Click on CodeList item "Add Item"
#	And enter codeprefix as "1"
#	And enter CodeDesc as "CRF Lab Test -1" 
#	And enter CodeValue as "CRF Lab Test -1"
#	And I click on the CodelistItem Save button
#	Then I should see the notification "1 CRF Lab Test -1 has been successfully added"

#@ObjectiveEvidence @ReqID:US63653.15
#Scenario: T15_Create CodeLists and CodeLists Items
#	When I click on the Home Button
#	When I click on the Link "ImportStudy"
#	And I click on the Codelists Button
#	#And I Click on "Add Codelist"
#	#And enter CodelistName as "Codelist1" 
#	#And enter CodelistDesc as "Codelist1"
#	#And I click on the Codelist Save button
#	And Click on the Codelist "LabUnits"
#	And I Click on CodeList item "Add Item"
#	And enter codeprefix as "1"
#	And enter CodeDesc as "CRF Lab Unit - 1" 
#	And enter CodeValue as "CRF Lab Unit - 1"
#	And I click on the CodelistItem Save button
#	Then I should see the notification "1 CRF Lab Unit - 1 has been successfully added"
#
#@ObjectiveEvidence @ReqID:US63653.41
#Scenario: T41_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
#    When I click on the Home Button
#	When I click on the Link "Linkages_22"
#	And I click on the Domains Button
#    And Click on the Domain "NewDomain"
#	And Click on edit icon for "NewLabID1"
#    And select the Codelist as "Codelist1"
#	And click on domain item source edit save button
#	And Click on edit icon for "collDate"
#    And select the Codelist as "Codelist1"
#	And click on domain item domaincollDate edit save button
#	And Click on edit icon for "CRFLTN"
#    And select the Codelist as "Codelist1" 
#	And click on domain item CRFLTN edit save button
#	And Click on edit icon for "CRFOU"
#    And select the Codelist as "Codelist1"
#	And click on domain item CRFOU edit save button
#	And Click on edit icon for "CRFLV"
#    And select the Codelist as "Codelist1"
#	And click on domain item CRFLV edit save button
#	Then I should see the domain NewDomain items with the updated codelist value

#@ObjectiveEvidence @ReqID:US63653.17
#Scenario: T17_When I change the question property then I see the verification rule error/warning message to that question
#    When I click on the Link "Continent" 
#	And select the parent question as "Checkbox" 
#	And select the Item name "Country"
#	And select the comparator "Not In List" 
#	And enter values "UG" to the parent question
#	And select the "GroupManagemet (Edit)" for the parent question
#	And click on form question save button
#    And I click on the Link "3. Country" 
#	And select the codelist group "CodelistGroup" 
#	And select the codelist linkage "CountriesContinents" 
#	And select the codelist linkage item "Continent" to the child question
#	And click on form question save button
#	And click on the autobuild child question "1.x.2. dist"
#	And enter headername "HeaderName" 
#	And select keysequence "1" to the autobuild table child question
#	And click on form question save button
#	And I click on the Study button
#	And I click on the Link "View Study Jobs"
#	And select all processes check box
#	And click on delete button
#	And I click Continue in Delete Jobs popup having title "Delete Jobs" and partial message "Are you sure you want to permanently delete"
#	And click breadcrumb item "Study"
#	And I click on the Link "Verify Study"
#	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
#	And I click Continue button on the study verify dialog
#	And I should see the status of the study "Study Verify (Import_Study1)" in "Complete with Errors" state
#	And I click on the Link "Complete with Errors"
#	And I should see the Verification Rules Messages dialog with title "Messages"
#	Then I see error messages as below
#	| Error                                                                                                                |
#	| Question "Continent" - Cannot have checkbox as display opton since it is associated to linkage as a parent question. |
#	| Question "Continent" - Cannot be ILS question as it is associated to a linkage as a parent question.                 |
#	| Question "Continent" - Cannot be conditional question as it is associated to a linkage as a parent question.         |
#	| Question "Country" - Cannot be assigned with both Codelist Group and Codelist Linkage.                                  |
#	| Question "dist" - Cannot be assigned as a key sequence since it is associated to a linkage as a child question.     |

#@ObjectiveEvidence @ReqID:US63653.31
#Scenario: T31_When I change the question property then I see the verification rule error/warning message to that question
#    When I click on the Link "Continent"
#	And select the parent question as "Drop-Down"
#	And select the Item name "--"
#	And select the comparator "--" 
#	And enter values "" to the parent question
#	And select the "--" for the parent question
#    And click on form question save button
#    And I click on the Link "3. Country"
#	And select the codelist group "--" 
#	And select the codelist linkage "--" 
#	#And select the codelist linkage item "Continent" to the child question
#    And click on form question save button
#	When click on the autobuild child question "1.x.2. dist"
#	And enter headername "" 
#	And select keysequence "--" to the table child question
#    And click on form question save button
#	And I click on the Study button
#	And I click on the Link "Verify Study"
#	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
#	And I click Continue button on the study verify dialog
#	And I should see the status of the study "Study Verify (Import_Study1)" in "Complete with Errors" state
#	And I click on the Link "Complete with Errors"
#	And I should see the Verification Rules Messages dialog with title "Messages"
#	Then I do not see error messages as below
#	| Error                                                                                                                |
#	| Question "Continent" - Cannot have checkbox as display opton since it is associated to linkage as a parent question. |
#	| Question "Continent" - Cannot be ILS question as it is associated to a linkage as a parent question.                 |
#	| Question "Continent" - Cannot be conditional question as it is associated to a linkage as a parent question.         |
#	| Question "Country" - Cannot be assigned with both Codelist Group and Codelist Linkage.                                  |
#	| Question "dist" - Cannot be assigned as a key sequence since it is associated to a linkage as a child question.     |

#
#@ObjectiveEvidence @ReqID:US63653.33
#Scenario: T33_When I change the question property then I see the verification rule error/warning message to that question
#    When I click on the Link "FormQuestion1"
#	And I select the Autobuild form domain "LabElements"
#	And select item name as "CRFLabTests"
#	And Click Save&Next button
#	And I select the Autobuild form domain "Lab_Elements"
#	And select item name as "NonLabElement"
#	And Click Save&Next button
#	And I select autobuild table domain name as "LabElements"
#	And Click on Save&Next button
#	And select item name as "LabID"
#	And Click Save&Next button
#	And select item name as "Company"
#	And Click Save&Next button
#	And select item name as "LabAddress"
#	And Click Save&Next button
#	And select item name as "Country1"
#	And Click Save&Next button
#	And select item name as "LabName"
#	And Click Save&Next button
#	And select item name as "CRFCollectionDate"
#	And Click Save&Next button
#	And select item name as "Precision"
#	And Click Save&Next button
#	And I click on the Study button
#	And I click on the Link "Verify Study"
#	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
#	And I click Continue button on the study verify dialog
#	And I should see the status of the study "Study Verify (Import_Study1)" in "Complete with Errors" state
#	And I click on the Link "Complete with Errors"
#	And I should see the Verification Rules Messages dialog with title "Messages"
#	Then I see error warning messages as below
#	| Error                                                                                                                                                                    |
#	| Question "Lab Id" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab ID of instance "LabElements".                       |
#	| Question "Lab Name" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Name of instance "LabElements".                   |
#	| Question "Company" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Company of instance "LabElements".                     |
#	| Question "Address" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Address of instance "LabElements".                 |
#	| Question "Country" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Country of instance "LabElements".                     |
#	| Question "Collection Date" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to CRF Collection Date of instance "LabElements". |
#	| Form "LabMappingForm" - Must have all questions associated to lab elements of a same Lab mappings domain instance.                                                       |
#	| Form "LabMappingForm" - Must have questions associated to Lab ID, CRF Lab Test Name, CRF Lab Value as it is associated to at least one lab element.                      |
#	| Form "LabMappingForm" - Cannot have non autobuild table questions associated to all lab elements except Laboratory elements and CRF Collection Date.                     |
#	And I see warning messages as below
#	| Warning                                                                                                                    |
#	| Form "LabMappingForm" - Not all mapped lab elements of lab domain instance "LabElements" are associated to form questions. |
#	| Lab Mapping: For instance "LabElements" - One or more Lab Element(s) are not mapped to domain item.                        |
#	| Lab Mapping: None of the Lab Mapping instance domain and domain items are assigned to Form.                                |

#
#@ObjectiveEvidence @ReqID:US63653.45
#Scenario: T45_When I go to form question and change the form question property then I do not see the verification rule error/warning message to that question
#    When I click on the Link "FormQuestion1"
#	And I select the Autobuild form domain "labElements"
#	And select item name as "LabValue"
#	And click on form question save button
#    And I click on the Link "3. AutoBuildTable"
#	And select autobuild table domainname "labElements"
#	And Click on Save&Next button
#	And select item name as "NewLabID"
#	And Click Save&Next button
#	And select item name as "NewCompany"
#	And Click Save&Next button
#	And select item name as "NewAddress"
#	And Click Save&Next button
#	And select item name as "NewCountry"
#	And Click Save&Next button
#	And select item name as "NewLabName"
#	And Click Save&Next button
#	And select item name as "NewColectionDate"
#	And Click Save&Next button
#	And select item name as "CRFLabTests"
#	And Click Save&Next button
#    And I click on the Link "FormQuestion2"
#	And I select the Autobuild form domain "labElements"
#	And select item name as "LabID"
#	And I click on the Study button
#	And I click on the Link "Verify Study"
#	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
#	And I click Continue button on the study verify dialog
#	And I should see the status of the study "Study Verify (Import_Study1)" in "Complete with Errors" state
#	And I click on the Link "Complete with Errors"
#	And I should see the Verification Rules Messages dialog with title "Messages"
#	Then I see error warning messages as below
#	| Error                                                                                                                                                |
#	| Form "LabMappingForm" - Cannot have non autobuild table questions associated to all lab elements except Laboratory elements and CRF Collection Date. |
#	And I do not see error messages as below
#	| Error                                                                                                                                                                    |
#	| Question "Lab Id" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab ID of instance "LabElements".                       |
#	| Question "Lab Name" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Name of instance "LabElements".                   |
#	| Question "Company" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Company of instance "LabElements".                     |
#	| Question "Address" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Lab Address of instance "LabElements".                 |
#	| Question "Country" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to Country of instance "LabElements".                     |
#	| Question "Collection Date" - Cannot be an autobuild table question as it is assigned with a domain item that is mapped to CRF Collection Date of instance "LabElements". |
#	| Form "LabMappingForm" - Must have questions associated to Lab ID, CRF Lab Test Name, CRF Lab Value as it is associated to at least one lab element.                      |
#	| Form "LabMappingForm" - Must have all questions associated to lab elements of a same Lab mappings domain instance.                                                       |

#@ObjectiveEvidence @ReqID:US63653.48
#Scenario: T48_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
#    When I click on the Home Button
#	And I click on the Link "Import_Study1"
#	And I click on the Domains Button
#    And Click on the Domain "LabElements"
#	And Click on edit icon for "LabID"
#	And select the source as "External"
#	And select the Datatype as "Text"
#	And enter the max len value as "20"
#	When click on domain item LabID edit save button
#	And Click on edit icon for "CRFCollectionDate"
#	And select the source as "EDC"
#	And select the Datatype as "Text"
#	#And enter the max len value as "20"	
#	And click on domain item domaincollDate edit save button
#	And Click on edit icon for "CRFLabTests"
#	And select the source as "EDC"
#	And select the Datatype as "Text" 
#	#And enter the max len value as "20"
#	And click on domain item CRFLTN edit save button
#	And Click on edit icon for "CRFLabUnits" 
#	And select the source as "EDC"
#	And select the Datatype as "Text"
#	#And enter the max len value as "20"	
#	And click on domain item CRFOU edit save button
#	And Click on edit icon for "LabTestDesc"
#	And select the source as "EDC"
#	And select the Datatype as "Text" 
#	#And enter the max len value as "20"
#	And click on domain item Lab Test Desc edit save button
#	And I click on the Study button
#	And I click on the Link "Verify Study"
#	And I see a study verify dialog with title "Verify Study" and verify message "The Verify Study action has been requested."
#	And I click Continue button on the study verify dialog
#	And I should see the status of the study "Study Verify (NewStudy)" in "Complete with Errors" state
#	Then I click on the Link "Complete with Errors"
#	And I see error messages as below
#	| Error                                                                                                                                                 |
#	| Lab Mapping: For Lab Element "LAB ID" on instance "LabElements" - Mapping is invalid as domain item with source as External cannot be mapped.         |
#	| Lab Mapping: For Lab Element "Collection Date" on instance "LabElements" - Domain Item with data type other than Date cannot be mapped.               |
#	| Lab Mapping: For Lab Element "CRF Lab Test Name" on instance "LabElements" - Domain Item other than Codelist cannot be mapped.                        |
#	| Lab Mapping: For Lab Element "CRF Lab (Original) Unit" on instance "LabElements" - Domain Item other than Codelist cannot be mapped.                  |
#	| Lab Mapping: For Lab Element "Lab Test Description" on instance "LabElements" - Domain Item with source other than External cannot be mapped.         |
#    And I see warning messages as below
#	| Warning                                                                                             |
#	| Lab Mapping: For instance "LabElements" - One or more Lab Element(s) are not mapped to domain item. |
#	| Lab Mapping: None of the Lab Mapping instance domain and domain items are assigned to Form.         |

#@ObjectiveEvidence @ReqID:US63653.57
#Scenario: T57_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
#    When I click on the Home Button
#	And I click on the Link "Import_Study1"
#	And I click on the Domains Button
#    And Click on the Domain "LabElements"
#	And Click on edit icon for "LabID"
#	And select the source as "Encoding"
#	And select the Datatype as "Text"
#	And click on domain item LabID edit save button
#	And Click on edit icon for "CRFCollectionDate"
#	And select the source as "EDC"
#	And select the Datatype as "Date" 
#	And click on domain item domaincollDate edit save button
#	And Click on edit icon for "CRFLabTests"
#	And select the source as "EDC"
#	And select the Datatype as "Text" 
#	And select the Codelist as "LabTests"
#	And click on domain item CRFLTN edit save button
#	And Click on edit icon for "CRFLabUnits" 
#	And select the source as "EDC"
#	And select the Datatype as "Text"
#	And select the Codelist as "LabUnits"
#	And click on domain item CRFOU edit save button
#	And Click on edit icon for "LabTestDesc"
#	And select the source as "External"
#	And select the Datatype as "Text" 
#	And click on domain item Lab Test Desc edit save button
#	When I click on the Study button
#	And I click on the Link "Verify Study"
#	And I click continue in verify study popup having title "Verify Study" and partial message "The Verify Study action has been requested."
#	And I should see the status of the study "Study Verify (Linkages_22)" in "Complete with Errors" state
#	Then I click on the Link "Complete with Errors"
#	And I see error messages as below
#	| Error                                                                                                                              |
#	| LAB ID" on instance "LabElements" - Mapping is invalid as domain item with source as Encoding (or) Encoding Target cannot be mapped. |

#@ObjectiveEvidence @ReqID:US63653.59
#Scenario: T59_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
#    When I click on the Home Button
#	And I click on the Link "Import_Study1"
#	And I click on the Domains Button
#    And Click on the Domain "LabElements"
#	And Click on edit icon for "LabID"
#	And select the source as "Encoding Target" 
#	And click on domain item LabID edit save button
#	When I click on the Study button
#	When I click on the Link "View Study Jobs"
#	And select all processes check box
#	And click on delete button
#	And I click Continue in Delete Jobs popup having title "Delete Jobs" and partial message "Are you sure you want to permanently delete"
#	And click breadcrumb item "Study"
#	And I click on the Link "Verify Study"
#	And I click continue in verify study popup having title "Verify Study" and partial message "The Verify Study action has been requested."
#	And I should see the status of the study "Study Verify (Import_Study1)" in "Complete with Errors" state
#	Then I click on the Link "Complete with Errors"
#	And I see error messages as below
#	| Error                                                                                                                                |
#	| LAB ID" on instance "LabElements" - Mapping is invalid as domain item with source as Encoding (or) Encoding Target cannot be mapped. |

#
#@ObjectiveEvidence @ReqID:US63653.61
#Scenario: T61_When I go to domain items and change the domain items property then I see the verification rule error/warning message to that question
#    When I click on the Home Button
#	And I click on the Link "Import_Study1"
#	And I click on the Domains Button
#    And Click on the Domain "LabElements"
#	And Click on edit icon for "LabID"
#	And select the source as "EDC" 
#	And click on domain item LabID edit save button
#	When I click on the Study button
#	When I click on the Link "View Study Jobs"
#	And select all processes check box
#	And click on delete button
#	And I click Continue in Delete Jobs popup having title "Delete Jobs" and partial message "Are you sure you want to permanently delete"
#	And click breadcrumb item "Study"
#	And I click on the Link "Verify Study"
#	And I click continue in verify study popup having title "Verify Study" and partial message "The Verify Study action has been requested."
#	And I should see the status of the study "Study Verify (Import_Study1)" in "Complete with Warnings" state
#	Then I click on the Link "Complete with Warnings"
#	And I do not see error messages as below
#	| Error                                                                                                                                |
#	| LAB ID" on instance "LabElements" - Mapping is invalid as domain item with source as Encoding (or) Encoding Target cannot be mapped. |

