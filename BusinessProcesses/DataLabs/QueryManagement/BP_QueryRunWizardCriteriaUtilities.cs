using Framework.Actions;
using Pages.DataLabs.QueryManagement;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.QueryManagement
{
    public class BP_QueryRunWizardCriteriaUtilities
    {
        public static bool ClickNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_QueryRunWizardCriteriaPage.NextButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
