Feature: WebserviceScenarios
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers

@mytag
Scenario: Add a new patient
	When I add a new patient using AddNewPatient webservice with below data.
	| SiteIDData | ScreenIDData | PatientInitialsData | ScreenedDateData |
	| 01         | 114          | PAT                 | 06/13/2018       |
	Then The response should contain success status code as "200".

Scenario: Add a Patient using CDISC service 
	When I add a new patient using ConsumeODMStrAddNewPatients webservice with below data and odmfile.
	| ODMDATA                   | AddNewPatientsDATA |
	| AddPatientUsingCDISC1.xml | true               |
	Then The response should contain success status code as "200".

Scenario: Get Metadata from PatientAndOperationalDataEventing webservice
	When I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice
	| StudyNameData    | ProtocolVersionData | ResponseFile      |
	| Test3210_Pscript | 1.0                 | testMetaData2.xml |
	


Scenario: Add Form Data using CDISC webservice ConsumeODM1_StrTransactional method
	When I add item data using ConsumeODMStrTransactional webservice with below data and odmfile.
	| TransactionTypeData | AddNewPatientsData | ODMDATA                  |
	| Transactional       | false              | UpdateItemDataCDISC1.xml |
	
Scenario: Add a Form level DCF using DCF WebSerive
	When I add a Form Level DCF using DCF CreateFormLevelDCF webservice with below data.
	| StudyNameData    | SubjectKeyData | PatientIdentityData | SiteIdData | EventNameData  | FormNameData | QueryDescriptionData | ActionRequestData | DCFStatusData | CustomProperty1ItemNameData | CustomProperty2ItemNameData | QueryCategoryData | CategoryStatusData |
	| Test3210_FoStPsc | 01-Pat         | 01-Pat              | 01         | Visit (Week 2) | Form1        | TestQueryDesc        | ActionReq         | Draft         |                             |                             |                   |                    |
	Then The response should contain success status code as "200".
Scenario: Add Item level DCF using DCF WebService
	When I add a Item Level DCF using DCF CreateItemLevelDCF webservice with below data.
	| StudyNameData    | SubjectKeyData | PatientIdentityData | SiteIdData | EventNameData  | FormNameData | ItemNameData | DataRowData | QueryDescriptionData | ActionRequestData | DCFStatusData | CustomProperty1ItemNameTestData | CustomProperty2ItemNameTestData | QueryCategoryData | CategoryStatusData |
	| Test3210_Pscript | 001-Patient    | 001-Patient         | 01         | Visit (Week 2) | Form1        | Text         | 1           | TestQueryDesc        | ActionReq         | Sent          |                                 |                                 | Coding            | Yes                |
	Then The response should contain success status code as "200".

Scenario: Update Item data of an existing patient
	When I update existing item data of a patient "01-PAT" using ConsumeODMStrTransactional webservice with below data and odmfile.
	| TransactionTypeData | AddNewPatientsData | ODMDATA                              |
	| Transactional       | false              | 01_PAT_LabForm2_Data_CDISCUpdate.xml |
	Then The response should contain success status code as "200".

Scenario: Get the Labs details
	When I Get the Lab details from API.
	Then The response should contain success status code as "200".
