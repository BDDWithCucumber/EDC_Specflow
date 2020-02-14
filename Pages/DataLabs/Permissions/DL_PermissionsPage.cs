using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;
using static Pages.DataLabs.Permissions.DL_PermissionsPage;

namespace Pages.DataLabs.Permissions
{
    public class DL_PermissionsPage
    {
        public static IControl SaveButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("GroupPermissions_btnSaveTop"));
            }
        }
        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("GroupPermissions_btnCancelTop"));
            }
        }

        public static IControl GetPermissionValue(String category, String permissionName, String permissionType, out PermissionValue permissionValue)
        {
            permissionValue = PermissionValue.None;
            IControl c = null;
            if (!String.IsNullOrEmpty(category) && !String.IsNullOrEmpty(permissionName) && !String.IsNullOrEmpty(permissionType))
            {
                category = category.Replace(" ", String.Empty);
                String id = "Permissions_" + category;

                permissionName = permissionName.Replace(" ", String.Empty);
                permissionName = permissionName.Replace("/", String.Empty);
                permissionType = permissionType.Replace(" ", String.Empty);

                ReadOnlyCollection<IControl> rows = SyncUtilities.FindElements(By.Id(id));
                foreach (IControl row in rows)
                {
                    IControl cell = SyncUtilities.FindElement_Parent(row.WebElement, By.Id(permissionName));
                    if (cell.WebElement != null)
                    {
                        return GetCell(row, permissionType, out permissionValue);
                    }
                }
            }
            return c;
        }

        public static IControl GetPermissionStatus(String category, String permissionName, String permissionType, out PermissionStatus permissionStatus)
        {
            permissionStatus = PermissionStatus.None;
            IControl c = null;
            if (!String.IsNullOrEmpty(category) && !String.IsNullOrEmpty(permissionName) && !String.IsNullOrEmpty(permissionType))
            {
                category = category.Replace(" ", String.Empty);
                String id = "Permissions_" + category;

                permissionName = permissionName.Replace(" ", String.Empty);
                permissionName = permissionName.Replace("/", String.Empty);
                permissionType = permissionType.Replace(" ", String.Empty);

                ReadOnlyCollection<IControl> rows = SyncUtilities.FindElements(By.Id(id));
                foreach (IControl row in rows)
                {
                    IControl cell = SyncUtilities.FindElement_Parent(row.WebElement, By.Id(permissionName));
                    if (cell.WebElement != null)
                    {
                        return GetCellStatus(row, permissionType, out permissionStatus);
                    }
                }
            }
            return c;
        }


        public static IControl PermissionsSaveButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("GroupPermissions_btnSaveTop"));
            }
        }

        public static IControl GetPermissionForCategory(String Category, String Permission)
        {
            return SyncUtilities.FindElement(By.XPath("//*[@id='" + Category + "']/following::td[@id='" + Permission + "']"));
        }

        public static IControl GetPermissionsCategoryRow(String category, out bool hasCategory)
        {
            hasCategory = false;
            IControl c = null;
            if (!String.IsNullOrEmpty(category))
            {
                category = category.Replace(" ", String.Empty);
                string rowId = "Category_" + category;
                c = SyncUtilities.FindElement(By.Id(rowId));
                hasCategory = c.WebElement != null;
            }
            return c;
        }

        public static IControl GetExpandCollapseImage_CategoryRow(String category, out bool isExpanded)
        {
            IControl image = null;
            isExpanded = false;
            bool hasCategory = false;
            IControl categoryRow = GetPermissionsCategoryRow(category, out hasCategory);
            if (hasCategory && categoryRow.WebElement != null)
            {
                ReadOnlyCollection<IControl> cells = SyncUtilities.FindElements_Parent(categoryRow.WebElement, By.TagName("td"));
                if (cells.Count > 0)
                {
                    IControl expandCollapseCell = cells[0];
                    image = SyncUtilities.FindElement_Parent(expandCollapseCell.WebElement, By.TagName("img"));
                    if (image.WebElement != null)
                    {
                        String propertyValue = image.WebElement.GetAttribute("src");
                        isExpanded = propertyValue.Contains("collapse");
                    }
                }
            }
            return image;
        }

        static IControl GetCell(IControl row, String permissionType, out PermissionValue permissionValue)//,out bool found)
        {
            permissionValue = PermissionValue.None;
            //found = false;
            IControl c = null;
            IControl cell = null;
            ReadOnlyCollection<IControl> cells = SyncUtilities.FindElements_Parent(row.WebElement, By.TagName("td"));
            if (permissionType.Equals("Allow", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[2];
            }
            else if (permissionType.Equals("Deny", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[3];
            }
            else if (permissionType.Equals("Hide", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[4];
            }
            else if (permissionType.Equals("View", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[5];
            }
            else if (permissionType.Equals("Edit", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[6];
            }

            if (cell != null)
            {
                c = SyncUtilities.FindElement_Parent(cell.WebElement, By.TagName("input"));
                if (c.WebElement != null)
                {
                    //found = true;
                    String propValue = c.WebElement.GetAttribute("checked");
                    if (String.IsNullOrEmpty(propValue))
                    {
                        permissionValue = PermissionValue.False;
                    }
                    else if (propValue.Equals("true", StringComparison.InvariantCultureIgnoreCase))
                    {
                        permissionValue = PermissionValue.True;
                    }
                }
                else
                {
                    permissionValue = PermissionValue.None;
                }
            }
            return c;
        }

        static IControl GetCellStatus(IControl row, String permissionType, out PermissionStatus permissionStatus)//,out bool found)
        {
            permissionStatus = PermissionStatus.None;
            //found = false;
            IControl c = null;
            IControl cell = null;
            ReadOnlyCollection<IControl> cells = SyncUtilities.FindElements_Parent(row.WebElement, By.TagName("td"));
            if (permissionType.Equals("Allow", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[2];
            }
            else if (permissionType.Equals("Deny", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[3];
            }
            else if (permissionType.Equals("Hide", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[4];
            }
            else if (permissionType.Equals("View", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[5];
            }
            else if (permissionType.Equals("Edit", StringComparison.InvariantCultureIgnoreCase))
            {
                cell = cells[6];
            }

            if (cell != null)
            {
                c = SyncUtilities.FindElement_Parent(cell.WebElement, By.TagName("input"));
                if (c.WebElement != null)
                {
                    //found = true;
                    Boolean propStatus = c.WebElement.Enabled;
                    if (!propStatus)
                    {
                        permissionStatus = PermissionStatus.Disabled;
                    }
                    else if (propStatus)
                    {
                        permissionStatus = PermissionStatus.Enabled;
                    }
                }
                else
                {
                    permissionStatus = PermissionStatus.None;
                }
            }
            return c;
        }


    }

        public enum PermissionValue
        {
            True,
            False,
            None
        }

        public enum PermissionStatus
         {
        Enabled,
        Disabled,
        None
         }
}
