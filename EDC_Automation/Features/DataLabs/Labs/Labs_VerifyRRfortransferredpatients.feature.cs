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
    [NUnit.Framework.DescriptionAttribute("VerifyRRfortransferredpatients")]
    public partial class VerifyRRfortransferredpatientsFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "Labs_VerifyRRfortransferredpatients.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "VerifyRRfortransferredpatients", "\t\tAs a Site User,\r\n\t\tI want system to manage LAB ID and RR changes when Patient i" +
                    "s transferred to different Site,\r\n\t\tSo that correct Lab ID and Reference Range i" +
                    "s reflected post transfer.", ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("1_Login to Datalabs")]
        public virtual void _1_LoginToDatalabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("1_Login to Datalabs", null, ((string[])(null)));
#line 11
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 12
 testRunner.Given("I logged in to DataLabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 13
 testRunner.Then("I see Datalabs Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("2_Associate Lab L01 and L02 for Site1")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.1")]
        public virtual void _2_AssociateLabL01AndL02ForSite1()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("2_Associate Lab L01 and L02 for Site1", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.1"});
#line 16
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 17
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 18
 testRunner.And("I click Link \"Site Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 19
 testRunner.And("I open site with siteid \"01\" and site name \"Site1\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 20
 testRunner.And("I click ActionPalette Item \"Associate Lab(s)\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 21
 testRunner.And("I add and save lab id \"L01\" and lab name \"Lab01\" to associated labs in AssociateL" +
                    "abs page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 22
 testRunner.And("I click ActionPalette Item \"Associate Lab(s)\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 23
 testRunner.And("I add and save lab id \"L02\" and lab name \"Lab02\" to associated labs in AssociateL" +
                    "abs page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 24
 testRunner.And("I select sub tab \"Labs\" in site page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "LaboratoryStatus"});
            table1.AddRow(new string[] {
                        "L01",
                        "Lab01",
                        "PFIZER",
                        "RD",
                        "Active"});
#line 25
 testRunner.Then("I see lab data in labs tab of Site in SitePage", ((string)(null)), table1, "Then ");
#line 28
 testRunner.And("I see lab data in labs tab of Site in SitePage@ObjectiveEvidence", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("3_Associate Lab L01 and L03 for Site2")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.1")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.1")]
        public virtual void _3_AssociateLabL01AndL03ForSite2()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("3_Associate Lab L01 and L03 for Site2", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.1",
                        "ObjectiveEvidence",
                        "ReqID:US64421.1"});
#line 51
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 52
 testRunner.When("I click breadcrumb \"Study Administration\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 53
 testRunner.And("I click Link \"Site Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 54
 testRunner.And("I open site with siteid \"02\" and site name \"Site2\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 55
 testRunner.And("I click ActionPalette Item \"Associate Lab(s)\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 56
 testRunner.And("I add and save lab id \"L01\" and lab name \"Lab01\" to associated labs in AssociateL" +
                    "abs page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 57
 testRunner.And("I click ActionPalette Item \"Associate Lab(s)\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 58
 testRunner.And("I add and save lab id \"L03\" and lab name \"Lab03\" to associated labs in AssociateL" +
                    "abs page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 59
 testRunner.And("I select sub tab \"Labs\" in site page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "LaboratoryStatus"});
            table2.AddRow(new string[] {
                        "L01",
                        "Lab01",
                        "PFIZER",
                        "RD",
                        "Active"});
#line 60
 testRunner.Then("I see lab data in labs tab of Site in SitePage", ((string)(null)), table2, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "LaboratoryStatus"});
            table3.AddRow(new string[] {
                        "L03",
                        "Lab03",
                        "NOVARTIS",
                        "Research",
                        "Active"});
#line 63
 testRunner.And("I see lab data in labs tab of Site in SitePage", ((string)(null)), table3, "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("4_Navigate to Patients tab and select a Site1 and add patient 01-PAT")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.1")]
        public virtual void _4_NavigateToPatientsTabAndSelectASite1AndAddPatient01_PAT()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("4_Navigate to Patients tab and select a Site1 and add patient 01-PAT", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.1"});
#line 68
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 69
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 70
 testRunner.And("I select the site \"01-Site1\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "ScreenID",
                        "ScreenDate"});
            table4.AddRow(new string[] {
                        "1A",
                        "2/06/2018"});
#line 71
 testRunner.When("I add patient with below details.", ((string)(null)), table4, "When ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "PatientID"});
            table5.AddRow(new string[] {
                        "1A"});
#line 74
 testRunner.Then("I see below patients added in the Patients table.", ((string)(null)), table5, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("5_Transfer patient")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.1,US56181.1")]
        public virtual void _5_TransferPatient()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("5_Transfer patient", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.1,US56181.1"});
#line 81
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 82
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 83
 testRunner.And("I select the site \"01-Site1\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 84
 testRunner.And("I select the patient \"1A\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 85
 testRunner.When("I expand \"Event1\" to select and open \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table6.AddRow(new string[] {
                        "Lab01 (L01)"});
            table6.AddRow(new string[] {
                        "Lab02 (L02)"});
#line 86
 testRunner.And("I Verify below \"ListBox\" items are displayed in \"LabId\" on the CRF.", ((string)(null)), table6, "And ");
#line 90
 testRunner.And("I select \"Checkout\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table7.AddRow(new string[] {
                        "LabId",
                        "Lab01 (L01)",
                        "ListBox"});
#line 91
 testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table7, "And ");
#line 94
 testRunner.And("I click on \"Save & Close\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 95
 testRunner.And("I click ActionPalette Item \"Transfer Patient\" in \"PatientPortalActions\" ActionPal" +
                    "ette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                        "ToSite",
                        "Reason",
                        "AdditionalNotes"});
            table8.AddRow(new string[] {
                        "02-Site2",
                        "Other",
                        "Test"});
#line 96
 testRunner.And("I set transfer patient data in TransferPatientPage", ((string)(null)), table8, "And ");
#line 99
 testRunner.And("I click Transfer button in TransferPatientPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 100
 testRunner.And("I click continue in modal dialog having title \"Transfer Patient Confirmation\" and" +
                    " partial message \"1A will be moved to site 02-Site2.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 101
 testRunner.And("I navigate to \"Inbox\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table9 = new TechTalk.SpecFlow.Table(new string[] {
                        "Subject"});
            table9.AddRow(new string[] {
                        "Transfer Patient - complete. View Summary."});
#line 102
 testRunner.Then("I check subjects in inbox folder \"Jobs\"", ((string)(null)), table9, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("6_Verify transferred patient site")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.1")]
        public virtual void _6_VerifyTransferredPatientSite()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("6_Verify transferred patient site", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.1"});
#line 107
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 108
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 109
 testRunner.And("I select the site \"02-Site2\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 110
 testRunner.And("I select the patient \"1A\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 111
 testRunner.When("I expand \"Event1\" to select and open \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table10 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table10.AddRow(new string[] {
                        "LabId",
                        "Lab01 (L01)",
                        "Text"});
#line 112
 testRunner.And("I verify below flat questions data in the CRF.", ((string)(null)), table10, "And ");
#line 115
 testRunner.And("I select \"Checkout\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 116
 testRunner.And("I click on \"Lab01\" answer value link for flat question \"LabId\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table11 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table11.AddRow(new string[] {
                        "Lab01 (L01)"});
            table11.AddRow(new string[] {
                        "Lab03 (L03)"});
#line 117
 testRunner.Then("I Verify below \"ListBox\" items are displayed in \"LabId\" on the CRF.", ((string)(null)), table11, "Then ");
#line 121
 testRunner.And("I click on \"Cancel\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("7_Navigate to Patients tab and select a Site1 and add patient 01-PAT")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.2")]
        public virtual void _7_NavigateToPatientsTabAndSelectASite1AndAddPatient01_PAT()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("7_Navigate to Patients tab and select a Site1 and add patient 01-PAT", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.2"});
#line 126
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 127
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 128
 testRunner.And("I select the site \"01-Site1\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table12 = new TechTalk.SpecFlow.Table(new string[] {
                        "ScreenID",
                        "ScreenDate"});
            table12.AddRow(new string[] {
                        "Pat2",
                        "12/06/2018"});
#line 129
 testRunner.When("I add patient with below details.", ((string)(null)), table12, "When ");
#line hidden
            TechTalk.SpecFlow.Table table13 = new TechTalk.SpecFlow.Table(new string[] {
                        "PatientID"});
            table13.AddRow(new string[] {
                        "Pat2"});
#line 132
 testRunner.Then("I see below patients added in the Patients table.", ((string)(null)), table13, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("8_Unassociate L01 Lab for Site2")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.2")]
        public virtual void _8_UnassociateL01LabForSite2()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("8_Unassociate L01 Lab for Site2", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.2"});
#line 137
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 138
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 139
 testRunner.And("I click Link \"Site Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 140
 testRunner.And("I open site with siteid \"02\" and site name \"Site2\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 141
 testRunner.And("I click ActionPalette Item \"Associate Lab(s)\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 142
 testRunner.And("I remove and save lab id \"L01\" and lab name \"Lab01\" from associated labs in Assoc" +
                    "iateLabs page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 143
 testRunner.And("I select sub tab \"Labs\" in site page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table14 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "LaboratoryStatus"});
            table14.AddRow(new string[] {
                        "L03",
                        "Lab03",
                        "NOVARTIS",
                        "Research",
                        "Active"});
#line 144
 testRunner.Then("I see lab data in labs tab of Site in SitePage", ((string)(null)), table14, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("9_Transfer patient")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.2")]
        public virtual void _9_TransferPatient()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("9_Transfer patient", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.2"});
#line 149
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 150
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 151
 testRunner.And("I select the site \"01-Site1\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 152
 testRunner.And("I select the patient \"Pat2\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 153
 testRunner.When("I expand \"Event1\" to select and open \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table15 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table15.AddRow(new string[] {
                        "Lab01 (L01)"});
            table15.AddRow(new string[] {
                        "Lab02 (L02)"});
#line 154
 testRunner.And("I Verify below \"ListBox\" items are displayed in \"LabId\" on the CRF.", ((string)(null)), table15, "And ");
#line 158
 testRunner.And("I select \"Checkout\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table16 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table16.AddRow(new string[] {
                        "LabId",
                        "Lab01 (L01)",
                        "ListBox"});
#line 159
 testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table16, "And ");
#line 162
 testRunner.And("I click on \"Save & Close\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 163
 testRunner.And("I click ActionPalette Item \"Transfer Patient\" in \"PatientPortalActions\" ActionPal" +
                    "ette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table17 = new TechTalk.SpecFlow.Table(new string[] {
                        "ToSite",
                        "Reason",
                        "AdditionalNotes"});
            table17.AddRow(new string[] {
                        "02-Site2",
                        "Other",
                        "Test"});
#line 164
 testRunner.And("I set transfer patient data in TransferPatientPage", ((string)(null)), table17, "And ");
#line 167
 testRunner.And("I click Transfer button in TransferPatientPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 168
 testRunner.And("I click continue in modal dialog having title \"Transfer Patient Confirmation\" and" +
                    " partial message \"Pat2 will be moved to site 02-Site2.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 169
 testRunner.And("I navigate to \"Inbox\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table18 = new TechTalk.SpecFlow.Table(new string[] {
                        "Subject"});
            table18.AddRow(new string[] {
                        "Transfer Patient - complete. View Summary."});
#line 170
 testRunner.Then("I check subjects in inbox folder \"Jobs\"", ((string)(null)), table18, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("10_Verify transferred patient site")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.2")]
        public virtual void _10_VerifyTransferredPatientSite()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("10_Verify transferred patient site", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.2"});
#line 175
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 176
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 177
 testRunner.And("I select the site \"02-Site2\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 178
 testRunner.And("I select the patient \"Pat2\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 179
 testRunner.When("I expand \"Event1\" to select and open \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table19 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table19.AddRow(new string[] {
                        "LabId",
                        "L01",
                        "Text"});
#line 180
 testRunner.And("I verify below flat questions data in the CRF.", ((string)(null)), table19, "And ");
#line 183
 testRunner.And("I select \"Checkout\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 184
 testRunner.And("I click on \"L01\" answer value link for flat question \"LabId\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table20 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table20.AddRow(new string[] {
                        "Lab03 (L03)"});
#line 185
 testRunner.Then("I Verify below \"ListBox\" items are displayed in \"LabId\" on the CRF.", ((string)(null)), table20, "Then ");
#line 188
 testRunner.And("I click on \"Cancel\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("11_Associate Lab L01 for Site2")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.3")]
        public virtual void _11_AssociateLabL01ForSite2()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("11_Associate Lab L01 for Site2", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.3"});
#line 193
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 194
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 195
 testRunner.And("I click Link \"Site Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 196
 testRunner.And("I open site with siteid \"02\" and site name \"Site2\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 197
 testRunner.And("I click ActionPalette Item \"Associate Lab(s)\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 198
 testRunner.And("I add and save lab id \"L01\" and lab name \"Lab01\" to associated labs in AssociateL" +
                    "abs page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 199
 testRunner.And("I select sub tab \"Labs\" in site page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table21 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "LaboratoryStatus"});
            table21.AddRow(new string[] {
                        "L01",
                        "Lab01",
                        "PFIZER",
                        "RD",
                        "Active"});
#line 200
 testRunner.Then("I see lab data in labs tab of Site in SitePage", ((string)(null)), table21, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table22 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "LaboratoryStatus"});
            table22.AddRow(new string[] {
                        "L03",
                        "Lab03",
                        "NOVARTIS",
                        "Research",
                        "Active"});
#line 203
 testRunner.And("I see lab data in labs tab of Site in SitePage", ((string)(null)), table22, "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("12_Verify transferred patient site")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:US64421.3")]
        public virtual void _12_VerifyTransferredPatientSite()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("12_Verify transferred patient site", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US64421.3"});
#line 208
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 209
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 210
 testRunner.And("I select the site \"02-Site2\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 211
 testRunner.And("I select the patient \"Pat2\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 212
 testRunner.When("I expand \"Event1\" to select and open \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table23 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table23.AddRow(new string[] {
                        "LabId",
                        "Lab01 (L01)",
                        "Text"});
#line 213
 testRunner.And("I verify below flat questions data in the CRF.", ((string)(null)), table23, "And ");
#line 216
 testRunner.And("I select \"Checkout\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 217
 testRunner.And("I click on \"Lab01\" answer value link for flat question \"LabId\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table24 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table24.AddRow(new string[] {
                        "Lab01 (L01)"});
            table24.AddRow(new string[] {
                        "Lab03 (L03)"});
#line 218
 testRunner.Then("I Verify below \"ListBox\" items are displayed in \"LabId\" on the CRF.", ((string)(null)), table24, "Then ");
#line 222
 testRunner.And("I click on \"Cancel\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("13_Logout form DataLabs")]
        public virtual void _13_LogoutFormDataLabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("13_Logout form DataLabs", null, ((string[])(null)));
#line 224
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 225
 testRunner.When("I clik logout of Datalabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table25 = new TechTalk.SpecFlow.Table(new string[] {
                        "LabId",
                        "LaboratoryName",
                        "Company",
                        "Department",
                        "LaboratoryStatus"});
            table25.AddRow(new string[] {
                        "L02",
                        "Lab02",
                        "PFIZER",
                        "RD",
                        "Active"});
#line 226
 testRunner.Then("I see login page", ((string)(null)), table25, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion
