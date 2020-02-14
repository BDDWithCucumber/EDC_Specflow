using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Main;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Main
{
    public class BP_Common_TopBar_Utilities
    {
        public static bool IsStudyNameExist(String studyLabel)
        {
            try
            {
                IControl studyLabelLink = DL_Common_TopBar.StudyLabelLink;
                String studyLabelValue = Control_PropertyUtilities.GetText(studyLabelLink);
                return studyLabel.Equals(studyLabelValue, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsTabAvailable(String mainTabName)
        {
            try
            {
                IControl mainTabHeader = DL_Common_TopBar.GetMainTabHeader(mainTabName);
                return !Control_PropertyUtilities.IsControlNull(mainTabHeader);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool InvokeAdvancedSearch()
        {
            try
            {
                IControl advancedSearchLink = DL_Common_TopBar.AdvanceSearchLink;
                return Control_ActionUtilities.Click(advancedSearchLink, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


    }
}