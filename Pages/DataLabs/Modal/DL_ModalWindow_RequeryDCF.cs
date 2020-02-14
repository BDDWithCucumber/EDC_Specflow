using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_RequeryDCF
    {
        public static IControl DCFStatusDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_ddlDCFStatus"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl QueryDescriptionTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtQueryDescription")); } }

        public static IControl ActionRequestTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtActionRequest")); } }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnSave")); } }

        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnCancel")); } }
    }
}
