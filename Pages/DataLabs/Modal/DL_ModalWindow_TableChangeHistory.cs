using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_TableChangeHistory
    {
        public static IControl HistoryTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_CPH_body_ContentBody_tdChangeHistory > #divSubTabs > #ucSubTabs"));
            }
        }
        public static IControl CloseButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnClose")); } }
    }    
}