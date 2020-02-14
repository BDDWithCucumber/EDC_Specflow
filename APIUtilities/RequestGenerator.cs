using BusinessProcesses.DataLabs.WebServices.Data;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Http;
using Reports.DebugLog;
using System.Reflection;
using System.Threading;

namespace APIUtilities
{
    public class RequestGenerator: IDisposable
    {
        private string HttpMethod { get; }
        private string EndPoint { get; }
        private string RequestName { get; }
        private List<string> ReplaceFieldName { get; }
        private List<string> ReplacementData { get; }
        private string ODMfileName { get; }
        public RequestGenerator(string EndPointData, string HttpMethodName, string ReqXMLFileName, List<string> FieldNames , List<string> FieldValues)
        {
            HttpMethod = HttpMethodName;
            RequestName = ReqXMLFileName;
            EndPoint = EndPointData;
            ReplaceFieldName = FieldNames;
            ReplacementData = FieldValues;
        }
        public RequestGenerator(string EndPointData, string HttpMethodName, string ReqXMLFileName)
        {
            HttpMethod = HttpMethodName;
            RequestName = ReqXMLFileName;
            EndPoint = EndPointData;
        }
        public HttpWebRequest BuildRequest()
        {
            try
            {
                string EndPointURL = WebServiceRequestData.GetServiceURI(RequestName);
                EndPointURL = EndPointURL.Replace("{ENDPOINT}", EndPoint);
                HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(EndPointURL);
                WebReq.Headers.Add(WebServiceRequestData.GetSOAPAction(RequestName));
                WebReq.ContentType = "text/xml;charset=utf-8";
                WebReq.Accept = "text/xml";
                //WebReq.ContinueTimeout = 120000;
                //WebReq.ContentLength = "Length";
                WebReq.Method = HttpMethod;
                WebReq.Timeout = Timeout.Infinite;
                WebReq.KeepAlive = true;
                //WebClient client = new WebClient();
                //client.Credentials = new NetworkCredential("bandars1", "Datalabs123", "EDCDEV");
                WebReq.Credentials = new NetworkCredential("testadmin", "Datalabs1234", "EDCDEV");
                //ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                //WebReq.Credentials = CredentialCache.DefaultNetworkCredentials;
                using (StreamWriter writer = new StreamWriter(WebReq.GetRequestStream()))
                {
                    string body = GetRequestWithData();
                    writer.WriteLine(body);
                }
                return WebReq;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }
        public HttpWebRequest BuildGetRestRequest()
        {
            try
            {
                string accessToken = GetRestAccessToken(EndPoint,RequestName);
                string EndPointURL = WebServiceRequestData.GetRESTServiceURI(RequestName ,EndPoint);
                HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(EndPointURL);
                WebReq.Accept = "*/*";
                //WebReq.Method = HttpMethod;
                //WebReq.ContentType = "application/json; charset=utf-8";
                WebReq.Headers.Set("Authorization", "Bearer " + accessToken);
                return WebReq;
            }
            catch (ArgumentNullException e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                
            }
            return null;
        }
        public HttpWebRequest BuildGETRequest()
        {
            try
            {
                string EndPointURL = WebServiceRequestData.GetServiceURI(RequestName);
                EndPointURL = EndPointURL.Replace("{ENDPOINT}", EndPoint);
                HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(EndPointURL);
                WebReq.Headers.Add(WebServiceRequestData.GetSOAPAction(RequestName));
                WebReq.ContentType = "text/xml;charset=utf-8";
                WebReq.Accept = "text/xml";
                //WebReq.ContentLength = "Length";
                WebReq.Method = HttpMethod;
                //WebClient client = new WebClient();
                //client.Credentials = new NetworkCredential("bandars1", "Datalabs123", "EDCDEV");
                WebReq.Credentials = new NetworkCredential("testadmin", "Datalabs1234", "EDCDEV");
                //ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                //WebReq.Credentials = CredentialCache.DefaultNetworkCredentials;
                using (StreamWriter writer = new StreamWriter(WebReq.GetRequestStream()))
                {
                    string body = GetRequestWithData();
                    writer.WriteLine(body);
                }
                return WebReq;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }

        public string GetRequestWithData()
        {
            string XmlBody;
            using (StreamReader reader = GetXMLFileStream())
            {
                XmlBody = reader.ReadToEnd();
            }
            int counter = 0;
            foreach(string Field in ReplaceFieldName)
            {
                if(XmlBody.Contains(Field))
                {
                    XmlBody = XmlBody.Replace(Field, ReplacementData[counter]);
                }
                counter++;
            }
            return XmlBody;
        }
        
        public StreamReader GetXMLFileStream()
        {
            string fileloc;
            try
            {
                //fileloc = AppDomain.CurrentDomain.BaseDirectory;
                fileloc = Path.GetDirectoryName(Path.GetDirectoryName(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase)));
                fileloc = fileloc.Replace("file:\\", "");
                //string filepath2 = fileloc.Replace("EDC_Automation\\bin\\Debug\\", "BusinessProcesses\\DataLabs\\WebServices\\WebServiceRequestXMLs\\" + RequestName + ".xml");
                string filepath2 = fileloc.Replace("EDC_Automation", "BusinessProcesses\\DataLabs\\Study Files\\WebServices\\WebServiceRequestXMLs");
                filepath2 = filepath2 + "\\" + RequestName + ".xml";
                return new StreamReader(filepath2);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
            
        }
        string GetRestAccessToken(string endPoint, string requestName)
        {
            try
            {
                string EndPointURL = WebServiceRequestData.GetRESTServiceURI(requestName, endPoint);
                HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create(EndPointURL);
                WebReq.ContentType = "application/x-www-form-urlencoded";
                WebReq.Accept = "*/*";
                //WebReq.ContinueTimeout = 120000;
                //WebReq.ContentLength = "Length";
                WebReq.Method = "token";
                WebReq.Timeout = Timeout.Infinite;
                WebReq.KeepAlive = true;
                //WebClient client = new WebClient();
                //client.Credentials = new NetworkCredential("bandars1", "Datalabs123", "EDCDEV");
                WebReq.Credentials = new NetworkCredential("testadmin", "Datalabs1234", "EDCDEV");
                using (StreamWriter writer = new StreamWriter(WebReq.GetRequestStream()))
                {
                    string body = "Username=pabbatc&Password=Datalabs123&grant_type=password";
                    writer.WriteLine(body);
                }
                WebResponse Response = WebReq.GetResponse();
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        public void Dispose()
        {

        }
    }
}
