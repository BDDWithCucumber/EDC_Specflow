using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.DerivationManagement;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.DerivationManagement
{
    public class BP_DerivationRunWizardSitesUtilities
    {
        public static bool SelectSite(string site)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(2, site, TableColumnContentType.Text));

                IControl siteRow = WebTableUtilities.Table_FindRow(DL_DerivationRunWizardSitesPage.SitesTable, list, 0);
                IControl checkboxCell = WebTableUtilities.GetCell(siteRow, 0);
                return Control_ActionUtilities.Click(WebTableUtilities.GetInputControl(checkboxCell), String.Empty);

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_DerivationRunWizardSitesPage.NextButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectPatient(string PatientID)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(2, PatientID, TableColumnContentType.Text));

                IControl patRow = WebTableUtilities.Table_FindRow(DL_DerivationRunWizardSitesPage.PatientsTable, list, 0);
                IControl checkboxCell = WebTableUtilities.GetCell(patRow, 0);
                return Control_ActionUtilities.Click(WebTableUtilities.GetInputControl(checkboxCell), String.Empty);

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
