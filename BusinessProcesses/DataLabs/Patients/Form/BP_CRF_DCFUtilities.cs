using BusinessProcesses.DataLabs.Pager;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Patients.Form;
using System;
using System.Collections.ObjectModel;
using Pages.DataLabs.Data;
using System.Collections.Generic;
using System.Threading;
using Utilities;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients.Form
{
    public class BP_CRF_DCFUtilities
    {
        public static bool OpenSubTabUnderDCFTab(String dcfSubTabName)
        {
            try
            {
                IControl tabHeader = DL_FormPage.GetSubTabUnderDCFTabInForm(dcfSubTabName);
                Control_ActionUtilities.Click(DL_FormPage.GetSubtabHeaderLinkToOpen(tabHeader,dcfSubTabName), String.Empty);
                IControl openedTabHeader = DL_FormPage.GetSubTabUnderDCFTabInForm(dcfSubTabName);
                bool found = false;
                String value = Control_PropertyUtilities.GetAttributeValue(openedTabHeader, "class", out found);
                return found && value.Contains("selected");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyDCFs(List<CRF_DCFTabData> dataList)
        {
            try
            {
                foreach (CRF_DCFTabData data in dataList)
                {
                    if (!VerifyDCF(data))
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyDCF(CRF_DCFTabData data)
        {
            bool retVal = false;
            int i = 0;
            try
            {
                while (retVal || i < 120)
                {
                    ++i;
                    IControl row = GetRowFromActiveDCFsSubTab(data);
                    retVal = !Control_PropertyUtilities.IsControlNull(row);
                    Thread.Sleep(1000);
                    if (!retVal)
                    {
                        BrowserUtilities.RefreshPage();
                        BP_FormUtilities.OpenMainTabInForm("DCFs");
                        OpenSubTabUnderDCFTab("All");
                    }
                    else
                    {
                        return retVal;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return retVal;
        }

        public static bool OpenDCFRow(CRF_DCFTabData data)
        {
            IControl row = GetRowFromActiveDCFsSubTab(data);
            if (!Control_PropertyUtilities.IsControlNull(row))
            {
                return Control_ActionUtilities.MouseClick(row, String.Empty);
            }
            return false;
        }

        static int GetNumberOfQueriesFromHeaderText(String dcfSubTabName)
        {
            try
            {
                IControl tabHeader = DL_FormPage.GetSubTabUnderDCFTabInForm(dcfSubTabName);
                String text = Control_PropertyUtilities.GetText(tabHeader);
                if (!String.IsNullOrEmpty(text))
                {
                    String s1 = text.Replace(dcfSubTabName, String.Empty);
                    String s2 = s1.Replace("(", String.Empty);
                    String s3 = s2.Replace(")", String.Empty);
                    int queryCount = -1;
                    if (int.TryParse(s3, out queryCount))
                    {
                        return queryCount;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return -1;
        }

        static int GetNumberOfQueriesFromRowsCount(String dcfSubTabNamme)
        {
            int rowCount = 0;
            try
            {
                BP_CRF_DCF_PagerUtilites.NavigateToFirstPage();
                do
                {
                    ReadOnlyCollection<IControl> rows = null;
                    rowCount += WebTableUtilities.GetRowCount(DL_FormPage.ActiveDCFsSubTabTable, out rows);
                }
                while (BP_CRF_DCF_PagerUtilites.NavigateToNextPage());
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return rowCount;
        }

        static IControl GetRowFromActiveDCFsSubTab(CRF_DCFTabData data)
        {
            try
            {
                BP_CRF_DCF_PagerUtilites.NavigateToFirstPage();
                do
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    if (!String.IsNullOrEmpty(data.DCFID))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.DCFID, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.Status))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(2, data.Status, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.QueryDescription))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.QueryDescription, TableColumnContentType.Text));
                    }
                    if (!String.IsNullOrEmpty(data.DateTime))
                    {
                        list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.DateTime, TableColumnContentType.Text_Partial));
                    }

                    IControl webTable = DL_FormPage.ActiveDCFsSubTabTable;
                    IControl tableRow = WebTableUtilities.Table_FindRow(webTable, list);
                    if (!Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                        return tableRow;
                    }
                }
                while (BP_CRF_DCF_PagerUtilites.NavigateToNextPage());
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }
    }
}