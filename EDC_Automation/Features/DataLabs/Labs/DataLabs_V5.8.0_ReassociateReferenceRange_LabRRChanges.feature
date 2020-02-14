Feature: DataLabs_V5.8.0_ReassociateReferenceRange_LabRRChanges
	Test Summary: US59255, US56635
		System shall associate/re-evaluate the reference range for a lab value when any of the below mentioned Reference Range attribute is changed or new RR is added:
			Start Date
			End Date
			Gender
			From Age
			To Age
			RR Unit Name
		System shall make a call to Lab API which will re-evaluate associated Reference Range record and associate matching record.
		Update of Reference Range Records shall happen asynchronously after form save. I can view updated reference ranges when accessed the form again.
		If Reference Ranges are added as questions & mapped on Lab Mappings,
		Re-evaluated Reference Ranges shall be displayed on eCRF under respective question column.
		If Reference Ranges are not added as questions but mapped on Lab Mappings item.
		Re-evaluated Reference Ranges shall not be displayed on eCRF. Verify DB to check values.
		If any of the Patient records are not associated with RR, newly added record will be matched against this patient record and associate accordingly if attributes are matching.

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Upload and publish the study.
    When I click breadcrumb "Study Management"
    And I upload a study "TestLabs_Dictionary.zip" with study label "TestLabs_Data"
    Then I see study label "TestLabs_Data" in header 

Scenario: 04_Add sites to associate to labs.
	When I select DataManagerPortal item "Study Administration" from drop down
	And I click Link "Site Management" In StudyAdministrationPage
	And I enter sites details and Save
	| SiteId | SiteName | Address1 | Address2 | Address3 | Address4 | City      | State | Zip    | ISOCountry | Country | Phone      | Fax         | SiteStatus | DCFWorkflow | ExternalSource | ExternalId |
	| 01     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	| 02     | Site     | ADDRESS  | ADDRESS  | ADDRESS  | ADDRESS  | Hyderabad | AP    | 500060 | INDIA(IND) |         | 9999999999 | 66666666666 | Active     | Electronic  | No             | -          |
	Then I see site "01-Site" in SiteManagementPage
	And I see site "02-Site" in SiteManagementPage
	
Scenario: 05_Assign testadmin testadmin user to 01-Site
	When I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "01-Site"

Scenario: 06_Assign testadmin testadmin user to 02-Site
	When I click breadcrumb "Site Management"
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Manage Users" in "SiteActions" ActionPalette
	And I add and save user "testadmin testadmin" to site users in SiteManageUsersPage
	Then I see Site details page for "02-Site"

Scenario: 07_Remove the ODM URL
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "Forms" in StudyEditPreferencesPage
	And I select the "Partial" for Default Save: in StudyEditPreferencesFormsPage.
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I remove the endpoint URL under Patient Data Eventing tab. 
	And I click "Save" button on the Edit Preferences page.
	Then The CRF with data is saved and checked-in successfully.

Scenario: 08_Add Labs
	When I click breadcrumb "Study Administration"
	And I click Link "Lab Management" In StudyAdministrationPage
	And I click Link "Manage Laboratories" In Lab Management Page
	And I enter labs details and Save
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |
	Then I see labs with details in lab grid
	| LabId | LaboratoryName | Company  | Department | Address1 | Address2 | Address3 | City  | State | Zip    | ISOCountry | Country | Phone    | Fax      | LaboratoryStatus | ContactPerson |
	| L01   | Lab01          | PFIZER   | RD         | A1       | A2       | A3       | City1 | AP    | 500084 | INDIA(IND) |         | 11111111 | 22222222 | Active           | Mr.XYZ        |

Scenario: 09_Associate Labs L01 for 01-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "01" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
	| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
	| L01   | Lab01          | PFIZER  | RD         | Active           |
	
Scenario: 10_Associate Labs L01 for 02-SIte
	When I click breadcrumb "Study Administration"
	And I click Link "Site Management" In StudyAdministrationPage
	And I open site with siteid "02" and site name "Site" from SiteManagement page
	And I click ActionPalette Item "Associate Lab(s)" in "SiteActions" ActionPalette
	And I add and save lab id "L01" and lab name "Lab01" to associated labs in AssociateLabs page
	And I select sub tab "Labs" in site page
	Then I see lab data in labs tab of Site in SitePage
		| LabId | LaboratoryName | Company | Department | LaboratoryStatus |
		| L01   | Lab01          | PFIZER  | RD         | Active           |

Scenario: 11_Add Form Data and Patients using CDISC webservice ConsumeODM1_StrTransactional method
	When I add item data using ConsumeODMStrTransactional webservice with below data and odmfile.
	| TransactionTypeData | AddNewPatientsData | ODMDATA                                        |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate01PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate02PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate03PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate04PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate05PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate06PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate07PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate08PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate09PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate10PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate11PAT.xml |
	| Legacy              | true               | Lab_Multiple Patient_Data_CDISCUpdate12PAT.xml |
	Then The response should contain success status code as "200".

