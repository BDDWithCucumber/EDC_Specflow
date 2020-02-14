using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Main.DCF;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.Main.DCF
{
    public class BP_DCF_DraftDCFsPage
    {
        public static bool OpenDCF(int dcfID)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, dcfID.ToString(), TableColumnContentType.Link));
                IControl row = WebTableUtilities.Table_FindRow(DL_DCF_DraftDCFsPage.DCFSearchResultsTable, list, 1);
                if (!Control_PropertyUtilities.IsControlNull(row))
                {
                    IControl dcfIdLink = WebTableUtilities.GetElement(row, dcfID.ToString(), 1, TableColumnContentType.Link);
                    return Control_ActionUtilities.Click(dcfIdLink, String.Empty);
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
