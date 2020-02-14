using Framework.Actions;
using Pages.DataLabs.DerivationManagement;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.DerivationManagement
{
    public class BP_DerivationRunWizardUtilities
    {
        public static bool ClickFinishButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_DerivationRunWizardPage.FinishButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        
    }
}
