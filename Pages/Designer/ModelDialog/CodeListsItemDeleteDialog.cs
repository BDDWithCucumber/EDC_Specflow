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
    public class CodeListsItemDeleteDialog
    {
        public static IControl ClickYesButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("btnOK"));
            }
        }

        public static IControl Header
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwTitleRow em"));
            }
        }

        public static IControl CodeListsItemsDeleteMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent > div > div > div:nth-of-type(1)"));
            }
        }

        public static IControl LMSPopup
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".bodyColNoBG #ctl00_ContentBody_tblLMSText > tbody > tr > td"));
            }
        }
    }
}
