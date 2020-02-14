Feature: DataLabs_V5.7.0_ODMEventingItemUpdate_DerivationManagement
	
	Test Summary:
	1. Verification of ODM eventing xml for Item Update when flat question Item is updated on Derivation
	2. Verification of ODM eventing xml for Item Update When table question Item is updated on deriviation
	3. Verification of ODM eventing xml for Item Update When Autobuild table question Item is updated on deriviation
	4. Verification of ODM eventing xml for Item Update When question Item is updated on deriviation during minor study update
	5. Verification of ODM eventing xml for Item Update When Derivation status is changed from inactive to active
	6. Verification of ODM is not evented for Item Update when derivation status is made inactive.

Scenario: T01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page
	
Scenario: T02_Delete the current study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: T03_Publish the study
	When I click breadcrumb "Study Management"
	And I upload a study "Test4500_DerivationUpdate.zip" with study label "Test4500"
	Then I see study label "Test4500" in header

Scenario: T04_Add Site 01-Site
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	And I click breadcrumb "Site Management"

Scenario: T05_Navigate to the Edit Preferences page and set the CRF Default save to Complete and update the Endpoint URL
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Partial" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then The CRF with data is saved and checked-in successfully.

Scenario: T06_Add patient 01-PAT from Datalabs UI
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I add patient with below details.
	| ScreenID | PatientInitials | ScreenDate |
	| 01       | PAT             | 06/13/2018 |
	Then I see below patients added in the Patients table.
	| PatientID |
	| 01-PAT    |

Scenario: T07_Select and enroll patient 01-PAT.
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	And I select the patient "01-PAT" from patients table.
	When I enroll the patient "01-PAT" with below data.
	| EnrollID | EnrollDate | EntryComplete |
	| 01       | 06/13/2018 | Yes           |
	Then I see patient "01-PAT" status as "Enrolled" on Patient details page.

Scenario: T08_Update the derivation (AB_Constant_Date) to Inactive.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "AB_Constant_Date" in DerivationManagementPage
	And I Select "Inactive" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T09_Update the derivation (AB_Constant_Float) to Inactive.
	Given I click derivation "AB_Constant_Float" in DerivationManagementPage
	And I Select "Inactive" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T10_Update the derivation (AB_Constant_Integer) to Inactive.
	Given I click derivation "AB_Constant_Integer" in DerivationManagementPage
	And I Select "Inactive" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T11_Update the derivation (AB_Constant_Text) to Inactive.
	Given I click derivation "AB_Constant_Text" in DerivationManagementPage
	And I Select "Inactive" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T12_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

# Date Derivations. 
	
Scenario: T13_Navigate to visit 51, Auto build Form2 check out Form, Add new row and Save the Form.
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click on "Add New Row" button in "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I click on "Save & Close" button on "AutoBuild Form02" CRF.

Scenario: T14_Verify the inactive derivation(AB_Constant_Date) question item value should be blank in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "Text" items are displayed for "Constant Date:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| [Blank]      |
	And I click on "Cancel" button on "AutoBuild Form02" CRF.

Scenario: T15_Verify the inactive derivation(AB_Constant_Date) question item value should be blank in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	And I click on "Add New Row" button in "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table.
	Then I verify below "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table questions answer data status in the CRF.
	 | RowNumber | QuestionPrompt     | AnswerFieldType | State    | SkipRowExpand |
	 | 1         | Derived Date field | TextBox         | Disabled | Yes           |
	And I click on "Cancel" button on "AutoBuild Form04" CRF.

### Float Derivations
Scenario: T16_Verify the inactive derivation(AB_Constant_Float) question item value should be blank in CRF(Visit (Week51),Auto build Form1)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	Then I verify below "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" table questions answer data status in the CRF.
   | RowNumber | QuestionPrompt        | AnswerFieldType | State    |
   | 1         | Constant value of 5.5 | TextBox         | Disabled |
	And I click on "Cancel" button on "AutoBuild Form01" CRF.

Scenario: T17_Verify the inactive derivation(AB_Constant_Float) question item value should be blank in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "TextBox" items are displayed for "Constant Float:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| [Blank]      |
	And I click on "Cancel" button on "AutoBuild Form02" CRF.

Scenario: T18_Verify the inactive derivation(AB_Constant_Float) question item value should be blank in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	And I click on "Add New Row" button in "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table.
	Then I verify below "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table questions answer data status in the CRF.
   | RowNumber | QuestionPrompt       | AnswerFieldType | State    | SkipRowExpand |
   | 1         | Derived Float field: | TextBox         | Disabled | Yes           |
	And I click on "Cancel" button on "AutoBuild Form04" CRF.