#Scenario: 11_03_Add Form Data and Patients using CDISC webservice ConsumeODM1_StrTransactional method
#	When I add item data using ConsumeODMStrTransactional webservice with below data and odmfile.
#	| TransactionTypeData | AddNewPatientsData | ODMDATA                                    |
#	| Legacy       | true              | Lab_Multiple Patient_Data_CDISCUpdate.xml |
#	Then The response should contain success status code as "200".

Scenario: 12_Update the ODM Endpoint URL
	When I click breadcrumb "Study Administration"
	And I click Link "Study Management" In StudyAdministrationPage
	And I click ActionPalette Item "Edit Preferences" in "StudyResetAction" ActionPalette
	And I open tab "patient data eventing" in StudyEditPreferencesPage
	And I update the endpoint URL under Patient Data Eventing tab.
	And I click "Save" button on the Edit Preferences page.
	Then I verify the success message displayed as "Edit Preferences Successful"

Scenario: 13_Add a new lab test reference range record under Lab01 under RBC
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "RBC" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
		 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
		 | 01/01/2019 | 01/31/2019 | Male   | >             | 20         | <           | 30       | >                    | 5                 | <                     | 15                 | >                      | 4                   | <                       | 16                   | fL   | False |
	 Then I see the reference range ids in the Reference Range Table.
		| ReferenceRangeID    |
		| {ReferenceRangeID1} |

Scenario: 14_Verify the Non e CRF question RR values are calculated on adding RR attribute
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '01-PAT')".
	 Then The below result should be retrieved.
		| DataValue              |
		| RBC                    |
		| 02                     |
		| 2                      |
		| Cat2                   |
		| SubCat2                |
		| Specimen2              |
		| Method2                |
		| Result2                |
		| > 5.00                 |
		| < 15.00                |
		| > 4.00                 |
		| < 16.00                |
		| Below normal range low |
		| 20                     |
		| pg                     |
		| > 25.00                |
		| < 75.00                |
		| > 20.00                |
		| < 80.00                |
		| 3                      |
		| 5                      |

Scenario: 15_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "NoneCRFRRValuesOnRRUpdateActual1.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '01-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NoneCRFRRValuesOnRRUpdateExpected1.xml" available in the project folder.
	And I have the XML file "NoneCRFRRValuesOnRRUpdateActual1.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

# Modify From Age and To Age to update the reference range values
Scenario: 16_Modify the reference range  From age and To age to update reference range values
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| FromAgeSet | ToAgeSet |
	| 60         | 70       |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 17_Verify the Non e CRF question RR values are calculated on updating Form age and To Age RR attribute
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '09-PAT')".
	 Then The below result should be retrieved.
		| DataValue               |
		| RBC                     |
		| 02                      |
		| 2                       |
		| Cat2                    |
		| SubCat2                 |
		| Specimen2               |
		| Method2                 |
		| Result2                 |
		| > 5.00                  |
		| < 15.00                 |
		| > 4.00                  |
		| < 16.00                 |
		| Above normal range high |
		| 125                     |
		| pg                      |
		| > 25.00                 |
		| < 75.00                 |
		| > 20.00                 |
		| < 80.00                 |
		| 3                       |
		| 5                       |

Scenario: 18_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "NoneCRFRRValuesOnRRUpdateActual2.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '09-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NoneCRFRRValuesOnRRUpdateExpected2.xml" available in the project folder.
	And I have the XML file "NoneCRFRRValuesOnRRUpdateActual2.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 19_Verify the Non eCRF question RR values are removed when RR From Age and RR To Age is updated
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '01-PAT')".
	 Then The result should have empty values.

# Modify StartDate and EndDate to update the reference range values
Scenario: 20_Modify the reference range  Start Date and End Date to update reference range values
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    |
	| 05/01/2019 | 05/31/2019 |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 21_Verify the Non e CRF question RR values are calculated on updating Start Date and End Date RR attribute
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '03-PAT')".
	 Then The below result should be retrieved.
		| DataValue               |
		| RBC                     |
		| 02                      |
		| 2                       |
		| Cat2                    |
		| SubCat2                 |
		| Specimen2               |
		| Method2                 |
		| Result2                 |
		| > 5.00                  |
		| < 15.00                 |
		| > 4.00                  |
		| < 16.00                 |
		| Above normal range high |
		| 140                     |
		| pg                      |
		| > 25.00                 |
		| < 75.00                 |
		| > 20.00                 |
		| < 80.00                 |
		| 3                       |
		| 5                       |

