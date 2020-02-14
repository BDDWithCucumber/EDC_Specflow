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

namespace Pages.DataLabs.Patients
{
    public class DL_TransferPatientPage
    {
        public static IControl ToSiteDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("TransferPatient_ddlToSite"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl ReasonDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("TransferPatient_ddlReason"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl AdditionalNotesTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("TransferPatient_txtAddlNotes")); } }

        public static IControl TransferButton { get { return SyncUtilities.FindVisibleElement(By.Id("TransferPatient_btnConfirm")); } }

    }
}
