using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.ModelDialog
{
    public class DS_ModelDialog
    {
        public static IControl ChooseFileButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_txtStudyFile")); } }  
        public static IControl StudyFileUpload { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_txtStudyFile")); } }
        public static IControl Continue { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnImport")); } }
        public static IControl PublishContinue { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnContinue")); } }
        public static IControl Cancel { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnImport")); } }
        public static IControl SavePopupErrorOkButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent .rwPopupButton")); } }
        public static IControl UpdatePopupErrorOkContinueButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnOK.btnPrimary")); } }
        public static IControl SavePopupWarningContinueButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent a:nth-of-type(2).rwPopupButton")); } }
        public static IControl LMSPopupContinueButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnContinue")); } }
        
        public static IControl UpdatePopupWarningContinueButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent .btnPrimary")); } }
        public static IControl EditSelectedOkButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent .btnPrimary")); } }
        public static IControl ChangingLabDictOkButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnOK")); } }
    }
}
