using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_FormComments
    {
        public static IControl CommentsTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtComment")); } }
        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnSave")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnCancel")); } }
    }
}