using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.ManageReferenceRanges
{
    public class DL_Lab_Mrr_AuditHistory
    {
        public static IControl LabNameInChangeHistoryWindow { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_CPH_body_ContentBody_lblLabFullName")); } }

        public static IControl LabTestNameInChangeHistoryWindow { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_CPH_body_ContentBody_lblLabTestName")); } }

        public static IControl HeadingInChangeHistoryWindow { get { return SyncUtilities.FindVisibleElement(By.ClassName("banner")); } }

        public static IControl NAfilterValueYes
        {
            get { return SyncUtilities.FindElement(By.XPath("/html/body/div[5]/form/div/label[1]"));}
        }
        public static IControl NAfilterValueNo
        {
            get{ return SyncUtilities.FindElement(By.XPath("/html/body/div[5]/form/div/label[2]"));}
        }
        public static IControl NAfilter
        {
            get { return SyncUtilities.FindElement(By.XPath("/html/body/form/div[4]/div/div/div[4]/table/tbody/tr/td/div[2]/div/div/div[1]/div[2]/div[3]/div[2]/div/table/thead/tr[1]/th[11]/a[1]")); }
        }

        public static IControl RefIDInChangeHistoryWindow
        {
            get
            {
                IControl changeHistory = SyncUtilities.FindVisibleElement(By.ClassName("change-history"));
                return SyncUtilities.FindVisibleElement_Parent(changeHistory.WebElement, By.XPath("//body/div/div[3]")); } }

        public static IControl PrintButtonInChangeHistoryWindow
        {
            get
            {
                IControl changeHistory = SyncUtilities.FindVisibleElement(By.ClassName("change-history"));
                IControl historyTable = SyncUtilities.FindVisibleElement_Parent(changeHistory.WebElement, By.ClassName("history-table"));
              //  IControl footerSection = SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.ClassName("footer no-print"));
                return SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.Name("btnPrint"));
            } }

        public static IControl CloseButtonInChangeHistoryWindow
        {
            get
            {
                IControl changeHistory = SyncUtilities.FindVisibleElement(By.ClassName("change-history"));
                IControl historyTable = SyncUtilities.FindVisibleElement_Parent(changeHistory.WebElement, By.ClassName("history-table"));
                //IControl footerSection = SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.ClassName("history-rows"));
                return SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.Name("btnClose"));
            }
        }

        public static ReadOnlyCollection<IControl> HistoryTable()
        {
            
                IControl changeHistory = SyncUtilities.FindVisibleElement(By.ClassName("change-history"));
                IControl historyTable = SyncUtilities.FindVisibleElement_Parent(changeHistory.WebElement, By.ClassName("history-table"));
                IControl historyRows = SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.ClassName("history-rows"));
                IControl historyRow = SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.ClassName("history-row"));
                return SyncUtilities.FindVisibleElements_Parent(historyTable.WebElement, By.ClassName("history-row"));
            
        }

        public static ReadOnlyCollection<IControl> HistoryTableRows
        {
            get
            {
                ReadOnlyCollection<IControl> historyTableRows = HistoryTable();
                if (historyTableRows != null && historyTableRows.Count > 0)
                {
                    return historyTableRows;
                }
                return null;
            }
        }

        public static IControl DateTimeColDataInChangeHistoryTable
        {
            get
            {
                //IControl changeHistory = SyncUtilities.FindVisibleElement(By.ClassName("change-history"));
                //IControl historyTable = SyncUtilities.FindVisibleElement_Parent(changeHistory.WebElement, By.ClassName("history-table"));
                //IControl historyRows = SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.ClassName("history-rows"));
                //IControl historyRow = SyncUtilities.FindVisibleElement_Parent(historyRows.WebElement, By.ClassName("history-row"));
                //IControl dateTimeCol = SyncUtilities.FindVisibleElement_Parent(historyRow.WebElement, By.ClassName("column datetime"));
                //return SyncUtilities.FindVisibleElement_Parent(dateTimeCol.WebElement, By.XPath(""));
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_rptChangeHistory_ctl00_lblDateTime"));
            }
        }

        public static IControl GetHistoryRow(int rowIndex)
        {
            ReadOnlyCollection<IControl> rows = SyncUtilities.FindElements(By.ClassName("history-row"));
            if(rowIndex < rows.Count)
            {
                return rows[rowIndex];
            }
            return null;
        }

        public static IControl refRangeColDataInChangeHistoryTable
        {
            get
            {
                //IControl changeHistory = SyncUtilities.FindVisibleElement(By.ClassName("change-history"));
                //IControl historyTable = SyncUtilities.FindVisibleElement_Parent(changeHistory.WebElement, By.ClassName("history-table"));
                //IControl historyRows = SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.ClassName("history-rows"));
                //IControl historyRow = SyncUtilities.FindVisibleElement_Parent(historyRows.WebElement, By.ClassName("history-row"));
                //IControl refRangeCol = SyncUtilities.FindVisibleElement_Parent(historyRow.WebElement, By.ClassName("column referencerange"));
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_rptChangeHistory_ctl00_lblChangeData"));
            }
        }

        public static IControl actionColDataInChangeHistoryTable
        {
            get
            {
                //IControl changeHistory = SyncUtilities.FindVisibleElement(By.ClassName("change-history"));
                //IControl historyTable = SyncUtilities.FindVisibleElement_Parent(changeHistory.WebElement, By.ClassName("history-table"));
                //IControl historyRows = SyncUtilities.FindVisibleElement_Parent(historyTable.WebElement, By.ClassName("history-rows"));
                //IControl historyRow = SyncUtilities.FindVisibleElement_Parent(historyRows.WebElement, By.ClassName("history-row"));
                //IControl actionCol = SyncUtilities.FindVisibleElement_Parent(historyRow.WebElement, By.ClassName("column reason"));
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_rptChangeHistory_ctl01_lblReason"));
            }
        }

        public static IControl GetDateTimeCell_Row(IControl historyRow)
        {
            return SyncUtilities.FindVisibleElement_Parent(historyRow.WebElement, By.ClassName("datetime"));
        }

        public static IControl GetReferenceRangeCell_Row(IControl historyRow)
        {
            return SyncUtilities.FindVisibleElement_Parent(historyRow.WebElement, By.ClassName("referencerange"));
        }

        public static IControl GetActionCell_Row(IControl historyRow)
        {
            return SyncUtilities.FindVisibleElement_Parent(historyRow.WebElement, By.ClassName("reason"));
        }
    }
}
