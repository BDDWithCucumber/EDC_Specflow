using Framework.Actions;
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
    public class DS_StudyVerificationMessagesDialog
    {
        public static IControl GetErrorLink(String errorText)
        {
            try
            {
                //winStudyVerifyLog
                IControl host = SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_pnlMessageLists.VerifyMessagePopupBody > table > tbody > tr:nth-of-type(2)"));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindVisibleElement_Parent(host.WebElement, By.LinkText(errorText));
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetErrorLinkToVerify(String errorText)
        {
            try
            {
                //winStudyVerifyLog
                IControl host = SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_pnlMessageLists.VerifyMessagePopupBody > table > tbody > tr:nth-of-type(2)"));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindElement_Parent(host.WebElement, By.LinkText(errorText));
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }
        public static IControl GetWarningLink(String warningText)
        {
            try
            {
                IControl host = SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_pnlMessageLists.VerifyMessagePopupBody > table > tbody > tr:nth-of-type(5)"));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindVisibleElement_Parent(host.WebElement, By.LinkText(warningText));
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }
    }
}