Scenario: T19_Verify the inactive derivation(AB_Constant_Float) question item value should be blank in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	Then I verify below "Key Sequence is on questions #2 & #3. Maximum Table Rows is 15:" table questions answer data status in the CRF.
	  | RowNumber | QuestionPrompt | AnswerFieldType | State    | 
	  | 5         | Float value:   | TextBox         | Disabled | 
	And I click on "Cancel" button on "AutoBuild Form04" CRF.
	
### Integer Derivation

Scenario: T20_Verify the inactive derivation(AB_Constant_Integer) question item value should be blank in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "TextBox" items are displayed for "Constant Integer:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| [Blank]      |
	And I click on "Cancel" button on "AutoBuild Form02" CRF.

Scenario: T21_Verify the inactive derivation(AB_Constant_Integer) question item value should be blank in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	Then I verify below "Key Sequence is on question (1-3). Table Structure is Open. Maximum Table Rows are 10. There are conditional questions.:" table questions answer data status in the CRF.
	  | RowNumber | QuestionPrompt        | AnswerFieldType | State    |
	  | 4         | Derived Integer Field | TextBox         | Disabled |
	And I click on "Cancel" button on "AutoBuild Form04" CRF.

### Text derivation
Scenario: T22_Verify the inactive derivation(AB_Constant_Text) question item value should be blank in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "TextBox" items are displayed for "Constant Text Value:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| [Blank]      |
	And I click on "Cancel" button on "AutoBuild Form02" CRF.

Scenario: T23_Verify the inactive derivation(AB_Constant_Integer) question item value should be blank in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	Then I verify below "Key Sequence is on question (1-3). Table Structure is Open. Maximum Table Rows are 10. There are conditional questions.:" table questions answer data status in the CRF.
	| RowNumber | QuestionPrompt     | AnswerFieldType | State    |
	| 7         | Derived Text Field | TextBox         | Disabled |
	Then I verify below "Key Sequence is on questions #2 & #3. Maximum Table Rows is 15:" table questions answer data status in the CRF.
	| RowNumber | QuestionPrompt | AnswerFieldType | State    |
	| 6         | Text Value:    | TextBox         | Disabled |
	And I click on "Cancel" button on "AutoBuild Form04" CRF.

Scenario: T24_Update the derivation(AB_Constant_Date) status to Active.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "AB_Constant_Date" in DerivationManagementPage
	And I Select "Active" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T25_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

### Verify derived values for (AB_Constant_Date) derivation.
Scenario: T26_Verify the active derivation question item value should be derived in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "TextBox" items are displayed for "Constant date:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| [04/30/1975  |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	And I click on "Save & Close" button on "AutoBuild Form02" CRF.
	
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T27_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual1.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="AB_Date03" TransactionType="Update" Value="04/30/1975"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected1.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual1.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |
Scenario: T28_Verify the active derivation question item value should be derived in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	And I click on "Add New Row" button in "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table.
	And I expand row "1" of table "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:"
	Then I verify below "TextBox" items are displayed for "Derived Date field" question in row "1" of "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table.
	| ItemToVerify |
	| 04/30/1975   |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:"
	And I click on "Save & Close" button on "AutoBuild Form04" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T29_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual2.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="AB_Date07" TransactionType="Insert" Value="04/30/1975"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected2.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual2.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |
############ (AB_Constant_Float) derivation
Scenario: T30_Update the derivation(AB_Constant_Float) status to Active.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "AB_Constant_Float" in DerivationManagementPage
	And I Select "Active" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T31_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

