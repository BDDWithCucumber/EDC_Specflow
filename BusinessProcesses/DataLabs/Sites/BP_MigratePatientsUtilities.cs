using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Sites;
using Pages.DataLabs.Data;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Sites
{
    public class BP_MigratePatientsUtilities
    {
        public static bool SelectePatients(List<SiteManagementMigratePatientsData> patients)
        {
            bool isSuccess = false;
            try
            {
                foreach (SiteManagementMigratePatientsData patient in patients)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(0, patient.PatientID, TableColumnContentType.Text));
                    IControl patientRow = WebTableUtilities.Table_FindRow(DL_MigratePatientsPage.PatientsTable, list, 0);
                    IControl checkboxCell = WebTableUtilities.GetCell(patientRow, 2);
                    IControl checkbox = WebTableUtilities.GetInputControl(checkboxCell);
                    bool found = false;
                    String propValue = Control_PropertyUtilities.GetAttributeValue(checkbox, "checked", out found);
                    if (!found)
                    {
                        isSuccess = Control_ActionUtilities.Click(checkbox, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return isSuccess;
        }

        public static bool ClickSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_MigratePatientsPage.SaveButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}