Scenario: 22_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "NoneCRFRRValuesOnRRUpdateActual3.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '03-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NoneCRFRRValuesOnRRUpdateExpected3.xml" available in the project folder.
	And I have the XML file "NoneCRFRRValuesOnRRUpdateActual3.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 23_Verify the Non eCRF question RR values are removed when Start Date and End Date is updated
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '09-PAT')".
	 Then The result should have empty values.

# Modify Gender to update the reference range values
Scenario: 24_Modify the reference range  Gender to update reference range values
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
		| Gender |
		| Female |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 25_Verify the Non e CRF question RR values are calculated on updating Start Date and End Date RR attribute
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '06-PAT')".
	 Then The below result should be retrieved.
		| DataValue               |
		| RBC                     |
		| 02                      |
		| 2                       |
		| Cat2                    |
		| SubCat2                 |
		| Specimen2               |
		| Method2                 |
		| Result2                 |
		| > 5.00                  |
		| < 15.00                 |
		| > 4.00                  |
		| < 16.00                 |
		| Above normal range high |
		| 140                     |
		| pg                      |
		| > 25.00                 |
		| < 75.00                 |
		| > 20.00                 |
		| < 80.00                 |
		| 3                       |
		| 5                       |

Scenario: 26_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "NoneCRFRRValuesOnRRUpdateActual4.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '06-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NoneCRFRRValuesOnRRUpdateExpected4.xml" available in the project folder.
	And I have the XML file "NoneCRFRRValuesOnRRUpdateActual4.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 27_Verify the Non eCRF question RR values are removed when Start Date and End Date is updated
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '03-PAT')".
	 Then The result should have empty values.

# Modify From Age and To Age to update the reference range values
Scenario: 28_Modify the reference range  From age and To age to update reference range values
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| FromAgeSet | ToAgeSet |
	| 40         | 50       |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 29_Verify the Non e CRF question RR values are calculated on updating Form age and To Age RR attribute
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '11-PAT')".
	 Then The below result should be retrieved.
		| DataValue               |
		| RBC                     |
		| 02                      |
		| 2                       |
		| Cat2                    |
		| SubCat2                 |
		| Specimen2               |
		| Method2                 |
		| Result2                 |
		| > 5.00                  |
		| < 15.00                 |
		| > 4.00                  |
		| < 16.00                 |
		| Above normal range high |
		| 90                      |
		| pg                      |
		| > 25.00                 |
		| < 75.00                 |
		| > 20.00                 |
		| < 80.00                 |
		| 3                       |
		| 5                       |

Scenario: 30_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "NoneCRFRRValuesOnRRUpdateActual5.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '11-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NoneCRFRRValuesOnRRUpdateExpected5.xml" available in the project folder.
	And I have the XML file "NoneCRFRRValuesOnRRUpdateActual5.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 31_Verify the Non eCRF question RR values are removed when RR From Age and RR To Age is updated
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '06-PAT')".
	 Then The result should have empty values.

# Modify StartDate and EndDate to update the reference range values
Scenario: 32_Modify the reference range  Start Date and End Date to update reference range values
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    |
	| 03/01/2019 | 03/31/2019 |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 33_Verify the Non e CRF question RR values are calculated on updating Start Date and End Date RR attribute
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '05-PAT')".
	 Then The below result should be retrieved.
		| DataValue               |
		| RBC                     |
		| 02                      |
		| 2                       |
		| Cat2                    |
		| SubCat2                 |
		| Specimen2               |
		| Method2                 |
		| Result2                 |
		| > 5.00                  |
		| < 15.00                 |	
		| > 4.00                  |
		| < 16.00                 |
		| Above normal range high |
		| 90                      |
		| pg                      |
		| > 25.00                 |
		| < 75.00                 |
		| > 20.00                 |
		| < 80.00                 |
		| 3                       |
		| 5                       |

Scenario: 34_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "NoneCRFRRValuesOnRRUpdateActual6.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '05-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NoneCRFRRValuesOnRRUpdateExpected6.xml" available in the project folder.
	And I have the XML file "NoneCRFRRValuesOnRRUpdateActual6.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 35_Verify the Non eCRF question RR values are removed when Start Date and End Date is updated
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '11-PAT')".
	 Then The result should have empty values.

# Modify Gender to update the reference range values
Scenario: 36_Modify the reference range  Gender to update reference range values
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
		| Gender |
		| Male |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 37_Verify the Non e CRF question RR values are calculated on updating Start Date and End Date RR attribute
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '02-PAT')".
	 Then The below result should be retrieved.
		| DataValue               |
		| RBC                     |
		| 02                      |
		| 2                       |
		| Cat2                    |
		| SubCat2                 |
		| Specimen2               |
		| Method2                 |
		| Result2                 |
		| > 5.00                  |
		| < 15.00                 |
		| > 4.00                  |
		| < 16.00                 |
		| Above normal range high |
		| 90                      |
		| pg                      |
		| > 25.00                 |
		| < 75.00                 |
		| > 20.00                 |
		| < 80.00                 |
		| 3                       |
		| 5                       |

