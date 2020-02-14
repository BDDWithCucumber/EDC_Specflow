using Framework.Actions;
using Pages.DataLabs.Main.DCF;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Main.DCF
{
    public class BP_DCFPrintWizardStep3Utilites
    {
        public static bool ClickFinishButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_DCFPrintWizardStep3Page.FinishButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
