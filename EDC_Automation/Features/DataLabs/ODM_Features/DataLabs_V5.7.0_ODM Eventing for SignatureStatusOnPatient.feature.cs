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
namespace EDC_Automation.Features.DataLabs.ODM_Features
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("DataLabs_V5.7.0_ODM Eventing for SignatureStatusOnPatient")]
    public partial class DataLabs_V5_7_0_ODMEventingForSignatureStatusOnPatientFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "DataLabs_V5.7.0_ODM Eventing for SignatureStatusOnPatient.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "DataLabs_V5.7.0_ODM Eventing for SignatureStatusOnPatient", "\tTest Summary:\r\n\t\t\t1. Verification of odm eventing xml for Signature Status chang" +
                    "ed on Patient level.", ProgrammingLanguage.CSharp, ((string[])(null)));
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
#line 7
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 8
 testRunner.Given("I logged in to DataLabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 9
 testRunner.Then("I see Datalabs Home Page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T02_Delete the current study")]
        public virtual void T02_DeleteTheCurrentStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T02_Delete the current study", null, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("T03_Publish the study")]
        public virtual void T03_PublishTheStudy()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T03_Publish the study", null, ((string[])(null)));
#line 15
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 16
 testRunner.When("I click breadcrumb \"Study Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 17
 testRunner.And("I upload a study \"Test4500_Base study V1.Zip\" with study label \"Test4500\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 18
 testRunner.Then("I see study label \"Test4500\" in header", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T04_Add Site 01-Site")]
        public virtual void T04_AddSite01_Site()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T04_Add Site 01-Site", null, ((string[])(null)));
#line 20
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 21
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 22
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
#line 23
 testRunner.And("I enter sites details and Save", ((string)(null)), table1, "And ");
#line 26
 testRunner.And("I open site with siteid \"01\" and site name \"Site\" from SiteManagement page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 27
 testRunner.And("I click ActionPalette Item \"Manage Users\" in \"SiteActions\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 28
 testRunner.And("I add and save user \"testadmin testadmin\" to site users in SiteManageUsersPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 29
 testRunner.And("I click breadcrumb \"Site Management\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T05_Navigate to the Edit Preferences page and set the CRF Default save to Complet" +
            "e and update the Endpoint URL")]
        public virtual void T05_NavigateToTheEditPreferencesPageAndSetTheCRFDefaultSaveToCompleteAndUpdateTheEndpointURL()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T05_Navigate to the Edit Preferences page and set the CRF Default save to Complet" +
                    "e and update the Endpoint URL", null, ((string[])(null)));
#line 31
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 32
 testRunner.When("I click breadcrumb \"Study Administration\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 33
 testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 34
 testRunner.And("I click ActionPalette Item \"Edit Preferences\" in \"StudyResetAction\" ActionPalette" +
                    "", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 35
 testRunner.And("I open tab \"Forms\" in StudyEditPreferencesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 36
 testRunner.And("I select the \"Partial\" for Default Save: in StudyEditPreferencesFormsPage.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 37
 testRunner.And("I open tab \"patient data eventing\" in StudyEditPreferencesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 38
 testRunner.And("I update the endpoint URL under Patient Data Eventing tab.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 39
 testRunner.And("I click \"Save\" button on the Edit Preferences page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 40
 testRunner.Then("The CRF with data is saved and checked-in successfully.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T06_Add patient 01-PAT from Datalabs UI")]
        public virtual void T06_AddPatient01_PATFromDatalabsUI()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T06_Add patient 01-PAT from Datalabs UI", null, ((string[])(null)));
#line 42
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 43
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 44
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "ScreenID",
                        "PatientInitials",
                        "ScreenDate"});
            table2.AddRow(new string[] {
                        "01",
                        "PAT",
                        "06/13/2018"});
#line 45
 testRunner.When("I add patient with below details.", ((string)(null)), table2, "When ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "PatientID"});
            table3.AddRow(new string[] {
                        "01-PAT"});
#line 48
 testRunner.Then("I see below patients added in the Patients table.", ((string)(null)), table3, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T07_Add custom fields to query for sample text question query in visit screening " +
            "form1")]
        public virtual void T07_AddCustomFieldsToQueryForSampleTextQuestionQueryInVisitScreeningForm1()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T07_Add custom fields to query for sample text question query in visit screening " +
                    "form1", null, ((string[])(null)));
#line 52
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 53
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 54
 testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 55
 testRunner.And("I click ActionPalette Item \"Edit Preferences\" in \"StudyResetAction\" ActionPalette" +
                    "", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 56
 testRunner.And("I open tab \"DCFs\" in StudyEditPreferencesPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 57
 testRunner.And("I enter text \"Custom1\" in FieldLabelTextbox1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 58
 testRunner.And("I click ActiveRadioButton1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 59
 testRunner.And("I enter text \"Item1\" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 60
 testRunner.And("I click AddButton1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 61
 testRunner.And("I enter text \"Item2\" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 62
 testRunner.And("I click AddButton1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 63
 testRunner.And("I enter text \"Item3\" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 64
 testRunner.And("I click AddButton1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 65
 testRunner.And("I enter text \"Item4\" in AddNewItemTextbox1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 66
 testRunner.And("I click AddButton1 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 67
 testRunner.And("I enter text \"Custom2\" in FieldLabelTextbox2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 68
 testRunner.And("I click ActiveRadioButton2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 69
 testRunner.And("I enter text \"Item5\" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 70
 testRunner.And("I click AddButton2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 71
 testRunner.And("I enter text \"Item6\" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 72
 testRunner.And("I click AddButton2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 73
 testRunner.And("I enter text \"Item7\" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 74
 testRunner.And("I click AddButton2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 75
 testRunner.And("I enter text \"Item8\" in AddNewItemTextbox2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 76
 testRunner.And("I click AddButton2 in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 77
 testRunner.And("I click SaveButton in StudyEditPreferencesDCFsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T08_Select a site and a patient.")]
        public virtual void T08_SelectASiteAndAPatient_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T08_Select a site and a patient.", null, ((string[])(null)));
#line 79
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 80
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 81
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 82
 testRunner.When("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 83
 testRunner.Then("I see Patient details page for \"01-PAT\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T09_Navigate to Patient and submit the form Form1 in visit (Week2)")]
        public virtual void T09_NavigateToPatientAndSubmitTheFormForm1InVisitWeek2()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T09_Navigate to Patient and submit the form Form1 in visit (Week2)", null, ((string[])(null)));
#line 85
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 86
 testRunner.And("I expand \"Visit (Week 2)\" to select and open \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 87
 testRunner.When("I click \"Checkout\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "QuestionPrompt",
                        "AnswerValue",
                        "AnswerFieldType"});
            table4.AddRow(new string[] {
                        "Sample text question:",
                        "Text",
                        "TextBox"});
            table4.AddRow(new string[] {
                        "Sample select question:",
                        "No",
                        "ListBox"});
            table4.AddRow(new string[] {
                        "Sample radio question:",
                        "Yes",
                        "Radio"});
            table4.AddRow(new string[] {
                        "Sample integer question:",
                        "1050",
                        "TextBox"});
            table4.AddRow(new string[] {
                        "Sample float question:",
                        "12.35",
                        "TextBox"});
            table4.AddRow(new string[] {
                        "Sample date question:",
                        "10/10/1997",
                        "TextBox"});
#line 88
 testRunner.And("I enter below flat questions data in the CRF.", ((string)(null)), table4, "And ");
#line 96
 testRunner.And("I click on \"Save & Close\" button on \"Form1\" CRF.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 97
 testRunner.And("I click Continue button of Modal \"Queries Result\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 98
 testRunner.Then("The CRF with data is saved and checked-in successfully.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T10_Request signature for multiple forms in the same event.")]
        public virtual void T10_RequestSignatureForMultipleFormsInTheSameEvent_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T10_Request signature for multiple forms in the same event.", null, ((string[])(null)));
#line 100
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 101
 testRunner.When("I click ActionPalette Item \"Request Signature\" in \"PatientPortalActions\" ActionPa" +
                    "lette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 102
 testRunner.When("I click on Select All button in RequestSignaturePage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 103
 testRunner.And("I click on Submit button in RequestSignaturePage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 104
 testRunner.Then("I see success message \"CRF for Signature Saved Successful\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T11_Request signature for multiple forms in the same event.")]
        public virtual void T11_RequestSignatureForMultipleFormsInTheSameEvent_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T11_Request signature for multiple forms in the same event.", null, ((string[])(null)));
#line 106
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 107
 testRunner.Given("I navigate to \"Patients\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 108
 testRunner.And("I select the site \"01-Site\" from Sites dropdown.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 109
 testRunner.When("I select the patient \"01-PAT\" from patients table.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 110
 testRunner.And("I click ActionPalette Item \"Sign Casebook\" in \"PatientPortalActions\" ActionPalett" +
                    "e", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 111
 testRunner.And("I click on Accept All button in SignCasebookPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 112
 testRunner.And("I given username as \"testadmin\" in SignCasebookPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 113
 testRunner.And("I given password as \"Datalabs1234\" in SignCasebookPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 114
 testRunner.And("I click on Submit button in SignCasebbokPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 115
 testRunner.Then("I see success message \"CRFs for Casebook Saved Successful\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T12_Update the signature status and DCF status after publish the study.")]
        public virtual void T12_UpdateTheSignatureStatusAndDCFStatusAfterPublishTheStudy_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T12_Update the signature status and DCF status after publish the study.", null, ((string[])(null)));
#line 117
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 118
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 119
 testRunner.And("I click Link \"Study Management\" In StudyAdministrationPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 120
 testRunner.And("I click ActionPalette Item \"Manage Versions\" in \"StudyResetAction\" ActionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 121
 testRunner.And("I click ActionPalette Item \"Upload Study File\" in \"StudyVersionMgmtListActions\" A" +
                    "ctionPalette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 122
 testRunner.And("I click browse button in upload study file page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 123
 testRunner.And("I upload study \"Test4500_Updated Study V2.zip\" with Label \"V2\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 124
 testRunner.And("I open study which has \"Uploaded\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 125
 testRunner.And("I click ActionPalette Item \"Stage\" in \"StudyVersionPropertiesActions\" ActionPalet" +
                    "te", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 126
 testRunner.And("I open study which has \"Staged\" status", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 127
 testRunner.And("I click ActionPalette Item \"Publish\" in \"StudyVersionPropertiesActions\" ActionPal" +
                    "ette", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 128
 testRunner.And("I select \"Yes\" to reevaluate \"Change SD-Verify Flags?\" in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 129
 testRunner.And("I select \"Yes\" to reevaluate \"Change D-Review Flags?\" in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 130
 testRunner.And("I select \"Yes\" to reevaluate \"Change M-Review Flags?\" in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 131
 testRunner.And("I select \"Yes\" to reevaluate \"Change Signatures?\" in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 132
 testRunner.And("I clicked Continue button in PublishStudyFlagsPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 133
 testRunner.And("I select patient migration option \"Migrate all patients\" in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 134
 testRunner.And("I click Publish button in PublishStudyPage", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 135
 testRunner.And("I navigate to \"Inbox\" tab from main menu.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "Subject"});
            table5.AddRow(new string[] {
                        "Migration of Site 01 for Study file (V2) - complete. 1 out of 1 patients migrated" +
                            " successfully. To review see migration report."});
            table5.AddRow(new string[] {
                        "Publishing of Study file (V2) - complete."});
#line 136
 testRunner.Then("I check subjects in inbox folder \"Jobs\"", ((string)(null)), table5, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T13_verify the Signature status and DCF status on patient level.")]
        [NUnit.Framework.CategoryAttribute("ObjectiveEvidence")]
        [NUnit.Framework.CategoryAttribute("ReqID:3.1.6.11")]
        public virtual void T13_VerifyTheSignatureStatusAndDCFStatusOnPatientLevel_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T13_verify the Signature status and DCF status on patient level.", null, new string[] {
                        "ObjectiveEvidence",
                        "ReqID:3.1.6.11"});
#line 142
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 143
 testRunner.Given(@"I save the Event XML data in ""SIgnatureAndDCFStatusUpdatedActual1.xml"" file by executing the query ""select TOP 1 XmlMessage from OdmSubscriberDetail where StudyEventKey = 16 and XmlMessage like '%ItemData ItemOID=""Date"" TransactionType=""Update"" Value=""10/10/1997""%' order by OdmSubscriberDetailKey desc""", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 144
 testRunner.And("I have the XML file \"SIgnatureAndDCFStatusUpdatedExpected1.xml\" available in the " +
                    "project folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 145
 testRunner.And("I have the XML file \"SIgnatureAndDCFStatusUpdatedActual1.xml\" available in the Te" +
                    "st XML Files folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "TagName",
                        "FieldName"});
            table6.AddRow(new string[] {
                        "",
                        "CreationDateTime"});
            table6.AddRow(new string[] {
                        "",
                        "DateTimeStamp"});
            table6.AddRow(new string[] {
                        "",
                        "SubjectKey"});
            table6.AddRow(new string[] {
                        "",
                        "FileOID"});
            table6.AddRow(new string[] {
                        "",
                        "SourceID"});
            table6.AddRow(new string[] {
                        "",
                        "QueryOID"});
            table6.AddRow(new string[] {
                        "",
                        "SourceSystemVersion"});
#line 146
 testRunner.Then("I verify that the data in both XML files is same except for below tags and fields" +
                    ".", ((string)(null)), table6, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("T14_Logout from Datalabs application.")]
        public virtual void T14_LogoutFromDatalabsApplication_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("T14_Logout from Datalabs application.", null, ((string[])(null)));
#line 156
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 157
 testRunner.When("I clik logout of Datalabs", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 158
 testRunner.Then("I see login page", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion
