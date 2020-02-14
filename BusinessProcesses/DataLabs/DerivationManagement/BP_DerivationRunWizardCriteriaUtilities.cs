using Framework.Actions;
using Pages.DataLabs.DerivationManagement;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.DerivationManagement
{
    public class BP_DerivationRunWizardCriteriaUtilities
    {
        public static bool ClickNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_DerivationRunWizardCriteriaPage.NextButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectRunDerivationsCriteria(string CriteriaRadioOption)
        {
            try
            {
                return Control_ActionUtilities.Click(DL_DerivationRunWizardPage.DerivationCriteriaRadio(CriteriaRadioOption), string.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
