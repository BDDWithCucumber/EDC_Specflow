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
namespace EDC_Automation.Features.DataLabs.CodelistGroups
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("Groups_StudyUpdate")]
    public partial class Groups_StudyUpdateFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "Groups_StudyUpdate.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "Groups_StudyUpdate", null, ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("02_Delete A study")]
        public virtual void _02_DeleteAStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("02_Delete A study", null, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("03_Publish a study")]
        public virtual void _03_PublishAStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("03_Publish a study", null, ((string[])(null)));
#line 12
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 13
 testRunner.When("I click breadcrumb \"Study Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 14
 testRunner.And("I upload a study \"Test4500_Codelist groups Minor and major study Upadate Base stu" +
                    "dy V1.Zip\" with study label \"L1\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 15
 testRunner.Then("I see study label \"Test3210\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("04_Add Sites")]
        public virtual void _04_AddSites()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("04_Add Sites", null, ((string[])(null)));
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
 testRunner.And("I open site with siteid \"01\" and site name \"Site\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 24
 testRunner.And("I click ActionPalette Item \"Manage Users\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 25
 testRunner.And("I add and save user \"testadmin testadmin\" to site users in SiteManageUsersPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 26
 testRunner.And("I click breadcrumb \"Site Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("06_Navigate to Patients tab and select a site and add patient(s).")]
        public virtual void _06_NavigateToPatientsTabAndSelectASiteAndAddPatientS_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("06_Navigate to Patients tab and select a site and add patient(s).", null, ((string[])(null)));
#line 28
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 29
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 30
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "ScreenID",
                        "PatientInitials",
                        "ScreenDate"});
            table2.AddRow(new string[] {
                        "01",
                        "PAT",
                        "08/02/2018"});
            table2.AddRow(new string[] {
                        "02",
                        "PAT",
                        "08/02/2018"});
            table2.AddRow(new string[] {
                        "03",
                        "PAT",
                        "08/02/2018"});
#line 31
 testRunner.When("I add patient with below details.", ((string)(null)), table2, "When ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "PatientID"});
            table3.AddRow(new string[] {
                        "01-PAT"});
            table3.AddRow(new string[] {
                        "02-PAT"});
            table3.AddRow(new string[] {
                        "03-PAT"});
#line 36
 testRunner.Then("I see below patients added in the Patients table.", ((string)(null)), table3, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("07_Select and enroll a patient.")]
        public virtual void _07_SelectAndEnrollAPatient_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("07_Select and enroll a patient.", null, ((string[])(null)));
#line 42
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 43
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 44
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 45
 testRunner.And("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "EnrollID",
                        "EnrollDate",
                        "EntryComplete"});
            table4.AddRow(new string[] {
                        "01",
                        "08/02/2018",
                        "Yes"});
#line 46
 testRunner.When("I enroll the patient \"01-PAT\" with below data.", ((string)(null)), table4, "When ");
#line 49
 testRunner.Then("I see patient \"01-PAT\" status as \"Enrolled\" on Patient details page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("08_Select a site and a patient.")]
        public virtual void _08_SelectASiteAndAPatient_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("08_Select a site and a patient.", null, ((string[])(null)));
#line 51
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 52
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 53
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 54
 testRunner.When("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 55
 testRunner.Then("I see Patient details page for \"01-PAT\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("09_Upload and Stage a Study which has Minor study changes")]
        public virtual void _09_UploadAndStageAStudyWhichHasMinorStudyChanges()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("09_Upload and Stage a Study which has Minor study changes", null, ((string[])(null)));
#line 59
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 60
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 61
 testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 62
 testRunner.And("I click ActionPalette Item \"Manage Versions\" in \"StudyResetAction\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 63
 testRunner.And("I click ActionPalette Item \"Upload Study File\" in \"StudyVersionMgmtListActions\" A" +
                    "ctionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 64
 testRunner.And("I click browse button in upload study file page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 65
 testRunner.And("I upload study \"Test4500_Codelist Groups Minor study Update V2.zip\" with Label \"M" +
                    "inorUpdate\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 66
 testRunner.And("I open study which has \"Uploaded\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 67
 testRunner.And("I click ActionPalette Item \"Stage\" in \"StudyVersionPropertiesActions\" ActionPalet" +
                    "te", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 68
 testRunner.And("I open study which has \"Staged\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 69
 testRunner.Then("I see notes \"Note: The system has determined this is a minor update. Patient migr" +
                    "ation will NOT be required.\" in StudyVersionPropertiesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("10_Publish study which has minor study changes")]
        public virtual void _10_PublishStudyWhichHasMinorStudyChanges()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("10_Publish study which has minor study changes", null, ((string[])(null)));
#line 71
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 72
 testRunner.When("I click ActionPalette Item \"Publish\" in \"StudyVersionPropertiesActions\" ActionPal" +
                    "ette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 73
 testRunner.And("I clicked Continue button in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 74
 testRunner.And("I click Publish button in PublishStudyPage of MinorStudyUpdate", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 75
 testRunner.And("I navigate to \"Inbox\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "Subject"});
            table5.AddRow(new string[] {
                        "Publishing of Study file (MinorUpdate) - complete."});
#line 76
 testRunner.Then("I check subjects in inbox folder \"Jobs\"", ((string)(null)), table5, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("11_Select a site and a patient.")]
        public virtual void _11_SelectASiteAndAPatient_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("11_Select a site and a patient.", null, ((string[])(null)));
#line 80
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 81
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 82
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 83
 testRunner.When("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 84
 testRunner.Then("I see Patient details page for \"01-PAT\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("12_Flat Questions_Verify Listbox items of and un-submitted CRF with checking out." +
            "")]
        public virtual void _12_FlatQuestions_VerifyListboxItemsOfAndUn_SubmittedCRFWithCheckingOut_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("12_Flat Questions_Verify Listbox items of and un-submitted CRF with checking out." +
                    "", null, ((string[])(null)));
#line 86
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 87
 testRunner.Given("I expand \"Visit (Week 7)\" to select and open \"DT1 Form\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 88
 testRunner.When("I click \"Check out\" button on \"DT1 Form\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table6.AddRow(new string[] {
                        "[Blank]"});
            table6.AddRow(new string[] {
                        "Asia"});
            table6.AddRow(new string[] {
                        "Africa"});
            table6.AddRow(new string[] {
                        "USA"});
#line 89
 testRunner.Then("I Verify below \"ListBox\" items are displayed in \"Update Group Desc for Minor:\" on" +
                    " the CRF.", ((string)(null)), table6, "Then ");
#line 95
 testRunner.And("I click on \"Cancel\" button on \"DT1 Form\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("13_Logout from Datalabs")]
        public virtual void _13_LogoutFromDatalabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("13_Logout from Datalabs", null, ((string[])(null)));
#line 97
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 98
 testRunner.When("I clik logout of Datalabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 99
 testRunner.Then("I see login page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("16_Login to Datalabs")]
        public virtual void _16_LoginToDatalabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("16_Login to Datalabs", null, ((string[])(null)));
#line 103
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 104
 testRunner.Given("I logged in to DataLabs In ExistingPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 105
 testRunner.Then("I see Datalabs Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("17_Navigate to StudyManagement page")]
        public virtual void _17_NavigateToStudyManagementPage()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("17_Navigate to StudyManagement page", null, ((string[])(null)));
#line 107
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 108
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 109
 testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 110
 testRunner.Then("I see BreadCrumb \"Study Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("18_Upload and Stage a Study which has major study changes")]
        public virtual void _18_UploadAndStageAStudyWhichHasMajorStudyChanges()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("18_Upload and Stage a Study which has major study changes", null, ((string[])(null)));
#line 112
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 113
 testRunner.When("I click ActionPalette Item \"Manage Versions\" in \"StudyResetAction\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 114
 testRunner.And("I click ActionPalette Item \"Upload Study File\" in \"StudyVersionMgmtListActions\" A" +
                    "ctionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 115
 testRunner.And("I click browse button in upload study file page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 116
 testRunner.And("I upload study \"Test4500_CL_Major study update V3.Zip\" with Label \"Major\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 117
 testRunner.And("I open study which has \"Uploaded\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 118
 testRunner.And("I click ActionPalette Item \"Stage\" in \"StudyVersionPropertiesActions\" ActionPalet" +
                    "te", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 119
 testRunner.And("I open study which has \"Staged\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 120
 testRunner.And("I click ActionPalette Item \"Publish\" in \"StudyVersionPropertiesActions\" ActionPal" +
                    "ette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 121
 testRunner.And("I clicked Continue button in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 122
 testRunner.And("I select patient migration option \"Migrate all patients\" in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 123
 testRunner.And("I click Publish button in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 124
 testRunner.And("I navigate to \"Inbox\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "Subject"});
            table7.AddRow(new string[] {
                        "Migration of Site 01 for Study file (Major) - complete. 3 out of 3 patients migra" +
                            "ted successfully. To review see migration report."});
            table7.AddRow(new string[] {
                        "Publishing of Study file (Major) - complete."});
#line 125
 testRunner.Then("I check subjects in inbox folder \"Jobs\"", ((string)(null)), table7, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("19_Select a site and a patient.")]
        public virtual void _19_SelectASiteAndAPatient_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("19_Select a site and a patient.", null, ((string[])(null)));
#line 130
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 131
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 132
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 133
 testRunner.When("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 134
 testRunner.Then("I see Patient details page for \"01-PAT\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("20_Flat Questions_Verify Listbox items of and un-submitted CRF with checking out." +
            "")]
        public virtual void _20_FlatQuestions_VerifyListboxItemsOfAndUn_SubmittedCRFWithCheckingOut_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("20_Flat Questions_Verify Listbox items of and un-submitted CRF with checking out." +
                    "", null, ((string[])(null)));
#line 136
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 137
 testRunner.Given("I expand \"Visit (Week 7)\" to select and open \"DT1 Form\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 138
 testRunner.When("I click \"Checkout\" button on \"DT1 Form\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table8.AddRow(new string[] {
                        "[Blank]"});
            table8.AddRow(new string[] {
                        "Asia"});
            table8.AddRow(new string[] {
                        "AfricaContinent"});
            table8.AddRow(new string[] {
                        "USA"});
#line 139
 testRunner.Then("I Verify below \"ListBox\" items are displayed in \"Continents:\" on the CRF.", ((string)(null)), table8, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table9 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table9.AddRow(new string[] {
                        "[Blank]"});
            table9.AddRow(new string[] {
                        "India"});
            table9.AddRow(new string[] {
                        "Srilanka"});
            table9.AddRow(new string[] {
                        "Southafrica"});
            table9.AddRow(new string[] {
                        "Kenya"});
#line 145
 testRunner.And("I verify below \"ListBox\" items are displayed in \"Countries:\" on the CRF.", ((string)(null)), table9, "And ");
#line hidden
            TechTalk.SpecFlow.Table table10 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table10.AddRow(new string[] {
                        "[Blank]"});
            table10.AddRow(new string[] {
                        "AP"});
            table10.AddRow(new string[] {
                        "Telangana"});
            table10.AddRow(new string[] {
                        "Galle"});
            table10.AddRow(new string[] {
                        "Kandy"});
            table10.AddRow(new string[] {
                        "Durban"});
            table10.AddRow(new string[] {
                        "Capetown"});
            table10.AddRow(new string[] {
                        "Barbadose"});
            table10.AddRow(new string[] {
                        "NewYork"});
#line 152
 testRunner.And("I verify below \"ListBox\" items are displayed in \"States:\" on the CRF.", ((string)(null)), table10, "And ");
#line hidden
            TechTalk.SpecFlow.Table table11 = new TechTalk.SpecFlow.Table(new string[] {
                        "ItemToVerify"});
            table11.AddRow(new string[] {
                        "[Blank]"});
            table11.AddRow(new string[] {
                        "Red"});
            table11.AddRow(new string[] {
                        "Green"});
            table11.AddRow(new string[] {
                        "Blue"});
#line 163
 testRunner.And("I verify below \"ListBox\" items are displayed in \"Colors:\" on the CRF.", ((string)(null)), table11, "And ");
#line 169
 testRunner.And("I click on \"Cancel\" button on \"DT1 Form\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("21_Logout from Datalabs")]
        public virtual void _21_LogoutFromDatalabs()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("21_Logout from Datalabs", null, ((string[])(null)));
#line 171
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 172
 testRunner.When("I clik logout of Datalabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 173
 testRunner.Then("I see login page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