### Verify derived values for (AB_Constant_Float) derivation
Scenario: T32_Verify the active derivation(AB_Constant_Float) question item value should be Updated to (34.76) in CRF(Visit (Week51),Auto build Form1)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form01" CRF.
	When I click "Checkout" button on "AutoBuild Form01" CRF.
	Then I verify below "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:" table questions data in the CRF.
	| RowNumber | QuestionPrompt        | AnswerValue | AnswerFieldType |
	| 1         | Constant value of 5.5 | 34.76       | TextBox         |
	And I click table row button "Save & Close Row" of table "Key Sequence on question #2. Table Structure is fixed. Maximum Rows is not exact. Questions (4-7) are derives.:"
	And I click on "Save & Close" button on "AutoBuild Form01" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T33_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual3.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="AB_Float01" TransactionType="Insert" Value="34.76"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected3.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual3.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T34_Verify the active derivation(AB_Constant_Float) question item value should be Updated to (34.76) in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "Text" items are displayed for "Constant Float:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| 34.76        |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	And I click on "Save & Close" button on "AutoBuild Form02" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T35_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual4.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%"AB_Float03" TransactionType="Update" Value="34.76"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected4.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual4.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T36_Verify the activated derivation(AB_Constant_Float) question item value should be update to (34.76) in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:"
	Then I verify below "Text" items are displayed for "Derived Float field:" question in row "1" of "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table.
	| ItemToVerify |
	| 34.76        |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:"
	And I click on "Save & Close" button on "AutoBuild Form04" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T37_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual5.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="AB_Float07" TransactionType="Update" Value="34.76"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected5.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual5.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T38_Verify the activated derivation(AB_Constant_Float) question item value should be update to (34.76) in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	Then I verify below "Key Sequence is on questions #2 & #3. Maximum Table Rows is 15:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue | AnswerFieldType |
	| 5         | Float value:   | 34.76       | Text            |
	And I click table row button "Save & Close Row" of table "Key Sequence is on questions #2 & #3. Maximum Table Rows is 15:"
	And I click on "Save & Close" button on "AutoBuild Form04" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T39_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual6.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="AB_Float08" TransactionType="Update" Value="34.76"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected6.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual6.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

############ AB_Constant_Integer derivation.
Scenario: T40_Update the derivation(AB_Constant_Integer) status to Active.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "AB_Constant_Integer" in DerivationManagementPage
	And I Select "Active" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T41_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

### Verify derived values for (AB_Constant_Integer) derivation
Scenario: T42_Verify the activated derivation(AB_Constant_Integer) question item value should be updated to 37 in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "TextBox" items are displayed for "Constant Integer:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| 37           |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	And I click on "Save & Close" button on "AutoBuild Form02" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T43_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual7.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="AB_Integer03" TransactionType="Update" Value="37"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected7.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual7.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T44_Verify the activated derivation(AB_Constant_Integer) question item value should be 37 in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	Then I verify below "Key Sequence is on question (1-3). Table Structure is Open. Maximum Table Rows are 10. There are conditional questions.:" table questions data in the CRF.
	| RowNumber | QuestionPrompt        | AnswerValue | AnswerFieldType |
	| 4         | Derived Integer Field | 37          | Text            |
	And I click table row button "Save & Close Row" of table "Key Sequence is on question (1-3). Table Structure is Open. Maximum Table Rows are 10. There are conditional questions.:"
	And I click on "Save & Close" button on "AutoBuild Form04" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T45_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual8.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="AB_Integer06" TransactionType="Update" Value="37"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected8.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual8.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

############ derivation(AB_Constant_Text)
Scenario: T46_Update the derivation(AB_Constant_Text) status to Active.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "AB_Constant_Text" in DerivationManagementPage
	And I Select "Active" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T47_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

### Verify derived values for (AB_Constant_Text) derivation
Scenario: T48_Verify the inactive derivation(AB_Constant_Text) question item value should be "This is a Constant value" in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "TextBox" items are displayed for "Constant Text Value:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify             |
	| This is a Constant value |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	And I click on "Cancel" button on "AutoBuild Form02" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T49_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual9.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="AB_Text03" TransactionType="Update" Value="This is a Constant value"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected9.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual9.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T50_Verify the inactive derivation(AB_Constant_Integer) question item value should be "This is a Constant value" in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	Then I verify below "Key Sequence is on question (1-3). Table Structure is Open. Maximum Table Rows are 10. There are conditional questions.:" table questions data in the CRF.
	| RowNumber | QuestionPrompt     | AnswerValue              | AnswerFieldType |
	| 7         | Derived Text Field | This is a Constant value | Text            |                 
	And I click table row button "Save & Close Row" of table "Key Sequence is on question (1-3). Table Structure is Open. Maximum Table Rows are 10. There are conditional questions.:"
	And I click on "Save & Close" button on "AutoBuild Form04" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T51_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual10.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="AB_Text06" TransactionType="Update" Value="This is a Constant value"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected10.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual10.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |


