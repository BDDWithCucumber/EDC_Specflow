using OpenQA.Selenium;
using Reports.Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using Utilities;
using Word = Microsoft.Office.Interop.Word;

namespace Reports.OELog
{
    public class OELogGenerator : LogGeneratorBase
    {
        public bool CreateLogFile(String applicationName,String version,String environment)
        {
            try
            {
                String resDocName = FeatureContext.Current.FeatureInfo.Title + "_" + FeatureContext.Current["RunFolder"] + "_" + "OELog";
                FeatureContext.Current.Add("OELog", resDocName);
                String reportsFolderPath = FeatureContext.Current["ReportsFolderPath"].ToString();

                MSWord msWord = new MSWord();
                msWord.CreateOELogFromTemplate(resDocName, reportsFolderPath, applicationName, version, environment);
                FeatureContext.Current.Add("TableCounter", 1);
                FeatureContext.Current.Add("OELog_TableList", new TableList());
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public void CreateEntry()
        {
            try
            {
                Word.Application application = new Word.Application();
                application.Visible = false;
                Word.Document doc = application.Documents.Open(FeatureContext.Current["ReportsFolderPath"].ToString() + FeatureContext.Current["OELog"].ToString() + ".docx");
                Word.Table table = doc.Tables[1];

                int lastRowIndex = table.Rows.Count;
                table.Cell(lastRowIndex, 1).Range.Text = "Step " + FeatureContext.Current["StepNumber"];
                table.Cell(lastRowIndex, 2).Range.Text = GetScenarioTag("ReqID");
                table.Cell(lastRowIndex, 3).Range.Text = ScenarioContext.Current["Actions"].ToString();
                table.Cell(lastRowIndex, 4).Range.Text = ScenarioContext.Current["ExpResults"].ToString();
                table.Cell(lastRowIndex, 5).Range.Text = ScenarioContext.Current["ActResult"].ToString();
                table.Cell(lastRowIndex, 6).Range.Text = ScenarioContext.Current["Comments"].ToString();

                table.Rows[lastRowIndex].Range.Bold = 0;
                table.Rows[lastRowIndex].Range.Font.Size = 11;
                table.Rows[lastRowIndex].Range.Font.Name = "Times New Roman";

                ScenarioContext.Current.Remove("Actions");
                ScenarioContext.Current.Remove("ExpResults");
                ScenarioContext.Current.Remove("ActResult");
                ScenarioContext.Current.Remove("Comments");

                doc.Save();
                doc.Close();
                application.Quit();
            }
            catch (Exception e)
            {

            }
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
                    Word.Document doc = application.Documents.Open(FeatureContext.Current["ReportsFolderPath"].ToString() + FeatureContext.Current["OELog"].ToString() + ".docx");

                    Word.Table table = doc.Tables[2];
                    table.Rows.Add(System.Reflection.Missing.Value);
                    int lastRowIndex = table.Rows.Count;
                    table.Rows[lastRowIndex].Range.Bold = 1;
                    String text = "STEP " + FeatureContext.Current["StepNumber"];
                    text += "\n Scenario: " + scenarioTitle + ", ScenarioStep: " + step + ", Date: " + DateTime.Now.ToString();
                    table.Cell(lastRowIndex, 1).Range.Text = text;
                    table.Cell(lastRowIndex, 1).Range.Font.Size = 11;
                    table.Cell(lastRowIndex, 1).Range.Font.Name = "Times New Roman";

                    table.Rows.Add(System.Reflection.Missing.Value);
                    lastRowIndex = table.Rows.Count;
                    Word.InlineShape image = table.Cell(lastRowIndex, 1).Range.InlineShapes.AddPicture(screenshotFullPath);
                    image.Width = 500;
                    image.Height = 300;
                    doc.Save();
                    File.Delete(screenshotFullPath);

                    doc.Save();
                    doc.Close();
                    application.Quit();
                }
            }
            catch (Exception e)
            {
            }
        }

        public void PrepareEntryInfo()
        {
            string step = ScenarioContext.Current.StepContext.StepInfo.Text;
            string stepType = ScenarioStepContext.Current.StepInfo.BindingMatch.StepBinding.StepDefinitionType.ToString();
            if (StoreDataTables())
            {
                int tableCounter = Convert.ToInt32(FeatureContext.Current["TableCounter"].ToString());
                step = step + " (See Table# " + tableCounter + " in Appendix for data used.)";
                tableCounter++;
                FeatureContext.Current["TableCounter"] = tableCounter;
            }
            switch (stepType)
            {
                case "Given":
                    ScenarioContext.Current["Actions"] = ScenarioContext.Current["Actions"] + step + "\n";
                    break;
                case "When":
                    ScenarioContext.Current["Actions"] = ScenarioContext.Current["Actions"] + step + "\n";
                    break;
                case "Then":
                    ScenarioContext.Current["ExpResults"] = ScenarioContext.Current["ExpResults"] + step + "\n";
                    break;
            }
        }	


        bool StoreDataTables()
        {
            Table table = ScenarioContext.Current.StepContext.StepInfo.Table;
            if (table != null)
            {
                TableList tableList = (TableList)FeatureContext.Current["OELog_TableList"];
                tableList.AddTable(table);
                return true;
            }
            return false;
        }

