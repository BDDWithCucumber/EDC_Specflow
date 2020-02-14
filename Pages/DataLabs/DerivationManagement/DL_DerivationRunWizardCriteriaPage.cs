using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.DerivationManagement
{
    public class DL_DerivationRunWizardCriteriaPage
    {
        public static IControl NextButton { get { return SyncUtilities.FindVisibleElement(By.Id("DerivationWizardRunList_btnNextButton")); } }
    }
}
