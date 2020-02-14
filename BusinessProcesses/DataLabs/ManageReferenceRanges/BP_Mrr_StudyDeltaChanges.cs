using BusinessProcesses.DataLabs.Inbox;
using BusinessProcesses.DataLabs.Main;
using BusinessProcesses.DataLabs.Study;
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
    public class BP_Mrr_StudyDeltaChanges
    {
        public static bool FindLabTest(String labId)
        {
            IControl labLink = BP_ManageReferenceRange_MRRUtilities.GetLabTestLink(labId);
            if (labLink != null)
            {
                return true;
            }
            return false;
        }      

         public static bool FindValueInUnit(String emptyValue)
        {
            IControl unitCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 11);
            string unitValue = Control_PropertyUtilities.GetText(unitCell);
            if (unitValue != null)
            {
                return true;
            }
            return true;
        }

        public static bool PublishStudy(String studyLabel)
        {
            try
            {
               // BP_ActionPaletteUtilities.InvokeActionPaletteLink("Manage Versions", "StudyResetAction");
                
                    //BP_ActionPaletteUtilities.InvokeActionPaletteLink("Upload Study File", "StudyVersionMgmtListActions");
                    //BP_UploadStudyFileUtilities.ClickFileBrowseButton();
                    //BP_UploadStudyFileUtilities.UploadStudy(studyFileName, studyLabel);
                    //BP_StudyVersionManagementUtilities.InvokeStudyRow("Uploaded");
                    //BP_ActionPaletteUtilities.InvokeActionPaletteLink("Stage", "StudyVersionPropertiesActions");
                    //BP_StudyVersionManagementUtilities.InvokeStudyRow("Staged");
                    //BP_ActionPaletteUtilities.InvokeActionPaletteLink("Publish", "StudyVersionPropertiesActions");
                    BP_MainNavigationUtilities.SelectPrimaryTabOnMenu("Inbox");
                    String jobText = "Publishing of Study file (" + studyLabel + ") - complete.";
                    return BP_InboxUtilities.CheckInbox_Subject_FromTop("Jobs", new List<String> { jobText });
                
                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool AreMRRRecordsAvailableWithDetails(IEnumerable<ReferenceRangesData> mrrRecords, out List<ReferenceRangesData> mismatchedLabs)
        {
            mismatchedLabs = new List<ReferenceRangesData>();
            foreach (ReferenceRangesData mrr in mrrRecords)
            {
                IControl labRow = GetLabRow(mrr.StartDate);
                if (labRow != null)
                {
                }
                else
                {
                }
            }
            return mismatchedLabs.Count == 0;
        }

        public static IControl GetLabRow(String labId)
        {
            ReadOnlyCollection<IControl> rows = null;
            if (WebTableUtilities.GetRowCount(DL_Lab_MRR_Table.MrrTable, out rows) > 0)
            {
                return FindLabRow(labId);
            }
            return null;
        }

        public static int GetRowCount(IControl webTable, out ReadOnlyCollection<IControl> rows)
        {
            rows = null;
            if (webTable != null && webTable.WebElement != null)
            {
                rows = WebTableUtilities.GetRows(webTable);
                return rows.Count;
            }
            return 0;
        }

        static IControl FindLabRow(String labId)
        {
            DL_Lab_MRR_Table.NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
            do
            {
                IControl labRow = FindRow(labId);
                if (labRow != null)
                {
                    return labRow;
                }
            }
            while (DL_Lab_MRR_Table.NavigateToNextPage(DL_Lab_MRR_Table.Pager));

            return null;
        }

        static IControl FindRow(String labId)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(2, labId, TableColumnContentType.Link));
            IControl labRow = WebTableUtilities.Table_FindRow(DL_Lab_MRR_Table.MrrTable, searchList);
            if (labRow != null)
            {
                return labRow;
            }
            return null;
        }
    }
}
