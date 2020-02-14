using EDC_Automation.Helpers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Reports.Common;
using Reports.DebugLog;
using Reports.OELog;
using Reports.ScreenshotLog;
using System;
using System.Diagnostics;
using System.Windows.Forms;
using TechTalk.SpecFlow;

namespace EDC_Automation.Reporting
{
    [Binding]
    public class ScenarioAssists
    {

		[BeforeFeature]
        public static void BeforeFeature()
        {
            KillProcesses();

            if (new LogGeneratorBase().CreateReportsFolderForTestCase())
            {
                String applicationName = ConfigurationHelper.Application;
                String version = ConfigurationHelper.AppVersion;
                String environment = GetEnvironmentURL();
                new OELogGenerator().CreateLogFile(applicationName, version, environment);
                new ScreenshotGenerator().CreateLogFile(applicationName, version, environment);
                new DebugLogGenerator().CreateLogFile(applicationName, version, environment);
                new DebugLogGenerator().WriteBeforeFeatureLogEntry();
                FeatureContext.Current.Add("StepNumber", 0);
                FeatureContext.Current.Add("RRIndexCounter",1);
            }
        }

        static String GetEnvironmentURL()
        {
            if (ConfigurationHelper.IsDesignerEnabled)
            {
                return ConfigurationHelper.DesignerUrl;
            }
            if (ConfigurationHelper.IsWebFocusEnabled)
            {
                return ConfigurationHelper.WebFocusURL;
            }
            else
            {
                return ConfigurationHelper.DataLabsURL;
            }
        }

        static void KillProcesses()
        {
            try
            {
                var processes = Process.GetProcessesByName("WINWORD");
                foreach (var process in processes)
                {
                    process.Kill();
                }
                var processes1 = Process.GetProcessesByName("IEDriverServer");
                foreach (var process in processes1)
                {
                    process.Kill();
                }
            }
            catch (Exception e)
            {
            }
        }

        [BeforeScenario]
        public void BeforeScenario()
        {
            int stepNumber = Convert.ToInt32(FeatureContext.Current["StepNumber"]);
            FeatureContext.Current["StepNumber"] = ++stepNumber;
            new OELogGenerator().AddAnEmptyEntry();
            new DebugLogGenerator().WriteBeforeScenarioLogEntry();
        }

        [BeforeStep]
        public void BeforeStep()
        {
            new OELogGenerator().PrepareEntryInfo();
            new DebugLogGenerator().WriteBeforeStpeLogEntry();
        }

        [AfterScenario]
        public void AfterScenario()
        {
            StopExecutionOnNoExpectedResult();
            new OELogGenerator().CreateEntry();
            new DebugLogGenerator().WriteAfterScenarioLogEntry();
        }

        [AfterStep]
        public void AfterStep()
        {
            new OELogGenerator().TakeScreenshot();
            new ScreenshotGenerator().TakeScreenshot();
            new DebugLogGenerator().WriteAfterStepLogEntry();
            StopExecutionOnScenarioFail();
        }

        [AfterFeature]
        public static void AfterFeature()
        {            
            new OELogGenerator().LogDataTables();
            new DebugLogGenerator().WriteAfterFeatureLogEntry();
            KillProcesses();
        }

        void StopExecutionOnScenarioFail()
        {
            if (ScenarioContext.Current.ContainsKey("ActResult"))
            {
                string scenarioResult = ScenarioContext.Current["ActResult"].ToString();
                if (scenarioResult.Equals("Failed", StringComparison.InvariantCultureIgnoreCase))
                {
					
					new DebugLogGenerator().WriteLog("ScenarioAssists", "StopExecutionOnScenarioFail", "EXECUTION HAS BEEN STOPPED DUE TO FAILED STEP");
                    Assert.Fail();                    
                }
            }
        }
        void StopExecutionOnNoExpectedResult()
        {
			string scenarioResult = ScenarioContext.Current["ActResult"].ToString();
			if (ScenarioContext.Current["ExpResults"].ToString() == "")
			{
				if (!scenarioResult.Equals("Failed", StringComparison.InvariantCultureIgnoreCase))
				{
					Assert.Fail();
					new DebugLogGenerator().WriteLog("ScenarioAssists", "StopExecutionOnNoExpectedResult", "EXECUTION HAS BEEN STOPPED DUE TO NO THEN STEP");
				}
            }
        }
    }
}