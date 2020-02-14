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
    [NUnit.Framework.DescriptionAttribute("F10746_DL_Labs Demo")]
    public partial class F10746_DL_LabsDemoFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "F10746_DL_Labs_DemoFeedback.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "F10746_DL_Labs Demo", null, ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("02_Delete a study")]
        [NUnit.Framework.CategoryAttribute("US68898.3")]
        public virtual void _02_DeleteAStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("02_Delete a study", null, new string[] {
                        "US68898.3"});
#line 9
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 10
 testRunner.When("I delete study", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 11
 testRunner.Then("I see study label \"No Study Loaded\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("03_When I Upload and publish the study with Local Labs Enabled then I should see " +
            "Local Labs in the header.")]
        [NUnit.Framework.CategoryAttribute("US68898.3")]
        public virtual void _03_WhenIUploadAndPublishTheStudyWithLocalLabsEnabledThenIShouldSeeLocalLabsInTheHeader_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("03_When I Upload and publish the study with Local Labs Enabled then I should see " +
                    "Local Labs in the header.", null, new string[] {
                        "US68898.3"});
#line 14
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 15
    testRunner.When("I click breadcrumb \"Study Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 16
    testRunner.And("I upload a study \"Local_Labs_Enab.zip\" with study label \"Study1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 17
 testRunner.Then("I see main tab \"Local Labs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("04_When I Upload and publish the study with Local Labs Not Enabled then I should " +
            "see Local Labs in the header.")]
        [NUnit.Framework.CategoryAttribute("US68898.3")]
        [NUnit.Framework.CategoryAttribute("")]
        [NUnit.Framework.CategoryAttribute("US70483.1")]
        public virtual void _04_WhenIUploadAndPublishTheStudyWithLocalLabsNotEnabledThenIShouldSeeLocalLabsInTheHeader_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("04_When I Upload and publish the study with Local Labs Not Enabled then I should " +
                    "see Local Labs in the header.", null, new string[] {
                        "US68898.3",
                        "",
                        "US70483.1"});
#line 20
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 21
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 22
 testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 23
 testRunner.And("I click ActionPalette Item \"Manage Versions\" in \"StudyResetAction\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 24
 testRunner.And("I click ActionPalette Item \"Upload Study File\" in \"StudyVersionMgmtListActions\" A" +
                    "ctionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 25
 testRunner.And("I click browse button in upload study file page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 26
 testRunner.And("I upload study \"Not_Enbled.zip\" with Label \"Study2\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 27
    testRunner.And("I click continue in modal dialog having title \"Confirm\" and message \"Uploaded stu" +
                    "dy version has Local Labs as Not Enabled which is different from earlier study v" +
                    "ersion.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 28
 testRunner.And("I open study which has \"Uploaded\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 29
 testRunner.And("I click ActionPalette Item \"Stage\" in \"StudyVersionPropertiesActions\" ActionPalet" +
                    "te", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 30
 testRunner.And("I open study which has \"Staged\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 31
 testRunner.And("I see notes \"Note: Major changes have been detected to the study design. Patient " +
                    "migration will be required.\" in StudyVersionPropertiesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 32
 testRunner.And("I click ActionPalette Item \"Publish\" in \"StudyVersionPropertiesActions\" ActionPal" +
                    "ette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 33
 testRunner.And("I clicked Continue button in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 34
    testRunner.And("I select patient migration option \"Do not migrate\" in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 35
 testRunner.And("I click Publish button in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 36
 testRunner.And("I navigate to \"Inbox\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "Subject"});
            table1.AddRow(new string[] {
                        "Publishing of Study file (Study2) - complete."});
#line 37
 testRunner.And("I check subjects in inbox folder \"Jobs\"", ((string)(null)), table1, "And ");
#line 40
 testRunner.Then("I see main tab \"Local Labs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("05_When I Upload and publish the study with Local Labs Not Enabled then I should " +
            "not see Local Labs in the header.")]
        [NUnit.Framework.CategoryAttribute("US68898.3")]
        public virtual void _05_WhenIUploadAndPublishTheStudyWithLocalLabsNotEnabledThenIShouldNotSeeLocalLabsInTheHeader_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("05_When I Upload and publish the study with Local Labs Not Enabled then I should " +
                    "not see Local Labs in the header.", null, new string[] {
                        "US68898.3"});
#line 43
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 44
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 45
 testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 46
 testRunner.And("I click ActionPalette Item \"Manage Versions\" in \"StudyResetAction\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 47
 testRunner.And("I click ActionPalette Item \"Upload Study File\" in \"StudyVersionMgmtListActions\" A" +
                    "ctionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 48
 testRunner.And("I click browse button in upload study file page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 49
 testRunner.And("I upload study \"Not_Enabl_CL.zip\" with Label \"Study3\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 50
 testRunner.And("I open study which has \"Uploaded\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 51
 testRunner.And("I click ActionPalette Item \"Stage\" in \"StudyVersionPropertiesActions\" ActionPalet" +
                    "te", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 52
 testRunner.And("I open study which has \"Staged\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 53
 testRunner.And("I see notes \"Note: Major changes have been detected to the study design. Patient " +
                    "migration will be required.\" in StudyVersionPropertiesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 54
 testRunner.And("I click ActionPalette Item \"Publish\" in \"StudyVersionPropertiesActions\" ActionPal" +
                    "ette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 55
 testRunner.And("I clicked Continue button in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 56
    testRunner.And("I select patient migration option \"Do not migrate\" in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 57
 testRunner.And("I click Publish button in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 58
 testRunner.And("I navigate to \"Inbox\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "Subject"});
            table2.AddRow(new string[] {
                        "Publishing of Study file (Study3) - complete."});
#line 59
 testRunner.And("I check subjects in inbox folder \"Jobs\"", ((string)(null)), table2, "And ");
#line 62
 testRunner.Then("I dont see main tab \"Local Labs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("06_When I Upload and publish the study with Local Labs Enabled then I should see " +
            "Local Labs in the header.")]
        [NUnit.Framework.CategoryAttribute("US68898.3")]
        [NUnit.Framework.CategoryAttribute("US70483.1")]
        public virtual void _06_WhenIUploadAndPublishTheStudyWithLocalLabsEnabledThenIShouldSeeLocalLabsInTheHeader_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("06_When I Upload and publish the study with Local Labs Enabled then I should see " +
                    "Local Labs in the header.", null, new string[] {
                        "US68898.3",
                        "US70483.1"});
#line 65
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 66
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 67
 testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 68
 testRunner.And("I click ActionPalette Item \"Manage Versions\" in \"StudyResetAction\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 69
 testRunner.And("I click ActionPalette Item \"Upload Study File\" in \"StudyVersionMgmtListActions\" A" +
                    "ctionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 70
 testRunner.And("I click browse button in upload study file page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 71
 testRunner.And("I upload study \"Local_Labs_Enab.zip\" with Label \"Study4\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 72
    testRunner.And("I click continue in modal dialog having title \"Confirm\" and message \"Uploaded stu" +
                    "dy version has Local Labs as Enabled which is different from earlier study versi" +
                    "on.\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 73
 testRunner.And("I open study which has \"Uploaded\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 74
 testRunner.And("I click ActionPalette Item \"Stage\" in \"StudyVersionPropertiesActions\" ActionPalet" +
                    "te", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 75
 testRunner.And("I open study which has \"Staged\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 76
 testRunner.And("I see notes \"Note: Major changes have been detected to the study design. Patient " +
                    "migration will be required.\" in StudyVersionPropertiesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 77
 testRunner.And("I click ActionPalette Item \"Publish\" in \"StudyVersionPropertiesActions\" ActionPal" +
                    "ette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 78
 testRunner.And("I clicked Continue button in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 79
    testRunner.And("I select patient migration option \"Do not migrate\" in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 80
 testRunner.And("I click Publish button in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 81
 testRunner.And("I navigate to \"Inbox\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "Subject"});
            table3.AddRow(new string[] {
                        "Publishing of Study file (Study4) - complete."});
#line 82
 testRunner.And("I check subjects in inbox folder \"Jobs\"", ((string)(null)), table3, "And ");
#line 85
 testRunner.Then("I see main tab \"Local Labs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("07_When I delete a study then I should not see Local Labs in the header.")]
        [NUnit.Framework.CategoryAttribute("US68898.3")]
        public virtual void _07_WhenIDeleteAStudyThenIShouldNotSeeLocalLabsInTheHeader_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("07_When I delete a study then I should not see Local Labs in the header.", null, new string[] {
                        "US68898.3"});
#line 88
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 89
 testRunner.When("I delete study", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 90
 testRunner.Then("I dont see main tab \"Local Labs\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("08_Site and Lab Setup")]
        public virtual void _08_SiteAndLabSetup()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("08_Site and Lab Setup", null, ((string[])(null)));
#line 92
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 93
 testRunner.When("I click breadcrumb \"Study Administration\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 94
 testRunner.And("I click Link \"Site Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
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
            table4.AddRow(new string[] {
                        "05",
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
#line 95
 testRunner.And("I enter sites details and Save", ((string)(null)), table4, "And ");
#line 98
 testRunner.And("I open site with siteid \"05\" and site name \"Site\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 99
 testRunner.And("I click ActionPalette Item \"Manage Users\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 100
 testRunner.Then("I add and save user \"testadmin testadmin\" to site users in SiteManageUsersPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 101
 testRunner.When("I click breadcrumb \"Study Administration\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 102
 testRunner.And("I click Link \"Lab Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 103
 testRunner.And("I click Link \"Manage Laboratories\" In Lab Management Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
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
            table5.AddRow(new string[] {
                        "Lab01",
                        "Lab01",
                        "PFIZER",
                        "RD",
                        "A1",
                        "A2",
                        "A3",
                        "City1",
                        "AP",
                        "500084",
                        "INDIA(IND)",
                        "",
                        "11111111",
                        "22222222",
                        "Active",
                        "Mr.XYZ"});
#line 104
 testRunner.And("I enter labs details and Save", ((string)(null)), table5, "And ");
#line 107
 testRunner.And("I open lab with labid \"Lab01\" from LabManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 108
 testRunner.And("I click ActionPalette Item \"Associate Site(s)\" in \"LabMgmt_Actions\" ActionPalette" +
                    "", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 109
 testRunner.And("I enter filter text \"05\" in associated sites filter textbox in AssociateSitesPage" +
                    "", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "Site"});
            table6.AddRow(new string[] {
                        "05 - Site"});
#line 110
 testRunner.Then("I add and save sites to assocaited sites in LabManagementSitesPage", ((string)(null)), table6, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("09_When I select a LabName  on the Labs Tests page Then I should see TestLabel al" +
            "ong with Test Description in the left pane.")]
        [NUnit.Framework.CategoryAttribute("US68898.3")]
        public virtual void _09_WhenISelectALabNameOnTheLabsTestsPageThenIShouldSeeTestLabelAlongWithTestDescriptionInTheLeftPane_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("09_When I select a LabName  on the Labs Tests page Then I should see TestLabel al" +
                    "ong with Test Description in the left pane.", null, new string[] {
                        "US68898.3"});
#line 115
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 116
  testRunner.When("I click breadcrumb \"Study Administration\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 117
  testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 118
  testRunner.And("I upload a study \"Local_Labs_Enab.zip\" with study label \"Study1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 119
  testRunner.And("I navigate to \"Local Labs\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 120
  testRunner.And("I open lab with labid \"Lab01\" from ManageReferenceRanges page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 121
  testRunner.And("I open labtest with labname \"BMI\" from labtests page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "ActionPaletteItems"});
            table7.AddRow(new string[] {
                        "BMI(06)"});
            table7.AddRow(new string[] {
                        "M.R.I(03)"});
            table7.AddRow(new string[] {
                        "Sugar(02)"});
            table7.AddRow(new string[] {
                        "Weight(05)"});
            table7.AddRow(new string[] {
                        "X-Ray(04)"});
#line 122
  testRunner.Then("I see below ActionPalette Items in Left ActionPalette", ((string)(null)), table7, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("10_When I give search criteria on reference range page Then I should see Test lab" +
            "el along with test description")]
        public virtual void _10_WhenIGiveSearchCriteriaOnReferenceRangePageThenIShouldSeeTestLabelAlongWithTestDescription()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("10_When I give search criteria on reference range page Then I should see Test lab" +
                    "el along with test description", null, ((string[])(null)));
#line 130
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 131
  testRunner.When("I enter search text \"Sugar\" in Lab Test (Name) search box in ReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                        "ActionPaletteItems"});
            table8.AddRow(new string[] {
                        "Sugar(02)"});
#line 132
  testRunner.Then("I see below ActionPalette Items in Left ActionPalette", ((string)(null)), table8, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("11_When I give search criteria on reference range page Then I should see Test lab" +
            "el along with test description")]
        public virtual void _11_WhenIGiveSearchCriteriaOnReferenceRangePageThenIShouldSeeTestLabelAlongWithTestDescription()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("11_When I give search criteria on reference range page Then I should see Test lab" +
                    "el along with test description", null, ((string[])(null)));
#line 136
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 137
  testRunner.When("I enter search text \"ABC\" in Lab Test (Name) search box in ReferenceRangesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table9 = new TechTalk.SpecFlow.Table(new string[] {
                        "ActionPaletteItems"});
#line 138
  testRunner.Then("I do not see any ActionPalette Items in Left ActionPalette", ((string)(null)), table9, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("12_When I click on the Add button on  Lab Test (Name) Then the cancel button icon" +
            " should be shown as red multiplication sign")]
        [NUnit.Framework.CategoryAttribute("US68912.1")]
        public virtual void _12_WhenIClickOnTheAddButtonOnLabTestNameThenTheCancelButtonIconShouldBeShownAsRedMultiplicationSign()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("12_When I click on the Add button on  Lab Test (Name) Then the cancel button icon" +
                    " should be shown as red multiplication sign", null, new string[] {
                        "US68912.1"});
#line 143
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 144
    testRunner.When("I click on Add button to create a new lab test range record", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 145
    testRunner.Then("I should that the cancel button has cross icon in red color.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("13_Logout form DataLabs")]
        public virtual void _13_LogoutFormDataLabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("13_Logout form DataLabs", null, ((string[])(null)));
#line 147
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 148
 testRunner.When("I clik logout of Datalabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 149
 testRunner.Then("I see login page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion
