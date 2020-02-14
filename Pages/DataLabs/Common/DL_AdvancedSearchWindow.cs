using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Common
{
    public class DL_AdvancedSearchWindow
    {
        public static IControl FilterSitesDropdown { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_cboSiteFiler")); } }

        public static IControl SitesTable { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_chboxlistSite")); } }

        public static IControl SearchCategoryDropdown { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_cboCategories")); } }

        public static IControl PatientIdTextbox { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtPatientID")); } }

        public static IControl SearchButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnSearch")); } }

        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnClear")); } }

        public static IControl GetSiteCheckbox(String site)
        {
            IControl table = SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_chboxlistSite"));
            ReadOnlyCollection<IControl> spanList = SyncUtilities.FindVisibleElements_Parent(table.WebElement, By.TagName("span"));

            foreach (IControl c in spanList)
            {
                IControl siteLabel = SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("label"));
                String text = Control_PropertyUtilities.GetText(siteLabel);
                if (text.Equals(site, StringComparison.InvariantCultureIgnoreCase))
                {
                    return SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("input"));
                }
            }
            return null;
        }

        public static IControl GetDataStatusCheckbox(String status)
        {
            IControl span = SyncUtilities.FindVisibleElement(By.Id("ddcl-ctl00_ctl00_CPH_body_ContentBody_DataStatus"));
            if (InvokeStatusDropdown(span))
            {
                IControl dropdownItemsHost = SyncUtilities.FindVisibleElement(By.Id("ddcl-ctl00_ctl00_CPH_body_ContentBody_DataStatus-ddw"));
                return GetStatusCheckbox(dropdownItemsHost, status);
            }
            return null;
        }

        public static IControl GetPatientStatusCheckbox(String status)
        {
            IControl span = SyncUtilities.FindVisibleElement(By.Id("ddcl-ctl00_ctl00_CPH_body_ContentBody_PatientStatus"));
            if (InvokeStatusDropdown(span))
            {
                IControl dropdownItemsHost = SyncUtilities.FindVisibleElement(By.Id("ddcl-ctl00_ctl00_CPH_body_ContentBody_PatientStatus-ddw"));
                return GetStatusCheckbox(dropdownItemsHost, status);
            }
            return null;
        }

        public static IControl GetSignatureStatusCheckbox(String status)
        {
            IControl span = SyncUtilities.FindVisibleElement(By.Id("ddcl-ctl00_ctl00_CPH_body_ContentBody_SignStatus"));
            if (InvokeStatusDropdown(span))
            {
                IControl dropdownItemsHost = SyncUtilities.FindVisibleElement(By.Id("ddcl-ctl00_ctl00_CPH_body_ContentBody_SignStatus-ddw"));
                return GetStatusCheckbox(dropdownItemsHost, status);
            }
            return null;
        }

        static IControl GetStatusCheckbox(IControl parent, String status)
        {
            ReadOnlyCollection<IControl> statusCheckboxHostList = SyncUtilities.FindVisibleElements_Parent(parent.WebElement, By.ClassName("ui-dropdownchecklist-item"));
            foreach (IControl c in statusCheckboxHostList)
            {
                IControl statusLabel = SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("label"));
                if (Control_PropertyUtilities.GetText(statusLabel).Equals(status, StringComparison.InvariantCultureIgnoreCase))
                {
                    return SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("input"));
                }
            }
            return null;
        }

        static bool InvokeStatusDropdown(IControl parent)
        {
            IControl dropdownInvoker = SyncUtilities.FindVisibleElement_Parent(parent.WebElement, By.ClassName("ui-dropdownchecklist-selector"));
            return Control_ActionUtilities.Click(dropdownInvoker, String.Empty);
        }
    }
}