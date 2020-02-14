using Interfaces;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.WebFocus
{
   public class wf_Page_Main
    {
        public static IControl HomePageLogo
        {get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//div[@id='ibx-aria-id-14']/div[1]"));
            }
        }
        public static IControl item_Domains { get { return SyncUtilities.FindVisibleElement(By.Id("ibx-aria-id-341")); } }
        public static IControl item_WebContent { get { return SyncUtilities.FindVisibleElement(By.Id("ibx-aria-id-348")); } }
        public static IControl item_GlobalResources{ get { return SyncUtilities.FindVisibleElement(By.Id("ibx-aria-id-345")); } }
        public static IControl getXpathOfStudy(String study)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//*[contains(@class,'ibx-label-text') and text()='"+study+"']"));
        }
        public static IControl getFormsName(String formName)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//*[contains(@class,'ibx-label-text') and text()='" + formName + "']"));
        }

    }
}
