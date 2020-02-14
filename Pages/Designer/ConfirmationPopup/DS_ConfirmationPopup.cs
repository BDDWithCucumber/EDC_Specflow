using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.ConfirmationPopup
{
    public class DS_ConfirmationPopup
    {
        public static IControl Continue { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnOK")); } }

        public static IControl DeleteJobsContinue { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnOK")); } }

        public static IControl DeleteJobsHeader
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwTitleRow em"));
            }
        }

        public static IControl Cancel { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnCancel")); } }

        public static IControl Header
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwTitleRow em"));
            }
        }

        public static IControl ConfirmationMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent > div > div > div:nth-of-type(1)"));
            }
        }

        public static IControl DeleteJobsMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent > div > div > div:nth-of-type(1)"));
            }
        }
    }
}