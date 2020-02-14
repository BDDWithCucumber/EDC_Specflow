using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_ClearItem
    {
        public static IControl NotesTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtReason")); } }

        public static IControl OkButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector("input[type=button][value=Ok]")); } }
    }
}
