using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_AddComment
    {
        public static IControl TitleLabel { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_lblCommentTitle")); } }

        public static IControl CommetnsTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtComment")); } }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnSave")); } }
    }
}
