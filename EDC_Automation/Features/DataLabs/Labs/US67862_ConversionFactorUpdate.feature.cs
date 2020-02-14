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
    [NUnit.Framework.DescriptionAttribute("US67862_ConversionFactorUpdate")]
    public partial class US67862_ConversionFactorUpdateFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "US67862_ConversionFactorUpdate.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "US67862_ConversionFactorUpdate", null, ProgrammingLanguage.CSharp, ((string[])(null)));
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
#line 3
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 4
 testRunner.Given("I logged in to DataLabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 5
 testRunner.Then("I see Datalabs Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("02_Delete a study")]
        public virtual void _02_DeleteAStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("02_Delete a study", null, ((string[])(null)));
#line 7
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 8
 testRunner.When("I delete study", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 9
 testRunner.Then("I see study label \"No Study Loaded\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("03_Upload and publish the study.")]
        public virtual void _03_UploadAndPublishTheStudy_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("03_Upload and publish the study.", null, ((string[])(null)));
#line 11
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 12
    testRunner.When("I click breadcrumb \"Study Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 13
    testRunner.And("I upload a study \"Import_US61472_Base1.zip\" with study label \"Questions\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 14
    testRunner.Then("I see study label \"Test4500_CodleistLinkages_Base\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("10_Add patient 01-PAT from Datalabs UI")]
        public virtual void _10_AddPatient01_PATFromDatalabsUI()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("10_Add patient 01-PAT from Datalabs UI", null, ((string[])(null)));
#line 16
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 17
      testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 18
      testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "ScreenID",
                        "PatientInitials",
                        "ScreenDate"});
            table1.AddRow(new string[] {
                        "01",
                        "PAT",
                        "06/14/2019"});
#line 19
      testRunner.When("I add patient with below details.", ((string)(null)), table1, "When ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "PatientID"});
            table2.AddRow(new string[] {
                        "01-PAT"});
#line 22
  testRunner.Then("I see below patients added in the Patients table.", ((string)(null)), table2, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("11_Add a new lab test reference range record under Lab01 and Test 01")]
        public virtual void _11_AddANewLabTestReferenceRangeRecordUnderLab01AndTest01()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("11_Add a new lab test reference range record under Lab01 and Test 01", null, ((string[])(null)));
#line 26
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 27
  testRunner.Given("I navigate to \"Local Labs\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 28
     testRunner.When("I open lab with labid \"L01\" from ManageReferenceRanges page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 29
  testRunner.And("I open labtest with labname \"01\" from labtests page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
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
            table3.AddRow(new string[] {
                        "02/03/2019",
                        "03/03/2022",
                        "Male",
                        "=",
                        "20",
                        "=",
                        "35",
                        "=",
                        "3",
                        "=",
                        "15",
                        "=",
                        "2.41",
                        "=",
                        "25.71",
                        "01",
                        "Yes"});
            table3.AddRow(new string[] {
                        "03/04/2022",
                        "05/03/2025",
                        "Male",
                        "=",
                        "20",
                        "=",
                        "35",
                        "=",
                        "5",
                        "=",
                        "10",
                        "=",
                        "2.41",
                        "=",
                        "25.71",
                        "02",
                        "Yes"});
#line 30
  testRunner.And("I click add and enter reference ranges of a lab test and Save and can see \"LabTes" +
                    "t Reference Range Added Successfully\" message upon each record save in Reference" +
                    "RangesPage including NA", ((string)(null)), table3, "And ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "ReferenceRangeID"});
            table4.AddRow(new string[] {
                        "{ReferenceRangeID1}"});
            table4.AddRow(new string[] {
                        "{ReferenceRangeID2}"});
#line 34
  testRunner.Then("I see the reference range ids in the Reference Range Table.", ((string)(null)), table4, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("13_Navigate to site and select patient")]
        public virtual void _13_NavigateToSiteAndSelectPatient()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("13_Navigate to site and select patient", null, ((string[])(null)));
#line 39
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 40
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 41
     testRunner.When("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 42
      testRunner.And("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 43
      testRunner.Then("I see Patient details page for \"01-PAT\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("14_Expand the Visit (Screening) and open the demographics form to update the data" +
            "")]
        public virtual void _14_ExpandTheVisitScreeningAndOpenTheDemographicsFormToUpdateTheData()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("14_Expand the Visit (Screening) and open the demographics form to update the data" +
                    "", null, ((string[])(null)));
#line 46
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 47
   testRunner.When("I expand \"Visit (Screening)\" to select and open \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 48
      testRunner.And("I click \"Checkout\" button on \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table5.AddRow(new string[] {
                        "Gender:",
                        "Male",
                        "ListBox"});
            table5.AddRow(new string[] {
                        "Age at Study Start:",
                        "31",
                        "TextBox"});
            table5.AddRow(new string[] {
                        "Age Units at Study Start:",
                        "Years",
                        "ListBox"});
#line 49
      testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table5, "And ");
#line 54
   testRunner.And("I click on \"Save & Close\" button on \"Demographics RTSM\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 55
   testRunner.Then("The CRF with data is saved and checked-in successfully.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("15_Expand the Visit (Week2) event and open the LabForm1 form and update the data")]
        public virtual void _15_ExpandTheVisitWeek2EventAndOpenTheLabForm1FormAndUpdateTheData()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("15_Expand the Visit (Week2) event and open the LabForm1 form and update the data", null, ((string[])(null)));
#line 58
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 59
   testRunner.When("I expand \"Visit (Week 2)\" to select and open \"LabForm1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 60
      testRunner.And("I click \"Checkout\" button on \"LabForm1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table6.AddRow(new string[] {
                        "Lab ID",
                        "Lab01 (L01)",
                        "ListBox"});
            table6.AddRow(new string[] {
                        "CRF Collection Date",
                        "02/28/2019",
                        "TextBox"});
#line 61
      testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table6, "And ");
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "AddNewRow",
                        "RowNumber",
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType",
                        "RowButtonToClick"});
            table7.AddRow(new string[] {
                        "No",
                        "2",
                        "CRF Lab value",
                        "16",
                        "TextBox",
                        ""});
            table7.AddRow(new string[] {
                        "No",
                        "2",
                        "CRF Lab Unit",
                        "01",
                        "ListBox",
                        "Save & Close Row"});
#line 65
   testRunner.And("I enter below \"Autobuild Table:\" autobuild table questions data in the CRF.", ((string)(null)), table7, "And ");
#line 69
   testRunner.And("I click on \"Save & Close\" button on \"LabForm1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 70
   testRunner.Then("The CRF with data is saved and checked-in successfully.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("16_Verify the Lab report data")]
        public virtual void _16_VerifyTheLabReportData()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("16_Verify the Lab report data", null, ((string[])(null)));
#line 72
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 73
  testRunner.When("I collapse event \"Visit (Week 2)\" in PatientPortal", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 74
   testRunner.And("I expand \"Visit (Week 2)\" to select and open \"LabForm1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 75
   testRunner.And("I expand row \"2\" of table \"Autobuild Table:\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                        "RowNumber",
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType",
                        "RowButtonToClick"});
            table8.AddRow(new string[] {
                        "2",
                        "CRFLabTestName",
                        "Test1",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "LabTestDescription",
                        "01",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "CRF Lab Unit",
                        "01",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "CRF Lab value",
                        "16",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "LabTestName",
                        "01",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "LabTestCode",
                        "01",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "LOINCCode",
                        "11",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "Category",
                        "cup1",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "Subcategory",
                        "subcup1",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "Specimen",
                        "speccup1",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "Method",
                        "Metcup1",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "ResultType",
                        "Rescup1",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "NormalReferenceRangeHigh",
                        "15.00",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "CriticalReferenceRangeLow",
                        "2.41",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "NormalReferenceRangeLow",
                        "3.00",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "CriticalReferenceRangeHigh",
                        "25.71",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "ReferenceRangeNotApplicable",
                        "Yes",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "NormalizedPatientLabValue",
                        "144.00",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "NormalizedLabUnit",
                        "01",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "NormalizedReferenceRangeLow",
                        "27.00",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "NormalizedNormalReferenceRangeHigh",
                        "135.00",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "NormalizedCriticalReferenceRangeLow",
                        "21.69",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "ReferenceRangeNotApplicable",
                        "Yes",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "NormalizedCriticalReferenceRangeHigh",
                        "231.39",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "Precision",
                        "2",
                        "Text",
                        ""});
            table8.AddRow(new string[] {
                        "2",
                        "ConversionFactor",
                        "9",
                        "Text",
                        "OK"});
#line 76
   testRunner.Then("I verify below \"Autobuild Table:\" table questions data in the CRF.", ((string)(null)), table8, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion
