using BusinessProcesses.DataLabs.Sites;
using Framework.Actions;
using Pages.DataLabs;
using Pages.DataLabs.Data;
using Pages.DataLabs.Labs;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Labs
{
    public class BP_Lab_AssociateSitesUtilities
    {
        public static bool AssociateSite(String siteId, String siteName)
        {
            String site = siteId + " - " + siteName;
            if (!IsSiteInAssociatedSitesList(site))
            {
                if (Control_ActionUtilities.Dropdown_SelectItem(DL_Lab_AssociateSitesPage.AvailableSitesListBox, site, String.Empty))
                {
                    if (Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.AddButton, String.Empty))
                    {
                        return Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.SaveButton, String.Empty);
                    }
                }
            }
            else
            {
                return Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.CancelButton, String.Empty);
            }
            return false;
        }

        public static bool UnAssociateSite(String siteId, String siteName)
        {
            String site = siteId + " - " + siteName;
            if (IsSiteInAssociatedSitesList(site))
            {
                //if (Control_ActionUtilities.Dropdown_SelectItem(DL_Lab_AssociateSitesPage.AssociatedSitesListBox, site, String.Empty))
                if (Control_ActionUtilities.SelectItemInDualSelectDropdown(DL_Lab_AssociateSitesPage.AssociatedSitesListBox, site, String.Empty))
                {
                    if (Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.RemoveButton, String.Empty))
                    {
                        return Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.SaveButton, String.Empty);
                    }
                }
            }
            return false;
        }

        public static bool IsAssociateSitesToLabInViewMode()
        {
            return !Control_PropertyUtilities.IsEnabled(DL_Lab_AssociateSitesPage.AvailableSites) &&
                !Control_PropertyUtilities.IsEnabled(DL_Lab_AssociateSitesPage.AssociatedSites) &&
                !Control_PropertyUtilities.IsEnabled(DL_Lab_AssociateSitesPage.AddButton) &&
                !Control_PropertyUtilities.IsEnabled(DL_Lab_AssociateSitesPage.RemoveButton) &&
                !Control_PropertyUtilities.IsEnabled(DL_Lab_AssociateSitesPage.SaveButton);

            //String disableAttribute = "disabled";
            //String disableAttributeValue = "disabled";
            //bool found = false;
            //String value1 = Control_PropertyUtilities.GetAttributeValue(DL_Lab_AssociateSitesPage.AvailableSites, disableAttribute, out found);
            //String value2 = Control_PropertyUtilities.GetAttributeValue(DL_Lab_AssociateSitesPage.AssociatedSites, disableAttribute, out found);
            //String value3 = Control_PropertyUtilities.GetAttributeValue(DL_Lab_AssociateSitesPage.AddButton, disableAttribute, out found);
            //String value4 = Control_PropertyUtilities.GetAttributeValue(DL_Lab_AssociateSitesPage.RemoveButton, disableAttribute, out found);
            //String value5 = Control_PropertyUtilities.GetAttributeValue(DL_Lab_AssociateSitesPage.SaveButton, disableAttribute, out found);


            //return !String.IsNullOrEmpty(value1) && value1.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase) &&
            //    !String.IsNullOrEmpty(value2) && value2.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase) &&
            //    !String.IsNullOrEmpty(value3) && value3.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase) &&
            //    !String.IsNullOrEmpty(value4) && value4.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase) &&
            //    !String.IsNullOrEmpty(value5) && value5.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase);
        }

        public static bool IsSiteInAssociatedSitesList(String site)
        {
            return Control_ActionUtilities.Dropdown_IsItemAvailable(DL_Lab_AssociateSitesPage.AssociatedSitesListBox, site, String.Empty);
        }

        public static bool SetSearchText_AvailableSites(String searchText)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Lab_AssociateSitesPage.AvailableSites_Searchbox, searchText, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetSearchText_AssociatedSites(String searchText)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Lab_AssociateSitesPage.AssociatedSites_Searchbox, searchText, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifySearchedItems_AvailableSites(String searchText)
        {
            try
            {
                return BP_Site_AssociateLabsUtilities.VerifySearchedItems(DL_Lab_AssociateSitesPage.AvailableSitesListBox, searchText);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifySearchedItems_AssociatedSites(String searchText)
        {
            try
            {
                return BP_Site_AssociateLabsUtilities.VerifySearchedItems(DL_Lab_AssociateSitesPage.AssociatedSitesListBox, searchText);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DissociateSites(List<SiteInfo> siteInfoList)
        {
            try
            {
                List<String> sites = new List<String>();
                foreach (SiteInfo siteInfo in siteInfoList)
                {
                    sites.Add(siteInfo.Site);
                }
                Control_ActionUtilities.Dropdown_SelectItems(DL_Lab_AssociateSitesPage.AssociatedSitesListBox, sites);
                Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.RemoveButton, String.Empty);
                return Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.SaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool AssociateSites(List<SiteInfo> siteInfoList)
        {
            try
            {
                List<String> sites = new List<String>();
                foreach (SiteInfo siteInfo in siteInfoList)
                {
                    sites.Add(siteInfo.Site);
                }
                Control_ActionUtilities.Dropdown_SelectItems(DL_Lab_AssociateSitesPage.AvailableSitesListBox, sites);
                Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.AddButton, String.Empty);
                return Control_ActionUtilities.Click(DL_Lab_AssociateSitesPage.SaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifySitesInAvailableSites(List<SiteInfo> siteInfoList)
        {
            try
            {
                List<String> sites = new List<String>();
                foreach (SiteInfo siteInfo in siteInfoList)
                {
                    sites.Add(siteInfo.Site);
                }
                return Control_ActionUtilities.Dropdown_VerifyItems(DL_Lab_AssociateSitesPage.AvailableSitesListBox, sites, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}