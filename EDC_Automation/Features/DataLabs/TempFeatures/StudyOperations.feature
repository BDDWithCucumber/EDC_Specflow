Feature: StudyOperations
	Upload, stage and publish a study
	Reset, recall and delete a study

Scenario: 01_Login to Datalabs
	Given I logged in to DataLabs
	Then I see Datalabs Home Page

Scenario: 02_Delete a study
	When I delete study
	Then I see study label "No Study Loaded" in header

Scenario: 03_Publish a study
	When I click breadcrumb "Study Management"
	And I upload a study "Test45001_20171204_T15302664createfromexistedstudywithlabsandattributemapping.Zip" with study label "L1"
	Then I see study label "Test3210" in header

Scenario: 04_Logout form DataLabs
	When I clik logout of Datalabs
	Then I see login page

#	Upload Safety Study and check (including db lab tables)
#	Upload ILS Study and check (including db lab tables)
#	Upload Normal Study and check (including db lab tables)
#	Upload Labs study without mappings (including db lab tables)
#	Upload Labs study with Attribute mappings only (including db lab tables)
#	Upload Labs study with Lab mappings only (including db lab tables)
#	Upload Labs study with Lab mappings with single instance and Attribute Mapping (including db lab tables)
#	Upload Labs study with Lab mappings with multiple instance and Attribute Mapping (including db lab tables)
#	Upload Labs study with Lab mappings with multiple instance (consume all domains) and Attribute Mapping (including db lab tables)
#	Upload Labs study with Attribute mappings with DOB as Whole Date (including db lab tables)
#	Upload Labs study with Attribute mappings with DOB as Day, Month and Year (including db lab tables)
#	Upload Labs study with Attribute mappings with DOB as Age and Age Unit (including db lab tables)
#	Upload Labs study with Attribute mappings and Lab Mapping with required mappings only (including db lab tables)
#	Structure of the xml after publishing the study.

#-<Export>
#
#-<Mapping>
#
#-<DataShapes>
#
#-<DataShape Type="Labs" Name="StudyName">
#
#-<SubDataShape Name="Instance Name" DomainName="Domain Name" IsMultipleInstance="true" Category="Lab Mapping">
#
#<DataReference Name="LAB_ID" MappingType="D" Value="Data.*.*.*.XXXX.Value"/>
#
#<DataReference Name="COLLECTION_DATE" MappingType="D" Value="Data.*.*.*.XXXX.Value"/>
#
#<DataReference Name="LAB_TEST" MappingType="D" Value="Data.*.*.*.XXXX.Value"/>
#
#<DataReference Name="LAB_VALUE" MappingType="D" Value="Data.*.*.*.XXXX.Value"/>
#
#<DataReference Name="LAB_UNIT" MappingType="D" Value="Data.*.*.*.XXXX.Value"/>
#
#<DataReference Name="CATEGORY" MappingType="D" Value="Data.*.*.*.XXXX.Value"/>
#
#<DataReference Name="FASTING_STATUS" MappingType="D" Value="Data.*.*.*.XXXX.Value"/>
#
#<DataReference Name="REFERENCES_RANGE" MappingType="D" Value="Data.*.*.*.XXXX.Value"/>
#
#</SubDataShape>
#
#<SubDataShape> 
#
#For Multiple instances
#
#</SubDataShape>
#
#
#-<LabCategory>
#
#
#-<Category Name="Lab Mapping" IsMultipleInstance="true" Desc="Lab Mapping">
#
#<Attribute Name="LAB_ID" AgeCalculationType="None" Label="Lab ID"/>
#
#<Attribute Name="COLLECTION_DATE" AgeCalculationType="None" Label="Collection Date"/>
#
#<Attribute Name="LAB_TEST" AgeCalculationType="None" Label="Lab Test"/>
#
#<Attribute Name="LAB_VALUE" AgeCalculationType="None" Label="Lab Value"/>
#
#<Attribute Name="LAB_UNIT" AgeCalculationType="None" Label="Lab Unit"/>
#
#<Attribute Name="CATEGORY" AgeCalculationType="None" Label="Category"/>
#
#<Attribute Name="FASTING_STATUS" AgeCalculationType="None" Label="Fasting Status"/>
#
#<Attribute Name="REFERENCES_RANGE" AgeCalculationType="None" Label="Reference Range"/>
#
#</Category>
#
#
#-<Category Name="Attribute Mapping" IsMultipleInstance="false" Desc="Attribute Mapping">
#
#<Attribute Name="AGE" AgeCalculationType="Age" Label="Age"/>
#
#<Attribute Name="AGE_UNIT" AgeCalculationType="Age" Label="Age Unit"/>
#
#<Attribute Name="DATE_OF_BIRTH_WHOLEDATE" AgeCalculationType="Whole_Date" Label="Date of Birth (Whole Date)"/>
#
#<Attribute Name="DATE_OF_BIRTH_DAY" AgeCalculationType="Partial_Date" Label="Date of Birth (Day)"/>
#
#<Attribute Name="DATE_OF_BIRTH_MONTH" AgeCalculationType="Partial_Date" Label="Date of Birth (Month)"/>
#
#<Attribute Name="DATE_OF_BIRTH_YEAR" AgeCalculationType="Partial_Date" Label="Date of Birth (Year)"/>
#
#<Attribute Name="GENDER" AgeCalculationType="None" Label="Gender"/>
#
#<Attribute Name="RACE" AgeCalculationType="None" Label="Race"/>
#
#<Attribute Name="DATE_OF_BIRTH_SELECTION" AgeCalculationType="None" Label="Date of Birth / Age"/>
#
#</Category>
#
#</LabCategory>
#
#</Mapping>
#
#</Export>




