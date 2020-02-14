using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Main.CRF;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Main.CRF
{
    public class BP_SubmitCRFsUtilities
    {
        public static bool SelectForm(String formName)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, formName, TableColumnContentType.Text));
                IControl row = WebTableUtilities.Table_FindRow(DL_SubmitCRFsPage.FormsTable, list, 1);
                IControl cell = WebTableUtilities.GetCell(row, 1);
                IControl checkbox = WebTableUtilities.GetInputControl(cell);
                return Control_ActionUtilities.Click(checkbox, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_SubmitCRFsPage.SaveButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
