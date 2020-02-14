using Common;
using Interfaces;
using OpenQA.Selenium;
using System.Collections.ObjectModel;
using System.Threading;
using Utilities;

namespace Pages.DataLabs.PermissionsGroup
{
    public class DL_AddGroupsPage
    {
        public static IControl GroupsTable { get { return GetGroupsTable(); } }
        public static IControl AddButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("GroupsAdd_btnAdd"));
                /*IControl buttonsHost = SyncUtilities.FindElement_Parent(GroupsTable.WebElement, By.ClassName("btnRowStyle"));
                if (buttonsHost.WebElement != null)
                {
                    ReadOnlyCollection<IControl> cList = SyncUtilities.FindElements_Parent(buttonsHost.WebElement, By.CssSelector("input[type=button]"));
                    if (cList.Count == 2)
                    {
                        return cList[0];
                    }
                }
                return null;*/
            }
        }
        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("GroupsAdd_btnCancel"));
            }
        }

        static IControl GetGroupsTable()
        {
            IControl mainPanel = SyncUtilities.FindElement(By.Id("mainContent"));
            IControl mainTable = SyncUtilities.FindElement_Parent(mainPanel.WebElement, By.Id("tblMainContent"));
            ReadOnlyCollection<IControl> tableList = SyncUtilities.FindElements_Parent(mainTable.WebElement, By.TagName("table"));
            return new Control(tableList[0].WebElement);
        }
    }
}