using Interfaces;
using OpenQA.Selenium;
using System;
using Utilities;

namespace Pages.DataLabs.Study
{
    public static class DL_StudyAdministrationPage
    {
        public static IControl LabMgmntHelpText { get { return SyncUtilities.FindVisibleElement(By.XPath("//*[@id=\"StudyAdminCategories_Lab_Management_link\"]/span")); } }
        public static IControl LabMgmntImage { get { return SyncUtilities.FindVisibleElement(By.CssSelector("# StudyAdminCategories_Lab_Management_image > img")); } }
        public static IControl LabMgmntActionsPalette { get { return SyncUtilities.FindVisibleElement(By.Id("LabMgmt_Actions_trActionDisplay")); } }
        public static IControl GetLink(String linkName)
        {
            return SyncUtilities.FindVisibleElement(By.LinkText(linkName));
        }
    }
}
