using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_TableHistoryUtilities
    {
        public static bool VerifyTableChangeHistory(String tableName, List<CRF_TableHistoryData> dataList)
        {
            Utilities.BrowserUtilities.SwitchToFrame();
            try
            {
                foreach (CRF_TableHistoryData data in dataList)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    if (!String.IsNullOrEmpty(data.Name))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(0, data.Name, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.ServerTime))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.ServerTime, TableColumnContentType.Text_Partial));
                    }
                    if (!String.IsNullOrEmpty(data.Action))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(2, data.Action, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.Reason))
                    {
                        //String s = data.ReasonNotes.Replace("\\r", "\r");
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.Reason, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.AdditionalNotes))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(4, data.AdditionalNotes, TableColumnContentType.Text));
                    }

                    if (list.List.Count > 0)
                    {
                        IControl tableRow = WebTableUtilities.Table_FindRow(DL_ModalWindow_TableChangeHistory.HistoryTable, list, 1);
                        if (Control_PropertyUtilities.IsControlNull(tableRow))
                        {
                            Utilities.BrowserUtilities.SwitchToWindow();
                            return false;
                        }
                    }
                }
                Utilities.BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            Utilities.BrowserUtilities.SwitchToWindow();
            return false;
        }

        public static bool VerifyTableChangeHistoryInOrder(String tableName, List<CRF_TableHistoryData> dataList)
        {
            Utilities.BrowserUtilities.SwitchToFrame();
            try
            {
                int i = 0;
                foreach (CRF_TableHistoryData data in dataList)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    if (!String.IsNullOrEmpty(data.Name))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(0, data.Name, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.ServerTime))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.ServerTime, TableColumnContentType.Text_Partial));
                    }
                    if (!String.IsNullOrEmpty(data.Action))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(2, data.Action, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.Reason))
                    {
                        //String s = data.ReasonNotes.Replace("\\r", "\r");
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.Reason, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.AdditionalNotes))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(4, data.AdditionalNotes, TableColumnContentType.Text));
                    }

                    if (list.List.Count > 0)
                    {
                        IControl tableRow = WebTableUtilities.Table_FindRow(DL_ModalWindow_TableChangeHistory.HistoryTable, list, ++i);
                        if (Control_PropertyUtilities.IsControlNull(tableRow))
                        {
                            Utilities.BrowserUtilities.SwitchToWindow();
                            return false;
                        }
                    }
                }
                Utilities.BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            Utilities.BrowserUtilities.SwitchToWindow();
            return false;
        }

        public static bool ClickCloseButton()
        {
            bool retVal = false;
            Utilities.BrowserUtilities.SwitchToFrame();
            try
            {
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_TableChangeHistory.CloseButton);
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