using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using EDC_Automation.Helpers;
using Common;
using DBUtilities;
using System.Data;
using System.Xml.Linq;
using System.Threading;

namespace EDC_Automation.Steps.DataLabs.DataBase
{
    [Binding]
    public class DatabaseSteps
    {
        [Given(@"I have connected to Database\.")]
        public void GivenIHaveConnectedToDatabase_()
        {
            SQLInfo Info = StoreSQLInfo();
            if (!DatabaseUtilities.ConnectToDB(Info))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to database. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I close the Database connection\.")]
        public void ThenICloseTheDatabaseConnection_()
        {
            SQLInfo Info = StoreSQLInfo();
            if (!DatabaseUtilities.CloseDBConnection(Info))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to close database. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I execute the query ""(.*)""\.")]
        public void WhenIExecuteTheQuery_(string QueryToExecute)
        {
            SQLInfo Info = StoreSQLInfo();
            Info.QueryResultTable = DatabaseUtilities.GetRecordsFromDB(QueryToExecute, Info);
            if(Info.QueryResultTable == null)
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to execute query " + QueryToExecute + " on database. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            DataTable dtClone = Info.QueryResultTable.Clone();
                foreach(DataColumn dc in dtClone.Columns)
                {
                    dc.DataType = typeof(string);
                }
                foreach(DataRow dr in Info.QueryResultTable.Rows)
                {
                    dtClone.ImportRow(dr);
                }
            ScenarioContext.Current["QueryResults"] = dtClone;
        }


        [When(@"I Execute the query for field verification ""(.*)""")]
        public void WhenIExecuteTheQueryForFieldVerification(string QueryToExecute)
        {
            DS_SQLInfo DSInfo = StoreDSSQLInfo();
            DSInfo.DSQueryResultTable = DatabaseUtilities.GetRecordsFromDSDB(QueryToExecute, DSInfo);
            if (DSInfo.DSQueryResultTable == null)
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to execute query " + QueryToExecute + " on database. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            DataTable dtClone = DSInfo.DSQueryResultTable.Clone();
            foreach (DataColumn dc in dtClone.Columns)
            {
                dc.DataType = typeof(string);
            }
            foreach (DataRow dr in DSInfo.DSQueryResultTable.Rows)
            {
                dtClone.ImportRow(dr);
            }
            ScenarioContext.Current["QueryResults"] = dtClone;
        }

        [Then(@"The ""(.*)"" field should not be found")]
        public void ThenTheFieldShouldNotBeFound(string fieldToVerify)
        {
            DataTable QueryRes = (DataTable)ScenarioContext.Current["QueryResults"];
            if (!DataTableUtilities.FieldNotFound(QueryRes, fieldToVerify))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Query result is not displayed as per the table from database. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"The below result should be retrieved\.")]
        public void ThenTheBelowResultShouldBeRetrieved_(Table table)
        {
            DataTable DataToVerify = DataTableUtilities.ConvertTableToDataTable(table);
            DataTable QueryRes = (DataTable)ScenarioContext.Current["QueryResults"];
            
            if (!DataTableUtilities.CompareTwoDataTables(QueryRes, DataToVerify))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Query result is not displayed as per the table from database. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"The result should have empty values\.")]
        public void ThenTheResultShouldHaveEmptyValues_()
        {
            DataTable QueryRes = (DataTable)ScenarioContext.Current["QueryResults"];
            if (!DataTableUtilities.BlankValuesVerificationInResultSet(QueryRes))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Query result does not have empty values in the database. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"The below result should be retrieved with Reference Range ID\.")]
        public void ThenTheBelowResultShouldBeRetrievedWithReferenceRangeID_(Table table)
        {
            ReferenceRangeDataFormatter newTable = new ReferenceRangeDataFormatter();
            newTable.FillReferenceRangeId("Data Value", table);
            ThenTheBelowResultShouldBeRetrieved_(table);
        }


