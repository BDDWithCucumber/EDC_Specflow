Feature: DataLabs_V5.8.0_Designer Lab Components Data Setup
	Test Summary:
	1. Data Setup for Lab Mappings
	2. Data Setup for Attribute Mappings (Codelist Mappings)
	3. Data Setup for Lab Dictionary mappings

@ObjectiveEvidence @ReqID:US63653.01
Scenario: T01_When I Login to Designer then I see the Designer home page
	Given I logged in to Designer
	Then I see Designer Home Page

@ObjectiveEvidence @ReqID:US63653.02
Scenario: T02_Create CodeLists and CodeLists Items
	When I click on the Home Button
	And I click on the Link "Linkages_22"
	And I click on the Labs Button
	Then I add the below labs items and I should see the successful notification message
	| GenderEvent | GenderForm | GenderItem      | DOBAge | DOBEvent | DOBForm  | DOBItem   | Male | Female | NotSpecified  | DOBEvent1 | DOBForm1 | DOBItem1           | DOBEvent2 | DOBForm2 | DOBItem2  |
	| Event1      | TestForm   | Gender (Gender) | Age    | Event1   | TestForm | Age (Age) | Male | Female | Not Specified | Event1    | TestForm | AgeUnits (AgeUnit) | Event1    | TestForm | Age (Age) |

@ObjectiveEvidence @ReqID:US63653.03
Scenario: T03_Create CodeLists and CodeLists Items
	When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Labs Button
	And I click on the "Lab Mapping" tab
	Then I add the below labs items for domain "NewDomain" and I should see the successful notification message
	| MappingElement                           | RowNo | DomainItem         |
	| Lab Id                                   | 2     | LabId              |
	| Lab Name                                 | 3     | LabName            |
	| Company                                  | 4     | Company            |
	| Lab Address                              | 5     | LabAddress         |
	| Country                                  | 6     | Country            |
	| CRF Collection Date                      | 8     | CRFCollectionDate  |
	| CRF Lab Test Name                        | 9     | CRFLabTestName     |
	| Lab Test Description                     | 10    | LabTestDescription |
	| CRF Lab Value *                          | 11    | CRFLabValue        |
	| CRF Lab (Original) Unit *                | 12    | CRFLabUnit         |
	| Lab Test Name                            | 14    | LabTestName        |
	| Lab Test Code                            | 15    | LabTestCode        |
	| LOINC Code                               | 16    | LOINCCode          |
	| Category                                 | 17    | Category           |
	| Subcategory                              | 18    | Subcategory        |
	| Specimen                                 | 19    | Specimen           |
	| Method                                   | 20    | Method             |
	| Result Type                              | 21    | ResultType         |
	| Normal Reference Range Low               | 23    | NRRL               |
	| Normal Reference Range High              | 24    | NRRH               |
	| Critical Reference Range Low             | 25    | CRRL               |
	| Critical Reference Range High            | 26    | CRRH               |
	| Reference Range Not Applicable           | 27    | RRNA               |
	| Reference Range ID                       | 28    | RRID               |
	| Out of Normal Range Indicator            | 29    | OutofNRI           |
	| Normalized Patient Lab Value             | 31    | NPLV               |
	| Normalized Lab Unit                      | 32    | NLU                |
	| Normalized Normal Reference Range Low    | 33    | NNRRL              |
	| Normalized Normal Reference Range High   | 34    | NNRRH              |
	| Normalized Critical Reference Range Low  | 35    | NCRRL              |
	| Normalized Critical Reference Range High | 36    | NCRRH              |
	| Precision                                | 37    | Precision          |
	| Conversion Factor                        | 38    | Conversion Factor  |

@ObjectiveEvidence @ReqID:US63653.04
Scenario: T04_Create CodeLists and CodeLists Items
    When I click on the Home Button
	And I click on the Link "Import_Study"
	And I click on the Labs Button
	And I click on the Link "Map Lab Dictionary"
	And Select the LabDict name "LabDict1 (LabDictDesc1) "
	And click on the tab Lab Test and select the below lab tests
	| LabTestName                                | DisplayinRR |
	| LabTests-CRF Lab Test -1 (CRF Lab Test -1) | Yes         |
	And click on the tab Lab Unit and select the below lab units
	| LabTestName                                  |
	| LabUnits-CRF Lab Unit - 1 (CRF Lab Unit - 1) |
	And I click on map lab dict Save button
