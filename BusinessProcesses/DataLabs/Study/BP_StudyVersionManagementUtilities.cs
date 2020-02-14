using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Study;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Study
{
    public class BP_StudyVersionManagementUtilities
    {
        public static bool IsStudyAvailable()
        {
            try
            {
                IControl noStudyUploadedMsg = DL_StudyVersionManagementPage.NoStudyUploadedMessage;
                return Control_PropertyUtilities.IsControlNull(noStudyUploadedMsg);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool InvokeStudyRow(String studyStatus)
        {
            try
            {
                IControl studyTable = DL_StudyVersionManagementPage.StudyFilesTable;
                WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, studyStatus, TableColumnContentType.Text_Partial));
                IControl studyTableRow = WebTableUtilities.Table_FindRow(studyTable, searchList);
                return Control_ActionUtilities.MouseClick(studyTableRow, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static String GetStudyStatus()
        {
            return WebTableUtilities.GetValue(DL_StudyVersionManagementPage.StudyFilesTable, 1, 1);
        }

        public static bool VerifyStudyStatus(String studyLabel, String studyStatus)
        {
            try
            {
                IControl studyTable = DL_StudyVersionManagementPage.StudyFilesTable;
                WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, studyLabel, TableColumnContentType.Text));
                searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, studyStatus, TableColumnContentType.Text_Partial));
                IControl studyTableRow = WebTableUtilities.Table_FindRow(studyTable, searchList);
                return !Control_PropertyUtilities.IsControlNull(studyTableRow);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}