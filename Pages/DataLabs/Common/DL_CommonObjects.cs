using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.ObjectModel;
using System.Threading;
using Utilities;

namespace Pages.DataLabs.Common
{
    public class DL_CommonObjects
    {
        public static IControl PortalDropdown { get { return SyncUtilities.FindElement(By.Id("ucBreadcrumbs_ddlPortal")); } }
        public static IControl SiteManagementLink { get { return SyncUtilities.FindElement(By.XPath("//*[@id=\"StudyAdminCategories_Group_Management_link\"]/a")); } }
        public static IControl BreadCrumbContainer
        {
            get
            {
                return SyncUtilities.FindElement(By.ClassName("bcrumb"));
            }
        }

        public static IControl DS_BreadCrumbContainer
        {
            get
            {
                return SyncUtilities.FindElement(By.ClassName("bcrumbRow"));
            }
        }

        public static IControl GetActiveFilterItem(String filterCriteria)
        {
            IControl activeFilters = GetActiveFilters();
            if (activeFilters != null)
            {
                return GetFilterCriteriaItem(activeFilters, filterCriteria);
            }
            return null;
        }
        static IControl GetFilterCriteriaItem(IControl activeFilters, String filterCriteria)
        {
            ReadOnlyCollection<IControl> list = SyncUtilities.FindVisibleElements_Parent(activeFilters.WebElement, By.TagName("li"));
            foreach (IControl c in list)
            {
                if (c.WebElement.Text.Equals(filterCriteria, StringComparison.InvariantCultureIgnoreCase))
                {
                    return c;
                }
            }
            return null;
        }
        static IControl GetActiveFilters()
        {
            ReadOnlyCollection<IControl> list = SyncUtilities.FindElements(By.CssSelector("div[class='k-animation-container']"));
            foreach (IControl c in list)
            {
                if (c.WebElement.GetCssValue("display").Equals("block", StringComparison.InvariantCultureIgnoreCase))
                {
                    return c;
                }
            }
            return null;
        }

        public static IControl SiteDropDown { get { return SyncUtilities.FindElement(By.Id("ucBreadcrumbs_ddlSites")); } } 

        public static IControl SiteSelectionDropDown { get { return new Control(SiteDropDown.WebElement, new SelectElement(SiteDropDown.WebElement)); } }
        public static IControl SuccessMessage(string Message)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//td[@id='tdConfirmMsg']/b[text()='" + Message + "']"));
        }
    }
}