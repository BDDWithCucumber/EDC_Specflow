using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pages.DataLabs.Study.EditPreferences;
using Reports.DebugLog;
using Framework.Actions;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Study.EditPreferences
{
    public class BP_Study_EditPreferences_FormsUtilities
    {
        public static bool DefaultSaveOptionSelect(string DefaultSaveOption)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DL_Study_EditPreferences_FormsPage.DefaultSave, DefaultSaveOption, "Unable to Select the Default Save Option " + DefaultSaveOption + " in Forms tab under Edit Preferences");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
