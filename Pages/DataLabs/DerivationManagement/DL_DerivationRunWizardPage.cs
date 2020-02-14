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
    public class DL_DerivationRunWizardPage
    {

        public static IControl FinishButton { get { return SyncUtilities.FindVisibleElement(By.Id("DerivationWizardRunList_btnFinishButton")); } }

        public static IControl DerivationCriteriaRadio(string RadioText)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//input[@value='" + RadioText + "']"));
        }
    }
}
