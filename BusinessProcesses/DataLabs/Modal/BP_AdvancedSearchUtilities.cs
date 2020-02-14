using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Common;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_AdvancedSearchUtilities
    {
        public static bool AreSitesAvailable(IEnumerable<String> sites)
        {
            bool retval = false;
            try
            {
                BrowserUtilities.SwitchToFrame();
                List<String> siteList = (List<String>)sites;
                foreach (String site in siteList)
                {
                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, site, TableColumnContentType.CheckboxAndText));
                    IControl row = WebTableUtilities.Table_FindRow(DL_AdvancedSearchWindow.SitesTable, searchList, 1);
                    if (Control_PropertyUtilities.IsControlNull(row))
                    {
                        retval = false;
                    }
                }
                retval = true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retval;
        }

        public static bool SetStatus(String status, String statusType)
        {
            bool retVal = false; 
            try
            {
                BrowserUtilities.SwitchToFrame();
                if (statusType.Equals("Patient Status", StringComparison.InvariantCultureIgnoreCase))
                {
                    retVal = Control_ActionUtilities.ClickModalButton(DL_AdvancedSearchWindow.GetPatientStatusCheckbox(status));
                }
                else if (statusType.Equals("Data Stauts", StringComparison.InvariantCultureIgnoreCase))
                {
                    retVal = Control_ActionUtilities.ClickModalButton(DL_AdvancedSearchWindow.GetDataStatusCheckbox(status));
                }
                else if (statusType.Equals("Signature Status", StringComparison.InvariantCultureIgnoreCase))
                {
                    retVal = Control_ActionUtilities.ClickModalButton(DL_AdvancedSearchWindow.GetSignatureStatusCheckbox(status));
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool SetPatientID(String patientID)
        {
            bool retVal = false;
            try
            {
                BrowserUtilities.SwitchToFrame();
                retVal = Control_ActionUtilities.Textbox_SetText(DL_AdvancedSearchWindow.PatientIdTextbox, patientID, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool ClickSearchButton()
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                retVal = Control_ActionUtilities.ClickModalButton(DL_AdvancedSearchWindow.SearchButton);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }
    }
}