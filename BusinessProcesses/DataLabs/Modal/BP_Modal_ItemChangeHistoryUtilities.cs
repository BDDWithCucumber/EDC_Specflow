using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_ItemChangeHistoryUtilities
    {
        public static bool VerifyChangeHistory(List<CRF_ItemChangeHistoryData> dataList)
        {
            Utilities.BrowserUtilities.SwitchToFrame();
            try
            {
                foreach (CRF_ItemChangeHistoryData data in dataList)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    if (!String.IsNullOrEmpty(data.DateTime))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(0, data.DateTime, TableColumnContentType.Text_Partial));
                    }
                    if (!String.IsNullOrEmpty(data.Response))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.Response, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.ReasonNotes))
                    {
                        String s = data.ReasonNotes.Replace("\\r", "\r");
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(2, s, TableColumnContentType.Text));
                    }

                    if (list.List.Count > 0)
                    {
                        IControl tableRow = WebTableUtilities.Table_FindRow(DL_ModalWindow_ItemChangeHistory.HistoryTable, list, 1);
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
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_ItemChangeHistory.CloseButton);
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