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
namespace EDC_Automation.Features.DataLabs.StudyVerificationRules
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("DataLabs_V5.8.0_DataLabs Study Verification Rules")]
    public partial class DataLabs_V5_8_0_DataLabsStudyVerificationRulesFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "StudyVerificationRules_Errors.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "DataLabs_V5.8.0_DataLabs Study Verification Rules", "\tTest Summary:\r\n\t1. Lab Dictionary is not associated to the Study", ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        public virtual void _01_LoginToDatalabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("01_Login to Datalabs", null, new string[] {
                        "ObjectiveEvidence"});
#line 6
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 7
 testRunner.Given("I logged in to DataLabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 8
 testRunner.Then("I see Datalabs Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("02_Delete the current study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        public virtual void _02_DeleteTheCurrentStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("02_Delete the current study", null, new string[] {
                        "ObjectiveEvidence"});
#line 11
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 12
 testRunner.When("I delete study", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 13
 testRunner.Then("I see study label \"No Study Loaded\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("03_Publish the study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US46266.3")]
        public virtual void _03_PublishTheStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("03_Publish the study", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US46266.3"});
#line 16
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 17
 testRunner.When("I click breadcrumb \"Study Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 18
 testRunner.And("I upload a study \"CreateNewStudy_20190905_T11371586_Attribute Mapping.Zip\" with s" +
                    "tudy name \"CreateNewStudyError\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 19
 testRunner.Then("verify modal dialog having title \"Error uploading study file\" and partial message" +
                    " \"There is one or more invalid Lab or Attribute Mappings.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("04_Publish the study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US46266.3")]
        public virtual void _04_PublishTheStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("04_Publish the study", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US46266.3"});
#line 22
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 23
 testRunner.When("I upload a study \"Import_Study_20190905_T10300900_LabMappingErrors.Zip\" with stud" +
                    "y name \"LabMappingError\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 24
 testRunner.Then("verify modal dialog having title \"Error uploading study file\" and partial message" +
                    " \"One or more form questions has invalid association of Codelist Linkage.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("05_Publish the study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US46266.3")]
        public virtual void _05_PublishTheStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("05_Publish the study", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US46266.3"});
#line 27
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 28
 testRunner.When("I upload a study \"Import_Study_20190905_T12152169_Lab Dictionary Mapping.Zip\" wit" +
                    "h study name \"LabDictMappingError\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 29
 testRunner.Then("verify modal dialog having title \"Error uploading study file\" and partial message" +
                    " \"There are one or more lab dictionary mapping errors.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("06_Publish the study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US46266.3")]
        public virtual void _06_PublishTheStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("06_Publish the study", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US46266.3"});
#line 32
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 33
 testRunner.When("I upload a study \"Import_Study2_20190905_T12265351_FormQuestions.Zip\" with study " +
                    "name \"FormQuestionErrors\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 34
 testRunner.Then("verify modal dialog having title \"Error uploading study file\" and partial message" +
                    " \"One or more form questions are assigned with both Codelist Group and Linkage.\"" +
                    "", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("07_Publish the study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US46266.3")]
        public virtual void _07_PublishTheStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("07_Publish the study", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US46266.3"});
#line 37
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 38
 testRunner.When("I upload a study \"Import_Study2_20190905_T12483607_FormQuestions.Zip\" with study " +
                    "name \"FormQuestionErrors\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 39
 testRunner.Then("verify modal dialog having title \"Error uploading study file\" and partial message" +
                    " \"There is one or more Event(s) that contains Invalid Form(s).\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("08_Publish the study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US46266.3")]
        public virtual void _08_PublishTheStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("08_Publish the study", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US46266.3"});
#line 42
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 43
 testRunner.When("I upload a study \"Import_Study2_20190916_T10102385_FormQuestion.Zip\" with study n" +
                    "ame \"FormQuestionErrors\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 44
 testRunner.Then("verify modal dialog having title \"Error uploading study file\" and partial message" +
                    " \"There is one or more Event(s) that contains Invalid Form(s).\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("09_Publish the study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US46266.3")]
        public virtual void _09_PublishTheStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("09_Publish the study", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US46266.3"});
#line 47
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 48
 testRunner.When("I upload a study \"Linkages_Hidden_20190905_T12335432.Zip\" with study name \"FormHi" +
                    "ddenQuestionErrors\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 49
 testRunner.Then("verify modal dialog having title \"Error uploading study file\" and partial message" +
                    " \"One or more form questions has invalid association of Codelist Linkage.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("10_Publish a study")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US46266.3")]
        public virtual void _10_PublishAStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("10_Publish a study", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US46266.3"});
#line 52
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 53
 testRunner.When("I upload a study \"test01new_20190916_T10483512_NoErrors.zip\" with study label \"No" +
                    "ErrorsStudy\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 54
 testRunner.Then("I see study label \"test01new\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

