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
namespace EDC_Automation.Features.Designer
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("Designer Scripting")]
    public partial class DesignerScriptingFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "US51092_CodelistgroupsinQueryscripting.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Designer Scripting", null, ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("T01_When I Login to Designer then I see the Designer home page")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.01")]
        public virtual void T01_WhenILoginToDesignerThenISeeTheDesignerHomePage()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T01_When I Login to Designer then I see the Designer home page", null, new string[] {
                        "ObjectiveEvidence",
                        "ObjectiveEvidence",
                        "ReqID:US63653.01"});
#line 12
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 13
 testRunner.Given("I logged in to Designer", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 14
 testRunner.Then("I see Designer Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T02_When I Import Study")]
        public virtual void T02_WhenIImportStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T02_When I Import Study", null, ((string[])(null)));
#line 16
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 17
 testRunner.When("I click on the Link \"Import Study\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 18
 testRunner.And("I import a study \"Scripting_1.zip\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 19
 testRunner.And("Enter the unique study name \"Import1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 20
 testRunner.And("Select the sponsor name \"Sponsor1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 21
 testRunner.And("I click on the Save button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 22
 testRunner.And("I should see the notification \"Study has been successfully added\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 23
 testRunner.And("I click on the Link \"View Study Jobs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 24
 testRunner.Then("I should see the status of the study \"Study Import (Import1)\" in \"Complete\" state" +
                    "", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T03_Create CodeLists and CodeLists Items")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.65")]
        public virtual void T03_CreateCodeListsAndCodeListsItems()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T03_Create CodeLists and CodeLists Items", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63653.65"});
#line 27
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 28
 testRunner.When("I click on the \"Home\" tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 29
 testRunner.And("I click on the Link \"Import1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 30
 testRunner.Then("User sees the \"Study\" page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T04_Create CodeLists and CodeLists Items")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.65")]
        public virtual void T04_CreateCodeListsAndCodeListsItems()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T04_Create CodeLists and CodeLists Items", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63653.65"});
#line 33
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 34
 testRunner.When("I click on the \"Scripting\" tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 35
 testRunner.Then("User sees the \"Scripting\" page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T05_Add Parameter")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.65")]
        public virtual void T05_AddParameter()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T05_Add Parameter", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63653.65"});
#line 38
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 39
 testRunner.When("I click on the Link \"Query1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 40
 testRunner.When("I click on the Link \"Add Parameter\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 41
 testRunner.And("I enter the Parameter Name \"PAR1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 42
 testRunner.And("I select the Reference", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 43
 testRunner.And("I enter the Reference value \"Data.Visit02.ScriptingForm_DEF.DomainItem.DomainItem" +
                    ".Value\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 44
 testRunner.And("I click on the Parameter Save button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 45
 testRunner.Then("User sees the \"Query1\" page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T06_Add Test Case")]
        public virtual void T06_AddTestCase()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T06_Add Test Case", null, ((string[])(null)));
#line 47
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 48
 testRunner.When("I click on the Test case Sub tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 49
 testRunner.And("I click on the Link \"Add Test Case\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "Dropdown"});
            table1.AddRow(new string[] {
                        "Codelist_DEF1"});
            table1.AddRow(new string[] {
                        "Codelist_DEF2"});
            table1.AddRow(new string[] {
                        "Codelist_DEF3"});
#line 51
 testRunner.Then("user should see the below values in Testvalue dropdown", ((string)(null)), table1, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T07_Create CodeLists and CodeLists Items")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.65")]
        public virtual void T07_CreateCodeListsAndCodeListsItems()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T07_Create CodeLists and CodeLists Items", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63653.65"});
#line 58
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 59
 testRunner.When("I click on the Codelists Button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 60
 testRunner.And("click on link \"Groups\" tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 61
 testRunner.And("I click on the Link \"Group1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 62
 testRunner.And("I select the Codelist \"DEF\" that we want to assign to group", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 63
 testRunner.And("I remove country name \"Codelist_DEF1\" and country description \"Codelist_DEF1_desc" +
                    "\" to group clodelist items", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 64
 testRunner.And("Click on the CodelistGroup \"Group1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 65
 testRunner.And("I select the Codelist \"DEF\" that we want to assign to group", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 66
 testRunner.And("I add country name \"Codelist_DEF4\" and country description \"Codelist_DEF4_desc\" t" +
                    "o group clodelist items", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 67
 testRunner.Then("I see the link \"Group1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T08_Create CodeLists and CodeLists Items")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.65")]
        public virtual void T08_CreateCodeListsAndCodeListsItems()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T08_Create CodeLists and CodeLists Items", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63653.65"});
#line 71
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 72
 testRunner.When("I click on the \"Scripting\" tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 73
 testRunner.Then("User sees the \"Scripting\" page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T09_Create CodeLists and CodeLists Items")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.65")]
        public virtual void T09_CreateCodeListsAndCodeListsItems()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T09_Create CodeLists and CodeLists Items", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63653.65"});
#line 76
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 77
 testRunner.When("I click on the Link \"Query1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 78
 testRunner.Then("User sees the \"Query1\" page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T10_Add Test Case")]
        public virtual void T10_AddTestCase()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T10_Add Test Case", null, ((string[])(null)));
#line 80
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 81
 testRunner.When("I click on the Test case Sub tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 82
 testRunner.And("I click on the Link \"Add Test Case\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "Dropdown"});
            table2.AddRow(new string[] {
                        "Codelist_DEF2"});
            table2.AddRow(new string[] {
                        "Codelist_DEF3"});
            table2.AddRow(new string[] {
                        "Codelist_DEF4"});
#line 84
 testRunner.Then("user should see the below values in Testvalue dropdown", ((string)(null)), table2, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T11_Create CodeLists and CodeLists Items")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.65")]
        public virtual void T11_CreateCodeListsAndCodeListsItems()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T11_Create CodeLists and CodeLists Items", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63653.65"});
#line 91
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 92
 testRunner.When("I click on the Codelists Button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 93
 testRunner.And("click on link \"Groups\" tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 94
 testRunner.And("I Check on the CodelistGroup \"Group1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 95
 testRunner.And("I click on the \"Delete Group\" link", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 96
 testRunner.And("I click Continue on Target App pop up having  title \"Delete\" and partial message " +
                    "\"Deleting a Group will dissociate all associated Codelist code items and Questio" +
                    "ns.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 97
 testRunner.And("I click on the \"Scripting\" tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 98
 testRunner.Then("User sees the \"Scripting\" page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T12_Create CodeLists and CodeLists Items")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63653.65")]
        public virtual void T12_CreateCodeListsAndCodeListsItems()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T12_Create CodeLists and CodeLists Items", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63653.65"});
#line 101
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 102
 testRunner.When("I click on the Link \"Query1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 103
 testRunner.Then("User sees the \"Query1\" page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T13_Add Test Case")]
        public virtual void T13_AddTestCase()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T13_Add Test Case", null, ((string[])(null)));
#line 105
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 106
 testRunner.When("I click on the Test case Sub tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 107
 testRunner.And("I click on the Link \"Add Test Case\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "Dropdown"});
            table3.AddRow(new string[] {
                        "Codelist_DEF1"});
            table3.AddRow(new string[] {
                        "Codelist_DEF2"});
            table3.AddRow(new string[] {
                        "Codelist_DEF3"});
            table3.AddRow(new string[] {
                        "Codelist_DEF4"});
            table3.AddRow(new string[] {
                        "Codelist_DEF5"});
#line 108
 testRunner.Then("user should see the below values in Testvalue dropdown", ((string)(null)), table3, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T14_When I navigate back to the Home page and click on Delete all previously crea" +
            "ted studies then I should see all those studies")]
        public virtual void T14_WhenINavigateBackToTheHomePageAndClickOnDeleteAllPreviouslyCreatedStudiesThenIShouldSeeAllThoseStudies()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T14_When I navigate back to the Home page and click on Delete all previously crea" +
                    "ted studies then I should see all those studies", null, ((string[])(null)));
#line 116
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 117
testRunner.When("I click breadcrumb item \"Home\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "StudyName"});
            table4.AddRow(new string[] {
                        "Import1"});
#line 118
 testRunner.And("I Search for the study in the studies list of Home page and delete the study", ((string)(null)), table4, "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "StudyName"});
            table5.AddRow(new string[] {
                        "Import1"});
#line 121
 testRunner.Then("I should not see these studies in the Home page", ((string)(null)), table5, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

