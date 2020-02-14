using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_ResetCRF
    {
        public static IControl TitleLabel_Step1 { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_lblCommentTitleStep1")); } }

        public static IControl TitleLabel_Step2 { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_lblCommentTitleStep2")); } }

        public static IControl YesButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnYes")); } }

        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnCancelStep1")); } }


        public static IControl ContinueButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnReset")); } }

        public static IControl ReasonTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtReason")); } }
    }
}