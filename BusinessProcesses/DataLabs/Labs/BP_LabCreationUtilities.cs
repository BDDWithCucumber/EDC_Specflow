using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using System.Text;
using Pages.DataLabs.Labs;
using Pages.DataLabs.Common;
using BusinessProcesses.DataLabs.Common;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Labs
{
    public class BP_LabCreationUtilities
    {
        public static void SetLabData(IControl labTable, LabData lab)
        {
            SetLabFieldData_Text(labTable, "Lab ID: *", lab.LabId);
            SetLabFieldData_Text(labTable, "Laboratory Name: *", lab.LaboratoryName);
            SetLabFieldData_Text(labTable, "Company: *", lab.Company);
            SetLabFieldData_Text(labTable, "Department:", lab.Department);
            SetLabFieldData_Text(labTable, "Address 1:", lab.Address1);
            SetLabFieldData_Text(labTable, "Address 2:", lab.Address2);
            SetLabFieldData_Text(labTable, "Address 3:", lab.Address3);
            SetLabFieldData_Text(labTable, "City/Town:", lab.City);
            SetLabFieldData_Text(labTable, "State/Province:", lab.State);
            SetLabFieldData_Text(labTable, "Zip/Postal Code:", lab.Zip);
            SetLabFieldData_Dropdown(labTable, "ISO Country: *", lab.ISOCountry);
            //SetLabFieldData_Text(labTable, "Country:", lab.Country);
            SetLabFieldData_Text(labTable, "Phone:", lab.Phone);
            SetLabFieldData_Text(labTable, "Fax:", lab.Fax);
            SetLabFieldData_Dropdown(labTable, "Laboratory Status: *", lab.LaboratoryStatus);
            SetLabFieldData_Text(labTable, "Contact Person:", lab.ContactPerson);
        }
        static bool SetLabFieldData_Text(IControl labTable, String searchText, String valueToSet)
        {
            if (valueToSet != null)
            {
                IControl row = WebTableUtilities.Table_FindRow(labTable, GetSearchItemList(searchText));
                IControl textbox = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Textbox);
                return Control_ActionUtilities.Textbox_SetText(textbox, valueToSet, String.Empty);
            }
            return false;
        }
        static bool SetLabFieldData_Dropdown(IControl labTable, String searchText, String valueToSet)
        {
            if (valueToSet != null)
            {
                IControl row = WebTableUtilities.Table_FindRow(labTable, GetSearchItemList(searchText));
                IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Dropdown);
                return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
            }
            return false;
        }
        static WebTable_SearchCriteriaItemList GetSearchItemList(String cellText)
        {
            WebTable_SearchCriteriaItem item = new WebTable_SearchCriteriaItem(0, cellText, TableColumnContentType.Text);
            WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
            list.AddSearchItem(item);
            return list;
        }
        public static bool AddLab(LabData lab)
        {
            try
            {
                BP_LabCreationUtilities.SetLabData(DL_AddLabPage.AddLabTable, lab);
                Control_ActionUtilities.Click(DL_AddLabPage.SaveButton, String.Empty);
                return BP_LabManagementUtilities.IsLabIdExists(lab.LabId);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


        public static List<String> GetErrorList()
        {
            List<String> errorList = new List<String>();
            String error1 = GetErrorString("Lab ID: *");
            if (!String.IsNullOrEmpty(error1))
            {
                errorList.Add("Lab ID - " + error1);
            }

            String error2 = GetErrorString("Laboratory Name: *");
            if (!String.IsNullOrEmpty(error2))
            {
                errorList.Add("Laboratory Name - " + error2);
            }

            String error3 = GetErrorString("Company: *");
            if (!String.IsNullOrEmpty(error3))
            {
                errorList.Add("Company - " + error3);
            }

            String error4 = GetErrorString("ISO Country: *");
            if (!String.IsNullOrEmpty(error4))
            {
                errorList.Add("ISO Country - " + error4);
            }

            String error5 = GetErrorString("Laboratory Status: *");
            if (!String.IsNullOrEmpty(error5))
            {
                errorList.Add("Laboratory Status - " + error5);
            }
            return errorList;
        }
        public static String GetErrorString(String columnName)
        {
            IControl statusRow = WebTableUtilities.Table_FindRow(DL_AddLabPage.AddLabTable, GetSearchItemList(columnName));
            IControl span = WebTableUtilities.GetElement(statusRow, String.Empty, 1, TableColumnContentType.Span);
            if (Control_PropertyUtilities.IsControlVisible(span))
            {
                return Control_PropertyUtilities.GetText(span);
            }
            return String.Empty;
        }
        public static bool IsErrorMessageShown(String columnName,String errorMessage)
        {
            String actualErrorMessage = BP_LabCreationUtilities.GetErrorString(columnName);
            return actualErrorMessage.Equals(errorMessage, StringComparison.InvariantCultureIgnoreCase);            
        }
        public static String GetErrorMessageForMismatch(List<LabData> mismatchedLabs)
        {
            StringBuilder error = new StringBuilder();
            error.Append("Created labs are not present in labs grid, mismatched labs are ");
            for (int i = 0; i < mismatchedLabs.Count; ++i)
            {
                if (i != 0)
                {
                    error.Append(", ");
                }
                error.Append(mismatchedLabs[i].LabId);
            }
            return error.ToString();
        }
        public static bool IsSiteExistInSitesTableOfLab(SiteData siteData)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, siteData.SiteId, TableColumnContentType.Text));
                IControl siteRow = WebTableUtilities.Table_FindRow(DL_AddLabPage.SitesTable, list, 0);
                if (siteRow != null)
                {
                    bool siteNameExist = WebTableUtilities.HasText(siteRow, 1, siteData.SiteName);
                    bool cityExist = WebTableUtilities.HasText(siteRow, 2, siteData.City);
                    bool stateExist = WebTableUtilities.HasText(siteRow, 3, siteData.State);
                    bool countryExist = WebTableUtilities.HasText(siteRow, 4, siteData.Country);
                    bool siteStatusExist = WebTableUtilities.HasText(siteRow, 5, siteData.SiteStatus);
                    return siteNameExist && cityExist && stateExist && countryExist && siteStatusExist;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool IsNoRecordsMessageExistInSitesTable()
        {
            IControl c = DL_AddLabPage.NoRecordsToDisplayDiv;
            return c != null && !Control_PropertyUtilities.IsControlNull(c);
        }

        public static bool VerifyLabsAssociatedSuccessMsg()
        {
            if(!Control_PropertyUtilities.IsControlNull(DL_AddLabPage.LabAssSuccessMsg))
            {
                return Control_PropertyUtilities.IsControlVisible(DL_AddLabPage.LabAssSuccessMsg);
            }
            else
            {
                return false;
            }
        }
    }
}
