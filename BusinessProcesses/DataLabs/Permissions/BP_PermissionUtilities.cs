using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Main;
using BusinessProcesses.DataLabs.Modal;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.DataLabs;
using Pages.DataLabs.Data;
using Pages.DataLabs.Labs;
using Pages.DataLabs.NormalizeLabData;
using Pages.DataLabs.Permissions;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Permissions
{
    public class BP_PermissionUtilities
    {
        public static bool SetPermission(string Category, string PermissionName, string PermissionType)
        {
            PermissionValue value = PermissionValue.None;
            IControl permissionCell = DL_PermissionsPage.GetPermissionValue(Category, PermissionName, PermissionType, out value);
            if (permissionCell != null && !Control_PropertyUtilities.IsControlNull(permissionCell))
            {
                return Control_ActionUtilities.Click(permissionCell, String.Empty);
            }
            return false;
        }

        public static bool CheckPermissionsData(String category, IEnumerable<GroupPermissionData> list)
        {
            foreach (GroupPermissionData data in list)
            {
                if (!ArePermissionsValid(category, data))
                {
                    return false;
                }
            }
            return true;
        }

        public static bool CheckPermissionsStatus(String category, IEnumerable<GroupPermissionData> list)
        {
            try
            {
                foreach (GroupPermissionData data in list)
                {
                    if (!ArePermissionsEnabledOrDisabled(category, data))
                    {
                        return false;
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static bool CheckPermissions(String category, IEnumerable<GroupPermissionData> list)
        {
            try
            {
                List<String> permissionsList = new List<string> { };
                category = category.Replace(" ", String.Empty);
                permissionsList.Add("Permissions_" + category);
                foreach (GroupPermissionData data in list)
                {
                 permissionsList.Add(data.PermissionName.ToString().Replace(" ", String.Empty));
                }
                Console.WriteLine("Permission List :");
                for (int i = 0; i < permissionsList.Count - 1; i++)
                {
                    Console.WriteLine(permissionsList[i]);
                    category = permissionsList[i];
                    String PermissionName = permissionsList[i + 1];
                    if (DL_PermissionsPage.GetPermissionForCategory(category, PermissionName).WebElement == null)
                    {
                        Console.WriteLine("Permissions are not in proper order");
                        return false;
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static bool SavePermissions()
        {
            return Control_ActionUtilities.Click(DL_PermissionsPage.SaveButton, String.Empty);
        }
        public static bool CancelEditedPermissions()
        {
            return Control_ActionUtilities.Click(DL_PermissionsPage.CancelButton, String.Empty);
        }

        static bool ArePermissionsValid(String category, GroupPermissionData data)
        {
            PermissionValue value = PermissionValue.None;
            DL_PermissionsPage.GetPermissionValue(category, data.PermissionName, "Allow", out value);
            if (!AreValuesEqual(category, data.PermissionName, data.Allow, value))
            {
                Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__Allow");
                return false;
            }

            DL_PermissionsPage.GetPermissionValue(category, data.PermissionName, "Deny", out value);
            if (!AreValuesEqual(category, data.PermissionName, data.Deny, value))
            {
                Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__Deny");
                return false;
            }

            DL_PermissionsPage.GetPermissionValue(category, data.PermissionName, "Hide", out value);
            if (!AreValuesEqual(category, data.PermissionName, data.Hide, value))
            {
                Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__Hide");
                return false;
            }

            DL_PermissionsPage.GetPermissionValue(category, data.PermissionName, "View", out value);
            if (!AreValuesEqual(category, data.PermissionName, data.View, value))
            {
                Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__View");
                return false;
            }

            DL_PermissionsPage.GetPermissionValue(category, data.PermissionName, "Edit", out value);
            if (!AreValuesEqual(category, data.PermissionName, data.Edit, value))
            {
                Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__Edit");
                return false;
            }
            return true;
        }

        static bool ArePermissionsEnabledOrDisabled(String category, GroupPermissionData data)
        {
            try
            {
                PermissionStatus status = PermissionStatus.None;
                DL_PermissionsPage.GetPermissionStatus(category, data.PermissionName, "Allow", out status);
                if (!AreStatusEqual(category, data.PermissionName, data.Allow, status))
                {
                    Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__Allow");
                    return false;
                }

                DL_PermissionsPage.GetPermissionStatus(category, data.PermissionName, "Deny", out status);
                if (!AreStatusEqual(category, data.PermissionName, data.Deny, status))
                {
                    Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__Deny");
                    return false;
                }

                DL_PermissionsPage.GetPermissionStatus(category, data.PermissionName, "Hide", out status);
                if (!AreStatusEqual(category, data.PermissionName, data.Hide, status))
                {
                    Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__Hide");
                    return false;
                }

                DL_PermissionsPage.GetPermissionStatus(category, data.PermissionName, "View", out status);
                if (!AreStatusEqual(category, data.PermissionName, data.View, status))
                {
                    Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__View");
                    return false;
                }

                DL_PermissionsPage.GetPermissionStatus(category, data.PermissionName, "Edit", out status);
                if (!AreStatusEqual(category, data.PermissionName, data.Edit, status))
                {
                    Console.WriteLine("Permission mismatched for " + category + "__" + data.PermissionName + "__Edit");
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }


        static bool AreValuesEqual(String category, String permissionName, String value1, PermissionValue value2)
        {
            switch (value2)
            {
                case PermissionValue.True:
                    if (value1.Equals("true", StringComparison.InvariantCultureIgnoreCase))
                    {
                        return true;
                    }
                    break;
                case PermissionValue.False:
                    if (value1.Equals("false", StringComparison.InvariantCultureIgnoreCase))
                    {
                        return true;
                    }
                    break;
                case PermissionValue.None:
                    if (value1.Equals("NA", StringComparison.InvariantCultureIgnoreCase))
                    {
                        return true;
                    }
                    break;
            }
            return false;
        }

        static bool AreStatusEqual(String category, String permissionName, String value1, PermissionStatus value2)
        {
            try
            {
                switch (value2)
                {
                    case PermissionStatus.Enabled:
                        if (value1.Equals("Enabled", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return true;
                        }
                        break;
                    case PermissionStatus.Disabled:
                        if (value1.Equals("Disabled", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return true;
                        }
                        break;
                    case PermissionStatus.None:
                        if (value1.Equals("NA", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return true;
                        }
                        break;
                }
            }
            catch(Exception e)
            {
             new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ExpandCategory(string category)
        {
            try
            {
                bool isCategoryExpanded = false;
                IControl expandCollapseImage = DL_PermissionsPage.GetExpandCollapseImage_CategoryRow(category, out isCategoryExpanded);
                if (!isCategoryExpanded)
                {
                    return Control_ActionUtilities.Click(expandCollapseImage, "Unable to expand permission group " + category.ToUpper());
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetPermissionsForLoggedinUserGroup(List<GroupPermissionsData> dataList)
        {
            bool arePermissionsChanged = false;
            try
            {
                if (SetPermissions(dataList, out arePermissionsChanged))
                {
                    if (SavePermissions())
                    {
                        BP_ModalWindow.ClickContinue("Edit Permissions", "group security you belong to");
                        return BP_BreadCrumbUtilities.ClickBreadCrumbItem("Study Administration");
                    }
                    if (arePermissionsChanged)
                    {
                        BP_Modal_ResetSession.ClickContinue("continue your session");
                        return BP_DataManagerPortalDropdownUtilities.SelectPortalDropdownItem("Study Administration");
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetPermissionsForNonLoggedinUserGroup(List<GroupPermissionsData> dataList)
        {
            try
            {
                bool arePermissionsChanged = false;
                if (SetPermissions(dataList, out arePermissionsChanged))
                {
                    if (SavePermissions())
                    {
                        BP_ModalWindow.ClickContinue("Edit Permissions", "group security you belong to");
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool SetPermissions(List<GroupPermissionsData> dataList, out bool arePermissionsChanged)
        {
            arePermissionsChanged = false;
            try
            {
                String currentCategory = String.Empty;
                foreach (GroupPermissionsData data in dataList)
                {
                    if (ExpandCategory(currentCategory, data.Category))
                    {
                        currentCategory = data.Category;
                    }
                    PermissionValue value = PermissionValue.None;
                    IControl permissionCell = DL_PermissionsPage.GetPermissionValue(data.Category, data.Permission, data.PermissionType, out value);
                    if (permissionCell != null && !Control_PropertyUtilities.IsControlNull(permissionCell))
                    {
                        bool found = false;
                        String propValue = Control_PropertyUtilities.GetAttributeValue(permissionCell, "checked", out found);
                        if (!found)
                        {
                            bool isClicked = Control_ActionUtilities.Click(permissionCell, String.Empty);
                            arePermissionsChanged = true;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool ExpandCategory(String currentCategory, String category)
        {
            if (!currentCategory.Equals(category, StringComparison.InvariantCultureIgnoreCase))
            {
                bool isCategoryExpanded = false;
                IControl expandCollapseImage = DL_PermissionsPage.GetExpandCollapseImage_CategoryRow(category, out isCategoryExpanded);
                if (!isCategoryExpanded)
                {
                    return Control_ActionUtilities.Click(expandCollapseImage, "Unable to expand permission group " + category.ToUpper());
                }
            }
            return false;
        }

        public static Boolean ValidateMessageOnPage(String message)
        {
            try
            {
                if (!Control_PropertyUtilities.compareMessage(DL_LabManagementPage.MessageOnLabManagementPage, message))
                {
                    Console.WriteLine("Message is not correct. Message on page is:" + DL_LabManagementPage.MessageOnLabManagementPage.WebElement.Text);
                    return false;
                }
                if (DL_LabManagementPage.MessageOnLabManagementPage.WebElement.GetCssValue("color") != "rgba(255, 0, 0, 1)")
                {
                    Console.WriteLine("Message color is:" + DL_LabManagementPage.MessageOnLabManagementPage.WebElement.GetCssValue("color"));
                    return false;
                }
                if (!Control_PropertyUtilities.CompareCSSValue(DL_LabManagementPage.MessageOnLabManagementPage, "text-align", "center"))
                {
                    Console.WriteLine("Text is aligned in:" + DL_LabManagementPage.MessageOnLabManagementPage.WebElement.GetCssValue("text-align"));
                    return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static Boolean VerifyLabPageInViewMode()
        {
            try
            {
                foreach (IControl c in DL_AddLabPage.FieldsOnLabPage)
                {
                    if (!Control_PropertyUtilities.IsControlDisabled(c))
                    {
                        return false;
                    }
                }
                if (!Control_PropertyUtilities.IsControlDisabled(DL_AddLabPage.SaveButton))
                {
                    return false;
                }
                if (Control_PropertyUtilities.IsControlDisabled(DL_AddLabPage.CancelButton))
                {
                    return false;
                }
            }
            catch (Exception e)
            {
             new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static Boolean VerifyLabPageInEditMode()
        {
            try
            {
                foreach (IControl c in DL_AddLabPage.FieldsOnLabPage)
                {
                    if (!Control_PropertyUtilities.IsEnabled(c))
                    {
                        return false;
                    }
                }
                if (!Control_PropertyUtilities.IsEnabled(DL_AddLabPage.SaveButton))
                {
                    return false;
                }
                if (!Control_PropertyUtilities.IsEnabled(DL_AddLabPage.CancelButton))
                {
                    return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static Boolean VerifyAddLabPageInViewMode()
        {
            try
            {
                foreach (IControl c in DL_AddLabPage.FieldsOnLabPage)
                {
                    if (!Control_PropertyUtilities.IsControlDisabled(c))
                    {
                        return false;
                    }
                }
                if (!Control_PropertyUtilities.IsControlDisabled(DL_AddLabPage.SaveAndAddAnotherButton))
                {
                    return false;
                }
                if (!Control_PropertyUtilities.IsControlDisabled(DL_AddLabPage.SaveButton))
                {
                    return false;
                }
                if (Control_PropertyUtilities.IsControlDisabled(DL_AddLabPage.CancelButton))
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static Boolean VerifyNormalizeLabDataPageInViewMode()
        {
            try
            {
                if (!Control_PropertyUtilities.IsEnabled(DL_NormalizeLabDataPage.RunButton))
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }


        public static Boolean VerifyAddLabPageInEditMode()
        {
            try
            {
                foreach (IControl c in DL_AddLabPage.FieldsOnLabPage)
                {
                    if (!Control_PropertyUtilities.IsEnabled(c))
                    {
                        return false;
                    }
                }
                if (!Control_PropertyUtilities.IsEnabled(DL_AddLabPage.SaveAndAddAnotherButton))
                {
                    return false;
                }
                if (!Control_PropertyUtilities.IsEnabled(DL_AddLabPage.SaveButton))
                {
                    return false;
                }
                if (!Control_PropertyUtilities.IsEnabled(DL_AddLabPage.CancelButton))
                {
                    return false;
                }
                if (!Control_PropertyUtilities.IsEnabled(DL_AddLabPage.SaveAndAssociateSiteButton))
                {
                    return false;
                }
            }
            catch (Exception e)
            {
            new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static Boolean ValidateMessageOnRunNormalizationPage(String message)
        {
            try
            {
                if (!Control_PropertyUtilities.compareMessage(DL_LabManagementPage.MessageOnRunNormalizationPage, message))
                {
                    Console.WriteLine("Message is not correct. Message on page is:" + DL_LabManagementPage.MessageOnRunNormalizationPage.WebElement.Text);
                    return false;
                }
            }
            catch(Exception e)
            {
             new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }
    }
}