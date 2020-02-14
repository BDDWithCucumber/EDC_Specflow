using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Patients
{
    public class DL_Patient_AddEvetnsPage
    {
        public static IControl PublishButton { get { return SyncUtilities.FindVisibleElement(By.Id("AddEvent_btnPublish")); } }
    }
}