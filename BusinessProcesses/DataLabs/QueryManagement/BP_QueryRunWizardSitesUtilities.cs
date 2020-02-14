using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.QueryManagement;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.QueryManagement
{
    public class BP_QueryRunWizardSitesUtilities
    {
        //DL_QueryRunWizardSitesPage
        public static bool SelectSite(string site)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(2, site, TableColumnContentType.Text));

                IControl siteRow = WebTableUtilities.Table_FindRow(DL_QueryRunWizardSitesPage.SitesTable, list, 0);
                IControl checkboxCell = WebTableUtilities.GetCell(siteRow, 0);
                return Control_ActionUtilities.Click(WebTableUtilities.GetInputControl(checkboxCell), String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_QueryRunWizardSitesPage.NextButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
