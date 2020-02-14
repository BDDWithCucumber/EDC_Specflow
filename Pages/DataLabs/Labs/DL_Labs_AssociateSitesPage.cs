using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Labs
{
    public class DL_Lab_AssociateSitesPage
    {

        public static IControl AvailableSites_Searchbox { get { return SyncUtilities.FindVisibleElement(By.Name("AvailableSites")); } }
        public static IControl AssociatedSites_Searchbox { get { return SyncUtilities.FindVisibleElement(By.Name("SelectSites")); } }
        public static IControl AvailableSitesListBox { get { return new Control(AvailableSites.WebElement, new SelectElement(AvailableSites.WebElement)); } }
        public static IControl AssociatedSitesListBox { get { return new Control(AssociatedSites.WebElement, new SelectElement(AssociatedSites.WebElement)); } }
        public static IControl AvailableSites { get { return SyncUtilities.FindElement(By.Id("lstAvailableSites")); } }
        public static IControl AssociatedSites { get { return SyncUtilities.FindElement(By.Id("lstSiteLabs")); } }
        public static IControl AddButton { get { return SyncUtilities.FindElement(By.Id("btnAdd")); } }
        public static IControl RemoveButton { get { return SyncUtilities.FindElement(By.Id("btnRemove")); } }
        public static IControl SaveButton { get { return SyncUtilities.FindElement(By.Id("btnSave")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindElement(By.Id("LabSite_btnCancel")); } }
    }
}