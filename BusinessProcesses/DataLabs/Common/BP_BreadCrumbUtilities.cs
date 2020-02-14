using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.DataLabs.Common;
using Pages.DataLabs.Data;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Common
{
    public static class BP_BreadCrumbUtilities
    {
        public static bool HasBreadCrumbItems(IControl breadCrumbContainer, String itemsWithCommaSeparation, out String errorItem)
        {
            String[] breadCrumbItemArray = itemsWithCommaSeparation.Split(',');
            List<String> breadCrumbItemList = new List<String>();
            foreach (String item in breadCrumbItemArray)
            {
                breadCrumbItemList.Add(item);
            }
            return HasBreadCrumbItems(breadCrumbContainer, breadCrumbItemList, out errorItem);
        }

        public static bool HasBreadCrumbItems(IControl breadCrumbContainer, IEnumerable<BreadCrumbData> dataList)
        {
            String errorItem = String.Empty;
            List<String> breadCrumbItemList = new List<String>();
            foreach (BreadCrumbData breadCrumbData in dataList)
            {
                breadCrumbItemList.Add(breadCrumbData.BreadCrumb);
            }
            return HasBreadCrumbItems(breadCrumbContainer, breadCrumbItemList, out errorItem);
        }

        public static bool HasBreadCrumbItems(IControl breadCrumbContainer, List<String> breadCrumbItemTextList, out String errorItem)
        {
            errorItem = String.Empty;
            foreach (String breadCrumbItemText in breadCrumbItemTextList)
            {
                errorItem = breadCrumbItemText;
                if (GetBreadCrumbItem(breadCrumbContainer, breadCrumbItemText) == null)
                {
                    String message = "Breadcrumb " + errorItem + " doesn't exist";
                    new DebugLogGenerator().WriteLog(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, message);
                    return false;
                }
            }
            return true;
        }

        public static bool ClickBreadCrumbItem(String breadCrumbItemText)
        {
            IControl breadCrumbContainer = DL_CommonObjects.BreadCrumbContainer;
            IControl breadCrumbItem = BP_BreadCrumbUtilities.GetClickableBreadCrumbItem(breadCrumbContainer, breadCrumbItemText);
            if (!Control_PropertyUtilities.IsControlNull(breadCrumbItem))
            {
                return Control_ActionUtilities.Click(breadCrumbItem, "Unable to click breadCrumbItem " + breadCrumbItemText);
            }
            return false;
        }

        public static IControl GetBreadCrumbItem(IControl breadCrumbContainer, String breadCrumbItemText)
        {
            try
            {
                if (breadCrumbContainer != null && breadCrumbContainer.WebElement != null)
                {
                    ReadOnlyCollection<IControl> items = SyncUtilities.FindVisibleElements_Parent(breadCrumbContainer.WebElement, By.TagName("li"));
                    foreach (IControl c in items)
                    {
                        if (c.WebElement.Text.Equals(breadCrumbItemText, StringComparison.InvariantCultureIgnoreCase))
                        {
                            return c;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        public static IControl GetClickableBreadCrumbItem(IControl breadCrumbContainer, String breadCrumbItemText)
        {
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(breadCrumbContainer))
                {
                    return SyncUtilities.FindElement_Parent(breadCrumbContainer.WebElement, By.LinkText(breadCrumbItemText));
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }
    }
}