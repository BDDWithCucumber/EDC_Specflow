using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.VerifyStudy
{
    public class VerifyStudyPopup
    {
        public static IControl VerifyContinue { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnOK")); } }

        public static IControl VerifyCancel { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnCancel")); } }

        public static IControl VerifyStudyHeader
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwTitleRow em"));
            }
        }

        public static IControl VerifyStudyMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent > div > div > div:nth-of-type(1)"));
            }
        }
    }
}
