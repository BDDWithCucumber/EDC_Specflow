using Reports.Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Reports.DebugLog
{
    public class DebugLogGenerator : LogGeneratorBase
    {
        public bool CreateLogFile(String applicationName, String version, String environment)
        {
            try
            {
                String fileName = FeatureContext.Current.FeatureInfo.Title + "_" + FeatureContext.Current["RunFolder"] + "_" + "DebugLog.txt";
                FeatureContext.Current.Add("DebugLog", fileName);
                String reportsFolderPath = FeatureContext.Current["ReportsFolderPath"].ToString();
                FileStream fs = File.Create(reportsFolderPath + fileName);
                fs.Close();
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public void WriteBeforeFeatureLogEntry()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("BEFORE FEATURE - ");
            sb.Append(FeatureContext.Current.FeatureInfo.Title);
            WriteToDebugLog(sb.ToString());
        }

        public void WriteBeforeScenarioLogEntry()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("BEFORE SCENARIO - ");
            sb.Append(ScenarioContext.Current.ScenarioInfo.Title);
            WriteToDebugLog(sb.ToString());
        }

        public void WriteBeforeStpeLogEntry()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("BEFORE STEP - ");
            sb.Append(ScenarioStepContext.Current.StepInfo.Text);
            WriteToDebugLog(sb.ToString());
        }

        public void WriteAfterScenarioLogEntry()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("AFTER SCENARIO - ");
            sb.Append(ScenarioContext.Current.ScenarioInfo.Title);
            WriteToDebugLog(sb.ToString());
        }

        public void WriteAfterStepLogEntry()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("AFTER STEP - ");
            sb.Append(ScenarioStepContext.Current.StepInfo.Text);
            WriteToDebugLog(sb.ToString());

            String stepResult = ScenarioContext.Current["ActResult"].ToString();
            if (stepResult.Equals("Failed", StringComparison.InvariantCultureIgnoreCase))
            {
                WriteToDebugLog("***** FAIL *****");
            }
        }

        public void WriteAfterFeatureLogEntry()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("AFTER FEATURE - ");
            sb.Append(FeatureContext.Current.FeatureInfo.Title);
            WriteToDebugLog(sb.ToString());
        }

        public void WriteException(String className, String methodName, Exception exception)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Class - " + className + ", Method - " + methodName);
            sb.AppendLine("Exception - " + exception.ToString());
            new DebugLogGenerator().WriteToDebugLog(sb.ToString());
        }

        public void WriteLog(String className, String methodName, String logText)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Class - " + className + ", Method - " + methodName);
            sb.AppendLine(logText);
            new DebugLogGenerator().WriteToDebugLog(sb.ToString());
        }

        public bool WriteToDebugLog(String logText)
        {
            try
            {
                String fileName = FeatureContext.Current["DebugLog"].ToString();
                String reportsFolderPath = FeatureContext.Current["ReportsFolderPath"].ToString();
                String fileFullName = reportsFolderPath + fileName;

                using (StreamWriter writer = File.AppendText(fileFullName))
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append(DateTime.Now.ToString());
                    sb.Append(" ----- ");
                    sb.Append(logText);
                    writer.WriteLine(sb.ToString());

                    writer.Flush();
                    writer.Close();
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }
}