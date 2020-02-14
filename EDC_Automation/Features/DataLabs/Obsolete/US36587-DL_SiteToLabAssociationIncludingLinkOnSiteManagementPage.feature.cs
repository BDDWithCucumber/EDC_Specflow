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
namespace EDC_Automation.Features.DataLabs.Obsolete
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("US36587-DL_SiteToLabAssociationIncludingLinkOnSiteManagementPage")]
    public partial class US36587_DL_SiteToLabAssociationIncludingLinkOnSiteManagementPageFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "US36587-DL_SiteToLabAssociationIncludingLinkOnSiteManagementPage.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "US36587-DL_SiteToLabAssociationIncludingLinkOnSiteManagementPage", @"As a Lab Administrator,
I want to be able to associate Labs to a Site,
So that I can use associated Labs for collecting test results and reference ranges for that Site.

Acceptance Criteria:

	1. I shall be able to associate one or more labs to a Site through Site Management> <Site ID> >Associate Lab(s) screen.
	2. I shall have ability to filter or search for particular lab using a combination of the lab properties Lab ID and Lab Name.", ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("US36587_1 User can\'t see Associate Lab(s) link on Site page when the permission i" +
            "s set to Deny.")]
        [NUnit.Framework.CategoryAttribute("mytag")]
        public virtual void US36587_1UserCantSeeAssociateLabSLinkOnSitePageWhenThePermissionIsSetToDeny_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_1 User can\'t see Associate Lab(s) link on Site page when the permission i" +
                    "s set to Deny.", null, new string[] {
                        "mytag"});
