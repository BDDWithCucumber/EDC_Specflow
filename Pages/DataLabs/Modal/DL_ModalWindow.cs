using Interfaces;
using OpenQA.Selenium;
using System;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow
    {
        public static IControl Header
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("lyrCaption"));
            }
        }

        public static IControl Message
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_lyrMessage"));
            }
        }

        public static IControl ContinueButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnContinue"));
            }
        }

        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnCancel"));
            }
        }

        public static IControl SaveButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnSave"));
            }
        }

        public static IControl YesButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnContinue")); } }
    }

    public class DL_RadModalWindow
    {
        public static IControl Header
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//div[@id='RadWindowWrapper_RadModalWindow']//td[@class='rwTitlebar']//em"));
            }
        }
        

    }
}