        [Then(@"the below result set should contain")]
        public void ThenTheBelowResultSetShouldContain(Table table)
        {
            DataTable DataToVerify = DataTableUtilities.ConvertTableToDataTable(table);
            DataTable QueryRes = (DataTable)ScenarioContext.Current["QueryResults"];           
            foreach (DataRow dr in DataToVerify.Rows)
                {
                    if (!dr["DisplayOrder"].ToString().Contains("-1"))
                {
                    ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Query result is not displayed as per the table from database. \n";
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }            
        }


        [Then(@"I have ""(.*)"" records resulted on querying the DB\.")]
        public void ThenIHaveRowsResultedOnQueryingTheDB_(int NoOfRecords)
        {
            DataTable QueryRes = (DataTable)ScenarioContext.Current["QueryResults"];
            if(QueryRes.Rows.Count != NoOfRecords)
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "No of records retrieved on querying DB is/are '" + QueryRes.Rows.Count + "'. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Given(@"I have connected to DB and execute the query ""(.*)""\.")]
        public void GivenIHaveConnectedToDBAndExecuteTheQuery_(string QueryToExecute)
        {
            SQLInfo Info = StoreSQLInfo();
            if (DatabaseUtilities.ConnectToDB(Info))
            {
                Info.QueryResultTable = DatabaseUtilities.GetRecordsFromDB(QueryToExecute, Info);
                if (Info.QueryResultTable == null)
                {
                    ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to execute query " + QueryToExecute + " on database. \n";
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }
            else
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to database. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Given(@"I save the XML data into an XML file with name as ""(.*)""\.")]
        public void GivenISaveTheXMLDataIntoAnXMLFileWithNameAs_(string XMLFileName)
        {
            SQLInfo Info = StoreSQLInfo();
            DataTable data = Info.QueryResultTable;
            string FilePath = @"C:\TestXMLFiles\";
            string content = data.Rows[0].ItemArray[0].ToString();
            XDocument xdoc = XDocument.Parse(content);
            xdoc.Save(FilePath + XMLFileName);
        }

        [When(@"I save the Event XML data in ""(.*)"" file by executing the query ""(.*)""")]
        [Given(@"I save the Event XML data in ""(.*)"" file by executing the query ""(.*)""")]
        public void GivenISaveTheEventXMLDataInFileByExecutingTheQuery(string XMLFileName, string QueryToExecute)
        {
            SQLInfo Info = StoreSQLInfo();
            try
            {
                if (DatabaseUtilities.ConnectToDB(Info))
                {
                    Thread.Sleep(5000);
                    Info.QueryResultTable = DatabaseUtilities.GetRecordsFromDB(QueryToExecute, Info);
                    if (Info.QueryResultTable == null)
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to execute query " + QueryToExecute + " on database. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    else
                    {
                        DataTable data = Info.QueryResultTable;
                        string FilePath = FeatureContext.Current["ReportsFolderPath"].ToString();
                        string content = data.Rows[0].ItemArray[0].ToString();
                        XDocument xdoc = XDocument.Parse(content);
                        xdoc.Save(FilePath + XMLFileName);
                    }
                    DatabaseUtilities.CloseDBConnection(Info);
                }
                else
                {
                    ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to database. \n";
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }
            catch (Exception e)
            {
                string abc = Info.DataBaseName;
            }
            
        }
        //Program written for copying files which is not used in any of the scenarios
        [Then(@"I save the file with name prefix ""(.*)"" by executing the Query\.")]
        public void ThenISaveTheFileWithNamePrefixByExecutingTheQuery_(string XMLFileName)
        {
            string QueryToExecute = "select XmlMessage from OdmSubscriberDetail where StudyEventKey = 8 and StatusKey = 311";
            SQLInfo Info = StoreSQLInfo();
            try
            {
                if (DatabaseUtilities.ConnectToDB(Info))
                {
                    Thread.Sleep(5000);
                    Info.QueryResultTable = DatabaseUtilities.GetRecordsFromDB(QueryToExecute, Info);
                    if (Info.QueryResultTable == null)
                    {
                        ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to execute query " + QueryToExecute + " on database. \n";
                        ScenarioContext.Current["ActResult"] = "Failed";
                    }
                    else
                    {
                        DataTable data = Info.QueryResultTable;
                        string FilePath = FeatureContext.Current["ReportsFolderPath"].ToString();
                        for (int i = 0; i < data.Rows.Count - 1; i++)
                        {
                            string content = data.Rows[i].ItemArray[0].ToString();
                            XDocument xdoc = XDocument.Parse(content);
                            xdoc.Save(FilePath + XMLFileName + i + ".xml");
                        }
                        
                    }
                    DatabaseUtilities.CloseDBConnection(Info);
                }
                else
                {
                    ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Unable to database. \n";
                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }
            catch (Exception e)
            {
                string abc = Info.DataBaseName;
            }

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

        public static DS_SQLInfo StoreDSSQLInfo()
        {
            DS_SQLInfo DSDBInfo = new DS_SQLInfo();
            DSDBInfo.DSDataBaseServer = ConfigurationHelper.DSDatabaseServerName;
            DSDBInfo.DSDataBaseName = ConfigurationHelper.DSDatabaseName;
            DSDBInfo.DSDBUserName = ConfigurationHelper.DatabaseUserName;
            DSDBInfo.DSDBUserPassword = ConfigurationHelper.DatabaseUserPwd;
            DSDBInfo.SQLConnectionString = @"Data Source=" + DSDBInfo.DSDataBaseServer + ";Initial Catalog=" + DSDBInfo.DSDataBaseName + ";User ID=" + DSDBInfo.DSDBUserName + ";Password=" + DSDBInfo.DSDBUserPassword + "";
            return DSDBInfo;
            //DatabaseUtilities.SQLData(ConfigurationHelper.DatabaseServerName, ConfigurationHelper.DatabaseName, ConfigurationHelper.DatabaseUserName, ConfigurationHelper.DatabaseUserPwd);
        }



    }
}
