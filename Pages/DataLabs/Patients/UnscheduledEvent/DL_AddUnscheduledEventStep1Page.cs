using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Patients.UnscheduledEvent
{
    public class DL_AddUnscheduledEventStep1Page
    {
        public static IControl EventsListbox
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("lstEvents"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl EventLabelTextbox { get { return SyncUtilities.FindVisibleElement(By.Id("txtEventLabel")); } }

        public static IControl NextButton { get { return SyncUtilities.FindVisibleElement(By.Id("UnscheduledEvent_btnNext")); } }
    }
}