Scenario: 38_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "NoneCRFRRValuesOnRRUpdateActual7.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '02-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NoneCRFRRValuesOnRRUpdateExpected7.xml" available in the project folder.
	And I have the XML file "NoneCRFRRValuesOnRRUpdateActual7.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 39_Verify the Non eCRF question RR values are removed when Start Date and End Date is updated
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '05-PAT')".
	 Then The result should have empty values.

# Modify StartDate and EndDate to update the reference range values
Scenario: 40_Modify the reference range  Start Date and End Date to update reference range values
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    |
	| 05/01/2019 | 05/31/2019 |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 41_Verify the Non e CRF question RR values are calculated on updating Start Date and End Date RR attribute
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '08-PAT')".
	 Then The below result should be retrieved.
		| DataValue               |
		| RBC                     |
		| 02                      |
		| 2                       |
		| Cat2                    |
		| SubCat2                 |
		| Specimen2               |
		| Method2                 |
		| Result2                 |
		| > 5.00                  |
		| < 15.00                 |
		| > 4.00                  |
		| < 16.00                 |
		| Above normal range high |
		| 90                      |
		| pg                      |
		| > 25.00                 |
		| < 75.00                 |
		| > 20.00                 |
		| < 80.00                 |
		| 3                       |
		| 5                       |

Scenario: 42_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "NoneCRFRRValuesOnRRUpdateActual8.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '08-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "NoneCRFRRValuesOnRRUpdateExpected8.xml" available in the project folder.
	And I have the XML file "NoneCRFRRValuesOnRRUpdateActual8.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 43_Verify the Non eCRF question RR values are removed when Start Date and End Date is updated
	 When I execute the query "Select DataValue from PatientData where DataRowActive=0 and DataRow=2 and PatientFormKey in (Select PatientFormKey from PatientForm a Join PatientEvent b on a.PatientEventKey=b.PatientEventKey join Patient c on b.PatientKey=c.PatientKey and c.PatientIdentity = '02-PAT')".
	 Then The result should have empty values.
###################################################################################################

# eCRF changes
# Modify From Age and To Age to update the reference range values
Scenario: 44_Add a new lab test reference range record under Lab01 under WBC
	 Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "WBC" from labtests page
	 And I click add and enter reference ranges of a lab test and Save and can see "LabTest Reference Range Added Successfully" message upon each record save in ReferenceRangesPage including NA
	 | StartDate  | EndDate    | Gender | FromAgeSelect | FromAgeSet | ToAgeSelect | ToAgeSet | NormalRangeLowSelect | NormalRangeLowSet | NormalRangeHighSelect | NormalRangeHighSet | ClinicalRangeLowSelect | ClinicalRangeLowSet | ClinicalRangeHighSelect | ClinicalRangeHighSet | Unit | NA    |
	 | 01/01/2019 | 01/31/2019 | Female | >             | 60         | <           | 70       | >                    | 5                 | <                     | 15                 | >                      | 4                   | <                       | 17                   | µL   | False |
	 Then I see the reference range ids in the Reference Range Table.
	| ReferenceRangeID    |
	| {ReferenceRangeID2} |

Scenario: 45_Verify the e CRF question RR values are calculated on updating Form age and To Age RR attribute
	#patient 12 LabForm2
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select "12-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC                     | TEXT            |                  |
	| 1         | Lab Test Description                     | WBC                     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL                      | TEXT            |                  |
	| 1         | CRF Lab value                            | 28                      | TEXT            |                  |
	| 1         | Lab Test Name                            | WBC                     | TEXT            |                  |
	| 1         | Lab Test Code                            | 01                      | TEXT            |                  |
	| 1         | LOINC Code                               | 1                       | TEXT            |                  |
	| 1         | Category                                 | Cat1                    | TEXT            |                  |
	| 1         | Subcategory                              | SubCat1                 | TEXT            |                  |
	| 1         | Specimen                                 | Specimen1               | TEXT            |                  |
	| 1         | Method                                   | Method1                 | TEXT            |                  |
	| 1         | Result Type                              | Result1                 | TEXT            |                  |
	| 1         | Normal Reference Range High              | < 15.00                 | TEXT            |                  |
	| 1         | Critical Reference Range Low             | > 4.00                  | TEXT            |                  |
	| 1         | Normal Reference Range Low               | > 5.00                  | TEXT            |                  |
	| 1         | Critical Reference Range High            | < 17.00                 | TEXT            |                  |
	#| 1         | Reference Range ID                       | {ReferenceRangeID2}     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | 84                      | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | > 15.00                 | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | < 45.00                 | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | > 12.00                 | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | No                      | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | < 51.00                 | TEXT            |                  |
	| 1         | Precision                                | 2                       | TEXT            |                  |
	| 1         | Conversion Factor                        | 3                       | TEXT            |                  |

