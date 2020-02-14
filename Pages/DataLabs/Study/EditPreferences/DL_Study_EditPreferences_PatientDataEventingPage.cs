using Interfaces;
using OpenQA.Selenium;
using Common;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Study.EditPreferences
{
    public class DL_Study_EditPreferences_PatientDataEventingPage
    {
        public static IControl EndPointURL { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_txtEndpointURL")); } }

    }
}
