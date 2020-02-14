using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_AnswerDCF
    {
        public static IControl ResponseTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtResponse")); } }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnSave")); } }

        public static IControl CloseButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnCancel")); } }

        public static IControl Categorydropdown { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_ddlCategory")); } }
        public static IControl SelectCategoryDropdown { get { return new Control(Categorydropdown.WebElement, new SelectElement(SelectCategoryDropdown.WebElement)); } }
        public static IControl CategoryStatusdropdown { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_ddlCategoryStatus")); } }
        public static IControl SelectCategoryStatusDropdown { get { return new Control(CategoryStatusdropdown.WebElement, new SelectElement(SelectCategoryStatusDropdown.WebElement)); } }       }
}
