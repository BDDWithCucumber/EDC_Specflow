using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.PermissionsGroup;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.PermissionGrop
{
    public class BP_PermissionGroupUtilities
    {
        public static bool ChangeStatusAndSave(String status)
        {
            try
            {
                if (!Control_ActionUtilities.Dropdown_SelectItem(DL_GroupPage.StatusDropdown, status, String.Empty))
                {
                    return false;
                }
                if (!Control_ActionUtilities.Click(DL_GroupPage.SaveButton, String.Empty))
                {
                    return false;
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool AddGroup(String groupName, String defaultPortal)
        {
            try
            {
                IControl groupsTable = DL_AddGroupsPage.GroupsTable;
                WebTable_SearchCriteriaItem searchCreteriaItem = new WebTable_SearchCriteriaItem(0, groupName, TableColumnContentType.CheckboxAndText);
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(searchCreteriaItem);
                IControl tableRow = WebTableUtilities.Table_FindRow(groupsTable, list);
                if (tableRow != null)
                {
                    IControl checkbox = WebTableUtilities.GetElement(tableRow, String.Empty, 0, TableColumnContentType.CheckboxAndText);
                    Control_ActionUtilities.Click(checkbox, String.Empty);
                    IControl dropdown = WebTableUtilities.GetElement(tableRow, String.Empty, 1, TableColumnContentType.Dropdown);
                    Control_ActionUtilities.Dropdown_SelectItem(dropdown, defaultPortal, String.Empty);
                    return Control_ActionUtilities.Click_PerssEnterKey(DL_AddGroupsPage.AddButton, String.Empty);
                }
                else
                {
                    return Control_ActionUtilities.Click_PerssEnterKey(DL_AddGroupsPage.CancelButton, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DeleteGroup(String groupName)
        {
            try
            {
                IControl groupsTable = DL_DeleteGroupsPage.GroupsTable;
                WebTable_SearchCriteriaItem searchCreteriaItem = new WebTable_SearchCriteriaItem(0, groupName, TableColumnContentType.CheckboxAndText);
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(searchCreteriaItem);
                IControl tableRow = WebTableUtilities.Table_FindRow(groupsTable, list);
                if (tableRow != null)
                {
                    IControl checkbox = WebTableUtilities.GetElement(tableRow, String.Empty, 0, TableColumnContentType.CheckboxAndText);
                    Control_ActionUtilities.Click(checkbox, String.Empty);
                    return Control_ActionUtilities.Click_PerssEnterKey(DL_DeleteGroupsPage.DeleteButton, String.Empty);
                }
                else
                {
                    return Control_ActionUtilities.Click_PerssEnterKey(DL_DeleteGroupsPage.CancelButton, String.Empty);
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