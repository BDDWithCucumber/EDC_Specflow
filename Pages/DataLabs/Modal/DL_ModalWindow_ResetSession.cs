using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_ResetSession
    {
        public static IControl Message
        {
            get
            {
                IControl form = SyncUtilities.FindElement(By.Id("Form1"));
                return SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.TagName("div"));
            }
        }

        public static IControl ContinueButton
        {
            get
            {
                IControl form = SyncUtilities.FindElement(By.Id("Form1"));
                return SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.Id("btnContinue"));
            }
        }
    }
}