#line 13
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 14
 testRunner.Given("I have logged into DataLabs application as an Administrator user.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 15
 testRunner.And("I navigate to Study Administration page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 16
 testRunner.And("I select Group Management link on Study Administration page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 17
 testRunner.And("I select \"EDC Engineering Admins Group\" from Group Management page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 18
 testRunner.And("I select Edit Group Permissions.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 19
 testRunner.When("I set Associate Lab(s) permission under Site Permissions section to Deny and Save" +
                    ".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 20
 testRunner.And("I select Study Administration from the breadcrumb.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 21
 testRunner.And("I select \"Site Management\" link on Study Administration page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 22
 testRunner.And("I select the site \"01-Site\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 23
 testRunner.Then("I should see Associate Lab(s) link in the actions palette.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_2 User can see Associate Lab(s) link on Site page when the permission is " +
            "set to Allow.")]
        public virtual void US36587_2UserCanSeeAssociateLabSLinkOnSitePageWhenThePermissionIsSetToAllow_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_2 User can see Associate Lab(s) link on Site page when the permission is " +
                    "set to Allow.", null, ((string[])(null)));
#line 25
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 26
 testRunner.Given("I have logged into DataLab(s) application as an Administrator user.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 27
 testRunner.And("I navigate to Study Administration page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 28
 testRunner.And("I select \"Group Management\" link on Study Administration page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 29
 testRunner.And("I select \"EDC Engineering Admins Group\" from Group Management page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 30
 testRunner.And("I select Edit Group Permissions.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 31
 testRunner.When("I set Associate Lab(s) permission under Site Permissions section to Allow and Sav" +
                    "e.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 32
 testRunner.And("I select Study Administration from the breadcrumb.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 33
 testRunner.And("I select \"Site Management\" link on Study Administration page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 34
 testRunner.And("I select the site \"01-Site\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 35
 testRunner.Then("I should see Associate Lab(s) link in the actions palette.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_3 User can access Assocaite Lab(s) page on selecting Associate Lab(s) lin" +
            "k on Site page.")]
        public virtual void US36587_3UserCanAccessAssocaiteLabSPageOnSelectingAssociateLabSLinkOnSitePage_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_3 User can access Assocaite Lab(s) page on selecting Associate Lab(s) lin" +
                    "k on Site page.", null, ((string[])(null)));
#line 37
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 38
 testRunner.Given("I have selected the site \"01-Site\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 39
 testRunner.When("I select Associate Lab(s) link on the Site page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 40
 testRunner.Then("I should see Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_4 Verification of bread crumb on the Associate Lab(s) page.")]
        public virtual void US36587_4VerificationOfBreadCrumbOnTheAssociateLabSPage_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_4 Verification of bread crumb on the Associate Lab(s) page.", null, ((string[])(null)));
#line 42
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 43
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 44
 testRunner.Then("I should see bread crumb as Study Administration > Site Management > 01-Site > As" +
                    "sociate Lab(s)", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_5 Verification of page title and labels on Associate Lab(s) page.")]
        public virtual void US36587_5VerificationOfPageTitleAndLabelsOnAssociateLabSPage_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_5 Verification of page title and labels on Associate Lab(s) page.", null, ((string[])(null)));
#line 46
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 47
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 48
 testRunner.Then("I see page title as Associate Lab(s)", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 49
 testRunner.And("I see Available Lab(s) label.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 50
 testRunner.And("I see Associated Lab(s) label.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 51
 testRunner.And("I see title for Available and Associated Lab(s) as Lab ID - Labaratory Name", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_6 Associate Lab(s) page has Available and Associated Lab(s) lists with Ad" +
            "d >> and << Remove buttons.")]
        public virtual void US36587_6AssociateLabSPageHasAvailableAndAssociatedLabSListsWithAddAndRemoveButtons_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_6 Associate Lab(s) page has Available and Associated Lab(s) lists with Ad" +
                    "d >> and << Remove buttons.", null, ((string[])(null)));
#line 53
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 54
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 55
 testRunner.Then("I should see Available Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 56
 testRunner.And("I should see Associate Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 57
 testRunner.And("I should see Filter field for Available Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 58
 testRunner.And("I should see Filter field for Associated Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 59
 testRunner.And("I should see Add >> button.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 60
 testRunner.And("I should see << Remove button.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 61
 testRunner.And("I should see Save button.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 62
 testRunner.And("I should see Cancel button.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_7 Available Lab(s) list display the Labs in the format of LabID - LabName" +
            ".")]
        [NUnit.Framework.TestCaseAttribute("US3658701 - Lab01", null)]
        [NUnit.Framework.TestCaseAttribute("US3658702 - Lab02", null)]
        [NUnit.Framework.TestCaseAttribute("US3658703 - Lab03", null)]
        [NUnit.Framework.TestCaseAttribute("US3658704 - Lab03", null)]
        public virtual void US36587_7AvailableLabSListDisplayTheLabsInTheFormatOfLabID_LabName_(string labName, string[] exampleTags)
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_7 Available Lab(s) list display the Labs in the format of LabID - LabName" +
                    ".", null, exampleTags);
#line 64
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 65
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 66
 testRunner.Then(string.Format("I should see lab {0} in Available Lab(s) listbox.", labName), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_8 Associate Lab(s) will be empty when no labs are associated.")]
        public virtual void US36587_8AssociateLabSWillBeEmptyWhenNoLabsAreAssociated_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_8 Associate Lab(s) will be empty when no labs are associated.", null, ((string[])(null)));
#line 74
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 75
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 76
 testRunner.Then("I should see Asscoaite Lab(s) listbox with no Labs information in it.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_9 Labs information in Available Lab(s) listbox are sorted in ascending al" +
            "phanumerically.")]
        public virtual void US36587_9LabsInformationInAvailableLabSListboxAreSortedInAscendingAlphanumerically_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_9 Labs information in Available Lab(s) listbox are sorted in ascending al" +
                    "phanumerically.", null, ((string[])(null)));
#line 78
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 79
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 80
 testRunner.Then("All the Labs in Available Lab(s) list are ordered alphanumerically in ascending o" +
                    "rder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_10 Labs can be filtered in Available Lab(s) list with a text and on filte" +
            "ring all Labs will be returned that contains the search text either in ID or Nam" +
            "e.")]
        [NUnit.Framework.TestCaseAttribute("03", null)]
        [NUnit.Framework.TestCaseAttribute("US", null)]
        [NUnit.Framework.TestCaseAttribute("Lab", null)]
        public virtual void US36587_10LabsCanBeFilteredInAvailableLabSListWithATextAndOnFilteringAllLabsWillBeReturnedThatContainsTheSearchTextEitherInIDOrName_(string data, string[] exampleTags)
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_10 Labs can be filtered in Available Lab(s) list with a text and on filte" +
                    "ring all Labs will be returned that contains the search text either in ID or Nam" +
                    "e.", null, exampleTags);
#line 82
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 83
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 84
 testRunner.When("I enter search criteria as <data> in Available Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 85
 testRunner.Then("I see all the Labs in Available Lab(s) list have <data> in the Lab ID or Name.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_11 No Labs are displayed in Available Lab(s) list when filtered with text" +
            " that doesn\'t match either ID or Name.")]
        public virtual void US36587_11NoLabsAreDisplayedInAvailableLabSListWhenFilteredWithTextThatDoesntMatchEitherIDOrName_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_11 No Labs are displayed in Available Lab(s) list when filtered with text" +
                    " that doesn\'t match either ID or Name.", null, ((string[])(null)));
#line 92
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 93
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 94
 testRunner.When("I enter search criteria as \"xx101\" in Available Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 95
 testRunner.Then("There are no Labs displayed in Available list.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 96
 testRunner.And("I clear the search criteria from the Available Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_12 Labs can be moved to Associated list by selecting and clicking on Add " +
            "button.")]
        [NUnit.Framework.TestCaseAttribute("US3658701 - Lab01", null)]
        [NUnit.Framework.TestCaseAttribute("US3658704 - Lab03", null)]
        [NUnit.Framework.TestCaseAttribute("US3658703 - Lab03", null)]
        [NUnit.Framework.TestCaseAttribute("US3658702 - Lab02", null)]
        public virtual void US36587_12LabsCanBeMovedToAssociatedListBySelectingAndClickingOnAddButton_(string lab, string[] exampleTags)
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_12 Labs can be moved to Associated list by selecting and clicking on Add " +
                    "button.", null, exampleTags);
#line 98
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 99
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 100
 testRunner.When(string.Format("I select {0} from Available Lab(s) list.", lab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 101
 testRunner.And("I select Add >> button.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 102
 testRunner.Then(string.Format("I see {0} in Associated Lab(s) list.", lab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_13 Labs can be associated by clicking on Save button on Associate Lab(s) " +
            "page.")]
        public virtual void US36587_13LabsCanBeAssociatedByClickingOnSaveButtonOnAssociateLabSPage_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_13 Labs can be associated by clicking on Save button on Associate Lab(s) " +
                    "page.", null, ((string[])(null)));
#line 110
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 111
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 112
 testRunner.When("I click Save button on Associate Lab(s) page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 113
 testRunner.Then("I will be returned to Edit Site information page for \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 114
 testRunner.And("I select Associate Lab(s) link on the Site page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "Lab"});
            table1.AddRow(new string[] {
                        "US3658701 - Lab01"});
            table1.AddRow(new string[] {
                        "US3658704 - Lab03"});
            table1.AddRow(new string[] {
                        "US3658703 - Lab03"});
            table1.AddRow(new string[] {
                        "US3658702 - Lab02"});
#line 115
 testRunner.Then("I see below list of Labs in Associated Lab(s) list box.", ((string)(null)), table1, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_14 Labs information in Associated Lab(s) listbox are sorted in ascending " +
            "alphanumerically.")]
        public virtual void US36587_14LabsInformationInAssociatedLabSListboxAreSortedInAscendingAlphanumerically_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_14 Labs information in Associated Lab(s) listbox are sorted in ascending " +
                    "alphanumerically.", null, ((string[])(null)));
#line 122
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 123
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 124
 testRunner.Then("All the Labs in Associated Lab(s) list are ordered alphanumerically in ascending " +
                    "order.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_15 Labs can be filtered in Associated Lab(s) list with a text and on filt" +
            "ering all Labs will be returned that contains the search text either in ID or Na" +
            "me.")]
        [NUnit.Framework.TestCaseAttribute("03", null)]
        [NUnit.Framework.TestCaseAttribute("US", null)]
        [NUnit.Framework.TestCaseAttribute("Lab", null)]
        public virtual void US36587_15LabsCanBeFilteredInAssociatedLabSListWithATextAndOnFilteringAllLabsWillBeReturnedThatContainsTheSearchTextEitherInIDOrName_(string data, string[] exampleTags)
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_15 Labs can be filtered in Associated Lab(s) list with a text and on filt" +
                    "ering all Labs will be returned that contains the search text either in ID or Na" +
                    "me.", null, exampleTags);
#line 126
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 127
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 128
 testRunner.When("I enter search criteria as <data> in Associated Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 129
 testRunner.Then("I see all the Labs in Associated Lab(s) list have <data> in the Lab ID or Name.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_16 No Labs are displayed in Associated Lab(s) list when filtered with tex" +
            "t that doesn\'t match either ID or Name.")]
        public virtual void US36587_16NoLabsAreDisplayedInAssociatedLabSListWhenFilteredWithTextThatDoesntMatchEitherIDOrName_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_16 No Labs are displayed in Associated Lab(s) list when filtered with tex" +
                    "t that doesn\'t match either ID or Name.", null, ((string[])(null)));
#line 136
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 137
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 138
 testRunner.When("I enter search criteria as \"xx101\" in Associated Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 139
 testRunner.Then("There are no Labs displayed in Associated list.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 140
 testRunner.And("I clear the search criteria from the Associated Lab(s) list box.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_17 Labs can be moved back to Available Lab(s) by selecting from Associate" +
            "d list and clicking on Remove button.")]
        [NUnit.Framework.TestCaseAttribute("US3658701 - Lab01", null)]
        [NUnit.Framework.TestCaseAttribute("US3658704 - Lab03", null)]
        public virtual void US36587_17LabsCanBeMovedBackToAvailableLabSBySelectingFromAssociatedListAndClickingOnRemoveButton_(string lab, string[] exampleTags)
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_17 Labs can be moved back to Available Lab(s) by selecting from Associate" +
                    "d list and clicking on Remove button.", null, exampleTags);
#line 142
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 143
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 144
 testRunner.When(string.Format("I select {0} from Associated Lab(s) list.", lab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 145
 testRunner.And("I select << Remove button.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 146
 testRunner.Then(string.Format("I see {0} in Available Lab(s) list.", lab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_18 Labs can be de-associated by selecting Save button on Associate Lab(s)" +
            " page.")]
        public virtual void US36587_18LabsCanBeDe_AssociatedBySelectingSaveButtonOnAssociateLabSPage_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_18 Labs can be de-associated by selecting Save button on Associate Lab(s)" +
                    " page.", null, ((string[])(null)));
#line 152
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 153
 testRunner.Given("I am on Associate Lab(s) page for the site \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 154
 testRunner.When("I click Save button on Associate Lab(s) page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 155
 testRunner.Then("I will be returned to Edit Site information page for \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 156
 testRunner.And("I select Associate Lab(s) link on the Site page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "Lab"});
            table2.AddRow(new string[] {
                        "US3658701 - Lab01"});
            table2.AddRow(new string[] {
                        "US3658704 - Lab03"});
#line 157
 testRunner.Then("I see below list of Labs in Available Lab(s) list box.", ((string)(null)), table2, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_19 Lab that is associated a site can be associated again to another Site." +
            "")]
        [NUnit.Framework.TestCaseAttribute("US3658701 - Lab01", null)]
        public virtual void US36587_19LabThatIsAssociatedASiteCanBeAssociatedAgainToAnotherSite_(string lab, string[] exampleTags)
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_19 Lab that is associated a site can be associated again to another Site." +
                    "", null, exampleTags);
#line 162
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 163
 testRunner.Given("I select \"Site Management\" link from breadcrumb.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 164
 testRunner.And("I have selected the site \"02-Site\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 165
 testRunner.When("I select Assocaite Lab(s) link on the Site page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 166
 testRunner.And(string.Format("I select Lab {0} from Available Lab(s) list.", lab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 167
 testRunner.And("I select Add >> button on Associate Lab(s) page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 168
 testRunner.And("I click Save button on Associate Lab(s) page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 169
 testRunner.And("I select Associate Lab(s) link on the Site page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 170
 testRunner.Then(string.Format("The Lab {0} is assigned to site \"02-Site\".", lab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("US36587_20 Selecting Cancel button will discard all the selections made from Avai" +
            "lable and Associated Lab(s) list")]
        [NUnit.Framework.TestCaseAttribute("US3658701 - Lab01", "US3658702 - Lab02", null)]
        public virtual void US36587_20SelectingCancelButtonWillDiscardAllTheSelectionsMadeFromAvailableAndAssociatedLabSList(string associatedLab, string availableLab, string[] exampleTags)
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("US36587_20 Selecting Cancel button will discard all the selections made from Avai" +
                    "lable and Associated Lab(s) list", null, exampleTags);
#line 175
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 176
 testRunner.Given("I am on Associate Lab(s) page for the site \"02-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 177
 testRunner.And(string.Format("I select {0} from Associated Lab(s) list box.", associatedLab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 178
 testRunner.And("I select << Remove button.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 179
 testRunner.And(string.Format("I select {0} from Available Lab(s) list box.", availableLab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 180
 testRunner.And("I select Add >> button.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 181
 testRunner.When("I select Cancel button on Associated Lab(s) page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 182
 testRunner.Then("I will be returned to Edit Site information page for \"01-Site\".", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line 183
 testRunner.And("I select Associate Lab(s) link on the Site page.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 184
 testRunner.And(string.Format("I see {0} in Associated Lab(s) list box.", associatedLab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 185
 testRunner.And(string.Format("I see {0} in Available Lab(s) list box.", availableLab), ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("09_Navigate to Study Administration Page")]
        public virtual void _09_NavigateToStudyAdministrationPage()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("09_Navigate to Study Administration Page", null, ((string[])(null)));
#line 191
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 192
 testRunner.When("I select DataManagerPortal item \"Study Administration\" from drop down", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "When ");
#line 193
 testRunner.Then("I see BreadCrumb \"Study Administration\"", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

