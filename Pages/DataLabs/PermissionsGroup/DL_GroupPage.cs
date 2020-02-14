using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.PermissionsGroup
{
    public class DL_GroupPage
    {
        public static IControl StatusDropdown
        {
            get
            {
                IControl table = SyncUtilities.FindElement(By.Id("GroupDetail_tblGroupDetails"));
                IControl dropdown = SyncUtilities.FindVisibleElement_Parent(table.WebElement, By.Id("GroupDetail_ddlStatus"));
                return new Control(dropdown.WebElement, new SelectElement(dropdown.WebElement));
            }
        }

        public static IControl SaveButton
        {
            get
            {
                IControl table = SyncUtilities.FindElement(By.Id("GroupDetail_tblGroupDetails"));
                return SyncUtilities.FindVisibleElement_Parent(table.WebElement, By.Id("GroupDetail_btnSave"));
            }
        }
    }
}