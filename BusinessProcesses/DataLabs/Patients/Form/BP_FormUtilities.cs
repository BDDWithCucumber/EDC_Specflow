using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs;
using Pages.DataLabs.Patients.Form;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients.Form
{
    public class BP_FormUtilities
    {
        public static bool IsFormInvoked(String eventName, String formName)
        {
            try
            {
                IControl crfHeaderTable = DL_CRFPage.CRFHeaderTable;
                if (!Control_PropertyUtilities.IsControlNull(crfHeaderTable))
                {
                    WebTable_SearchCriteriaItem item1 = new WebTable_SearchCriteriaItem(1, "Event:" + eventName, TableColumnContentType.Text);
                    WebTable_SearchCriteriaItem item2 = new WebTable_SearchCriteriaItem(1, "CRF:" + formName, TableColumnContentType.Text);
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(item1);
                    list.AddSearchItem(item2);

                    IControl row = WebTableUtilities.Table_FindRow(crfHeaderTable, list);
                    bool resutl = !Control_PropertyUtilities.IsControlNull(row);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool OpenMainTabInForm(String mainTabName)
        {
            try
            {
                IControl tabHeader = DL_FormPage.GetMainTabHeaderInForm(mainTabName);
                return Control_ActionUtilities.Click(tabHeader, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsTabAvailable(string tabName, out bool verified)
        {
            verified = false;
            try
            {
                IControl tabHeader = DL_FormPage.GetMainTabHeaderInForm_NoWait(tabName);
                verified = true;
                return !Control_PropertyUtilities.IsControlNull(tabHeader);

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}