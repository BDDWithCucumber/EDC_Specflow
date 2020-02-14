using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Sites
{
    public class DL_Site_ManageUsersPage
    {        
        public static IControl AvailableUsersListBox { get { return new Control(AvailableUsers.WebElement, new SelectElement(AvailableUsers.WebElement)); } }
        public static IControl SiteUsersListBox { get { return new Control(SiteUsers.WebElement, new SelectElement(SiteUsers.WebElement)); } }

        static IControl AvailableUsers { get { return SyncUtilities.FindElement(By.Id("SiteStaff_lstAvailableStaffs")); } }
        static IControl SiteUsers { get { return SyncUtilities.FindElement(By.Id("SiteStaff_lstSiteStaffs")); } }
        public static IControl AddButton { get { return SyncUtilities.FindElement(By.Id("SiteStaff_btnAdd")); } }
        public static IControl RemoveButton { get { return SyncUtilities.FindElement(By.Id("SiteStaff_btnRemove")); } }
        public static IControl SaveButton { get { return SyncUtilities.FindElement(By.Id("SiteStaff_btnSave")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindElement(By.Id("SiteStaff_btnCancel")); } }
    }
}
