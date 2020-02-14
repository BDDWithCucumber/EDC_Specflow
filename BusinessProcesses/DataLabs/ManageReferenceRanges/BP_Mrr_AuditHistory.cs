using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_Mrr_AuditHistory
    {
        public static string ReadtheRefID()
        {
            DL_Lab_MRR_Table.NavigateToLastPage(DL_Lab_MRR_Table.Pager);
            System.Collections.ObjectModel.ReadOnlyCollection<IControl> rows = null;
            int rowCount = WebTableUtilities.GetRowCount(DL_Lab_MRR_Table.MrrTable, out rows);            
            string refID = WebTableUtilities.GetValue(DL_Lab_MRR_Table.MrrTable, rowCount-1, 1);
            return refID;            
        }        
        public static bool VerifyTheValuesInChangeHistory(string field, string value)
        {            
            Utilities.BrowserUtilities.SwitchToFrame();
            try
            {
                if(field.Equals("Lab Name"))
                {
                    string labName = Control_PropertyUtilities.GetText(DL_Lab_Mrr_AuditHistory.LabNameInChangeHistoryWindow);
                    return labName.Equals(value);
                }
                else if(field.Equals("Lab TestName"))
                {
                    string labTestName = Control_PropertyUtilities.GetText(DL_Lab_Mrr_AuditHistory.LabTestNameInChangeHistoryWindow);
                    return labTestName.Equals(value);
                }
                else if(field.Equals("Heading"))
                {
                    string heading = Control_PropertyUtilities.GetText(DL_Lab_Mrr_AuditHistory.HeadingInChangeHistoryWindow);
                    return heading.Equals(value);
                }
                else if(field.Equals("Ref ID"))
                {
                    string refId = Control_PropertyUtilities.GetText(DL_Lab_Mrr_AuditHistory.RefIDInChangeHistoryWindow);
                    return refId.Contains(value);
                }
               // Utilities.BrowserUtilities.SwitchToWindow();
            }
            catch (Exception e)
            {
                new Reports.DebugLog.DebugLogGenerator().WriteException(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            Utilities.BrowserUtilities.SwitchToWindow();
            return false;
        }

        public static bool VerifyTheActionButtonInChangeHistoryWindow(string button)
        {
            Utilities.BrowserUtilities.SwitchToFrame();
            try
            {
                if (button.Equals("Print"))
                {
                    return Control_PropertyUtilities.IsEnabled(DL_Lab_Mrr_AuditHistory.PrintButtonInChangeHistoryWindow);
                }
                else if (button.Equals("Close"))
                {
                    return Control_PropertyUtilities.IsEnabled(DL_Lab_Mrr_AuditHistory.CloseButtonInChangeHistoryWindow);
                }               
            }
            catch (Exception e)
            {
                new Reports.DebugLog.DebugLogGenerator().WriteException(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            //Utilities.BrowserUtilities.SwitchToWindow();
            return false;
        }

        public static bool VerifyChangeHistory(List<Mrr_ChangeHistoryData> dataList)
        {
            Utilities.BrowserUtilities.SwitchToFrame();
            try
            {
                for (int i = 0; i < dataList.Count; ++i)
                {
                    Mrr_ChangeHistoryData data = dataList[i];
                    IControl historyRow = DL_Lab_Mrr_AuditHistory.GetHistoryRow(i);
                    if(!IsDataMatched(data, historyRow))
                    {
                        Utilities.BrowserUtilities.SwitchToWindow();
                        return false;
                    }
                }
                Utilities.BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new Reports.DebugLog.DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            Utilities.BrowserUtilities.SwitchToWindow();
            return false;
        }

        static bool IsDataMatched(Mrr_ChangeHistoryData data, IControl historyRow)
        {
            try
            {
                IControl dateTimeCell = DL_Lab_Mrr_AuditHistory.GetDateTimeCell_Row(historyRow);
                IControl referenceRangeCell = DL_Lab_Mrr_AuditHistory.GetReferenceRangeCell_Row(historyRow);
                IControl actionCell = DL_Lab_Mrr_AuditHistory.GetActionCell_Row(historyRow);

                String dateTimeText = Control_PropertyUtilities.GetText(dateTimeCell);
                dateTimeText.Trim();
                String referenceRangeText = Control_PropertyUtilities.GetText(referenceRangeCell);
                referenceRangeText.Trim();
                String actionText = Control_PropertyUtilities.GetText(actionCell);

                if (!dateTimeText.Contains(data.DateTime.Replace("\\r", "\r")))
                {
                    return false;
                }
                if(!referenceRangeText.Equals(data.ReferenceRange.Replace("\\r", "\r"), StringComparison.InvariantCultureIgnoreCase))
                {
                    return false;
                }
                if(!actionText.Equals(data.Action, StringComparison.InvariantCultureIgnoreCase))
                {
                    return false;
                }
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool ClickNA()
        {
            return (Control_ActionUtilities.Click(DL_Lab_Mrr_AuditHistory.NAfilter,"Not able to click Filter Icon for NA in MRR Screen"));
        }
        public static  string GetNAFilterValueYes()
        {
            return (Control_PropertyUtilities.GetText(DL_Lab_Mrr_AuditHistory.NAfilterValueYes));
        }
        public static string GetNAFilterValueNo()
        {
            return (Control_PropertyUtilities.GetText(DL_Lab_Mrr_AuditHistory.NAfilterValueNo));
        }
        public static bool PerformTheAction(string button)
        {
            bool retVal = false;
            Utilities.BrowserUtilities.SwitchToFrame();
            try
            {
                if(button.Equals("Close"))
                {
                    retVal = Control_ActionUtilities.ClickModalButton(DL_Lab_Mrr_AuditHistory.CloseButtonInChangeHistoryWindow);
                }
                else if(button.Equals("Print"))
                {
                    retVal = Control_ActionUtilities.ClickModalButton(DL_Lab_Mrr_AuditHistory.PrintButtonInChangeHistoryWindow);
                }
                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            Utilities.BrowserUtilities.SwitchToWindow();
            return retVal;
        }

    }        
    }

