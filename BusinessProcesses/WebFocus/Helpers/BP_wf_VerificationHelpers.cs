using Reports.DebugLog;
using System;
using System.Reflection;
using OpenQA.Selenium;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Interfaces;
using BusinessProcesses.WebFocus.Common;
using Utilities;
using Framework.Actions;
using System.Collections.ObjectModel;
using Common;
using System.Threading;

namespace BusinessProcesses.WebFocus.Helpers
{
    public class BP_wf_VerificationHelpers
    {
         static int TableWaitTime = 600;
        public static bool IsElementVisibleOnPage(IControl Locator)
        {
            bool elementVisible = false;
            try
            {             
                if (!Control_PropertyUtilities.IsControlNull(Locator))
                {
                    elementVisible = true;
                }
                return elementVisible;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);

            }

            return elementVisible;
        }

        public static IControl WaitAndFindVisibleElement(By locator)
        {
            int i = 0;
            while (i < TableWaitTime)
            {
                ++i;
                ReadOnlyCollection<IControl> cList = SyncUtilities.FindElements(locator);
                foreach (Control c in cList)
                {
                    if (c != null && c.WebElement != null)
                    {
                        //ScrollIntoView(c.WebElement);
                        return c;
                    }
                }
                Thread.Sleep(1000);
            }
            return null;
        }



    }
}
