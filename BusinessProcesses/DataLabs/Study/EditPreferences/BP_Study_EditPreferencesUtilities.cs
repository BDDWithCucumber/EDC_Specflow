using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Study.EditPreferences;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Study.EditPreferences
{
    public class BP_Study_EditPreferencesUtilities
    {
        public static bool OpenTab(String tabHeaderText)
        {
            try
            {
                IControl tabHeader = DL_Study_EditPreferencesPage.GetTabHeader(tabHeaderText);
                if (!Control_PropertyUtilities.IsControlNull(tabHeader))
                {
                    return Control_ActionUtilities.Click(tabHeader, String.Empty);
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectButton(String ButtontoSelect)
        {
            string ButtonName = ButtontoSelect.ToUpper();
            try
            {
                switch (ButtonName)
                {
                    case "SAVE":
                        return Control_ActionUtilities.Click(DL_Study_EditPreferencesPage.SaveButtonEditPreferences, "Unable to Select the button " + ButtontoSelect);
                    case "CANCEL":
                        return Control_ActionUtilities.Click(DL_Study_EditPreferencesPage.CancelButtonEditPreferences, "Unable to Select the button " + ButtontoSelect);
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
    
}
