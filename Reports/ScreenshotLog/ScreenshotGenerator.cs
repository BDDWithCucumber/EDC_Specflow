
using OpenQA.Selenium;
using Reports.Common;
using System;
using System.IO;
using TechTalk.SpecFlow;
using Utilities;
using Word = Microsoft.Office.Interop.Word;

namespace Reports.ScreenshotLog
{
    public class ScreenshotGenerator : LogGeneratorBase
    {
        public bool CreateLogFile(String applicationName, String version, String environment)
        {
            try
            {
                MSWord msWord = new MSWord();
                String screenshotLogFileName = FeatureContext.Current.FeatureInfo.Title + "_" + FeatureContext.Current["RunFolder"] + "_" + "ScreenshotLog";
                String reportFoldersPath = FeatureContext.Current["ReportsFolderPath"].ToString();
                msWord.CreateScreenshotLogFromTemplate(screenshotLogFileName, reportFoldersPath, applicationName, version, environment);
                String screenshotLogFilePath = FeatureContext.Current["ReportsFolderPath"].ToString() + "\\" + screenshotLogFileName + ".docx";
                FeatureContext.Current.Add("ScreenshotLog", screenshotLogFilePath);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public void TakeScreenshot()
        {
            try
            {
                String stepType = ScenarioStepContext.Current.StepInfo.StepDefinitionType.ToString();
                if (stepType.Equals("Then", StringComparison.InvariantCultureIgnoreCase) &&
                    IsObjectEvidenceTagExists())
                {
                    String scenarioTitle = ScenarioContext.Current.ScenarioInfo.Title;
                    String step = ScenarioContext.Current.StepContext.StepInfo.Text;

                    ITakesScreenshot takesScreenshot = BrowserUtilities.WebDriver as ITakesScreenshot;
                    Screenshot screenShot = takesScreenshot.GetScreenshot();
                    String screenshotFullPath = FeatureContext.Current["Screenshot_TempFolder"] + "\\temp.png";
                    screenShot.SaveAsFile(screenshotFullPath);

                    Word.Application application = new Word.Application();
                    application.Visible = false;
                    Word.Document doc = application.Documents.Open(FeatureContext.Current["ScreenshotLog"].ToString());

                    Word.Table table = doc.Tables[1];
                    table.Rows.Add(System.Reflection.Missing.Value);
                    int lastRowIndex = table.Rows.Count;
                    table.Rows[lastRowIndex].Range.Bold = 1;
                    //table.Rows[lastRowIndex].Range.Font.Size = 10;
                    table.Cell(lastRowIndex, 1).Range.Text = "SCENARIO: " + scenarioTitle + "\n STEP: " + step + "\n DATE: " + DateTime.Now.ToString();

                    table.Rows.Add(System.Reflection.Missing.Value);
                    lastRowIndex = table.Rows.Count;
                    Word.InlineShape image = table.Cell(lastRowIndex, 1).Range.InlineShapes.AddPicture(screenshotFullPath);
                    image.Width = 350;
                    image.Height = 350;
                    doc.Save();
                    doc.Close();
                    application.Quit();
                    File.Delete(screenshotFullPath);
                }
            }
            catch (Exception e)
            {
            }
        }

        bool IsObjectEvidenceTagExists()
        {
            String[] tags = ScenarioContext.Current.ScenarioInfo.Tags;
            foreach (String tag in tags)
            {
                if (tag.Equals("ObjectiveEvidence", StringComparison.InvariantCultureIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }
    }
}