Scenario: 46_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "eCRFRRValuesOnRRUpdateActual9.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '12-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "eCRFRRValuesOnRRUpdateExpected9.xml" available in the project folder.
	And I have the XML file "eCRFRRValuesOnRRUpdateActual9.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |
	
Scenario: 47_Modify the reference range  From age and To age to update reference range values
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "WBC" from labtests page
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| FromAgeSet | ToAgeSet |
	| 20         | 30       |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 48_Verify the e CRF question RR values are calculated on updating Form age and To Age RR attribute
	#Patient 4 LabForm2
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "04-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue            | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC                    | TEXT            |                  |
	| 1         | Lab Test Description                     | WBC                    | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL                     | TEXT            |                  |
	| 1         | CRF Lab value                            | 4                      | TEXT            |                  |
	| 1         | Lab Test Name                            | WBC                    | TEXT            |                  |
	| 1         | Lab Test Code                            | 01                     | TEXT            |                  |
	| 1         | LOINC Code                               | 1                      | TEXT            |                  |
	| 1         | Category                                 | Cat1                   | TEXT            |                  |
	| 1         | Subcategory                              | SubCat1                | TEXT            |                  |
	| 1         | Specimen                                 | Specimen1              | TEXT            |                  |
	| 1         | Method                                   | Method1                | TEXT            |                  |
	| 1         | Result Type                              | Result1                | TEXT            |                  |
	| 1         | Normal Reference Range High              | < 15.00                | TEXT            |                  |
	| 1         | Critical Reference Range Low             | > 4.00                 | TEXT            |                  |
	| 1         | Normal Reference Range Low               | > 5.00                 | TEXT            |                  |
	| 1         | Critical Reference Range High            | < 17.00                | TEXT            |                  |
	#| 1         | Reference Range ID                       | {ReferenceRangeID2}    | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | Below normal range low | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | 12                     | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | gm/dL                  | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | > 15.00                | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | < 45.00                | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | > 12.00                | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | No                     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | < 51.00                | TEXT            |                  |
	| 1         | Precision                                | 2                      | TEXT            |                  |
	| 1         | Conversion Factor                        | 3                      | TEXT            |                  |

Scenario: 49_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "eCRFRRValuesOnRRUpdateActual10.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '04-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "eCRFRRValuesOnRRUpdateExpected10.xml" available in the project folder.
	And I have the XML file "eCRFRRValuesOnRRUpdateActual10.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 50_Verify the eCRF question RR values are removed when RR From Age and RR To Age is updated
	#patient 12 LabForm2 
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select "12-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
	| 1         | Lab Test Description                     | [Blank]     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL          | TEXT            |                  |
	| 1         | CRF Lab value                            | 28          | TEXT            |                  |
	| 1         | Lab Test Name                            | [Blank]     | TEXT            |                  |
	| 1         | Lab Test Code                            | [Blank]     | TEXT            |                  |
	| 1         | LOINC Code                               | [Blank]     | TEXT            |                  |
	| 1         | Category                                 | [Blank]     | TEXT            |                  |
	| 1         | Subcategory                              | [Blank]     | TEXT            |                  |
	| 1         | Specimen                                 | [Blank]     | TEXT            |                  |
	| 1         | Method                                   | [Blank]     | TEXT            |                  |
	| 1         | Result Type                              | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
	| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
	| 1         | Precision                                | [Blank]     | TEXT            |                  |
	| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |

#Modify Start Date and End Date to re associate rr values
Scenario: 51_Modify the reference range  Start Date and End Date to update reference range values
	Given I navigate to "Local Labs" tab from main menu.
    When I open lab with labid "L01" from ManageReferenceRanges page
	And I open labtest with labname "WBC" from labtests page
	When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    |
	| 03/01/2019 | 03/31/2019 |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 52_Verify the e CRF question RR values are calculated on updating Start Date and End Date attribute
	#Patient 10 LabForm2
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When  I select "10-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC                     | TEXT            |                  |
	| 1         | Lab Test Description                     | WBC                     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL                      | TEXT            |                  |
	| 1         | CRF Lab value                            | 4                      | TEXT            |                  |
	| 1         | Lab Test Name                            | WBC                     | TEXT            |                  |
	| 1         | Lab Test Code                            | 01                      | TEXT            |                  |
	| 1         | LOINC Code                               | 1                       | TEXT            |                  |
	| 1         | Category                                 | Cat1                    | TEXT            |                  |
	| 1         | Subcategory                              | SubCat1                 | TEXT            |                  |
	| 1         | Specimen                                 | Specimen1               | TEXT            |                  |
	| 1         | Method                                   | Method1                 | TEXT            |                  |
	| 1         | Result Type                              | Result1                 | TEXT            |                  |
	| 1         | Normal Reference Range High              | < 15.00                 | TEXT            |                  |
	| 1         | Critical Reference Range Low             | > 4.00                  | TEXT            |                  |
	| 1         | Normal Reference Range Low               | > 5.00                  | TEXT            |                  |
	| 1         | Critical Reference Range High            | < 17.00                 | TEXT            |                  |
	#| 1         | Reference Range ID                       | {ReferenceRangeID2}     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | Below normal range low | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | 12                      | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | > 15.00                 | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | < 45.00                 | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | > 12.00                 | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | No                      | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | < 51.00                 | TEXT            |                  |
	| 1         | Precision                                | 2                       | TEXT            |                  |
	| 1         | Conversion Factor                        | 3                       | TEXT            |                  |

