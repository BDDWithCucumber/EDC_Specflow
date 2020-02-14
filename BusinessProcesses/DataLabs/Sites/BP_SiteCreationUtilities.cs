using BusinessProcesses.DataLabs.Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Sites;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using Pages.DataLabs.Common;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Sites
{
    public class BP_SiteCreationUtilities
    {
        public static bool IsSiteSaved()
        {
            IControl addSiteBreadCrumbItem = BP_BreadCrumbUtilities.GetBreadCrumbItem(DL_CommonObjects.BreadCrumbContainer, "Add Site");
            if (addSiteBreadCrumbItem == null)
            {
                return true;
            }
            return false;
        }

        public static void SetSiteData(IControl siteTable, SiteData site)
        {
            SetSiteFieldData_Text(siteTable, "Site ID:", site.SiteId);
            SetSiteFieldData_Text(siteTable, "Site Name:", site.SiteName);
            SetSiteFieldData_Text(siteTable, "Address 1:", site.Address1);
            SetSiteFieldData_Text(siteTable, "Address 2:", site.Address2);
            SetSiteFieldData_Text(siteTable, "Address 3:", site.Address3);
            SetSiteFieldData_Text(siteTable, "Address 4:", site.Address4);
            SetSiteFieldData_Text(siteTable, "City/Town:", site.City);
            SetSiteFieldData_Text(siteTable, "State/Province:", site.State);
            SetSiteFieldData_Text(siteTable, "Zip/Postal Code:", site.Zip);
            SetSiteFieldData_Dropdown(siteTable, "ISO Country:", site.ISOCountry);
            //SetSiteFieldData_Text(siteTable, "Country:", site.Country);
            SetSiteFieldData_Text(siteTable, "Phone:", site.Phone);
            SetSiteFieldData_Text(siteTable, "Fax:", site.Fax);
            SetSiteFieldData_Dropdown(siteTable, "Site Status:", site.SiteStatus);
            SetSiteFieldData_Dropdown(siteTable, "DCF Workflow:", site.DCFWorkflow);
            SetSiteFieldData_Dropdown(siteTable, "External Source:", site.ExternalSource);
            SetSiteFieldData_Text(siteTable, "External ID:", site.ExternalId);
        }

        static bool SetSiteFieldData_Text(IControl siteTable, String searchText, String valueToSet)
        {
            if (valueToSet != null)
            {
                IControl row = WebTableUtilities.Table_FindRow(siteTable, GetSearchItemList(searchText));
                IControl textbox = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Textbox);
                return Control_ActionUtilities.Textbox_SetText(textbox, valueToSet, String.Empty);
            }
            return false;
        }

        static bool SetSiteFieldData_Dropdown(IControl siteTable, String searchText, String valueToSet)
        {
            if (valueToSet != null)
            {
                IControl row = WebTableUtilities.Table_FindRow(siteTable, GetSearchItemList(searchText));
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

        public static bool AddSite(List<SiteData> siteList)
        {
            if (siteList.Count == 0)
            {
                return false;
            }
            return BP_SiteCreationUtilities.EnterSiteData(siteList[0]);
        }

        public static bool EnterSiteData(SiteData site)
        {
            BP_SiteCreationUtilities.SetSiteData(DL_AddSitePage.AddSiteTable, site);
            Control_ActionUtilities.Click_PerssEnterKey(DL_AddSitePage.SaveButton, String.Empty);
            return IsSiteSaved();
        }

        public static bool AddSites(IEnumerable<SiteData> sites, out List<String> failSiteList)
        {
            failSiteList = new List<String>();
            foreach (SiteData site in sites)
            {
                BP_ActionPaletteUtilities.InvokeActionPaletteLink("Add Site", "SiteListActions");
                if (!BP_SiteCreationUtilities.EnterSiteData(site))
                {
                    failSiteList.Add(site.SiteId);
                    Control_ActionUtilities.Click(DL_AddSitePage.CancelButton, String.Empty);
                }
            }
            //return failSiteList.Count == 0;
            return true;
        }

        public static bool OpenSubTab(String subTabName)
        {
            IControl subTabHeader = DL_AddSitePage.GetSubTabHeader(subTabName);
            return Control_ActionUtilities.Click(subTabHeader, String.Empty);
        }

        public static bool IsLabExistInLabsTableOfSite(LabData labData)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, labData.LabId, TableColumnContentType.Text));
                IControl siteRow = WebTableUtilities.Table_FindRow(DL_AddSitePage.ActiveSubTabTable, list, 1);
                if (siteRow != null)
                {
                    bool isLabNameExist = WebTableUtilities.HasText(siteRow, 1, labData.LaboratoryName);
                    bool isCompanyExist = WebTableUtilities.HasText(siteRow, 2, labData.Company);
                    bool isdepartmentExist = WebTableUtilities.HasText(siteRow, 3, labData.Department);
                    bool isStatusExist = WebTableUtilities.HasText(siteRow, 6, labData.LaboratoryStatus);
                    new DebugLogGenerator().WriteLog(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name,
                        "Lab Name Exists - " + isLabNameExist.ToString() 
                                             + ",Company Exists - " + isCompanyExist.ToString()
                                             + ",Department Exists - " + isdepartmentExist.ToString()
                                             + ",Status Exists - " + isStatusExist.ToString());
                    return isLabNameExist && isCompanyExist && isdepartmentExist && isStatusExist;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool OpenLab(String labId)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, labId, TableColumnContentType.Text));
                IControl labRow = WebTableUtilities.Table_FindRow(DL_AddSitePage.ActiveSubTabTable, list, 1);
                if (labRow != null)
                {
                    IControl labIdLink = WebTableUtilities.GetElement(labRow, labId, 0, TableColumnContentType.Link);
                    return Control_ActionUtilities.Click(labIdLink, String.Empty);
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
