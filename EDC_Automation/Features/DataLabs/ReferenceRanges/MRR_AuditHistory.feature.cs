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
namespace EDC_Automation.Features.DataLabs.ReferenceRanges
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("MRR_AuditHistory")]
    public partial class MRR_AuditHistoryFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "MRR_AuditHistory.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "MRR_AuditHistory", null, ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("02_Verification of Audit History in the MRR table grid of Manage Reference Ranges" +
            " page after adding a record")]
        public virtual void _02_VerificationOfAuditHistoryInTheMRRTableGridOfManageReferenceRangesPageAfterAddingARecord()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("02_Verification of Audit History in the MRR table grid of Manage Reference Ranges" +
                    " page after adding a record", null, ((string[])(null)));
#line 7
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 8
 testRunner.When("I navigate to \"Labs\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 9
 testRunner.And("I open lab with labid \"L21\" from ManageReferenceRanges page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 10
 testRunner.And("I open labtest with labname \"MRRTEST1\" from labtests page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 11
 testRunner.And("I sort column \"Start Date1\" in MrrGrid of ManageReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 12
 testRunner.And("I sort column \"From Age1\" in MrrGrid of ManageReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 13
 testRunner.And("I sort column \"From Age2\" in MrrGrid of ManageReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 14
 testRunner.And("I sort column \"Gender\" in MrrGrid of ManageReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 15
 testRunner.And("I sort column \"Gender\" in MrrGrid of ManageReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 16
 testRunner.And("I click add button to add a new lab test in ReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "StartDate",
                        "EndDate",
                        "Gender",
                        "FromAgeSelect",
                        "FromAgeSet",
                        "FromAgeRange",
                        "ToAgeSelect",
                        "ToAgeSet",
                        "ToAgeRange",
                        "NormalRangeLowSelect",
                        "NormalRangeLowSet",
                        "NormalRangeHighSelect",
                        "NormalRangeHighSet",
                        "ClinicalRangeLowSelect",
                        "ClinicalRangeLowSet",
                        "ClinicalRangeHighSelect",
                        "ClinicalRangeHighSet",
                        "Unit"});
            table1.AddRow(new string[] {
                        "10/15/2018",
                        "",
                        "Not Specified",
                        "",
                        "12",
                        "Years",
                        "",
                        "13",
                        "Years",
                        "",
                        "14",
                        "",
                        "15",
                        "",
                        "16",
                        "",
                        "17",
                        "6Unit"});
#line 17
 testRunner.And("enter the below lab data in ReferenceRangesPage", ((string)(null)), table1, "And ");
#line 20
 testRunner.And("I click on \"Save\" icon of the first record in ReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 21
 testRunner.And("I read the Ref ID of the created record in the MRR table of Manage Reference Rang" +
                    "es page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 22
 testRunner.And("I click on \"History\" Icon for the added record in the MRR table grid of Manage Re" +
                    "ference Range page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 23
 testRunner.Then("I should see the \"Lab Name\" as \"LabName (L21)\" in the Change History window of MR" +
                    "R table grid in Manage Reference page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "Date/Time",
                        "Reference Range",
                        "Action"});
            table2.AddRow(new string[] {
                        "GST\\r\n testadmin testadmin (EDCDEV\\testadmin)",
                        "Date (Start, End): 15-Oct-2018, --\\r\nGender: Not Specified\\r\nAge (From, To): 12 Y" +
                            "ears, 13 Years\\r\nNormal Range (Low, High): 14, 15\\r\nCritical Range (Low, High): " +
                            "16, 17\\r\nUnit: 6Unit\\r\nNot Applicable: False",
                        "Initial Entry"});
#line 27
 testRunner.And("I should see the below mentioned details in the Change History Window", ((string)(null)), table2, "And ");
#line 30
 testRunner.And("I should view the button \"Print\" in the Change History window of MRR table grid i" +
                    "n Manage Reference page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 31
 testRunner.And("I should view the button \"Close\" in the Change History window of MRR table grid i" +
                    "n Manage Reference page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 32
 testRunner.And("I Click on \"Close\" button in the in the Change History window of MRR table grid i" +
                    "n Manage Reference page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("03_Verification of Audit History in the MRR table grid of Manage Reference Ranges" +
            " page after editing the record")]
        public virtual void _03_VerificationOfAuditHistoryInTheMRRTableGridOfManageReferenceRangesPageAfterEditingTheRecord()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("03_Verification of Audit History in the MRR table grid of Manage Reference Ranges" +
                    " page after editing the record", null, ((string[])(null)));
#line 34
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 35
 testRunner.When("I read the Ref ID of the created record in the MRR table of Manage Reference Rang" +
                    "es page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 36
 testRunner.And("I sort column \"Ref ID\" in MrrGrid of ManageReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 37
 testRunner.And("I sort column \"Ref ID\" in MrrGrid of ManageReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 39
 testRunner.And("I click on \"Edit\" Icon for the added record in the MRR table grid of Manage Refer" +
                    "ence Range page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "StartDate",
                        "EndDate",
                        "Gender",
                        "FromAgeSelect",
                        "FromAgeSet",
                        "FromAgeRange",
                        "ToAgeSelect",
                        "ToAgeSet",
                        "ToAgeRange",
                        "NormalRangeLowSelect",
                        "NormalRangeLowSet",
                        "NormalRangeHighSelect",
                        "NormalRangeHighSet",
                        "ClinicalRangeLowSelect",
                        "ClinicalRangeLowSet",
                        "ClinicalRangeHighSelect",
                        "ClinicalRangeHighSet",
                        "Unit"});
            table3.AddRow(new string[] {
                        "10/16/2018",
                        "10/28/2018",
                        "Male",
                        "",
                        "14",
                        "Years",
                        "",
                        "15",
                        "Years",
                        "",
                        "24",
                        "",
                        "34",
                        "",
                        "36",
                        "",
                        "46",
                        "9Unit"});
#line 40
 testRunner.And("enter the below lab data in ReferenceRangesPage", ((string)(null)), table3, "And ");
#line 43
 testRunner.And("I check the not applicable checkbox in ReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 44
 testRunner.And("I click on \"Save\" icon of the first record in ReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 45
 testRunner.And("I click on \"History\" Icon for the updated record in the MRR table grid of Manage " +
                    "Reference Range page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "Date/Time",
                        "Reference Range",
                        "Action"});
            table4.AddRow(new string[] {
                        "GST\\r\n testadmin testadmin (EDCDEV\\testadmin)",
                        "Date (Start, End): 16-Oct-2018, 28-Oct-2018\\r\nGender: Male\\r\nAge (From, To): 14 Y" +
                            "ears, 15 Years\\r\nNormal Range (Low, High): 24, 34\\r\nCritical Range (Low, High): " +
                            "36, 46\\r\nUnit: 9Unit\\r\nNot Applicable: True",
                        "Updated"});
            table4.AddRow(new string[] {
                        "GST\\r\n testadmin testadmin (EDCDEV\\testadmin)",
                        "Date (Start, End): 15-Oct-2018, --\\r\nGender: Not Specified\\r\nAge (From, To): 12 Y" +
                            "ears, 13 Years\\r\nNormal Range (Low, High): 14, 15\\r\nCritical Range (Low, High): " +
                            "16, 17\\r\nUnit: 6Unit\\r\nNot Applicable: False",
                        "Initial Entry"});
#line 46
 testRunner.Then("I should see the below mentioned details in the Change History Window", ((string)(null)), table4, "Then ");
#line 50
 testRunner.And("I Click on \"Close\" button in the in the Change History window of MRR table grid i" +
                    "n Manage Reference page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("04_Verification of Audit History in the MRR table grid of Manage Reference Ranges" +
            " page after deleting the record")]
        public virtual void _04_VerificationOfAuditHistoryInTheMRRTableGridOfManageReferenceRangesPageAfterDeletingTheRecord()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("04_Verification of Audit History in the MRR table grid of Manage Reference Ranges" +
                    " page after deleting the record", null, ((string[])(null)));
#line 54
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 55
 testRunner.When("I sort column \"Ref ID\" in MrrGrid of ManageReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 56
 testRunner.And("I read the Ref ID of the created record in the MRR table of Manage Reference Rang" +
                    "es page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 57
 testRunner.And("I click on \"Delete\" Icon for the updated record in the MRR table grid of Manage R" +
                    "eference Range page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 58
 testRunner.And("I click continue in modal dialog having title \"Delete Reference Range Record(s)\" " +
                    "and partial message \"Are you sure you want to permanently delete 1 reference ran" +
                    "ge record?\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 59
 testRunner.And("I Check the Checkbox View deleted Reference Ranges", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 60
 testRunner.And("I click on \"History\" Icon for the deleted record in the MRR table grid of Manage " +
                    "Reference Range page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "Date/Time",
                        "Reference Range",
                        "Action"});
            table5.AddRow(new string[] {
                        "GST\\r\n testadmin testadmin (EDCDEV\\testadmin)",
                        "Date (Start, End): 16-Oct-2018, 28-Oct-2018\\r\nGender: Male\\r\nAge (From, To): 14 Y" +
                            "ears, 15 Years\\r\nNormal Range (Low, High): 24, 34\\r\nCritical Range (Low, High): " +
                            "36, 46\\r\nUnit: 9Unit\\r\nNot Applicable: True",
                        "Deleted"});
            table5.AddRow(new string[] {
                        "GST\\r\n testadmin testadmin (EDCDEV\\testadmin)",
                        "Date (Start, End): 16-Oct-2018, 28-Oct-2018\\r\nGender: Male\\r\nAge (From, To): 14 Y" +
                            "ears, 15 Years\\r\nNormal Range (Low, High): 24, 34\\r\nCritical Range (Low, High): " +
                            "36, 46\\r\nUnit: 9Unit\\r\nNot Applicable: True",
                        "Updated"});
            table5.AddRow(new string[] {
                        "GST\\r\n testadmin testadmin (EDCDEV\\testadmin)",
                        "Date (Start, End): 15-Oct-2018, --\\r\nGender: Not Specified\\r\nAge (From, To): 12 Y" +
                            "ears, 13 Years\\r\nNormal Range (Low, High): 14, 15\\r\nCritical Range (Low, High): " +
                            "16, 17\\r\nUnit: 6Unit\\r\nNot Applicable: False",
                        "Initial Entry"});
#line 61
 testRunner.Then("I should see the below mentioned details in the Change History Window", ((string)(null)), table5, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

