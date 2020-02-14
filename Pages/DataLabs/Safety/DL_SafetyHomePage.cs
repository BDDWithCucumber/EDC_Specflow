using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Safety
{
    public class DL_SafetyHomePage
    {
        public static IControl SafetyGrid { get { return SyncUtilities.FindElement(By.Id("SafetyCaseList_grdSafetyCaseListPanel")); } }
        
        public static IControl SafetyGridDetailsColumnHeader(string columnLinkText)
        {
            return SyncUtilities.FindElement(By.LinkText(columnLinkText));
        }
    }
}
