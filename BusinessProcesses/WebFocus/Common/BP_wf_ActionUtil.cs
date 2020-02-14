using Framework.Actions;
using Interfaces;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Pages.WebFocus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.WebFocus.Common
{
   public class BP_wf_ActionUtil
    {
       public static int loadTime = 60;
        public static bool SelectModalItemsInMainPage(String itemToSelect)
        {

            //INeedToWaitForWebelementToAppearInPage(wf_Page_Main.HomePageLogo,TimeSpan.FromSeconds(loadTime));

            {
                switch (itemToSelect.ToUpper())
                {
                    case "DOMAINS":
                        //wf_Page_Main.item_Domains.WebElement.Click();
                        Control_ActionUtilities.DoubleClickOnObject(wf_Page_Main.item_Domains);
                        //Thread.Sleep(3000);
                        break;
                    case "WEB CONTENT":
                        //wf_Page_Main.item_WebContent.WebElement.Click();
                        Control_ActionUtilities.DoubleClickOnObject(wf_Page_Main.item_WebContent);
                        //Thread.Sleep(2000);
                        break;
                    case "GLOBAL RESOURCES":
                        //wf_Page_Main.item_GlobalResources.WebElement.Click();
                        Control_ActionUtilities.DoubleClickOnObject(wf_Page_Main.item_GlobalResources);
                        //Thread.Sleep(2000);
                        break;
                    default:
                        throw new Exception("Invalid Item provided : " + itemToSelect.ToString());
                }

            }
             return true;        
        }

        public static bool SelectFolderInDomainsMainPage(String folderName)
        {
            if (wf_Page_Main.getXpathOfStudy(folderName) == null)
                return false;
            //wf_Page_Main.getXpathOfStudy(folderName).WebElement.Click();
            Control_ActionUtilities.DoubleClickOnObject(wf_Page_Main.getXpathOfStudy(folderName));

            return true;
        }

        public static bool SelectFormInCRFPage(String formname)
        {
            if (wf_Page_Main.getFormsName(formname) == null)
                return false;
            // wf_Page_Main.getFormsName(formname).WebElement.Click();
            Control_ActionUtilities.DoubleClickOnObject(wf_Page_Main.getFormsName(formname));
            return true;
        }

        public static bool WaitForObjectToAppearOnPage(IControl ObjectToVerify, string logMessageOnException)
        {
            bool ObjectAppeared = false;
           // if (Control_PropertyUtilities.IsControlNull(ObjectToVerify))
              if (ObjectToVerify.WebElement == null && !Control_ActionUtilities.IsClickable(ObjectToVerify.WebElement))
                {
                int i = 0;
                while (!ObjectAppeared && i < 30)
                {
                    ++i;
                    ObjectAppeared = ObjectToVerify.WebElement.Displayed;                    
                   // Thread.Sleep(1000);
                }
                return false;
            }
            return ObjectAppeared;

        }

        public static bool INeedToWaitForWebelementToAppearInPage(IControl objectTOVerify, TimeSpan timeout)
        {
            BrowserUtilities.WebDriver.Manage().Timeouts().ImplicitWait.Add(TimeSpan.FromSeconds(1));//Reseting the implicit wait/disabling
            WebDriverWait wait = new WebDriverWait(BrowserUtilities.WebDriver, timeout);
            wait.PollingInterval = TimeSpan.FromMilliseconds(500);
            wait.IgnoreExceptionTypes(typeof(NoSuchElementException), typeof(ElementNotVisibleException));
            IWebElement flag = wait.Until(funcWaitForWebElement(objectTOVerify.WebElement));
            BrowserUtilities.WebDriver.Manage().Timeouts().ImplicitWait.Add(TimeSpan.FromSeconds(loadTime));//Reinitilaing the implicit wait
            return true;
        }

        private static Func<IWebDriver, IWebElement> funcWaitForWebElement(IWebElement Locator)// Anonymous function to wait for the element
        {                                                                   //which  returns the Webelemet or null

            return ((x) =>
            {
                if (Locator.Displayed && Control_ActionUtilities.IsClickable(Locator))
                    return Locator;
                return null;
            });
        }

        public static string GetPropertyOfAnObject(IControl ObjName, string property)
        {
            string ObjText = "";
            if (ObjName != null)
            {
                ObjText = ObjName.WebElement.GetAttribute(property);
            }
            else
            {
                return null;
            }
            return ObjText;
        }


    }
    
}
