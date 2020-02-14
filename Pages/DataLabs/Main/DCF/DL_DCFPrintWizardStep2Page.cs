using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Main.DCF
{
    public class DL_DCFPrintWizardStep2Page
    {
        public static IControl NextButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("DCF_PrintWizOptions_btnNext"));
            }
        }
    }
}
