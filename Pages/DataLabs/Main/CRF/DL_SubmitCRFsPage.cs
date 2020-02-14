using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Main.CRF
{
    public class DL_SubmitCRFsPage
    {
        public static IControl FormsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("tblEventFormList"));
            }
        }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("PDEMarkCRFSubmittedPatient_btnSave")); } }
    }
}