Scenario: T52_Verify the inactive derivation(AB_Constant_Integer) question item value should be "This is a Constant value" in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	Then I verify below "Key Sequence is on questions #2 & #3. Maximum Table Rows is 15:" table questions data in the CRF.
	| RowNumber | QuestionPrompt | AnswerValue              | AnswerFieldType | 
	| 6         | Text Value:    | This is a Constant value | Text            |      
	And I click table row button "Save & Close Row" of table "Key Sequence is on questions #2 & #3. Maximum Table Rows is 15:"
	And I click on "Save & Close" button on "AutoBuild Form04" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T53_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual11.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemData ItemOID="AB_Text08" TransactionType="Update" Value="This is a Constant value"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected11.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual11.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T54_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 
################################################################################################################################
### Visit (Week 06)---PM Check Forms
###Derivation D_Study_ID

Scenario: T55_Update the derivation (D_Study_ID) to Inactive.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "D_Study_ID" in DerivationManagementPage
	And I Select "Inactive" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T56_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

### PM check status(D_Study_ID) Derivations. 
Scenario: T57_Verify the inactive derivation(D_Study_ID) question item value should be blank in CRF(Visit (Week6),PM Check (Study))
	Given I expand "Visit (Week 6)" to select and open "PM Check (Study)" CRF.
	When I click "Checkout" button on "PM Check (Study)" CRF.
	Then I verify below flat questions status in the CRF.
      | QuestionPrompt         | AnswerValue | AnswerFieldType | State    |
      | Study Name (Study.ID): |             | TextBox         | Disabled |
	And I click on "Cancel" button on "PM Check (Study)" CRF.

Scenario: T58_Update the derivation (D_Study_ID) to Active.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "D_Study_ID" in DerivationManagementPage
	And I Select "Active" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T59_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

### PM check status(D_Study_ID) Derivations. 
Scenario: T60_Verify the inactive derivation(D_Study_ID) question item value should be blank in CRF(Visit (Week6),PM Check (Study))
	Given I expand "Visit (Week 6)" to select and open "PM Check (Study)" CRF.
	When I click "Checkout" button on "PM Check (Study)" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt         | AnswerValue     | AnswerFieldType |
	| Study Name (Study.ID): | Test4500_deriva | TextBox         |
	And I click on "Save & Close" button on "PM Check (Study)" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T61_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual12.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="Study_ID" TransactionType="Insert" Value="Test4500_deriva"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected12.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual12.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |


### Derivation D_Site_ID
Scenario: T62_Update the derivation (D_Site_ID) to Inactive.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "D_Site_ID" in DerivationManagementPage
	And I Select "Inactive" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T63_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

### PM check status(D_Site_ID) Derivations. 
Scenario: T64_Verify the inactive derivation(D_Site_ID) question item value should be blank in CRF(Visit (Week6),PM Check (Site))
	Given I expand "Visit (Week 6)" to select and open "PM Check (Site)" CRF.
	When I click "Checkout" button on "PM Check (Site)" CRF.
	Then I verify below flat questions status in the CRF.
      | QuestionPrompt     | AnswerValue | AnswerFieldType | State    |
      | Site ID (Site.ID): |             | TextBox         | Disabled |
	And I click on "Cancel" button on "PM Check (Site)" CRF.

Scenario: T65_Update the derivation (D_Site_ID) to Active.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Derivation Management" In StudyAdministrationPage
	And I click derivation "D_Site_ID" in DerivationManagementPage
	And I Select "Active" from Status field in DerivationManagementPage
	And I click on "Save" button in DerivationMangementPage
	Then I see success message "Save Successfully."

Scenario: T66_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

### PM check status(D_Site_ID) Derivations. 
Scenario: T67_Verify the inactive derivation(D_Site_ID) question item value should be blank in CRF(Visit (Week6),PM Check (Site))
	Given I expand "Visit (Week 6)" to select and open "PM Check (Site)" CRF.
	When I click "Checkout" button on "PM Check (Site)" CRF.
	Then I verify below flat questions data in the CRF.
	| QuestionPrompt     | AnswerValue | AnswerFieldType |
	| Site ID (Site.ID): | 01          | TextBox         |
	And I click on "Save & Close" button on "PM Check (Site)" CRF.
	Then The CRF with data is saved and checked-in successfully.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T68_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual13.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="Site_ID" TransactionType="Insert" Value="01"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected13.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual13.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

###################################################################################################################################

##### Study Update derivations.

#### Update the derivation value and Verify the updated Value

Scenario: T69_Publish the study for minor update
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_DerivationUpdateStudyUpdate1.zip" with Label "V2"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select scripting "Derivations" in PublishStudyPage of MinorStudyUpdate
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                   |
	| Derivations: #1 - complete. View summary. |
	| Publishing of Study file (V2) - complete. |


