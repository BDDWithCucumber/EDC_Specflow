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
    [NUnit.Framework.DescriptionAttribute("Designer_Lab_Items_Labs_Icon")]
    public partial class Designer_Lab_Items_Labs_IconFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "US65400_ LabsIcon.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Designer_Lab_Items_Labs_Icon", null, ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.CategoryAttribute("ReqID:US65400.1")]
        public virtual void T01_WhenILoginToDesignerThenISeeTheDesignerHomePage()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T01_When I Login to Designer then I see the Designer home page", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US65400.1"});
#line 4
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 5
         testRunner.Given("I logged in to Designer", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 6
         testRunner.Then("I see Designer Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T02_When I Import Study to Designer then I see message \"Study has been successful" +
            "ly added\" and status as complete")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US65400.2")]
        public virtual void T02_WhenIImportStudyToDesignerThenISeeMessageStudyHasBeenSuccessfullyAddedAndStatusAsComplete()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T02_When I Import Study to Designer then I see message \"Study has been successful" +
                    "ly added\" and status as complete", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US65400.2"});
#line 9
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 10
    testRunner.When("I click on the Home Button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 11
         testRunner.And("I click on the Link \"Import Study\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 12
         testRunner.And("I import a study \"Test4500_Labs_Unlocked_Patients2.zip\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 13
         testRunner.And("Enter the unique study name \"Import_Study1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 14
         testRunner.And("Select the sponsor name \"Sponsor1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 15
         testRunner.And("I click on the Save button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 16
   testRunner.And("I see a confirmation dialog with title \"Confirmation\" and confirmation message \"L" +
                    "ab Dictionary mappings will be removed\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 17
         testRunner.And("I click Continue button on the confirmation dialog", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 18
         testRunner.And("I should see the notification \"Study has been successfully added\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 19
         testRunner.And("I click on the Link \"View Study Jobs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 20
         testRunner.Then("I should see the status of the study \"Study Import (Import_Study1)\" in \"Complete\"" +
                    " state", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T03_When user clicks on Lab Mappings Specification(LMS) in Documents then user sh" +
            "ould not see Lab Mappings Specification(LMS) link in Documents section")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US63129.1")]
        public virtual void T03_WhenUserClicksOnLabMappingsSpecificationLMSInDocumentsThenUserShouldNotSeeLabMappingsSpecificationLMSLinkInDocumentsSection()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T03_When user clicks on Lab Mappings Specification(LMS) in Documents then user sh" +
                    "ould not see Lab Mappings Specification(LMS) link in Documents section", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63129.1"});
#line 24
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "StudyName"});
            table1.AddRow(new string[] {
                        "Import_Study1"});
#line 25
         testRunner.When("I Search for the study in the studies list of Home page and open the study", ((string)(null)), table1, "When ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "TabName"});
            table2.AddRow(new string[] {
                        "Events"});
            table2.AddRow(new string[] {
                        "Forms"});
            table2.AddRow(new string[] {
                        "Domains"});
            table2.AddRow(new string[] {
                        "Codelists"});
            table2.AddRow(new string[] {
                        "Dictionaries"});
            table2.AddRow(new string[] {
                        "Scripting"});
            table2.AddRow(new string[] {
                        "Configurations"});
            table2.AddRow(new string[] {
                        "Labs"});
#line 28
         testRunner.Then("I should see the tabs mentioned below", ((string)(null)), table2, "Then ");
#line 38
         testRunner.And("I should see the Labs Icon in next to Labs tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T04_When user clicks on Lab Mappings Specification(LMS) in Documents then user sh" +
            "ould not see Lab Mappings Specification(LMS) link in Documents section")]
        public virtual void T04_WhenUserClicksOnLabMappingsSpecificationLMSInDocumentsThenUserShouldNotSeeLabMappingsSpecificationLMSLinkInDocumentsSection()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T04_When user clicks on Lab Mappings Specification(LMS) in Documents then user sh" +
                    "ould not see Lab Mappings Specification(LMS) link in Documents section", null, ((string[])(null)));
#line 40
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "StudyName"});
            table3.AddRow(new string[] {
                        "Import_Study1"});
#line 41
         testRunner.When("I Search for the study in the studies list of Home page and open the study", ((string)(null)), table3, "When ");
#line 44
         testRunner.When("I click on the Settings drop Icon", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 45
         testRunner.And("I Select \"No\" from the \"Labs\" drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 46
testRunner.Then("I should see the message \"On changing the settings to No, lab related data will b" +
                    "e removed from study\" below the Labs drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "TabName"});
            table4.AddRow(new string[] {
                        "Events"});
            table4.AddRow(new string[] {
                        "Forms"});
            table4.AddRow(new string[] {
                        "Domains"});
            table4.AddRow(new string[] {
                        "Codelists"});
            table4.AddRow(new string[] {
                        "Dictionaries"});
            table4.AddRow(new string[] {
                        "Scripting"});
            table4.AddRow(new string[] {
                        "Configurations"});
#line 47
         testRunner.Then("I should see the tabs mentioned below", ((string)(null)), table4, "Then ");
#line 56
         testRunner.And("I shouldnot see the Labs Icon in next to Labs tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