        public void AddAnEmptyEntry()
        {
            try
            {
                Word.Application application = new Word.Application();
                application.Visible = false;
                Word.Document doc = application.Documents.Open(FeatureContext.Current["ReportsFolderPath"].ToString() + FeatureContext.Current["OELog"].ToString() + ".docx");
                Word.Table table = doc.Tables[1];
                table.Rows.Add(System.Reflection.Missing.Value);
                ScenarioContext.Current.Add("Actions", string.Empty);
                ScenarioContext.Current.Add("ExpResults", string.Empty);
                ScenarioContext.Current.Add("ActResult", "Passed");
                ScenarioContext.Current.Add("Comments", string.Empty);
                ScenarioContext.Current.Add("StepNo", string.Empty);
                ScenarioContext.Current.Add("AppendixNo", 0);

                doc.Save();
                doc.Close();
                application.Quit();
            }
            catch (Exception e)
            {

            }
        }

        public void LogDataTables()
        {
            try
            {
                TableList tables = (TableList)FeatureContext.Current["OELog_TableList"];
                List<Table> tableList = tables.GetTableList();
                if (tableList.Count == 0)
                {
                    return;
                }
                Word.Application Wapp1 = new Word.Application();
                Word.Document ResultDoc1 = Wapp1.Documents.Open(FeatureContext.Current["ReportsFolderPath"].ToString() + FeatureContext.Current["OELog"].ToString() + ".docx");
                object objBreak = Word.WdBreakType.wdPageBreak;
                object objUnit = Word.WdUnits.wdStory;
                object Missing = System.Reflection.Missing.Value;
                Wapp1.Selection.EndKey(ref objUnit, ref Missing);
                Wapp1.Selection.InsertBreak(ref objBreak);
                Word.Paragraph objP = ResultDoc1.Paragraphs.Add();
                objP.Range.Bold = 1;
                objP.Range.Text = "Appendix\n\n";
                objP.Range.Bold = 0;
                objP.Range.Text = "Table 1 \n";
                object EndOfDoc = "\\endofdoc";
                Word.Table objTable;
                Word.Range objRange;
                int TableNo = 1;
                foreach (Table tblData in tableList)
                {
                    TableNo++;
                    int intTCols = tblData.Header.Count;
                    int intTRows = tblData.RowCount;
                    objRange = ResultDoc1.Bookmarks.get_Item(EndOfDoc).Range;
                    objTable = ResultDoc1.Tables.Add(objRange, intTRows + 1, intTCols, ref Missing, ref Missing);
                    objTable.Borders.Enable = 1;
                    String[] ColData = tblData.Header.ToArray<String>();
                    for (int Col = 0; Col < ColData.Length; Col++)
                    {
                        objTable.Cell(1, Col + 1).Range.Text = ColData[Col];
                    }
                    int CurrRow = 2;
                    TableRows DataRows = tblData.Rows;
                    foreach (var DataRow in DataRows)
                    {
                        String[] RowData = DataRow.Values.ToArray<String>();
                        for (int RowCol = 0; RowCol < ColData.Length; RowCol++)
                        {
                            objTable.Cell(CurrRow, RowCol + 1).Range.Text = RowData[RowCol];
                        }
                        CurrRow++;
                    }
                    objTable.Rows[1].Range.Bold = 1;
                    if (TableNo <= tableList.Count)
                    {
                        objRange = null;
                        objRange = ResultDoc1.Bookmarks.get_Item(EndOfDoc).Range;
                        Word.Paragraph objPara2 = ResultDoc1.Content.Paragraphs.Add(objRange);
                        objPara2.Range.InsertParagraphBefore();
                        objPara2.Range.Text = "Table " + TableNo;
                        objTable = null;
                    }
                }

                ResultDoc1.Save();
                ResultDoc1.Close();
                Wapp1.Quit();
            }
            catch (Exception e)
            {
            }
        }

        string GetScenarioTag(string TagName)
        {
            string tag = "";
            TagName = TagName.ToUpper();
            StringBuilder sb = new StringBuilder();
            var FTags = ScenarioContext.Current.ScenarioInfo.Tags;
            foreach (string ftag in FTags)
            {
                ftag.ToUpper();
                if (ftag.ToUpper().Contains(TagName))
                {
                    tag = ftag.ToUpper().ToString();
                    tag = tag.Replace(TagName + ":", string.Empty);
                    sb.Append(tag);
                    sb.Append("\n");
                }
            }
            return sb.ToString();
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


        /*public void CreateAppendixTables()
        {
            try
            {
                Word.Application application = new Word.Application();
                application.Visible = false;
                Word.Document document = application.Documents.Open(FeatureContext.Current["ReportsFolderPath"].ToString() + FeatureContext.Current["OELog"].ToString() + ".docx");

                if (!this.AppCreated)
                {
                    object objBreak = Word.WdBreakType.wdPageBreak;
                    object objUnit = Word.WdUnits.wdStory;
                    application.Selection.EndKey(ref objUnit, ref Missing);
                    application.Selection.InsertBreak(ref objBreak);
                    Word.Paragraph objP = document.Paragraphs.Add();
                    objP.Range.Text = "Appendix\n";
                    this.AppCreated = true;
                }
                document.Save();
                document.Close();
                application.Quit();
            }
            catch (Exception e)
            {
            }
        }*/
    }
}