Scenario: 53_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "eCRFRRValuesOnRRUpdateActual11.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '10-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "eCRFRRValuesOnRRUpdateExpected11.xml" available in the project folder.
	And I have the XML file "eCRFRRValuesOnRRUpdateActual11.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 54_Verify the eCRF question RR values are removed when RR Start Date and End Date is updated
	#patient 4 LabForm2 
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "04-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
	| 1         | Lab Test Description                     | [Blank]     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL          | TEXT            |                  |
	| 1         | CRF Lab value                            | 4           | TEXT            |                  |
	| 1         | Lab Test Name                            | [Blank]     | TEXT            |                  |
	| 1         | Lab Test Code                            | [Blank]     | TEXT            |                  |
	| 1         | LOINC Code                               | [Blank]     | TEXT            |                  |
	| 1         | Category                                 | [Blank]     | TEXT            |                  |
	| 1         | Subcategory                              | [Blank]     | TEXT            |                  |
	| 1         | Specimen                                 | [Blank]     | TEXT            |                  |
	| 1         | Method                                   | [Blank]     | TEXT            |                  |
	| 1         | Result Type                              | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
	| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
	| 1         | Precision                                | [Blank]     | TEXT            |                  |
	| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |

# Modify Gender to update the reference range values
Scenario: 55_Modify the reference range  Gender to update reference range values
	Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "WBC" from labtests page
	 When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
		| Gender |
		| Male |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 56_Verify the e CRF question RR values are calculated on updating Gender RR attribute
	#patient 7 LabForm2
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When  I select "07-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC                     | TEXT            |                  |
	| 1         | Lab Test Description                     | WBC                     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL                      | TEXT            |                  |
	| 1         | CRF Lab value                            | 4                      | TEXT            |                  |
	| 1         | Lab Test Name                            | WBC                     | TEXT            |                  |
	| 1         | Lab Test Code                            | 01                      | TEXT            |                  |
	| 1         | LOINC Code                               | 1                       | TEXT            |                  |
	| 1         | Category                                 | Cat1                    | TEXT            |                  |
	| 1         | Subcategory                              | SubCat1                 | TEXT            |                  |
	| 1         | Specimen                                 | Specimen1               | TEXT            |                  |
	| 1         | Method                                   | Method1                 | TEXT            |                  |
	| 1         | Result Type                              | Result1                 | TEXT            |                  |
	| 1         | Normal Reference Range High              | < 15.00                 | TEXT            |                  |
	| 1         | Critical Reference Range Low             | > 4.00                  | TEXT            |                  |
	| 1         | Normal Reference Range Low               | > 5.00                  | TEXT            |                  |
	| 1         | Critical Reference Range High            | < 17.00                 | TEXT            |                  |
	#| 1         | Reference Range ID                       | {ReferenceRangeID2}     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | Below normal range low | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | 12                      | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | > 15.00                 | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | < 45.00                 | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | > 12.00                 | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | No                      | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | < 51.00                 | TEXT            |                  |
	| 1         | Precision                                | 2                       | TEXT            |                  |
	| 1         | Conversion Factor                        | 3                       | TEXT            |                  |

Scenario: 57_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "eCRFRRValuesOnRRUpdateActual12.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '07-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "eCRFRRValuesOnRRUpdateExpected12.xml" available in the project folder.
	And I have the XML file "eCRFRRValuesOnRRUpdateActual12.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 58_Verify the eCRF question RR values are removed when Gender is updated
	#Patient 10 LabForm2
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When  I select "10-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
	| 1         | Lab Test Description                     | [Blank]     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL          | TEXT            |                  |
	| 1         | CRF Lab value                            | 4           | TEXT            |                  |
	| 1         | Lab Test Name                            | [Blank]     | TEXT            |                  |
	| 1         | Lab Test Code                            | [Blank]     | TEXT            |                  |
	| 1         | LOINC Code                               | [Blank]     | TEXT            |                  |
	| 1         | Category                                 | [Blank]     | TEXT            |                  |
	| 1         | Subcategory                              | [Blank]     | TEXT            |                  |
	| 1         | Specimen                                 | [Blank]     | TEXT            |                  |
	| 1         | Method                                   | [Blank]     | TEXT            |                  |
	| 1         | Result Type                              | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
	| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
	| 1         | Precision                                | [Blank]     | TEXT            |                  |
	| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |
