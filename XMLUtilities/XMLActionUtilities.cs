using System;
using System.Xml;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Framework.Actions;
using System.Xml.Linq;
using Microsoft.XmlDiffPatch;
using System.Reflection;
using Pages.Designer.Data;
using Reports.DebugLog;

namespace XMLUtilities
{
    public class XMLActionUtilities
    {
        public static string TestXMLFilesFolderPath()
        {
            return @"C:\TestXMLFiles\";
        }

        public static void VerifyDataInXML(string XPath, string ValueToVerify)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load("C:\\Surya\\Work\\ODM - Premier\\XML Files\\Patient_Added 132.xml");
            //XmlNodeList l = xmlDoc.ChildNodes;
            //xmlDoc.Load("C:\\Surya\\Work\\ODM - Premier\\XML Files\\SampleXML.xml");
            //xmlDoc.Load("C:\\Surya\\Work\\ODM - Premier\\XML Files\\QuickExport.xml");
            XmlNodeList nodes = xmlDoc.DocumentElement.SelectNodes("//*");
            //XmlNodeList nodes2 = xmlDoc.SelectNodes("ODM");
            string xE = nodes[1].OuterXml;
            xmlDoc.LoadXml(xE);
            XmlNodeList nodes2 = xmlDoc.SelectNodes("//*");
        }

