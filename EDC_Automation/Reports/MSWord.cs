using Word = Microsoft.Office.Interop.Word;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace EDC_Automation.Reports
{
    class MSWord
    {
        public Word.Document OpenResultDocTemplateNSave(string DocName, string SaveLocation)
        {
            Word.Application Wapp = new Word.Application();
            Wapp.Visible = false;
            Word.Document Doc = Wapp.Documents.Open(@"C:\Surya\Work\ATS_Temp.docx");
            Word.Paragraph Para = Doc.Paragraphs.Add();
            Para.Range.Bold = 1;
            Para.Range.Text = "Test Script:     " + FeatureContext.Current.FeatureInfo.Title + "    Run #1 \n";
            Para.Range.Bold = 0;
            Para.Range.Text = "Description:     " + FeatureContext.Current.FeatureInfo.Description + " \n";
            Para.Range.Text = "Application Name: \n";
            Para.Range.Text = "Version: \n";
            Para.Range.Text = "Environment: \n\n";
            object Missing = System.Reflection.Missing.Value;
            object EndOfDoc = "\\endofdoc";
            Word.Table TableObj;
            Word.Range Range = Doc.Bookmarks.get_Item(ref EndOfDoc).Range;
            TableObj = Doc.Tables.Add(Range, 1, 6, Missing, Missing);
            TableObj.Cell(1, 1).Range.Text = "Step #";
            TableObj.Cell(1, 2).Range.Text = "Req ID";
            TableObj.Cell(1, 3).Range.Text = "Action(s)";
            TableObj.Cell(1, 4).Range.Text = "Expected Result(s)";
            TableObj.Cell(1, 5).Range.Text = "Actual Result";
            TableObj.Cell(1, 6).Range.Text = "Comments";
            TableObj.Rows[1].Range.Bold = 1;
            TableObj.Borders.Enable = 1;
            Doc.SaveAs2(SaveLocation + DocName + ".docx");
            Doc.Close();
            Wapp.Quit();
            return Doc;
        }
    }
}
