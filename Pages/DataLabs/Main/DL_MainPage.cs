using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Main
{
    public class DL_MainPage
    {
        public static IControl PortalDropDown { get { return SyncUtilities.FindElement(By.Id("ucBreadcrumbs_ddlPortal")); } }
        public static IControl PortalSelectionDropDown { get { return new Control(PortalDropDown.WebElement, new SelectElement(PortalDropDown.WebElement)); } }
    }
} 