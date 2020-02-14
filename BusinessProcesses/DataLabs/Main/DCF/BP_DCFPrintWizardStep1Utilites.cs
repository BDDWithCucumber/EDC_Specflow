using System;
using System.Collections.Generic;
using Pages.DataLabs.Data;
using Interfaces;
using Pages.DataLabs.Main.DCF;
using Framework.Actions;
using Common.WebTable;
using Framework;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Main.DCF
{
    public class BP_DCFPrintWizardStep1Utilites
    {
        public static bool VerifyDCFs(IEnumerable<DCFPrintWizardStep1Data> dataList)
        {
            try
            {
                foreach (DCFPrintWizardStep1Data data in dataList)
                {
                    IControl table = DL_DCFPrintWizardStep1Page.DCFsTable;
                    if (!Control_PropertyUtilities.IsControlNull(table))
                    {
                        WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                        if (!String.IsNullOrEmpty(data.PatientID))
                        {
                            list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.PatientID, TableColumnContentType.Text)); 
                        }
                        if (!String.IsNullOrEmpty(data.DCFID))
                        {
                            list.AddSearchItem(new WebTable_SearchCriteriaItem(2, data.DCFID, TableColumnContentType.Text));
                        }
                        if (!String.IsNullOrEmpty(data.Status))
                        {
                            list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.Status, TableColumnContentType.Text));
                        }
                        if (!String.IsNullOrEmpty(data.QueryDescription))
                        {
                            list.AddSearchItem(new WebTable_SearchCriteriaItem(4, data.QueryDescription, TableColumnContentType.Text));
                        }

                        IControl row = WebTableUtilities.Table_FindRow(table, list, 2);
                        if(Control_PropertyUtilities.IsControlNull(row) || !VerifyPrintCheckboxValue(row, data))
                        {
                            return false;
                        }
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool VerifyPrintCheckboxValue(IControl row, DCFPrintWizardStep1Data data)
        {
            try
            {
                if (!String.IsNullOrEmpty(data.IsPrintEnabled))
                {
                    if (!Control_PropertyUtilities.IsControlNull(row))
                    {
                        IControl printCheckbox = WebTableUtilities.GetElement(row, String.Empty, 5, TableColumnContentType.Checkbox);
                        if (!Control_PropertyUtilities.IsControlNull(printCheckbox))
                        {
                            bool found = false;
                            String checkedValue = Control_PropertyUtilities.GetAttributeValue(printCheckbox, "checked", out found);
                            return found;
                        }
                    }
                    return false;
                }
                else
                {
                    return true;
                }
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
                return Control_ActionUtilities.Click(DL_DCFPrintWizardStep1Page.NextButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}