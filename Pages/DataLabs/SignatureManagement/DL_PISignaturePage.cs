using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.SignatureManagement
{
    public class DL_PISignaturePage
    {
        public static IControl AttestationTextArea
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("SignatureMgmt_txtAttestation"));
            }
        }
    }
}
