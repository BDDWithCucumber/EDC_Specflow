using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using BusinessProcesses.DataLabs;
using APIUtilities;
using EDC_Automation.Helpers;
using Common;
using DBUtilities;
using EDC_Automation.Steps;
using System.Data;

namespace EDC_Automation.Steps.DataLabs.WebServices
{
    [Binding]
    public class WebServiceSteps
    {
        [When(@"I add a new patient using AddNewPatient webservice with below data\.")]
        public void WhenIAddANewPatientUsingAddNewPatientWebserviceWithBelowData_(Table table)
        {
            List<string> RepFields = new List<string>(table.Header);
            foreach (TableRow row in table.Rows)
            {
                List<string> RepData = new List<string>();
                foreach (string col in RepFields)
                {
                    RepData.Add(row[col]);
                }
                ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleSyncRequest(ConfigurationHelper.WebServiceEndPoint + "/" + ConfigurationHelper.DLInstanceName, "POST", "AddNewPatient", RepFields, RepData);
            }
            
        }
        [When(@"I add a new patient using ConsumeODMStrAddNewPatients webservice with below data and odmfile\.")]
        public void WhenIAddANewPatientUsingConsumeODMStr_AddNewPatientsWebserviceWithBelowDataAndOdmfile_(Table table)
        {

            List<string> RepFields = new List<string>(table.Header);
            foreach (TableRow row in table.Rows)
            {
                List<string> RepData = new List<string>();
                foreach (string col in RepFields)
                {
                    if (col == "ODMDATA")
                    {
                        string ODMText = RequestResponseHandler.GetODMText(row[col]);
                        RepData.Add("<![CDATA[" + ODMText + "]]>");

                    }
                    else
                    {
                        RepData.Add(row[col]);
                    }
                }
                ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleSyncRequest(ConfigurationHelper.WebServiceEndPoint + "/" + ConfigurationHelper.DLInstanceName, "POST", "ConsumeODM1_2Str_AddNewPatients", RepFields, RepData);
            }
        }
        [When(@"I add item data using ConsumeODMStrTransactional webservice with below data and odmfile\.")]
        public void WhenIAddItemDataUsingConsumeODM_StrTransactionalWebserviceWithBelowDataAndOdmfile_(Table table)
        {
            List<string> RepFields = new List<string>(table.Header);
            foreach (TableRow row in table.Rows)
            {
                List<string> RepData = new List<string>();
                foreach (string col in RepFields)
                {
                    if (col == "ODMDATA")
                    {
                        string ODMText = RequestResponseHandler.GetODMText(row[col]);
                        RepData.Add("<![CDATA[" + ODMText + "]]>");

                    }
                    else
                    {
                        RepData.Add(row[col]);
                    }
                }
                ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleSyncRequest(ConfigurationHelper.WebServiceEndPoint + "/" + ConfigurationHelper.DLInstanceName, "POST", "ConsumeODM1_StrTransactional", RepFields, RepData);
            }
        }
        [When(@"I update existing item data of a patient ""(.*)"" using ConsumeODMStrTransactional webservice with below data and odmfile\.")]
        public void WhenIUpdateExistingItemDataOfAPatientUsingConsumeODMStrTransactionalWebserviceWithBelowDataAndOdmfile_(string patientIdentity, Table table)
        {
            List<string> RepFields = new List<string>(table.Header);
            foreach (TableRow row in table.Rows)
            {
                List<string> RepData = new List<string>();
                foreach (string col in RepFields)
                {
                    if (col == "ODMDATA")
                    {
                        string ODMText = RequestResponseHandler.GetODMText(row[col]);
                        if(patientIdentity!=null && patientIdentity != "")
                        {
                            SQLInfo Info = StoreSQLInfo();
                            string QueryToExecute = "Select subjectkey from Patient where PatientIdentity = '" + patientIdentity + "'";
                            Info.QueryResultTable = DatabaseUtilities.GetRecordsFromDB(QueryToExecute, Info);
                            DataTable data = Info.QueryResultTable;
                            string SubjectKey = string.Empty;
                            SubjectKey = data.Rows[0].ItemArray[0].ToString();
                            bool exist = ODMText.Contains("SubjectKeyDataValue");
                            ODMText = ODMText.Replace("SubjectKeyDataValue", SubjectKey);
                        }
                        RepData.Add("<![CDATA[" + ODMText + "]]>");

                    }
                    else
                    {
                        RepData.Add(row[col]);
                    }
                }
                ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleSyncRequest(ConfigurationHelper.WebServiceEndPoint + "/" + ConfigurationHelper.DLInstanceName, "POST", "ConsumeODM1_StrTransactional", RepFields, RepData);
            }
        }


        [When(@"I save the Study meta data exported from GetStudyMetaDataODM132 method under PatientAndOperationalDataEventing webservice")]
        public void WhenISaveTheStudyMetaDataExportedFromGetStudyMetaDataODMMethodUnderPatientAndOperationalDataEventingWebservice(Table table)
        {
            List<string> RepFields = new List<string>(table.Header);
            foreach (TableRow row in table.Rows)
            {
                List<string> RepData = new List<string>();
                string FilePathtoSave = string.Empty;
                foreach (string col in RepFields)
                {
                    if (col == "ResponseFile")
                    {
                        FilePathtoSave = FeatureContext.Current["ReportsFolderPath"].ToString();
                        FilePathtoSave = FilePathtoSave + row[col];
                    }
                    else
                    {
                        RepData.Add(row[col]);
                    }
                }
                
                ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleGETRequest(ConfigurationHelper.WebServiceEndPoint + "/" + ConfigurationHelper.DLInstanceName, "POST", "GetStudyMetaDataODM132", RepFields, RepData, FilePathtoSave);
            }
        }


