using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_RestoreTableRow
    {
        public static IControl TitleLabel { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_lblHeader")); } }

        public static IControl ReasonForChangeDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_ddlReasonCodes"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl AdditionalNotesTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtReasonNotes")); } }

        public static IControl ContinueButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnContinue")); } }
    }
}