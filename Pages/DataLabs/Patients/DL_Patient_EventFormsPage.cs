using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Patients
{
    public class DL_Patient_EventFormsPage
    {
        public static IControl EvetnsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("tblEvents"));
            }
        }
        
        public static IControl NewEventDate
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_ctl01"));
            }
        }
        public static IControl EventDateReasonForChange
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_ddlReasonCode"));
            }
        }
        public static IControl SelectEventDateReasonForChange
        {
            get
            {
                return new Control(EventDateReasonForChange.WebElement, new SelectElement(EventDateReasonForChange.WebElement));
            }
        }
        public static IControl EventDateAdditionalNotes
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_txtNote"));
            }
        }

        public static IControl GetImageInPatientCasebookCell(IControl cell)
        {
            return SyncUtilities.FindVisibleElement_Parent(cell.WebElement, By.TagName("img"));
        }

    }
}