#
##################### DL: Update Lab ID through Web Services ###########################
#Scenario: Uplodad and Publish a study having LabId mappings
#
#Scenario: Create a Site and Patient
#eg:	Site1, Site2
#
#Scenario: Create Labs
#eg: Lab1, Lab2, Lab3, Lab4, Lab5
#
#Scenario: Associate Sites to Labs
#eg:
#
#	Site1 - Lab1,Lab2
#	Site2 - Lab3,Lab4
#
#Scenario: Open and save form with Lab1 in lab id for Site1
#
#Scenario: Open and save form with Lab3 in lab id for Site2
#
#Scenario: Export Sites, Patients, Events and Forms which has LabId field and get XML
#
#
##initial submit, RTSM, Multiple instances (Two LabIds in one form)
#
##Positive
#Scenario:Replace Lab1 with Lab2 and update CRF using CDISC web service
#		Success reporse message should be shown
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Lab2 in the LabId filed
#		  
#
##Positive
#Scenario:Replace Lab3 with Lab4 and update CRF using CDISS web service
#		Success reporse message should be shown
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Lab4 in the LabId filed 
#
##Negative (Valid LabId but not associated this site and associated to a different site)
#Scenario:Replace Lab2 with Lab3 and update CRF using CDISC web service
#		CRF should not be updated and error message should be thrown
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Lab2 in the LabId filed 
#
##Negative (Valid LabId but not associated this site and associated to a different site)
#Scenario:Replace Lab4 with Lab1 and update CRF using CDISS web service
#		CRF should not be updated and error message should be thrown
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Lab4 in the LabId filed 
#
##Negative (Valid LabId but not associated this site and any of the sites)
#Scenario:Replace Lab4 with Lab5 and update CRF using CDISS web service
#		CRF should not be updated and error message should be thrown
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Lab4 in the LabId filed 
#
##Negative (Invalid LabId or LabId does not exist)
#Scenario:Replace Lab4 with XYZABC and update CRF using CDISS web service
#		CRF should not be updated and error message should be thrown
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Lab4 in the LabId filed 
#
##Positive
#Scenario:Replace Lab3 with EMPTY and update CRF using CDISS web service
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show BLANK in the LabId filed 
#
#
############################## DL: Update through web services for Codelist Groups ##########################################
##initial submit, RTSM
#
#Scenario: Uplodad and Publish a study having a question of type codeList group in one of the forms (CRFs)
#
#eg: Question Color1 is configured with codelist group 'Color Group1' which is in code list 'AB_Color'
#	Color Group1 has Red and White code list items. 
#
#Scenario: Create a Site and Patient
#eg:	Site1, Site2
#
#Scenario: Open and save form with Red in Color1 for Site1
#
#Scenario: Export Sites, Patients, Events and Forms which has Color1 (Codelist group) field and get XML
#
##Positive
#Scenario:Replace Red with White and update CRF using CDISC web service
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show White in the Color1 filed 
#
##Positive
#Scenario:Replace White with Red and update CRF using CDISS web service
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Red in the Color1 filed 
#
##Negative (Valid codelist item but not part of the Color Group1)
#Scenario:Replace Red with Green and update CRF using CDISC web service
#		CRF should not be updated and error message should be thrown
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Red in the LabId filed 
#
##Negative (Invalid codelist item, does not exist)
#Scenario:Replace Red with CCCCC and update CRF using CDISS web service
#		CRF should not be updated and error message should be thrown
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show Red in the Color1 filed 
#
##Positive
#Scenario:Replace Red with EMPTY and update CRF using CDISS web service
#
#Scenario:Login Datalabs and check whether value is updated or not
#		 CRF should show BLANK in the LabId filed 
#
################################## DL:  CRF changes for Codelist Linkages (Non-autobuild table questions) #############################################
#
#Scenario: Uplodad and Publish a study having two questions of type codeList and having linkages between them.
#
#eg: 
#	Type of Measure (Codelist)	- Weight,	Height, Width, Speed (Codelist itmes)
#	Measurement (Codelist)	- Kgs, Pounds, Feets, Inches, KMPH, Miles Per hour (Codelist items)
#		
#	Linkage
#		[BLANK]- 
#		Weight - Kgs, Pounds
#		Height - Feets, Inches
#		Width - Feets, Inches
#		Speed - KMPH, MPH
#
#Scenario: Check out for the first time and check for values
#	For the question 'Type of Measure' I should see [BLANK] as default value, if BLANK is set otherwise nothing should be shown
#	For the question 'Type of Measure' I should see [BLANK], Weight, Height, Width, Speed as dropdown values
#	For the question 'Measurement' I should see nothing in the dropdown
#	For the question 'Measurement' I should see nothing in the dropdown even after cliking the dropdown
#
#Scenario: Check for Weight item linkage
#	When For the question 'Type of Measure' I selected 'Weight' dropdown item
#	Then I should see Kgs and Pounds  in 'Measurement' question
#	
#Scenario: Save the CRF and check for value is saved or not
#	When I selected Kgs in 'Measurement' question and save th CRF
#	Then I should see Kgs as saved item in 'Measurement' question
#
#Scenario: Check for Height item linkage
#	When For the question 'Type of Measure' I selected 'Height' dropdown item
#	Then Present selected item in 'Measurement' field should be cleared
#	And I should see Feets and Inches  in 'Measurement' question
#	
#Scenario: Save the CRF and check for value is saved or not
#	When I selected Feets in 'Measurement' question and save th CRF
#	Then I should see Feets as saved item in 'Measurement' question
#
#Scenario: Check for Width item linkage
#	When For the question 'Type of Measure' I selected 'Width' dropdown item
#	Then Present selected item in 'Measurement' field should be cleared
#	And I should see Feets and Inches  in 'Measurement' question
#	
#Scenario: Save the CRF and check for value is saved or not
#	When I selected Inches in 'Measurement' question and save th CRF
#	Then I should see Inches as saved item in 'Measurement' question
#
#Scenario: Check for Speed item linkage
#	When For the question 'Type of Measure' I selected 'Speed' dropdown item
#	Then Present selected item in 'Measurement' field should be cleared
#	And I should see KMPH and MPH  in 'Measurement' question
#	
#Scenario: Save the CRF and check for value is saved or not
#	When I selected KMPH in 'Measurement' question and save th CRF
#	Then I should see KMPH as saved item in 'Measurement' question
#
##Above scenarios should executed for Flat question and regular table questions.
##Coldelist linkges with gourping and without grouping
##Audit table needs to be checked for workflow data
#
#
#
