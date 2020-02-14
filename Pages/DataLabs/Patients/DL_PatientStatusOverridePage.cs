using Common;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Patients
{
    public class DL_PatientStatusOverridePage
    {
        public static IControl ChangeToDropdown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("PatStatusOverride_ddlPortalList"));
                return new Control(c.WebElement, new OpenQA.Selenium.Support.UI.SelectElement(c.WebElement));
            }
        }

        public static IControl ReasonForChangeTextArea { get { return SyncUtilities.FindVisibleElement(By.Id("PatStatusOverride_txtComment")); } }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnSave")); } }
    }
}
