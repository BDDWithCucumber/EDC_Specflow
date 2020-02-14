using Common;
using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Study
{
    public class DL_StudyManagementPage
    {
        public static IControl StudyStausDropdown
        {
            get
            {
                IControl dropdown = SyncUtilities.FindElement(By.Id("Study_ddlStudyStatus"));
                return new Control(dropdown.WebElement, new OpenQA.Selenium.Support.UI.SelectElement(dropdown.WebElement));
            }
        }

        public static IControl SaveButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("Study_btnSave"));
            }
        }
    }
}
