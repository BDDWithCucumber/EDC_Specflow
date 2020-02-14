﻿// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by SpecFlow (http://www.specflow.org/).
//      SpecFlow Version:2.4.0.0
//      SpecFlow Generator Version:2.4.0.0
// 
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------
#region Designer generated code
#pragma warning disable
namespace EDC_Automation.Features.DataLabs.Labs
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("PopulateOtherLabMappingsOptionalFieldsInDB")]
    public partial class PopulateOtherLabMappingsOptionalFieldsInDBFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "Labs_Populate other Lab Mappings optional fields in DB_Not questions.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "PopulateOtherLabMappingsOptionalFieldsInDB", "\t\tTest Summary:\r\n\r\n\t\t1. Verify data is populated for Lab Test Description, Refere" +
                    "nce Range Not Applicable, Reference Range ID, Precision,Conversion Factor in DB " +
                    "based on Lab Mappings.", ProgrammingLanguage.CSharp, ((string[])(null)));
            testRunner.OnFeatureStart(featureInfo);
        }
        
        [NUnit.Framework.OneTimeTearDownAttribute()]
        public virtual void FeatureTearDown()
        {
            testRunner.OnFeatureEnd();
            testRunner = null;
        }
        
        [NUnit.Framework.SetUpAttribute()]
        public virtual void TestInitialize()
        {
        }
        
        [NUnit.Framework.TearDownAttribute()]
        public virtual void ScenarioTearDown()
        {
            testRunner.OnScenarioEnd();
        }
        
        public virtual void ScenarioInitialize(TechTalk.SpecFlow.ScenarioInfo scenarioInfo)
        {
            testRunner.OnScenarioInitialize(scenarioInfo);
            testRunner.ScenarioContext.ScenarioContainer.RegisterInstanceAs<NUnit.Framework.TestContext>(NUnit.Framework.TestContext.CurrentContext);
        }
        
        public virtual void ScenarioStart()
        {
            testRunner.OnScenarioStart();
        }
        
        public virtual void ScenarioCleanup()
        {
            testRunner.CollectScenarioErrors();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("01_Login to Datalabs")]
        public virtual void _01_LoginToDatalabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("01_Login to Datalabs", null, ((string[])(null)));
