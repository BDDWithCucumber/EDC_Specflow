
using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Export
{
    public class DL_QuickExportPage
    {
        public static IControl SiteDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("QuickExport_ddlSiteList"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl PatientDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("QuickExport_ddlPatientList"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl EventDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("QuickExport_ddlEventList"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl FormsDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("QuickExport_ddlFormList"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl FormatDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("QuickExport_ddlFormatList"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl ExportButton { get { return SyncUtilities.FindVisibleElement(By.Id("QuickExport_btnExport")); } }

    }
}
