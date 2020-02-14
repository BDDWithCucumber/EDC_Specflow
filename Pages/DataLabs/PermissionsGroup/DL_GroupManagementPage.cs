using Common;
using Interfaces;
using OpenQA.Selenium;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.PermissionsGroup
{
    public static class DL_GroupManagementPage
    {
        public static IControl GroupsTable { get { return GetGroupsTable(); } }

        static IControl GetGroupsTable()
        {
            IControl mainPanel = SyncUtilities.FindElement(By.Id("mainContent"));
            IControl mainTable = SyncUtilities.FindElement_Parent(mainPanel.WebElement, By.Id("tblMainContent"));
            ReadOnlyCollection<IControl> tableList = SyncUtilities.FindElements_Parent(mainTable.WebElement, By.TagName("table"));
            return new Control(tableList[0].WebElement);
        }
    }
}