using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Patients.UnscheduledEvent
{
    public class DL_AddUnscheduledEventStep3Page
    {
        public static IControl FinishButton { get { return SyncUtilities.FindVisibleElement(By.Id("UnscheduledEvent_btnFinish")); } }
    }
}
