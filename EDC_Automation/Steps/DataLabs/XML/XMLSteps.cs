using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;
using XMLUtilities;
using DBUtilities;
using Common;
using System.Data;

namespace EDC_Automation.Steps.DataLabs.XML
{
    [Binding]
    public class XMLSteps
    {
        [Given(@"I have the XML file opened and find data\.")]
        public void GivenIHaveTheXMLFileOpenedAndFindData_()
        {
            XMLActionUtilities.VerifyDataInXML("", "");
        }

        [When(@"I have the XML file ""(.*)"" available in the project folder\.")]
        [Given(@"I have the XML file ""(.*)"" available\.")]
        [Given(@"I have the XML file ""(.*)"" available in the project folder\.")]
        public void GivenIHaveTheXMLFileAvailable_(string FileName)
        {
            if(!XMLActionUtilities.VerifyXMLFileInProjectDirectory(FileName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "The XML file '" + FileName + "' is not available in the project. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            else
            {
                ScenarioContext.Current.Add("XMLFileNameInProject", FileName);
            }
        }

        [When(@"I have the XML file ""(.*)"" available in the Test XML Files folder\.")]
        [Then(@"I have the XML file ""(.*)"" available in the Test XML Files folder\.")]
        [Given(@"I have the XML file ""(.*)"" available in the Result XML Files folder\.")]
        [Given(@"I have the XML file ""(.*)"" available in the Test XML Files folder\.")]
        public void GivenIHaveTheXMLFileAvailableInTheTestXMLFilesFolder_(string FileName)
        {
            if(!File.Exists(@"C:\TestXMLFiles\" + FileName) && !File.Exists(FeatureContext.Current["ReportsFolderPath"].ToString() + "/" + FileName))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "The XML file '" + FileName + "' is not available in the file location. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            else
            {
                ScenarioContext.Current.Add("XMLFileNameInTestFolder", FileName);
            }
        }


        [Then(@"I verify tags structure in ""(.*)"" file as displayed in the table\.")]
        public void ThenIVerifyTagsStructureInFileAsDisplayedInTheTable_(string FileName, Table table)
        {
            IEnumerable<XMLData> Data = table.CreateSet<XMLData>();
            List<XMLData> List = (List<XMLData>)Data;
            if (!XMLActionUtilities.VerifyTagsInXMLFile(FileName, List))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify tags in the XML file. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify tags structure in the XML file as displayed in the table\.")]
        public void ThenIVerifyTagsStructureInTheXMLFileAsDisplayedInTheTable_(Table table)
        {
            IEnumerable<XMLData> Data = table.CreateSet<XMLData>();
            List<XMLData> List = (List<XMLData>)Data;
            XmlDocument xDoc = (XmlDocument)ScenarioContext.Current["LoadedXML"];
            if(!XMLActionUtilities.VerifyTagsInXMLFile(xDoc, List))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify tags in the XML file. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I have opened the XML file ""(.*)"" from Test XML files in project\.")]
        public void GivenIHaveOpenedTheXMLFileFromTestXMLFiles_(string XMLFileName)
        {
            XmlDocument doc = XMLActionUtilities.LoadAndGetXMLDocFromProject(XMLFileName);
            if(doc != null)
            {
                ScenarioContext.Current.Add("LoadedXML", doc);
            }
            else
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "The XML file '" + XMLFileName + "' is not available in the project. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I have opened the XML file ""(.*)"" located in test folder\.")]
        public void GivenIHaveOpenedTheXMLFileLocatedInTestFolder_(string XMLFileName)
        {
            XmlDocument doc = XMLActionUtilities.LoadAndGetXMLDocFromFileLocation(XMLFileName);
            if (doc != null)
            {
                ScenarioContext.Current.Add("LoadedXML", doc);
            }
            else
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "The XML file '" + XMLFileName + "' is not available in the 'TestXMLFiles' folder. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I compare and verify the tags in source XML file from project and target xml file from test folder are same\.")]
        public void ThenICompareAndVerifyTheTagsInSourceXMLFileFromProjectAndTargetXmlFileFromTestFolderAreSame_()
        {
            string File1 = ScenarioContext.Current["XMLFileNameInProject"].ToString();
            string File2 = ScenarioContext.Current["XMLFileNameInTestFolder"].ToString();
            if (!XMLActionUtilities.VerifyTagsInXMLFile(File1, File2))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify tags in the XML file. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify below fields are displayed for ""(.*)"" tag in the XML file\.")]
        public void ThenIVerifyBelowFieldsAreDisplayedForTagInTheXMLFile_(string TagName, Table table)
        {
            XmlDocument xDoc = (XmlDocument)ScenarioContext.Current["LoadedXML"];
            IEnumerable<XMLData> Data = table.CreateSet<XMLData>();
            List<XMLData> List = (List<XMLData>)Data;
            if(!XMLActionUtilities.VerifyFieldsInXMLTag(xDoc, TagName, List))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify fields in the " + TagName + "' tag in the XML file. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify below fields are displayed for all ""(.*)"" tag in the XML file\.")]
        public void ThenIVerifyBelowFieldsAreDisplayedForAllTagInTheXMLFile_(string TagName, Table table)
        {
            XmlDocument xDoc = (XmlDocument)ScenarioContext.Current["LoadedXML"];
            IEnumerable<XMLData> Data = table.CreateSet<XMLData>();
            List<XMLData> List = (List<XMLData>)Data;
            if (!XMLActionUtilities.VerifyFieldsInAllMatchingXMLTag(xDoc, TagName, List))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify fields in the " + TagName + "' tag in the XML file. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I verify below data in the respective fields for ""(.*)"" tag in the XML file\.")]
        public void ThenIVerifyBelowDataInTheRespectiveFieldsForTagInTheXMLFile_(string TagName, Table table)
        {
            XmlDocument xDoc = (XmlDocument)ScenarioContext.Current["LoadedXML"];
            IEnumerable<XMLData> Data = table.CreateSet<XMLData>();
            List<XMLData> List = (List<XMLData>)Data;
            if (!XMLActionUtilities.VerifyFieldDataInXMLTag(xDoc, TagName, List))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify fields in the " + TagName + "' tag in the XML file. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify that the data in both XML files is same\.")]
        public void ThenIVerifyThatTheDataInBothXMLFilesIsSame_()
        {
            List<string> Tags = new List<string>();
            List<string> Fields = new List<string>();
            string Msg;
            string File1 = ScenarioContext.Current["XMLFileNameInProject"].ToString();
            string File2 = ScenarioContext.Current["XMLFileNameInTestFolder"].ToString();
            if (!XMLActionUtilities.CompareDataIn2XMLFiles(File1, File2, Tags, Fields, out Msg))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify data in the actual and expected XML files. \n" + Msg + "\n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify that the data in both XML files is same except for below tags and fields\.")]
        public void ThenIVerifyThatTheDataInBothXMLFilesIsSameExceptForBelowTagsAndFields_(Table table)
        {
            List<string> Tags = table.Rows.Select(l => l["TagName"]).ToList();
            List<string> Fields = table.Rows.Select(l => l["FieldName"]).ToList();
            string Msg;
            Tags.Remove("");
            Fields.Remove("");            
            string File1 = ScenarioContext.Current["XMLFileNameInProject"].ToString();
            string File2Folder = FeatureContext.Current["ReportsFolderPath"].ToString();
            string File2Name = ScenarioContext.Current["XMLFileNameInTestFolder"].ToString();
            string File2 = File2Folder + "\\" + File2Name;
            if (!XMLActionUtilities.CompareDataIn2XMLFiles(File1, File2, Tags, Fields, out Msg))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify data in the actual and expected XML files. \n" + Msg + "\n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I verify the (.*) in (.*) is (.*) against DB by executing (.*)")]
        public void ThenIVerifyTheInIsAgainstDBByExecuting(string FieldName, string TagName, string DataValue, string Query)
        {
            SQLInfo Info = DataBase.DatabaseSteps.StoreSQLInfo();
            try
            {
                if (DatabaseUtilities.ConnectToDB(Info))
                {
                    Info.QueryResultTable = DatabaseUtilities.GetRecordsFromDB(Query, Info);
                    if (Info.QueryResultTable == null)
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to execute query " + Query + " on database. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    else
                    {
                        DataTable data = Info.QueryResultTable;
                        string FilePath = FeatureContext.Current["ReportsFolderPath"].ToString();
                        string content = data.Rows[0].ItemArray[0].ToString();
                        XmlDocument xDoc = (XmlDocument)ScenarioContext.Current["LoadedXML"];
                        if(!XMLActionUtilities.VerifyFieldDataInXMLTag(xDoc, TagName, FieldName, DataValue))
                        {
                            ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + FieldName + " value in " + TagName + " is displayed as " + content + " instead of " + DataValue + ". \n";
                            ScenarioContext.Current["ActResult"] = "Failed";
                        }
                    }
                    DatabaseUtilities.CloseDBConnection(Info);
                }
                else
                {
                    ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to connect to database. \n";
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }
            catch (Exception e)
            {
                string abc = Info.DataBaseName;
            }
        }
        [Then(@"I verify that the data in both XML files is same except for below fields\.")]
        [Then(@"I verify that the data in both metadata XML files is same except for below fields\.")]
        public void ThenIVerifyThatTheDataInBothMetadataXMLFilesIsSameExceptForBelowTagsAndFields_(Table table)
        {
            List<string> Fields = table.Rows.Select(l => l["FieldName"]).ToList();
            List<string> Tags = table.Rows.Select(l => l["TagName"]).ToList();
            Fields.Remove("");
            if(Tags!=null && Tags.Count != 0)
            {
                Tags.Remove("");
            }
            string File1 = ScenarioContext.Current["XMLFileNameInProject"].ToString();
            string File2Folder = FeatureContext.Current["ReportsFolderPath"].ToString();
            string File2Name = ScenarioContext.Current["XMLFileNameInTestFolder"].ToString();
            string File2 = File2Folder + "\\" + File2Name;
            if (!XMLActionUtilities.XMLfilesIdentical(File1,File2,Fields,Tags))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Failed to verify data in the actual and expected XML files.\n Expected and Actual doesnot match";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}
