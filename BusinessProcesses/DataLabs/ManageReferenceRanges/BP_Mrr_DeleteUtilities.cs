using Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using Pages.DataLabs.ManageReferenceRanges;
using Framework.Actions;
using Framework;
using Pages.DataLabs.Data;
using System.Reflection;
using Reports.DebugLog;
using System.Collections.ObjectModel;
using Common.WebTable;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_Mrr_DeleteUtilities
    {       
       public static bool SelectViewDeletedReferenceRanges()
        {
            try
            {
                IControl chkBox = DL_Lab_Mrr_Delete.ViewDeletedReferenceRangesCheckBox;
                if (Control_PropertyUtilities.IsControlNull(chkBox))
                {
                    return false;
                }
                return Control_ActionUtilities.CheckCheckbox(chkBox);
            }
            catch (Exception e)
            {
               new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool UnSelectViewDeletedReferenceRanges()
        {
            try
            {
                IControl chkBox = DL_Lab_Mrr_Delete.ViewDeletedReferenceRangesCheckBox;
                if (Control_PropertyUtilities.IsControlNull(chkBox))
                {
                    return false;
                }
                return Control_ActionUtilities.UncheckCheckbox(chkBox);
            }
            catch (Exception e)
            {
                 new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        
        public static bool SelectTheRecord(List<RowIndex> rows)
        {
            try
            {
                foreach (RowIndex rowindex in rows)
                {
                    int rowindexinint = int.Parse(rowindex.Row);
                    IControl row = WebTableUtilities.GetRowByRowIndex(DL_Lab_MRR_Table.MrrTable, rowindexinint);
                    if (!Control_PropertyUtilities.IsControlNull(row))
                    {
                        IControl checkbox = DL_Lab_Mrr_Delete.Checkbox(row);
                         Control_ActionUtilities.ClickWithoutVerify(checkbox, String.Empty);
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
        public static bool verifyTheCheckBoxForTheDeletedRecords(List<RowIndex> rows)
        {
            try
            {
                foreach (RowIndex rowindex in rows)
                {
                    int rowindexinint = int.Parse(rowindex.Row);
                    IControl row = WebTableUtilities.GetRowByRowIndex(DL_Lab_MRR_Table.MrrTable, rowindexinint);
                    if (!Control_PropertyUtilities.IsControlNull(row))
                    {
                        IControl checkbox = DL_Lab_Mrr_Delete.Checkbox(row);
                        return Control_PropertyUtilities.IsControlNull(checkbox);
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
        public static bool ClickOnDeleteButton()
        {
            try
            {
                IControl deleteButton = DL_Lab_Mrr_Delete.DeleteButton;
                if (Control_PropertyUtilities.IsControlNull(deleteButton))
                {
                    return false;
                }
                return Control_ActionUtilities.Click(deleteButton, "not able to click on delete button");
            }
            catch (Exception e)
            {
                 new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        } 
        public static List<String> GetTheRefIDS(List<RowIndex> rows)
        {
            try
            {
                List<string> refIds = new List<string>();
                foreach (RowIndex rowindex in rows)
                {
                    int rowindexinint = int.Parse(rowindex.Row);
                    IControl row = WebTableUtilities.GetRowByRowIndex(DL_Lab_MRR_Table.MrrTable, rowindexinint);
                    if (!Control_PropertyUtilities.IsControlNull(row))
                    {
                        IControl refId = WebTableUtilities.GetCell(row, 1);
                        refIds.Add(Control_PropertyUtilities.GetText(refId));
                    }
                }
                return refIds;

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }
        public static bool VeifyTheStrikeThroughRecords(string refID)
        {
            try
            {
                bool recordFoundInStrikeThroughMode = false;  
                    
                    DL_Lab_MRR_Table.NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                    do
                    {                     
                        
                        WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                        searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, refID, TableColumnContentType.Text));
                        IControl row = WebTableUtilities.Table_FindRow(DL_Lab_MRR_Table.MrrTable, searchList, 0);
                        
                        if (!Control_PropertyUtilities.IsControlNull(row))
                        {
                            IControl strikedRow = DL_Lab_Mrr_Delete.StrikeThroughRow;
                            IControl checkboxForDeletedRecord = DL_Lab_Mrr_Delete.Checkbox(row);

                            if (Control_PropertyUtilities.IsControlNull(strikedRow) && Control_PropertyUtilities.IsControlNull(checkboxForDeletedRecord))
                            {
                               recordFoundInStrikeThroughMode = true;
                            }
                        }

                    }
                    while (DL_Lab_MRR_Table.NavigateToNextPage(DL_Lab_MRR_Table.Pager));
                return recordFoundInStrikeThroughMode;

            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VeifyTheRecords(string refID)
        {
            try
            {
                bool recordFound = false;

                DL_Lab_MRR_Table.NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                do
                {

                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, refID, TableColumnContentType.Text));
                    IControl row = WebTableUtilities.Table_FindRow(DL_Lab_MRR_Table.MrrTable, searchList, 0);

                    if (Control_PropertyUtilities.IsControlNull(row))
                    {
                        recordFound = true;
                    }

                }
                while (DL_Lab_MRR_Table.NavigateToNextPage(DL_Lab_MRR_Table.Pager));
                return recordFound;

            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool RecordsVerificationForCancel(string refID)
        {
            try
            {
                bool recordFound = false;

                DL_Lab_MRR_Table.NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                do
                {

                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, refID, TableColumnContentType.Text));
                    IControl row = WebTableUtilities.Table_FindRow(DL_Lab_MRR_Table.MrrTable, searchList, 0);

                    if (!Control_PropertyUtilities.IsControlNull(row))
                    {
                        recordFound = true;
                    }

                }
                while (DL_Lab_MRR_Table.NavigateToNextPage(DL_Lab_MRR_Table.Pager));
                return recordFound;

            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VeifyTheIconsForTheDeletedRecords(string refID, string action)
        {
            try
            {               
                    DL_Lab_MRR_Table.NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                    do
                    {
                        WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                        searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, refID, TableColumnContentType.Text));
                        IControl row = WebTableUtilities.Table_FindRow(DL_Lab_MRR_Table.MrrTable, searchList, 0);
                        if (!Control_PropertyUtilities.IsControlNull(row))
                        {
                            IControl actionsCell = WebTableUtilities.GetCell(row, 13);
                            IControl icon = DL_Lab_MRR_Table.GetActionIcon(actionsCell, action);
                            if (action.Equals("Edit") || action.Equals("Delete"))
                            {
                                return Control_PropertyUtilities.IsControlNull(icon);
                            }
                            else if (action.Equals("History") || action.Equals("Copy"))
                            {
                                return Control_PropertyUtilities.IsEnabled(icon);
                            }
                        }
                    }
                    while (DL_Lab_MRR_Table.NavigateToNextPage(DL_Lab_MRR_Table.Pager));                
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool DeleteTheRecordUsingDeleteIcon(string refID, string action)
        {
            try
            {
                DL_Lab_MRR_Table.NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                do
                {
                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, refID, TableColumnContentType.Text));
                    IControl row = WebTableUtilities.Table_FindRow(DL_Lab_MRR_Table.MrrTable, searchList, 0);
                    if (!Control_PropertyUtilities.IsControlNull(row))
                    {
                        IControl actionsCell = WebTableUtilities.GetCell(row, 13);
                        IControl icon = DL_Lab_MRR_Table.GetActionIcon(actionsCell, action);
                        return Control_ActionUtilities.Click(icon, String.Empty);

                    }
                }
                while (DL_Lab_MRR_Table.NavigateToNextPage(DL_Lab_MRR_Table.Pager));
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

    }
}