#line 12
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 13
 testRunner.Given("I logged in to DataLabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 14
 testRunner.Then("I see Datalabs Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("02_Delete a study")]
        public virtual void _02_DeleteAStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("02_Delete a study", null, ((string[])(null)));
#line 16
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 17
 testRunner.When("I delete study", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 18
 testRunner.Then("I see study label \"No Study Loaded\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("03_Upload and publish the study.")]
        public virtual void _03_UploadAndPublishTheStudy_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("03_Upload and publish the study.", null, ((string[])(null)));
#line 20
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 21
    testRunner.When("I click breadcrumb \"Study Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 22
    testRunner.And("I upload a study \"Test4500_Labs_Original_R.zip\" with study label \"Test4500_Codlei" +
                    "stLinkages_Base\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 23
    testRunner.Then("I see study label \"Test4500_CodleistLinkages_Base\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("04_Add sites and associate user.")]
        public virtual void _04_AddSitesAndAssociateUser_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("04_Add sites and associate user.", null, ((string[])(null)));
#line 25
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 26
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 27
 testRunner.And("I click Link \"Site Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "SiteId",
                        "SiteName",
                        "Address1",
                        "Address2",
                        "Address3",
                        "Address4",
                        "City",
                        "State",
                        "Zip",
                        "ISOCountry",
                        "Country",
                        "Phone",
                        "Fax",
                        "SiteStatus",
                        "DCFWorkflow",
                        "ExternalSource",
                        "ExternalId"});
            table1.AddRow(new string[] {
                        "01",
                        "Site",
                        "ADDRESS",
                        "ADDRESS",
                        "ADDRESS",
                        "ADDRESS",
                        "Hyderabad",
                        "AP",
                        "500060",
                        "INDIA(IND)",
                        "",
                        "9999999999",
                        "66666666666",
                        "Active",
                        "Electronic",
                        "No",
                        "-"});
#line 28
 testRunner.And("I enter sites details and Save", ((string)(null)), table1, "And ");
#line 31
 testRunner.And("I open site with siteid \"01\" and site name \"Site\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 32
 testRunner.And("I click ActionPalette Item \"Manage Users\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 33
 testRunner.And("I add and save user \"testadmin testadmin\" to site users in SiteManageUsersPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 34
 testRunner.Then("I see Site details page for \"01-Site\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("05_Add Labs")]
        public virtual void _05_AddLabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("05_Add Labs", null, ((string[])(null)));
#line 37
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 38
 testRunner.When("I click breadcrumb \"Study Administration\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 39
 testRunner.And("I click Link \"Lab Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 40
 testRunner.And("I click Link \"Manage Laboratories\" In Lab Management Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "Address1",
                        "Address2",
                        "Address3",
                        "City",
                        "State",
                        "Zip",
                        "ISOCountry",
                        "Country",
                        "Phone",
                        "Fax",
                        "LaboratoryStatus",
                        "ContactPerson"});
            table2.AddRow(new string[] {
                        "L01",
                        "Lab01",
                        "Perceptive",
                        "EDC",
                        "Building No 20",
                        "Mindspace",
                        "Hitech city",
                        "Hyderabad",
                        "TG",
                        "500081",
                        "INDIA(IND)",
                        "",
                        "11111111",
                        "22222222",
                        "Active",
                        "Mr.XYZ"});
#line 41
 testRunner.And("I enter labs details and Save", ((string)(null)), table2, "And ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "Address1",
                        "Address2",
                        "Address3",
                        "City",
                        "State",
                        "Zip",
                        "ISOCountry",
                        "Country",
                        "Phone",
                        "Fax",
                        "LaboratoryStatus",
                        "ContactPerson"});
            table3.AddRow(new string[] {
                        "L01",
                        "Lab01",
                        "Perceptive",
                        "EDC",
                        "Building No 20",
                        "Mindspace",
                        "Hitech city",
                        "Hyderabad",
                        "TG",
                        "500081",
                        "INDIA(IND)",
                        "INDIA",
                        "11111111",
                        "22222222",
                        "Active",
                        "Mr.XYZ"});
#line 44
 testRunner.Then("I see labs with details in lab grid", ((string)(null)), table3, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("06_Associate Lab L01 to 01-Site")]
        public virtual void _06_AssociateLabL01To01_Site()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("06_Associate Lab L01 to 01-Site", null, ((string[])(null)));
#line 49
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 50
 testRunner.When("I click breadcrumb \"Study Administration\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 51
 testRunner.And("I click Link \"Site Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 52
 testRunner.And("I open site with siteid \"01\" and site name \"Site\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 53
 testRunner.And("I click ActionPalette Item \"Associate Lab(s)\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 54
 testRunner.And("I add and save lab id \"L01\" and lab name \"Lab01\" to associated labs in AssociateL" +
                    "abs page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 55
 testRunner.And("I select sub tab \"Labs\" in site page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "LaboratoryStatus"});
            table4.AddRow(new string[] {
                        "L01",
                        "Lab01",
                        "Perceptive",
                        "EDC",
                        "Active"});
#line 56
 testRunner.Then("I see lab data in labs tab of Site in SitePage", ((string)(null)), table4, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("07_Add Patient")]
        public virtual void _07_AddPatient()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("07_Add Patient", null, ((string[])(null)));
#line 60
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 61
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 62
    testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "ScreenID",
                        "PatientInitials",
                        "ScreenDate"});
            table5.AddRow(new string[] {
                        "01",
                        "PAT",
                        "06/13/2019"});
#line 63
    testRunner.When("I add patient with below details.", ((string)(null)), table5, "When ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "PatientID"});
            table6.AddRow(new string[] {
                        "01-PAT"});
#line 66
 testRunner.Then("I see below patients added in the Patients table.", ((string)(null)), table6, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("08_Select and enroll patient 01-PAT.")]
        public virtual void _08_SelectAndEnrollPatient01_PAT_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("08_Select and enroll patient 01-PAT.", null, ((string[])(null)));
#line 70
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 71
      testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 72
      testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 73
      testRunner.And("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "EnrollID",
                        "EnrollDate",
                        "EntryComplete"});
            table7.AddRow(new string[] {
                        "01",
                        "06/13/2019",
                        "Yes"});
#line 74
      testRunner.When("I enroll the patient \"01-PAT\" with below data.", ((string)(null)), table7, "When ");
#line 77
      testRunner.Then("I see patient \"01-PAT\" status as \"Enrolled\" on Patient details page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("09_Add a new lab test reference range record")]
        public virtual void _09_AddANewLabTestReferenceRangeRecord()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("09_Add a new lab test reference range record", null, ((string[])(null)));
#line 80
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 81
  testRunner.Given("I navigate to \"Local Labs\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 82
     testRunner.When("I open lab with labid \"L01\" from ManageReferenceRanges page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 83
  testRunner.And("I open labtest with labname \"01\" from labtests page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                        "StartDate",
                        "EndDate",
                        "Gender",
                        "FromAgeSelect",
                        "FromAgeSet",
                        "ToAgeSelect",
                        "ToAgeSet",
                        "NormalRangeLowSelect",
                        "NormalRangeLowSet",
                        "NormalRangeHighSelect",
                        "NormalRangeHighSet",
                        "ClinicalRangeLowSelect",
                        "ClinicalRangeLowSet",
                        "ClinicalRangeHighSelect",
                        "ClinicalRangeHighSet",
                        "Unit",
                        "NA"});
            table8.AddRow(new string[] {
                        "02/25/2019",
                        "03/03/2020",
                        "Male",
                        ">",
                        "20",
                        "<",
                        "35",
                        ">",
                        "3",
                        "<",
                        "15",
                        ">",
                        "1.41",
                        "<",
                        "25.71",
                        "in",
                        "False"});
#line 84
  testRunner.And("I click add and enter reference ranges of a lab test and Save and can see \"LabTes" +
                    "t Reference Range Added Successfully\" message upon each record save in Reference" +
                    "RangesPage including NA", ((string)(null)), table8, "And ");
#line hidden
            TechTalk.SpecFlow.Table table9 = new TechTalk.SpecFlow.Table(new string[] {
                        "ReferenceRangeID"});
            table9.AddRow(new string[] {
                        "{ReferenceRangeID1}"});
#line 87
   testRunner.Then("I see the reference range ids in the Reference Range Table.", ((string)(null)), table9, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("10_Navigate to site and select patient")]
        public virtual void _10_NavigateToSiteAndSelectPatient()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("10_Navigate to site and select patient", null, ((string[])(null)));
#line 91
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 92
      testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 93
      testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 94
      testRunner.When("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 95
      testRunner.Then("I see Patient details page for \"01-PAT\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("11_Expand the Visit (Screening) and open the demographics form to update the data" +
            ".")]
        public virtual void _11_ExpandTheVisitScreeningAndOpenTheDemographicsFormToUpdateTheData_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("11_Expand the Visit (Screening) and open the demographics form to update the data" +
                    ".", null, ((string[])(null)));
#line 97
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 98
   testRunner.And("I expand \"Visit (Screening)\" to select and open \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 99
      testRunner.When("I click \"Checkout\" button on \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table10 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table10.AddRow(new string[] {
                        "Gender:",
                        "Male",
                        "ListBox"});
            table10.AddRow(new string[] {
                        "Age at Study Start:",
                        "31",
                        "TextBox"});
            table10.AddRow(new string[] {
                        "Age Units at Study Start:",
                        "Years",
                        "ListBox"});
#line 100
      testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table10, "And ");
#line 105
   testRunner.And("I click on \"Save & Close\" button on \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 106
   testRunner.Then("The CRF with data is saved and checked-in successfully.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("12_Expand the Visit (Week2) event and open the LabForm3 form and update the data." +
            "")]
        public virtual void _12_ExpandTheVisitWeek2EventAndOpenTheLabForm3FormAndUpdateTheData_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("12_Expand the Visit (Week2) event and open the LabForm3 form and update the data." +
                    "", null, ((string[])(null)));
#line 108
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 109
   testRunner.When("I expand \"Visit (Week 2)\" to select and open \"LabForm3\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 110
      testRunner.And("I click \"Checkout\" button on \"LabForm3\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table11 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table11.AddRow(new string[] {
                        "Lab ID2",
                        "Lab01 (L01)",
                        "ListBox"});
            table11.AddRow(new string[] {
                        "CRF Collection Date2",
                        "10/28/2019",
                        "TextBox"});
#line 111
      testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table11, "And ");
#line hidden
            TechTalk.SpecFlow.Table table12 = new TechTalk.SpecFlow.Table(new string[] {
                        "AddNewRow",
                        "RowNumber",
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType",
                        "RowButtonToClick"});
            table12.AddRow(new string[] {
                        "No",
                        "2",
                        "CRF Lab Value2",
                        "16",
                        "TextBox",
                        ""});
            table12.AddRow(new string[] {
                        "No",
                        "2",
                        "CRF Lab Unit2",
                        "01",
                        "ListBox",
                        "Save & Close Row"});
#line 115
   testRunner.And("I enter below \"Autobuild Table2:\" autobuild table questions data in the CRF.", ((string)(null)), table12, "And ");
#line 119
   testRunner.And("I click on \"Save & Close\" button on \"LabForm3\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 120
   testRunner.Then("The CRF with data is saved and checked-in successfully.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("13_Verify Lab Mappings optional fields in DB.")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("US59797.1")]
        public virtual void _13_VerifyLabMappingsOptionalFieldsInDB_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("13_Verify Lab Mappings optional fields in DB.", null, new string[] {
                        "ObjectiveEvidence",
                        "US59797.1"});
#line 124
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 125
   testRunner.Given("I have connected to Database.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 126
   testRunner.When("I execute the query \"select DataValue from PatientData where DataRowActive = \'0\'\"" +
                    ".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table13 = new TechTalk.SpecFlow.Table(new string[] {
                        "Data Value"});
            table13.AddRow(new string[] {
                        "01"});
            table13.AddRow(new string[] {
                        "> 3.00"});
            table13.AddRow(new string[] {
                        "< 15.00"});
            table13.AddRow(new string[] {
                        "> 20.41"});
            table13.AddRow(new string[] {
                        "< 25.71"});
            table13.AddRow(new string[] {
                        "No"});
            table13.AddRow(new string[] {
                        "{ReferenceRangeID1}"});
            table13.AddRow(new string[] {
                        "Above normal range high"});
            table13.AddRow(new string[] {
                        "2"});
            table13.AddRow(new string[] {
                        "2"});
#line 127
   testRunner.Then("The below result should be retrieved with Reference Range ID.", ((string)(null)), table13, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("14_Expand the Event1 and open the demographics form to update the data.")]
        public virtual void _14_ExpandTheEvent1AndOpenTheDemographicsFormToUpdateTheData_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("14_Expand the Event1 and open the demographics form to update the data.", null, ((string[])(null)));
#line 140
 this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 141
   testRunner.When("I expand \"Visit (Screening)\" to select and open \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 142
      testRunner.And("I click \"Checkout\" button on \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table14 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "CurrentAnswerValue",
                        "NewAnswerValue",
                        "ReasonForChange",
                        "AdditionalNotes",
                        "AnswerFieldType"});
            table14.AddRow(new string[] {
                        "Gender:",
                        "Male",
                        "Female",
                        "DCF",
                        "",
                        "ListBox"});
#line 143
      testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table14, "And ");
#line 146
   testRunner.And("I click on \"Save & Close\" button on \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 147
   testRunner.Then("The CRF with data is saved and checked-in successfully.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("15_Verify Lab Mappings optional fields in DB.")]
        public virtual void _15_VerifyLabMappingsOptionalFieldsInDB_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("15_Verify Lab Mappings optional fields in DB.", null, ((string[])(null)));
#line 149
 this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 150
   testRunner.Given("I have connected to Database.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 151
   testRunner.When("I execute the query \"select DataValue from PatientData where DataRowActive = \'0\'\"" +
                    ".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table15 = new TechTalk.SpecFlow.Table(new string[] {
                        "Data Value"});
            table15.AddRow(new string[] {
                        "01"});
            table15.AddRow(new string[] {
                        ""});
            table15.AddRow(new string[] {
                        ""});
            table15.AddRow(new string[] {
                        ""});
            table15.AddRow(new string[] {
                        ""});
            table15.AddRow(new string[] {
                        ""});
            table15.AddRow(new string[] {
                        ""});
            table15.AddRow(new string[] {
                        ""});
            table15.AddRow(new string[] {
                        "2"});
            table15.AddRow(new string[] {
                        "2"});
#line 152
   testRunner.Then("The below result should be retrieved with Reference Range ID.", ((string)(null)), table15, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

