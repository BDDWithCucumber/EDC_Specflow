using BusinessProcesses.DataLabs.Pager;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients.Form;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients.Form
{
    public class BP_CRF_CommentsTabUtilities
    {
        public static bool VerifyComments(List<CRF_CommentsData> commentList)
        {
            try
            {
                foreach (CRF_CommentsData data in commentList)
                {
                    if (!VerifyComment(data))
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

        public static bool VerifyComment(CRF_CommentsData data)
        {
            BP_CRF_Comments_PagerUtilities.NavigateToFirstPage();
            do
            {
                WebTable_SearchCriteriaItemList searchList = GetSearchList(data);
                if (searchList.List.Count > 0)
                {
                    IControl commentsRow = WebTableUtilities.Table_FindRow(DL_FormPage.CRF_CommentsTable, searchList);
                    if (commentsRow != null && commentsRow.WebElement != null)
                    {
                        return true;
                    }
                }
            }
            while (BP_CRF_Comments_PagerUtilities.NavigateToNextPage());
            return false;
        }

        public static bool IsNoDataFoundMessageAvailable()
        {
            try
            {
                return !Control_PropertyUtilities.IsControlNull(DL_FormPage.Comments_NoDataFoundMessage);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static WebTable_SearchCriteriaItemList GetSearchList(CRF_CommentsData data)
        {
            WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
            if (!String.IsNullOrEmpty(data.QuestionNumberOrForm))
            {
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, data.QuestionNumberOrForm, TableColumnContentType.Text));
            }
            if (!String.IsNullOrEmpty(data.Question))
            {
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.Question, TableColumnContentType.Text));
            }
            if (!String.IsNullOrEmpty(data.Value))
            {
                list.AddSearchItem(new WebTable_SearchCriteriaItem(2, data.Value, TableColumnContentType.Text));
            }
            if (!String.IsNullOrEmpty(data.Comment))
            {
                list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.Comment, TableColumnContentType.Text));
            }
            if (!String.IsNullOrEmpty(data.DateTime))
            {
                list.AddSearchItem(new WebTable_SearchCriteriaItem(4, data.DateTime, TableColumnContentType.Text_Partial));
            }
            return list;
        }
    }
}