        public static bool VerifyXMLFileInProjectDirectory(string FileName)
        {
            bool FileExist = false;
            try
            {
                string BasePath = Path.GetDirectoryName(Path.GetDirectoryName(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase)));
                BasePath = BasePath.Replace("file:\\", "");
                BasePath = BasePath + @"\TestXMLFiles\";
                if(File.Exists(BasePath + FileName))
                {
                    FileExist = true;
                }
            }
            catch (Exception e)
            {
                return false;
            }
            return FileExist;
        }

        public static bool VerifyTagsInXMLFile(string FileName, List<XMLData> TagsTable)
        {
            try
            {
                XmlDocument xmlDoc = new XmlDocument();
                string FilePath = GetXMLFilePath(FileName);
                xmlDoc.Load(FilePath);
                XmlNodeList nodes = xmlDoc.SelectNodes("//*");
                if(nodes.Count != TagsTable.Count)
                {
                    Control_ActionUtilities.LogException("Verification of tags in XML file.", "Tags count in test input is not matching with tags in XML file.", string.Empty);
                    return false;
                }
                int counter = 0;
                foreach (XmlNode node in nodes)
                {
                    if(node.Name.Trim() != TagsTable[counter].TagName.Trim())
                    {
                        Control_ActionUtilities.LogException("Verification of tags in XML file.", "Tags in test input is not matching with tags in XML file.", string.Empty);
                        return false;
                    }
                    counter++;
                }
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static string GetXMLFilePath(string FileName)
        {
            try
            {
                string XMLFolderPath = Path.GetDirectoryName(Path.GetDirectoryName(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase)));
                XMLFolderPath = XMLFolderPath.Replace("file:\\", "");
                XMLFolderPath = XMLFolderPath + @"\TestXMLFiles\" + FileName;
                return XMLFolderPath;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }

        public static bool VerifyTagsInXMLFile(XmlDocument xmlDoc, List<XMLData> TagsTable)
        {
            try
            {
                if(xmlDoc != null)
                {
                    XmlNodeList nodes = xmlDoc.SelectNodes("//*");
                    if (nodes.Count != TagsTable.Count)
                    {
                        Control_ActionUtilities.LogException("Verification of tags in XML file.", "Tags count in test input is not matching with tags in XML file.", string.Empty);
                        return false;
                    }
                    int counter = 0;
                    foreach (XmlNode node in nodes)
                    {
                        if (node.Name.Trim() != TagsTable[counter].TagName.Trim())
                        {
                            Control_ActionUtilities.LogException("Verification of tags in XML file.", "Tags in test input is not matching with tags in XML file.", string.Empty);
                            return false;
                        }
                        counter++;
                    }
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception e)
            {
                return false;
            }
        }

        public static bool VerifyTagsInXMLFile(string xmlFileNameFromProject, string xmlFileNameFromTestFolder)
        {
            try
            {
                XmlDocument xmlDocFromProject = LoadAndGetXMLDocFromProject(xmlFileNameFromProject);
                XmlDocument xmlDocFromTestFolder = LoadAndGetXMLDocFromProject(xmlFileNameFromTestFolder);
                if (xmlDocFromProject != null && xmlDocFromTestFolder != null)
                {
                    XmlNodeList nodes1 = xmlDocFromProject.SelectNodes("//*");
                    XmlNodeList nodes2 = xmlDocFromTestFolder.SelectNodes("//*");
                    if(nodes1.Count != nodes2.Count)
                    {
                        Control_ActionUtilities.LogException("Verification of tags in XML file.", "Tags count in XML file in project and XML file in test location are not matching.", string.Empty);
                        return false;
                    }
                    int counter = 0;
                    foreach (XmlNode node in nodes1)
                    {
                        if(node.Name.Trim() != nodes2[counter].Name.Trim())
                        {
                            Control_ActionUtilities.LogException("Verification of tags in XML file.", "Tags in XML file in project and XML file in test location are not matching.", string.Empty);
                            return false;
                        }
                        counter++;
                    }
                    return true;
                }
                else
                {
                    return false;
                }                
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
        

        public static XmlDocument LoadAndGetXMLDocFromProject(string FileName)
        {
            try
            {
                XmlDocument xmlDoc = new XmlDocument();
                string FilePath = GetXMLFilePath(FileName);
                xmlDoc.Load(FilePath);
                return xmlDoc;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }

        public static XmlDocument LoadAndGetXMLDocFromFileLocation(string FileName)
        {
            try
            {
                XmlDocument xmlDoc = new XmlDocument();
                if (!FileName.Contains(@"\"))
                {
                    string FilePath = TestXMLFilesFolderPath() + FileName;
                    xmlDoc.Load(FilePath);
                }
                else
                {
                    xmlDoc.Load(FileName);
                }                
                return xmlDoc;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }

        public static bool VerifyFieldsInXMLTag(XmlDocument XMLDoc, string TagName, List<XMLData> FieldNames)
        {
            try
            {
                XmlNodeList nodes = XMLDoc.GetElementsByTagName(TagName.Trim());
                foreach(XmlNode node in nodes)
                {
                    int counter = 0;
                    foreach(XMLData fName in FieldNames)
                    {
                        if(node.Attributes[fName.FieldName] != null)
                        {
                            counter++;
                        }
                        if(FieldNames.Count == counter)
                        {
                            return true;
                        }
                    }
                }
                return false;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyFieldsInAllMatchingXMLTag(XmlDocument XMLDoc, string TagName, List<XMLData> FieldNames)
        {
            try
            {
                XmlNodeList nodes = XMLDoc.GetElementsByTagName(TagName.Trim());
                int TagCounter = 0;
                foreach (XmlNode node in nodes)
                {
                    int counter = 0;
                    foreach (XMLData fName in FieldNames)
                    {
                        if (node.Attributes[fName.FieldName] != null)
                        { counter++; }
                        if (FieldNames.Count == counter)
                        { TagCounter++; }
                    }
                }
                if(TagCounter == nodes.Count)
                { return true; }
                else
                { return false; }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyFieldDataInXMLTag(XmlDocument XMLDoc, string TagName, List<XMLData> FieldData)
        {
            try
            {
                XmlNodeList nodes = XMLDoc.GetElementsByTagName(TagName.Trim());
                foreach(XmlNode node in nodes)
                {
                    int counter = 0;
                    foreach(XMLData field in FieldData)
                    {
                        XmlAttribute xAtt = node.Attributes[field.FieldName];
                        if(xAtt != null && xAtt.Value == field.DataValue)
                        { counter++; }
                        if(FieldData.Count == counter)
                        { return true; }
                    }
                }
                return false;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyFieldDataInXMLTag(XmlDocument XMLDoc, string TagName, string FieldName, string DataValue)
        {
            try
            {
                XmlNodeList nodes = XMLDoc.GetElementsByTagName(TagName.Trim());
                foreach (XmlNode node in nodes)
                {
                        XmlAttribute xAtt = node.Attributes[FieldName];
                        if (xAtt != null && xAtt.Value == DataValue)
                        { return true; }
                }
                return false;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool CompareASpecificTagDataIn2XMLFiles(string xmlFileNameFromProject, string xmlFileNameFromTestFolder, string TagName)
        {
            try
            {
                XmlDocument xmlDocFromProject = LoadAndGetXMLDocFromProject(xmlFileNameFromProject);
                XmlDocument xmlDocFromTestFolder = LoadAndGetXMLDocFromFileLocation(xmlFileNameFromTestFolder);
                if (xmlDocFromProject != null && xmlDocFromTestFolder != null)
                {
                    XmlNodeList nodes1 = xmlDocFromProject.GetElementsByTagName(TagName.Trim());
                    XmlNodeList nodes2 = xmlDocFromTestFolder.GetElementsByTagName(TagName.Trim());
                    if(!CompareNodesCountInExpectedAndActualXMLs(nodes1, nodes2, TagName))
                    { return false; }
                    //int counter = 0;
                    for(int counter = 0; counter <= nodes1.Count; counter++)
                    //foreach(XmlNode node in nodes1)
                    {
                        if(!VerifyAttributesInExpectedAndActualXMLNodes(nodes1[counter], nodes2[counter], TagName))
                        { return false; }
                        counter++;
                    }
                }
                    return true;
            }
            catch(Exception e)
            {
                return false;
            }
        }

        public static bool CompareDataIn2XMLFiles(string xmlFileNameFromProject, string xmlFileNameFromTestFolder, List<string> TagsToExclude, List<string> FieldsToExclude, out string FailMsg)
        {
            FailMsg = "";
            try
            {
                string ActTagName, ExpTagName;
                XmlDocument xmlDocFromProject = LoadAndGetXMLDocFromProject(xmlFileNameFromProject);
                XmlDocument xmlDocFromTestFolder = LoadAndGetXMLDocFromFileLocation(xmlFileNameFromTestFolder);
                if(xmlDocFromProject != null && xmlDocFromTestFolder != null)
                {
                    XmlNodeList nodes1 = xmlDocFromProject.SelectNodes("//*");
                    XmlNodeList nodes2 = xmlDocFromTestFolder.SelectNodes("//*");
                    if (nodes1.Count != nodes2.Count)
                    {
                        Control_ActionUtilities.LogException("Verification of data in XML files", "Number of tags in actual and expected XML files is not matching.", string.Empty);
                        FailMsg = "Number of tags in actual and expected XML files is not matching.";
                        return false;
                    }
                    for(int counter = 0; counter < nodes1.Count; counter++)
                    {
                        ActTagName = nodes1[counter].Name;
                        ExpTagName = nodes2[counter].Name;
                        if(!TagsToExclude.Contains(ActTagName) && (ActTagName == ExpTagName))
                        {
                            if (!VerifyAttributesInExpectedAndActualXMLNodes(nodes1[counter], nodes2[counter], FieldsToExclude))
                            {
                                FailMsg = "Fields in tag " + ActTagName + " are not matching.";
                                return false;
                            }
                        }
                    }                    
                    return true;
                }
                else
                {
                    Control_ActionUtilities.LogException("Verification of data in XML files", "XML file is not loaded properly.", string.Empty);
                    FailMsg = "XML file is not loaded properly..";
                    return false;
                }
            }
            catch(Exception e)
            {                
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            
        }

        public static bool VerifyAttributesInExpectedAndActualXMLNodes(XmlNode ExpNode, XmlNode ActNode, List<string> AttributesToExlude)
        {
            try
            {
                XmlAttributeCollection ExpAttCol = ExpNode.Attributes;
                XmlAttributeCollection ActAttCol = ActNode.Attributes;
                string TagName = ExpNode.Name;
                if (ExpAttCol.Count != ActAttCol.Count)
                {
                    Control_ActionUtilities.LogException("Verification of attributes in xml tag", "Number of attributes/fields for " + TagName + " in expected and actual xml data files is not matching.", string.Empty);
                    return false;
                }
                foreach (XmlAttribute expAtt in ExpAttCol)
                {
                    string ExpAttName = expAtt.Name;
                    if(!AttributesToExlude.Contains(ExpAttName))
                    {
                        XmlAttribute ActAtt = ActNode.Attributes[ExpAttName];
                        if (ActAtt != null)
                        {
                            if (ActAtt.Value != expAtt.Value)
                            { return false; }
                        }
                        else
                        { return false; }
                    }                  
                }
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool VerifyAttributesInExpectedAndActualXMLNodes(XmlNode ExpNode, XmlNode ActNode, string TagName)
        {
            try
            {
                XmlAttributeCollection ExpAttCol = ExpNode.Attributes;
                XmlAttributeCollection ActAttCol = ActNode.Attributes;
                if(ExpAttCol.Count != ActAttCol.Count)
                {
                    Control_ActionUtilities.LogException("Verification of attributes in xml tag", "Number of attributes/fields for " + TagName + " in expected and actual xml data files is not matching.", string.Empty);
                    return false;
                }
                foreach(XmlAttribute expAtt in ExpAttCol)
                {
                    string ExpAttName = expAtt.Name;
                    XmlAttribute ActAtt = ActNode.Attributes[ExpAttName];
                    if(ActAtt != null)
                    {
                        if(ActAtt.Value != expAtt.Value)
                        { return false; }
                    }
                    else
                    { return false; }
                } 
                return true;
            }
            catch(Exception e)
            {
                return false;
            }
        }

        public static bool CompareNodesCountInExpectedAndActualXMLs(XmlNodeList ExpNodesList, XmlNodeList ActNodeList, string TagName)
        {
            if(ExpNodesList.Count == 0)
            {
                Control_ActionUtilities.LogException("Verification of data in actual and expected xml files.", "The tag " + TagName + " is not displayed in expected XML data file.", string.Empty);
                return false;
            }
            if (ActNodeList.Count == 0)
            {
                Control_ActionUtilities.LogException("Verification of data in actual and expected xml files.", "The tag " + TagName + " is not displayed in actual XML data file.", string.Empty);
                return false;
            }
            if(ExpNodesList.Count != ActNodeList.Count)
            {
                Control_ActionUtilities.LogException("Verification of data in actual and expected xml files.", "The number of tags " + TagName + " is not matching in expected and actual XML data files.", string.Empty);
                return false;
            }
            return true;
        }
        public static bool XMLfilesIdentical(string sourceFile, string destFile, List<string> ExcludeAttributes, List<string> ExcludeTagsList=null)
        {
            try
            {
                var xmldiff = new XmlDiff();
                XmlDocument xml1 = LoadAndGetXMLDocFromProject(sourceFile);
                string strXml1 = xml1.GetElementsByTagName("ODM")[0].OuterXml;
                strXml1 = ExcludeAttributesFromXML(strXml1, ExcludeAttributes, ExcludeTagsList);
                if (string.IsNullOrEmpty(strXml1))
                {
                    return false;
                }
                XmlDocument xml2 = LoadAndGetXMLDocFromFileLocation(destFile);
                string strXml2 = xml2.GetElementsByTagName("ODM")[0].OuterXml;
                strXml2 = ExcludeAttributesFromXML(strXml2, ExcludeAttributes, ExcludeTagsList);
                if (string.IsNullOrEmpty(strXml2))
                {
                    return false;
                }
                var r1 = XElement.Parse(strXml1).CreateReader();
                var r2 = XElement.Parse(strXml2).CreateReader();
                var sw = new StringWriter();
                var xw = new XmlTextWriter(sw) { Formatting = Formatting.Indented };

                xmldiff.Options = XmlDiffOptions.IgnorePI |
                    XmlDiffOptions.IgnoreChildOrder |
                    XmlDiffOptions.IgnoreComments |
                    XmlDiffOptions.IgnoreWhitespace;

                bool areIdentical = xmldiff.Compare(r1, r2, xw);

                string differences = sw.ToString();

                return areIdentical;
            }
            catch(Exception e)
            {
                return false;
            }
        }
        public static string ExcludeAttributesFromXML(string strXml, List<string> ExcludeAttributeList,List<string> ExcludeTagsList=null)
        {
            XDocument xdoc = XDocument.Parse(strXml);
            try
            {
                foreach (var node in xdoc.Descendants())
                {
                    if (ExcludeTagsList != null && ExcludeTagsList.Contains(node.Name.LocalName.ToString()))
                    {
                        node.Value="";
                    }
                    else if(node.HasAttributes)
                    {
                        foreach (string attr in ExcludeAttributeList)
                        {
                            if (attr.Contains("dl"))
                            {
                                string attributeName = attr.Remove(0, 3);
                                    foreach (XAttribute ab in node.Attributes())
                                    {
                                        if (ab.Name.LocalName == attributeName)
                                        {
                                            ab.Remove();
                                        }
                                    }
                            }
                            else if (node.Attribute(attr) != null)
                            {
                                node.Attribute(attr).Remove();
                            }
                        }
                    }

                }
            }
            catch (Exception e)
            {
                return null;
            }
            return xdoc.ToString();
        }

        public static bool VerifyXMlContent(string sourceFile, string fieldName)
        {
            var xmldiff = new XmlDiff();
            XmlDocument xml1 = LoadAndGetXMLDocFromProject(sourceFile);
            string strXml1 = xml1.GetElementsByTagName("Export")[0].OuterXml;
            bool str = XMLContentVerification(strXml1, fieldName);
            if (!str.Equals(true))
            {
                return false;
            }
            return true;
        }

        public static bool VerifyXMlContent(string sourceFile, List<XMLNodeData> xmlData)
        {
            var xmldiff = new XmlDiff();
            XmlDocument xml1 = LoadAndGetXMLDocFromProject(sourceFile);
            string strXml1 = xml1.GetElementsByTagName("Export")[0].OuterXml;
            bool str= XMLContentVerification(strXml1, xmlData);
            if(!str.Equals(true))
            {
                return false;
            }
            return true;
        }

        public static bool XMLContentVerification(string strXml, List<XMLNodeData> xmlData)
        {
            XDocument xdoc = XDocument.Parse(strXml);
            int Counter = 0;
            bool ValueComparison = true;
            foreach (var node in xdoc.Descendants())
            {
                if (node.Name.LocalName == "TestMapping")
                {
                    foreach (XAttribute ab in node.Attributes())
                    {
                        foreach(XMLNodeData data in xmlData)
                        {
                            if (data.AttributeName.Equals(ab.Name.LocalName))
                            {
                                if(data.AttributeValue != null)
                                {
                                    ValueComparison = data.AttributeValue.Equals(ab.Value) && ValueComparison;
                                    ++Counter;
                                    break;
                                }
                                ++Counter;
                                break;
                            }
                        }
                    }
                    if (Counter == xmlData.Count && ValueComparison)
                    {
                        return true;
                    }
                }                
            }
            return false;
        }

        public static bool XMLContentVerification(string strXml, string fieldName)
        {
            XDocument xdoc = XDocument.Parse(strXml);
            foreach (var node in xdoc.Descendants())
            {
                foreach (XAttribute ab in node.Attributes())
                {
                    if (ab.Value == fieldName)
                    {
                        return false;
                    }
                }
            }
            return true;
        }
    }
}
