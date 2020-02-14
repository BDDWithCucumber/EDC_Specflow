using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;
using System.Xml;
using BusinessProcesses.DataLabs.WebServices.Data;
using System.Text.RegularExpressions;
using Reports.DebugLog;
using System.Reflection;
using Newtonsoft.Json.Linq;
namespace APIUtilities
{
    public static class RequestResponseHandler
    {
        private static ResponseData ResponseData { get; set; }
        public static int HandleSyncRequest(string EndPoint, string RequestType, string RequestName, List<string> FieldsToReplace, List<string> FieldDataToReplace)
        {
            using (RequestGenerator reqGen = new RequestGenerator(EndPoint, RequestType, RequestName, FieldsToReplace, FieldDataToReplace))
            {
                int statusCode;
                try
                {
                    using (WebResponse Response = reqGen.BuildRequest().GetResponse())
                    {
                        HttpWebResponse resp1 = (HttpWebResponse)Response;
                        StreamReader ReadStream = new StreamReader(resp1.GetResponseStream());
                        string str = WebUtility.HtmlDecode(ReadStream.ReadToEnd());
                        statusCode = (int)resp1.StatusCode;
                        resp1.Dispose();
                        Response.Dispose();
                        return statusCode;
                    }
                }
                catch (Exception e)
                {
                    new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                    return 0;
                }
            }
        }
        public static int HandleGETRequest(string EndPoint, string RequestType, string RequestName, List<string> FieldsToReplace, List<string> FieldDataToReplace, string FilePathtoSave)
        {
            using (RequestGenerator reqGen = new RequestGenerator(EndPoint, RequestType, RequestName, FieldsToReplace, FieldDataToReplace))
            {
                try
                {
                    using (WebResponse Response = reqGen.BuildGETRequest().GetResponse())
                    {
                        HttpWebResponse resp1 = (HttpWebResponse)Response;
                        string Result = string.Empty;
                        string replaceText = "<?xml version=\"1.0\" encoding=\"utf-16\"?>";
                        StreamReader ReadStream = new StreamReader(resp1.GetResponseStream());
                        string str = WebUtility.HtmlDecode(ReadStream.ReadToEnd());
                        str = str.Replace(replaceText, "");
                        File.WriteAllText(FilePathtoSave, str);
                        ReadStream.Close();
                        return (int)resp1.StatusCode;
                    }
                }
                catch (Exception e)
                {
                    new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                    return 0;
                }

            }
        }
        public static int HandleGetRESTRequest(string EndPoint, string RequestType, string RequestName)
        {
            try
            {
                using (RequestGenerator reqGen = new RequestGenerator(EndPoint, RequestType, RequestName))
                {
                    using (WebResponse Response = reqGen.BuildGetRestRequest().GetResponse())
                    {
                        HttpWebResponse resp1 = (HttpWebResponse)Response;
                        var response = resp1.Headers;
                        //JObject joResponse = JObject.Parse("");
                        StreamReader ReadStream = new StreamReader(resp1.GetResponseStream());
                        string str = WebUtility.HtmlDecode(ReadStream.ReadToEnd());
                        JObject joResponse = JObject.Parse(str);

                        JArray array = (JArray)joResponse[0];
                        return (int)resp1.StatusCode;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return 0;
            }
        }
        private static ResponseData TransformGcsResponseToResponseData(WebResponse xmlResponse, ResponseData responseData)
        {
            using (StreamReader rd = new StreamReader(xmlResponse.GetResponseStream()))
            {
                string soapResult = responseData.Response;
                soapResult = soapResult.Replace("&lt;", "<");
                soapResult = soapResult.Replace("&gt;", ">");
                //if (Regex.Matches(soapResult, "<tns:Transaction ").Count == requestCount)
                //{
                XmlDocument xdoc = new XmlDocument();
                /* if (soapResult.Length > soapResult.IndexOf("<tns:GCSResponse", StringComparison.Ordinal))
                 {
                     xdoc.LoadXml(soapResult.Substring(soapResult.IndexOf("<tns:GCSResponse", StringComparison.Ordinal), soapResult.Substring(soapResult.IndexOf("<tns:GCSResponse", StringComparison.Ordinal)).Length + soapResult.IndexOf("</tns:Message>", StringComparison.Ordinal) - soapResult.Length));
                 }
                 */
                xdoc.LoadXml(soapResult);
                responseData.StatuscodesWithResponses = new List<SyncResponseData>();
                foreach (XmlNode trnode in xdoc.ChildNodes[0].ChildNodes[1].ChildNodes)
                {
                    responseData.StatuscodesWithResponses.Add(new SyncResponseData()
                    {
                        Statuscode = trnode.ChildNodes[0].ChildNodes[0].InnerText,
                        ResponseMessage = trnode.ChildNodes[0].ChildNodes[4].InnerText
                    });
                    //responseData.RecCount++;
                }
                return responseData;
                //}
            }
            //return null;
        }
        public static string GetODMText(string ODMfileName)
        {
            string XmlBody;
            using (StreamReader reader = GetODMData(ODMfileName))
            {

                XmlBody = WebUtility.HtmlDecode(reader.ReadToEnd());
            }
            return XmlBody;
        }
        public static StreamReader GetODMData(string ODMfileName)
        {
            string fileloc;
            try
            {
                fileloc = Path.GetDirectoryName(Path.GetDirectoryName(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase)));
                fileloc = fileloc.Replace("file:\\", "");
                string filepath3 = fileloc.Replace("EDC_Automation", "BusinessProcesses\\DataLabs\\Study Files\\WebServices\\ODMFiles");
                filepath3 = filepath3 + "\\" + ODMfileName;
                return new StreamReader(filepath3, Encoding.GetEncoding("iso-8859-1"));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }
        
    }
}
