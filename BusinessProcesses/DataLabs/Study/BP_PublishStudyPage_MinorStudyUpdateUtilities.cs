using Framework.Actions;
using Pages.DataLabs.Study;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Study
{
    public class BP_PublishStudyPage_MinorStudyUpdateUtilities
    {
        public static bool SelectScriptingCheckboxToRun(String scriptingType)
        {
            try
            {
                if (!String.IsNullOrEmpty(scriptingType))
                {
                    if (scriptingType.Equals("pScripts", StringComparison.InvariantCultureIgnoreCase))
                    {
                        return Control_ActionUtilities.Click(DL_PublishStudyPage_MinorStudyUpdate.pScriptCheckbox, String.Empty);
                    }
                    else if (scriptingType.Equals("Derivations", StringComparison.InvariantCultureIgnoreCase))
                    {
                        return Control_ActionUtilities.Click(DL_PublishStudyPage_MinorStudyUpdate.DerivationsCheckbox, String.Empty);
                    }
                    else if (scriptingType.Equals("Queries", StringComparison.InvariantCultureIgnoreCase))
                    {
                        return Control_ActionUtilities.Click(DL_PublishStudyPage_MinorStudyUpdate.QueriesCheckbox, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickPublishButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_PublishStudyPage_MinorStudyUpdate.PublishButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CancelButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_PublishStudyPage_MinorStudyUpdate.CancellButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}