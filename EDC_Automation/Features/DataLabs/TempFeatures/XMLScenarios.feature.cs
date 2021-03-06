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
namespace EDC_Automation.Features.DataLabs.TempFeatures
{
    using TechTalk.SpecFlow;
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("TechTalk.SpecFlow", "2.4.0.0")]
    [System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [NUnit.Framework.TestFixtureAttribute()]
    [NUnit.Framework.DescriptionAttribute("XMLScenarios")]
    public partial class XMLScenariosFeature
    {
        
        private TechTalk.SpecFlow.ITestRunner testRunner;
        
#line 1 "XMLScenarios.feature"
#line hidden
        
        [NUnit.Framework.OneTimeSetUpAttribute()]
        public virtual void FeatureSetup()
        {
            testRunner = TechTalk.SpecFlow.TestRunnerManager.GetTestRunner();
            TechTalk.SpecFlow.FeatureInfo featureInfo = new TechTalk.SpecFlow.FeatureInfo(new System.Globalization.CultureInfo("en-US"), "XMLScenarios", "\tThis is a sample feature to test XML file tags, data and structure.", ProgrammingLanguage.CSharp, ((string[])(null)));
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
        [NUnit.Framework.DescriptionAttribute("01_Verification of tags in an XML file")]
        public virtual void _01_VerificationOfTagsInAnXMLFile()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("01_Verification of tags in an XML file", null, ((string[])(null)));
#line 4
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 5
 testRunner.Given("I have the XML file \"SampleAddPatientODM.xml\" available in the project folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
            TechTalk.SpecFlow.Table table1 = new TechTalk.SpecFlow.Table(new string[] {
                        "TagName"});
            table1.AddRow(new string[] {
                        "ODM"});
            table1.AddRow(new string[] {
                        "Study"});
            table1.AddRow(new string[] {
                        "GlobalVariables"});
            table1.AddRow(new string[] {
                        "StudyName"});
            table1.AddRow(new string[] {
                        "StudyDescription"});
            table1.AddRow(new string[] {
                        "ProtocolName"});
            table1.AddRow(new string[] {
                        "ClinicalData"});
            table1.AddRow(new string[] {
                        "SubjectData"});
            table1.AddRow(new string[] {
                        "AuditRecord"});
            table1.AddRow(new string[] {
                        "UserRef"});
            table1.AddRow(new string[] {
                        "LocationRef"});
            table1.AddRow(new string[] {
                        "DateTimeStamp"});
            table1.AddRow(new string[] {
                        "ReasonForChange"});
            table1.AddRow(new string[] {
                        "SourceID"});
            table1.AddRow(new string[] {
                        "SiteRef"});
            table1.AddRow(new string[] {
                        "Annotation"});
            table1.AddRow(new string[] {
                        "Comment"});
            table1.AddRow(new string[] {
                        "StudyEventData"});
            table1.AddRow(new string[] {
                        "FormData"});
            table1.AddRow(new string[] {
                        "ItemGroupData"});
            table1.AddRow(new string[] {
                        "ItemData"});
            table1.AddRow(new string[] {
                        "MeasurementUnitRef"});
            table1.AddRow(new string[] {
                        "ItemData"});
            table1.AddRow(new string[] {
                        "MeasurementUnitRef"});
            table1.AddRow(new string[] {
                        "ItemData"});
            table1.AddRow(new string[] {
                        "MeasurementUnitRef"});
            table1.AddRow(new string[] {
                        "StudyEventData"});
            table1.AddRow(new string[] {
                        "FormData"});
            table1.AddRow(new string[] {
                        "FormData"});
            table1.AddRow(new string[] {
                        "FormData"});
            table1.AddRow(new string[] {
                        "FormData"});
#line 6
 testRunner.Then("I verify tags structure in \"SampleAddPatientODM.xml\" file as displayed in the tab" +
                    "le.", ((string)(null)), table1, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("02_Verification of tags in an XML file")]
        public virtual void _02_VerificationOfTagsInAnXMLFile()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("02_Verification of tags in an XML file", null, ((string[])(null)));
#line 40
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 42
 testRunner.Given("I have opened the XML file \"SampleAddPatientODM.xml\" located in test folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
            TechTalk.SpecFlow.Table table2 = new TechTalk.SpecFlow.Table(new string[] {
                        "TagName"});
            table2.AddRow(new string[] {
                        "ODM"});
            table2.AddRow(new string[] {
                        "Study"});
            table2.AddRow(new string[] {
                        "GlobalVariables"});
            table2.AddRow(new string[] {
                        "StudyName"});
            table2.AddRow(new string[] {
                        "StudyDescription"});
            table2.AddRow(new string[] {
                        "ProtocolName"});
            table2.AddRow(new string[] {
                        "ClinicalData"});
            table2.AddRow(new string[] {
                        "SubjectData"});
            table2.AddRow(new string[] {
                        "AuditRecord"});
            table2.AddRow(new string[] {
                        "UserRef"});
            table2.AddRow(new string[] {
                        "LocationRef"});
            table2.AddRow(new string[] {
                        "DateTimeStamp"});
            table2.AddRow(new string[] {
                        "ReasonForChange"});
            table2.AddRow(new string[] {
                        "SourceID"});
            table2.AddRow(new string[] {
                        "SiteRef"});
            table2.AddRow(new string[] {
                        "Annotation"});
            table2.AddRow(new string[] {
                        "Comment"});
            table2.AddRow(new string[] {
                        "StudyEventData"});
            table2.AddRow(new string[] {
                        "FormData"});
            table2.AddRow(new string[] {
                        "ItemGroupData"});
            table2.AddRow(new string[] {
                        "ItemData"});
            table2.AddRow(new string[] {
                        "MeasurementUnitRef"});
            table2.AddRow(new string[] {
                        "ItemData"});
            table2.AddRow(new string[] {
                        "MeasurementUnitRef"});
            table2.AddRow(new string[] {
                        "ItemData"});
            table2.AddRow(new string[] {
                        "MeasurementUnitRef"});
            table2.AddRow(new string[] {
                        "StudyEventData"});
            table2.AddRow(new string[] {
                        "FormData"});
            table2.AddRow(new string[] {
                        "FormData"});
            table2.AddRow(new string[] {
                        "FormData"});
            table2.AddRow(new string[] {
                        "FormData"});
#line 43
 testRunner.Then("I verify tags structure in the XML file as displayed in the table.", ((string)(null)), table2, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("03_Verify tags in test XML from standard input file")]
        public virtual void _03_VerifyTagsInTestXMLFromStandardInputFile()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("03_Verify tags in test XML from standard input file", null, ((string[])(null)));
#line 77
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 79
 testRunner.Given("I have the XML file \"SampleAddPatientODM.xml\" available in the project folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 80
 testRunner.And("I have the XML file \"SampleAddPatientODM.xml\" available in the Test XML Files fol" +
                    "der.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 81
 testRunner.Then("I compare and verify the tags in source XML file from project and target xml file" +
                    " from test folder are same.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("04_Verification of fields in a tag in a test xml file")]
        public virtual void _04_VerificationOfFieldsInATagInATestXmlFile()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("04_Verification of fields in a tag in a test xml file", null, ((string[])(null)));
#line 83
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 84
 testRunner.Given("I have opened the XML file \"SampleAddPatientODM.xml\" located in test folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
            TechTalk.SpecFlow.Table table3 = new TechTalk.SpecFlow.Table(new string[] {
                        "FieldName"});
            table3.AddRow(new string[] {
                        "Description"});
            table3.AddRow(new string[] {
                        "FileType"});
            table3.AddRow(new string[] {
                        "ODMVersion"});
            table3.AddRow(new string[] {
                        "ID"});
#line 85
 testRunner.Then("I verify below fields are displayed for \"ODM\" tag in the XML file.", ((string)(null)), table3, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table4 = new TechTalk.SpecFlow.Table(new string[] {
                        "FieldName"});
            table4.AddRow(new string[] {
                        "StudyEventOID"});
#line 91
 testRunner.And("I verify below fields are displayed for \"StudyEventData\" tag in the XML file.", ((string)(null)), table4, "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("05_Verification of fields in all tags of specific name in a test XML file")]
        public virtual void _05_VerificationOfFieldsInAllTagsOfSpecificNameInATestXMLFile()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("05_Verification of fields in all tags of specific name in a test XML file", null, ((string[])(null)));
#line 95
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 96
 testRunner.Given("I have opened the XML file \"SampleAddPatientODM.xml\" located in test folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
            TechTalk.SpecFlow.Table table5 = new TechTalk.SpecFlow.Table(new string[] {
                        "FieldName"});
            table5.AddRow(new string[] {
                        "Description"});
            table5.AddRow(new string[] {
                        "FileType"});
            table5.AddRow(new string[] {
                        "ODMVersion"});
            table5.AddRow(new string[] {
                        "ID"});
#line 97
 testRunner.Then("I verify below fields are displayed for all \"ODM\" tag in the XML file.", ((string)(null)), table5, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table6 = new TechTalk.SpecFlow.Table(new string[] {
                        "FieldName"});
            table6.AddRow(new string[] {
                        "FormOID"});
            table6.AddRow(new string[] {
                        "FormRepeatKey"});
            table6.AddRow(new string[] {
                        "TransactionType"});
#line 103
 testRunner.And("I verify below fields are displayed for all \"FormData\" tag in the XML file.", ((string)(null)), table6, "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("06_Verification of data in fields of a tag in XML file.")]
        public virtual void _06_VerificationOfDataInFieldsOfATagInXMLFile_()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("06_Verification of data in fields of a tag in XML file.", null, ((string[])(null)));
#line 109
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 110
 testRunner.Given("I have opened the XML file \"SampleAddPatientODM.xml\" located in test folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line hidden
            TechTalk.SpecFlow.Table table7 = new TechTalk.SpecFlow.Table(new string[] {
                        "FieldName",
                        "DataValue"});
            table7.AddRow(new string[] {
                        "Description",
                        "Description1"});
            table7.AddRow(new string[] {
                        "FileOID",
                        "FileOID1"});
#line 111
 testRunner.Then("I verify below data in the respective fields for \"ODM\" tag in the XML file.", ((string)(null)), table7, "Then ");
#line hidden
            TechTalk.SpecFlow.Table table8 = new TechTalk.SpecFlow.Table(new string[] {
                        "FieldName",
                        "DataValue"});
            table8.AddRow(new string[] {
                        "StudyEventOID",
                        "Week_1"});
            table8.AddRow(new string[] {
                        "StudyEventRepeatKey",
                        "StudyEventRepeatKey2"});
            table8.AddRow(new string[] {
                        "TransactionType",
                        "Insert"});
#line 115
 testRunner.And("I verify below data in the respective fields for \"StudyEventData\" tag in the XML " +
                    "file.", ((string)(null)), table8, "And ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("07_Comparing data in two XML files")]
        public virtual void _07_ComparingDataInTwoXMLFiles()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("07_Comparing data in two XML files", null, ((string[])(null)));
#line 121
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line 122
 testRunner.Given("I have the XML file \"SampleAddPatientODM.xml\" available in the project folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 123
 testRunner.And("I have the XML file \"SampleAddPatientODMTestFile.xml\" available in the Test XML F" +
                    "iles folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line 124
 testRunner.Then("I verify that the data in both XML files is same.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Then ");
#line hidden
            this.ScenarioCleanup();
        }
        
        [NUnit.Framework.TestAttribute()]
        [NUnit.Framework.DescriptionAttribute("08_Comparing data in two XML files except few tags and fields")]
        public virtual void _08_ComparingDataInTwoXMLFilesExceptFewTagsAndFields()
        {
            TechTalk.SpecFlow.ScenarioInfo scenarioInfo = new TechTalk.SpecFlow.ScenarioInfo("08_Comparing data in two XML files except few tags and fields", null, ((string[])(null)));
#line 126
this.ScenarioInitialize(scenarioInfo);
            this.ScenarioStart();
#line hidden
            TechTalk.SpecFlow.Table table9 = new TechTalk.SpecFlow.Table(new string[] {
                        "StudyNameData",
                        "ProtocolVersionData",
                        "ResponseFile"});
            table9.AddRow(new string[] {
                        "Test3210_Pscript",
                        "1.0",
                        "testMetaData2.xml"});
#line 127
 testRunner.When("I save the Study meta data exported from GetStudyMetaDataODM132 method under Pati" +
                    "entAndOperationalDataEventing webservice", ((string)(null)), table9, "When ");
#line 130
 testRunner.Given("I have the XML file \"testMetaDataExpected.xml\" available in the project folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "Given ");
#line 131
 testRunner.And("I have the XML file \"testMetaData2.xml\" available in the Test XML Files folder.", ((string)(null)), ((TechTalk.SpecFlow.Table)(null)), "And ");
#line hidden
            TechTalk.SpecFlow.Table table10 = new TechTalk.SpecFlow.Table(new string[] {
                        "FieldName"});
            table10.AddRow(new string[] {
                        "FileOID"});
            table10.AddRow(new string[] {
                        "CreationDateTime"});
            table10.AddRow(new string[] {
                        "DerivedRunOrder"});
            table10.AddRow(new string[] {
                        "OrderNumber"});
            table10.AddRow(new string[] {
                        "QueryKey"});
#line 132
 testRunner.Then("I verify that the data in both metadata XML files is same except for below tags a" +
                    "nd fields.", ((string)(null)), table10, "Then ");
#line hidden
            this.ScenarioCleanup();
        }
    }
}
#pragma warning restore
#endregion

