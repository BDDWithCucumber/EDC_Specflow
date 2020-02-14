using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Main.DCF
{
    public class DL_DCFPrintWizardStep3Page
    {
        public static IControl FinishButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("DCF_PrintWizFinish_btnFinish"));
            }
        }
    }
}