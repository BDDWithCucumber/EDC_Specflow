using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.Common
{
    public class DS_CommonObjects
    {       
        public static IControl GetClickableBreadCrumbItem(string breadCrumbItemName)
        {
            IControl host = SyncUtilities.FindVisibleElement(By.ClassName("bcrumbRow"));
            if (!Control_PropertyUtilities.IsControlNull(host))
            {
                return SyncUtilities.FindVisibleElement_Parent(host.WebElement, By.LinkText(breadCrumbItemName));
            }
            return null;
        }

        public static IControl GetBreadCrumbLink(int position)
        {
            try
            {
                IControl abc = SyncUtilities.FindVisibleElement(By.CssSelector(".bcrumbRow"));
                return SyncUtilities.FindVisibleElement(By.CssSelector(".bcrumbRow > a:nth-of-type(" + position + ")"));
            }
            catch(Exception e)
            {

            }
            return null;
        }

        public static IControl BreadCrumbHost
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.ClassName("bcrumbRow"));
            }
        }

        public static IControl Home { get { return SyncUtilities.FindVisibleElement(By.Id("Home")); } }
        public static IControl LocalLabs { get { return SyncUtilities.FindVisibleElement(By.XPath("//a[@id='Local Labs']")); } }
        public static IControl ContinueButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rwWindowContent #btnOK.btnPrimary")); } }

        public static IControl StudyVerifyErrorLink
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ucHeader_liStudyName > table > tbody > tr > td:nth-of-type(3) > input"));
            }
        }

        public static IControl NotificationPopup { get { return SyncUtilities.FindVisibleElement(By.Id("RadToolTipWrapper_ctl00_ctl00_ContentMainMenu_MainMenu1_rttNotifications")); } }      

        public static IControl DictNotificationPopup { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[contains(span,'has been successful')]")); } }

        public static IControl ImportNotificationPopup { get { return SyncUtilities.FindVisibleElement(By.XPath("#aspnetForm > script:nth-child(17)[contains(text(),'Import has been successful')]]")); } }

    }
}
