using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.StudyVerificationMessages
{
    public class StudyVerificationMessagesPopup
    {
        public static IControl VerifyContinue { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnOK")); } }

        public static IControl Close
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnClose"));
            }
        }        

        public static IControl VerifyCancel { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnCancel")); } }

        public static IControl SVRMessagesHeader
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwTitleRow em"));
            }
        }

        public static IControl SVRMessagesErrorLinkMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".VerifyMessagePopupBody #ctl00_ContentBody_pnlMessageLists > td > td > a:nth-of-type(1)"));
            }
        }
    }
}