#Modify Age to reassociate eCRF RR values
Scenario: 59_Modify the reference range  From age and To age to update reference range values
	Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "WBC" from labtests page
	 When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| FromAgeSet | ToAgeSet |
	| 40         | 50       |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage

Scenario: 60_Verify the eCRF question RR values are calculated on updating From age and To age RR attribute
	#patient 2 LabForm2
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "02-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC                     | TEXT            |                  |
	| 1         | Lab Test Description                     | WBC                     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL                      | TEXT            |                  |
	| 1         | CRF Lab value                            | 18                      | TEXT            |                  |
	| 1         | Lab Test Name                            | WBC                     | TEXT            |                  |
	| 1         | Lab Test Code                            | 01                      | TEXT            |                  |
	| 1         | LOINC Code                               | 1                       | TEXT            |                  |
	| 1         | Category                                 | Cat1                    | TEXT            |                  |
	| 1         | Subcategory                              | SubCat1                 | TEXT            |                  |
	| 1         | Specimen                                 | Specimen1               | TEXT            |                  |
	| 1         | Method                                   | Method1                 | TEXT            |                  |
	| 1         | Result Type                              | Result1                 | TEXT            |                  |
	| 1         | Normal Reference Range High              | < 15.00                 | TEXT            |                  |
	| 1         | Critical Reference Range Low             | > 4.00                  | TEXT            |                  |
	| 1         | Normal Reference Range Low               | > 5.00                  | TEXT            |                  |
	| 1         | Critical Reference Range High            | < 17.00                 | TEXT            |                  |
	#| 1         | Reference Range ID                       | {ReferenceRangeID2}     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | 54                      | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | > 15.00                 | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | < 45.00                 | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | > 12.00                 | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | No                      | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | < 51.00                 | TEXT            |                  |
	| 1         | Precision                                | 2                       | TEXT            |                  |
	| 1         | Conversion Factor                        | 3                       | TEXT            |                  |

Scenario: 61_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "eCRFRRValuesOnRRUpdateActual13.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '02-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "eCRFRRValuesOnRRUpdateExpected13.xml" available in the project folder.
	And I have the XML file "eCRFRRValuesOnRRUpdateActual13.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 62_Verify the eCRF question RR values are removed when From age and To age is updated
	#patient 7 LabForm2
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select "07-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
	| 1         | Lab Test Description                     | [Blank]     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL          | TEXT            |                  |
	| 1         | CRF Lab value                            | 4           | TEXT            |                  |
	| 1         | Lab Test Name                            | [Blank]     | TEXT            |                  |
	| 1         | Lab Test Code                            | [Blank]     | TEXT            |                  |
	| 1         | LOINC Code                               | [Blank]     | TEXT            |                  |
	| 1         | Category                                 | [Blank]     | TEXT            |                  |
	| 1         | Subcategory                              | [Blank]     | TEXT            |                  |
	| 1         | Specimen                                 | [Blank]     | TEXT            |                  |
	| 1         | Method                                   | [Blank]     | TEXT            |                  |
	| 1         | Result Type                              | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
	| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
	| 1         | Precision                                | [Blank]     | TEXT            |                  |
	| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |

#Modify Start Date and End Date to re associate rr values
Scenario: 63_Modify the reference range  Start Date and End Date to update reference range values
	Given I navigate to "Local Labs" tab from main menu.
     When I open lab with labid "L01" from ManageReferenceRanges page
	 And I open labtest with labname "WBC" from labtests page
	 When I click on "Edit" icon for the first record to modify the data in ReferenceRangesPage
	And I modify reference ranges of a existing lab test and Save in ReferenceRangesPage
	| StartDate  | EndDate    |
	| 05/01/2019 | 05/31/2019 |
	And I Click the save button in ReferenceRangesPage
	Then a "LabTest Reference Range Updated Successfully" message should be displayed in ReferenceRangesPage


