using Framework.Actions;
using Pages.DataLabs.Sites;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Sites
{
    public class BP_Site_ManageUsersUtilities
    {
        public static bool AddUserToSiteUsers(String userName)
        {
            try
            {
                //if (!Control_ActionUtilities.Dropdown_IsItemAvailable(DL_Site_ManageUsersPage.SiteUsersListBox, userName, String.Empty))
                //{
                    if (Control_ActionUtilities.Dropdown_SelectItem(DL_Site_ManageUsersPage.AvailableUsersListBox, userName, String.Empty))
                    {
                        if (Control_ActionUtilities.Click(DL_Site_ManageUsersPage.AddButton, String.Empty))
                        {
                            return Control_ActionUtilities.Click(DL_Site_ManageUsersPage.SaveButton, String.Empty);
                        }
                    }
                //}
                else
                {
                    return Control_ActionUtilities.Click(DL_Site_ManageUsersPage.CancelButton, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool RemoveUserFromSiteUsers(String userName)
        {
            try
            {
                //if (!Control_ActionUtilities.Dropdown_IsItemAvailable(DL_Site_ManageUsersPage.AvailableUsersListBox, userName, String.Empty))
                //{
                    if (Control_ActionUtilities.Dropdown_SelectItem(DL_Site_ManageUsersPage.SiteUsersListBox, userName, String.Empty))
                    {
                        if (Control_ActionUtilities.Click(DL_Site_ManageUsersPage.RemoveButton, String.Empty))
                        {
                            return Control_ActionUtilities.Click(DL_Site_ManageUsersPage.SaveButton, String.Empty);
                        }
                    }
                //}
                else
                {
                    return Control_ActionUtilities.Click(DL_Site_ManageUsersPage.CancelButton, String.Empty);
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