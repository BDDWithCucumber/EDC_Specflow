using System;
using System.Collections.Generic;
using Pages.DataLabs.Data;
using BusinessProcesses.DataLabs.Pager;
using Common.WebTable;
using Pages.DataLabs.Patients.Form;
using Interfaces;
using Framework;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients.Form
{
    public class BP_CRF_WorkflowUtilities
    {
        public static bool VerifyWorkflowItems(List<CRF_WorkflowTabData> dataList)
        {
            try
            {
                foreach (CRF_WorkflowTabData data in dataList)
                {
                    if (!VerifyWorkflowItem(data))
                    {
                        return false;
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyWorkflowItem(CRF_WorkflowTabData data)
        {
            BP_CRF_Workflow_PagerUtilities.NavigateToFirstPage();
            do
            {
                WebTable_SearchCriteriaItemList list = GetSearchList(data);
                if(list.List.Count > 0)
                {
                    IControl commentsRow = WebTableUtilities.Table_FindRow(DL_FormPage.CRF_WorkflowTable, list);
                    if (commentsRow != null && commentsRow.WebElement != null)
                    {
                        return true;
                    }
                }
            }
            while (BP_CRF_Workflow_PagerUtilities.NavigateToNextPage());
            return false;
        }

        static WebTable_SearchCriteriaItemList GetSearchList(CRF_WorkflowTabData data)
        {
            WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
            if (!String.IsNullOrEmpty(data.Action))
            {
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, data.Action, TableColumnContentType.Text));
            }
            if (!String.IsNullOrEmpty(data.DateTime))
            {
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.DateTime, TableColumnContentType.Text_Partial));
            }
            return list;
        }
    }
}
