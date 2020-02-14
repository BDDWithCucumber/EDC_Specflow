using Interfaces;
using OpenQA.Selenium;
using System.Threading;
using Utilities;

namespace Pages.DataLabs.Login
{
    public class DL_ActivityLogWindow
    {
        public static IControl ActivityLogWindow { get { return SyncUtilities.FindElement(By.Id("RadWindowWrapper_AutoSizeWindow")); } }

        public static IControl CloseButton { get { return SyncUtilities.FindElement(By.Id("btnClose")); } }

        /*static IControl GetCloseButton()
        {
            IControl form = SyncUtilities.FindElement(By.Name("frmDefault"));
            if (form.WebElement != null)
            {
                IControl frame = SyncUtilities.FindElement_Parent(form.WebElement, By.TagName("iframe"));
                if (frame.WebElement != null)
                {
                    BrowserUtilities.WebDriver.SwitchTo().Frame(frame.WebElement);
                    return SyncUtilities.FindElement(By.Id("btnClose"));
                }
            }
            return null;
        }*/
    }
}