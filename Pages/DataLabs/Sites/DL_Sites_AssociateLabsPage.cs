using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Sites
{
    public class DL_Site_AssociateLabsPage
    {
        public static IControl AvailableLabs_SearchBox { get { return SyncUtilities.FindVisibleElement(By.Name("AvailableLab")); } }
        public static IControl AssociatedLabs_SearchBox { get { return SyncUtilities.FindVisibleElement(By.Name("SelectLab")); } }
        public static IControl AvailableLabsListBox { get { return new Control(AvailableLabs.WebElement, new SelectElement(AvailableLabs.WebElement)); } }
        public static IControl AssociatedLabsListBox { get { return new Control(AssociatedLabs.WebElement, new SelectElement(AssociatedLabs.WebElement)); } }
        public static IControl AvailableLabs { get { return SyncUtilities.FindVisibleElement(By.Id("lstAvailableLabs")); } }
        public static IControl AssociatedLabs { get { return SyncUtilities.FindVisibleElement(By.Id("lstSiteLabs")); } }
        public static IControl AddButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnAdd")); } }
        public static IControl RemoveButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnRemove")); } }
        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnSave")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("SiteLab_btnCancel")); } }
    }
}