Scenario: T70_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

Scenario: T71_verify the updated value should be derived in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "TextBox" items are displayed for "Constant Date:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| 05/29/1976   |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	And I click on "Save & Close" button on "AutoBuild Form02" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T72_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual14.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="AB_Date03" TransactionType="Update" Value="05/29/1976"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected14.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual14.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T73_Verify the active derivation question item value should be derived in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:"
	Then I verify below "TextBox" items are displayed for "Derived Date field" question in row "1" of "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table.
	| ItemToVerify |
	| 05/29/1976   |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:"
	And I click on "Save & Close" button on "AutoBuild Form04" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T74_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual15.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="AB_Date07" TransactionType="Update" Value="05/29/1976"%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected15.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual15.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |	
	|         | SourceSystemVersion |

#### Make the derivation value Blank and verify CRF
	
Scenario: T75_Publish the study
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Manage Versions" in "StudyResetAction" ActionPalette
	And I click ActionPalette Item "Upload Study File" in "StudyVersionMgmtListActions" ActionPalette
	And I click browse button in upload study file page
	And I upload study "Test4500_DerivationUpdateStudyUpdate2.zip" with Label "V3"
	And I open study which has "Uploaded" status
	And I click ActionPalette Item "Stage" in "StudyVersionPropertiesActions" ActionPalette
	And I open study which has "Staged" status
	And I click ActionPalette Item "Publish" in "StudyVersionPropertiesActions" ActionPalette
	And I select "Yes" to reevaluate "Change SD-Verify Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change D-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change M-Review Flags?" in PublishStudyFlagsPage
	And I select "Yes" to reevaluate "Change Signatures?" in PublishStudyFlagsPage
	And I clicked Continue button in PublishStudyFlagsPage
	And I select scripting "Derivations" in PublishStudyPage of MinorStudyUpdate
	And I click Publish button in PublishStudyPage of MinorStudyUpdate
	And I navigate to "Inbox" tab from main menu.
	Then I check subjects in inbox folder "Jobs"
	| Subject                                   |
	| Derivations: #2 - complete. View summary. |
	| Publishing of Study file (V3) - complete. |

Scenario: T76_Navigate to site and patient
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select the patient "01-PAT" from patients table.
	Then I see Patient details page for "01-PAT". 

Scenario: T77_verify the updated value should be derived in CRF(Visit (Week51),Auto build Form2)
	Given I expand "Visit (Week 51)" to select and open "AutoBuild Form02" CRF.
	When I click "Checkout" button on "AutoBuild Form02" CRF.
	And I click "Show Hidden Fields" button on "AutoBuild Form02" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	Then I verify below "TextBox" items are displayed for "Constant Date:" question in row "1" of "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:" table.
	| ItemToVerify |
	| [Blank]      |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum table rows are 3. Hidden Questions (Integer, Float, Text, Date) are derives:"
	And I click on "Save & Close" button on "AutoBuild Form02" CRF.

	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T78_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual16.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="AB_Date03" TransactionType="Update" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected16.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual16.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T79_Verify the active derivation question item value should be derived in CRF(Visit (Week52),Auto build Form4)
	Given I expand "Visit (Week 52)" to select and open "AutoBuild Form04" CRF.
	When I click "Checkout" button on "AutoBuild Form04" CRF.
	And I expand row "1" of table "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:"
	Then I verify below "TextBox" items are displayed for "Derived Date field" question in row "1" of "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:" table.
	| ItemToVerify |
	| [Blank]      |
	And I click table row button "Save & Close Row" of table "Key Sequence is not used. Maximum Table Rows are 1. Table Structure is Open.:"
	And I click on "Save & Close" button on "AutoBuild Form04" CRF.
	
	@ObjectiveEvidence @ReqID:3.1.4.1,3.1.4.3,3.1.4.6
Scenario: T80_Verify the XML Data evented out for the Visit date is entered from Datalabs UI
	Given I save the Event XML data in "ItemupdateDerivationManagementActual17.xml" file by executing the query "select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and XmlMessage like '%ItemOID="AB_Date07" TransactionType="Update" Value=""%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "ItemupdateDerivationManagementExpected17.xml" available in the project folder.
	And I have the XML file "ItemupdateDerivationManagementActual17.xml" available in the Test XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: T81_Logout from Datalabs application.
	When I clik logout of Datalabs
	Then I see login page 