        [Then(@"The response should contain success status code as ""(.*)""\.")]
        public void ThenTheResponseShouldContainSuccessStatusCodeAs_(int statusCode)
        {
            try
            {
                int x = 0;
                if(!int.TryParse(ScenarioContext.Current["StatusCode"].ToString(), out x))
                {
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
                ScenarioContext.Current.Remove("StatusCode");
            }
            catch(Exception e)
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to fetch the result. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter Visit date using SetEventDate webservice with below data\.")]
        public void WhenIEnterVisitDateUsingSetEventDateWebserviceWithBelowData_(Table table)
        {
            List<string> RepFields = new List<string>(table.Header);
            foreach (TableRow row in table.Rows)
            {
                List<string> RepData = new List<string>();
                foreach (string col in RepFields)
                {
                    if (col == "ODMDATA")
                    {
                        string ODMText = RequestResponseHandler.GetODMText(row[col]);
                        RepData.Add("<![CDATA[" + ODMText + "]]>");

                    }
                    else
                    {
                        RepData.Add(row[col]);
                    }
                }
                ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleSyncRequest(ConfigurationHelper.WebServiceEndPoint + "/" + ConfigurationHelper.DLInstanceName, "POST", "SetEventDate", RepFields, RepData);
            }
        }
        [When(@"I add a Form Level DCF using DCF CreateFormLevelDCF webservice with below data\.")]
        public void WhenIAddAFormLevelDCFUsingDCFCreateFormLevelDCFWebserviceWithBelowData(Table table)
        {
            List<string> RepFields = new List<string>(table.Header);
            foreach (TableRow row in table.Rows)
            {
                
                List<string> RepData = new List<string>();
                foreach (string col in RepFields)
                {
                    if (col == "SubjectKeyData")
                    {
                        SQLInfo Info = StoreSQLInfo();
                        string QueryToExecute = "Select subjectkey from Patient where PatientIdentity = '"+row[col]+"'";
                        Info.QueryResultTable = DatabaseUtilities.GetRecordsFromDB(QueryToExecute, Info);
                        DataTable data = Info.QueryResultTable;
                        string SubjectKey = string.Empty;
                        SubjectKey = data.Rows[0].ItemArray[0].ToString();
                        RepData.Add(SubjectKey);

                    }
                    else
                    {
                        RepData.Add(row[col]);
                    }
                }
                ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleSyncRequest(ConfigurationHelper.WebServiceEndPoint + "/" + ConfigurationHelper.DLInstanceName, "POST", "CreateFormLevelDCF", RepFields, RepData);
            }
        }
        [When(@"I add a Item Level DCF using DCF CreateItemLevelDCF webservice with below data\.")]
        public void WhenIAddAItemLevelDCFUsingDCFCreateFormLevelDCFWebserviceWithBelowData_(Table table)
        {
            List<string> RepFields = new List<string>(table.Header);
            foreach (TableRow row in table.Rows)
            {

                List<string> RepData = new List<string>();
                foreach (string col in RepFields)
                {
                    if (col == "SubjectKeyData")
                    {
                        SQLInfo Info = StoreSQLInfo();
                        string QueryToExecute = "Select subjectkey from Patient where PatientIdentity = '" + row[col] + "'";
                        Info.QueryResultTable = DatabaseUtilities.GetRecordsFromDB(QueryToExecute, Info);
                        DataTable data = Info.QueryResultTable;
                        string SubjectKey = string.Empty;
                        SubjectKey = data.Rows[0].ItemArray[0].ToString();
                        RepData.Add(SubjectKey);

                    }
                    else
                    {
                        RepData.Add(row[col]);
                    }
                }
                ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleSyncRequest(ConfigurationHelper.WebServiceEndPoint + "/" + ConfigurationHelper.DLInstanceName, "POST", "CreateItemLevelDCF", RepFields, RepData);
            }
        }
        [When(@"I Get the Lab details from API\.")]
        public void WhenIGetTheLabDetailsFromAPI_()
        {
            ScenarioContext.Current["StatusCode"] = RequestResponseHandler.HandleGetRESTRequest(ConfigurationHelper.WebServiceEndPoint, "/", "GETLABS");

        }

        public static SQLInfo StoreSQLInfo()
        {
            SQLInfo DBInfo = new SQLInfo();
            DBInfo.DataBaseServer = ConfigurationHelper.DatabaseServerName;
            DBInfo.DataBaseName = ConfigurationHelper.DatabaseName;
            DBInfo.DBUserName = ConfigurationHelper.DatabaseUserName;
            DBInfo.DBUserPassword = ConfigurationHelper.DatabaseUserPwd;
            DBInfo.SQLConnectionString = @"Data Source=" + DBInfo.DataBaseServer + ";Initial Catalog=" + DBInfo.DataBaseName + ";User ID=" + DBInfo.DBUserName + ";Password=" + DBInfo.DBUserPassword + "";
            return DBInfo;
            //DatabaseUtilities.SQLData(ConfigurationHelper.DatabaseServerName, ConfigurationHelper.DatabaseName, ConfigurationHelper.DatabaseUserName, ConfigurationHelper.DatabaseUserPwd);
        }

    }
}
