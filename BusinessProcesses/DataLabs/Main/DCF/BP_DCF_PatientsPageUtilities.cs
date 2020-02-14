using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Main.DCF;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Main.DCF
{
    public class BP_DCF_PatientsPageUtilities
    {
        public static bool OpenDraftDCFs(String patient,int draftDCFsCount)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, patient, TableColumnContentType.Text));
                IControl row = WebTableUtilities.Table_FindRow(DL_DCF_PatientsPage.PatientsTable, list, 1);
                if (!Control_PropertyUtilities.IsControlNull(row))
                {
                    IControl link = WebTableUtilities.GetElement(row, draftDCFsCount.ToString(), 2, TableColumnContentType.Link);
                    if (!Control_PropertyUtilities.IsControlNull(link))
                    {
                        return Control_ActionUtilities.Click(link, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}