Scenario: 64_Verify the e CRF question RR values are calculated on updating Start Date and End Date attribute
	#Patient 8 LabForm2
	Given I navigate to "Patients" tab from main menu.
	And I select the site "02-Site" from Sites dropdown.
	When I select "08-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue             | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC                     | TEXT            |                  |
	| 1         | Lab Test Description                     | WBC                     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL                      | TEXT            |                  |
	| 1         | CRF Lab value                            | 18                      | TEXT            |                  |
	| 1         | Lab Test Name                            | WBC                     | TEXT            |                  |
	| 1         | Lab Test Code                            | 01                      | TEXT            |                  |
	| 1         | LOINC Code                               | 1                       | TEXT            |                  |
	| 1         | Category                                 | Cat1                    | TEXT            |                  |
	| 1         | Subcategory                              | SubCat1                 | TEXT            |                  |
	| 1         | Specimen                                 | Specimen1               | TEXT            |                  |
	| 1         | Method                                   | Method1                 | TEXT            |                  |
	| 1         | Result Type                              | Result1                 | TEXT            |                  |
	| 1         | Normal Reference Range High              | < 15.00                 | TEXT            |                  |
	| 1         | Critical Reference Range Low             | > 4.00                  | TEXT            |                  |
	| 1         | Normal Reference Range Low               | > 5.00                  | TEXT            |                  |
	| 1         | Critical Reference Range High            | < 17.00                 | TEXT            |                  |
	#| 1         | Reference Range ID                       | {ReferenceRangeID2}     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | Above normal range high | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | 54                      | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | gm/dL                   | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | > 15.00                 | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | < 45.00                 | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | > 12.00                 | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | No                      | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | < 51.00                 | TEXT            |                  |
	| 1         | Precision                                | 2                       | TEXT            |                  |
	| 1         | Conversion Factor                        | 3                       | TEXT            |                  |

Scenario: 65_Verify the XML Data evented out for the Item Data is entered via Flag Update
	Given I save the Event XML data in "eCRFRRValuesOnRRUpdateActual14.xml" file by executing the query "Select Top 1 XmlMessage from OdmSubscriberDetail where XmlMessage like '%'+ (Select SubjectKey from Patient where PatientIdentity = '08-PAT') +  '%' order by OdmSubscriberDetailKey desc"
	And I have the XML file "eCRFRRValuesOnRRUpdateExpected14.xml" available in the project folder.
	And I have the XML file "eCRFRRValuesOnRRUpdateActual14.xml" available in the Result XML Files folder.
	Then I verify that the data in both XML files is same except for below tags and fields.
	| TagName | FieldName        |
	|         | CreationDateTime |
	|         | DateTimeStamp    |
	|         | SubjectKey       |
	|         | FileOID          |
	|         | SourceID         |
	|         | SourceSystemVersion |

Scenario: 66_Verify the eCRF question RR values are removed when RR Start Date and End Date is updated
	#patient 2 LabForm2 
	Given I navigate to "Patients" tab from main menu.
	And I select the site "01-Site" from Sites dropdown.
	When I select "02-PAT" patient.
	And I expand "Visit (Week 2)" to select and open "LabForm2" CRF.
	Then I verify below ReferenceRange CRF "Autobuild Table:" table questions data in the CRF.
	| RowNumber | QuestionPrompt                           | AnswerValue | AnswerFieldType | RowButtonToClick |
	| 1         | CRF Lab Test Name                        | WBC         | TEXT            |                  |
	| 1         | Lab Test Description                     | [Blank]     | TEXT            |                  |
	| 1         | CRF Lab Unit                             | µL          | TEXT            |                  |
	| 1         | CRF Lab value                            | 18          | TEXT            |                  |
	| 1         | Lab Test Name                            | [Blank]     | TEXT            |                  |
	| 1         | Lab Test Code                            | [Blank]     | TEXT            |                  |
	| 1         | LOINC Code                               | [Blank]     | TEXT            |                  |
	| 1         | Category                                 | [Blank]     | TEXT            |                  |
	| 1         | Subcategory                              | [Blank]     | TEXT            |                  |
	| 1         | Specimen                                 | [Blank]     | TEXT            |                  |
	| 1         | Method                                   | [Blank]     | TEXT            |                  |
	| 1         | Result Type                              | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range High              | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range Low             | [Blank]     | TEXT            |                  |
	| 1         | Normal Reference Range Low               | [Blank]     | TEXT            |                  |
	| 1         | Critical Reference Range High            | [Blank]     | TEXT            |                  |
	| 1         | Reference Range ID                       | [Blank]     | TEXT            |                  |
	| 1         | Out of Normal Range Indicator            | [Blank]     | TEXT            |                  |
	| 1         | Normalized Patient Lab Value             | [Blank]     | TEXT            |                  |
	| 1         | Normalized Lab Unit                      | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range Low    | [Blank]     | TEXT            |                  |
	| 1         | Normalized Normal Reference Range High   | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range Low  | [Blank]     | TEXT            |                  |
	| 1         | Reference Range Not Applicable           | [Blank]     | TEXT            |                  |
	| 1         | Normalized Critical Reference Range High | [Blank]     | TEXT            |                  |
	| 1         | Precision                                | [Blank]     | TEXT            |                  |
	| 1         | Conversion Factor                        | [Blank]     | TEXT            |                  |

Scenario: 67_Logout from Datalabs
	When I clik logout of Datalabs
	Then I see login page