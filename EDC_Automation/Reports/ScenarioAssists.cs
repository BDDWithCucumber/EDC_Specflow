using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using Word = Microsoft.Office.Interop.Word;

namespace EDC_Automation.Reports
{
   [Binding]
    public class ScenarioAssists
    {

        public static List<Table> DataTableList = new List<Table>();
        public Word.Document ResultDoc { get; set; }
        public Word.Application Wapp { get; set; }
        public Word.Table objTbl { get; set; }
        object Missing = System.Reflection.Missing.Value;
        public bool AppCreated { get; set; }

        public int TableCounter = 1;

        [BeforeFeature]
        public static void BeforeFeatureSteps()
        {            
            MSWord MS = new MSWord();
            string ResDocName = FeatureContext.Current.FeatureInfo.Title + " " + DateTime.Now.ToString();
            ResDocName = ResDocName.Replace("/", "-");
            ResDocName = ResDocName.Replace(":", " ");
            FeatureContext.Current.Add("ResultDocName", ResDocName);
            MS.OpenResultDocTemplateNSave(ResDocName, @"C:\Surya\Work\");
            //AppCreated = false;
        }

        [BeforeScenario]
        public void BeforeScenarioSteps()
        {
            this.Wapp = new Word.Application();
            Wapp.Visible = false;
            this.ResultDoc = Wapp.Documents.Open(@"C:\Surya\Work\" + FeatureContext.Current["ResultDocName"] + ".docx");
            this.objTbl = ResultDoc.Tables[1];
            objTbl.Rows.Add(Missing);
            ScenarioContext.Current.Add("Actions", string.Empty);
            ScenarioContext.Current.Add("ExpResults", string.Empty);
            ScenarioContext.Current.Add("ActResult", "Passed");
            ScenarioContext.Current.Add("Comments", string.Empty);
            ScenarioContext.Current.Add("StepNo", string.Empty);
            ScenarioContext.Current.Add("AppendixNo", 0);
        }
        
        [BeforeStep]
        public void BeforeStepSteps()
        {
            string step = ScenarioContext.Current.StepContext.StepInfo.Text;
            string stepType = ScenarioStepContext.Current.StepInfo.BindingMatch.StepBinding.StepDefinitionType.ToString();
            if(StoreDataTables())
            {
                step = step + " (See Table# " + TableCounter + " in Appendix for data used.)";
                TableCounter++;
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
            //StoreDataTables();
        }
        
        [AfterScenario]
        public void AfterScenarioSteps()
        {
            string ReqID = GetScenarioTag("ReqID");
            int TableRows = objTbl.Rows.Count;
            objTbl.Cell(TableRows, 1).Range.Text = "Step " + (TableRows - 1).ToString();
            objTbl.Cell(TableRows, 2).Range.Text = ReqID;
            objTbl.Cell(TableRows, 3).Range.Text = ScenarioContext.Current["Actions"].ToString();
            objTbl.Cell(TableRows, 4).Range.Text = ScenarioContext.Current["ExpResults"].ToString();
            objTbl.Cell(TableRows, 5).Range.Text = ScenarioContext.Current["ActResult"].ToString();
            objTbl.Cell(TableRows, 6).Range.Text = ScenarioContext.Current["Comments"].ToString();
            objTbl.Rows[TableRows].Range.Bold = 0;

            //CreateAppendixTables();
            
            /*
            //Update start
            Word.Document Doc = this.ResultDoc;
            Word.Application App = this.Wapp;
            object objPR = objTbl.Cell(TableRows, 6).Range;
            Word.Paragraph objP = Doc.Content.Paragraphs.Add(objPR);
            objPR = null;
            objTbl.Cell(TableRows, 6).Range.Text = "test";
            objPR = objTbl.Cell(TableRows, 6).Range;
            objP.Range.Text = "\n Testing";
            //Word.Paragraph objP1 = Doc.Content.Paragraphs.Add(objPR);
            Word.Paragraph objP1 = objTbl.Cell(TableRows, 6).Range.Paragraphs.Add();
            objP1.Range.Text = "\n Text";
            /* var tabRng = objTbl.Cell(TableRows, 6).Range;
             tabRng.Tables.Add(tabRng, 2, 2);
             var objStab = objTbl.Cell(TableRows, 6).Tables[1];
             objStab.Cell(1, 1).Range.Text = "Test";
             objStab.Cell(1, 2).Range.Text = "Test";
             objStab.Cell(2, 1).Range.Text = "Test";
             objStab.Cell(2, 2).Range.Text = "Test";
             objStab.Borders.Enable = 1;
             objStab.Cell(TableRows, 6).
             objTbl.Cell(TableRows, 6).Range.Text = "New Text";
             */
            ScenarioContext.Current.Remove("Actions");
            ScenarioContext.Current.Remove("ExpResults");
            ScenarioContext.Current.Remove("ActResult");
            ScenarioContext.Current.Remove("Comments");
            
            Word.Document Doc = this.ResultDoc;
            Word.Application App = this.Wapp;
            
            Doc.Save();
            Doc.Close();
            App.Quit();

           // CreateAppendixTables();

            //FeatureContext.Current.
        }

        [AfterFeature]
        public static void AfterFeatureSteps()
        {
            if(DataTableList.Count == 0)
            {
                return;
            }
            Word.Application Wapp1 = new Word.Application();
            Word.Document ResultDoc1 = Wapp1.Documents.Open(@"C:\Surya\Work\" + FeatureContext.Current["ResultDocName"] + ".docx");
            object objBreak = Word.WdBreakType.wdPageBreak;
            object objUnit = Word.WdUnits.wdStory;
            object Missing = System.Reflection.Missing.Value;
            Wapp1.Selection.EndKey(ref objUnit, ref Missing);
            Wapp1.Selection.InsertBreak(ref objBreak);
            Word.Paragraph objP = ResultDoc1.Paragraphs.Add();
            //objP.Range.InsertParagraph();
            objP.Range.Bold = 1;
            objP.Range.Text = "Appendix\n\n";
            objP.Range.Bold = 0;
            objP.Range.Text = "Table 1 \n";
            object EndOfDoc = "\\endofdoc";
            Word.Table objTable;
            Word.Range objRange;
            int TableNo = 1;
            foreach (Table tblData in DataTableList)
            {
                TableNo++;
                int intTCols = tblData.Header.Count;
                int intTRows = tblData.RowCount;
                objRange = ResultDoc1.Bookmarks.get_Item(EndOfDoc).Range;
                objTable = ResultDoc1.Tables.Add(objRange, intTRows + 1, intTCols, ref Missing, ref Missing);
                objTable.Borders.Enable = 1;
                string[] ColData = tblData.Header.ToArray<string>();
                for (int Col = 0; Col < ColData.Length; Col++)
                {
                    objTable.Cell(1, Col + 1).Range.Text = ColData[Col];
                }
                int CurrRow = 2;
                TableRows DataRows = tblData.Rows;
                foreach (var DataRow in DataRows)
                {
                    string[] RowData = DataRow.Values.ToArray<string>();
                    for (int RowCol = 0; RowCol < ColData.Length; RowCol++)
                    {
                        objTable.Cell(CurrRow, RowCol + 1).Range.Text = RowData[RowCol];
                    }
                    CurrRow++;
                }
                objTable.Rows[1].Range.Bold = 1;
                if(TableNo <= DataTableList.Count)
                {
                    objRange = null;
                    objRange = ResultDoc1.Bookmarks.get_Item(EndOfDoc).Range;
                    Word.Paragraph objPara2 = ResultDoc1.Content.Paragraphs.Add(objRange);
                    objPara2.Range.InsertParagraphBefore();
                    objPara2.Range.Text = "Table " + TableNo;
                    objTable = null;
                }
            }

            /*
            //Word.Range objRange = ResultDoc1.Bookmarks.get_Item(EndOfDoc).Range;

            //objTable = ResultDoc1.Tables.Add(objRange, 2, 2, ref Missing, ref Missing);
            //objTable.Borders.Enable = 1;
            objRange = ResultDoc1.Bookmarks.get_Item(EndOfDoc).Range;
            Word.Paragraph objP1 = ResultDoc1.Content.Paragraphs.Add(objRange);
            objP1.Range.InsertParagraphBefore();            
            objP1.Range.Text = "Table 2";
            //object objUnit2 = Word.WdUnits.
            //object objBreak1 = Word.WdBreakType.wdColumnBreak;
            //objTable.Rows[2].Select();
            //Wapp1.Selection.
            //Wapp1.Selection.EndKey(ref objUnit2, ref Missing);
            Wapp1.Selection.TypeParagraph();
            Wapp1.Selection.TypeParagraph();
            //Wapp1.Selection.InsertBreak(ref objBreak1);
            objTable = null;
            objRange = null;
            Word.Range objRange2 = ResultDoc1.Bookmarks.get_Item(EndOfDoc).Range;
            objTable = ResultDoc1.Tables.Add(objRange2, 2, 2, ref Missing, ref Missing);
            objTable.Borders.Enable = 1;

            objRange = ResultDoc1.Bookmarks.get_Item(EndOfDoc).Range;
            objP1 = ResultDoc1.Content.Paragraphs.Add(objRange);
            objP1.Range.InsertParagraphBefore();
            objP1.Range.Text = "Table 3";
            //int c = ResultDoc1.Tables.Count;
            */
            DataTableList = new List<Table>();
            ResultDoc1.Save();
            ResultDoc1.Close();
            Wapp1.Quit();
        }
    
        public string GetScenarioTag(string TagName)
        {
            string tag = "";
            var FTags = ScenarioContext.Current.ScenarioInfo.Tags;
            foreach (string ftag in FTags)
            {
                if (ftag.Contains(TagName))
                {
                    tag = ftag.ToString();
                    tag = tag.Replace(TagName + ":", string.Empty);
                }
            }
            return tag;
        }

        public bool StoreDataTables()
        {
            bool TblExist = false;
            Table DatTbl = ScenarioContext.Current.StepContext.StepInfo.Table;
            if (DatTbl != null)
            {
                DataTableList.Add(DatTbl);
                TblExist = true;
            }
            return TblExist;
        }
        
        public void CreateAppendixTables()
        {
            this.Wapp = new Word.Application();
            Wapp.Visible = false;
            this.ResultDoc = Wapp.Documents.Open(@"C:\Surya\Work\" + FeatureContext.Current["ResultDocName"] + ".docx");
            //this.Wapp.Selection.TypeParagraph();
            if(!this.AppCreated)
            {
                object objBreak = Word.WdBreakType.wdPageBreak;
                object objUnit = Word.WdUnits.wdStory;
                this.Wapp.Selection.EndKey(ref objUnit, ref Missing);
                this.Wapp.Selection.InsertBreak(ref objBreak);
                Word.Paragraph objP = this.ResultDoc.Paragraphs.Add();
                //objP.Range.InsertParagraph();
                objP.Range.Text = "Appendix\n";
                this.AppCreated = true;
            }
            
            //this.Wapp.Selection.InsertAfter("Appendix");
            /*
            foreach (Table DataTbl in DataTableList)
            {
                int ColCnt = DataTbl.Header.Count;
                int RowCnt = DataTbl.RowCount;
                object EndOfDoc = "\\endofdoc";
                object oCollapseEnd = Word.WdCollapseDirection.wdCollapseEnd;
                Word.Table objAppTable;
                //Word.Range Range = this.ResultDoc.Bookmarks.get_Item(ref EndOfDoc).Range;
                //object start = objTbl.Range.End;
                Word.Range Range = this.ResultDoc.Content;
                Range.Collapse(ref oCollapseEnd);
                this.ResultDoc.Tables.Add(Range, RowCnt + 1, ColCnt, ref Missing, ref Missing);
                int TableCnt = this.ResultDoc.Tables.Count;
                objAppTable = this.ResultDoc.Tables[TableCnt];
                string[] ColData = DataTbl.Header.ToArray<string>();
                for (int Col = 0; Col < ColData.Length; Col++)
                {
                    objAppTable.Cell(1, Col + 1).Range.Text = ColData[Col];
                }
                int CurrRow = 2;
                TableRows DataRows = DataTbl.Rows;
                foreach (var DataRow in DataRows)
                {
                    string[] RowData = DataRow.Values.ToArray<string>();
                    for (int Row = 0; Row < RowData.Length; Row++)
                    {
                        objAppTable.Cell(CurrRow, Row).Range.Text = RowData[Row];
                    }
                    CurrRow++;
                }
                objAppTable = null;
                //Range = null;
            }
            */

            this.ResultDoc.Save();
            this.ResultDoc.Close();
            this.Wapp.Quit();

        } 
    }
    

}
