using Framework.Actions;
using Pages.DataLabs.Main.DCF;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.Main.DCF
{
    public class BP_DCFPrintWizardStep2Utilites
    {
        public static bool ClickNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_DCFPrintWizardStep2Page.NextButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}