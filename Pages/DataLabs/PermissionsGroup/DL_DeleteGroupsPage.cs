using Common;
using Interfaces;
using OpenQA.Selenium;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.PermissionsGroup
{
    public class DL_DeleteGroupsPage
    {
        public static IControl GroupsTable
        {
            get { return GetGroupsTable(); }
        }

        public static IControl DeleteButton { get { return SyncUtilities.FindVisibleElement(By.Id("GroupsDelete_btnDelete")); } }

        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("GroupsDelete_btnCancel")); } }

        static IControl GetGroupsTable()
        {
            IControl mainPanel = SyncUtilities.FindElement(By.Id("mainContent"));
            IControl mainTable = SyncUtilities.FindElement_Parent(mainPanel.WebElement, By.Id("tblMainContent"));
            ReadOnlyCollection<IControl> tableList = SyncUtilities.FindElements_Parent(mainTable.WebElement, By.TagName("table"));
            return new Control(tableList[0].WebElement);
        }
    }
}