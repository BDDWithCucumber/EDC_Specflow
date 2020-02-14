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
namespace EDC_Automation.Features.DataLabs.TempFeatures
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("SafetyTemp")]
    public partial class SafetyTempFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "SafetyTemp.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "SafetyTemp", "\tSafety Scenarios", ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("T01_Login to Datalabs")]
        public virtual void T01_LoginToDatalabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T01_Login to Datalabs", null, ((string[])(null)));
#line 4
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 5
 testRunner.Given("I logged in to DataLabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 6
 testRunner.Then("I see Datalabs Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T02_Delete a study")]
        public virtual void T02_DeleteAStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T02_Delete a study", null, ((string[])(null)));
#line 8
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 9
 testRunner.When("I delete study", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 10
 testRunner.Then("I see study label \"No Study Loaded\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T03_Publish a study")]
        public virtual void T03_PublishAStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T03_Publish a study", null, ((string[])(null)));
#line 12
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 13
 testRunner.When("I click breadcrumb \"Study Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 14
 testRunner.And("I upload a study \"Breaze_Complete.zip\" with study label \"Breaze Study\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 15
 testRunner.Then("I see study label \"Breaze 8392\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T04_Add Sites")]
        public virtual void T04_AddSites()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T04_Add Sites", null, ((string[])(null)));
#line 17
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 18
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 19
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
#line 20
 testRunner.And("I enter sites details and Save", ((string)(null)), table1, "And ");
#line 23
 testRunner.Then("I see site \"01-Site\" in SiteManagementPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T05_Assign testadmin testadmin user to site 01")]
        public virtual void T05_AssignTestadminTestadminUserToSite01()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T05_Assign testadmin testadmin user to site 01", null, ((string[])(null)));
#line 25
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 26
 testRunner.When("I open site with siteid \"01\" and site name \"Site\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 27
 testRunner.And("I click ActionPalette Item \"Manage Users\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 28
 testRunner.And("I add and save user \"testadmin testadmin\" to site users in SiteManageUsersPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 29
 testRunner.Then("I see Site details page for \"01-Site\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T06_Navigate to Patients tab and select a site and add patient(s).")]
        public virtual void T06_NavigateToPatientsTabAndSelectASiteAndAddPatientS_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T06_Navigate to Patients tab and select a site and add patient(s).", null, ((string[])(null)));
#line 31
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 32
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 33
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "PatientID",
                        "Date"});
            table2.AddRow(new string[] {
                        "01",
                        "16-sep-2019"});
#line 34
 testRunner.When("I add below patient without initials.", ((string)(null)), table2, "When ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "PatientID"});
            table3.AddRow(new string[] {
                        "01"});
#line 37
 testRunner.Then("I see below patients added in the Patients table.", ((string)(null)), table3, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T07_Select a site and a patient.")]
        public virtual void T07_SelectASiteAndAPatient_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T07_Select a site and a patient.", null, ((string[])(null)));
#line 41
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 42
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 43
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 44
 testRunner.When("I select the patient \"01\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 45
 testRunner.Then("I see Patient details page for \"01\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T08_Select a Form with with both flat and table questions and enter data in CRF.")]
        public virtual void T08_SelectAFormWithWithBothFlatAndTableQuestionsAndEnterDataInCRF_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T08_Select a Form with with both flat and table questions and enter data in CRF.", null, ((string[])(null)));
#line 47
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 48
 testRunner.Given("I expand \"Common\" to select and open \"Adverse Events\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 49
 testRunner.When("I click \"Checkout\" button on \"Adverse Events\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table4.AddRow(new string[] {
                        "Were there any adverse events?",
                        "Yes",
                        "Radio"});
            table4.AddRow(new string[] {
                        "Did any unusual and/or unexpected symptoms occur?",
                        "No",
                        "LISTBOX"});
#line 50
 testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table4, "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "AddNewRow",
                        "RowNumber",
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType",
                        "RowButtonToClick"});
            table5.AddRow(new string[] {
                        "Yes",
                        "1",
                        "Adverse Event Type:",
                        "Adverse Event",
                        "LISTBOX",
                        ""});
            table5.AddRow(new string[] {
                        "No",
                        "1",
                        "Adverse Event:",
                        "Heartattack",
                        "TextBox",
                        ""});
            table5.AddRow(new string[] {
                        "No",
                        "1",
                        "Adverse Event Coding:",
                        "999",
                        "TextBox",
                        ""});
            table5.AddRow(new string[] {
                        "No",
                        "1",
                        "Serious (If Yes, select all that apply 3.X.5-3.X.10):",
                        "Yes",
                        "Radio",
                        ""});
            table5.AddRow(new string[] {
                        "No",
                        "1",
                        "- Results in Death:",
                        "[Blank]",
                        "Radio",
                        "Save & Close Row"});
#line 54
 testRunner.And("I enter below \"Please specify Adverse Event:\" table questions data in the CRF.", ((string)(null)), table5, "And ");
#line 61
 testRunner.And("I click Continue button of Modal \"Queries Result\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 62
 testRunner.And("I click on \"Save & Close\" button on \"Adverse Events\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 63
 testRunner.Then("The CRF with data is saved and checked-in successfully.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T09_Navigate to safety tab and verify the safety screen.")]
        public virtual void T09_NavigateToSafetyTabAndVerifyTheSafetyScreen_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T09_Navigate to safety tab and verify the safety screen.", null, ((string[])(null)));
#line 65
 this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 66
 testRunner.Given("I navigate to \"Safety\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 67
 testRunner.Then("I see Safety details screen", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion
