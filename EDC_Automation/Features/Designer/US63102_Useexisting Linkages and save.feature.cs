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
    [NUnit.Framework.DescriptionAttribute("US63102- DS-Create Form from existing: Use Existing for Codelist Linkages - Save")]
    public partial class US63102_DS_CreateFormFromExistingUseExistingForCodelistLinkages_SaveFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "US63102_Useexisting Linkages and save.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "US63102- DS-Create Form from existing: Use Existing for Codelist Linkages - Save", null, ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.CategoryAttribute("ReqID:US63102")]
        public virtual void T01_WhenILoginToDesignerThenISeeTheDesignerHomePage()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T01_When I Login to Designer then I see the Designer home page", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:US63102"});
#line 5
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 6
 testRunner.Given("I logged in to Designer", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 7
 testRunner.Then("I see Designer Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T02_When I Import Source Study of 5.9 to Designer then I see message \"Study has b" +
            "een successfully added\" and status as complete")]
        public virtual void T02_WhenIImportSourceStudyOf5_9ToDesignerThenISeeMessageStudyHasBeenSuccessfullyAddedAndStatusAsComplete()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T02_When I Import Source Study of 5.9 to Designer then I see message \"Study has b" +
                    "een successfully added\" and status as complete", null, ((string[])(null)));
#line 9
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 10
    testRunner.When("I click on the Home Button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 11
 testRunner.And("I click on the Link \"Import Study\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 12
 testRunner.And("I import a study \"Import_TS_SourceLink1.zip\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 13
 testRunner.And("Enter the unique study name \"TS_SourceLink1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 14
 testRunner.And("Select the sponsor name \"Sponsor1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 15
 testRunner.And("I click on the Save button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 18
 testRunner.And("I should see the notification \"Study has been successfully added\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 19
 testRunner.And("I click on the Link \"View Study Jobs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 20
 testRunner.Then("I should see the status of the study \"Study Import (TS_SourceLink1)\" in \"Complete" +
                    "\" state", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T03_When I Import Target Study of 5.9 to Designer then I see message \"Study has b" +
            "een successfully added\" and status as complete")]
        public virtual void T03_WhenIImportTargetStudyOf5_9ToDesignerThenISeeMessageStudyHasBeenSuccessfullyAddedAndStatusAsComplete()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T03_When I Import Target Study of 5.9 to Designer then I see message \"Study has b" +
                    "een successfully added\" and status as complete", null, ((string[])(null)));
#line 22
 this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 23
    testRunner.When("I click on the Home Button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 24
 testRunner.And("I click on the Link \"Import Study\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 25
 testRunner.And("I import a study \"Import_TS_SourceLink1.zip\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 26
 testRunner.And("Enter the unique study name \"TS_TargetLink2\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 27
 testRunner.And("Select the sponsor name \"Sponsor1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 28
 testRunner.And("I click on the Save button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 31
 testRunner.And("I should see the notification \"Study has been successfully added\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 32
 testRunner.And("I click on the Link \"View Study Jobs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 33
 testRunner.Then("I should see the status of the study \"Study Import (TS_TargetLink2)\" in \"Complete" +
                    "\" state", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T03_When the user clicks on Forms tab then Forms page should be displayed")]
        public virtual void T03_WhenTheUserClicksOnFormsTabThenFormsPageShouldBeDisplayed()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T03_When the user clicks on Forms tab then Forms page should be displayed", null, ((string[])(null)));
#line 35
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 36
 testRunner.When("I click on the \"Forms\" tab", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 37
 testRunner.Then("I should see the \"Forms\" page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T05_When user opens the pop up page then all the checkboxes should be checked by " +
            "default and the save button should be in disabled state")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:3.1.2.6")]
        public virtual void T05_WhenUserOpensThePopUpPageThenAllTheCheckboxesShouldBeCheckedByDefaultAndTheSaveButtonShouldBeInDisabledState()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T05_When user opens the pop up page then all the checkboxes should be checked by " +
                    "default and the save button should be in disabled state", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:3.1.2.6"});
#line 40
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 41
 testRunner.When("I click on the Link \"Create Form from Existing\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 42
 testRunner.And("I select the pop up having title \"Create Form from Existing\" and partial message " +
                    "\"Please select a Study\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 43
 testRunner.And("I click on the Link \"TS_SourceLink1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 44
 testRunner.And("I click on the Link \"Linkage_Form1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 45
 testRunner.Then("user should see Verify button before the save button at the top of the pop up win" +
                    "dow", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 46
 testRunner.And("user should see Verify button before the save button at the bottom of the pop up " +
                    "window", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "Target1",
                        "Include1"});
            table1.AddRow(new string[] {
                        "CodeList1_Yes04",
                        "checked"});
            table1.AddRow(new string[] {
                        "CodeList2_Yes04",
                        "checked"});
            table1.AddRow(new string[] {
                        "CodeList3_Yes04",
                        "checked"});
            table1.AddRow(new string[] {
                        "AB_Integer04",
                        "checked"});
            table1.AddRow(new string[] {
                        "AB_Float04",
                        "checked"});
            table1.AddRow(new string[] {
                        "AB_Text04",
                        "checked"});
            table1.AddRow(new string[] {
                        "AB_Date04",
                        "checked"});
            table1.AddRow(new string[] {
                        "CodeList1_Yes05",
                        "checked"});
            table1.AddRow(new string[] {
                        "CodeList2_No05",
                        "checked"});
            table1.AddRow(new string[] {
                        "CodeList3_Yes05",
                        "checked"});
            table1.AddRow(new string[] {
                        "AB_Integer05",
                        "checked"});
            table1.AddRow(new string[] {
                        "AB_Float05",
                        "checked"});
            table1.AddRow(new string[] {
                        "AB_Text05",
                        "checked"});
            table1.AddRow(new string[] {
                        "AB_Date05",
                        "checked"});
            table1.AddRow(new string[] {
                        "JAPANSTY",
                        "checked"});
            table1.AddRow(new string[] {
                        "BRNINJAP",
                        "checked"});
            table1.AddRow(new string[] {
                        "JPARENTS",
                        "checked"});
#line 47
 testRunner.And("I should see the all the checkboxes in enabled state and checked by default for t" +
                    "he Domain Items", ((string)(null)), table1, "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "Target2",
                        "Include2"});
            table2.AddRow(new string[] {
                        "AB_Color",
                        "checked"});
            table2.AddRow(new string[] {
                        "AB_Color",
                        "checked"});
            table2.AddRow(new string[] {
                        "AB_Times",
                        "checked"});
            table2.AddRow(new string[] {
                        "XYN",
                        "checked"});
            table2.AddRow(new string[] {
                        "AB_Gender",
                        "checked"});
            table2.AddRow(new string[] {
                        "RACE_CD",
                        "checked"});
            table2.AddRow(new string[] {
                        "RACE_CD",
                        "checked"});
            table2.AddRow(new string[] {
                        "AB_Form03_CountInteger",
                        "checked"});
            table2.AddRow(new string[] {
                        "AB_Form07_CreatedDate",
                        "checked"});
            table2.AddRow(new string[] {
                        "XYN",
                        "checked"});
            table2.AddRow(new string[] {
                        "XYN",
                        "checked"});
            table2.AddRow(new string[] {
                        "JPPAR",
                        "checked"});
#line 66
   testRunner.And("I should see all the checkboxes in enabled state and checked by default for the c" +
                    "odelist", ((string)(null)), table2, "And ");
#line 80
   testRunner.And("I should see the Save button in disabled state at top of the pop up window", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 81
   testRunner.And("I should see the Save button in disabled state at bottom of the pop up window", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T06_When I click on Verify for the same study then the System should highlight al" +
            "l the duplicate fields in orange color and unchecked and the Include checkbox sh" +
            "ould be disabled")]
        public virtual void T06_WhenIClickOnVerifyForTheSameStudyThenTheSystemShouldHighlightAllTheDuplicateFieldsInOrangeColorAndUncheckedAndTheIncludeCheckboxShouldBeDisabled()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T06_When I click on Verify for the same study then the System should highlight al" +
                    "l the duplicate fields in orange color and unchecked and the Include checkbox sh" +
                    "ould be disabled", null, ((string[])(null)));
#line 83
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 84
 testRunner.When("I click on Verify button", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 85
 testRunner.Then("I should see the Save button in enabled state at top of the pop up window", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 86
 testRunner.And("I should see the Save button in enabled state at bottom of the pop up window", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "Target1",
                        "Include1"});
            table3.AddRow(new string[] {
                        "CodeList1_Yes04",
                        "checked"});
            table3.AddRow(new string[] {
                        "CodeList2_Yes04",
                        "checked"});
            table3.AddRow(new string[] {
                        "CodeList3_Yes04",
                        "checked"});
            table3.AddRow(new string[] {
                        "AB_Integer04",
                        "checked"});
            table3.AddRow(new string[] {
                        "AB_Float04",
                        "checked"});
            table3.AddRow(new string[] {
                        "AB_Text04",
                        "checked"});
            table3.AddRow(new string[] {
                        "AB_Date04",
                        "checked"});
            table3.AddRow(new string[] {
                        "CodeList1_Yes05",
                        "checked"});
            table3.AddRow(new string[] {
                        "CodeList2_No05",
                        "checked"});
            table3.AddRow(new string[] {
                        "CodeList3_Yes05",
                        "checked"});
            table3.AddRow(new string[] {
                        "AB_Integer05",
                        "checked"});
            table3.AddRow(new string[] {
                        "AB_Float05",
                        "checked"});
            table3.AddRow(new string[] {
                        "AB_Text05",
                        "checked"});
            table3.AddRow(new string[] {
                        "AB_Date05",
                        "checked"});
            table3.AddRow(new string[] {
                        "JAPANSTY",
                        "checked"});
            table3.AddRow(new string[] {
                        "BRNINJAP",
                        "checked"});
            table3.AddRow(new string[] {
                        "JPARENTS",
                        "checked"});
#line 87
 testRunner.And("I should see the all the checkboxes in enabled state and checked by default for t" +
                    "he Domain Items", ((string)(null)), table3, "And ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "Source2",
                        "Include2"});
            table4.AddRow(new string[] {
                        "AB_Color",
                        "checked"});
            table4.AddRow(new string[] {
                        "AB_Color",
                        "checked"});
            table4.AddRow(new string[] {
                        "AB_Times",
                        "checked"});
            table4.AddRow(new string[] {
                        "XYN",
                        "checked"});
            table4.AddRow(new string[] {
                        "AB_Gender",
                        "checked"});
            table4.AddRow(new string[] {
                        "XYN",
                        "checked"});
            table4.AddRow(new string[] {
                        "XYN",
                        "checked"});
            table4.AddRow(new string[] {
                        "AB_Form03_CountInteger",
                        "checked"});
            table4.AddRow(new string[] {
                        "AB_Form07_CreatedDate",
                        "checked"});
            table4.AddRow(new string[] {
                        "XYN",
                        "checked"});
            table4.AddRow(new string[] {
                        "XYN",
                        "checked"});
            table4.AddRow(new string[] {
                        "JPPAR",
                        "checked"});
#line 106
 testRunner.And("I should see all the checkboxes in enabled state and checked by default for the c" +
                    "odelist", ((string)(null)), table4, "And ");
#line 120
   testRunner.And("should see all the \"Domains\" and Domain Items in orange color", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "Row",
                        "TargetForDomain"});
            table5.AddRow(new string[] {
                        "11",
                        "CodeList1_Yes04_Rename"});
            table5.AddRow(new string[] {
                        "20",
                        "CodeList2_No05_Rename"});
            table5.AddRow(new string[] {
                        "27",
                        "JAPANSTY_Rename"});
#line 142
   testRunner.And("I shouldnot see the orange background color for the Domain Item", ((string)(null)), table5, "And ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "Row",
                        "TargetForCodelist"});
            table6.AddRow(new string[] {
                        "11",
                        "XYN_Rename1"});
            table6.AddRow(new string[] {
                        "20",
                        "XYN_Rename2"});
            table6.AddRow(new string[] {
                        "27",
                        "XYN_Rename3"});
#line 148
 testRunner.And("I shouldnot see the Orange background color for the codelists", ((string)(null)), table6, "And ");
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "Target2"});
            table7.AddRow(new string[] {
                        "AB_Color"});
            table7.AddRow(new string[] {
                        "AB_Color"});
            table7.AddRow(new string[] {
                        "AB_Times"});
            table7.AddRow(new string[] {
                        "XYN"});
            table7.AddRow(new string[] {
                        "AB_Gender"});
            table7.AddRow(new string[] {
                        "XYN"});
            table7.AddRow(new string[] {
                        "XYN"});
            table7.AddRow(new string[] {
                        "AB_Form03_CountInteger"});
            table7.AddRow(new string[] {
                        "AB_Form07_CreatedDate"});
            table7.AddRow(new string[] {
                        "XYN"});
            table7.AddRow(new string[] {
                        "XYN"});
            table7.AddRow(new string[] {
                        "JPPAR"});
#line 153
 testRunner.And("I should see all the Codelist in orange color", ((string)(null)), table7, "And ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

