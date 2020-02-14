using BusinessProcesses.DataLabs.Pager;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
   public class BP_MRR_AddUtilities
    {
        //public static bool IsMrrExists(string RefID)
        //{
        //    IControl c = GetMRRTableRow(RefID);
        //    return c != null;
        //}

        //public static IControl GetMRRTableRow(String RefID)
        //{
        //    ReadOnlyCollection<IControl> rows = null;
        //    if (WebTableUtilities.GetRowCount(DL_Lab_ManageReferenceRanges.MRRTable, out rows) > 0)
        //    {
        //        return FindMrrRow(RefID);
        //    }
        //    return null;
        //}

        //static IControl FindMrrRow(String RefID)
        //{
        //    BP_PagerUtilities.NavigateToFirstPage(DL_Lab_ManageReferenceRanges.Pager1);
        //    do
        //    {
        //        IControl labRow = FindRow(RefID);
        //        if (labRow != null)
        //        {
        //            return labRow;
        //        }
        //    }
        //    while (BP_PagerUtilities.NavigateToNextPage(DL_Lab_ManageReferenceRanges.Pager1));

        //    return null;
        //}

        //static IControl FindRow(String RefID)
        //{
        //    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
        //    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, RefID, TableColumnContentType.Link));
        //    IControl MrrRow = WebTableUtilities.Table_FindRow(DL_Lab_ManageReferenceRanges.MRRTable, searchList);
        //    if (MrrRow != null)
        //    {
        //        return MrrRow;
        //    }
        //    return null;
        //}

        //public static bool AddMRRData(MRRData mrr)
        //{
        //    try
        //    {
        //        MrrCreationUtilities.SetLabData(DL_Lab_ManageReferenceRanges.AddMRRTable, mrr);
        //        Control_ActionUtilities.Click(DL_Lab_ManageReferenceRanges_Actions.Savebutton, String.Empty);
        //        return BP_LabManagementUtilities.IsLabIdExists(lab.LabId);
        //    }
        //    catch (Exception e)
        //    {
        //        new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
        //    }
        //    return false;
        //}
    }
}
