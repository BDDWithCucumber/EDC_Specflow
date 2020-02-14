using BusinessProcesses.DataLabs.Pager;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Sites;
using Pages.DataLabs.Pager;
using System;
using System.Collections.ObjectModel;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Sites
{
    public class BP_SiteManagementUtilities
    {
        public static bool OpenSite(string siteId, string siteName)
        {
            IControl siteLink = GetSiteLink(siteId, siteName);
            if (siteLink != null)
            {
                return Control_ActionUtilities.Click(siteLink, String.Empty);
            }
            return false;
        }

        public static bool IsSiteAvailableInSiteManagementPage(String site)
        {
            try
            {
                String[] sList = site.Split('-');
                if (sList.Length == 2)
                {
                    IControl siteLink = GetSiteLink(sList[0], sList[1]);
                    return !Control_PropertyUtilities.IsControlNull(siteLink);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static IControl GetSiteRow(String siteId, String siteName)
        {
            ReadOnlyCollection<IControl> rows = null;
            if (WebTableUtilities.GetRowCount(DL_SiteManagementPage.SitesTable, out rows) > 1)
            {
                return FindSiteRow(siteId, siteName);
            }
            return null;
        }
        static IControl GetSiteLink(String siteId, String siteName)
        {
            IControl labRow = GetSiteRow(siteId, siteName);
            if (labRow != null)
            {
                return WebTableUtilities.GetElement(labRow, siteId + "-" + siteName, 0, TableColumnContentType.Link);
            }
            return null;
        }
        static IControl FindSiteRow(String siteId, String siteName)
        {
            if (HasPages())
            {
                return FindSiteInAllPages(siteId, siteName);
            }
            else
            {
                return FindSite(siteId, siteName);
            }
        }
        static bool HasPages()
        {
            IControl goToFirstPageIcon = DL_Pagination1.GetFirstPageIcon(DL_SiteManagementPage.Pager);
            return !Control_PropertyUtilities.IsControlNull(goToFirstPageIcon);
        }
        static IControl FindSiteInAllPages(String siteId, String siteName)
        {
            BP_PagerUtilities1.NavigateToFirstPage(DL_SiteManagementPage.Pager);
            do
            {
                IControl siteRow = FindSite(siteId, siteName);
                if (siteRow != null)
                {
                    return siteRow;
                }
            }
            while (BP_PagerUtilities1.NavigateToNextPage(DL_SiteManagementPage.Pager));

            return null;
        }
        static IControl FindSite(String siteId, String siteName)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, siteId + "-" + siteName, TableColumnContentType.Link));
            IControl labRow = WebTableUtilities.Table_FindRow(DL_SiteManagementPage.SitesTable, searchList);
            if (labRow != null)
            {
                return labRow;
            }
            return null;
        }
    }
}