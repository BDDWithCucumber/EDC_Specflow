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
    public class BP_CRF_MainPageUtilities
    {
        public static bool OpenPatient(String patient)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, patient, TableColumnContentType.Text));
                IControl row = WebTableUtilities.Table_FindRow(DL_CRF_MainPage.PatientsTable, list, 2);
                IControl patientLink = WebTableUtilities.GetElement(row, patient, 0, TableColumnContentType.Link);
                return Control_ActionUtilities.Click(patientLink, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

    }
}
